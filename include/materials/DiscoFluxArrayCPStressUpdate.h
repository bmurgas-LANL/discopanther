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

#include "CrystalPlasticityStressUpdateBase.h"

class DiscoFluxArrayCPStressUpdate;

class DiscoFluxArrayCPStressUpdate : public CrystalPlasticityStressUpdateBase
{
public:
  static InputParameters validParams();

  DiscoFluxArrayCPStressUpdate(const InputParameters & parameters);

protected:
  // initializes the stateful properties
  virtual void initQpStatefulProperties() override;

  virtual void setInitialConstitutiveVariableValues() override;

  virtual void setSubstepConstitutiveVariableValues() override;

  /**
   * Stores the current value of the slip system resistance into a separate
   * material property in case substepping is needed.
   */
  virtual void updateSubstepConstitutiveVariableValues() override;

  virtual bool calculateSlipRate() override;

  virtual void calculateConstitutiveSlipDerivative(std::vector<Real> & dslip_dtau) override;

  // Cache the slip system value before the update for the diff in the convergence check
  virtual void cacheStateVariablesBeforeUpdate() override;

  /**
   * Following the Constitutive model for slip system resistance as given in:
   */
  virtual void calculateStateVariableEvolutionRateComponent() override;

  /*
   * Finalizes the values of the state variables and slip system resistance
   * for the current timestep after convergence has been reached.
   */
  virtual bool updateStateVariables() override;

  /*
   * Determines if the state variables, e.g. defect densities, have converged
   * by comparing the change in the values over the iteration period.
   */
  virtual bool areConstitutiveStateVariablesConverged() override;

  virtual void getDDIncrements();

  /**
   * This function
   * stores the dislocation velocity value
   * to couple with dislocation transport
   */
  virtual void getDisloVelocity();
  virtual void DDCUpdate();
  virtual void storeDislocationMobilityInformation();

  const Real _lattice_friction;
  const Real _burgers_vector_mag;
  const Real _dislo_density_initial;
  const Real _dislo_density_factor_CDT;
  const Real _C_multi, _C_trap, _C_m_ann, _C_im_ann;
  Real _Coeff_hardening, _q1, _q2, _c1, _temp;
  Real Lbar;

  // Discoflux related material parameters that are constant
  // const	Real c1 =2.0;
  const Real mu = 76e+03;
  const Real nu = 0.3;
  const Real rho_m = 8960;
  const Real B0 = 3.0e-11;
  const Real g0 = 0.87;
  // const  Real q1 = 0.23;
  // const  Real q2 = 1.96;
  const Real boltz = 1.38e-23; // Boltzman constant in Jule/Kelvin
  // const  Real temp =300;
  const Real omega0 = 2.0e+2; // 8.0e+11;

  // const VariableValue & _Rho_EdgePositive_01;
  const ArrayVariableValue & _DD_EdgePositive;
  const ArrayVariableValue & _DD_EdgeNegative;
  const ArrayVariableValue & _DD_ScrewPositive;
  const ArrayVariableValue & _DD_ScrewNegative;

  const ArrayVariableGradient & _DD_EdgePositive_Grad;
  const ArrayVariableGradient & _DD_EdgeNegative_Grad;
  const ArrayVariableGradient & _DD_ScrewPositive_Grad;
  const ArrayVariableGradient & _DD_ScrewNegative_Grad;

  MaterialProperty<std::vector<Real>> & _dislocation_immobile;
  const MaterialProperty<std::vector<Real>> & _dislocation_immobile_old;
  MaterialProperty<std::vector<Real>> & _dislocation_mobile;
  const MaterialProperty<std::vector<Real>> & _dislocation_mobile_old;
  MaterialProperty<std::vector<Real>> & _dislo_velocity_edge;
  MaterialProperty<std::vector<Real>> & _dislo_velocity_screw;
  const MaterialProperty<std::vector<Real>> & _tau_old;
  const MaterialProperty<std::vector<Real>> & _GND_density;
  MaterialProperty<std::vector<Real>> & _tau_b;
  MaterialProperty<std::vector<Real>> & _kappa;

  // DDC related variables
  std::vector<RealVectorValue> _DD_grad;
  std::vector<Real> _tau_b_local;

  MaterialProperty<std::vector<RealVectorValue>> & _slip_direction_edge;
  MaterialProperty<std::vector<RealVectorValue>> & _slip_direction_screw;
  MaterialProperty<std::vector<RealVectorValue>> & _slip_plane_normalboth;

  const MaterialProperty<RankTwoTensor> & _crysrot;

  // Stores the values of the slip system resistance
  std::vector<Real> _previous_substep_slip_resistance;
  std::vector<Real> _previous_substep_dislocation_mobile;
  std::vector<Real> _previous_substep_dislocation_immobile;
  std::vector<Real> _previous_substep_slip_accumulated;

  // Caches the value of the current slip system resistance
  std::vector<Real> _slip_resistance_before_update;
  std::vector<Real> _dislocation_mobile_before_update;
  std::vector<Real> _dislocation_immobile_before_update;

  std::vector<Real> _hb;
  std::vector<Real> _slip_resistance_increment;
  std::vector<Real> _dislocation_mobile_increment;
  std::vector<Real> _dislocation_immobile_increment;
  std::vector<Real> _dv_dtau;
  std::vector<Real> _L_bar;

  // For dislocation velocity computation
  Real small2 = 1.0e-10, exp_limit = 2.0e+2;
  std::vector<Real> t_wait, t_run, vel_run, dislocation_density, tau_b, xi0, tau_eff, tau_effAbs,
      tau_effSign, slip_r;
  Real vcrit = std::sqrt(mu * 1.0e+06 / rho_m) * 1000;
  Real deltaG0, inner, deltaG, exp_arg, dtw_dtau, dtr_dtau;

  // For DDCUpdate
  RealVectorValue slip_direction_rotated, slip_plane_normal_rotated;
  RankTwoTensor Stress_internal;
};
