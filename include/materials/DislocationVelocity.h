// This file is part of the MOOSE framework
// https://mooseframework.inl.gov
//
// All rights reserved, see COPYRIGHT for full restrictions
// https://github.com/idaholab/moose/blob/master/COPYRIGHT
//
// Licensed under LGPL 2.1, please see LICENSE for details
// https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

// #include "InterfaceMaterial.h"
#include "Material.h"

// class DislocationVelocity : public InterfaceMaterial
class DislocationVelocity : public Material
{
public:
  DislocationVelocity(const InputParameters & parameters);

  static InputParameters validParams();

protected:
  virtual void computeQpProperties() override;
  // virtual void subdomainSetup() override;

private:
  /// member variable to hold the computed diffusivity coefficient
  const Real _burgers_vector_mag;
  const Real _mu;
  const Real _g0;
  const Real _q1, _q2, _B0, _B0s, _vs_edge, _vs_screw, _omega0, _temp, _boltz;
  bool _mean_free_path_init_flag;
  Real _L_bar_e, _L_bar_s;
  const unsigned int _number_slip_systems;
  MaterialProperty<std::vector<Real>> & _dislo_velocity_edge;
  MaterialProperty<std::vector<Real>> & _dislo_velocity_screw;
  std::vector<Real> t_wait, t_run, vel_run, dislocation_density, tau_b, xi0, tau_eff, tau_effAbs,
      tau_effSign, slip_r;
  const MaterialProperty<std::vector<Real>> & _slip_resistance;
  const MaterialProperty<std::vector<Real>> & _tau_b;
  const MaterialProperty<std::vector<Real>> & _tau;

  Real small2 = 1.0e-5;
};