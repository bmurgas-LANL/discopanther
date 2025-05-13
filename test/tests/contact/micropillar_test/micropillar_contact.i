
[GlobalParams]
  displacements = 'disp_x disp_y disp_z'
[]

# [Mesh]#Comment

[Mesh]#Comment
  patch_update_strategy = auto
  patch_size = 2
  partitioner = centroid
  centroid_partitioner_direction = z
  [simple_mesh]
    type = FileMeshGenerator
    file = "micropillar-sx-indenter-case-1.e"
    # displacements = 'disp_x disp_y disp_z'
  []
[] # Mesh


[Variables]
  [./disp_x]
    order = FIRST
    family = LAGRANGE
  [../]

  [./disp_y]
    order = FIRST
    family = LAGRANGE
  [../]
  
  [./disp_z]
    order = FIRST
    family = LAGRANGE
  [../]
[] # Variables

[AuxVariables]
  [saved_x]
  []
  [saved_y]
  []
  [saved_z]
  []
[]

[Physics/SolidMechanics/QuasiStatic]
  [./all]
    add_variables = true
    strain = FINITE
    block = '1 2'
    # use_automatic_differentiation = false # default is false
    new_system = true
    incremental = true
    generate_output = 'stress_xx stress_yy stress_zz stress_xy stress_xz stress_yz'
    save_in = 'saved_x saved_y saved_z'
  [../]
[]

[BCs]

  # fix micropillar base
  [./MP_X]
    type = FunctionDirichletBC
    variable = disp_x
    # boundary = 'z0'
    boundary = back
    function = 0.0
  [../]
    [./MP_X_right]
      type = FunctionDirichletBC
      variable = disp_x
      # boundary = 'x0'
      boundary = rigth
      function = 0.0
    [../]
      [./MP_X_left]
        type = FunctionDirichletBC
        variable = disp_x
        # boundary = 'x1'
        boundary = left
        function = 0.0
      [../]
  [./MP_Y]
    type = FunctionDirichletBC
    variable = disp_y
    # boundary = 'z0'
    boundary = back
    function = 0.0
  [../]
  [./MP_Z]
    type = FunctionDirichletBC
    variable = disp_z
    # boundary = 'z0'
    boundary = back
    function = 0.0
  [../]

  # fix indenter on the xy plane
  [./ID_X]
    type = FunctionDirichletBC
    variable = disp_x
    # boundary = 'z0'
    boundary = frontind
    function = 0.0
  [../]
  [./ID_Y]
    type = FunctionDirichletBC
    variable = disp_y
    # boundary = 'z0'
    boundary = frontind
    function = 0.0
  [../]

  # Compression along z
  [./ID_Loading]
    type = FunctionDirichletBC
    variable = disp_z
    # boundary = 'z0 z1'
    boundary = frontind
    function = '-0.001*z*t'
    # function = '-0.0005*z*t'
  [../]

[] # BCs

[Contact]
  [mortar]
    primary = front
    secondary = backind
    formulation = mortar
    model = coulomb
    friction_coefficient = 0.1
    c_normal = 1e7
    c_tangential = 1.0e7
  []
[]

[UserObjects]
  [slip_rate_gss]
    type = CrystalPlasticitySlipRateGSS
    variable_size = 48
    slip_sys_file_name = "input_slip_sys_bcc48.txt"
    num_slip_sys_flowrate_props = 2
    flowprops = '1 48 0.0001 0.01'
    uo_state_var_name = state_var_gss
    slip_incr_tol = 10.0
    block = 1
  []
  [slip_resistance_gss]
    type = CrystalPlasticitySlipResistanceGSS
    variable_size = 48
    uo_state_var_name = state_var_gss
    block = 1
  []
  [state_var_gss]
    type = CrystalPlasticityStateVariable
    variable_size = 48
    groups = '0 24 48'
    group_values = '900 1000' #120
    uo_state_var_evol_rate_comp_name = state_var_evol_rate_comp_gss
    scale_factor = 1.0
    block = 1
  []
  [state_var_evol_rate_comp_gss]
    type = CrystalPlasticityStateVarRateComponentGSS
    variable_size = 48
    hprops = '1.4 1000 1200 2.5'
    uo_slip_rate_name = slip_rate_gss
    uo_state_var_name = state_var_gss
    block = 1
  []
[]

[Materials]
  [tensor]
    type = ComputeIsotropicElasticityTensor
    block = '2'
    youngs_modulus = 1.141e6
    poissons_ratio = 0.17 #0.07
  []
  [stress]
    type = ComputeFiniteStrainElasticStress
    block = '2'
  []

  [crysp]
    type = FiniteStrainUObasedCP
    block = 1
    stol = 1e-2
    tan_mod_type = exact
    uo_slip_rates = 'slip_rate_gss'
    uo_slip_resistances = 'slip_resistance_gss'
    uo_state_vars = 'state_var_gss'
    uo_state_var_evol_rate_comps = 'state_var_evol_rate_comp_gss'
    maximum_substep_iteration = 20
  []
  [elasticity_tensor]
    type = ComputeElasticityTensorCP
    block = 1
    C_ijkl = '265190 113650 113650 265190 113650 265190 75769 75769 75760'
    fill_method = symmetric9
  []
