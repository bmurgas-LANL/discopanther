
#include "ElasticityTensorRotated.h"
#include "RotationTensor.h"

registerMooseObject("discopanterApp", ElasticityTensorRotated);

InputParameters
ElasticityTensorRotated::validParams()
{
  InputParameters params = ComputeRotatedElasticityTensorBaseTempl<false>::validParams();
  params.addClassDescription("Computes elasticity tensor in rotated configuration.");
  params.addRequiredParam<std::vector<Real>>("C_ijkl", "Stiffness tensor for material before rotation");
  params.addParam<MooseEnum>("fill_method", RankFourTensor::fillMethodEnum() = "symmetric9", "The fill method");
  params.addRequiredParam<UserObjectName>("read_prop_user_object", "Read the euler angles from a file");
  params.addRequiredParam<std::vector<Real>>("C_ijkl_t", "Derivative of stiffness tensor for material (before rotation)");
  params.addParam<Real>("temp", 300, "Temperature");
  params.addParam<Real>("temp0", 300, "Reference temperature for gradient");
  return params;
}

ElasticityTensorRotated::ElasticityTensorRotated(const InputParameters & parameters)
  : ComputeRotatedElasticityTensorBaseTempl<false>(parameters),
    _Cijkl(this->template getParam<std::vector<Real>>("C_ijkl"), (RankFourTensor::FillMethod)(int)this->template getParam<MooseEnum>("fill_method")),
    _read_prop_user_object(isParamValid("read_prop_user_object") ? &getUserObject<PropertyReadFile>("read_prop_user_object") : nullptr),
    _Euler_angles_mat_prop(declareProperty<RealVectorValue>("Euler_angles")),
    _initial_crysrot(declareProperty<RankTwoTensor>(_base_name + "initial_crysrot")),
    _crysrot(declareProperty<RankTwoTensor>(_base_name + "crysrot")),
    _updated_rotation_old(getMaterialPropertyOld<RankTwoTensor>("updated_rotation")),
    _R(_Euler_angles),
    _Cijkl_t(this->template getParam<std::vector<Real>>("C_ijkl_t"), (RankFourTensor::FillMethod)(int)this->template getParam<MooseEnum>("fill_method")),
    _temp(getParam<Real>("temp")),
    _temp0(getParam<Real>("temp0"))

{
  // Compute rotation matrix according to the euler angle provided
  RotationTensor R(_Euler_angles);

  // rotate elasticity tensor
  _Cijkl_t.rotate(R);
  _Cijkl.rotate(R);

  // std::cout << "Temp0 = " << _temp0 << ", temp = " << _temp << std::endl;
}

void
ElasticityTensorRotated::getEulerAngles()
{

  // get the euler angles for the current element
  _Euler_angles_mat_prop[_qp](0) = _read_prop_user_object->getData(_current_elem, 0);
  _Euler_angles_mat_prop[_qp](1) = _read_prop_user_object->getData(_current_elem, 1);
  _Euler_angles_mat_prop[_qp](2) = _read_prop_user_object->getData(_current_elem, 2);

  _R.update(_Euler_angles_mat_prop[_qp]);
}

void
ElasticityTensorRotated::initQpStatefulProperties()
{
  getEulerAngles();
  _initial_crysrot[_qp] = _R.transpose();
  _crysrot[_qp] = _initial_crysrot[_qp];
}

void
ElasticityTensorRotated::computeQpElasticityTensor()
{

  getEulerAngles();

  if (_updated_rotation_old[_qp].det() == 0.0)
    _crysrot[_qp] = _initial_crysrot[_qp];
  else
    _crysrot[_qp] = _updated_rotation_old[_qp];

  // cmpute the rotated elasticity tensor.
  _elasticity_tensor[_qp] = _Cijkl + (_temp - _temp0)*_Cijkl_t;

  // std::cout << "elasticity tensor " << _elasticity_tensor[_qp] << std::endl;
  _elasticity_tensor[_qp].rotate(_crysrot[_qp]);
}
