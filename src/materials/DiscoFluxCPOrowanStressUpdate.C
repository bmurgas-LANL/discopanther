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
#include "DiscoFluxCPOrowanStressUpdate.h"
#include "RankTwoTensor.h"

#include "SystemBase.h"
#include "libmesh/quadrature.h"
#include "libmesh/utility.h"

#include "Assembly.h"
#include "MooseMesh.h"

#include "libmesh/node.h"
#include "libmesh/fe_base.h"
#include "libmesh/quadrature_gauss.h"
#include "libmesh/remote_elem.h"

registerMooseObject("discopanterApp", DiscoFluxCPOrowanStressUpdate);

InputParameters
DiscoFluxCPOrowanStressUpdate::validParams()
{
  InputParameters params = CrystalPlasticityOrowanStressUpdateBase::validParams();

  params.addClassDescription(
      "Calculates the plastic slip based on DiscoFlux crystal plasticity material model.");

  // Parameter description in the DiscoFlux paper(International Journal of Plasticity 76 (2016)
  // 111e129)
  params.addParam<Real>(
      "lattice_friction", 10, "initial lattice friction strength of the material in MPa");
  params.addParam<Real>("initial_athermal", 30, "initial athermal stress resistance in MPa");
  params.addParam<Real>("burgers_vector_mag", 1.0e-07, "Magnitude of the Burgers vector in mm");
  params.addParam<Real>("dislo_density_initial", 1.0e+05, "Initial dislocation density(mm^{-2})");
  params.addParam<Real>(
      "dislo_density_factor_CDT", 1.0, "factor to convert the dislocation density from CDT to CP");

  params.addParam<Real>("C_multi", 0.4, "parameter for dislocation multiplication");
  params.addParam<Real>("C_trap", 0.36, "parameter for dislocation trapping");
  params.addParam<Real>("C_m_ann", 0.16, "parameter for dislocation mobile annihilation");
  params.addParam<Real>("C_im_ann", 0.16, "parameter for dislocation immobile annihilation");
  params.addParam<Real>("dd_sat", 10e10, "dislocation density saturation value");
  params.addParam<Real>("Coeff_hardening", 0.5, "parameter to control the material hardening");
  params.addParam<Real>("Coeff_backstress", 1.0, "parameter to control the backstress");
  params.addParam<Real>("Coeff_dislength",
                        1.0,
                        "parameter to correlate the avg dislocation segment length with the mean "
                        "free path of dislocations");
  params.addParam<Real>("q1", 0.33, "Energy barrier shape parameter q1 or p");
  params.addParam<Real>("q2", 1.66, "Energy barrier shape parameter q2 or q");
  params.addParam<Real>("B0", 2.4e-11, "Reference drag coefficient of edge dislocations in MPa s");
  params.addParam<Real>(
      "B0s", 3.1e-11, "Reference drag coefficient of screw dislocations in MPa s");
  params.addParam<Real>("vs_edge", 1.62e6, "Limiting edge dislocation velocity in mm/s");
  params.addParam<Real>("vs_screw", 2.2e6, "Limiting edge dislocation velocity in mm/s");
  params.addParam<Real>("temp", 300, "Temperature(K)");
  params.addParam<Real>("mu", 54.64e+03, "Shear modulus in MPa");
  params.addParam<Real>("nu", 0.34, "Poisson's modulus");
  params.addParam<Real>("g0", 0.87, "Dislocation energy barrrier coefficient");
  params.addParam<Real>("omega0", 8e11, "Attempt frequency");
  params.addParam<Real>("boltz", 1.38e-20, "Boltzmann constant in N mm K-1");

  params.addParam<bool>("mean_free_path_init_flag",
                        true,
                        "Flag to determine whether to use initial or actual dislocation density");
  params.addParam<Real>("L_bar_e", 0.001, "Mean free path edge dislocations");
  params.addParam<Real>("L_bar_s", 0.001, "Mean free path screw dislocations");

  params.addParam<bool>(
      "disloc_den_threshold_flag",
      false,
      "Flag to determine whether to use min and max dislocation density threshold");
  params.addParam<Real>("min_dd", 1.0, "Minimum dislocation density");
  params.addParam<Real>("max_dd", 7e06, "Maximum dislocation density");

  params.addCoupledVar("DD_EdgePositive_1", 1.0, "Coupled dislocation density, EdgePositive");
  params.addCoupledVar("DD_EdgePositive_2", 1.0, "Coupled dislocation density, EdgePositive");
  params.addCoupledVar("DD_EdgePositive_3", 1.0, "Coupled dislocation density, EdgePositive");
  params.addCoupledVar("DD_EdgePositive_4", 1.0, "Coupled dislocation density, EdgePositive");
  params.addCoupledVar("DD_EdgePositive_5", 1.0, "Coupled dislocation density, EdgePositive");
  params.addCoupledVar("DD_EdgePositive_6", 1.0, "Coupled dislocation density, EdgePositive");
  params.addCoupledVar("DD_EdgePositive_7", 1.0, "Coupled dislocation density, EdgePositive");
  params.addCoupledVar("DD_EdgePositive_8", 1.0, "Coupled dislocation density, EdgePositive");
  params.addCoupledVar("DD_EdgePositive_9", 1.0, "Coupled dislocation density, EdgePositive");
  params.addCoupledVar("DD_EdgePositive_10", 1.0, "Coupled dislocation density, EdgePositive");
  params.addCoupledVar("DD_EdgePositive_11", 1.0, "Coupled dislocation density, EdgePositive");
  params.addCoupledVar("DD_EdgePositive_12", 1.0, "Coupled dislocation density, EdgePositive");

  params.addCoupledVar("DD_EdgeNegative_1", 1.0, "Coupled dislocation density, EdgeNegative");
  params.addCoupledVar("DD_EdgeNegative_2", 1.0, "Coupled dislocation density, EdgeNegative");
  params.addCoupledVar("DD_EdgeNegative_3", 1.0, "Coupled dislocation density, EdgeNegative");
  params.addCoupledVar("DD_EdgeNegative_4", 1.0, "Coupled dislocation density, EdgeNegative");
  params.addCoupledVar("DD_EdgeNegative_5", 1.0, "Coupled dislocation density, EdgeNegative");
  params.addCoupledVar("DD_EdgeNegative_6", 1.0, "Coupled dislocation density, EdgeNegative");
  params.addCoupledVar("DD_EdgeNegative_7", 1.0, "Coupled dislocation density, EdgeNegative");
  params.addCoupledVar("DD_EdgeNegative_8", 1.0, "Coupled dislocation density, EdgeNegative");
  params.addCoupledVar("DD_EdgeNegative_9", 1.0, "Coupled dislocation density, EdgeNegative");
  params.addCoupledVar("DD_EdgeNegative_10", 1.0, "Coupled dislocation density, EdgeNegative");
  params.addCoupledVar("DD_EdgeNegative_11", 1.0, "Coupled dislocation density, EdgeNegative");
  params.addCoupledVar("DD_EdgeNegative_12", 1.0, "Coupled dislocation density, EdgeNegative");

  params.addCoupledVar("DD_ScrewPositive_1", 1.0, "Coupled dislocation density, ScrewPositive");
  params.addCoupledVar("DD_ScrewPositive_2", 1.0, "Coupled dislocation density, ScrewPositive");
  params.addCoupledVar("DD_ScrewPositive_3", 1.0, "Coupled dislocation density, ScrewPositive");
  params.addCoupledVar("DD_ScrewPositive_4", 1.0, "Coupled dislocation density, ScrewPositive");
  params.addCoupledVar("DD_ScrewPositive_5", 1.0, "Coupled dislocation density, ScrewPositive");
  params.addCoupledVar("DD_ScrewPositive_6", 1.0, "Coupled dislocation density, ScrewPositive");
  params.addCoupledVar("DD_ScrewPositive_7", 1.0, "Coupled dislocation density, ScrewPositive");
  params.addCoupledVar("DD_ScrewPositive_8", 1.0, "Coupled dislocation density, ScrewPositive");
  params.addCoupledVar("DD_ScrewPositive_9", 1.0, "Coupled dislocation density, ScrewPositive");
  params.addCoupledVar("DD_ScrewPositive_10", 1.0, "Coupled dislocation density, ScrewPositive");
  params.addCoupledVar("DD_ScrewPositive_11", 1.0, "Coupled dislocation density, ScrewPositive");
  params.addCoupledVar("DD_ScrewPositive_12", 1.0, "Coupled dislocation density, ScrewPositive");

  params.addCoupledVar("DD_ScrewNegative_1", 1.0, "Coupled dislocation density, ScrewNegative");
  params.addCoupledVar("DD_ScrewNegative_2", 1.0, "Coupled dislocation density, ScrewNegative");
  params.addCoupledVar("DD_ScrewNegative_3", 1.0, "Coupled dislocation density, ScrewNegative");
  params.addCoupledVar("DD_ScrewNegative_4", 1.0, "Coupled dislocation density, ScrewNegative");
  params.addCoupledVar("DD_ScrewNegative_5", 1.0, "Coupled dislocation density, ScrewNegative");
  params.addCoupledVar("DD_ScrewNegative_6", 1.0, "Coupled dislocation density, ScrewNegative");
  params.addCoupledVar("DD_ScrewNegative_7", 1.0, "Coupled dislocation density, ScrewNegative");
  params.addCoupledVar("DD_ScrewNegative_8", 1.0, "Coupled dislocation density, ScrewNegative");
  params.addCoupledVar("DD_ScrewNegative_9", 1.0, "Coupled dislocation density, ScrewNegative");
  params.addCoupledVar("DD_ScrewNegative_10", 1.0, "Coupled dislocation density, ScrewNegative");
  params.addCoupledVar("DD_ScrewNegative_11", 1.0, "Coupled dislocation density, ScrewNegative");
  params.addCoupledVar("DD_ScrewNegative_12", 1.0, "Coupled dislocation density, ScrewNegative");

  return params;
}

