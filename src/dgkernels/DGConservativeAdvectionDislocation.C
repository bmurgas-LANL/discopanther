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

#include "DGConservativeAdvectionDislocation.h"

registerMooseObject("discopanterApp", DGConservativeAdvectionDislocation);

InputParameters
DGConservativeAdvectionDislocation::validParams()
{
  InputParameters params = DGKernel::validParams();
  params.addClassDescription("DG upwinding for the advection of a dislocation density. "
                             "Upwind condition is calculated both on edge/screw dislocations "
                             "in this element and on the neighbouring element. ");
  params.addRequiredParam<int>("slip_system_index",
                               "Slip system index to get slip direction"
                               "FCC: 1 to 12.");
  MooseEnum dislocation_sign("positive negative", "positive");
  params.addRequiredParam<MooseEnum>("dislocation_sign", dislocation_sign, "Sign of dislocation");
  MooseEnum dislocation_character("edge screw", "edge");
  params.addRequiredParam<MooseEnum>(
      "dislocation_character", dislocation_character, "Character of dislocation");
  return params;
}

DGConservativeAdvectionDislocation::DGConservativeAdvectionDislocation(
    const InputParameters & parameters)
  : DGKernel(parameters),
    _dislocationcharacter(
        getParam<MooseEnum>("dislocation_character").getEnum<DislocationCharacter>()),
    _dislocationsign(getParam<MooseEnum>("dislocation_sign").getEnum<DislocationSign>()),
    _slip_direction_edge(getMaterialProperty<std::vector<RealVectorValue>>("slip_direction_edge")),
    _slip_plane_normalboth(
        getMaterialProperty<std::vector<RealVectorValue>>("slip_plane_normalboth")),
    _slip_system_index(getParam<int>("slip_system_index")),
    _dislo_velocity_CP_edge(getMaterialProperty<std::vector<Real>>("dislo_velocity_edge")),
    _dislo_velocity_CP_screw(getMaterialProperty<std::vector<Real>>("dislo_velocity_screw"))
{
}

// read dislocation velocity from material object
// and store in _velocity
void
DGConservativeAdvectionDislocation::getDislocationVelocity()
{

  Real dislo_sign;
  RealVectorValue _slip_direction_rotated;

  switch (_dislocationsign)
  {
    case DislocationSign::positive:
      dislo_sign = 1.0;
      break;
    case DislocationSign::negative:
      dislo_sign = -1.0;
      break;
  }

  // Find dislocation velocity based on slip systems index and dislocation character
  switch (_dislocationcharacter)
  {
    case DislocationCharacter::edge:
      _slip_direction_rotated = _slip_direction_edge[_qp][_slip_system_index - 1];
      for (unsigned int j = 0; j < LIBMESH_DIM; ++j)
      {
        _velocity(j) = _slip_direction_rotated(j);
        _velocity(j) *= _dislo_velocity_CP_edge[_qp][_slip_system_index - 1] * dislo_sign;
      }
      break;
    case DislocationCharacter::screw:
      _slip_direction_rotated = _slip_plane_normalboth[_qp][_slip_system_index - 1].cross(
          _slip_direction_edge[_qp][_slip_system_index - 1]);
      for (unsigned int j = 0; j < LIBMESH_DIM; ++j)
      {
        _velocity(j) = _slip_direction_rotated(j);
        _velocity(j) *= _dislo_velocity_CP_screw[_qp][_slip_system_index - 1] * dislo_sign;
      }
      break;
  }
}

Real
DGConservativeAdvectionDislocation::computeQpResidual(Moose::DGResidualType type)
{
  Real r = 0; // output residual

  getDislocationVelocity();

  Real vdotn = _velocity * _normals[_qp];
  Real u_vdotn = vdotn * _u[_qp];
  Real neigh_u_vdotn = vdotn * _u_neighbor[_qp];

  switch (type)
  {
    case Moose::Element:

      if (u_vdotn >= 0)
        r += u_vdotn * _test[_i][_qp];

      if (neigh_u_vdotn < 0)
        r += neigh_u_vdotn * _test[_i][_qp];

      break;

    case Moose::Neighbor:

      if (u_vdotn >= 0)
        r -= u_vdotn * _test_neighbor[_i][_qp];

      if (neigh_u_vdotn < 0)
        r -= neigh_u_vdotn * _test_neighbor[_i][_qp];

      break;
  }

  return r;
}

Real
DGConservativeAdvectionDislocation::computeQpJacobian(Moose::DGJacobianType type)
{
  Real r = 0;
  Real vdotn;
  Real u_vdotn;

  getDislocationVelocity();

  vdotn = _velocity * _normals[_qp];
  u_vdotn = vdotn * _u[_qp];

  switch (type)
  {
    case Moose::ElementElement:
      if (u_vdotn >= 0)
        r += vdotn * _phi[_j][_qp] * _test[_i][_qp];
      break;

    case Moose::ElementNeighbor:
      if (u_vdotn < 0)
        r += vdotn * _phi_neighbor[_j][_qp] * _test[_i][_qp];
      break;

    case Moose::NeighborElement:
      if (u_vdotn >= 0)
        r -= vdotn * _phi[_j][_qp] * _test_neighbor[_i][_qp];
      break;

    case Moose::NeighborNeighbor:
      if (u_vdotn < 0)
        r -= vdotn * _phi_neighbor[_j][_qp] * _test_neighbor[_i][_qp];
      break;
  }

  return r;
}