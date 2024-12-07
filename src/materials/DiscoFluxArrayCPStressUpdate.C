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
#include "DiscoFluxArrayCPStressUpdate.h"
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

registerMooseObject("SolidMechanicsApp", DiscoFluxArrayCPStressUpdate);

InputParameters
DiscoFluxArrayCPStressUpdate::validParams()
{
  InputParameters params = CrystalPlasticityStressUpdateBase::validParams();

  params.addClassDescription(
      "Calculates the plastic slip based on DiscoFlux crystal plasticity material model.");

  // Parameter description in the DiscoFlux paper(International Journal of Plasticity 76 (2016)
  // 111e129)
  params.addParam<Real>(
      "lattice_friction", 10, "initial lattice friction strength of the material in MPa");
  params.addParam<Real>("burgers_vector_mag", 1.0e-07, "Magnitude of the Burgers vector in mm");
  params.addParam<Real>("dislo_density_initial", 1.0e+05, "Initial dislocation density(mm^{-2})");
  params.addParam<Real>("dislo_density_factor_CDT",
                        1.0e+06,
                        "factor to convert the dislocation density from CDT to CP");

  params.addParam<Real>("C_multi", 8.5e-06, "parameter for dislocation multiplication");
  params.addParam<Real>("C_trap", 5.5e-03, "parameter for dislocation trapping");
  params.addParam<Real>("C_m_ann", 0.5, "parameter for dislocation mobile annihilation");
  params.addParam<Real>("C_im_ann", 0.5, "parameter for dislocation immobile annihilation");
  params.addParam<Real>("Coeff_hardening", 0.75, "parameter to control the material hardening");

  params.addParam<Real>("q1", 0.1, "material parameter");
  params.addParam<Real>("q2", 1.9, "material parameter");
  params.addParam<Real>("c1", 2.0, "material parameter");
  params.addParam<Real>("temp", 300, "Temperature(K)");

  params.addRequiredCoupledVar("DD_EdgePositive", "Coupled dislocation density, EdgePositive");
  params.addRequiredCoupledVar("DD_EdgeNegative", "Coupled dislocation density, EdgeNegative");
  params.addRequiredCoupledVar("DD_ScrewPositive", "Coupled dislocation density, ScrewPositive");
  params.addRequiredCoupledVar("DD_ScrewNegative", "Coupled dislocation density, ScrewNegative");

  return params;
}

