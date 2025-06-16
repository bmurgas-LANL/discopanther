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
  [./allow_mass_out]
    type = OutflowDislocationBC
    boundary = top
    variable = u
    velocity = '0 0.01 0'
  [../]
  # [./outflow_term]
  #   type = AdvectionBC
  #   variable = u
  #   velocity_vector = 'vx vy'
  #   boundary = 'right'
  # [../]
  # [no_tracer_on_left]
  #   type = DirichletBC
  #   variable = vx
  #   value = 0.0
  #   boundary = top
  # []
[]

[Kernels]
  [./udot]
    type = MassLumpedTimeDerivative
    variable = u
  [../]
  [./advection]
    type = ConservativeAdvection
    variable = u
    upwinding_type = full
    # velocity_variable = '2 0 0'
    velocity_material = 'velocity'
  [../]
  # [heat_conduction]
  #   type = HeatConduction
  #   variable = u
  # []
[]

[Materials]
  [velocityvector]
    type = GenericConstantRealVectorValue
    vector_name = velocity
    vector_values = '2 0 0'
    outputs = all
  []
[]

[Executioner]
  type = Transient
  solve_type = LINEAR
  dt = 0.01
  end_time = 1.0
  l_tol = 1E-14
[]

[Outputs]
  exodus = true
[]
