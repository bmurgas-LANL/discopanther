// This file is part of the MOOSE framework
// https://mooseframework.inl.gov
//
// All rights reserved, see COPYRIGHT for full restrictions
// https://github.com/idaholab/moose/blob/master/COPYRIGHT
//
// Licensed under LGPL 2.1, please see LICENSE for details
// https://www.gnu.org/licenses/lgpl-2.1.html

#include "DislocationVelocity.h"

registerMooseObject("discopanterApp", DislocationVelocity);

InputParameters
DislocationVelocity::validParams()
{
  // InputParameters params = InterfaceMaterial::validParams();
  InputParameters params = Material::validParams();
  params.addClassDescription("Copy material properties into a different variable to use at"
                             "InterfaceKernels and BC systems");
  params.addParam<Real>("burgers_vector_mag", 1.0e-07, "Magnitude of the Burgers vector in mm");
  params.addParam<Real>("mu", 54.64e+03, "Shear modulus in MPa");
  params.addParam<Real>("g0", 0.87, "Dislocation energy barrrier coefficient");
  params.addParam<Real>("q1", 0.33, "Energy barrier shape parameter q1 or p");
  params.addParam<Real>("q2", 1.66, "Energy barrier shape parameter q2 or q");
  params.addParam<Real>("B0", 2.4e-11, "Reference drag coefficient of edge dislocations in MPa s");
  params.addParam<Real>(
      "B0s", 3.1e-11, "Reference drag coefficient of screw dislocations in MPa s");
  params.addParam<Real>("vs_edge", 1.62e6, "Limiting edge dislocation velocity in mm/s");
  params.addParam<Real>("vs_screw", 2.2e6, "Limiting edge dislocation velocity in mm/s");
  params.addParam<Real>("omega0", 8e11, "Attempt frequency");
  params.addParam<Real>("temp", 300, "Temperature(K)");
  params.addParam<Real>("boltz", 1.38e-20, "Boltzmann constant in N mm K-1");
  params.addParam<bool>("mean_free_path_init_flag",
                        true,
                        "Flag to determine whether to use initial or actual dislocation density");
  params.addParam<Real>("L_bar_e", 0.001, "Mean free path edge dislocations");
  params.addParam<Real>("L_bar_s", 0.001, "Mean free path screw dislocations");
  params.addParam<unsigned int>(
      "number_slip_systems",
      12,
      "The total number of possible active slip systems for the crystalline material");
  return params;
}

DislocationVelocity::DislocationVelocity(const InputParameters & parameters)
  // : InterfaceMaterial(parameters),
  : Material(parameters),
    // Get properties from CP
    _burgers_vector_mag(getParam<Real>("burgers_vector_mag")),
    _mu(getParam<Real>("mu")),
    _g0(getParam<Real>("g0")),
    _q1(getParam<Real>("q1")),
    _q2(getParam<Real>("q2")),
    _B0(getParam<Real>("B0")),
    _B0s(getParam<Real>("B0s")),
    _vs_edge(getParam<Real>("vs_edge")),
    _vs_screw(getParam<Real>("vs_screw")),
    _omega0(getParam<Real>("omega0")),
    _temp(getParam<Real>("temp")),
    _boltz(getParam<Real>("boltz")),
    _mean_free_path_init_flag(getParam<bool>("mean_free_path_init_flag")),
    _L_bar_e(getParam<Real>("L_bar_e")),
    _L_bar_s(getParam<Real>("L_bar_s")),
    _number_slip_systems(getParam<unsigned int>("number_slip_systems")),
    _dislo_velocity_edge(declareProperty<std::vector<Real>>("dislo_velocity_edge_int")),
    _dislo_velocity_screw(declareProperty<std::vector<Real>>("dislo_velocity_screw_int")),
    t_wait(_number_slip_systems, 0.00),
    t_run(_number_slip_systems, 0.00),
    vel_run(_number_slip_systems, 0.00),
    xi0(_number_slip_systems, 0.00),
    tau_eff(_number_slip_systems, 0.00),
    tau_effAbs(_number_slip_systems, 0.00),
    tau_effSign(_number_slip_systems, 0.00),
    slip_r(_number_slip_systems, 0.00),
    _slip_resistance(getMaterialProperty<std::vector<Real>>("slip_resistance")),
    _tau_b(getMaterialProperty<std::vector<Real>>("back_stress")),
    _tau(getMaterialProperty<std::vector<Real>>("applied_shear_stress"))
{
}