DiscoFluxCPOrowanStressUpdate::DiscoFluxCPOrowanStressUpdate(const InputParameters & parameters)
  : CrystalPlasticityOrowanStressUpdateBase(parameters),
    _lattice_friction(getParam<Real>("lattice_friction")),
    _initial_athermal(getParam<Real>("initial_athermal")),
    //
    _burgers_vector_mag(getParam<Real>("burgers_vector_mag")),
    _dislo_density_initial(getParam<Real>("dislo_density_initial")),
    _dislo_density_factor_CDT(getParam<Real>("dislo_density_factor_CDT")),
    _C_multi(getParam<Real>("C_multi")),
    _C_trap(getParam<Real>("C_trap")),
    _C_m_ann(getParam<Real>("C_m_ann")),
    _C_im_ann(getParam<Real>("C_im_ann")),
    _dd_sat(getParam<Real>("dd_sat")),
    _Coeff_hardening(getParam<Real>("Coeff_hardening")),
    _Coeff_backstress(getParam<Real>("Coeff_backstress")),
    _Coeff_dislength(getParam<Real>("Coeff_dislength")),
    //
    _q1(getParam<Real>("q1")),
    _q2(getParam<Real>("q2")),
    _B0(getParam<Real>("B0")),
    _B0s(getParam<Real>("B0s")),
    _vs_edge(getParam<Real>("vs_edge")),
    _vs_screw(getParam<Real>("vs_screw")),
    _temp(getParam<Real>("temp")),
    _mu(getParam<Real>("mu")),
    _nu(getParam<Real>("nu")),
    _g0(getParam<Real>("g0")),
    _omega0(getParam<Real>("omega0")),
    _boltz(getParam<Real>("boltz")),
    _mean_free_path_init_flag(getParam<bool>("mean_free_path_init_flag")),
    _disloc_den_threshold_flag(getParam<bool>("disloc_den_threshold_flag")),
    //
    _DD_EdgePositive_1(coupledValue("DD_EdgePositive_1")),
    _DD_EdgePositive_2(coupledValue("DD_EdgePositive_2")),
    _DD_EdgePositive_3(coupledValue("DD_EdgePositive_3")),
    _DD_EdgePositive_4(coupledValue("DD_EdgePositive_4")),
    _DD_EdgePositive_5(coupledValue("DD_EdgePositive_5")),
    _DD_EdgePositive_6(coupledValue("DD_EdgePositive_6")),
    _DD_EdgePositive_7(coupledValue("DD_EdgePositive_7")),
    _DD_EdgePositive_8(coupledValue("DD_EdgePositive_8")),
    _DD_EdgePositive_9(coupledValue("DD_EdgePositive_9")),
    _DD_EdgePositive_10(coupledValue("DD_EdgePositive_10")),
    _DD_EdgePositive_11(coupledValue("DD_EdgePositive_11")),
    _DD_EdgePositive_12(coupledValue("DD_EdgePositive_12")),
    //
    _DD_EdgeNegative_1(coupledValue("DD_EdgeNegative_1")),
    _DD_EdgeNegative_2(coupledValue("DD_EdgeNegative_2")),
    _DD_EdgeNegative_3(coupledValue("DD_EdgeNegative_3")),
    _DD_EdgeNegative_4(coupledValue("DD_EdgeNegative_4")),
    _DD_EdgeNegative_5(coupledValue("DD_EdgeNegative_5")),
    _DD_EdgeNegative_6(coupledValue("DD_EdgeNegative_6")),
    _DD_EdgeNegative_7(coupledValue("DD_EdgeNegative_7")),
    _DD_EdgeNegative_8(coupledValue("DD_EdgeNegative_8")),
    _DD_EdgeNegative_9(coupledValue("DD_EdgeNegative_9")),
    _DD_EdgeNegative_10(coupledValue("DD_EdgeNegative_10")),
    _DD_EdgeNegative_11(coupledValue("DD_EdgeNegative_11")),
    _DD_EdgeNegative_12(coupledValue("DD_EdgeNegative_12")),
    //
    _DD_ScrewPositive_1(coupledValue("DD_ScrewPositive_1")),
    _DD_ScrewPositive_2(coupledValue("DD_ScrewPositive_2")),
    _DD_ScrewPositive_3(coupledValue("DD_ScrewPositive_3")),
    _DD_ScrewPositive_4(coupledValue("DD_ScrewPositive_4")),
    _DD_ScrewPositive_5(coupledValue("DD_ScrewPositive_5")),
    _DD_ScrewPositive_6(coupledValue("DD_ScrewPositive_6")),
    _DD_ScrewPositive_7(coupledValue("DD_ScrewPositive_7")),
    _DD_ScrewPositive_8(coupledValue("DD_ScrewPositive_8")),
    _DD_ScrewPositive_9(coupledValue("DD_ScrewPositive_9")),
    _DD_ScrewPositive_10(coupledValue("DD_ScrewPositive_10")),
    _DD_ScrewPositive_11(coupledValue("DD_ScrewPositive_11")),
    _DD_ScrewPositive_12(coupledValue("DD_ScrewPositive_12")),
    //
    _DD_ScrewNegative_1(coupledValue("DD_ScrewNegative_1")),
    _DD_ScrewNegative_2(coupledValue("DD_ScrewNegative_2")),
    _DD_ScrewNegative_3(coupledValue("DD_ScrewNegative_3")),
    _DD_ScrewNegative_4(coupledValue("DD_ScrewNegative_4")),
    _DD_ScrewNegative_5(coupledValue("DD_ScrewNegative_5")),
    _DD_ScrewNegative_6(coupledValue("DD_ScrewNegative_6")),
    _DD_ScrewNegative_7(coupledValue("DD_ScrewNegative_7")),
    _DD_ScrewNegative_8(coupledValue("DD_ScrewNegative_8")),
    _DD_ScrewNegative_9(coupledValue("DD_ScrewNegative_9")),
    _DD_ScrewNegative_10(coupledValue("DD_ScrewNegative_10")),
    _DD_ScrewNegative_11(coupledValue("DD_ScrewNegative_11")),
    _DD_ScrewNegative_12(coupledValue("DD_ScrewNegative_12")),
    //
    _DD_EdgePositive_1_Grad(coupledGradient("DD_EdgePositive_1")),
    _DD_EdgePositive_2_Grad(coupledGradient("DD_EdgePositive_2")),
    _DD_EdgePositive_3_Grad(coupledGradient("DD_EdgePositive_3")),
    _DD_EdgePositive_4_Grad(coupledGradient("DD_EdgePositive_4")),
    _DD_EdgePositive_5_Grad(coupledGradient("DD_EdgePositive_5")),
    _DD_EdgePositive_6_Grad(coupledGradient("DD_EdgePositive_6")),
    _DD_EdgePositive_7_Grad(coupledGradient("DD_EdgePositive_7")),
    _DD_EdgePositive_8_Grad(coupledGradient("DD_EdgePositive_8")),
    _DD_EdgePositive_9_Grad(coupledGradient("DD_EdgePositive_9")),
    _DD_EdgePositive_10_Grad(coupledGradient("DD_EdgePositive_10")),
    _DD_EdgePositive_11_Grad(coupledGradient("DD_EdgePositive_11")),
    _DD_EdgePositive_12_Grad(coupledGradient("DD_EdgePositive_12")),
    //
    _DD_EdgeNegative_1_Grad(coupledGradient("DD_EdgeNegative_1")),
    _DD_EdgeNegative_2_Grad(coupledGradient("DD_EdgeNegative_2")),
    _DD_EdgeNegative_3_Grad(coupledGradient("DD_EdgeNegative_3")),
    _DD_EdgeNegative_4_Grad(coupledGradient("DD_EdgeNegative_4")),
    _DD_EdgeNegative_5_Grad(coupledGradient("DD_EdgeNegative_5")),
    _DD_EdgeNegative_6_Grad(coupledGradient("DD_EdgeNegative_6")),
    _DD_EdgeNegative_7_Grad(coupledGradient("DD_EdgeNegative_7")),
    _DD_EdgeNegative_8_Grad(coupledGradient("DD_EdgeNegative_8")),
    _DD_EdgeNegative_9_Grad(coupledGradient("DD_EdgeNegative_9")),
    _DD_EdgeNegative_10_Grad(coupledGradient("DD_EdgeNegative_10")),
    _DD_EdgeNegative_11_Grad(coupledGradient("DD_EdgeNegative_11")),
    _DD_EdgeNegative_12_Grad(coupledGradient("DD_EdgeNegative_12")),
    //
    _DD_ScrewPositive_1_Grad(coupledGradient("DD_ScrewPositive_1")),
    _DD_ScrewPositive_2_Grad(coupledGradient("DD_ScrewPositive_2")),
    _DD_ScrewPositive_3_Grad(coupledGradient("DD_ScrewPositive_3")),
    _DD_ScrewPositive_4_Grad(coupledGradient("DD_ScrewPositive_4")),
    _DD_ScrewPositive_5_Grad(coupledGradient("DD_ScrewPositive_5")),
    _DD_ScrewPositive_6_Grad(coupledGradient("DD_ScrewPositive_6")),
    _DD_ScrewPositive_7_Grad(coupledGradient("DD_ScrewPositive_7")),
    _DD_ScrewPositive_8_Grad(coupledGradient("DD_ScrewPositive_8")),
    _DD_ScrewPositive_9_Grad(coupledGradient("DD_ScrewPositive_9")),
    _DD_ScrewPositive_10_Grad(coupledGradient("DD_ScrewPositive_10")),
    _DD_ScrewPositive_11_Grad(coupledGradient("DD_ScrewPositive_11")),
    _DD_ScrewPositive_12_Grad(coupledGradient("DD_ScrewPositive_12")),
    //
    _DD_ScrewNegative_1_Grad(coupledGradient("DD_ScrewNegative_1")),
    _DD_ScrewNegative_2_Grad(coupledGradient("DD_ScrewNegative_2")),
    _DD_ScrewNegative_3_Grad(coupledGradient("DD_ScrewNegative_3")),
    _DD_ScrewNegative_4_Grad(coupledGradient("DD_ScrewNegative_4")),
    _DD_ScrewNegative_5_Grad(coupledGradient("DD_ScrewNegative_5")),
    _DD_ScrewNegative_6_Grad(coupledGradient("DD_ScrewNegative_6")),
    _DD_ScrewNegative_7_Grad(coupledGradient("DD_ScrewNegative_7")),
    _DD_ScrewNegative_8_Grad(coupledGradient("DD_ScrewNegative_8")),
    _DD_ScrewNegative_9_Grad(coupledGradient("DD_ScrewNegative_9")),
    _DD_ScrewNegative_10_Grad(coupledGradient("DD_ScrewNegative_10")),
    _DD_ScrewNegative_11_Grad(coupledGradient("DD_ScrewNegative_11")),
    _DD_ScrewNegative_12_Grad(coupledGradient("DD_ScrewNegative_12")),
    //
    _dislocation_immobile(declareProperty<std::vector<Real>>(_base_name + "dislocation_immobile")),
    _dislocation_immobile_old(
        getMaterialPropertyOld<std::vector<Real>>(_base_name + "dislocation_immobile")),
    _dislocation_immobile_edge_negative(
        declareProperty<std::vector<Real>>(_base_name + "dislocation_immobile_edge_negative")),
    _dislocation_immobile_edge_negative_old(getMaterialPropertyOld<std::vector<Real>>(
        _base_name + "dislocation_immobile_edge_negative")),
    _dislocation_immobile_screw_positive(
        declareProperty<std::vector<Real>>(_base_name + "dislocation_immobile_screw_positive")),
    _dislocation_immobile_screw_positive_old(getMaterialPropertyOld<std::vector<Real>>(
        _base_name + "dislocation_immobile_edge_negative")),
    _dislocation_immobile_screw_negative(
        declareProperty<std::vector<Real>>(_base_name + "dislocation_immobile_screw_negative")),
    _dislocation_immobile_screw_negative_old(getMaterialPropertyOld<std::vector<Real>>(
        _base_name + "dislocation_immobile_edge_negative")),
    _dislocation_mobile(declareProperty<std::vector<Real>>(_base_name + "dislocation_mobile")),
    _dislocation_mobile_edge(
        declareProperty<std::vector<Real>>(_base_name + "dislocation_mobile_edge")),
    _dislocation_mobile_screw(
        declareProperty<std::vector<Real>>(_base_name + "dislocation_mobile_screw")),
    _dislocation_mobile_old(
        getMaterialPropertyOld<std::vector<Real>>(_base_name + "dislocation_mobile")),
    _dislocation_mobile_edge_old(
        getMaterialPropertyOld<std::vector<Real>>(_base_name + "dislocation_mobile_edge")),
    _dislocation_mobile_screw_old(
        getMaterialPropertyOld<std::vector<Real>>(_base_name + "dislocation_mobile_screw")),
    //
    _dislo_velocity_edge(declareProperty<std::vector<Real>>(_base_name + "dislo_velocity_edge")),
    _dislo_velocity_edge_old(getMaterialPropertyOld<std::vector<Real>>("dislo_velocity_edge")),
    _dislo_velocity_screw(declareProperty<std::vector<Real>>(_base_name + "dislo_velocity_screw")),
    _dislo_velocity_screw_old(getMaterialPropertyOld<std::vector<Real>>("dislo_velocity_screw")),
    _tau_old(getMaterialPropertyOld<std::vector<Real>>("applied_shear_stress")),
    _GND_density(declareProperty<std::vector<Real>>(_base_name + "GND_density")),
    _tau_b(declareProperty<std::vector<Real>>(_base_name + "back_stress")),
    // DDC related variables
    _kappa(declareProperty<std::vector<Real>>(_base_name + "kappa")),
    _kappa_screw(declareProperty<std::vector<Real>>(_base_name + "kappa_screw")),
    _DD_grad(_number_slip_systems, 0.00),
    _DD_grad_screw(_number_slip_systems, 0.00),
    _tau_b_local(_number_slip_systems, 0.00),
    _tau_b_local_screw(_number_slip_systems, 0.00),
    // Dislocation densities arrays plus gradients
    _DD_EdgePositive(_number_slip_systems, 0.00),
    _DD_EdgeNegative(_number_slip_systems, 0.00),
    _DD_ScrewPositive(_number_slip_systems, 0.00),
    _DD_ScrewNegative(_number_slip_systems, 0.00),
    _DD_EdgePositive_Grad(_number_slip_systems, 0.00),
    _DD_EdgeNegative_Grad(_number_slip_systems, 0.00),
    _DD_ScrewPositive_Grad(_number_slip_systems, 0.00),
    _DD_ScrewNegative_Grad(_number_slip_systems, 0.00),
    // Other variables necessary for this model
    _slip_direction_edge(
        declareProperty<std::vector<RealVectorValue>>(_base_name + "slip_direction_edge")),
    _slip_direction_screw(
        declareProperty<std::vector<RealVectorValue>>(_base_name + "slip_direction_screw")),
    _slip_plane_normalboth(
        declareProperty<std::vector<RealVectorValue>>(_base_name + "slip_plane_normalboth")),
    //
    _crysrot(getMaterialProperty<RankTwoTensor>(_base_name + "crysrot")),
    // resize local caching vectors used for substepping
    _previous_substep_slip_resistance(_number_slip_systems, 0.00),
    _previous_substep_dislocation_mobile(_number_slip_systems, 0.00),
    _previous_substep_dislocation_mobile_edge(_number_slip_systems, 0.00),
    _previous_substep_dislocation_mobile_screw(_number_slip_systems, 0.00),
    _previous_substep_dislocation_immobile(_number_slip_systems, 0.00),
    _previous_substep_dislocation_immobile_edge_negative(_number_slip_systems, 0.00),
    _previous_substep_dislocation_immobile_screw_positive(_number_slip_systems, 0.00),
    _previous_substep_dislocation_immobile_screw_negative(_number_slip_systems, 0.00),
    //
    _slip_resistance_before_update(_number_slip_systems, 0.00),
    _dislocation_mobile_before_update(_number_slip_systems, 0.00),
    _dislocation_mobile_edge_before_update(_number_slip_systems, 0.00),
    _dislocation_mobile_screw_before_update(_number_slip_systems, 0.00),
    _dislocation_immobile_before_update(_number_slip_systems, 0.00),
    _dislocation_immobile_before_update_edge_negative(_number_slip_systems, 0.00),
    _dislocation_immobile_before_update_screw_positive(_number_slip_systems, 0.00),
    _dislocation_immobile_before_update_screw_negative(_number_slip_systems, 0.00),
    // resize vectors used in the consititutive slip hardening
    _hb(_number_slip_systems, 0.00),
    _slip_resistance_increment(_number_slip_systems, 0.00),
    _dislocation_mobile_increment(_number_slip_systems, 0.00),
    _dislocation_mobile_edge_increment(_number_slip_systems, 0.00),
    _dislocation_mobile_screw_increment(_number_slip_systems, 0.00),
    _dislocation_immobile_increment(_number_slip_systems, 0.00),
    _dislocation_immobile_increment_edge_negative(_number_slip_systems, 0.00),
    _dislocation_immobile_increment_screw_positive(_number_slip_systems, 0.00),
    _dislocation_immobile_increment_screw_negative(_number_slip_systems, 0.00),
    _dv_dtau(_number_slip_systems, 0.00),
    _dv_dtau_screw(_number_slip_systems, 0.00),
    _L_bar(_number_slip_systems, 0.00),
    _L_bar_e(getParam<Real>("L_bar_e")),
    _L_bar_s(getParam<Real>("L_bar_s")),
    _min_dd(getParam<Real>("min_dd")),
    _max_dd(getParam<Real>("max_dd")),
    // resize local variables realted to dislocation velocity
    t_wait(_number_slip_systems, 0.00),
    t_run(_number_slip_systems, 0.00),
    vel_run(_number_slip_systems, 0.00),
    dislocation_density(_number_slip_systems, 0.00),
    tau_b(_number_slip_systems, 0.00),
    xi0(_number_slip_systems, 0.00),
    tau_eff(_number_slip_systems, 0.00),
    tau_effAbs(_number_slip_systems, 0.00),
    tau_effSign(_number_slip_systems, 0.00),
    slip_r(_number_slip_systems, 0.00)
{
}

