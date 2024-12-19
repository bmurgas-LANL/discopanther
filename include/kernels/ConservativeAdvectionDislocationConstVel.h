// Brayan Murgas, Subhendu Chakraborty, Abigail Hunter, Darby J. Luscher
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

#include "Kernel.h"

/**
 * Advection of the variable by the velocity provided by the user.
 * Options for numerical stabilization are: none; full upwinding
 */
class ConservativeAdvectionDislocationConstVel : public Kernel
{
public:
  static InputParameters validParams();

  ConservativeAdvectionDislocationConstVel(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual void computeResidual() override;
  virtual void computeJacobian() override;

  /// enum to make the code clearer
  enum class JacRes
  {
    CALCULATE_RESIDUAL = 0,
    CALCULATE_JACOBIAN = 1
  };

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
  const MaterialProperty<Real> * const _dislo_velocity;

  /// Type of upwinding
  const enum class UpwindingType { none, full } _upwinding;

  /// Nodal value of u, used for full upwinding
  const VariableValue & _u_nodal;

  /// In the full-upwind scheme, whether a node is an upwind node
  std::vector<bool> _upwind_node;

  /// In the full-upwind scheme d(total_mass_out)/d(variable_at_node_i)
  std::vector<Real> _dtotal_mass_out;

  /// Returns - _grad_test * velocity
  Real negSpeedQp() const;

  /// Calculates the fully-upwind Residual and Jacobian (depending on res_or_jac)
  void fullUpwind(JacRes res_or_jac);
};
