//* This file is part of the MOOSE framework
//* https://mooseframework.inl.gov
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "OutflowDislocationBC.h"
#include "Function.h"

registerMooseObject("discopanterApp", OutflowDislocationBC);

InputParameters
OutflowDislocationBC::validParams()
{
  InputParameters params = IntegratedBC::validParams();
  params.addClassDescription("Boundary conditions for outflow of dislocation density:"
                             "\n rho * velocity * normal, where rho is the dislocation density");
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

OutflowDislocationBC::OutflowDislocationBC(const InputParameters & parameters)
  : IntegratedBC(parameters),

    _dislocationcharacter(
        getParam<MooseEnum>("dislocation_character").getEnum<DislocationCharacter>()),
    _dislocationsign(getParam<MooseEnum>("dislocation_sign").getEnum<DislocationSign>()),
    _slip_system_index(getParam<int>("slip_system_index")),
    _dislo_velocity_CP_edge(getMaterialProperty<std::vector<Real>>("dislo_velocity_edge")),
    _dislo_velocity_CP_screw(getMaterialProperty<std::vector<Real>>("dislo_velocity_screw")),
    _slip_direction_edge(getMaterialProperty<std::vector<RealVectorValue>>("slip_direction_edge")),
    _slip_direction_screw(getMaterialProperty<std::vector<RealVectorValue>>("slip_direction_screw"))
{
}

Real
OutflowDislocationBC::computeQpResidual()
{
  Real dislo_sign;
  RealVectorValue _slip_direction_rotated(0.0, 0.0, 0.0);
  RealVectorValue disvelocity(0.0, 0.0, 0.0);
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
      _slip_direction_rotated = _slip_direction_edge[_qp][_slip_system_index - 1];
      for (unsigned int j = 0; j < LIBMESH_DIM; ++j)
      {
        disvelocity(j) = _slip_direction_rotated(j);
        disvelocity(j) *= _dislo_velocity_CP_edge[_qp][_slip_system_index - 1] * dislo_sign;
      }
      break;
    case DislocationCharacter::screw:
      _slip_direction_rotated = _slip_direction_screw[_qp][_slip_system_index - 1];
      for (unsigned int j = 0; j < LIBMESH_DIM; ++j)
      {
        disvelocity(j) = _slip_direction_rotated(j);
        disvelocity(j) *= _dislo_velocity_CP_screw[_qp][_slip_system_index - 1] * dislo_sign;
      }
      break;
  }

  if (disvelocity * _normals[_qp] > 0)
    return _test[_i][_qp] * _u[_qp] * disvelocity * _normals[_qp];
  return 0;
}

Real
OutflowDislocationBC::computeQpJacobian()
{
  Real dislo_sign;
  RealVectorValue _slip_direction_rotated(0.0, 0.0, 0.0);
  RealVectorValue disvelocity(0.0, 0.0, 0.0);
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
      _slip_direction_rotated = _slip_direction_edge[_qp][_slip_system_index - 1];
      for (unsigned int j = 0; j < LIBMESH_DIM; ++j)
      {
        disvelocity(j) = _slip_direction_rotated(j);
        disvelocity(j) *= _dislo_velocity_CP_edge[_qp][_slip_system_index - 1] * dislo_sign;
      }
      break;
    case DislocationCharacter::screw:
      _slip_direction_rotated = _slip_direction_screw[_qp][_slip_system_index - 1];
      for (unsigned int j = 0; j < LIBMESH_DIM; ++j)
      {
        disvelocity(j) = _slip_direction_rotated(j);
        disvelocity(j) *= _dislo_velocity_CP_screw[_qp][_slip_system_index - 1] * dislo_sign;
      }
      break;
  }

  if (disvelocity * _normals[_qp] > 0)
    return _test[_i][_qp] * _phi[_j][_qp] * disvelocity * _normals[_qp];
  return 0;
}
