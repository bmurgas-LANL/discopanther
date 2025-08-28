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

#include "CrystalPlasticityOrowanStressUpdateBase.h"

#include "MooseVariableFE.h"
#include "MooseVariableScalar.h"
#include "MooseVariableInterface.h" // for *mooseVariable() in _phi, _grad_phi

class DiscoFluxCPBCCOrowanStressUpdate;

class DiscoFluxCPBCCOrowanStressUpdate : public CrystalPlasticityOrowanStressUpdateBase
{
public:
  static InputParameters validParams();

  DiscoFluxCPBCCOrowanStressUpdate(const InputParameters & parameters);

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
  const Real _initial_athermal;
  const Real _burgers_vector_mag;
  const Real _dislo_density_initial;
  const Real _dislo_density_factor_CDT;
  const Real _C_multi, _C_trap, _C_m_ann, _C_im_ann;
  const Real _gamdot_ref, _min_dd, _dd_sat, _sat_A, _nrec;
  Real _Coeff_hardening, _Coeff_backstress, _Coeff_dislength;
  Real _q1, _q2;
  Real _B0, _B0s;
  Real _vs_edge, _vs_screw;
  Real _temp,  _boltz; 
  Real _mu, _nu;
  Real _g0, _omega0;
  Real Lbar;

  bool _mean_free_path_init_flag;

  bool _disloc_den_threshold_flag;

  // Discoflux related material parameters that are constant
  // const Real mu = 76e+03; // MPa
  // const Real nu = 0.3;
  // const Real rho_m = 8960; // kg m-3
  // const Real B0 = 3.0e-11; // MPa s
  // const Real g0 = 0.87;
  // const Real boltz = 1.38e-20; // Boltzman constant in Jule/Kelvin
  // const Real omega0 = 2.0e+2; // 8.0e+11;

  const VariableValue & _DD_EdgePositive_1;
  const VariableValue & _DD_EdgePositive_2;
  const VariableValue & _DD_EdgePositive_3;
  const VariableValue & _DD_EdgePositive_4;
  const VariableValue & _DD_EdgePositive_5;
  const VariableValue & _DD_EdgePositive_6;
  const VariableValue & _DD_EdgePositive_7;
  const VariableValue & _DD_EdgePositive_8;
  const VariableValue & _DD_EdgePositive_9;
  const VariableValue & _DD_EdgePositive_10;
  const VariableValue & _DD_EdgePositive_11;
  const VariableValue & _DD_EdgePositive_12;

  const VariableValue & _DD_EdgePositive_13;
  const VariableValue & _DD_EdgePositive_14;
  const VariableValue & _DD_EdgePositive_15;
  const VariableValue & _DD_EdgePositive_16;
  const VariableValue & _DD_EdgePositive_17;
  const VariableValue & _DD_EdgePositive_18;
  const VariableValue & _DD_EdgePositive_19;
  const VariableValue & _DD_EdgePositive_20;
  const VariableValue & _DD_EdgePositive_21;
  const VariableValue & _DD_EdgePositive_22;
  const VariableValue & _DD_EdgePositive_23;
  const VariableValue & _DD_EdgePositive_24;

  const VariableValue & _DD_EdgeNegative_1;
  const VariableValue & _DD_EdgeNegative_2;
  const VariableValue & _DD_EdgeNegative_3;
  const VariableValue & _DD_EdgeNegative_4;
  const VariableValue & _DD_EdgeNegative_5;
  const VariableValue & _DD_EdgeNegative_6;
  const VariableValue & _DD_EdgeNegative_7;
  const VariableValue & _DD_EdgeNegative_8;
  const VariableValue & _DD_EdgeNegative_9;
  const VariableValue & _DD_EdgeNegative_10;
  const VariableValue & _DD_EdgeNegative_11;
  const VariableValue & _DD_EdgeNegative_12;

