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
  RealVectorValue _velocity;
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
};
