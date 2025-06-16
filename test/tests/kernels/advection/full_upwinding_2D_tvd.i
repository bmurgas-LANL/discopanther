# 2D test of advection with full upwinding
# Note there are no overshoots or undershoots
# but there is numerical diffusion.
# The center of the blob advects with the correct velocity
[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 40
  ny = 40
[]

[Variables]
  [./u]
  [../]
[]

[ICs]
  [./u_blob]
    type = FunctionIC
    variable = u
    # function = 'if(x<0.2,if(y<0.2,1,0),0)'
    function = 'if(x<0.2,if(y>0.2,if(y<0.4,1,0),0),0)'
  [../]
[]

[BCs]
# [./allow_mass_out]
#   type = OutflowDislocationBC
#   boundary = top
#   variable = u
#   velocity = '0.0 0.1 0'
# [../]
[]

[Kernels]
  [./udot]
    type = MassLumpedTimeDerivative
    variable = u
  [../]
  # [./advection]
  #   type = ConservativeAdvection
  #   variable = u
  #   upwinding_type = full
  #   velocity = '2 4 0'
  # [../]
  [./advection]
    type = FluxLimitedTVDAdvection
    variable = u
    advective_flux_calculator = fluo
  []
[]

[UserObjects]
  [fluo]
    type = AdvectiveFluxCalculatorConstantVelocity
    flux_limiter_type = superbee #none
    u = u
    velocity = '2 4 0'
  []
[]

# [Executioner]
#   type = Transient
#   solve_type = LINEAR
#   dt = 0.01
#   end_time = 1.0
#   l_tol = 1E-14
# []

[Preconditioning]
  active = basic
  [basic]
    type = SMP
    full = true
    petsc_options = '-ksp_diagonal_scale -ksp_diagonal_scale_fix'
    petsc_options_iname = '-pc_type -sub_pc_type -sub_pc_factor_shift_type -pc_asm_overlap'
    petsc_options_value = ' asm      lu           NONZERO                   2'
  []
  [preferred_but_might_not_be_installed]
    type = SMP
    full = true
    petsc_options_iname = '-pc_type -pc_factor_mat_solver_package'
    petsc_options_value = ' lu       mumps'
  []
[]

# [VectorPostprocessors]
#   [tracer]
#     type = LineValueSampler
#     start_point = '0 0 0'
#     end_point = '1 0.5 0'
#     num_points = 11
#     sort_by = x
#     variable = u
#   []
# []

[Executioner]
  type = Transient
  solve_type = Newton
  end_time = 1.0
  dt = 0.0001
  nl_abs_tol = 1E-8
  nl_max_its = 500
  timestep_tolerance = 1E-3
[]


[Outputs]
  exodus = true
[]
