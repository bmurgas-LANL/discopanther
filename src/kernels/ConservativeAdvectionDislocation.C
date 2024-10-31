// Brayan Murgas, Subhendu Chakraborty, Abigail Hunter, Darby J. Luscher
// Funding: LDRD project XX9A, XXNA
// Los Alamos, NM, USA
/*----------
© 2023. Triad National Security, LLC. All rights reserved.
This program was produced under U.S. Government contract 89233218CNA000001 for
Los Alamos National Laboratory (LANL), which is operated by Triad National Security, LLC
for the U.S. Department of Energy/National Nuclear Security Administration.
All rights in the program are reserved by Triad National Security, LLC, and the
U.S. Department of Energy/National Nuclear Security Administration.
The Government is granted for itself and others acting on its behalf a nonexclusive, paid-up,
irrevocable worldwide license in this material to reproduce, prepare. derivative works,
distribute copies to the public, perform publicly and display publicly, and to
permit others to do so.
------------*/

#include "ConservativeAdvectionDislocation.h"

registerMooseObject("discopanterApp", ConservativeAdvectionDislocation);

InputParameters
ConservativeAdvectionDislocation::validParams()
{
  InputParameters params = Kernel::validParams();
  params.addClassDescription(
      "Conservative form of $\\nabla \\cdot \\vec{v} u$ which in its weak "
      "form is given by: $(-\\nabla \\psi_i, \\vec{v} u)$. "
      "Velocity is defined as a material property computed in DiscoFluxCPStressUpdate");
  MooseEnum upwinding_type("none full", "none");
  params.addParam<MooseEnum>("upwinding_type",
                             upwinding_type,
                             "Type of upwinding used.  None: Typically results in overshoots and "
                             "undershoots, but numerical diffusion is minimized.  Full: Overshoots "
                             "and undershoots are avoided, but numerical diffusion is large");
  MooseEnum dislocation_character("edge screw", "edge");
  params.addRequiredParam<MooseEnum>(
      "dislocation_character", dislocation_character, "Character of dislocation");
  MooseEnum dislocation_sign("positive negative", "positive");
  params.addRequiredParam<MooseEnum>("dislocation_sign", dislocation_sign, "Sign of dislocation");
  params.addRequiredParam<int>("slip_system_index",
                               "Slip system index to get slip direction"
                               "FCC: 1 to 12.");
  return params;
}

ConservativeAdvectionDislocation::ConservativeAdvectionDislocation(
    const InputParameters & parameters)
  : Kernel(parameters),
    _dislocationcharacter(
        getParam<MooseEnum>("dislocation_character").getEnum<DislocationCharacter>()),
    _dislocationsign(getParam<MooseEnum>("dislocation_sign").getEnum<DislocationSign>()),
    _slip_direction_edge(getMaterialProperty<std::vector<RealVectorValue>>("slip_direction_edge")),
    _slip_plane_normalboth(
        getMaterialProperty<std::vector<RealVectorValue>>("slip_plane_normalboth")),
    _slip_system_index(getParam<int>("slip_system_index")),
    _dislo_velocity_CP_edge(getMaterialProperty<std::vector<Real>>("dislo_velocity_edge")),
    _dislo_velocity_CP_screw(getMaterialProperty<std::vector<Real>>("dislo_velocity_screw")),
    _upwinding(getParam<MooseEnum>("upwinding_type").getEnum<UpwindingType>()),
    _u_nodal(_var.dofValues()),
    _upwind_node(0),
    _dtotal_mass_out(0)
{
}

Real
ConservativeAdvectionDislocation::negSpeedQp() const
{
  Real dislo_sign;
  RealVectorValue _slip_direction_rotated;
  RealVectorValue disvelocity;

  switch (_dislocationsign)
  {
    case DislocationSign::positive:
      dislo_sign = 1.0;
      break;
    case DislocationSign::negative:
      dislo_sign = -1.0;
      break;
  }

  // disvelocity.assign(3, 0.0);

  // Find dislocation velocity based on slip systems index and dislocation character
  switch (_dislocationcharacter)
  {
    case DislocationCharacter::edge:
      _slip_direction_rotated = _slip_direction_edge[_qp][_slip_system_index - 1];
      for (unsigned int j = 0; j < LIBMESH_DIM; ++j)
      {
        disvelocity(j) = _slip_direction_rotated(j);
        disvelocity(j) *= _dislo_velocity_CP_edge[_qp][_slip_system_index - 1] * dislo_sign;
      }
      break;
    case DislocationCharacter::screw:
      _slip_direction_rotated = _slip_plane_normalboth[_qp][_slip_system_index - 1].cross(
          _slip_direction_edge[_qp][_slip_system_index - 1]);
      for (unsigned int j = 0; j < LIBMESH_DIM; ++j)
      {
        disvelocity(j) = _slip_direction_rotated(j);
        disvelocity(j) *= _dislo_velocity_CP_screw[_qp][_slip_system_index - 1] * dislo_sign;
      }
      break;
  }

  return -_grad_test[_i][_qp] * disvelocity;
}