void
DiscoFluxCPOrowanStressUpdate::initQpStatefulProperties()
{
  CrystalPlasticityOrowanStressUpdateBase::initQpStatefulProperties();

  _slip_direction_edge[_qp].resize(_number_slip_systems);
  _slip_direction_screw[_qp].resize(_number_slip_systems);
  _slip_plane_normalboth[_qp].resize(_number_slip_systems);
  _dislocation_immobile[_qp].resize(_number_slip_systems);
  _dislocation_immobile_edge_negative[_qp].resize(_number_slip_systems);
  _dislocation_immobile_screw_negative[_qp].resize(_number_slip_systems);
  _dislocation_immobile_screw_positive[_qp].resize(_number_slip_systems);
  _dislocation_mobile[_qp].resize(_number_slip_systems);
  _dislocation_mobile_edge[_qp].resize(_number_slip_systems);
  _dislocation_mobile_screw[_qp].resize(_number_slip_systems);
  _dislo_velocity_edge[_qp].resize(_number_slip_systems);
  _dislo_velocity_screw[_qp].resize(_number_slip_systems);
  _kappa[_qp].resize(_number_slip_systems);
  _kappa_screw[_qp].resize(_number_slip_systems);
  _tau_b[_qp].resize(_number_slip_systems);

  _DD_EdgeNegative[0] = _DD_EdgeNegative_1[_qp];
  _DD_EdgeNegative[1] = _DD_EdgeNegative_2[_qp];
  _DD_EdgeNegative[2] = _DD_EdgeNegative_3[_qp];
  _DD_EdgeNegative[3] = _DD_EdgeNegative_4[_qp];
  _DD_EdgeNegative[4] = _DD_EdgeNegative_5[_qp];
  _DD_EdgeNegative[5] = _DD_EdgeNegative_6[_qp];
  _DD_EdgeNegative[6] = _DD_EdgeNegative_7[_qp];
  _DD_EdgeNegative[7] = _DD_EdgeNegative_8[_qp];
  _DD_EdgeNegative[8] = _DD_EdgeNegative_9[_qp];
  _DD_EdgeNegative[9] = _DD_EdgeNegative_10[_qp];
  _DD_EdgeNegative[10] = _DD_EdgeNegative_11[_qp];
  _DD_EdgeNegative[11] = _DD_EdgeNegative_12[_qp];

  _DD_EdgePositive[0] = _DD_EdgePositive_1[_qp];
  _DD_EdgePositive[1] = _DD_EdgePositive_2[_qp];
  _DD_EdgePositive[2] = _DD_EdgePositive_3[_qp];
  _DD_EdgePositive[3] = _DD_EdgePositive_4[_qp];
  _DD_EdgePositive[4] = _DD_EdgePositive_5[_qp];
  _DD_EdgePositive[5] = _DD_EdgePositive_6[_qp];
  _DD_EdgePositive[6] = _DD_EdgePositive_7[_qp];
  _DD_EdgePositive[7] = _DD_EdgePositive_8[_qp];
  _DD_EdgePositive[8] = _DD_EdgePositive_9[_qp];
  _DD_EdgePositive[9] = _DD_EdgePositive_10[_qp];
  _DD_EdgePositive[10] = _DD_EdgePositive_11[_qp];
  _DD_EdgePositive[11] = _DD_EdgePositive_12[_qp];

  _DD_ScrewNegative[0] = _DD_ScrewNegative_1[_qp];
  _DD_ScrewNegative[1] = _DD_ScrewNegative_2[_qp];
  _DD_ScrewNegative[2] = _DD_ScrewNegative_3[_qp];
  _DD_ScrewNegative[3] = _DD_ScrewNegative_4[_qp];
  _DD_ScrewNegative[4] = _DD_ScrewNegative_5[_qp];
  _DD_ScrewNegative[5] = _DD_ScrewNegative_6[_qp];
  _DD_ScrewNegative[6] = _DD_ScrewNegative_7[_qp];
  _DD_ScrewNegative[7] = _DD_ScrewNegative_8[_qp];
  _DD_ScrewNegative[8] = _DD_ScrewNegative_9[_qp];
  _DD_ScrewNegative[9] = _DD_ScrewNegative_10[_qp];
  _DD_ScrewNegative[10] = _DD_ScrewNegative_11[_qp];
  _DD_ScrewNegative[11] = _DD_ScrewNegative_12[_qp];

  _DD_ScrewPositive[0] = _DD_ScrewPositive_1[_qp];
  _DD_ScrewPositive[1] = _DD_ScrewPositive_2[_qp];
  _DD_ScrewPositive[2] = _DD_ScrewPositive_3[_qp];
  _DD_ScrewPositive[3] = _DD_ScrewPositive_4[_qp];
  _DD_ScrewPositive[4] = _DD_ScrewPositive_5[_qp];
  _DD_ScrewPositive[5] = _DD_ScrewPositive_6[_qp];
  _DD_ScrewPositive[6] = _DD_ScrewPositive_7[_qp];
  _DD_ScrewPositive[7] = _DD_ScrewPositive_8[_qp];
  _DD_ScrewPositive[8] = _DD_ScrewPositive_9[_qp];
  _DD_ScrewPositive[9] = _DD_ScrewPositive_10[_qp];
  _DD_ScrewPositive[10] = _DD_ScrewPositive_11[_qp];
  _DD_ScrewPositive[11] = _DD_ScrewPositive_12[_qp];

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    //   _slip_direction_edge[_qp][i].zero();
    //   _slip_direction_screw[_qp][i].zero();
    //   _slip_plane_normalboth[_qp][i].zero();
    _slip_direction_edge[_qp][i] = _slip_direction[i];
    _slip_direction_edge[_qp][i] /= _slip_direction_edge[_qp][i].norm();

    _slip_plane_normalboth[_qp][i] = _slip_plane_normal[i];
    _slip_plane_normalboth[_qp][i] /= _slip_plane_normalboth[_qp][i].norm();

    _slip_direction_screw[_qp][i] =
        _slip_plane_normalboth[_qp][i].cross(_slip_direction_edge[_qp][i]);
    _slip_direction_screw[_qp][i] /= _slip_direction_screw[_qp][i].norm();

    _slip_resistance[_qp][i] = _lattice_friction;
    _slip_increment[_qp][i] = 0.0;

    // _dislocation_mobile[_qp][i] =
    //     (_DD_EdgeNegative[i] + _DD_EdgePositive[i]) *
    //     _dislo_density_factor_CDT;
    _dislocation_mobile[_qp][i] =
        (_DD_EdgeNegative[i] + _DD_EdgePositive[i] + _DD_ScrewPositive[i] + _DD_ScrewNegative[i]) *
        _dislo_density_factor_CDT;
    _dislocation_mobile_edge[_qp][i] =
        (_DD_EdgeNegative[i] + _DD_EdgePositive[i]) * _dislo_density_factor_CDT;
    _dislocation_mobile_screw[_qp][i] =
        (_DD_ScrewPositive[i] + _DD_ScrewNegative[i]) * _dislo_density_factor_CDT;

    _dislocation_immobile[_qp][i] = _dislo_density_initial * 0.25;
    _dislocation_immobile_edge_negative[_qp][i] = _dislo_density_initial * 0.25;
    _dislocation_immobile_screw_positive[_qp][i] = _dislo_density_initial * 0.25;
    _dislocation_immobile_screw_negative[_qp][i] = _dislo_density_initial * 0.25;
    _dislo_velocity_edge[_qp][i] = 0.00;
    _dislo_velocity_screw[_qp][i] = 0.00;
    _kappa[_qp][i] = 0.0;
    _kappa_screw[_qp][i] = 0.0;
    // _L_bar_e[i] = _Coeff_dislength * std::pow((_DD_EdgePositive[i] + _DD_EdgeNegative[i] +
    //               _dislocation_immobile_edge_negative[_qp][i] +
    //               _dislocation_immobile[_qp][i]),-0.5);
    // _L_bar_s[i] = _Coeff_dislength * std::pow((_DD_ScrewPositive[i] + _DD_ScrewNegative[i] +
    //               _dislocation_immobile_screw_negative[_qp][i] +
    //               _dislocation_immobile_screw_positive[_qp][i]),-0.5);
  }
}