DiscoFluxArrayCPStressUpdate::DiscoFluxArrayCPStressUpdate(const InputParameters & parameters)
  : CrystalPlasticityStressUpdateBase(parameters),
    _lattice_friction(getParam<Real>("lattice_friction")),

    _burgers_vector_mag(getParam<Real>("burgers_vector_mag")),
    _dislo_density_initial(getParam<Real>("dislo_density_initial")),
    _dislo_density_factor_CDT(getParam<Real>("dislo_density_factor_CDT")),
    _C_multi(getParam<Real>("C_multi")),
    _C_trap(getParam<Real>("C_trap")),
    _C_m_ann(getParam<Real>("C_m_ann")),
    _C_im_ann(getParam<Real>("C_im_ann")),
    _Coeff_hardening(getParam<Real>("Coeff_hardening")),

    _q1(getParam<Real>("q1")),
    _q2(getParam<Real>("q2")),
    _c1(getParam<Real>("c1")),
    _temp(getParam<Real>("temp")),

    //_Rho_EdgePositive_01(coupledValue("Rho_EdgePositive_01")),
    _DD_EdgePositive(coupledArrayValue("DD_EdgePositive")),
    _DD_EdgeNegative(coupledArrayValue("DD_EdgeNegative")),
    _DD_ScrewPositive(coupledArrayValue("DD_ScrewPositive")),
    _DD_ScrewNegative(coupledArrayValue("DD_ScrewNegative")),

    _DD_EdgePositive_Grad(coupledArrayGradient("DD_EdgePositive")),
    _DD_EdgeNegative_Grad(coupledArrayGradient("DD_EdgeNegative")),
    _DD_ScrewPositive_Grad(coupledArrayGradient("DD_ScrewPositive")),
    _DD_ScrewNegative_Grad(coupledArrayGradient("DD_ScrewNegative")),

    _dislocation_immobile(declareProperty<std::vector<Real>>("dislocation_immobile")),
    _dislocation_immobile_old(getMaterialPropertyOld<std::vector<Real>>("dislocation_immobile")),
    _dislocation_mobile(declareProperty<std::vector<Real>>("dislocation_mobile")),
    _dislocation_mobile_old(getMaterialPropertyOld<std::vector<Real>>("dislocation_mobile")),

    _dislo_velocity_edge(declareProperty<std::vector<Real>>("dislo_velocity_edge")),
    _dislo_velocity_screw(declareProperty<std::vector<Real>>("dislo_velocity_screw")),
    _tau_old(getMaterialPropertyOld<std::vector<Real>>("applied_shear_stress")),
    _GND_density(declareProperty<std::vector<Real>>("GND_density")),
    _tau_b(declareProperty<std::vector<Real>>("back_stress")),

    // DDC related variables
    _kappa(declareProperty<std::vector<Real>>("kappa")),
    _DD_grad(_number_slip_systems, 0.00),
    _tau_b_local(_number_slip_systems, 0.00),

    // Other variables necessary for this model
    _slip_direction_edge(declareProperty<std::vector<RealVectorValue>>("slip_direction_edge")),
    _slip_direction_screw(declareProperty<std::vector<RealVectorValue>>("slip_direction_screw")),
    _slip_plane_normalboth(declareProperty<std::vector<RealVectorValue>>("slip_plane_normalboth")),

    _crysrot(getMaterialProperty<RankTwoTensor>(_base_name + "crysrot")),

    // resize local caching vectors used for substepping
    _previous_substep_slip_resistance(_number_slip_systems, 0.00),
    _previous_substep_dislocation_mobile(_number_slip_systems, 0.00),
    _previous_substep_dislocation_immobile(_number_slip_systems, 0.00),

    _slip_resistance_before_update(_number_slip_systems, 0.00),
    _dislocation_mobile_before_update(_number_slip_systems, 0.00),
    _dislocation_immobile_before_update(_number_slip_systems, 0.00),

    // resize vectors used in the consititutive slip hardening
    _hb(_number_slip_systems, 0.00),
    _slip_resistance_increment(_number_slip_systems, 0.00),
    _dislocation_mobile_increment(_number_slip_systems, 0.00),
    _dislocation_immobile_increment(_number_slip_systems, 0.00),
    _dv_dtau(_number_slip_systems, 0.00),
    _L_bar(_number_slip_systems, 0.00),

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
DiscoFluxArrayCPStressUpdate::initQpStatefulProperties()
{
  CrystalPlasticityStressUpdateBase::initQpStatefulProperties();

  _slip_direction_edge[_qp].resize(_number_slip_systems);
  _slip_direction_screw[_qp].resize(_number_slip_systems);
  _slip_plane_normalboth[_qp].resize(_number_slip_systems);

  _dislocation_immobile[_qp].resize(_number_slip_systems);
  _dislocation_mobile[_qp].resize(_number_slip_systems);
  _dislo_velocity_edge[_qp].resize(_number_slip_systems);
  _dislo_velocity_screw[_qp].resize(_number_slip_systems);
  _kappa[_qp].resize(_number_slip_systems);
  _tau_b[_qp].resize(_number_slip_systems);

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    _slip_direction_edge[_qp][i].zero();
    _slip_direction_screw[_qp][i].zero();
    _slip_plane_normalboth[_qp][i].zero();

    _slip_resistance[_qp][i] =
        _lattice_friction; // approximate initial value why 5*_lattice_friction?
    _slip_increment[_qp][i] = 0.0;
    _dislocation_mobile[_qp][i] =
        0.5 * _dislo_density_initial; // why 4? -> mobile + immobile = disloc density initial
    _dislocation_immobile[_qp][i] = 0.5 * _dislo_density_initial; // why

    _dislo_velocity_edge[_qp][i] = 0.00;
    _dislo_velocity_screw[_qp][i] = 0.00;
    _kappa[_qp][i] = 0.0;
  }
}

