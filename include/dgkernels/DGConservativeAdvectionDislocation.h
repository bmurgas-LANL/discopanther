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

// DG upwinding for the advection of a coupled variable
// It is assumed that upwind scheme is always used
// Therefore, no need for a upwinding_type flag as in ConservativeAdvectionCoupled
// This kernel implements the term (on LHS):
// d(rho_coupled v)/dx if dislo_character = edge
// d(rho_coupled v)/dy if dislo_character = screw
// Upwind condition is calculated both on edge/screw dislocations
// in this element and on the neighbouring element
// The forward and backward motion of
// positive and negative GND is taken into account.

#pragma once

#include "DGKernel.h"

class DGConservativeAdvectionDislocation : public DGKernel
{
public:
  static InputParameters validParams();

  DGConservativeAdvectionDislocation(const InputParameters & parameters);

protected:
  virtual void getDislocationVelocity();
  virtual Real computeQpResidual(Moose::DGResidualType type) override;
  virtual Real computeQpJacobian(Moose::DGJacobianType type) override;

  /// advection velocity
  RealVectorValue _velocity;

  /// Dislocation character
  const enum class DislocationCharacter { edge, screw } _dislocationcharacter;

  /// Dislocation sign
  const enum class DislocationSign { positive, negative } _dislocationsign;

  /// Slip diection and normal
  const MaterialProperty<std::vector<RealVectorValue>> & _slip_direction_edge;
  const MaterialProperty<std::vector<RealVectorValue>> & _slip_plane_normalboth;

  /// Slip system index used to get slip direction
  const unsigned int _slip_system_index;

  /// Dislocation velocities
  const MaterialProperty<std::vector<Real>> & _dislo_velocity_CP_edge;
  const MaterialProperty<std::vector<Real>> & _dislo_velocity_CP_screw;
};