[]

[Preconditioning]
  [./SMP]
    type = SMP
    full = true
  []
[]

[Executioner]
  type = Transient
  solve_type = 'PJFNK'
  # petsc_options = '-snes_ksp_ew'

  # petsc_options_iname = '-pc_type -snes_linesearch_type -pc_factor_shift_type -pc_factor_shift_amount'
  # petsc_options_value = 'lu       basic                 NONZERO               1e-15'
  # line_search = 'none'
  # automatic_scaling = true
  # nl_abs_tol = 1.5e-07
  # nl_rel_tol = 1.5e-07
  # l_max_its = 40

  # start_time = 0.0
  # dt = 0.025
  # end_time = 50.0

  # solver used in cpam
  # petsc_options_iname = '-pc_type -pc_hypre_type -ksp_gmres_restart'
  # petsc_options_value = 'hypre    boomeramg          31'
  # line_search = 'none'
  # l_max_its = 50
  # nl_max_its = 50
  # # nl_rel_tol = 1e-8
  # nl_abs_tol = 1e-5 #1e-6
  # # l_tol = 1e-8
  # l_abs_tol = 1e-5

  petsc_options = '-snes_converged_reason -ksp_converged_reason -snes_ksp_ew'
  petsc_options_iname = '-pc_type -pc_factor_mat_solver_type -pc_factor_shift_type -pc_factor_shift_amount -mat_mffd_err'
  petsc_options_value = 'lu       superlu_dist                  NONZERO               1e-14                  1e-5'
  l_max_its = 15
  nl_max_its = 30
  nl_rel_tol = 1e-11
  nl_abs_tol = 1e-12
  line_search = 'basic'

  dtmin = 1e-10
  end_time = 100 #100 200
  [./TimeStepper]
    type = ConstantDT
    dt = 0.1
    growth_factor = 1.1
  [../]
[]

[Postprocessors]
  [./maxdisp]
    type = NodalVariableValue
    # nodeid = 451 # 40-1 where 40 is the exodus node number
    nodeid = 1165 # No tilt - flat
    # nodeid = 2170 # No tilt - flat mortar
    # nodeid = 475 # 2 degree tilt
    # nodeid = 1000
    variable = disp_z
  [../]
  [resid_y]
    type = NodalSum
    variable = saved_z
    boundary = 'frontind'
  []
  [./maxdispb]
    type = NodalVariableValue
    # nodeid = 451 # 40-1 where 40 is the exodus node number
    nodeid = 736 # No tilt - flat
    # nodeid = 1614 # No tilt - flat mortar
    # nodeid = 561 # 2 degree tilt
    # nodeid = 22 # 1 2 3 degree tilt case 2
    # nodeid = 1000
    variable = disp_z
  [../]
  [resid_yb]
    type = NodalSum
    variable = saved_z
    boundary = 'backind'
  []
  [resid_z]
    type = NodalSum
    variable = saved_z
    boundary = 'front'
  []
[]

[Outputs]
  [./out]
    type = Exodus
    elemental_as_nodal = true
  [../]
  perf_graph = true
  csv = true
[]

# ## Real 2PK and Lagrangian strain
# [AuxVariables]
#   [./pk2_3]
#     order = CONSTANT
#     family = MONOMIAL
#     block = 1
#   [../]
#   [./LE_3]
#     order = CONSTANT
#     family = MONOMIAL
#     block = 1
#   [../]
# []

# [AuxKernels]
#   [./pk2_3] 
#    type = RankTwoAux
#    variable = pk2_3
#    rank_two_tensor = second_piola_kirchhoff_stress
#    index_j = 2
#    index_i = 2
#    block = 1
#   [../]
#   [./LE_3] 
#    type = RankTwoAux
#    variable = LE_3
#    rank_two_tensor = total_lagrangian_strain
#    index_j = 2
#    index_i = 2
#    block = 1
#   [../]
# []

# [Postprocessors]
#   [./pk2_3]
#     type = ElementAverageValue
#     variable = pk2_3
#     block = 1
#   [../]
#   [./LE_3]
#     type = ElementAverageValue
#     variable = LE_3
#     block = 1
#   [../]
# []

# [AuxVariables]
#   [./sigma_3]
#     order = CONSTANT
#     family = MONOMIAL
#     block = 1
#   [../]
#   [./strain_3]
#     order = CONSTANT
#     family = MONOMIAL
#     block = 1
#   [../]
# []

# [AuxKernels]
#   [./sigma_3] 
#    type = RankTwoAux
#    variable = sigma_3
#    rank_two_tensor = stress
#    index_j = 2
#    index_i = 2
#    block = 1
#   [../]
#   [./strain_3] 
#    type = RankTwoAux
#    variable = strain_3
#    rank_two_tensor = total_strain
#    index_j = 2
#    index_i = 2
#    block = 1
#   [../]
# []

# [Postprocessors]
#   [./sigma_3]
#     type = ElementAverageValue
#     variable = sigma_3
#     block = 1
#   [../]
#   [./strain_3]
#     type = ElementAverageValue
#     variable = strain_3
#     block = 1
#   [../]
# []