void
DiscoFluxArrayCPStressUpdate::setInitialConstitutiveVariableValues()
{
  storeDislocationMobilityInformation();
  _slip_resistance[_qp] = _slip_resistance_old[_qp];
  _previous_substep_slip_resistance = _slip_resistance_old[_qp];

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    // _dislocation_mobile[_qp][i] = (_DD_EdgePositive[_qp][i] + _DD_EdgeNegative[_qp][i] +
    // _DD_ScrewPositive[_qp][i] + _DD_ScrewNegative[_qp][i]) * _dislo_density_factor_CDT;
    _dislocation_mobile[_qp][i] =
        (_DD_EdgePositive[_qp][i] + _DD_EdgeNegative[_qp][i]) * _dislo_density_factor_CDT;
    // _dislocation_mobile[_qp][i] = 4.0 * _dislo_density_factor_CDT;
    _previous_substep_dislocation_mobile[i] = _dislocation_mobile[_qp][i];
  }
  _dislocation_immobile[_qp] = _dislocation_immobile_old[_qp];
  _previous_substep_dislocation_immobile = _dislocation_immobile_old[_qp];
}

void
DiscoFluxArrayCPStressUpdate::storeDislocationMobilityInformation()
{
  // CrystalPlasticityStressUpdateBase::storeDislocationMobilityInformation();
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
DiscoFluxArrayCPStressUpdate::setSubstepConstitutiveVariableValues()
{
  _slip_resistance[_qp] = _previous_substep_slip_resistance;
  _dislocation_immobile[_qp] = _previous_substep_dislocation_immobile;
}

bool
DiscoFluxArrayCPStressUpdate::calculateSlipRate()
{
  // compute dislocation velocity according to DiscoFlux material model
  DDCUpdate();
  getDisloVelocity();

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    _slip_increment[_qp][i] = (_DD_EdgePositive[_qp][i] + _DD_EdgeNegative[_qp][i]) *
                              _dislo_density_factor_CDT * _burgers_vector_mag *
                              _dislo_velocity_edge[_qp][i];
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
    _kappa[_qp][i] =
        (_DD_EdgePositive[_qp][i] - _DD_EdgeNegative[_qp][i]) *
        _dislo_density_factor_CDT; // (_DD_ScrewPositive[_qp][i] - _DD_ScrewNegative[_qp][i]);
  }
  return true;
}

void
DiscoFluxArrayCPStressUpdate::calculateConstitutiveSlipDerivative(std::vector<Real> & dslip_dtau)
{
  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    if (MooseUtils::absoluteFuzzyEqual(_tau[_qp][i], 0.0))
      dslip_dtau[i] = 0.0;
    else
    {
      dslip_dtau[i] = (_DD_EdgePositive[_qp][i] + _DD_EdgeNegative[_qp][i]) *
                      _dislo_density_factor_CDT * _burgers_vector_mag * _dv_dtau[i];
    }
  }
}

void
DiscoFluxArrayCPStressUpdate::cacheStateVariablesBeforeUpdate()
{
  _slip_resistance_before_update = _slip_resistance[_qp];
  _dislocation_immobile_before_update = _dislocation_immobile[_qp];
}

void
DiscoFluxArrayCPStressUpdate::calculateStateVariableEvolutionRateComponent()
{
  // calculate dislocation density increment
  getDDIncrements();
}

// Calculate Dislocation Density increment
void
DiscoFluxArrayCPStressUpdate::getDDIncrements()
{
  Real small2 = 1.0e-5;
  Real A_f_ij, dislocation_forest;

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    _dislocation_mobile_increment[i] = 0.00;
    _dislocation_immobile_increment[i] = 0.00;
    dislocation_forest = 0.00;
    for (unsigned int j = 0; j < _number_slip_systems; ++j)
    {
      A_f_ij = 0.5 * std::abs(_slip_plane_normalboth[_qp][i] * (_slip_direction_edge[_qp][j])) +
               0.5 * std::abs(_slip_plane_normalboth[_qp][i] *
                              (_slip_plane_normalboth[_qp][i].cross(_slip_direction_edge[_qp][j])));
      dislocation_forest += A_f_ij * (_dislocation_mobile[_qp][j] + _dislocation_immobile[_qp][j]);
    }

    if (std::abs(_slip_increment[_qp][i]) > small2)
    {
      _dislocation_immobile_increment[i] =
          (_C_trap / _burgers_vector_mag) * std::pow(dislocation_forest, 0.5) *
              std::abs(_slip_increment[_qp][i]) -
          (_C_im_ann * _dislocation_immobile[_qp][i]) * std::abs(_slip_increment[_qp][i]);
    }
    else
    {
      _dislocation_mobile_increment[i] = 0.0;
      _dislocation_immobile_increment[i] = 0.0;
    }
  }
}

