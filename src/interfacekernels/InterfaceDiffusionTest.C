//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "InterfaceDiffusionTest.h"
#include "SystemBase.h"
#include "CrystalPlasticityOrowanStressUpdateBase.h"
#include "DiscoFluxCPOrowanStressUpdate.h"

registerMooseObject("discopanterApp", InterfaceDiffusionTest);

InputParameters
InterfaceDiffusionTest::validParams()
{
  InputParameters params = InterfaceKernel::validParams();
  params.addParam<MaterialPropertyName>("D", "D", "The diffusion coefficient.");
  params.addParam<MaterialPropertyName>(
      "D_neighbor", "D_neighbor", "The neighboring diffusion coefficient.");
  params.addClassDescription(
      "The kernel is utilized to establish flux equivalence on an interface for variables.");
  return params;
}

InterfaceDiffusionTest::InterfaceDiffusionTest(const InputParameters & parameters)
  : InterfaceKernel(parameters),
    _D(getMaterialProperty<Real>("D")),
    _D_neighbor(getNeighborMaterialProperty<Real>("D_neighbor")),
    _slip_direction_edge(getMaterialProperty<std::vector<RealVectorValue>>("slip_direction_edge")),
    _slip_plane_normalboth(
        getMaterialProperty<std::vector<RealVectorValue>>("slip_plane_normalboth")),
    _slip_resistance(getMaterialProperty<std::vector<Real>>("slip_resistance"))
{
}

Real
InterfaceDiffusionTest::computeQpResidual(Moose::DGResidualType type)
{
  Real r = 0;

  switch (type)
  {
    case Moose::Element:
      r = _test[_i][_qp] * -_D_neighbor[_qp] * _grad_neighbor_value[_qp] * _normals[_qp];
      break;

    case Moose::Neighbor:
      r = _test_neighbor[_i][_qp] * _D[_qp] * _grad_u[_qp] * _normals[_qp];
      break;
  }

  return r;
}

Real
InterfaceDiffusionTest::computeQpJacobian(Moose::DGJacobianType type)
{
  Real jac = 0;

  switch (type)
  {
    case Moose::ElementElement:
    case Moose::NeighborNeighbor:
      break;

    case Moose::NeighborElement:
      jac = _test_neighbor[_i][_qp] * _D[_qp] * _grad_phi[_j][_qp] * _normals[_qp];
      break;

    case Moose::ElementNeighbor:
      jac = _test[_i][_qp] * -_D_neighbor[_qp] * _grad_phi_neighbor[_j][_qp] * _normals[_qp];
      break;
  }

  return jac;
}
