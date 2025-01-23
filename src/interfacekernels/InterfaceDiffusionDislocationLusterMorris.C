// Brayan Murgas, Abigail Hunter, Darby J. Luscher
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

#include "InterfaceDiffusionDislocationLusterMorris.h"

#include "CrystalPlasticityOrowanStressUpdateBase.h"
#include "DiscoFluxCPOrowanStressUpdate.h"

registerMooseObject("discopanterApp", InterfaceDiffusionDislocationLusterMorris);

InputParameters
InterfaceDiffusionDislocationLusterMorris::validParams()
{
  InputParameters params = InterfaceKernel::validParams();
  params.addParam<Real>(
      "density_critical",
      1.0,
      "Critical density beyond which there will be dislocation transfer across Grain Boundary");
  params.addParam<Real>("tau_critical",
                        0.0,
                        "Critical resolved shear stres beyond which there will be dislocation "
                        "transfer across Grain Boundary");
  MooseEnum dislocation_character("edge screw", "edge");
  params.addRequiredParam<MooseEnum>(
      "dislocation_character", dislocation_character, "Character of dislocation");
  MooseEnum dislocation_sign("positive negative", "positive");
  params.addRequiredParam<MooseEnum>("dislocation_sign", dislocation_sign, "Sign of dislocation");
  MooseEnum dislocation_sign_neighbor("positive negative", "positive");
  params.addRequiredParam<MooseEnum>(
      "dislocation_sign_neighbor", dislocation_sign, "Sign of dislocation");
  params.addRequiredParam<int>("slip_system_index",
                               "Slip system index to get slip direction"
                               "FCC: 1 to 12.");
  params.addRequiredParam<int>("slip_system_index_neighbor",
                               "Slip system index to get slip direction of the neighbor"
                               "FCC: 1 to 12.");
  params.addParam<Real>("matrix_threshold",
                        0.8,
                        "Matrix transfer threshold to activate dislocation flux equivalency ");
  MooseEnum transfer_type("max single threshold", "max");
  params.addRequiredParam<MooseEnum>(
      "transfer_type",
      transfer_type,
      "Type of transfer used.  Max: Transfer to the slip system with higher "
      "matrix transfer coefficient.  Single: Transfer to the slip system "
      "defined in slip_system_index_neighbor. Threshold: Activates trasnfer "
      "for values of matrix transfer higher than the value matrix_threshold");
  params.addClassDescription(
      "The kernel is utilized to establish flux equivalence on an interface for dislocation"
      "assuming a divergence free velocity. This model uses the transfer parameter proposed"
      "by Luster-Morris in 1995: J. Luster and M.A. Morris, Compatibility of deformation in"
      "two-phase Ti-Al alloys: Dependence on microstructure and orientation relationships."
      "Metal. and Mat. Trans. A (1995), 26(7), pp. 1745-1756.");
  return params;
}

InterfaceDiffusionDislocationLusterMorris::InterfaceDiffusionDislocationLusterMorris(
    const InputParameters & parameters)
  : InterfaceKernel(parameters),
    _density_critical(getParam<Real>("density_critical")),
    _tau_critical(getParam<Real>("tau_critical")),
    _slip_system_index(getParam<int>("slip_system_index")),
    _slip_system_index_neighbor(getParam<int>("slip_system_index_neighbor")),
    _dislocationcharacter(
        getParam<MooseEnum>("dislocation_character").getEnum<DislocationCharacter>()),
    _dislocationsign(getParam<MooseEnum>("dislocation_sign").getEnum<DislocationSign>()),
    _dislocationsign_neighbor(
        getParam<MooseEnum>("dislocation_sign_neighbor").getEnum<DislocationSignNeighbor>()),
    _transfer(getParam<MooseEnum>("transfer_type").getEnum<TransferType>()),
    _matrix_threshold(getParam<Real>("matrix_threshold")),
    _dislo_velocity_CP_edge(getMaterialProperty<std::vector<Real>>("dislo_velocity_edge")),
    _dislo_velocity_CP_screw(getMaterialProperty<std::vector<Real>>("dislo_velocity_screw")),
    _slip_direction_edge(getMaterialProperty<std::vector<RealVectorValue>>("slip_direction_edge")),
    _slip_plane_normalboth(
        getMaterialProperty<std::vector<RealVectorValue>>("slip_plane_normalboth")),
    _slip_direction_edge_neighbor(
        getNeighborMaterialProperty<std::vector<RealVectorValue>>("slip_direction_edge")),
    _slip_plane_normalboth_neighbor(
        getNeighborMaterialProperty<std::vector<RealVectorValue>>("slip_plane_normalboth")),
    _tau(getMaterialProperty<std::vector<Real>>("applied_shear_stress")),
    _slip_resistance(getMaterialProperty<std::vector<Real>>("slip_resistance")) //,
{
}