bool
DiscoFluxArrayCPStressUpdate::updateStateVariables()
{
  Real Hij, eff_dislocation_density = 0.00;

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    _dislocation_immobile[_qp][i] = _previous_substep_dislocation_immobile[i] +
                                    _dislocation_immobile_increment[i] * _substep_dt;
  }

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    eff_dislocation_density = 0.00;
    for (unsigned int j = 0; j < _number_slip_systems; ++j)
    {
      if (i == j ? Hij = 1.0 : Hij = 0.1)
        eff_dislocation_density +=
            Hij *
            (_dislocation_mobile[_qp][j] +
             _dislocation_immobile[_qp]
                                  [j]); // similar proportion of mobile and immobile dislocations
    }
    _slip_resistance[_qp][i] = _lattice_friction + _Coeff_hardening * mu * _burgers_vector_mag *
                                                       std::sqrt(eff_dislocation_density);
  }

  return true;
}

bool
DiscoFluxArrayCPStressUpdate::areConstitutiveStateVariablesConverged()
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
DiscoFluxArrayCPStressUpdate::updateSubstepConstitutiveVariableValues()
{
  _previous_substep_slip_resistance = _slip_resistance[_qp];
  _previous_substep_dislocation_immobile = _dislocation_immobile[_qp];
}

//----Compute the back stress based on Dislocation Deformation Compatibility(DDC)
void
DiscoFluxArrayCPStressUpdate::DDCUpdate()
{
  Stress_internal.zero();

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    slip_direction_rotated = _slip_direction[i];
    slip_plane_normal_rotated = _slip_plane_normal[i];
    _L_bar[i] = std::pow((_dislocation_mobile[_qp][i] + _dislocation_immobile[_qp][i]), -0.5);
    _DD_grad[i](0) =
        (_DD_EdgePositive_Grad[_qp](i) - _DD_EdgeNegative_Grad[_qp](i)) * _dislo_density_factor_CDT;
    _DD_grad[i](1) = (_DD_EdgePositive_Grad[_qp](i + _number_slip_systems) -
                      _DD_EdgeNegative_Grad[_qp](i + _number_slip_systems)) *
                     _dislo_density_factor_CDT;
    _DD_grad[i](2) = (_DD_EdgePositive_Grad[_qp](i + 2 * _number_slip_systems) -
                      _DD_EdgeNegative_Grad[_qp](i + 2 * _number_slip_systems)) *
                     _dislo_density_factor_CDT;
    _tau_b_local[i] = 0.2 * ((mu * std::pow(_L_bar[i], 1)) / (2 * 3.141 * (1 - nu))) *
                      _burgers_vector_mag * (_DD_grad[i] * slip_direction_rotated);
    Stress_internal += _tau_b_local[i] *
                       (libMesh::outer_product(slip_direction_rotated, slip_plane_normal_rotated) +
                        libMesh::outer_product(slip_plane_normal_rotated, slip_direction_rotated));
  }

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    slip_direction_rotated = _slip_direction[i];
    slip_plane_normal_rotated = _slip_plane_normal[i];
    _tau_b_local[i] = Stress_internal.contract(
        libMesh::outer_product(slip_direction_rotated, slip_plane_normal_rotated));
  }
}

