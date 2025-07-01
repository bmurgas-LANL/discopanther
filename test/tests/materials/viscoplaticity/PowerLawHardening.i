# This is a test of the isotropic power law hardening constitutive model.
# In this problem, a single Hex 8 element is fixed at the bottom and pulled at the top
# at a constant rate of 0.1.
# Before yield, stress = strain (=0.1*t) as youngs modulus is 1.0.
# The yield stress for this problem is 0.25 ( as strength coefficient is 0.5 and strain rate exponent is 0.5).
# Therefore, the material should start yielding at t = 2.5 seconds and then follow stress = K *pow(strain,n) or
# stress ~ 0.5*pow(0.1*t,0.5).
#
# This tensor mechanics version of the power law hardening plasticity model matches
# the solid mechanics version for this toy problem under exodiff limits

N = 5

[GlobalParams]
  displacements = 'disp_x disp_y disp_z'
  # volumetric_locking_correction = true
[]

[Mesh]
  [gmg]
    type = GeneratedMeshGenerator
    dim = 3
    nx = ${N}
    ny = ${N}
    nz = ${N}
  []
[]

[AuxVariables]
  [./total_strain_yy]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

[Functions]
  [./top_pull]
    type = ParsedFunction
    expression = '0.001*x*t' #t*(0.1)
  [../]
[]

[Physics/SolidMechanics/QuasiStatic]
  [./all]
    add_variables = true
    strain = SMALL
    incremental = true
    # generate_output = 'stress_yy'
  []
[]

[AuxKernels]
  [./total_strain_yy]
    type = RankTwoAux
    rank_two_tensor = total_strain
    variable = total_strain_yy
    index_i = 1
    index_j = 1
  [../]
 []

[BCs]
  [./y_pull_function]
    type = FunctionDirichletBC
    variable = disp_x
    boundary = right
    function = top_pull
  [../]
  [./x_bot]
    type = DirichletBC
    variable = disp_x
    boundary = left
    value = 0.0
  [../]
  [./y_bot]
    type = DirichletBC
    variable = disp_y
    boundary = bottom
    value = 0.0
  [../]
  [./z_bot]
    type = DirichletBC
    variable = disp_z
    boundary = back
    value = 0.0
  [../]
[]

[Materials]
  [./elasticity_tensor]
    type = ComputeIsotropicElasticityTensor
    youngs_modulus = 1e5
    poissons_ratio = 0.3
  [../]
  [./power_law_hardening]
    type = IsotropicPlasticityStressUpdate
    # strength_coefficient = 1000 #K
    # strain_hardening_exponent = 0.9 #n
    hardening_constant = 1000
    yield_stress = 5
  [../]
  [./radial_return_stress]
    type = ComputeMultipleInelasticStress
    inelastic_models = 'power_law_hardening'
    tangent_operator = elastic
  [../]
[]

[Executioner]
  type = Transient
  solve_type = 'PJFNK'

  petsc_options = '-ksp_snes_ew'
  petsc_options_iname = '-ksp_gmres_restart -pc_type -pc_hypre_type -pc_hypre_boomeramg_max_iter'
  petsc_options_value = '201                hypre    boomeramg      4'

  line_search = 'none'

  l_max_its = 100
  nl_max_its = 100
  nl_rel_tol = 1e-12
  nl_abs_tol = 1e-10
  l_tol = 1e-9

  start_time = 0.0
  end_time = 100
  dt = 0.1
  dtmin = 1e-3
  dtmax = 0.1
[]

# [Postprocessors]
#   [./stress_yy]
#     type = ElementAverageValue
#     variable = stress_yy
#   [../]
#   [./strain_yy]
#     type = ElementAverageValue
#     variable = total_strain_yy
#   [../]
# []