Real
InterfaceDiffusionDislocationLusterMorris::computeQpResidual(Moose::DGResidualType type)
{
  Real r = 0;
  Real dislo_sign;
  Real disvelocity = 0;

  switch (_dislocationsign)
  {
    case DislocationSign::positive:
      dislo_sign = 1.0;
      break;
    case DislocationSign::negative:
      dislo_sign = -1.0;
      break;
  }

  switch (_dislocationcharacter)
  {
    case DislocationCharacter::edge:
      disvelocity = _dislo_velocity_CP_edge[_qp][_slip_system_index - 1];
      break;
    case DislocationCharacter::screw:
      disvelocity = _dislo_velocity_CP_screw[_qp][_slip_system_index - 1];
      break;
  }

  computeInterfaceAdvCoeff();

  if ((_neighbor_value[_qp] > 0.0) && (_u[_qp] > 0.0))
  {
    switch (type)
    {
      case Moose::Element:
        r -= _test[_i][_qp] * _dislo_transfer_amount * disvelocity * _u[_qp] * _normals[_qp] *
             _slip_direction_edge[_qp][_slip_system_index - 1] * dislo_sign;
        break;

      case Moose::Neighbor:
        r += _test_neighbor[_i][_qp] * _dislo_transfer_amount * disvelocity * _u[_qp] *
             _normals[_qp] * _slip_direction_edge[_qp][_slip_system_index - 1] * dislo_sign;
        break;
    }
  }

  return r;
}

Real
InterfaceDiffusionDislocationLusterMorris::computeQpJacobian(Moose::DGJacobianType type)
{
  Real jac = 0;
  Real dislo_sign;
  Real disvelocity = 0;

  switch (_dislocationsign)
  {
    case DislocationSign::positive:
      dislo_sign = 1.0;
      break;
    case DislocationSign::negative:
      dislo_sign = -1.0;
      break;
  }

  switch (_dislocationcharacter)
  {
    case DislocationCharacter::edge:
      disvelocity = _dislo_velocity_CP_edge[_qp][_slip_system_index - 1];
      break;
    case DislocationCharacter::screw:
      disvelocity = _dislo_velocity_CP_screw[_qp][_slip_system_index - 1];
      break;
  }

  computeInterfaceAdvCoeff();

  if ((_neighbor_value[_qp] > 0.0) && (_u[_qp] > 0.0))
  {
    switch (type)
    {
      case Moose::ElementElement:
      case Moose::NeighborNeighbor:
        break;

      case Moose::NeighborElement:
        jac += _test_neighbor[_i][_qp] * _dislo_transfer_amount * disvelocity * _phi[_j][_qp] *
               _normals[_qp] * _slip_direction_edge[_qp][_slip_system_index - 1] * dislo_sign;
        break;

      case Moose::ElementNeighbor:
        jac -= _test[_i][_qp] * _dislo_transfer_amount * disvelocity * _phi[_j][_qp] *
               _normals[_qp] * _slip_direction_edge[_qp][_slip_system_index - 1] * dislo_sign;
        break;
    }
  }

  return jac;
}

