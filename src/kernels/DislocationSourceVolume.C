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
#include "DislocationSourceVolume.h"
#include "FEProblemBase.h"

registerMooseObject("discopanterApp", DislocationSourceVolume);

InputParameters
DislocationSourceVolume::validParams()
{
  InputParameters params = Kernel::validParams();
  params.addClassDescription("Updates the dislocation density based on local evolution law of DiscoFlux crystal plasticity material model.");
  
  // parameters for local evolution of dislocation density.
  params.addParam<Real>                 ("dislo_density_factor_CDT",  1.0,                    "factor to convert the dislocation density from CDT to CP, this is for scaling of solution variable");
  params.addParam<Real>                 ("C_multi",                   0.4,                    "parameter for dislocation multiplication");
  params.addParam<Real>                 ("C_trap",                    0.36,                   "parameter for dislocation trapping");
  params.addParam<Real>                 ("C_m_ann",                   0.16,                   "parameter for dislocation mobile annihilation");
  params.addParam<Real>                 ("C_im_ann",                  0.16,                   "parameter for dislocation immobile annihilation");
  params.addParam<unsigned int>         ("number_slip_systems",       12,                     "number of slip systems");
  params.addParam<Real>                 ("dd_sat",                    10e10,                  "reference dislocation density saturation value");
  params.addParam<Real>                 ("burgers_vector_mag",        1.0e-7,                 "magnitude of the Burger Vector in mm");
  params.addParam<Real>                 ("zeta",                      0.1,                    "ratio of mobile to immobile saturation density");

  MooseEnum dislocation_character       ("edge screw");
  params.addRequiredParam<MooseEnum>    ("dislocation_character",     dislocation_character,  "Character of dislocation");
  MooseEnum dislocation_sign            ("positive negative");
  params.addRequiredParam<MooseEnum>    ("dislocation_sign",          dislocation_sign,       "Sign of dislocation");
  params.addRequiredParam<int>          ("slip_system_index",         "Slip system index to get slip direction FCC: 1 to 12.");

  params.addClassDescription            ("SThis calss handles the ource term in the advection equation");
  return params;
}

DislocationSourceVolume::DislocationSourceVolume(const InputParameters & parameters)
  : Kernel(parameters),
    _dislo_density_factor_CDT(              getParam<Real>("dislo_density_factor_CDT")),
    _C_multi(                               getParam<Real>("C_multi")),
    _C_trap(                                getParam<Real>("C_trap")),
    _C_m_ann(                               getParam<Real>("C_m_ann")),
    _C_im_ann(                              getParam<Real>("C_im_ann")),
    _dd_sat(                                getParam<Real>("dd_sat")),
    _burgers_vector_mag(                    getParam<Real>("burgers_vector_mag")),
    _zeta_sat(                              getParam<Real>("zeta")),
    _number_slip_systems(                   getParam<unsigned int>("number_slip_systems")),

    _dislo_velocity_CP_edge(                getMaterialProperty<std::vector<Real>>("dislo_velocity_edge")),
    _dislo_velocity_CP_screw(               getMaterialProperty<std::vector<Real>>("dislo_velocity_screw")),

    _slip_direction_edge(                   getMaterialProperty<std::vector<RealVectorValue>>("slip_direction_edge")),
    _slip_plane_normalboth(                 getMaterialProperty<std::vector<RealVectorValue>>("slip_plane_normalboth")),

    _dislocationcharacter(                  getParam<MooseEnum>("dislocation_character").getEnum<DislocationCharacter>()),
    _dislocationsign(                       getParam<MooseEnum>("dislocation_sign").getEnum<DislocationSign>()),

    _dislocation_immobile_sat_edgepos(      getMaterialProperty<std::vector<Real>>("saturation_immobile_density_edgepos")),
    _dislocation_immobile_sat_edgeneg(      getMaterialProperty<std::vector<Real>>("saturation_immobile_density_edgeneg")),
    _dislocation_immobile_sat_screwpos(     getMaterialProperty<std::vector<Real>>("saturation_immobile_density_screwpos")),
    _dislocation_immobile_sat_screwneg(     getMaterialProperty<std::vector<Real>>("saturation_immobile_density_screwneg")),
    _dislocation_mobile_edge(               getMaterialProperty<std::vector<Real>>("dislocation_mobile_edge")),
    _dislocation_mobile_screw(              getMaterialProperty<std::vector<Real>>("dislocation_mobile_screw")),
    _dislocation_immobile(                  getMaterialProperty<std::vector<Real>>("dislocation_immobile")),
    _dislocation_immobile_edge_negative(    getMaterialProperty<std::vector<Real>>("dislocation_immobile_edge_negative")),
    _dislocation_immobile_screw_positive(   getMaterialProperty<std::vector<Real>>("dislocation_immobile_screw_positive")),
    _dislocation_immobile_screw_negative(   getMaterialProperty<std::vector<Real>>("dislocation_immobile_screw_negative")),
    _slip_system_index(                     getParam<int>("slip_system_index")),
    _dt(                                    _fe_problem.dt())
{
}