Real
ConservativeAdvectionDislocation::computeQpResidual()
{
  // This is the no-upwinded version
  // It gets called via Kernel::computeResidual()
  // return negSpeedQp() * _u[_qp];
  // Check that dislocation density is positive
  // if it went below zero, it should not be further decreased
  if (_u[_qp] <= 0.0)
  {

    return 0.0;
  }
  else
  {

    return negSpeedQp() * _u[_qp];
  }
}

Real
ConservativeAdvectionDislocation::computeQpJacobian()
{
  // This is the no-upwinded version
  // It gets called via Kernel::computeJacobian()
  return negSpeedQp() * _phi[_j][_qp];
}

void
ConservativeAdvectionDislocation::computeResidual()
{
  switch (_upwinding)
  {
    case UpwindingType::none:
      Kernel::computeResidual();
      break;
    case UpwindingType::full:
      fullUpwind(JacRes::CALCULATE_RESIDUAL);
      break;
  }
}

void
ConservativeAdvectionDislocation::computeJacobian()
{
  switch (_upwinding)
  {
    case UpwindingType::none:
      Kernel::computeJacobian();
      break;
    case UpwindingType::full:
      fullUpwind(JacRes::CALCULATE_JACOBIAN);
      break;
  }
}

void
ConservativeAdvectionDislocation::fullUpwind(JacRes res_or_jac)
{
  // The number of nodes in the element
  const unsigned int num_nodes = _test.size();

  // Even if we are computing the Jacobian we still need to compute the outflow from each node to
  // see which nodes are upwind and which are downwind
  prepareVectorTag(_assembly, _var.number());

  if (res_or_jac == JacRes::CALCULATE_JACOBIAN)
    prepareMatrixTag(_assembly, _var.number(), _var.number());

  // Compute the outflux from each node and store in _local_re
  // If _local_re is positive at the node, mass (or whatever the Variable represents) is flowing out
  // of the node
  _upwind_node.resize(num_nodes);
  for (_i = 0; _i < num_nodes; ++_i)
  {
    for (_qp = 0; _qp < _qrule->n_points(); _qp++)
      _local_re(_i) += _JxW[_qp] * _coord[_qp] * negSpeedQp();
    _upwind_node[_i] = (_local_re(_i) >= 0.0);
  }

  // Variables used to ensure mass conservation
  Real total_mass_out = 0.0;
  Real total_in = 0.0;
  if (res_or_jac == JacRes::CALCULATE_JACOBIAN)
    _dtotal_mass_out.assign(num_nodes, 0.0);

  for (unsigned int n = 0; n < num_nodes; ++n)
  {
    if (_upwind_node[n])
    {
      if (res_or_jac == JacRes::CALCULATE_JACOBIAN)
      {
        if (_test.size() == _phi.size())
          /* u at node=n depends only on the u at node=n, by construction.  For
           * linear-lagrange variables, this means that Jacobian entries involving the derivative
           * will only be nonzero for derivatives wrt variable at node=n.  Hence the
           * (n, n) in the line below.  The above "if" statement catches other variable types
           * (eg constant monomials)
           */
          _local_ke(n, n) += _local_re(n);

        _dtotal_mass_out[n] += _local_ke(n, n);
      }
      _local_re(n) *= _u_nodal[n];
      total_mass_out += _local_re(n);
    }
    else                        // downwind node
      total_in -= _local_re(n); // note the -= means the result is positive
  }

  // Conserve mass over all phases by proportioning the total_mass_out mass to the inflow nodes,
  // weighted by their local_re values
  for (unsigned int n = 0; n < num_nodes; ++n)
  {
    if (!_upwind_node[n]) // downwind node
    {
      if (res_or_jac == JacRes::CALCULATE_JACOBIAN)
        for (_j = 0; _j < _phi.size(); _j++)
          _local_ke(n, _j) += _local_re(n) * _dtotal_mass_out[_j] / total_in;
      _local_re(n) *= total_mass_out / total_in;
    }
  }

  // Add the result to the residual and jacobian
  if (res_or_jac == JacRes::CALCULATE_RESIDUAL)
  {
    accumulateTaggedLocalResidual();

    if (_has_save_in)
    {
      Threads::spin_mutex::scoped_lock lock(Threads::spin_mtx);
      for (const auto & var : _save_in)
        var->sys().solution().add_vector(_local_re, var->dofIndices());
    }
  }

  if (res_or_jac == JacRes::CALCULATE_JACOBIAN)
  {
    accumulateTaggedLocalMatrix();

    if (_has_diag_save_in)
    {
      unsigned int rows = _local_ke.m();
      DenseVector<Number> diag(rows);
      for (unsigned int i = 0; i < rows; i++)
        diag(i) = _local_ke(i, i);

      Threads::spin_mutex::scoped_lock lock(Threads::spin_mtx);
      for (const auto & var : _diag_save_in)
        var->sys().solution().add_vector(diag, var->dofIndices());
    }
  }
}