  const VariableValue & _DD_EdgeNegative_13;
  const VariableValue & _DD_EdgeNegative_14;
  const VariableValue & _DD_EdgeNegative_15;
  const VariableValue & _DD_EdgeNegative_16;
  const VariableValue & _DD_EdgeNegative_17;
  const VariableValue & _DD_EdgeNegative_18;
  const VariableValue & _DD_EdgeNegative_19;
  const VariableValue & _DD_EdgeNegative_20;
  const VariableValue & _DD_EdgeNegative_21;
  const VariableValue & _DD_EdgeNegative_22;
  const VariableValue & _DD_EdgeNegative_23;
  const VariableValue & _DD_EdgeNegative_24;

  const VariableValue & _DD_ScrewPositive_1;
  const VariableValue & _DD_ScrewPositive_2;
  const VariableValue & _DD_ScrewPositive_3;
  const VariableValue & _DD_ScrewPositive_4;
  const VariableValue & _DD_ScrewPositive_5;
  const VariableValue & _DD_ScrewPositive_6;
  const VariableValue & _DD_ScrewPositive_7;
  const VariableValue & _DD_ScrewPositive_8;
  const VariableValue & _DD_ScrewPositive_9;
  const VariableValue & _DD_ScrewPositive_10;
  const VariableValue & _DD_ScrewPositive_11;
  const VariableValue & _DD_ScrewPositive_12;

  const VariableValue & _DD_ScrewPositive_13;
  const VariableValue & _DD_ScrewPositive_14;
  const VariableValue & _DD_ScrewPositive_15;
  const VariableValue & _DD_ScrewPositive_16;
  const VariableValue & _DD_ScrewPositive_17;
  const VariableValue & _DD_ScrewPositive_18;
  const VariableValue & _DD_ScrewPositive_19;
  const VariableValue & _DD_ScrewPositive_20;
  const VariableValue & _DD_ScrewPositive_21;
  const VariableValue & _DD_ScrewPositive_22;
  const VariableValue & _DD_ScrewPositive_23;
  const VariableValue & _DD_ScrewPositive_24;

  const VariableValue & _DD_ScrewNegative_1;
  const VariableValue & _DD_ScrewNegative_2;
  const VariableValue & _DD_ScrewNegative_3;
  const VariableValue & _DD_ScrewNegative_4;
  const VariableValue & _DD_ScrewNegative_5;
  const VariableValue & _DD_ScrewNegative_6;
  const VariableValue & _DD_ScrewNegative_7;
  const VariableValue & _DD_ScrewNegative_8;
  const VariableValue & _DD_ScrewNegative_9;
  const VariableValue & _DD_ScrewNegative_10;
  const VariableValue & _DD_ScrewNegative_11;
  const VariableValue & _DD_ScrewNegative_12;

  const VariableValue & _DD_ScrewNegative_13;
  const VariableValue & _DD_ScrewNegative_14;
  const VariableValue & _DD_ScrewNegative_15;
  const VariableValue & _DD_ScrewNegative_16;
  const VariableValue & _DD_ScrewNegative_17;
  const VariableValue & _DD_ScrewNegative_18;
  const VariableValue & _DD_ScrewNegative_19;
  const VariableValue & _DD_ScrewNegative_20;
  const VariableValue & _DD_ScrewNegative_21;
  const VariableValue & _DD_ScrewNegative_22;
  const VariableValue & _DD_ScrewNegative_23;
  const VariableValue & _DD_ScrewNegative_24;

  const VariableGradient & _DD_EdgePositive_1_Grad;
  const VariableGradient & _DD_EdgePositive_2_Grad;
  const VariableGradient & _DD_EdgePositive_3_Grad;
  const VariableGradient & _DD_EdgePositive_4_Grad;
  const VariableGradient & _DD_EdgePositive_5_Grad;
  const VariableGradient & _DD_EdgePositive_6_Grad;
  const VariableGradient & _DD_EdgePositive_7_Grad;
  const VariableGradient & _DD_EdgePositive_8_Grad;
  const VariableGradient & _DD_EdgePositive_9_Grad;
  const VariableGradient & _DD_EdgePositive_10_Grad;
  const VariableGradient & _DD_EdgePositive_11_Grad;
  const VariableGradient & _DD_EdgePositive_12_Grad;