void
DiscoFluxCPOrowanStressUpdate::setInitialConstitutiveVariableValues()
{
  storeDislocationMobilityInformation();
  _slip_resistance[_qp] = _slip_resistance_old[_qp];
  _previous_substep_slip_resistance = _slip_resistance_old[_qp];

  _DD_EdgeNegative[0] = _DD_EdgeNegative_1[_qp];
  _DD_EdgeNegative[1] = _DD_EdgeNegative_2[_qp];
  _DD_EdgeNegative[2] = _DD_EdgeNegative_3[_qp];
  _DD_EdgeNegative[3] = _DD_EdgeNegative_4[_qp];
  _DD_EdgeNegative[4] = _DD_EdgeNegative_5[_qp];
  _DD_EdgeNegative[5] = _DD_EdgeNegative_6[_qp];
  _DD_EdgeNegative[6] = _DD_EdgeNegative_7[_qp];
  _DD_EdgeNegative[7] = _DD_EdgeNegative_8[_qp];
  _DD_EdgeNegative[8] = _DD_EdgeNegative_9[_qp];
  _DD_EdgeNegative[9] = _DD_EdgeNegative_10[_qp];
  _DD_EdgeNegative[10] = _DD_EdgeNegative_11[_qp];
  _DD_EdgeNegative[11] = _DD_EdgeNegative_12[_qp];

  _DD_EdgePositive[0] = _DD_EdgePositive_1[_qp];
  _DD_EdgePositive[1] = _DD_EdgePositive_2[_qp];
  _DD_EdgePositive[2] = _DD_EdgePositive_3[_qp];
  _DD_EdgePositive[3] = _DD_EdgePositive_4[_qp];
  _DD_EdgePositive[4] = _DD_EdgePositive_5[_qp];
  _DD_EdgePositive[5] = _DD_EdgePositive_6[_qp];
  _DD_EdgePositive[6] = _DD_EdgePositive_7[_qp];
  _DD_EdgePositive[7] = _DD_EdgePositive_8[_qp];
  _DD_EdgePositive[8] = _DD_EdgePositive_9[_qp];
  _DD_EdgePositive[9] = _DD_EdgePositive_10[_qp];
  _DD_EdgePositive[10] = _DD_EdgePositive_11[_qp];
  _DD_EdgePositive[11] = _DD_EdgePositive_12[_qp];

  _DD_ScrewNegative[0] = _DD_ScrewNegative_1[_qp];
  _DD_ScrewNegative[1] = _DD_ScrewNegative_2[_qp];
  _DD_ScrewNegative[2] = _DD_ScrewNegative_3[_qp];
  _DD_ScrewNegative[3] = _DD_ScrewNegative_4[_qp];
  _DD_ScrewNegative[4] = _DD_ScrewNegative_5[_qp];
  _DD_ScrewNegative[5] = _DD_ScrewNegative_6[_qp];
  _DD_ScrewNegative[6] = _DD_ScrewNegative_7[_qp];
  _DD_ScrewNegative[7] = _DD_ScrewNegative_8[_qp];
  _DD_ScrewNegative[8] = _DD_ScrewNegative_9[_qp];
  _DD_ScrewNegative[9] = _DD_ScrewNegative_10[_qp];
  _DD_ScrewNegative[10] = _DD_ScrewNegative_11[_qp];
  _DD_ScrewNegative[11] = _DD_ScrewNegative_12[_qp];

  _DD_ScrewPositive[0] = _DD_ScrewPositive_1[_qp];
  _DD_ScrewPositive[1] = _DD_ScrewPositive_2[_qp];
  _DD_ScrewPositive[2] = _DD_ScrewPositive_3[_qp];
  _DD_ScrewPositive[3] = _DD_ScrewPositive_4[_qp];
  _DD_ScrewPositive[4] = _DD_ScrewPositive_5[_qp];
  _DD_ScrewPositive[5] = _DD_ScrewPositive_6[_qp];
  _DD_ScrewPositive[6] = _DD_ScrewPositive_7[_qp];
  _DD_ScrewPositive[7] = _DD_ScrewPositive_8[_qp];
  _DD_ScrewPositive[8] = _DD_ScrewPositive_9[_qp];
  _DD_ScrewPositive[9] = _DD_ScrewPositive_10[_qp];
  _DD_ScrewPositive[10] = _DD_ScrewPositive_11[_qp];
  _DD_ScrewPositive[11] = _DD_ScrewPositive_12[_qp];

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    // _dislocation_mobile[_qp][i] = (_DD_EdgePositive[_qp][i] + _DD_EdgeNegative[_qp][i] +
    // _DD_ScrewPositive[_qp][i] + _DD_ScrewNegative[_qp][i]) * _dislo_density_factor_CDT;
    // _dislocation_mobile[_qp][i] =
    //     (_DD_EdgePositive[i] + _DD_EdgeNegative[i]) * _dislo_density_factor_CDT;
    _dislocation_mobile[_qp][i] =
        (_DD_EdgePositive[i] + _DD_EdgeNegative[i] + _DD_ScrewPositive[i] + _DD_ScrewNegative[i]) *
        _dislo_density_factor_CDT;
    _dislocation_mobile_edge[_qp][i] =
        (_DD_EdgePositive[i] + _DD_EdgeNegative[i]) * _dislo_density_factor_CDT;
    _dislocation_mobile_screw[_qp][i] =
        (_DD_ScrewPositive[i] + _DD_ScrewNegative[i]) * _dislo_density_factor_CDT;

    _previous_substep_dislocation_mobile[i] = _dislocation_mobile[_qp][i];
    _previous_substep_dislocation_mobile_edge[i] = _dislocation_mobile_edge[_qp][i];
    _previous_substep_dislocation_mobile_screw[i] = _dislocation_mobile_screw[_qp][i];
  }
  _dislocation_immobile[_qp] = _dislocation_immobile_old[_qp];
  _dislocation_immobile_edge_negative[_qp] = _dislocation_immobile_edge_negative_old[_qp];
  _dislocation_immobile_screw_positive[_qp] = _dislocation_immobile_screw_positive_old[_qp];
  _dislocation_immobile_screw_negative[_qp] = _dislocation_immobile_screw_negative_old[_qp];
  _previous_substep_dislocation_immobile = _dislocation_immobile_old[_qp];
  _previous_substep_dislocation_immobile_edge_negative =
      _dislocation_immobile_edge_negative_old[_qp];
  _previous_substep_dislocation_immobile_screw_positive =
      _dislocation_immobile_screw_positive_old[_qp];
  _previous_substep_dislocation_immobile_screw_negative =
      _dislocation_immobile_screw_negative_old[_qp];
}

