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

#include "DislocationFluxEdgeVec.h"

registerMooseObject("discopanterApp", DislocationFluxEdgeVec);

InputParameters
DislocationFluxEdgeVec::validParams()
{
  InputParameters params = VectorAuxKernel::validParams();
  params.addClassDescription("Compute dislocation flux $\\vec{J} = \\rho v \\vec{d}$");

  // Add a "coupling paramater" to get a variable from the input file.
  params.addRequiredCoupledVar("dislocation", "Dislocation density.");

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

DislocationFluxEdgeVec::DislocationFluxEdgeVec(const InputParameters & parameters)
  : VectorAuxKernel(parameters),

    // Get the gradient of the variable
    _dislocation_density(coupledValue("dislocation")),
    _dislo_velocity_CP_edge(getMaterialProperty<std::vector<Real>>("dislo_velocity_edge")),
    _slip_direction_edge(getMaterialProperty<std::vector<RealVectorValue>>("slip_direction_edge")),
    _slip_system_index(getParam<int>("slip_system_index")),
    _dislocationcharacter(
        getParam<MooseEnum>("dislocation_character").getEnum<DislocationCharacter>()),
    _dislocationsign(getParam<MooseEnum>("dislocation_sign").getEnum<DislocationSign>())
{
}

RealVectorValue
DislocationFluxEdgeVec::computeValue()
{
  RealVectorValue _slip_direction;

  switch (_dislocationsign)
  {
    case DislocationSign::positive:
      _slip_direction = _slip_direction_edge[_qp][_slip_system_index - 1];
      break;
    case DislocationSign::negative:
      _slip_direction = -1.0 * _slip_direction_edge[_qp][_slip_system_index - 1];
      break;
  }
  return _dislocation_density[_qp] * _dislo_velocity_CP_edge[_qp][_slip_system_index - 1] *
         _slip_direction;
}
