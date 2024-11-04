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

#include "InterfaceDiffusionDislocation.h"

#include "CrystalPlasticityOrowanStressUpdateBase.h"
#include "DiscoFluxCPOrowanStressUpdate.h"

registerMooseObject("discopanterApp", InterfaceDiffusionDislocation);

InputParameters
InterfaceDiffusionDislocation::validParams()
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
  params.addParam<MooseEnum>(
      "dislocation_character", dislocation_character, "Character of dislocation");
  MooseEnum dislocation_sign("positive negative", "positive");
  params.addParam<MooseEnum>("dislocation_sign", dislocation_sign, "Sign of dislocation");
  params.addRequiredParam<int>("slip_system_index",
                               "Slip system index to get slip direction"
                               "FCC: 1 to 12.");
  params.addRequiredParam<int>("slip_system_index_neighbor",
                               "Slip system index to get slip direction of the neighbor"
                               "FCC: 1 to 12.");
  params.addClassDescription(
      "The kernel is utilized to establish flux equivalence on an interface for dislocation"
      "assuming a divergence free velocity.");
  return params;
}

InterfaceDiffusionDislocation::InterfaceDiffusionDislocation(const InputParameters & parameters)
  : InterfaceKernel(parameters),
    _density_critical(getParam<Real>("density_critical")),
    _tau_critical(getParam<Real>("tau_critical")),
    _slip_system_index(getParam<int>("slip_system_index")),
    _slip_system_index_neighbor(getParam<int>("slip_system_index_neighbor")),
    _dislocationcharacter(
        getParam<MooseEnum>("dislocation_character").getEnum<DislocationCharacter>()),
    _dislocationsign(getParam<MooseEnum>("dislocation_sign").getEnum<DislocationSign>()),
    _dislo_velocity_CP_edge(getMaterialProperty<std::vector<Real>>("dislo_velocity_edge")),
    _dislo_velocity_CP_edge_neighbor(
        getNeighborMaterialProperty<std::vector<Real>>("dislo_velocity_edge")),
    _slip_direction_edge(getMaterialProperty<std::vector<RealVectorValue>>("slip_direction_edge")),
    _slip_plane_normalboth(
        getMaterialProperty<std::vector<RealVectorValue>>("slip_plane_normalboth")),
    _slip_direction_edge_neighbor(
        getNeighborMaterialProperty<std::vector<RealVectorValue>>("slip_direction_edge")),
    _slip_plane_normalboth_neighbor(
        getNeighborMaterialProperty<std::vector<RealVectorValue>>("slip_plane_normalboth")),
    _tau(getMaterialProperty<std::vector<Real>>("applied_shear_stress")),
    _slip_resistance(getMaterialProperty<std::vector<Real>>("slip_resistance"))
{
}

Real
InterfaceDiffusionDislocation::computeQpResidual(Moose::DGResidualType type)
{
  Real r = 0;

  _dislo_transfer_amount = 1.0;
  computeInterfaceAdvCoeff();

  switch (type)
  {
    case Moose::Element:
      r = _test[_i][_qp] * -_dislo_transfer_amount *
          _dislo_velocity_CP_edge_neighbor[_qp][_slip_system_index_neighbor - 1] *
          _neighbor_value[_qp] * _normals[_qp] *
          _slip_direction_edge_neighbor[_qp][_slip_system_index_neighbor - 1];
      break;

    case Moose::Neighbor:
      r = _test_neighbor[_i][_qp] * _dislo_velocity_CP_edge[_qp][_slip_system_index - 1] * _u[_qp] *
          _normals[_qp] * _slip_direction_edge[_qp][_slip_system_index - 1];
      break;
  }

  return r;
}

Real
InterfaceDiffusionDislocation::computeQpJacobian(Moose::DGJacobianType type)
{
  Real jac = 0;

  _dislo_transfer_amount = 1.0;
  computeInterfaceAdvCoeff();

  switch (type)
  {
    case Moose::ElementElement:
    case Moose::NeighborNeighbor:
      break;

    case Moose::NeighborElement:
      jac = _test_neighbor[_i][_qp] * _dislo_velocity_CP_edge[_qp][_slip_system_index - 1] *
            _phi[_j][_qp] * _normals[_qp] * _slip_direction_edge[_qp][_slip_system_index - 1];
      break;

    case Moose::ElementNeighbor:
      jac = _test[_i][_qp] * -_dislo_transfer_amount *
            _dislo_velocity_CP_edge_neighbor[_qp][_slip_system_index_neighbor - 1] *
            _phi_neighbor[_j][_qp] * _normals[_qp] *
            _slip_direction_edge_neighbor[_qp][_slip_system_index_neighbor - 1];
      break;
  }

  return jac;
}

