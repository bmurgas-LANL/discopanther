// Murtaza Bookwala, Brayan Murgas, Subhendu Chakraborty, Abigail Hunter, Darby J. Luscher
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

#include "Kernel.h"

class DislocationSourceVolume : public Kernel
{
public:
  static InputParameters validParams();

  DislocationSourceVolume(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  // void computeDisloVelocity();

  const Real _dislo_density_factor_CDT;
  const Real _C_multi, _C_trap, _C_m_ann, _C_im_ann, _dd_sat, _burgers_vector_mag;

  const MaterialProperty<std::vector<Real>> & _dislo_velocity_CP_edge;
  const MaterialProperty<std::vector<Real>> & _dislo_velocity_CP_screw;
  const MaterialProperty<std::vector<RealVectorValue>> & _slip_direction_edge;
  const MaterialProperty<std::vector<RealVectorValue>> & _slip_plane_normalboth;

  // Dislocation character
  const enum class DislocationCharacter { edge, screw } _dislocationcharacter;
  // Dislocation sign
  const enum class DislocationSign { positive, negative } _dislocationsign;

  const MaterialProperty<std::vector<Real>> & _dislocation_mobile_edge;
  const MaterialProperty<std::vector<Real>> & _dislocation_mobile_screw;
  const MaterialProperty<std::vector<Real>> & _dislocation_immobile;
  const MaterialProperty<std::vector<Real>> & _dislocation_immobile_edge_negative;
  const MaterialProperty<std::vector<Real>> & _dislocation_immobile_screw_positive;
  const MaterialProperty<std::vector<Real>> & _dislocation_immobile_screw_negative;
  // const MaterialProperty<std::vector<Real>> & _slip_rate;

  const unsigned int _slip_system_index;
  Real _dt;
};