[AuxVariables]
  [strain_xx]
    order = CONSTANT
    family = MONOMIAL
    [AuxKernel]
      type = MaterialRankTwoTensorAux
      property = 'total_strain'
      i = 0
      j = 0
      execute_on = 'INITIAL TIMESTEP_END'
    []
  []
  [strain_yy]
    order = CONSTANT
    family = MONOMIAL
    [AuxKernel]
      type = MaterialRankTwoTensorAux
      property = 'total_strain'
      i = 1
      j = 1
      execute_on = 'INITIAL TIMESTEP_END'
    []
  []
  [strain_zz]
    order = CONSTANT
    family = MONOMIAL
    [AuxKernel]
      type = MaterialRankTwoTensorAux
      property = 'total_strain'
      i = 2
      j = 2
      execute_on = 'INITIAL TIMESTEP_END'
    []
  []
  [strain_yz]
    order = CONSTANT
    family = MONOMIAL
    [AuxKernel]
      type = MaterialRankTwoTensorAux
      property = 'total_strain'
      i = 1
      j = 2
      execute_on = 'INITIAL TIMESTEP_END'
    []
  []
  [strain_xz]
    order = CONSTANT
    family = MONOMIAL
    [AuxKernel]
      type = MaterialRankTwoTensorAux
      property = 'total_strain'
      i = 0
      j = 2
      execute_on = 'INITIAL TIMESTEP_END'
    []
  []
  [strain_xy]
    order = CONSTANT
    family = MONOMIAL
    [AuxKernel]
      type = MaterialRankTwoTensorAux
      property = 'total_strain'
      i = 0
      j = 1
      execute_on = 'INITIAL TIMESTEP_END'
    []
  []
  [stress_xx]
    order = CONSTANT
    family = MONOMIAL
    [AuxKernel]
      type = MaterialRankTwoTensorAux
      property = 'stress'
      i = 0
      j = 0
      execute_on = 'INITIAL TIMESTEP_END'
    []
  []
  [stress_yy]
    order = CONSTANT
    family = MONOMIAL
    [AuxKernel]
      type = MaterialRankTwoTensorAux
      property = 'stress'
      i = 1
      j = 1
      execute_on = 'INITIAL TIMESTEP_END'
    []
  []
  [stress_zz]
    order = CONSTANT
    family = MONOMIAL
    [AuxKernel]
      type = MaterialRankTwoTensorAux
      property = 'stress'
      i = 2
      j = 2
      execute_on = 'INITIAL TIMESTEP_END'
    []
  []
  [stress_yz]
    order = CONSTANT
    family = MONOMIAL
    [AuxKernel]
      type = MaterialRankTwoTensorAux
      property = 'stress'
      i = 1
      j = 2
      execute_on = 'INITIAL TIMESTEP_END'
    []
  []
  [stress_xz]
    order = CONSTANT
    family = MONOMIAL
    [AuxKernel]
      type = MaterialRankTwoTensorAux
      property = 'stress'
      i = 0
      j = 2
      execute_on = 'INITIAL TIMESTEP_END'
    []
  []
  [stress_xy]
    order = CONSTANT
    family = MONOMIAL
    [AuxKernel]
      type = MaterialRankTwoTensorAux
      property = 'stress'
      i = 0
      j = 1
      execute_on = 'INITIAL TIMESTEP_END'
    []
  []
[]

[Postprocessors]
  [strain_xx]
    type = ElementAverageValue
    variable = 'strain_xx'
    execute_on = 'INITIAL TIMESTEP_END'
  []
  [strain_yy]
    type = ElementAverageValue
    variable = 'strain_yy'
    execute_on = 'INITIAL TIMESTEP_END'
  []
  [strain_zz]
    type = ElementAverageValue
    variable = 'strain_zz'
    execute_on = 'INITIAL TIMESTEP_END'
  []
  [strain_yz]
    type = ElementAverageValue
    variable = 'strain_yz'
    execute_on = 'INITIAL TIMESTEP_END'
  []
  [strain_xz]
    type = ElementAverageValue
    variable = 'strain_xz'
    execute_on = 'INITIAL TIMESTEP_END'
  []
  [strain_xy]
    type = ElementAverageValue
    variable = 'strain_xy'
    execute_on = 'INITIAL TIMESTEP_END'
  []
  [stress_xx]
    type = ElementAverageValue
    variable = 'stress_xx'
    execute_on = 'INITIAL TIMESTEP_END'
  []
  [stress_yy]
    type = ElementAverageValue
    variable = 'stress_yy'
    execute_on = 'INITIAL TIMESTEP_END'
  []
  [stress_zz]
    type = ElementAverageValue
    variable = 'stress_zz'
    execute_on = 'INITIAL TIMESTEP_END'
  []
  [stress_yz]
    type = ElementAverageValue
    variable = 'stress_yz'
    execute_on = 'INITIAL TIMESTEP_END'
  []
  [stress_xz]
    type = ElementAverageValue
    variable = 'stress_xz'
    execute_on = 'INITIAL TIMESTEP_END'
  []
  [stress_xy]
    type = ElementAverageValue
    variable = 'stress_xy'
    execute_on = 'INITIAL TIMESTEP_END'
  []
[]

[Outputs]
  # [./out]
  #   type = Exodus
  #   elemental_as_nodal = true
  # [../]
  exodus = true
  csv = true
  [./pg]
    type = PerfGraphOutput
    level = 3                     # Default is 1
    execute_on = 'initial failed final'
  [../]
[]