void
DiscoFluxCPOrowanStressUpdate::storeDislocationMobilityInformation()
{
  // CrystalPlasticityOrowanStressUpdateBase::storeDislocationMobilityInformation();
  for (const auto i : make_range(_number_slip_systems))
  {
    _slip_direction_edge[_qp][i] = _slip_direction[i];
    _slip_direction_edge[_qp][i] /= _slip_direction_edge[_qp][i].norm();
    _slip_direction_edge[_qp][i] = _crysrot[_qp] * _slip_direction_edge[_qp][i];

    _slip_plane_normalboth[_qp][i] = _slip_plane_normal[i];
    _slip_plane_normalboth[_qp][i] /= _slip_plane_normalboth[_qp][i].norm();
    _slip_plane_normalboth[_qp][i] = _crysrot[_qp] * _slip_plane_normalboth[_qp][i];
  }
}

void
DiscoFluxCPOrowanStressUpdate::setSubstepConstitutiveVariableValues()
{
  _slip_resistance[_qp] = _previous_substep_slip_resistance;
  _dislocation_immobile[_qp] = _previous_substep_dislocation_immobile;
  _dislocation_immobile[_qp] = _previous_substep_dislocation_immobile_edge_negative;
  _dislocation_immobile[_qp] = _previous_substep_dislocation_immobile_screw_positive;
  _dislocation_immobile[_qp] = _previous_substep_dislocation_immobile_screw_negative;
  _dislocation_mobile[_qp] = _previous_substep_dislocation_mobile;
  _dislocation_mobile_edge[_qp] = _previous_substep_dislocation_mobile_edge;
  _dislocation_mobile_screw[_qp] = _previous_substep_dislocation_mobile_screw;
}