  const VariableGradient & _DD_EdgePositive_13_Grad;
  const VariableGradient & _DD_EdgePositive_14_Grad;
  const VariableGradient & _DD_EdgePositive_15_Grad;
  const VariableGradient & _DD_EdgePositive_16_Grad;
  const VariableGradient & _DD_EdgePositive_17_Grad;
  const VariableGradient & _DD_EdgePositive_18_Grad;
  const VariableGradient & _DD_EdgePositive_19_Grad;
  const VariableGradient & _DD_EdgePositive_20_Grad;
  const VariableGradient & _DD_EdgePositive_21_Grad;
  const VariableGradient & _DD_EdgePositive_22_Grad;
  const VariableGradient & _DD_EdgePositive_23_Grad;
  const VariableGradient & _DD_EdgePositive_24_Grad;

  const VariableGradient & _DD_EdgeNegative_1_Grad;
  const VariableGradient & _DD_EdgeNegative_2_Grad;
  const VariableGradient & _DD_EdgeNegative_3_Grad;
  const VariableGradient & _DD_EdgeNegative_4_Grad;
  const VariableGradient & _DD_EdgeNegative_5_Grad;
  const VariableGradient & _DD_EdgeNegative_6_Grad;
  const VariableGradient & _DD_EdgeNegative_7_Grad;
  const VariableGradient & _DD_EdgeNegative_8_Grad;
  const VariableGradient & _DD_EdgeNegative_9_Grad;
  const VariableGradient & _DD_EdgeNegative_10_Grad;
  const VariableGradient & _DD_EdgeNegative_11_Grad;
  const VariableGradient & _DD_EdgeNegative_12_Grad;

  const VariableGradient & _DD_EdgeNegative_13_Grad;
  const VariableGradient & _DD_EdgeNegative_14_Grad;
  const VariableGradient & _DD_EdgeNegative_15_Grad;
  const VariableGradient & _DD_EdgeNegative_16_Grad;
  const VariableGradient & _DD_EdgeNegative_17_Grad;
  const VariableGradient & _DD_EdgeNegative_18_Grad;
  const VariableGradient & _DD_EdgeNegative_19_Grad;
  const VariableGradient & _DD_EdgeNegative_20_Grad;
  const VariableGradient & _DD_EdgeNegative_21_Grad;
  const VariableGradient & _DD_EdgeNegative_22_Grad;
  const VariableGradient & _DD_EdgeNegative_23_Grad;
  const VariableGradient & _DD_EdgeNegative_24_Grad;

  const VariableGradient & _DD_ScrewPositive_1_Grad;
  const VariableGradient & _DD_ScrewPositive_2_Grad;
  const VariableGradient & _DD_ScrewPositive_3_Grad;
  const VariableGradient & _DD_ScrewPositive_4_Grad;
  const VariableGradient & _DD_ScrewPositive_5_Grad;
  const VariableGradient & _DD_ScrewPositive_6_Grad;
  const VariableGradient & _DD_ScrewPositive_7_Grad;
  const VariableGradient & _DD_ScrewPositive_8_Grad;
  const VariableGradient & _DD_ScrewPositive_9_Grad;
  const VariableGradient & _DD_ScrewPositive_10_Grad;
  const VariableGradient & _DD_ScrewPositive_11_Grad;
  const VariableGradient & _DD_ScrewPositive_12_Grad;

  const VariableGradient & _DD_ScrewPositive_13_Grad;
  const VariableGradient & _DD_ScrewPositive_14_Grad;
  const VariableGradient & _DD_ScrewPositive_15_Grad;
  const VariableGradient & _DD_ScrewPositive_16_Grad;
  const VariableGradient & _DD_ScrewPositive_17_Grad;
  const VariableGradient & _DD_ScrewPositive_18_Grad;
  const VariableGradient & _DD_ScrewPositive_19_Grad;
  const VariableGradient & _DD_ScrewPositive_20_Grad;
  const VariableGradient & _DD_ScrewPositive_21_Grad;
  const VariableGradient & _DD_ScrewPositive_22_Grad;
  const VariableGradient & _DD_ScrewPositive_23_Grad;
  const VariableGradient & _DD_ScrewPositive_24_Grad;

