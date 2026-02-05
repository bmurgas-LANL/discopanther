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

class DiscoFluxCPOrowanOldDDStressUpdate;

class DiscoFluxCPOrowanOldDDStressUpdate : public CrystalPlasticityOrowanStressUpdateBase
{
public:
  static InputParameters validParams();

  DiscoFluxCPOrowanOldDDStressUpdate(const InputParameters & parameters);

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
  const Real _initial_thermal;
  const Real _burgers_vector_mag;
  const Real _dislo_density_initial;
  const Real _dislo_density_factor_CDT;
  const Real _C_multi, _C_trap, _C_m_ann, _C_im_ann, _dd_sat;
  Real _Coeff_hardening, _Coeff_backstress, _Coeff_thermal, _Coeff_dislength, _q1, _q2, _B0, _B0s,
      _vs_edge, _vs_screw, _temp, _mu, _nu, _g0, _omega0, _boltz;
  Real Lbar;

  bool _mean_free_path_init_flag;

  bool _disloc_den_threshold_flag;

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

  // DDC related variables
  std::vector<RealVectorValue> _DD_grad;
  std::vector<RealVectorValue> _DD_grad_screw;
  std::vector<Real> _tau_b_local;
  std::vector<Real> _tau_b_local_screw;

  std::vector<Real> _DD_EdgePositive;
  std::vector<Real> _DD_EdgeNegative;
  std::vector<Real> _DD_ScrewPositive;
  std::vector<Real> _DD_ScrewNegative;
  std::vector<RealVectorValue> _DD_EdgePositive_Grad;
  std::vector<RealVectorValue> _DD_EdgeNegative_Grad;
  std::vector<RealVectorValue> _DD_ScrewPositive_Grad;
  std::vector<RealVectorValue> _DD_ScrewNegative_Grad;

  // Stores the values of the slip system resistance
  std::vector<Real> _previous_substep_slip_resistance;
  std::vector<Real> _previous_substep_dislocation_mobile;
  std::vector<Real> _previous_substep_dislocation_mobile_edge;
  std::vector<Real> _previous_substep_dislocation_mobile_screw;
  std::vector<Real> _previous_substep_dislocation_immobile_edge_positive;
  std::vector<Real> _previous_substep_dislocation_immobile_edge_negative;
  std::vector<Real> _previous_substep_dislocation_immobile_screw_positive;
  std::vector<Real> _previous_substep_dislocation_immobile_screw_negative;
  std::vector<Real> _previous_substep_slip_accumulated;

  // Caches the value of the current slip system resistance
  std::vector<Real> _slip_resistance_before_update;
  std::vector<Real> _dislocation_mobile_before_update;
  std::vector<Real> _dislocation_mobile_edge_before_update;
  std::vector<Real> _dislocation_mobile_screw_before_update;
  std::vector<Real> _dislocation_immobile_before_update_edge_positive;
  std::vector<Real> _dislocation_immobile_before_update_edge_negative;
  std::vector<Real> _dislocation_immobile_before_update_screw_positive;
  std::vector<Real> _dislocation_immobile_before_update_screw_negative;

  std::vector<Real> _hb;
  std::vector<Real> _slip_resistance_increment;
  std::vector<Real> _dislocation_mobile_increment;
  std::vector<Real> _dislocation_mobile_edge_increment;
  std::vector<Real> _dislocation_mobile_screw_increment;
  std::vector<Real> _dislocation_immobile_increment_edge_positive;
  std::vector<Real> _dislocation_immobile_increment_edge_negative;
  std::vector<Real> _dislocation_immobile_increment_screw_positive;
  std::vector<Real> _dislocation_immobile_increment_screw_negative;
  std::vector<Real> _dv_dtau;
  std::vector<Real> _dv_dtau_screw;
  std::vector<Real> _L_bar;

  Real _L_bar_e, _L_bar_s;

  Real _min_dd, _max_dd, _sat_coef_imm;

  // For dislocation velocity computation
  Real small2 = 1.0e-5, exp_limit = 2.0e+2;
  std::vector<Real> t_wait, t_run, vel_run, dislocation_density, tau_b, xi0, tau_eff, tau_effAbs,
      tau_effSign, slip_r;
  Real deltaG0, inner, deltaG, exp_arg, dtw_dtau, dtr_dtau;
  Real dtw_drho;
  std::vector<Real> dslip_r_drho;

  // For DDCUpdate
  RealVectorValue slip_direction_rotated, slip_plane_normal_rotated, slip_direction_rotated_screw;
  RankTwoTensor Stress_internal;
};