void
InterfaceDiffusionDislocation::computeInterfaceAdvCoeff()
{
  //  Real density_initial, density_critical_relative;
  std::vector<std::vector<Real>> S_GB, L_GB, M_mod_GB, M_mod_GB_Norm, N_GB, N_mod_GB;
  RealVectorValue l1, l2, _slip_direction_rotated, _slip_direction_edge_rotated,
      _slip_direction_rotated_neighbor, _slip_plane_normal_rotated,
      _slip_plane_normal_rotated_neighbor;

  S_GB.resize(_number_slip_systems, std::vector<Real>(_number_slip_systems, 0.00));
  N_GB.resize(_number_slip_systems, std::vector<Real>(_number_slip_systems, 0.00));
  L_GB.resize(_number_slip_systems, std::vector<Real>(_number_slip_systems, 0.00));
  M_mod_GB.resize(_number_slip_systems, std::vector<Real>(_number_slip_systems, 0.00));
  M_mod_GB_Norm.resize(_number_slip_systems, std::vector<Real>(_number_slip_systems, 0.00));
  Interface_Adv_Coeff.resize(_number_slip_systems, std::vector<Real>(_number_slip_systems, 0.00));
  _dislo_transfer_amount = 0.0;

  // density_initial = 1.00;
  // density_critical_relative = density_initial + (_density_critical - density_initial) *
  // (Interface_Adv_Coeff[i][index_max_coeff] - 1.0)/(0.5 - 1.0); if((_u[_qp] > _density_critical)
  // && std::abs(_tau[_qp][_slip_system_index - 1])>_tau_critical)
  if ((_u[_qp] > _density_critical))
  {
    for (unsigned int i = 0; i < _number_slip_systems; i++)
    {
      _slip_plane_normal_rotated = _slip_plane_normalboth[_qp][i];
      _dislo_transfer_amount = 0.00;
      _slip_direction_rotated = _slip_direction_edge[_qp][i];

      l1 = _slip_plane_normal_rotated.cross(_normals[_qp]);
      l1 /= l1.norm();
      for (unsigned int j = 0; j < _number_slip_systems; j++)
      {
        _slip_direction_rotated_neighbor = _slip_direction_edge_neighbor[_qp][j];
        _slip_plane_normal_rotated_neighbor = _slip_plane_normalboth_neighbor[_qp][j];

        l2 = _slip_plane_normal_rotated_neighbor.cross(-_normals[_qp]);
        l2 /= l2.norm();
        L_GB[i][j] = std::abs(l1 * l2);
        N_GB[i][j] = (_slip_plane_normal_rotated * _slip_plane_normal_rotated_neighbor);
        S_GB[i][j] = (_slip_direction_rotated * _slip_direction_rotated_neighbor);
        M_mod_GB[i][j] = (L_GB[i][j] * N_GB[i][j] * S_GB[i][j]);
      }
    }
    Real max_coeff = 0.00;
    unsigned int index_max_coeff = 0;
    for (unsigned int j = 0; j < _number_slip_systems; j++)
    {
      Interface_Adv_Coeff[_slip_system_index - 1][j] = M_mod_GB[_slip_system_index - 1][j];
      if (Interface_Adv_Coeff[_slip_system_index - 1][j] >
          max_coeff) // && N_GB[i][j]>0.00 // check for transfer between opposite sign
      {
        index_max_coeff = j;
        max_coeff = Interface_Adv_Coeff[_slip_system_index - 1][j];
      }
    }

    _slip_direction_rotated = _slip_direction_edge[_qp][_slip_system_index - 1];
    switch (_dislocationsign)
    {
      case DislocationSign::negative:
        _slip_direction_rotated *= (-1);
        break;
      case DislocationSign::positive:
        break;
    }
    // velocity = _dislo_velocity_CP_edge[_qp][i] * _slip_direction_rotated;

    if ((_slip_system_index_neighbor - 1) == index_max_coeff)
      _dislo_transfer_amount = max_coeff;
    else
      _dislo_transfer_amount = 0.0;
  }
}