Real
DislocationSourceVolume::computeQpResidual()
{
//   int _count = 12; // todo hard coded for now
//   unsigned int _number_slip_systems = _count;
  Real A_f_ij, dislocation_forest;
  int i = _slip_system_index - 1;

  Real _dislocation_mobile_increment_mult = 0.00;
  Real _dislocation_mobile_increment_ann = 0.00;
  Real _dislocation_mobile_increment_trap = 0.00;

  Real slip_rate, dislocation_mobile_increment;
  dislocation_mobile_increment = 0.00;

  dislocation_forest = 0.00;
  for (unsigned int j = 0; j < _number_slip_systems; ++j)
  {
    // Edge contribution
    A_f_ij              = 0.5 * std::abs(_slip_plane_normalboth[_qp][i] * (_slip_plane_normalboth[_qp][j].cross(_slip_direction_edge[_qp][j])));
    dislocation_forest  += A_f_ij * (_dislocation_mobile_edge[_qp][j] + _dislocation_immobile[_qp][j] + _dislocation_immobile_edge_negative[_qp][j]);
    
    // Screw contribution
    A_f_ij              = 0.5 * std::abs(_slip_plane_normalboth[_qp][i] * (_slip_direction_edge[_qp][j]));
    dislocation_forest  += A_f_ij * (_dislocation_mobile_screw[_qp][j] + _dislocation_immobile_screw_positive[_qp][j] + _dislocation_immobile_screw_negative[_qp][j]);
  }

  Real saturation_density = _zeta_sat;
  if (_dislocationcharacter == DislocationCharacter::edge && _dislocationsign == DislocationSign::positive) 
    saturation_density *= _dislocation_immobile_sat_edgepos[_qp][i];

  else if (_dislocationcharacter == DislocationCharacter::edge && _dislocationsign == DislocationSign::negative) 
    saturation_density *= _dislocation_immobile_sat_edgeneg[_qp][i];

  else if (_dislocationcharacter == DislocationCharacter::screw && _dislocationsign == DislocationSign::positive) 
    saturation_density *= _dislocation_immobile_sat_screwpos[_qp][i];

  else if (_dislocationcharacter == DislocationCharacter::screw && _dislocationsign == DislocationSign::negative) 
    saturation_density *= _dislocation_immobile_sat_screwneg[_qp][i];

  switch (_dislocationcharacter)
  {
    case DislocationCharacter::edge:
      slip_rate = _u[_qp] * _dislo_density_factor_CDT * std::abs(_dislo_velocity_CP_edge[_qp][i]);
      break;
    case DislocationCharacter::screw:
      slip_rate = _u[_qp] * _dislo_density_factor_CDT * std::abs(_dislo_velocity_CP_screw[_qp][i]);
      break;
  }

  _dislocation_mobile_increment_mult =  (_C_multi * std::pow(dislocation_forest, 0.5)) * std::abs(slip_rate);
  _dislocation_mobile_increment_trap =  (_C_trap * std::pow(dislocation_forest, 0.5)) * std::abs(slip_rate);
  _dislocation_mobile_increment_ann =   (0.25 * _C_m_ann * std::pow(dislocation_forest, 0.5) / (saturation_density)) * _u[_qp] * std::abs(slip_rate);

  dislocation_mobile_increment = (_dislocation_mobile_increment_mult - _dislocation_mobile_increment_trap - _dislocation_mobile_increment_ann);
  dislocation_mobile_increment *= _dt / _dislo_density_factor_CDT;

  return -_test[_i][_qp] * dislocation_mobile_increment;
}

Real
DislocationSourceVolume::computeQpJacobian()
{
//   int _count = 12; // todo hard coded for now
//   unsigned int _number_slip_systems = _count;
  Real A_f_ij, dislocation_forest;
  int i = _slip_system_index - 1;

  Real _dislocation_mobile_increment_mult = 0.00;
  Real _dislocation_mobile_increment_ann = 0.00;
  Real _dislocation_mobile_increment_trap = 0.00;

  Real slip_rate, dislocation_mobile_increment;
  dislocation_mobile_increment = 0.00;

  dislocation_forest = 0.00;
  for (unsigned int j = 0; j < _number_slip_systems; ++j)
  {
    // Edge contribution
    A_f_ij = 0.5 * std::abs(_slip_plane_normalboth[_qp][i] * (_slip_plane_normalboth[_qp][j].cross(_slip_direction_edge[_qp][j])));
    dislocation_forest += A_f_ij * (_dislocation_mobile_edge[_qp][j] + _dislocation_immobile[_qp][j] + _dislocation_immobile_edge_negative[_qp][j]);
    
    // Screw contribution
    A_f_ij = 0.5 * std::abs(_slip_plane_normalboth[_qp][i] * (_slip_direction_edge[_qp][j]));
    dislocation_forest += A_f_ij * (_dislocation_mobile_screw[_qp][j] + _dislocation_immobile_screw_positive[_qp][j] + _dislocation_immobile_screw_negative[_qp][j]);
  }

  switch (_dislocationcharacter)
  {
    case DislocationCharacter::edge:
      slip_rate =
          _phi[_j][_qp] * _dislo_density_factor_CDT * std::abs(_dislo_velocity_CP_edge[_qp][i]);
      break;
    case DislocationCharacter::screw:
      slip_rate =
          _phi[_j][_qp] * _dislo_density_factor_CDT * std::abs(_dislo_velocity_CP_screw[_qp][i]);
      break;
  }

  // The derivative is incomplete, the derivative of the forest dislocation density is missing
  // TODO: get the trial functions phi of the other variables
  _dislocation_mobile_increment_mult = (_C_multi * std::pow(dislocation_forest, 0.5)) * std::abs(slip_rate);
  _dislocation_mobile_increment_trap = (_C_trap * std::pow(dislocation_forest, 0.5)) * std::abs(slip_rate);
  _dislocation_mobile_increment_ann = (0.25 * _C_m_ann * std::pow(dislocation_forest, 0.5) / _dd_sat) * 2.0 * _u[_qp] * std::abs(slip_rate);

  dislocation_mobile_increment = (_dislocation_mobile_increment_mult - _dislocation_mobile_increment_trap -  _dislocation_mobile_increment_ann);
  dislocation_mobile_increment *= _dt / _dislo_density_factor_CDT;

  return -_test[_i][_qp] * dislocation_mobile_increment;
}
