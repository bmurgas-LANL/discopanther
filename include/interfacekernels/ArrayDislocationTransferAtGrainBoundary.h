// Subhendu Chakraborty, Abigail Hunter, Darby J. Luscher
// Funding: LDRD project XX9A, XXNA
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

/**
 * DG kernel for interfacing diffusion between two variables on adjacent blocks
 */
class ArrayDislocationTransferAtGrainBoundary : public InterfaceKernel
{
public:
  static InputParameters validParams();

  ArrayDislocationTransferAtGrainBoundary(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual(Moose::DGResidualType type) override;
  virtual Real computeQpJacobian(Moose::DGJacobianType type) override;

  virtual void computeInterfaceAdvCoeff();

  // unsigned int _index_variable;
  // unsigned int _index_neighbor_var;

  // RealVectorValue _V, _V_neighbor;
  Real _density_critical, _tau_critical, _scale_factor;
  unsigned int _number_slip_systems = 12;
  bool printedTransferMatrix = false;
  bool _is_dislocation_transfer_positive = false, isResidual = false;
  // const ArrayVariableValue & _u_Old;

  RealVectorValue velocity, velocity_neighbor;

  std::vector<std::vector<Real>> Interface_Adv_Coeff;
  std::vector<int> _index_outgoingslip;
  std::vector<Real> _discl_transfer_amount;

  const MaterialProperty<std::vector<Real>> & _dislo_velocity_CP;

  // Dislocation character
  const enum class DislocationCharacter { edge, screw } _dislocationcharacter;
  // Dislocation sign
  const enum class DislocationSign { positive, negative } _dislocationsign;

  const unsigned int _slip_system_index;
  const unsigned int _slip_system_index_neighbor;

  const MaterialProperty<std::vector<RealVectorValue>> & _slip_direction_edge;
  const MaterialProperty<std::vector<RealVectorValue>> & _slip_plane_normalboth;

  const MaterialProperty<std::vector<RealVectorValue>> & _slip_direction_edge_neighbor;
  const MaterialProperty<std::vector<RealVectorValue>> & _slip_plane_normalboth_neighbor;

  /// Resolved shear stress on each slip system
  const MaterialProperty<std::vector<Real>> & _tau;
  const MaterialProperty<std::vector<Real>> & _slip_resistance;
};
