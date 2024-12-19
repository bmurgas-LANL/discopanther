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

#include "InterfaceKernel.h"
#include "Material.h"

/**
 * DG kernel for interfacing diffusion between two variables on adjacent blocks
 */
class InterfaceDiffusionDislocationConstVel : public InterfaceKernel
{
public:
  static InputParameters validParams();

  InterfaceDiffusionDislocationConstVel(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual(Moose::DGResidualType type) override;
  virtual Real computeQpJacobian(Moose::DGJacobianType type) override;

  const Real _density_critical;
  const Real _tau_critical;

  /// Slip system index used to get slip direction
  const unsigned int _slip_system_index;
  const unsigned int _slip_system_index_neighbor;

  /// Dislocation character
  const enum class DislocationCharacter { edge, screw } _dislocationcharacter;
  /// Dislocation sign
  const enum class DislocationSign { positive, negative } _dislocationsign;

  const enum class TransferType { max, single, threshold } _transfer;

  const Real _matrix_threshold;

  const Real _factor_neighbor;

  // dislocation velocities
  const MaterialProperty<Real> * const _dislo_velocity;

  // slip direction and normal element
  const MaterialProperty<std::vector<RealVectorValue>> & _slip_direction_edge;
  const MaterialProperty<std::vector<RealVectorValue>> & _slip_plane_normalboth;

  // slip direction and normal neighbor
  const MaterialProperty<std::vector<RealVectorValue>> & _slip_direction_edge_neighbor;
  const MaterialProperty<std::vector<RealVectorValue>> & _slip_plane_normalboth_neighbor;

  /// Resolved shear stress on each slip system
  const MaterialProperty<std::vector<Real>> & _tau;
  const MaterialProperty<std::vector<Real>> & _slip_resistance;

  unsigned int _number_slip_systems = 12;

  Real _dislo_transfer_amount = 0.0;

  std::vector<Real> Interface_Adv_Coeff;

  virtual void computeInterfaceAdvCoeff();
};