  const VariableGradient & _DD_ScrewNegative_1_Grad;
  const VariableGradient & _DD_ScrewNegative_2_Grad;
  const VariableGradient & _DD_ScrewNegative_3_Grad;
  const VariableGradient & _DD_ScrewNegative_4_Grad;
  const VariableGradient & _DD_ScrewNegative_5_Grad;
  const VariableGradient & _DD_ScrewNegative_6_Grad;
  const VariableGradient & _DD_ScrewNegative_7_Grad;
  const VariableGradient & _DD_ScrewNegative_8_Grad;
  const VariableGradient & _DD_ScrewNegative_9_Grad;
  const VariableGradient & _DD_ScrewNegative_10_Grad;
  const VariableGradient & _DD_ScrewNegative_11_Grad;
  const VariableGradient & _DD_ScrewNegative_12_Grad;

  const VariableGradient & _DD_ScrewNegative_13_Grad;
  const VariableGradient & _DD_ScrewNegative_14_Grad;
  const VariableGradient & _DD_ScrewNegative_15_Grad;
  const VariableGradient & _DD_ScrewNegative_16_Grad;
  const VariableGradient & _DD_ScrewNegative_17_Grad;
  const VariableGradient & _DD_ScrewNegative_18_Grad;
  const VariableGradient & _DD_ScrewNegative_19_Grad;
  const VariableGradient & _DD_ScrewNegative_20_Grad;
  const VariableGradient & _DD_ScrewNegative_21_Grad;
  const VariableGradient & _DD_ScrewNegative_22_Grad;
  const VariableGradient & _DD_ScrewNegative_23_Grad;
  const VariableGradient & _DD_ScrewNegative_24_Grad;

  MaterialProperty<std::vector<Real>>           & _dislocation_immobile_sat_edgepos;
  MaterialProperty<std::vector<Real>>           & _dislocation_immobile_sat_edgeneg;
  MaterialProperty<std::vector<Real>>           & _dislocation_immobile_sat_screwpos;
  MaterialProperty<std::vector<Real>>           & _dislocation_immobile_sat_screwneg;
  MaterialProperty<std::vector<Real>>           & _dislocation_immobile;
  const MaterialProperty<std::vector<Real>>     & _dislocation_immobile_old;
  MaterialProperty<std::vector<Real>>           & _dislocation_immobile_edge_negative;
  const MaterialProperty<std::vector<Real>>     & _dislocation_immobile_edge_negative_old;
  MaterialProperty<std::vector<Real>>           & _dislocation_immobile_screw_positive;
  const MaterialProperty<std::vector<Real>>     & _dislocation_immobile_screw_positive_old;
  MaterialProperty<std::vector<Real>>           & _dislocation_immobile_screw_negative;
  const MaterialProperty<std::vector<Real>>     & _dislocation_immobile_screw_negative_old;
  MaterialProperty<std::vector<Real>>           & _dislocation_mobile;
  MaterialProperty<std::vector<Real>>           & _dislocation_mobile_edge;
  MaterialProperty<std::vector<Real>>           & _dislocation_mobile_screw;
  const MaterialProperty<std::vector<Real>>     & _dislocation_mobile_old;
  const MaterialProperty<std::vector<Real>>     & _dislocation_mobile_edge_old;
  const MaterialProperty<std::vector<Real>>     & _dislocation_mobile_screw_old;
  MaterialProperty<std::vector<Real>>           & _dislo_velocity_edge;
  const MaterialProperty<std::vector<Real>>     & _dislo_velocity_edge_old;
  MaterialProperty<std::vector<Real>>           & _dislo_velocity_screw;
  const MaterialProperty<std::vector<Real>>     & _dislo_velocity_screw_old;
  const MaterialProperty<std::vector<Real>>     & _tau_old;
  const MaterialProperty<std::vector<Real>>     & _GND_density;
  MaterialProperty<std::vector<Real>>           & _tau_b;
  MaterialProperty<std::vector<Real>>           & _kappa;
  MaterialProperty<std::vector<Real>>           & _kappa_screw;