bool
DiscoFluxCPOrowanStressUpdate::calculateSlipRate()
{
  _DD_EdgeNegative[0] = _DD_EdgeNegative_1[_qp];
  _DD_EdgeNegative[1] = _DD_EdgeNegative_2[_qp];
  _DD_EdgeNegative[2] = _DD_EdgeNegative_3[_qp];
  _DD_EdgeNegative[3] = _DD_EdgeNegative_4[_qp];
  _DD_EdgeNegative[4] = _DD_EdgeNegative_5[_qp];
  _DD_EdgeNegative[5] = _DD_EdgeNegative_6[_qp];
  _DD_EdgeNegative[6] = _DD_EdgeNegative_7[_qp];
  _DD_EdgeNegative[7] = _DD_EdgeNegative_8[_qp];
  _DD_EdgeNegative[8] = _DD_EdgeNegative_9[_qp];
  _DD_EdgeNegative[9] = _DD_EdgeNegative_10[_qp];
  _DD_EdgeNegative[10] = _DD_EdgeNegative_11[_qp];
  _DD_EdgeNegative[11] = _DD_EdgeNegative_12[_qp];

  _DD_EdgePositive[0] = _DD_EdgePositive_1[_qp];
  _DD_EdgePositive[1] = _DD_EdgePositive_2[_qp];
  _DD_EdgePositive[2] = _DD_EdgePositive_3[_qp];
  _DD_EdgePositive[3] = _DD_EdgePositive_4[_qp];
  _DD_EdgePositive[4] = _DD_EdgePositive_5[_qp];
  _DD_EdgePositive[5] = _DD_EdgePositive_6[_qp];
  _DD_EdgePositive[6] = _DD_EdgePositive_7[_qp];
  _DD_EdgePositive[7] = _DD_EdgePositive_8[_qp];
  _DD_EdgePositive[8] = _DD_EdgePositive_9[_qp];
  _DD_EdgePositive[9] = _DD_EdgePositive_10[_qp];
  _DD_EdgePositive[10] = _DD_EdgePositive_11[_qp];
  _DD_EdgePositive[11] = _DD_EdgePositive_12[_qp];

  _DD_ScrewNegative[0] = _DD_ScrewNegative_1[_qp];
  _DD_ScrewNegative[1] = _DD_ScrewNegative_2[_qp];
  _DD_ScrewNegative[2] = _DD_ScrewNegative_3[_qp];
  _DD_ScrewNegative[3] = _DD_ScrewNegative_4[_qp];
  _DD_ScrewNegative[4] = _DD_ScrewNegative_5[_qp];
  _DD_ScrewNegative[5] = _DD_ScrewNegative_6[_qp];
  _DD_ScrewNegative[6] = _DD_ScrewNegative_7[_qp];
  _DD_ScrewNegative[7] = _DD_ScrewNegative_8[_qp];
  _DD_ScrewNegative[8] = _DD_ScrewNegative_9[_qp];
  _DD_ScrewNegative[9] = _DD_ScrewNegative_10[_qp];
  _DD_ScrewNegative[10] = _DD_ScrewNegative_11[_qp];
  _DD_ScrewNegative[11] = _DD_ScrewNegative_12[_qp];

  _DD_ScrewPositive[0] = _DD_ScrewPositive_1[_qp];
  _DD_ScrewPositive[1] = _DD_ScrewPositive_2[_qp];
  _DD_ScrewPositive[2] = _DD_ScrewPositive_3[_qp];
  _DD_ScrewPositive[3] = _DD_ScrewPositive_4[_qp];
  _DD_ScrewPositive[4] = _DD_ScrewPositive_5[_qp];
  _DD_ScrewPositive[5] = _DD_ScrewPositive_6[_qp];
  _DD_ScrewPositive[6] = _DD_ScrewPositive_7[_qp];
  _DD_ScrewPositive[7] = _DD_ScrewPositive_8[_qp];
  _DD_ScrewPositive[8] = _DD_ScrewPositive_9[_qp];
  _DD_ScrewPositive[9] = _DD_ScrewPositive_10[_qp];
  _DD_ScrewPositive[10] = _DD_ScrewPositive_11[_qp];
  _DD_ScrewPositive[11] = _DD_ScrewPositive_12[_qp];

  _DD_EdgeNegative_Grad[0] = _DD_EdgeNegative_1_Grad[_qp];
  _DD_EdgeNegative_Grad[1] = _DD_EdgeNegative_2_Grad[_qp];
  _DD_EdgeNegative_Grad[2] = _DD_EdgeNegative_3_Grad[_qp];
  _DD_EdgeNegative_Grad[3] = _DD_EdgeNegative_4_Grad[_qp];
  _DD_EdgeNegative_Grad[4] = _DD_EdgeNegative_5_Grad[_qp];
  _DD_EdgeNegative_Grad[5] = _DD_EdgeNegative_6_Grad[_qp];
  _DD_EdgeNegative_Grad[6] = _DD_EdgeNegative_7_Grad[_qp];
  _DD_EdgeNegative_Grad[7] = _DD_EdgeNegative_8_Grad[_qp];
  _DD_EdgeNegative_Grad[8] = _DD_EdgeNegative_9_Grad[_qp];
  _DD_EdgeNegative_Grad[9] = _DD_EdgeNegative_10_Grad[_qp];
  _DD_EdgeNegative_Grad[10] = _DD_EdgeNegative_11_Grad[_qp];
  _DD_EdgeNegative_Grad[11] = _DD_EdgeNegative_12_Grad[_qp];

  _DD_EdgePositive_Grad[0] = _DD_EdgePositive_1_Grad[_qp];
  _DD_EdgePositive_Grad[1] = _DD_EdgePositive_2_Grad[_qp];
  _DD_EdgePositive_Grad[2] = _DD_EdgePositive_3_Grad[_qp];
  _DD_EdgePositive_Grad[3] = _DD_EdgePositive_4_Grad[_qp];
  _DD_EdgePositive_Grad[4] = _DD_EdgePositive_5_Grad[_qp];
  _DD_EdgePositive_Grad[5] = _DD_EdgePositive_6_Grad[_qp];
  _DD_EdgePositive_Grad[6] = _DD_EdgePositive_7_Grad[_qp];
  _DD_EdgePositive_Grad[7] = _DD_EdgePositive_8_Grad[_qp];
  _DD_EdgePositive_Grad[8] = _DD_EdgePositive_9_Grad[_qp];
  _DD_EdgePositive_Grad[9] = _DD_EdgePositive_10_Grad[_qp];
  _DD_EdgePositive_Grad[10] = _DD_EdgePositive_11_Grad[_qp];
  _DD_EdgePositive_Grad[11] = _DD_EdgePositive_12_Grad[_qp];

  _DD_ScrewNegative_Grad[0] = _DD_ScrewNegative_1_Grad[_qp];
  _DD_ScrewNegative_Grad[1] = _DD_ScrewNegative_2_Grad[_qp];
  _DD_ScrewNegative_Grad[2] = _DD_ScrewNegative_3_Grad[_qp];
  _DD_ScrewNegative_Grad[3] = _DD_ScrewNegative_4_Grad[_qp];
  _DD_ScrewNegative_Grad[4] = _DD_ScrewNegative_5_Grad[_qp];
  _DD_ScrewNegative_Grad[5] = _DD_ScrewNegative_6_Grad[_qp];
  _DD_ScrewNegative_Grad[6] = _DD_ScrewNegative_7_Grad[_qp];
  _DD_ScrewNegative_Grad[7] = _DD_ScrewNegative_8_Grad[_qp];
  _DD_ScrewNegative_Grad[8] = _DD_ScrewNegative_9_Grad[_qp];
  _DD_ScrewNegative_Grad[9] = _DD_ScrewNegative_10_Grad[_qp];
  _DD_ScrewNegative_Grad[10] = _DD_ScrewNegative_11_Grad[_qp];
  _DD_ScrewNegative_Grad[11] = _DD_ScrewNegative_12_Grad[_qp];

  _DD_ScrewPositive_Grad[0] = _DD_ScrewPositive_1_Grad[_qp];
  _DD_ScrewPositive_Grad[1] = _DD_ScrewPositive_2_Grad[_qp];
  _DD_ScrewPositive_Grad[2] = _DD_ScrewPositive_3_Grad[_qp];
  _DD_ScrewPositive_Grad[3] = _DD_ScrewPositive_4_Grad[_qp];
  _DD_ScrewPositive_Grad[4] = _DD_ScrewPositive_5_Grad[_qp];
  _DD_ScrewPositive_Grad[5] = _DD_ScrewPositive_6_Grad[_qp];
  _DD_ScrewPositive_Grad[6] = _DD_ScrewPositive_7_Grad[_qp];
  _DD_ScrewPositive_Grad[7] = _DD_ScrewPositive_8_Grad[_qp];
  _DD_ScrewPositive_Grad[8] = _DD_ScrewPositive_9_Grad[_qp];
  _DD_ScrewPositive_Grad[9] = _DD_ScrewPositive_10_Grad[_qp];
  _DD_ScrewPositive_Grad[10] = _DD_ScrewPositive_11_Grad[_qp];
  _DD_ScrewPositive_Grad[11] = _DD_ScrewPositive_12_Grad[_qp];
  // compute dislocation velocity according to DiscoFlux material model
  DDCUpdate();
  getDisloVelocity();

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    // _slip_increment[_qp][i] = (_DD_EdgePositive[i] + _DD_EdgeNegative[i]) *
    //                           _dislo_density_factor_CDT * _burgers_vector_mag *
    //                           _dislo_velocity_edge[_qp][i];
    _slip_increment[_qp][i] =
        ((_DD_EdgePositive[i] + _DD_EdgeNegative[i]) * _dislo_velocity_edge[_qp][i] +
         (_DD_ScrewPositive[i] + _DD_ScrewNegative[i]) * _dislo_velocity_screw[_qp][i]) *
        _dislo_density_factor_CDT * _burgers_vector_mag;
    // _slip_increment[_qp][i] = _dislocation_mobile[_qp][i] * _burgers_vector_mag *
    // _dislo_velocity_edge[_qp][i];

    if (std::abs(_slip_increment[_qp][i]) * _substep_dt > _slip_incr_tol)
    {
      // if (_print_convergence_message)
      mooseWarning("Maximum allowable slip increment exceeded ",
                   std::abs(_slip_increment[_qp][i]) * _substep_dt);

      return false;
    }
  }
  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    _tau_b[_qp][i] = _tau_b_local[i];
    _kappa[_qp][i] = (_DD_EdgePositive[i] - _DD_EdgeNegative[i]) * _dislo_density_factor_CDT;
    _kappa_screw[_qp][i] =
        (_DD_ScrewPositive[i] - _DD_ScrewNegative[i]) * _dislo_density_factor_CDT;
  }
  return true;
}

void
DiscoFluxCPOrowanStressUpdate::calculateConstitutiveSlipDerivative(std::vector<Real> & dslip_dtau)
{
  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    if (MooseUtils::absoluteFuzzyEqual(_tau[_qp][i], 0.0))
      dslip_dtau[i] = 0.0;
    else
    {
      dslip_dtau[i] = ((_DD_EdgePositive[i] + _DD_EdgeNegative[i]) * _dv_dtau[i] +
                       (_DD_ScrewPositive[i] + _DD_ScrewNegative[i]) * _dv_dtau_screw[i]) *
                      _dislo_density_factor_CDT * _burgers_vector_mag;
    }
  }
}

void
DiscoFluxCPOrowanStressUpdate::cacheStateVariablesBeforeUpdate()
{
  _slip_resistance_before_update = _slip_resistance[_qp];
  _dislocation_immobile_before_update = _dislocation_immobile[_qp];
  _dislocation_immobile_before_update_edge_negative = _dislocation_immobile_edge_negative[_qp];
  _dislocation_immobile_before_update_screw_positive = _dislocation_immobile_screw_positive[_qp];
  _dislocation_immobile_before_update_screw_negative = _dislocation_immobile_screw_negative[_qp];
  _dislocation_mobile_before_update = _dislocation_mobile[_qp];
  _dislocation_mobile_edge_before_update = _dislocation_mobile_edge[_qp];
  _dislocation_mobile_screw_before_update = _dislocation_mobile_screw[_qp];
}