void
DiscoFluxArrayCPStressUpdate::getDisloVelocity()
{
  double athermal_shear_resistance = 0;
  //  compute velocity for each slip system
  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    tau_eff[i] = 0.00;
    t_wait[i] = 0.00;
    t_run[i] = 0.00;
    vel_run[i] = 0.00;
    _dislo_velocity_edge[_qp][i] = 0.00;
    _dv_dtau[i] = 0.00;
  }

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    slip_r[i] = _slip_resistance[_qp][i];

    tau_eff[i] = (_tau[_qp][i] - _tau_b_local[i]);
    tau_effAbs[i] = std::abs(tau_eff[i]) - athermal_shear_resistance;
    tau_effSign[i] = std::copysign(1.0, tau_eff[i]);
  }

  deltaG0 = g0 * mu * std::pow(_burgers_vector_mag, 3) * 1.0e-3;
  // for (unsigned int i = 0; i < _number_slip_systems; ++i)
  // {
  //   inner = 1.0 - std::pow((tau_effAbs[i] / slip_r[i] ),_q1);
  //   if (inner > 0.00)
  //   {
  // 	deltaG  = deltaG0*( std::pow(inner,_q2) );
  // 	exp_arg = deltaG / (boltz*_temp);
  // 	t_wait[i] = (exp(exp_arg) - 1.0) / omega0;
  //   }
  //   else
  // 	t_wait[i] = 0.00;
  // }

  // for (unsigned int i = 0; i < _number_slip_systems; ++i)
  // {
  //   if (tau_effAbs[i]>small2)
  //   {
  //     xi0[i] = B0*vcrit / (2*_burgers_vector_mag*tau_effAbs[i]);
  //     vel_run[i] = vcrit*(std::pow((std::pow(xi0[i],2)+1),0.5) - xi0[i]);
  //   }
  // }

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    // if tau_eff is greater than 1e-5 plasticity starts
    if (tau_effAbs[i] > small2)
    {
      // compute wait time
      inner = 1.0 - std::pow((tau_effAbs[i] / slip_r[i]), _q1);
      if (inner > 0.00)
      {
        deltaG = deltaG0 * (std::pow(inner, _q2));
        exp_arg = deltaG / (boltz * _temp);
        t_wait[i] = (exp(exp_arg) - 1.0) / omega0;
      }
      else
      {
        t_wait[i] = 0.00;
      }

      // compute running velocity
      if (tau_effAbs[i] > small2)
      {
        xi0[i] = B0 * vcrit / (2 * _burgers_vector_mag * tau_eff[i]);
        vel_run[i] = vcrit * (std::pow((std::pow(xi0[i], 2) + 1), 0.5) - xi0[i]);
      }

      // compute running time
      if (vel_run[i] > small2)
      {
        t_run[i] = _L_bar[i] / vel_run[i];
        _dislo_velocity_edge[_qp][i] = tau_effSign[i] * _L_bar[i] / (t_wait[i] + t_run[i]);
        _dv_dtau[i] = 0.00;

        inner = 1.0 - std::pow((tau_effAbs[i] / slip_r[i]), _q1);
        deltaG = deltaG0 * (std::pow(inner, _q2));
        exp_arg = deltaG / (boltz * _temp);
        dtw_dtau = (-1) * _q1 * _q2 * deltaG0 / (omega0 * boltz * _temp) * exp(exp_arg) *
                   (std::pow(inner, _q2 - 1)) * std::pow((tau_effAbs[i] / slip_r[i]), _q1 - 1) *
                   (tau_effSign[i] / slip_r[i]);
        dtr_dtau =
            (_L_bar[i] * B0 / _burgers_vector_mag) * (tau_effSign[i] / std::pow(tau_effAbs[i], 2));
        _dv_dtau[i] =
            0.00; //-1*_L_bar[i]*std::pow((t_wait[i] + t_run[i]),-2) * (dtw_dtau + dtr_dtau);
        _dislo_velocity_edge[_qp][i] = std::pow((tau_effAbs[i] / slip_r[i]), 1.0 / _q1) *
                                       tau_effSign[i]; // signed dislocation velocity
        _dv_dtau[i] = (1.0 / _q1) * std::pow((tau_effAbs[i] / slip_r[i]), (1.0 / _q1 - 1)) *
                      (tau_effSign[i] / slip_r[i]) * tau_effSign[i];
        _dv_dtau[i] =
            -(_dislo_velocity_edge[_qp][i] / (t_wait[i] + t_run[i])) *
            (t_run[i] * xi0[i] * vcrit / (vel_run[i] * tau_eff[i]) *
                 (xi0[i] / std::pow((xi0[i] * xi0[i] + 1), 0.5) - 1.0) -
             (t_wait[i] * _q1 * _q2 / slip_r[i]) * exp_arg * std::pow(inner, (_q2 - 1.0)) *
                 std::pow((tau_effAbs[i] / slip_r[i]), (_q1 - 1.0)) * tau_effSign[i]);
      }
      else
      {
        _dislo_velocity_edge[_qp][i] = 0.00;
        _dv_dtau[i] = 0.00;
      }
    }
    else
    {
      _dislo_velocity_edge[_qp][i] = 0.00;
      _dv_dtau[i] = 0.00;
    }
  }
}