  // DDC related variables
  std::vector<RealVectorValue>                  _DD_grad;
  std::vector<RealVectorValue>                  _DD_grad_screw;
  std::vector<Real>                             _tau_b_local;
  std::vector<Real>                             _tau_b_local_screw;

  std::vector<Real>                             _DD_EdgePositive;
  std::vector<Real>                             _DD_EdgeNegative;
  std::vector<Real>                             _DD_ScrewPositive;
  std::vector<Real>                             _DD_ScrewNegative;
  std::vector<RealVectorValue>                  _DD_EdgePositive_Grad;
  std::vector<RealVectorValue>                  _DD_EdgeNegative_Grad;
  std::vector<RealVectorValue>                  _DD_ScrewPositive_Grad;
  std::vector<RealVectorValue>                  _DD_ScrewNegative_Grad;

  MaterialProperty<std::vector<RealVectorValue>> & _slip_direction_edge;
  MaterialProperty<std::vector<RealVectorValue>> & _slip_direction_screw;
  MaterialProperty<std::vector<RealVectorValue>> & _slip_plane_normalboth;

  const MaterialProperty<RankTwoTensor>         & _crysrot;

  // Stores the values of the slip system resistance
  std::vector<Real> _previous_substep_slip_resistance;
  std::vector<Real> _previous_substep_dislocation_mobile;
  std::vector<Real> _previous_substep_dislocation_mobile_edge;
  std::vector<Real> _previous_substep_dislocation_mobile_screw;
  std::vector<Real> _previous_substep_dislocation_immobile;
  std::vector<Real> _previous_substep_dislocation_immobile_edge_negative;
  std::vector<Real> _previous_substep_dislocation_immobile_screw_positive;
  std::vector<Real> _previous_substep_dislocation_immobile_screw_negative;
  std::vector<Real> _previous_substep_slip_accumulated;

  // Caches the value of the current slip system resistance
  std::vector<Real> _slip_resistance_before_update;
  std::vector<Real> _dislocation_mobile_before_update;
  std::vector<Real> _dislocation_mobile_edge_before_update;
  std::vector<Real> _dislocation_mobile_screw_before_update;
  std::vector<Real> _dislocation_immobile_before_update;
  std::vector<Real> _dislocation_immobile_before_update_edge_negative;
  std::vector<Real> _dislocation_immobile_before_update_screw_positive;
  std::vector<Real> _dislocation_immobile_before_update_screw_negative;

  std::vector<Real> _hb;
  std::vector<Real> _slip_resistance_increment;
  std::vector<Real> _dislocation_mobile_increment;
  std::vector<Real> _dislocation_mobile_edge_increment;
  std::vector<Real> _dislocation_mobile_screw_increment;
  std::vector<Real> _dislocation_immobile_increment;
  std::vector<Real> _dislocation_immobile_increment_edge_negative;
  std::vector<Real> _dislocation_immobile_increment_screw_positive;
  std::vector<Real> _dislocation_immobile_increment_screw_negative;
  std::vector<Real> _dv_dtau;
  std::vector<Real> _dv_dtau_screw;
  std::vector<Real> _L_bar;

  // std::vector<Real> _L_bar_e, _L_bar_s;
  Real _L_bar_e, _L_bar_s;
  Real _max_dd;

  // For dislocation velocity computation
  Real small2 = 1.0e-10, exp_limit = 2.0e+2;
  std::vector<Real> t_wait, t_run, vel_run, dislocation_density, tau_b, xi0, tau_eff, tau_effAbs,
      tau_effSign, slip_r;
  // Real vcrit = std::sqrt(mu * 1.0e+06 / rho_m) * 1000; // mm s-1
  Real deltaG0, inner, deltaG, exp_arg, dtw_dtau, dtr_dtau;

  // For DDCUpdate
  RealVectorValue slip_direction_rotated, slip_plane_normal_rotated, slip_direction_rotated_screw;
  RankTwoTensor Stress_internal;
};