void
DiscoFluxCPOrowanStressUpdate::calculateStateVariableEvolutionRateComponent()
{
  // calculate dislocation density increment
  getDDIncrements();
}

// Calculate Dislocation Density increment
void
DiscoFluxCPOrowanStressUpdate::getDDIncrements()
{
  Real small2 = 1.0e-5;
  Real A_f_ij, dislocation_forest;

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    // _dislocation_mobile_increment[i] = 0.00;
    _dislocation_immobile_increment[i] = 0.00;
    _dislocation_immobile_increment_edge_negative[i] = 0.00;
    _dislocation_immobile_increment_screw_positive[i] = 0.00;
    _dislocation_immobile_increment_screw_negative[i] = 0.00;
    dislocation_forest = 0.00;
    for (unsigned int j = 0; j < _number_slip_systems; ++j)
    {
      // Edge contribution
      A_f_ij = 0.5 * std::abs(_slip_plane_normalboth[_qp][i] *
                              (_slip_plane_normalboth[_qp][j].cross(_slip_direction_edge[_qp][j])));
      dislocation_forest +=
          A_f_ij * (_dislocation_mobile_edge[_qp][j] + _dislocation_immobile[_qp][j] +
                    _dislocation_immobile_edge_negative[_qp][j]);
      // Screw contribution
      A_f_ij = 0.5 * std::abs(_slip_plane_normalboth[_qp][i] * (_slip_direction_edge[_qp][j]));
      dislocation_forest += A_f_ij * (_dislocation_mobile_screw[_qp][j] +
                                      _dislocation_immobile_screw_positive[_qp][j] +
                                      _dislocation_immobile_screw_negative[_qp][j]);
    }

    if (std::abs(_slip_increment[_qp][i]) > small2)
    {
      // _dislocation_immobile_increment[i] =
      //     (_C_trap / _burgers_vector_mag) * std::pow(dislocation_forest, 0.5) *
      //         std::abs(_slip_increment[_qp][i]) -
      //     (_C_im_ann * _dislocation_immobile[_qp][i]) * std::abs(_slip_increment[_qp][i]);
      _dislocation_immobile_increment[i] =
          _C_trap * std::pow(dislocation_forest, 0.5) *
              std::abs(_DD_EdgePositive[i] * _dislo_velocity_edge[_qp][i]) -
          (0.25 * _C_im_ann * std::pow(dislocation_forest, 0.5) / _dd_sat) * _DD_EdgePositive[i] *
              _DD_EdgePositive[i] * std::abs(_dislo_velocity_edge[_qp][i]);
      _dislocation_immobile_increment_edge_negative[i] =
          _C_trap * std::pow(dislocation_forest, 0.5) *
              std::abs(_DD_EdgeNegative[i] * _dislo_velocity_edge[_qp][i]) -
          (0.25 * _C_im_ann * std::pow(dislocation_forest, 0.5) / _dd_sat) * _DD_EdgeNegative[i] *
              _DD_EdgeNegative[i] * std::abs(_dislo_velocity_edge[_qp][i]);
      _dislocation_immobile_increment_screw_positive[i] =
          _C_trap * std::pow(dislocation_forest, 0.5) *
              std::abs(_DD_ScrewPositive[i] * _dislo_velocity_screw[_qp][i]) -
          (0.25 * _C_im_ann * std::pow(dislocation_forest, 0.5) / _dd_sat) * _DD_ScrewPositive[i] *
              _DD_ScrewPositive[i] * std::abs(_dislo_velocity_screw[_qp][i]);
      _dislocation_immobile_increment_screw_negative[i] =
          _C_trap * std::pow(dislocation_forest, 0.5) *
              std::abs(_DD_ScrewNegative[i] * _dislo_velocity_screw[_qp][i]) -
          (0.25 * _C_im_ann * std::pow(dislocation_forest, 0.5) / _dd_sat) * _DD_ScrewNegative[i] *
              _DD_ScrewNegative[i] * std::abs(_dislo_velocity_screw[_qp][i]);
    }
    else
    {
      // _dislocation_mobile_increment[i] = 0.0;
      _dislocation_immobile_increment[i] = 0.0;
      _dislocation_immobile_increment_edge_negative[i] = 0.0;
      _dislocation_immobile_increment_screw_positive[i] = 0.0;
      _dislocation_immobile_increment_screw_negative[i] = 0.0;
    }
  }
}

bool
DiscoFluxCPOrowanStressUpdate::updateStateVariables()
{
  Real Hij, eff_dislocation_density = 0.00;

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    _dislocation_immobile[_qp][i] = _previous_substep_dislocation_immobile[i] +
                                    _dislocation_immobile_increment[i] * _substep_dt;
    _dislocation_immobile_edge_negative[_qp][i] =
        _previous_substep_dislocation_immobile_edge_negative[i] +
        _dislocation_immobile_increment_edge_negative[i] * _substep_dt;
    _dislocation_immobile_screw_positive[_qp][i] =
        _previous_substep_dislocation_immobile_screw_positive[i] +
        _dislocation_immobile_increment_screw_positive[i] * _substep_dt;
    _dislocation_immobile_screw_negative[_qp][i] =
        _previous_substep_dislocation_immobile_screw_negative[i] +
        _dislocation_immobile_increment_screw_negative[i] * _substep_dt;
    // Necessary to update mobile dislocation
    _dislocation_mobile[_qp][i] =
        (_DD_EdgePositive[i] + _DD_EdgeNegative[i] + _DD_ScrewPositive[i] + _DD_ScrewNegative[i]) *
        _dislo_density_factor_CDT;
    _dislocation_mobile_screw[_qp][i] =
        (_DD_ScrewPositive[i] + _DD_ScrewNegative[i]) * _dislo_density_factor_CDT;
    _dislocation_mobile_edge[_qp][i] =
        (_DD_EdgePositive[i] + _DD_EdgeNegative[i]) * _dislo_density_factor_CDT;
  }

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    eff_dislocation_density = 0.00;
    for (unsigned int j = 0; j < _number_slip_systems; ++j)
    {
      if (i == j ? Hij = 1.0 : Hij = 0.1)
        // similar proportion of mobile and immobile dislocations:
        eff_dislocation_density +=
            Hij * (_dislocation_mobile[_qp][j] + _dislocation_immobile[_qp][j] +
                   _dislocation_immobile_edge_negative[_qp][j] +
                   _dislocation_immobile_screw_positive[_qp][j] +
                   _dislocation_immobile_screw_negative[_qp][j]);
    }
    _slip_resistance[_qp][i] = _lattice_friction + _Coeff_hardening * _mu * _burgers_vector_mag *
                                                       std::sqrt(eff_dislocation_density);
  }

  return true;
}

bool
DiscoFluxCPOrowanStressUpdate::areConstitutiveStateVariablesConverged()
{
  bool flagSlipResistanceConverged;

  // Check convergence of _slip_resistance
  flagSlipResistanceConverged =
      isConstitutiveStateVariableConverged(_slip_resistance[_qp],
                                           _slip_resistance_before_update,
                                           _previous_substep_slip_resistance,
                                           _resistance_tol);

  return flagSlipResistanceConverged;
}

void
DiscoFluxCPOrowanStressUpdate::updateSubstepConstitutiveVariableValues()
{
  _previous_substep_slip_resistance = _slip_resistance[_qp];
  _previous_substep_dislocation_immobile = _dislocation_immobile[_qp];
  _previous_substep_dislocation_immobile_edge_negative = _dislocation_immobile_edge_negative[_qp];
  _previous_substep_dislocation_immobile_screw_positive = _dislocation_immobile_screw_positive[_qp];
  _previous_substep_dislocation_immobile_screw_negative = _dislocation_immobile_screw_negative[_qp];
}

