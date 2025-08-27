//* This file is part of the MOOSE framework
//* https://mooseframework.inl.gov
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "IntegratedBC.h"

class OutflowDislocationBC : public IntegratedBC
{
public:
  static InputParameters validParams();

  OutflowDislocationBC(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();

  /// Dislocation character
  const enum class DislocationCharacter { edge, screw } _dislocationcharacter;
  /// Dislocation sign
  const enum class DislocationSign { positive, negative } _dislocationsign;
  /// Slip system index used to get slip direction
  const unsigned int _slip_system_index;
  // dislocation velocities
  const MaterialProperty<std::vector<Real>> & _dislo_velocity_CP_edge;
  const MaterialProperty<std::vector<Real>> & _dislo_velocity_CP_screw;
  // slip direction and normal element
  const MaterialProperty<std::vector<RealVectorValue>> & _slip_direction_edge;
  const MaterialProperty<std::vector<RealVectorValue>> & _slip_direction_screw;
};
