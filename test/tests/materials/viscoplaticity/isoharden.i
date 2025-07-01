N = 5

[GlobalParams]
  displacements = 'disp_x disp_y disp_z'
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

[Physics]
  [SolidMechanics]
    [QuasiStatic]
      [all]
        strain = SMALL
        new_system = true
        add_variables = true
        formulation = TOTAL
        volumetric_locking_correction = false #true
      []
    []
  []
[]

[NEML2]
  input = 'isoharden_neml2.i'
  [all]
    model = 'model'
    verbose = true
    device = 'cpu'

    moose_input_types = 'MATERIAL     MATERIAL     POSTPROCESSOR POSTPROCESSOR MATERIAL     MATERIAL'
    moose_inputs = '     neml2_strain neml2_strain time          time          neml2_stress equivalent_plastic_strain'
    neml2_inputs = '     forces/E     old_forces/E forces/t      old_forces/t  old_state/S  old_state/internal/ep'

    moose_output_types = 'MATERIAL     MATERIAL'
    moose_outputs = '     neml2_stress equivalent_plastic_strain'
    neml2_outputs = '     state/S      state/internal/ep'

    moose_derivative_types = 'MATERIAL'
    moose_derivatives = 'neml2_jacobian'
    neml2_derivatives = 'state/S forces/E'
  []
[]

[Postprocessors]
  [time]
    type = TimePostprocessor
    outputs = none
    execute_on = 'INITIAL TIMESTEP_BEGIN'
  []
[]

[Materials]
  [convert_strain]
    type = RankTwoTensorToSymmetricRankTwoTensor
    from = 'mechanical_strain'
    to = 'neml2_strain'
  []
  [stress]
    type = ComputeLagrangianObjectiveCustomSymmetricStress
    custom_small_stress = 'neml2_stress'
    custom_small_jacobian = 'neml2_jacobian'
  []
[]

[BCs]
  [xfix]
    type = DirichletBC
    variable = disp_x
    boundary = left
    value = 0
  []
  [yfix]
    type = DirichletBC
    variable = disp_y
    boundary = bottom
    value = 0
  []
  [zfix]
    type = DirichletBC
    variable = disp_z
    boundary = back
    value = 0
  []
  [xdisp]
    type = FunctionDirichletBC
    variable = disp_x
    boundary = right
    function = '0.001*x*t'
    # preset = false
  []
[]

[Executioner]
  type = Transient
  solve_type = NEWTON
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'
  automatic_scaling = true
  dt = 0.1
  dtmin = 1e-3
  dtmax = 0.1
  # num_steps = 5
  end_time = 100
  residual_and_jacobian_together = true
[]

[AuxVariables]
  [strain_xx]
    order = CONSTANT
    family = MONOMIAL
    [AuxKernel]
      type = MaterialRankTwoTensorAux
      property = 'mechanical_strain'
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
      property = 'mechanical_strain'
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
      property = 'mechanical_strain'
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
      property = 'mechanical_strain'
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
      property = 'mechanical_strain'
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
      property = 'mechanical_strain'
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
      property = 'cauchy_stress'
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
      property = 'cauchy_stress'
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
      property = 'cauchy_stress'
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
      property = 'cauchy_stress'
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
      property = 'cauchy_stress'
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
      property = 'cauchy_stress'
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
  exodus = true
  csv = true
  [./pg]
    type = PerfGraphOutput
    level = 3                     # Default is 1
    execute_on = 'initial failed final'
  [../]
[]