//----Compute the back stress based on Dislocation Deformation Compatibility(DDC)
void
DiscoFluxCPOrowanStressUpdate::DDCUpdate()
{
  Stress_internal.zero();

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    slip_direction_rotated = _slip_direction_edge[_qp][i];      //_slip_direction[i];
    slip_plane_normal_rotated = _slip_plane_normalboth[_qp][i]; //_slip_plane_normal[i];
    slip_direction_rotated_screw = _slip_direction_screw[_qp][i];
    // Compute gradient of GNDs
    _DD_grad[i](0) =
        (_DD_EdgePositive_Grad[i](0) - _DD_EdgeNegative_Grad[i](0)) * _dislo_density_factor_CDT;
    _DD_grad[i](1) =
        (_DD_EdgePositive_Grad[i](1) - _DD_EdgeNegative_Grad[i](1)) * _dislo_density_factor_CDT;
    _DD_grad[i](2) =
        (_DD_EdgePositive_Grad[i](2) - _DD_EdgeNegative_Grad[i](2)) * _dislo_density_factor_CDT;
    _DD_grad_screw[i](0) =
        (_DD_ScrewPositive_Grad[i](0) - _DD_ScrewNegative_Grad[i](0)) * _dislo_density_factor_CDT;
    _DD_grad_screw[i](1) =
        (_DD_ScrewPositive_Grad[i](1) - _DD_ScrewNegative_Grad[i](1)) * _dislo_density_factor_CDT;
    _DD_grad_screw[i](2) =
        (_DD_ScrewPositive_Grad[i](2) - _DD_ScrewNegative_Grad[i](2)) * _dislo_density_factor_CDT;
    if (_mean_free_path_init_flag)
    {
      // Compute local internal stress
      _tau_b_local[i] = _Coeff_backstress *
                        ((_mu * std::pow(_L_bar_e, 2)) / (2 * 3.141 * (1 - _nu))) *
                        _burgers_vector_mag * (_DD_grad[i] * slip_direction_rotated);
      _tau_b_local_screw[i] = _Coeff_backstress * ((_mu * std::pow(_L_bar_s, 2)) / (2 * 3.141)) *
                              _burgers_vector_mag *
                              (_DD_grad_screw[i] * slip_direction_rotated_screw);
      if (_L_bar_e <= 0.0 || _L_bar_s <= 0.0)
      {
        // if (_print_convergence_message)
        mooseWarning("Mean edge free path is not correct ", _L_bar_e);
        mooseWarning("or mean screw free path is not correct ", _L_bar_s);
      }
    }
    else
    {
      _L_bar[i] =
          _Coeff_dislength * std::pow((_dislocation_mobile[_qp][i] + _dislocation_immobile[_qp][i] +
                                       _dislocation_immobile_edge_negative[_qp][i] +
                                       _dislocation_immobile_screw_positive[_qp][i] +
                                       _dislocation_immobile_screw_negative[_qp][i]),
                                      -0.5);
      // Compute local internal stress
      _tau_b_local[i] = _Coeff_backstress *
                        ((_mu * std::pow(_L_bar[i], 1)) / (2 * 3.141 * (1 - _nu))) *
                        _burgers_vector_mag * (_DD_grad[i] * slip_direction_rotated);
      _tau_b_local_screw[i] = _Coeff_backstress * ((_mu * std::pow(_L_bar[i], 1)) / (2 * 3.141)) *
                              _burgers_vector_mag *
                              (_DD_grad_screw[i] * slip_direction_rotated_screw);
    }
    // Compute total internal stress
    Stress_internal += (_tau_b_local[i] + _tau_b_local_screw[i]) *
                       (libMesh::outer_product(slip_direction_rotated, slip_plane_normal_rotated) +
                        libMesh::outer_product(slip_plane_normal_rotated, slip_direction_rotated));
  }

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    slip_direction_rotated = _slip_direction_edge[_qp][i];      //_slip_direction[i];
    slip_plane_normal_rotated = _slip_plane_normalboth[_qp][i]; //_slip_plane_normal[i];
    _tau_b_local[i] = _initial_athermal + Stress_internal.contract(libMesh::outer_product(
                                              slip_direction_rotated, slip_plane_normal_rotated));
  }
}

void
DiscoFluxCPOrowanStressUpdate::getDisloVelocity()
{
  //  compute velocity for each slip system
  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    tau_eff[i] = 0.00;
    t_wait[i] = 0.00;
    t_run[i] = 0.00;
    vel_run[i] = 0.00;
    _dislo_velocity_edge[_qp][i] = 0.00;
    _dv_dtau[i] = 0.00;
    _dislo_velocity_screw[_qp][i] = 0.00;
    _dv_dtau_screw[i] = 0.00;
  }

  // Don't compute velocity for boundary element
  if (isBoundaryMaterial())
    return;

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    slip_r[i] = _slip_resistance[_qp][i];
    tau_eff[i] = (_tau[_qp][i] - _tau_b_local[i]); // this value is changed
    tau_effAbs[i] = std::abs(_tau[_qp][i]) - _tau_b_local[i];
    tau_effSign[i] = std::copysign(1.0, _tau[_qp][i]);
  }

  deltaG0 = _g0 * _mu * std::pow(_burgers_vector_mag, 3);

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    // Compute velocity only if tau>tau_b
    if (tau_effAbs[i] > 0.0)
    {
      // Dislocation density threshold
      if (_disloc_den_threshold_flag &&
          (_DD_EdgeNegative[i] > _max_dd || _DD_EdgePositive[i] > _max_dd))
      {
        _dislo_velocity_edge[_qp][i] = 0.0;
        _dv_dtau[i] = 0.0;
      }
      else
      {
        // compute wait time
        dtw_dtau = 0.0;
        inner = 1.0;
        tau_eff[i] = 0.0;

        if (tau_effAbs[i] > small2)
        {
          inner = 1.0 - std::pow((tau_effAbs[i] / slip_r[i]), _q1);
          tau_eff[i] = tau_effAbs[i];
        }

        if (inner > 0.0)
        {
          deltaG = deltaG0 / (_boltz * _temp);
          exp_arg = deltaG * (std::pow(inner, _q2));
          t_wait[i] = (exp(exp_arg)) / _omega0;
          dtw_dtau = t_wait[i] * _q1 * _q2 * deltaG0 / (_boltz * _temp * slip_r[i]) *
                     std::pow(inner, _q2 - 1.0) * std::pow((tau_eff[i] / slip_r[i]), _q1 - 1.0) *
                     tau_effSign[i];
        }
        else
        {
          t_wait[i] = 1.0 / _omega0;
        }

        // compute running velocity

        // compute edge velocity
        xi0[i] = 0.0;
        vel_run[i] = 0.0;
        xi0[i] = _B0 * _vs_edge / (2 * _burgers_vector_mag * tau_effAbs[i]);
        vel_run[i] = _vs_edge * (std::pow((xi0[i] * xi0[i] + 1), 0.5) - xi0[i]);

        if (_mean_free_path_init_flag)
        {
          t_run[i] = _L_bar_e / vel_run[i];
          _dislo_velocity_edge[_qp][i] = tau_effSign[i] * _L_bar_e / (t_wait[i] + t_run[i]);
        }
        else
        {
          t_run[i] = _L_bar[i] / vel_run[i];
          _dislo_velocity_edge[_qp][i] = tau_effSign[i] * _L_bar[i] / (t_wait[i] + t_run[i]);
        }

        dtr_dtau = t_run[i] * xi0[i] * tau_effSign[i] /
                   (std::pow((xi0[i] * xi0[i] + 1), 0.5) * tau_effAbs[i]);

        _dv_dtau[i] =
            (_dislo_velocity_edge[_qp][i] / (t_wait[i] + t_run[i])) * (dtr_dtau + dtw_dtau);

        // This is just for test and debug
        if (_dislo_velocity_edge[_qp][i] > 1000)
        {
          mooseWarning("Edge dislocation velocity ", _dislo_velocity_edge[_qp][i]);
          mooseWarning("Edge run time", t_run[i]);
          mooseWarning("Edge wait time", t_wait[i]);
          mooseWarning("Shear stress", _tau[_qp][i]);
          mooseWarning("Backstress", _tau_b_local[i]);
          mooseWarning("Shear resistance", slip_r[i]);
        }
      }

      if (_disloc_den_threshold_flag &&
          (_DD_ScrewNegative[i] > _max_dd || _DD_ScrewPositive[i] > _max_dd))
      {
        _dislo_velocity_screw[_qp][i] = 0.0;
        _dv_dtau_screw[i] = 0.0;
      }
      else
      {
        // compute wait time
        dtw_dtau = 0.0;
        inner = 1.0;
        tau_eff[i] = 0.0;

        if (tau_effAbs[i] > small2)
        {
          inner = 1.0 - std::pow((tau_effAbs[i] / slip_r[i]), _q1);
          tau_eff[i] = tau_effAbs[i];
        }

        if (inner > 0.0)
        {
          deltaG = deltaG0 / (_boltz * _temp);
          exp_arg = deltaG * (std::pow(inner, _q2));
          t_wait[i] = (exp(exp_arg)) / _omega0;
          dtw_dtau = t_wait[i] * _q1 * _q2 * deltaG0 / (_boltz * _temp * slip_r[i]) *
                     std::pow(inner, _q2 - 1.0) * std::pow((tau_eff[i] / slip_r[i]), _q1 - 1.0) *
                     tau_effSign[i];
        }
        else
        {
          t_wait[i] = 1.0 / _omega0;
        }

        // compute running velocity
        // compute Screw velocity
        // compute running velocity
        xi0[i] = 0.0;
        vel_run[i] = 0.0;
        xi0[i] = _B0s * _vs_screw / (2 * _burgers_vector_mag * tau_effAbs[i]);
        vel_run[i] = _vs_screw * (std::pow((xi0[i] * xi0[i] + 1), 0.5) - xi0[i]);

        // compute running time
        if (_mean_free_path_init_flag)
        {
          t_run[i] = _L_bar_s / vel_run[i];
          _dislo_velocity_screw[_qp][i] = tau_effSign[i] * _L_bar_s / (t_wait[i] + t_run[i]);
        }
        else
        {
          t_run[i] = _L_bar[i] / vel_run[i];
          _dislo_velocity_screw[_qp][i] = tau_effSign[i] * _L_bar[i] / (t_wait[i] + t_run[i]);
        }

        dtr_dtau = t_run[i] * xi0[i] * tau_effSign[i] /
                   (std::pow((xi0[i] * xi0[i] + 1), 0.5) * tau_effAbs[i]);

        _dv_dtau_screw[i] =
            (_dislo_velocity_screw[_qp][i] / (t_wait[i] + t_run[i])) * (dtr_dtau + dtw_dtau);

        // This is just for test and debug
        if (_dislo_velocity_screw[_qp][i] > 1000)
        {
          mooseWarning("Screw dislocation velocity ", _dislo_velocity_screw[_qp][i]);
          mooseWarning("Screw run time", t_run[i]);
          mooseWarning("Screw wait time", t_wait[i]);
          mooseWarning("Shear stress", _tau[_qp][i]);
          mooseWarning("Backstress", _tau_b_local[i]);
          mooseWarning("Shear resistance", slip_r[i]);
        }
      }
    }
  }
}