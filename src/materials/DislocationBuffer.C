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
#include "DislocationBuffer.h"

registerMooseObject("discopanterApp", DislocationBuffer);

InputParameters
DislocationBuffer::validParams()
{
  InputParameters params = Material::validParams();
  params.addParam<std::vector<Real>>("scale_factor", "Scaling factor");
  return params;
}

DislocationBuffer::DislocationBuffer(const InputParameters & parameters)
  : Material(parameters), _scale_factor(getParam<Real>("scale_factor")) //,
// _diffusivity(declareProperty<Real>("diffusivity")),

{
}

// void
// DislocationBuffer::computeQpProperties()
// {
//   // Diffusivity is the value of the interpolated piece-wise function described by the user
//   _diffusivity[_qp] = 1.0;
//   //
// }