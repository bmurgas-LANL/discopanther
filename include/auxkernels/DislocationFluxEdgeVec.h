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

#pragma once

#include "AuxKernel.h"

/**
 * Auxiliary kernel responsible for computing the Darcy velocity (discharge per unit area) vector
 * given permeability, viscosity, and the pressure gradient of the medium.
 */
class DislocationFluxEdgeVec : public VectorAuxKernel
{
public:
  static InputParameters validParams();

  DislocationFluxEdgeVec(const InputParameters & parameters);

protected:
  /// AuxKernels MUST override computeValue(), which is called on every Gauss QP for elemental
  /// AuxVariables. For nodal AuxVariables, it is called on every node instead and the _qp index
  /// automatically refers to those nodes.
  virtual RealVectorValue computeValue() override;

  const VariableValue & _dislocation_density;

  // dislocation velocities
  const MaterialProperty<std::vector<Real>> & _dislo_velocity_CP_edge;
  // slip direction and normal element
  const MaterialProperty<std::vector<RealVectorValue>> & _slip_direction_edge;
  /// Slip system index used to get slip direction
  const unsigned int _slip_system_index;
  /// Dislocation character
  const enum class DislocationCharacter { edge, screw } _dislocationcharacter;
  /// Dislocation sign
  const enum class DislocationSign { positive, negative } _dislocationsign;
};