void
InterfaceDiffusionDislocationLusterMorris::computeInterfaceAdvCoeff()
{
  //  Real density_initial, density_critical_relative;
  std::vector<std::vector<Real>> S_GB, L_GB, M_mod_GB, M_mod_GB_Norm, N_GB, N_mod_GB;
  RealVectorValue l1, l2, _slip_direction_rotated, _slip_direction_edge_rotated,
      _slip_direction_rotated_neighbor, _slip_plane_normal_rotated,
      _slip_plane_normal_rotated_neighbor;
  Real dislo_sign, dislo_sign_neighbor, sum_abs_M;

  S_GB.resize(_number_slip_systems, std::vector<Real>(_number_slip_systems, 0.00));
  N_GB.resize(_number_slip_systems, std::vector<Real>(_number_slip_systems, 0.00));
  L_GB.resize(_number_slip_systems, std::vector<Real>(_number_slip_systems, 0.00));
  M_mod_GB.resize(_number_slip_systems, std::vector<Real>(_number_slip_systems, 0.00));
  M_mod_GB_Norm.resize(_number_slip_systems, std::vector<Real>(_number_slip_systems, 0.00));
  Interface_Adv_Coeff.resize(_number_slip_systems, 0.00);
  _dislo_transfer_amount = 0.0;

  switch (_dislocationsign)
  {
    case DislocationSign::positive:
      dislo_sign = 1.0;
      break;
    case DislocationSign::negative:
      dislo_sign = -1.0;
      break;
  }

  switch (_dislocationsign_neighbor)
  {
    case DislocationSignNeighbor::positive:
      dislo_sign_neighbor = 1.0;
      break;
    case DislocationSignNeighbor::negative:
      dislo_sign_neighbor = -1.0;
      break;
  }

  if ((_u[_qp] > _density_critical))
  {
    for (unsigned int i = 0; i < _number_slip_systems; i++)
    {
      _slip_plane_normal_rotated = _slip_plane_normalboth[_qp][i]; //*dislo_sign;
      // _slip_direction_rotated = _slip_direction_edge[_qp][i];

      l1 = _slip_plane_normal_rotated.cross(_normals[_qp]);
      l1 /= l1.norm();
      for (unsigned int j = 0; j < _number_slip_systems; j++)
      {
        // _slip_direction_rotated_neighbor = _slip_direction_edge_neighbor[_qp][j];
        _slip_plane_normal_rotated_neighbor =
            _slip_plane_normalboth_neighbor[_qp][j]; //*dislo_sign_neighbor;

        l2 = _slip_plane_normal_rotated_neighbor.cross(-_normals[_qp]);
        l2 /= l2.norm();
        L_GB[i][j] = std::abs(l1 * l2);
        // cosine between normals is taken as an absolute value because in some cases the angles
        // between normals can be >180 deg but still be positive
        N_GB[i][j] = std::abs(_slip_plane_normal_rotated * _slip_plane_normal_rotated_neighbor);
        switch (_dislocationcharacter)
        {
          case DislocationCharacter::edge:
            _slip_direction_rotated = _slip_direction_edge[_qp][i] * dislo_sign;
            _slip_direction_rotated_neighbor =
                _slip_direction_edge_neighbor[_qp][j] * dislo_sign_neighbor;
            break;
          case DislocationCharacter::screw:
            _slip_direction_rotated =
                _slip_plane_normalboth[_qp][i].cross(_slip_direction_edge[_qp][i]) * dislo_sign;
            _slip_direction_rotated_neighbor = _slip_plane_normalboth_neighbor[_qp][j].cross(
                                                   _slip_direction_edge_neighbor[_qp][j]) *
                                               dislo_sign_neighbor;
            break;
        }
        S_GB[i][j] = (_slip_direction_rotated * _slip_direction_rotated_neighbor);
        M_mod_GB[i][j] = N_GB[i][j] * S_GB[i][j];
      }
    }
    Real max_coeff = 0.00;
    sum_abs_M = 0.0;
    unsigned int index_max_coeff = 0;
    for (unsigned int j = 0; j < _number_slip_systems; j++)
    {
      Interface_Adv_Coeff[j] = M_mod_GB[_slip_system_index - 1][j];
      if (Interface_Adv_Coeff[j] > max_coeff)
      {
        index_max_coeff = j;
        max_coeff = Interface_Adv_Coeff[j];
      }
      sum_abs_M += std::abs(M_mod_GB[_slip_system_index - 1][j]);
    }

    switch (_transfer)
    {
      case TransferType::max:
        if ((_slip_system_index_neighbor - 1) == index_max_coeff)
          _dislo_transfer_amount = max_coeff / sum_abs_M;
        else
          _dislo_transfer_amount = 0.0;
        break;
      case TransferType::single:
        if (Interface_Adv_Coeff[_slip_system_index_neighbor - 1] > 0.0)
          _dislo_transfer_amount = Interface_Adv_Coeff[_slip_system_index_neighbor - 1] / sum_abs_M;
        else
          _dislo_transfer_amount = 0.0;
        break;
      case TransferType::threshold:
        if (Interface_Adv_Coeff[_slip_system_index_neighbor - 1] >= _matrix_threshold)
          _dislo_transfer_amount = Interface_Adv_Coeff[_slip_system_index_neighbor - 1] / sum_abs_M;
        else
          _dislo_transfer_amount = 0.0;
        break;
    }
  }
}
——