void
DislocationVelocity::computeQpProperties()
{
  _dislo_velocity_edge[_qp].resize(_number_slip_systems);
  _dislo_velocity_screw[_qp].resize(_number_slip_systems);
  double deltaG0, deltaG, exp_arg;
  double inner;
  //  compute velocity for each slip system
  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    tau_eff[i] = 0.00;
    t_wait[i] = 0.00;
    t_run[i] = 0.00;
    vel_run[i] = 0.00;
    _dislo_velocity_edge[_qp][i] = 0.00;
    _dislo_velocity_screw[_qp][i] = 0.00;
  }

  // Clear exceptions
  std::feclearexcept(FE_ALL_EXCEPT);

  // Don't compute velocity for boundary element
  // if (isBoundaryMaterial())
  //   return;

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    slip_r[i] = _slip_resistance[_qp][i];
    tau_eff[i] = (_tau[_qp][i] - _tau_b[_qp][i]); // this value is changed
    tau_effAbs[i] = std::abs(_tau[_qp][i]) - _tau_b[_qp][i];
    tau_effSign[i] = std::copysign(1.0, _tau[_qp][i]);
  }

  deltaG0 = _g0 * _mu * std::pow(_burgers_vector_mag, 3);

  for (unsigned int i = 0; i < _number_slip_systems; ++i)
  {
    // Compute velocity only if tau>tau_b
    if (tau_effAbs[i] > small2)
    {
      if (_bnd)
      {
        mooseWarning("CRSS in boundary ", _tau[_qp][i]);
      }
      ////////////////////////////////////////////////////////////
      // Compute velocity and derivative for edge dislocations //
      ////////////////////////////////////////////////////////////
      // Dislocation density threshold
      // if (_disloc_den_threshold_flag &&
      //     (_DD_EdgeNegative[i] > _max_dd || _DD_EdgePositive[i] > _max_dd ||
      //      _DD_EdgeNegative[i] < _min_dd || _DD_EdgePositive[i] < _min_dd))
      // {
      //   _dislo_velocity_edge[_qp][i] = 0.0;
      // }
      // else
      // {
      // compute wait time
      inner = 1.0;
      tau_eff[i] = 0.0;

      if (tau_effAbs[i] > small2)
      {
        inner = 1.0 - std::pow((tau_effAbs[i] / slip_r[i]), _q1);
        tau_eff[i] = tau_effAbs[i];
      }

      if (inner > small2)
      {
        deltaG = deltaG0 / (_boltz * _temp);
        exp_arg = deltaG * (std::pow(inner, _q2));
        // t_wait[i] = (exp(exp_arg)) / _omega0;
        // dtw_dtau = t_wait[i] * _q1 * _q2 * deltaG0 / (_boltz * _temp * slip_r[i]) *
        //            std::pow(inner, _q2 - 1.0) * std::pow((tau_eff[i] / slip_r[i]), _q1 - 1.0) *
        //            tau_effSign[i];

        // second form of waiting time with exponential
        t_wait[i] = (exp(exp_arg) - 1.0) / _omega0;
      }
      else
      {
        // t_wait[i] = 1.0 / _omega0;
        t_wait[i] = 0.0;
      }

      // compute running velocity

      // compute edge velocity
      xi0[i] = 0.0;
      vel_run[i] = 0.0;
      xi0[i] = _B0 * _vs_edge / (2 * _burgers_vector_mag * tau_effAbs[i]);
      vel_run[i] = _vs_edge * (std::pow((xi0[i] * xi0[i] + 1), 0.5) - xi0[i]);

      // if (_mean_free_path_init_flag)
      // {
      //   t_run[i] = _L_bar_e / vel_run[i];
      //   _dislo_velocity_edge[_qp][i] = tau_effSign[i] * _L_bar_e / (t_wait[i] + t_run[i]);
      // }
      // else
      // {
      //   t_run[i] = _L_bar[i] / vel_run[i];
      //   _dislo_velocity_edge[_qp][i] = tau_effSign[i] * _L_bar[i] / (t_wait[i] + t_run[i]);
      // }

      if (_mean_free_path_init_flag)
      {
        if (vel_run[i] < small2)
        {
          _dislo_velocity_edge[_qp][i] = 0.0;
        }
        else
        {
          t_run[i] = _L_bar_e / vel_run[i];
          _dislo_velocity_edge[_qp][i] = tau_effSign[i] * _L_bar_e / (t_wait[i] + t_run[i]);
        }
      }
      else
      {
        mooseWarning("Mean free path is not supported using actual value of dislocation density",
                     _mean_free_path_init_flag);
        // if (vel_run[i] < small2)
        // {
        //   _dislo_velocity_edge[_qp][i] = 0.0;
        // }
        // else
        // {
        //   t_run[i] = _L_bar[i] / vel_run[i];
        //   _dislo_velocity_edge[_qp][i] = tau_effSign[i] * _L_bar[i] / (t_wait[i] + t_run[i]);
        // }
      }

      // dtr_dtau = t_run[i] * xi0[i] * tau_effSign[i] /
      //            (std::pow((xi0[i] * xi0[i] + 1), 0.5) * tau_effAbs[i]);

      // _dv_dtau[i] =
      //     (_dislo_velocity_edge[_qp][i] / (t_wait[i] + t_run[i])) * (dtr_dtau + dtw_dtau);

      // This is just for test and debug
      // if (_print_convergence_message)
      // {
      //   if (std::fetestexcept(FE_DIVBYZERO))
      //   {
      //     mooseWarning("Edge disl. vel. divided by zero error in component ", i);
      //   }
      //   if (std::fetestexcept(FE_INEXACT))
      //   {
      //     mooseWarning("Edge disl. vel. inexact error in component ", i);
      //   }
      //   if (std::fetestexcept(FE_INVALID))
      //   {
      //     mooseWarning("Edge disl. vel. invalid error in component ", i);
      //   }
      //   if (std::abs(_dislo_velocity_edge[_qp][i]) > 0.001)
      //   {
      //     mooseWarning("Edge dislocation velocity ", _dislo_velocity_edge[_qp][i]);
      //     mooseWarning("Edge run time", t_run[i]);
      //     mooseWarning("Edge wait time", t_wait[i]);
      //     mooseWarning("Shear stress", _tau[_qp][i]);
      //     mooseWarning("Backstress", _tau_b_local[i]);
      //     mooseWarning("Shear resistance", slip_r[i]);
      //   }
      // }
      // }

      ////////////////////////////////////////////////////////////
      // Compute velocity and derivative for screw dislocations //
      ////////////////////////////////////////////////////////////

      t_wait[i] = 0.00;
      t_run[i] = 0.00;

      // if (_disloc_den_threshold_flag &&
      //     (_DD_ScrewNegative[i] > _max_dd || _DD_ScrewPositive[i] > _max_dd ||
      //      _DD_ScrewNegative[i] < _min_dd || _DD_ScrewPositive[i] < _min_dd))
      // {
      //   _dislo_velocity_screw[_qp][i] = 0.0;
      // }
      // else
      // {
      // compute wait time
      inner = 1.0;
      tau_eff[i] = 0.0;

      if (tau_effAbs[i] > small2)
      {
        inner = 1.0 - std::pow((tau_effAbs[i] / slip_r[i]), _q1);
        tau_eff[i] = tau_effAbs[i];
      }

      if (inner > small2)
      {
        deltaG = deltaG0 / (_boltz * _temp);
        exp_arg = deltaG * (std::pow(inner, _q2));
        // t_wait[i] = (exp(exp_arg)) / _omega0;
        // dtw_dtau = t_wait[i] * _q1 * _q2 * deltaG0 / (_boltz * _temp * slip_r[i]) *
        //            std::pow(inner, _q2 - 1.0) * std::pow((tau_eff[i] / slip_r[i]), _q1 - 1.0) *
        //            tau_effSign[i];

        // second form of waiting time with exponential
        t_wait[i] = (exp(exp_arg) - 1.0) / _omega0;
      }
      else
      {
        // t_wait[i] = 1.0 / _omega0;
        t_wait[i] = 0.0;
      }

      // compute running velocity
      // compute Screw velocity
      // compute running velocity
      xi0[i] = 0.0;
      vel_run[i] = 0.0;
      xi0[i] = _B0s * _vs_screw / (2 * _burgers_vector_mag * tau_effAbs[i]);
      vel_run[i] = _vs_screw * (std::pow((xi0[i] * xi0[i] + 1), 0.5) - xi0[i]);

      // compute running time
      // if (_mean_free_path_init_flag)
      // {
      //   t_run[i] = _L_bar_s / vel_run[i];
      //   _dislo_velocity_screw[_qp][i] = tau_effSign[i] * _L_bar_s / (t_wait[i] + t_run[i]);
      // }
      // else
      // {
      //   t_run[i] = _L_bar[i] / vel_run[i];
      //   _dislo_velocity_screw[_qp][i] = tau_effSign[i] * _L_bar[i] / (t_wait[i] + t_run[i]);
      // }

      if (_mean_free_path_init_flag)
      {
        if (vel_run[i] < small2)
        {
          _dislo_velocity_screw[_qp][i] = 0.0;
        }
        else
        {
          t_run[i] = _L_bar_s / vel_run[i];
          _dislo_velocity_screw[_qp][i] = tau_effSign[i] * _L_bar_s / (t_wait[i] + t_run[i]);
        }
      }
      else
      {
        mooseWarning("Mean free path is not supported using actual value of dislocation density",
                     _mean_free_path_init_flag);
        // if (vel_run[i] < small2)
        // {
        //   _dislo_velocity_screw[_qp][i] = 0.0;
        // }
        // else
        // {
        //   t_run[i] = _L_bar[i] / vel_run[i];
        //   _dislo_velocity_screw[_qp][i] = tau_effSign[i] * _L_bar[i] / (t_wait[i] + t_run[i]);
        // }
      }

      // dtr_dtau = t_run[i] * xi0[i] * tau_effSign[i] /
      //            (std::pow((xi0[i] * xi0[i] + 1), 0.5) * tau_effAbs[i]);

      // _dv_dtau_screw[i] =
      //     (_dislo_velocity_screw[_qp][i] / (t_wait[i] + t_run[i])) * (dtr_dtau + dtw_dtau);

      // This is just for test and debug
      // if (_print_convergence_message)
      // {
      //   if (std::fetestexcept(FE_DIVBYZERO))
      //   {
      //     mooseWarning("Screw disl. vel. divided by zero error in component ", i);
      //   }
      //   if (std::fetestexcept(FE_INEXACT))
      //   {
      //     mooseWarning("Screw disl. vel. inexact error in component ", i);
      //   }
      //   if (std::fetestexcept(FE_INVALID))
      //   {
      //     mooseWarning("Screw disl. vel. invalid error in component ", i);
      //   }
      //   if (std::abs(_dislo_velocity_screw[_qp][i]) > 0.001)
      //   {
      //     mooseWarning("Screw dislocation velocity ", _dislo_velocity_screw[_qp][i]);
      //     mooseWarning("Screw run time", t_run[i]);
      //     mooseWarning("Screw wait time", t_wait[i]);
      //     mooseWarning("Shear stress", _tau[_qp][i]);
      //     mooseWarning("Backstress", _tau_b_local[i]);
      //     mooseWarning("Shear resistance", slip_r[i]);
      //   }
      // }
    }
  }
  // }
  std::feclearexcept(FE_ALL_EXCEPT);
}

// void
// DislocationVelocity::subdomainSetup()
// {

// }