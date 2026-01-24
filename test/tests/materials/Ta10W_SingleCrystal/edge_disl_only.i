[GlobalParams]
  displacements = 'disp_x disp_y disp_z'
  volumetric_locking_correction = true
[]

[Mesh]
  [singlecrystal]
    type = GeneratedMeshGenerator
    dim = 3
    nx = 2
    ny = 2
    nz = 2
    xmax = 0.1
    ymax = 0.1
    zmax = 0.1
    elem_type = TET4
  []
  [bot_cor]
    type = BoundingBoxNodeSetGenerator
    input = singlecrystal
    new_boundary = 'bot_cor'
    top_right = '0.0005 0.0005 0.0005'
    bottom_left = '-0.0005 -0.0005 -0.0005'
  []
  [bot_x]
    type = BoundingBoxNodeSetGenerator
    input = bot_cor
    new_boundary = 'bot_x'
    top_right = '0.1005 0.0005 0.0005'
    bottom_left = '0.0995 -0.0005 -0.0005'
  []
  [bot_z]
    type = BoundingBoxNodeSetGenerator
    input = bot_x
    new_boundary = 'bot_z'
    top_right = '0.0005 0.0005 0.1005'
    bottom_left = '-0.0005 -0.0005 0.0995'
  []
  final_generator = bot_z
[]

[Outputs]
    file_base = method_Discoflux_n2_tet4
    csv = true
    # [restart]
    #   type = Checkpoint
    #   time_step_interval = 10
    #   num_files = 2
    # []
    [exodus]
      type = Exodus
      time_step_interval = 10
    []
[]

[UserObjects]
  [./prop_read]
    type = PropertyReadFile
    prop_file_name = 'bx-cu-lagb2.inp' 
    nprop = 3
    read_type = block
    nblock = 1
  [../]
[]

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

  # DISLOCATION DENSITIES
  ## POSITIVE EDGE
  [./DD_EdgePositive_1]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_2]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_3]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_4]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_5]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_6]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_7]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_8]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_9]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_10]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_11]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_12]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_13]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_14]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_15]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_16]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_17]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_18]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_19]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_20]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_21]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_22]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_23]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgePositive_24]
    order = FIRST
    family = LAGRANGE
  [../]

  ## NEGATIVE EDGE
  [./DD_EdgeNegative_1]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_2]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_3]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_4]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_5]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_6]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_7]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_8]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_9]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_10]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_11]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_12]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_13]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_14]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_15]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_16]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_17]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_18]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_19]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_20]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_21]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_22]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_23]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_EdgeNegative_24]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[ICs]
  # DISLOCATION DENSITIES
  ## POSITIVE EDGE
  [./ic_DD_EdgePositive_1]
    type = ConstantIC
    variable = DD_EdgePositive_1
    value = 1250
  [../]
  [./ic_DD_EdgePositive_2]
    type = ConstantIC
    variable = DD_EdgePositive_2
    value = 1250
  [../]
  [./ic_DD_EdgePositive_3]
      type = ConstantIC
      variable = DD_EdgePositive_3
      value = 1250
  [../]
  [./ic_DD_EdgePositive_4]
    type = ConstantIC
    variable = DD_EdgePositive_4
    value = 1250
  [../]
  [./ic_DD_EdgePositive_5]
    type = ConstantIC
    variable = DD_EdgePositive_5
    value = 1250
  [../]
    [./ic_DD_EdgePositive_6]
      type = ConstantIC
      variable = DD_EdgePositive_6
      value = 1250
    [../]
  [./ic_DD_EdgePositive_7]
    type = ConstantIC
    variable = DD_EdgePositive_7
    value = 1250
  [../]
  [./ic_DD_EdgePositive_8]
    type = ConstantIC
    variable = DD_EdgePositive_8
    value = 1250
  [../]
    [./ic_DD_EdgePositive_9]
      type = ConstantIC
      variable = DD_EdgePositive_9
      value = 1250
    [../]
  [./ic_DD_EdgePositive_10]
    type = ConstantIC
    variable = DD_EdgePositive_10
    value = 1250
  [../]
  [./ic_DD_EdgePositive_11]
    type = ConstantIC
    variable = DD_EdgePositive_11
    value = 1250
  [../]
  [./ic_DD_EdgePositive_12]
    type = ConstantIC
    variable = DD_EdgePositive_12
    value = 1250
  [../]
  [./ic_DD_EdgePositive_13]
    type = ConstantIC
    variable = DD_EdgePositive_13
    value = 1250
  [../]
  [./ic_DD_EdgePositive_14]
    type = ConstantIC
    variable = DD_EdgePositive_14
    value = 1250
  [../]
  [./ic_DD_EdgePositive_15]
      type = ConstantIC
      variable = DD_EdgePositive_15
      value = 1250
  [../]
  [./ic_DD_EdgePositive_16]
    type = ConstantIC
    variable = DD_EdgePositive_16
    value = 1250
  [../]
  [./ic_DD_EdgePositive_17]
    type = ConstantIC
    variable = DD_EdgePositive_17
    value = 1250
  [../]
  [./ic_DD_EdgePositive_18]
    type = ConstantIC
    variable = DD_EdgePositive_18
    value = 1250
  [../]
  [./ic_DD_EdgePositive_19]
    type = ConstantIC
    variable = DD_EdgePositive_19
    value = 1250
  [../]
  [./ic_DD_EdgePositive_20]
    type = ConstantIC
    variable = DD_EdgePositive_20
    value = 1250
  [../]
    [./ic_DD_EdgePositive_21]
      type = ConstantIC
      variable = DD_EdgePositive_21
      value = 1250
    [../]
  [./ic_DD_EdgePositive_22]
    type = ConstantIC
    variable = DD_EdgePositive_22
    value = 1250
  [../]
  [./ic_DD_EdgePositive_23]
    type = ConstantIC
    variable = DD_EdgePositive_23
    value = 1250
  [../]
  [./ic_DD_EdgePositive_24]
    type = ConstantIC
    variable = DD_EdgePositive_24
    value = 1250
  [../]

  ## NEGATIVE EDGE
  [./ic_DD_EdgeNegative_1]
    type = ConstantIC
    variable = DD_EdgeNegative_1
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_2]
    type = ConstantIC
    variable = DD_EdgeNegative_2
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_3]
    type = ConstantIC
    variable = DD_EdgeNegative_3
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_4]
    type = ConstantIC
    variable = DD_EdgeNegative_4
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_5]
    type = ConstantIC
    variable = DD_EdgeNegative_5
    value = 1250
  [../]
    [./ic_DD_EdgeNegative_6]
      type = ConstantIC
      variable = DD_EdgeNegative_6
      value = 1250
    [../]
  [./ic_DD_EdgeNegative_7]
    type = ConstantIC
    variable = DD_EdgeNegative_7
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_8]
    type = ConstantIC
    variable = DD_EdgeNegative_8
    value = 1250
  [../]
    [./ic_DD_EdgeNegative_9]
      type = ConstantIC
      variable = DD_EdgeNegative_9
      value = 1250
    [../]
  [./ic_DD_EdgeNegative_10]
    type = ConstantIC
    variable = DD_EdgeNegative_10
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_11]
    type = ConstantIC
    variable = DD_EdgeNegative_11
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_12]
    type = ConstantIC
    variable = DD_EdgeNegative_12
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_13]
    type = ConstantIC
    variable = DD_EdgeNegative_13
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_14]
    type = ConstantIC
    variable = DD_EdgeNegative_14
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_15]
      type = ConstantIC
      variable = DD_EdgeNegative_15
      value = 1250
  [../]
  [./ic_DD_EdgeNegative_16]
    type = ConstantIC
    variable = DD_EdgeNegative_16
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_17]
    type = ConstantIC
    variable = DD_EdgeNegative_17
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_18]
    type = ConstantIC
    variable = DD_EdgeNegative_18
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_19]
    type = ConstantIC
    variable = DD_EdgeNegative_19
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_20]
    type = ConstantIC
    variable = DD_EdgeNegative_20
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_21]
    type = ConstantIC
    variable = DD_EdgeNegative_21
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_22]
    type = ConstantIC
    variable = DD_EdgeNegative_22
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_23]
    type = ConstantIC
    variable = DD_EdgeNegative_23
    value = 1250
  [../]
  [./ic_DD_EdgeNegative_24]
    type = ConstantIC
    variable = DD_EdgeNegative_24
    value = 1250
  [../]
[]


[Kernels]
  [./dot_DD_EdgePositive_1]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_1
    # block = 1
  [../]
    [./Source_DD_EdgePositive_1]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_1
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 1
      #block = 1
    [../]
  [./dot_DD_EdgePositive_2]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_2
    # block = 1
  [../]
    [./Source_DD_EdgePositive_2]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_2
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 2
      #block = 1
    [../]
  [./dot_DD_EdgePositive_3]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_3
    #block = 1
  [../]
    [./Source_DD_EdgePositive_3]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_3
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 3
      # block = 1
    [../]
  [./dot_DD_EdgePositive_4]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_4
    #block = 1
  [../]
    [./Source_DD_EdgePositive_4]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_4
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 4
      #block = 1
    [../]
  [./dot_DD_EdgePositive_5]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_5
    #block = 1
  [../]
    [./Source_DD_EdgePositive_5]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_5
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 5
      #block = 1
    [../]
  [./dot_DD_EdgePositive_6]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_6
    #block = 1
  [../]
    [./Source_DD_EdgePositive_6]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_6
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 6
      #block = 1
    [../]
  [./dot_DD_EdgePositive_7]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_7
    #block = 1
  [../]
    [./Source_DD_EdgePositive_7]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_7
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 7
      #block = 1
    [../]
  [./dot_DD_EdgePositive_8]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_8
    #block = 1
  [../]
    [./Source_DD_EdgePositive_8]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_8
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 8
      #block = 1
    [../]
  [./dot_DD_EdgePositive_9]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_9
    #block = 1
  [../]
    [./Source_DD_EdgePositive_9]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_9
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 9
      #block = 1
    [../]
  [./dot_DD_EdgePositive_10]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_10
    #block = 1
  [../]
    [./Source_DD_EdgePositive_10]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_10
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 10
      #block = 1
    [../]
  [./dot_DD_EdgePositive_11]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_11
    #block = 1
  [../]
    [./Source_DD_EdgePositive_11]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_11
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 11
      #block = 1
    [../]
  [./dot_DD_EdgePositive_12]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_12
    #block = 1
  [../]
    [./Source_DD_EdgePositive_12]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_12
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 12
      #block = 1
    [../]
  
  [./dot_DD_EdgePositive_13]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_13
    # block = 1
  [../]
    [./Source_DD_EdgePositive_13]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_13
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 13
      #block = 1
    [../]
  [./dot_DD_EdgePositive_14]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_14
    # block = 1
  [../]
    [./Source_DD_EdgePositive_14]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_14
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 14
      #block = 1
    [../]
  [./dot_DD_EdgePositive_15]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_15
    #block = 1
  [../]
    [./Source_DD_EdgePositive_15]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_15
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 15
      # block = 1
    [../]
  [./dot_DD_EdgePositive_16]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_16
    #block = 1
  [../]
    [./Source_DD_EdgePositive_16]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_16
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 16
      #block = 1
    [../]
  [./dot_DD_EdgePositive_17]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_17
    #block = 1
  [../]
    [./Source_DD_EdgePositive_17]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_17
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 17
      #block = 1
    [../]
  [./dot_DD_EdgePositive_18]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_18
    #block = 1
  [../]
    [./Source_DD_EdgePositive_18]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_18
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 18
      #block = 1
    [../]
  [./dot_DD_EdgePositive_19]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_19
    #block = 1
  [../]
    [./Source_DD_EdgePositive_19]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_19
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 19
      #block = 1
    [../]
  [./dot_DD_EdgePositive_20]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_20
    #block = 1
  [../]
    [./Source_DD_EdgePositive_20]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_20
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 20
      #block = 1
    [../]
  [./dot_DD_EdgePositive_21]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_21
    #block = 1
  [../]
    [./Source_DD_EdgePositive_21]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_21
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 21
      #block = 1
    [../]
  [./dot_DD_EdgePositive_22]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_22
    #block = 1
  [../]
    [./Source_DD_EdgePositive_22]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_22
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 22
      #block = 1
    [../]
  [./dot_DD_EdgePositive_23]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_23
    #block = 1
  [../]
    [./Source_DD_EdgePositive_23]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_23
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 23
      #block = 1
    [../]
  [./dot_DD_EdgePositive_24]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_24
    #block = 1
  [../]
    [./Source_DD_EdgePositive_24]
      type = DislocationSourceVolume  
      variable = DD_EdgePositive_24
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 24
      #block = 1
    [../]

  # ==========
  [./dot_DD_EdgeNegative_1]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_1
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_1]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_1
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 1
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_2]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_2
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_2]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_2
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 2
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_3]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_3
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_3]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_3
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 3
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_4]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_4
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_4]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_4
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 4
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_5]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_5
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_5]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_5
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 5
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_6]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_6
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_6]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_6
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 6
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_7]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_7
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_7]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_7
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 7
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_8]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_8
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_8]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_8
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 8
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_9]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_9
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_9]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_9
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 9
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_10]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_10
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_10]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_10
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 10
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_11]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_11
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_11]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_11
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 11
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_12]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_12
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_12]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_12
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 12
      #block = 1
    [../]

  [./dot_DD_EdgeNegative_13]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_13
    # block = 1
  [../]
    [./Source_DD_EdgeNegative_13]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_13
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 13
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_14]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_14
    # block = 1
  [../]
    [./Source_DD_EdgeNegative_14]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_14
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 14
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_15]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_15
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_15]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_15
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 15
      # block = 1
    [../]
  [./dot_DD_EdgeNegative_16]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_16
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_16]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_16
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 16
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_17]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_17
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_17]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_17
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 17
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_18]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_18
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_18]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_18
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 18
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_19]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_19
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_19]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_19
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 19
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_20]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_20
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_20]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_20
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 20
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_21]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_21
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_21]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_21
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 21
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_22]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_22
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_22]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_22
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 22
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_23]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_23
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_23]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_23
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 23
      #block = 1
    [../]
  [./dot_DD_EdgeNegative_24]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_24
    #block = 1
  [../]
    [./Source_DD_EdgeNegative_24]
      type = DislocationSourceVolume  
      variable = DD_EdgeNegative_24
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 24
      #block = 1
    [../]
[]

[AuxVariables]
  [euler_angle_1]
    order = CONSTANT
    family = MONOMIAL
  []
  [euler_angle_2]
    order = CONSTANT
    family = MONOMIAL
  []
  [euler_angle_3]
    order = CONSTANT
    family = MONOMIAL
  []
[]

[AuxKernels]
  [euler_angle_1]
    type = MaterialRealVectorValueAux
    variable = euler_angle_1
    property = updated_Euler_angle
    component = 0
    # execute_on = 'initial final'
    execute_on = 'initial timestep_end'
  []
  [euler_angle_2]
    type = MaterialRealVectorValueAux
    variable = euler_angle_2
    property = updated_Euler_angle
    component = 1
    # execute_on = 'initial final'
    execute_on = 'initial timestep_end'
  []
  [euler_angle_3]
    type = MaterialRealVectorValueAux
    variable = euler_angle_3
    property = updated_Euler_angle
    component = 2
    # execute_on = 'initial final'
    execute_on = 'initial timestep_end'
  []
[]

[BCs]
  ##############################################
  # X : Left and Right
  # Y : Bottom and Top
  # Z : Back and Front
  ##############################################
  #=============== bottom face =================
  # ensure bottom corner is fixed
  [./BC_CX]
    type = FunctionDirichletBC
    variable = disp_x
    boundary = 'bot_cor'
    # boundary = back
    function = 0.0
  [../]
  [./BC_CY]
    type = FunctionDirichletBC
    variable = disp_y
    boundary = 'bot_cor'
    # boundary = back
    function = 0.0
  [../]
  [./BC_CZ]
    type = FunctionDirichletBC
    variable = disp_z
    boundary = 'bot_cor'
    # boundary = back
    function = 0.0
  [../]
  
  # ensure y and z displacement are zero on point set bot_x
  [./BC_C1Y]
    type = FunctionDirichletBC
    variable = disp_y
    boundary = 'bot_x'
    # boundary = back
    function = 0.0
  [../]
  [./BC_C1Z]
    type = FunctionDirichletBC
    variable = disp_z
    boundary = 'bot_x'
    # boundary = back
    function = 0.0
  [../]

  # ensure y and x displacement are zero on point set bot_z
  [./BC_C2Y]
    type = FunctionDirichletBC
    variable = disp_y
    boundary = 'bot_z'
    # boundary = back
    function = 0.0
  [../]
  [./BC_C2X]
    type = FunctionDirichletBC
    variable = disp_x
    boundary = 'bot_z'
    # boundary = back
    function = 0.0
  [../]

  # ensure y displacement is zero on the bottom face
  [./BC_Y1Y]
    type = FunctionDirichletBC
    variable = disp_y
    boundary = 'bottom'
    # boundary = back
    function = 0.0
  [../]

  
  [./BC_Y2Y]
    type = FunctionDirichletBC
    variable = disp_y
    boundary = 'top'
    function = '0.0001 * t'
  [../]
[]

[Physics/SolidMechanics/QuasiStatic/all]
  strain = FINITE
  add_variables = true
  new_system = true
  incremental = true
[]

[Materials]
  [./elasticity_tensor]
    type = ElasticityTensorRotated # ComputeElasticityTensorCP
    C_ijkl = '2.8251e5 1.6124e5 1.61245 2.8251e5 1.61245 2.8251e5 0.8315e5 0.8315e5 0.8315e5'
    fill_method = symmetric9
    read_prop_user_object = prop_read
    C_ijkl_t = '-1.93e1 -3.12e0 -3.12e0 -1.93e1 -3.12e0 -1.93e1 -1.47e1 -1.47e1 -1.47e1'
    temp0 = 300
  [../]
  [stress_brass]
    type = ComputeMultipleCrystalPlasticityOrowanStress
    crystal_plasticity_models = 'CP_DiscoFlux'
    tan_mod_type = exact
    print_state_variable_convergence_error_messages = false
  []
  [./CP_DiscoFlux]
    type                      = DiscoFluxCPBCCOrowanStressUpdate
    number_slip_systems       = 24
    slip_sys_file_name        = input_slip_sys.inp
    lattice_friction          = 480.0
    lattice_friction_112      = 575.0
    lattice_friction_112_atw  = 1075.0
    Coeff_hardening           = 0.52
    Coeff_backstress          = 0.0
    initial_athermal          = 102.0
    dd_sat                    = 1.e9
    sat_A                     = 5.135e-18
    min_dd                    = 62500
    nrec                      = 4.0
    gamdot_ref                = 1.e3
    q1                        = 0.376
    q2                        = 1.666
    B0                        = 1.25e-11
    B0s                       = 1.25e-11
    vs_edge                   = 2.e6
    vs_screw                  = 2.e6
    temp                      = 300
    omega0                    = 1e11
    g0                        = 0.2
    mu                        = 78.49e+3
    nu                        = 0.334


    slip_increment_tolerance = 0.02
    dislo_density_factor_CDT = 1.0

    mean_free_path_init_flag = false
    disloc_den_threshold_flag = true

    DD_EdgePositive_1   = DD_EdgePositive_1
    DD_EdgePositive_2   = DD_EdgePositive_2
    DD_EdgePositive_3   = DD_EdgePositive_3
    DD_EdgePositive_4   = DD_EdgePositive_4
    DD_EdgePositive_5   = DD_EdgePositive_5
    DD_EdgePositive_6   = DD_EdgePositive_6
    DD_EdgePositive_7   = DD_EdgePositive_7
    DD_EdgePositive_8   = DD_EdgePositive_8
    DD_EdgePositive_9   = DD_EdgePositive_9
    DD_EdgePositive_10  = DD_EdgePositive_10
    DD_EdgePositive_11  = DD_EdgePositive_11
    DD_EdgePositive_12  = DD_EdgePositive_12
    DD_EdgePositive_13  = DD_EdgePositive_13
    DD_EdgePositive_14  = DD_EdgePositive_14
    DD_EdgePositive_15  = DD_EdgePositive_15
    DD_EdgePositive_16  = DD_EdgePositive_16
    DD_EdgePositive_17  = DD_EdgePositive_17
    DD_EdgePositive_18  = DD_EdgePositive_18
    DD_EdgePositive_19  = DD_EdgePositive_19
    DD_EdgePositive_20  = DD_EdgePositive_20
    DD_EdgePositive_21  = DD_EdgePositive_21
    DD_EdgePositive_22  = DD_EdgePositive_22
    DD_EdgePositive_23  = DD_EdgePositive_23
    DD_EdgePositive_24  = DD_EdgePositive_24

    DD_EdgeNegative_1   = DD_EdgeNegative_1
    DD_EdgeNegative_2   = DD_EdgeNegative_2
    DD_EdgeNegative_3   = DD_EdgeNegative_3
    DD_EdgeNegative_4   = DD_EdgeNegative_4
    DD_EdgeNegative_5   = DD_EdgeNegative_5
    DD_EdgeNegative_6   = DD_EdgeNegative_6
    DD_EdgeNegative_7   = DD_EdgeNegative_7
    DD_EdgeNegative_8   = DD_EdgeNegative_8
    DD_EdgeNegative_9   = DD_EdgeNegative_9
    DD_EdgeNegative_10  = DD_EdgeNegative_10
    DD_EdgeNegative_11  = DD_EdgeNegative_11
    DD_EdgeNegative_12  = DD_EdgeNegative_12
    DD_EdgeNegative_13  = DD_EdgeNegative_13
    DD_EdgeNegative_14  = DD_EdgeNegative_14
    DD_EdgeNegative_15  = DD_EdgeNegative_15
    DD_EdgeNegative_16  = DD_EdgeNegative_16
    DD_EdgeNegative_17  = DD_EdgeNegative_17
    DD_EdgeNegative_18  = DD_EdgeNegative_18
    DD_EdgeNegative_19  = DD_EdgeNegative_19
    DD_EdgeNegative_20  = DD_EdgeNegative_20
    DD_EdgeNegative_21  = DD_EdgeNegative_21
    DD_EdgeNegative_22  = DD_EdgeNegative_22
    DD_EdgeNegative_23  = DD_EdgeNegative_23
    DD_EdgeNegative_24  = DD_EdgeNegative_24

    print_state_variable_convergence_error_messages = false
  [../]
  [updated_euler_angle]
    type = ComputeUpdatedEulerAngle
    radian_to_degree = true
  []
[]

[Postprocessors]
  [euler_angle_1] 
    type = ElementAverageValue
    variable = euler_angle_1
  []
  [euler_angle_2]
    type = ElementAverageValue
    variable = euler_angle_2
  []
  [euler_angle_3]
    type = ElementAverageValue
    variable = euler_angle_3
  []
[]

[GlobalParams]
  number_slip_systems     = 24
  dislo_density_initial   = 247500
  C_multi                 = 0.45 
  C_trap                  = 0.405 
  C_m_ann                 = 0.0 
  C_im_ann                = 0.0 
  burgers_vector_mag      = 2.8579e-7
[]

[Preconditioning]
  [./smp]
    type = SMP
    full = true
  [../]
[]

[Executioner]
  type = Transient
  
  solve_type = 'NEWTON'
  petsc_options = '-snes_converged_reason'
  petsc_options_iname = '-pc_type -pc_asm_overlap -sub_pc_type -ksp_type -ksp_gmres_restart'
  petsc_options_value = ' asm      2              lu            gmres     200'
  # petsc_options = '-snes_ksp_ew'
  # petsc_options_iname = '-pc_type -pc_factor_mat_solver_package'
  # petsc_options_value = 'lu   mumps'
  # petsc_options_iname = '-pc_type -pc_hypre_type -ksp_gmres_restart'
  # petsc_options_value = 'hypre    boomeramg          31'
  line_search = 'none'
  l_max_its = 50
  nl_max_its = 50
  nl_abs_tol = 1e-6 #1e-6
  l_abs_tol = 1e-6

  dtmax = 0.05
  dtmin = 1e-10
  end_time = 20  #100 200

  [./TimeStepper]
    type = ConstantDT
    dt = 0.05
    growth_factor = 1.05
  [../]
[]



## Real 2PK and Lagrangian strain
[AuxVariables]
  [./pk2r_3]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./LE_3]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

[AuxKernels]
  [./pk2r_3] 
   type = RankTwoAux
   variable = pk2r_3
   rank_two_tensor = second_piola_kirchhoff_stress
   index_j = 2
   index_i = 2
  [../]
  [./LE_3] 
   type = RankTwoAux
   variable = LE_3
   rank_two_tensor = total_lagrangian_strain
   index_j = 2
   index_i = 2
  [../]
[]

[Postprocessors]
  [./pk2r_3]
    type = ElementAverageValue
    variable = pk2r_3
  [../]
  [./LE_3]
    type = ElementAverageValue
    variable = LE_3
  [../]
[]
#################################

# stress and strain variables
[AuxVariables]
  [./pk2_1]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./pk2_2]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./pk2_3]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./pk2_4]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./pk2_5]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./pk2_6]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./E_1]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./E_2]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./E_3]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./E_4]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./E_5]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./E_6]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

[AuxKernels]
  [./pk2_1] 
   type = RankTwoAux
   variable = pk2_1
   rank_two_tensor = stress
   index_j = 0
   index_i = 0
  [../]
  [./pk2_2] 
    type = RankTwoAux
    variable = pk2_2
    rank_two_tensor = stress
    index_j = 1
    index_i = 1
  [../]
  [./pk2_3] 
   type = RankTwoAux
   variable = pk2_3
   rank_two_tensor = stress
   index_j = 2
   index_i = 2
  [../]
  [./pk2_4] 
    type = RankTwoAux
    variable = pk2_4
    rank_two_tensor = stress
    index_j = 0
    index_i = 1
  [../]
  [./pk2_5] 
    type = RankTwoAux
    variable = pk2_5
    rank_two_tensor = stress
    index_j = 0
    index_i = 2
  [../]
  [./pk2_6] 
    type = RankTwoAux
    variable = pk2_6
    rank_two_tensor = stress
    index_j = 1
    index_i = 2
  [../]
  [./E_1]
   type = RankTwoAux
   variable = E_1
   rank_two_tensor = total_strain
   index_j = 0
   index_i = 0
  [../]
  [./E_2] 
    type = RankTwoAux
    variable = E_2
    rank_two_tensor = total_strain
    index_j = 1
    index_i = 1
  [../]
  [./E_3] 
   type = RankTwoAux
   variable = E_3
   rank_two_tensor = total_strain
   index_j = 2
   index_i = 2
  [../]
  [./E_4] 
    type = RankTwoAux
    variable = E_4
    rank_two_tensor = total_strain
    index_j = 0
    index_i = 1
  [../]
  [./E_5] 
    type = RankTwoAux
    variable = E_5
    rank_two_tensor = total_strain
    index_j = 0
    index_i = 2
  [../]
  [./E_6] 
    type = RankTwoAux
    variable = E_6
    rank_two_tensor = total_strain
    index_j = 1
    index_i = 2
  [../]
[]

[Postprocessors]
  [./pk2_1]
    type = ElementAverageValue
    variable = pk2_1
  [../]
  [./pk2_2]
    type = ElementAverageValue
    variable = pk2_2
  [../]
  [./pk2_3]
    type = ElementAverageValue
    variable = pk2_3
  [../]
  [./pk2_4]
    type = ElementAverageValue
    variable = pk2_4
  [../]
  [./pk2_5]
    type = ElementAverageValue
    variable = pk2_5
  [../]
  [./pk2_6]
    type = ElementAverageValue
    variable = pk2_6
  [../]
  [./E_1]
    type = ElementAverageValue
    variable = E_1
  [../]
  [./E_2]
    type = ElementAverageValue
    variable = E_2
  [../]
  [./E_3]
    type = ElementAverageValue
    variable = E_3
  [../]
  [./E_4]
    type = ElementAverageValue
    variable = E_4
  [../]
  [./E_5]
    type = ElementAverageValue
    variable = E_5
  [../]
  [./E_6]
    type = ElementAverageValue
    variable = E_6
  [../]
[]

# mobile and immobile dislocations
[AuxVariables]
  [./DD_mobile_01]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_02]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_03]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_04]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_05]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_06]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_07]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_08]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_09]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_10]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_11]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_12]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_13]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_14]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_15]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_16]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_17]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_18]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_19]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_20]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_21]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_22]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_23]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_24]
   order = CONSTANT
   family = MONOMIAL
  [../]

  [./DD_immobile_01]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_02]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_03]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_04]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_05]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_06]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_07]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_08]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_09]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_10]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_11]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_12]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_13]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_14]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_15]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_16]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_17]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_18]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_19]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_20]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_21]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_22]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_23]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_immobile_24]
   order = CONSTANT
   family = MONOMIAL
  [../]
[]

[AuxKernels]
  [./DD_mobile_01]
   type = MaterialStdVectorAux
   variable = DD_mobile_01
   property = dislocation_mobile
   index = 0
  [../]
  [./DD_mobile_02]
   type = MaterialStdVectorAux
   variable = DD_mobile_02
   property = dislocation_mobile
   index = 1
  [../]
  [./DD_mobile_03]
   type = MaterialStdVectorAux
   variable = DD_mobile_03
   property = dislocation_mobile
   index = 2
  [../]
  [./DD_mobile_04]
   type = MaterialStdVectorAux
   variable = DD_mobile_04
   property = dislocation_mobile
   index = 3
  [../]
  [./DD_mobile_05]
   type = MaterialStdVectorAux
   variable = DD_mobile_05
   property = dislocation_mobile
   index = 4
  [../]
  [./DD_mobile_06]
   type = MaterialStdVectorAux
   variable = DD_mobile_06  
   property = dislocation_mobile
   index = 5
  [../]
  [./DD_mobile_07]
   type = MaterialStdVectorAux
   variable = DD_mobile_07
   property = dislocation_mobile
   index = 6
  [../]
  [./DD_mobile_08]
   type = MaterialStdVectorAux
   variable = DD_mobile_08
   property = dislocation_mobile
   index = 7
  [../]
  [./DD_mobile_09]
   type = MaterialStdVectorAux
   variable = DD_mobile_09
   property = dislocation_mobile
   index = 8
  [../]
  [./DD_mobile_10]
   type = MaterialStdVectorAux
   variable = DD_mobile_10
   property = dislocation_mobile
   index = 9
  [../]
  [./DD_mobile_11]
   type = MaterialStdVectorAux
   variable = DD_mobile_11
   property = dislocation_mobile
   index = 10
  [../]
  [./DD_mobile_12]
   type = MaterialStdVectorAux
   variable = DD_mobile_12
   property = dislocation_mobile
   index = 11
  [../]
  [./DD_mobile_13]
   type = MaterialStdVectorAux
   variable = DD_mobile_13
   property = dislocation_mobile
   index = 12
  [../]
  [./DD_mobile_14]
   type = MaterialStdVectorAux
   variable = DD_mobile_14
   property = dislocation_mobile
   index = 13
  [../]
  [./DD_mobile_15]
   type = MaterialStdVectorAux
   variable = DD_mobile_15
   property = dislocation_mobile
   index = 14
  [../]
  [./DD_mobile_16]
   type = MaterialStdVectorAux
   variable = DD_mobile_16
   property = dislocation_mobile
   index = 15
  [../]
  [./DD_mobile_17]
   type = MaterialStdVectorAux
   variable = DD_mobile_17
   property = dislocation_mobile
   index = 16
  [../]
  [./DD_mobile_18]
   type = MaterialStdVectorAux
   variable = DD_mobile_18
   property = dislocation_mobile
   index = 17
  [../]
  [./DD_mobile_19]
   type = MaterialStdVectorAux
   variable = DD_mobile_19
   property = dislocation_mobile
   index = 18
  [../]
  [./DD_mobile_20]
   type = MaterialStdVectorAux
   variable = DD_mobile_20
   property = dislocation_mobile
   index = 19
  [../]
  [./DD_mobile_21]
   type = MaterialStdVectorAux
   variable = DD_mobile_21
   property = dislocation_mobile
   index = 20
  [../]
  [./DD_mobile_22]
   type = MaterialStdVectorAux
   variable = DD_mobile_22
   property = dislocation_mobile
   index = 21
  [../]
  [./DD_mobile_23]
   type = MaterialStdVectorAux
   variable = DD_mobile_23
   property = dislocation_mobile
   index = 22
  [../]
  [./DD_mobile_24]
   type = MaterialStdVectorAux
   variable = DD_mobile_24
   property = dislocation_mobile
   index = 23
  [../]

  [./DD_immobile_01]
   type = MaterialStdVectorAux
   variable = DD_immobile_01
   property = dislocation_immobile
   index = 0
  [../]
  [./DD_immobile_02]
   type = MaterialStdVectorAux
   variable = DD_immobile_02
   property = dislocation_immobile
   index = 1
  [../]
  [./DD_immobile_03]
   type = MaterialStdVectorAux
   variable = DD_immobile_03
   property = dislocation_immobile
   index = 2
  [../]
  [./DD_immobile_04]
   type = MaterialStdVectorAux
   variable = DD_immobile_04
   property = dislocation_immobile
   index = 3
  [../]
  [./DD_immobile_05]
   type = MaterialStdVectorAux
   variable = DD_immobile_05
   property = dislocation_immobile
   index = 4
  [../]
  [./DD_immobile_06]
   type = MaterialStdVectorAux
   variable = DD_immobile_06  
   property = dislocation_immobile
   index = 5
  [../]
  [./DD_immobile_07]
   type = MaterialStdVectorAux
   variable = DD_immobile_07
   property = dislocation_immobile
   index = 6
  [../]
  [./DD_immobile_08]
   type = MaterialStdVectorAux
   variable = DD_immobile_08
   property = dislocation_immobile
   index = 7
  [../]
  [./DD_immobile_09]
   type = MaterialStdVectorAux
   variable = DD_immobile_09
   property = dislocation_immobile
   index = 8
  [../]
  [./DD_immobile_10]
   type = MaterialStdVectorAux
   variable = DD_immobile_10
   property = dislocation_immobile
   index = 9
  [../]
  [./DD_immobile_11]
   type = MaterialStdVectorAux
   variable = DD_immobile_11
   property = dislocation_immobile
   index = 10
  [../]
  [./DD_immobile_12]
   type = MaterialStdVectorAux
   variable = DD_immobile_12
   property = dislocation_immobile
   index = 11
  [../]
  [./DD_immobile_13]
   type = MaterialStdVectorAux
   variable = DD_immobile_13
   property = dislocation_immobile
   index = 12
  [../]
  [./DD_immobile_14]
   type = MaterialStdVectorAux
   variable = DD_immobile_14
   property = dislocation_immobile
   index = 13
  [../]
  [./DD_immobile_15]
   type = MaterialStdVectorAux
   variable = DD_immobile_15
   property = dislocation_immobile
   index = 14
  [../]
  [./DD_immobile_16]
   type = MaterialStdVectorAux
   variable = DD_immobile_16
   property = dislocation_immobile
   index = 15
  [../]
  [./DD_immobile_17]
   type = MaterialStdVectorAux
   variable = DD_immobile_17
   property = dislocation_immobile
   index = 16
  [../]
  [./DD_immobile_18]
   type = MaterialStdVectorAux
   variable = DD_immobile_18
   property = dislocation_immobile
   index = 17
  [../]
  [./DD_immobile_19]
   type = MaterialStdVectorAux
   variable = DD_immobile_19
   property = dislocation_immobile
   index = 18
  [../]
  [./DD_immobile_20]
   type = MaterialStdVectorAux
   variable = DD_immobile_20
   property = dislocation_immobile
   index = 19
  [../]
  [./DD_immobile_21]
   type = MaterialStdVectorAux
   variable = DD_immobile_21
   property = dislocation_immobile
   index = 20
  [../]
  [./DD_immobile_22]
   type = MaterialStdVectorAux
   variable = DD_immobile_22
   property = dislocation_immobile
   index = 21
  [../]
  [./DD_immobile_23]
   type = MaterialStdVectorAux
   variable = DD_immobile_23
   property = dislocation_immobile
   index = 22
  [../]
  [./DD_immobile_24]
   type = MaterialStdVectorAux
   variable = DD_immobile_24
   property = dislocation_immobile
   index = 23
  [../]
[]

# shear stresses
[AuxVariables]
  [./shear_stress_01]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_02]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_03]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_04]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_05]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_06]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_07]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_08]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_09]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_10]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_11]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_12]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_13]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_14]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_15]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_16]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_17]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_18]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_19]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_20]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_21]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_22]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_23]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_stress_24]
   order = CONSTANT
   family = MONOMIAL
  [../]
[]

[AuxKernels]
  [./shear_stress_01]
   type = MaterialStdVectorAux
   variable = shear_stress_01
   property = applied_shear_stress  
   index = 0
  [../]
  [./shear_stress_02]
   type = MaterialStdVectorAux
   variable = shear_stress_02
   property = applied_shear_stress  
   index = 1
  [../]
  [./shear_stress_03]
   type = MaterialStdVectorAux
   variable = shear_stress_03
   property = applied_shear_stress  
   index = 2
  [../]
  [./shear_stress_04]
   type = MaterialStdVectorAux
   variable = shear_stress_04
   property = applied_shear_stress  
   index = 3
  [../]
  [./shear_stress_05]
   type = MaterialStdVectorAux
   variable = shear_stress_05
   property = applied_shear_stress  
   index = 4
  [../]
  [./shear_stress_06]
   type = MaterialStdVectorAux
   variable = shear_stress_06
   property = applied_shear_stress  
   index = 5
  [../]
  [./shear_stress_07]
   type = MaterialStdVectorAux
   variable = shear_stress_07
   property = applied_shear_stress  
   index = 6
  [../]
  [./shear_stress_08]
   type = MaterialStdVectorAux
   variable = shear_stress_08
   property = applied_shear_stress  
   index = 7
  [../]
  [./shear_stress_09]
   type = MaterialStdVectorAux
   variable = shear_stress_09
   property = applied_shear_stress  
   index = 8
  [../]
  [./shear_stress_10]
   type = MaterialStdVectorAux
   variable = shear_stress_10
   property = applied_shear_stress  
   index = 9
  [../]
  [./shear_stress_11]
   type = MaterialStdVectorAux
   variable = shear_stress_11
   property = applied_shear_stress  
   index = 10
  [../]
  [./shear_stress_12]
   type = MaterialStdVectorAux
   variable = shear_stress_12
   property = applied_shear_stress  
   index = 11
  [../]
  [./shear_stress_13]
   type = MaterialStdVectorAux
   variable = shear_stress_13
   property = applied_shear_stress  
   index = 12
  [../]
  [./shear_stress_14]
   type = MaterialStdVectorAux
   variable = shear_stress_14
   property = applied_shear_stress  
   index = 13
  [../]
  [./shear_stress_15]
   type = MaterialStdVectorAux
   variable = shear_stress_15
   property = applied_shear_stress  
   index = 14
  [../]
  [./shear_stress_16]
   type = MaterialStdVectorAux
   variable = shear_stress_16
   property = applied_shear_stress  
   index = 15
  [../]
  [./shear_stress_17]
   type = MaterialStdVectorAux
   variable = shear_stress_17
   property = applied_shear_stress  
   index = 16
  [../]
  [./shear_stress_18]
   type = MaterialStdVectorAux
   variable = shear_stress_18
   property = applied_shear_stress  
   index = 17
  [../]
  [./shear_stress_19]
   type = MaterialStdVectorAux
   variable = shear_stress_19
   property = applied_shear_stress  
   index = 18
  [../]
  [./shear_stress_20]
   type = MaterialStdVectorAux
   variable = shear_stress_20
   property = applied_shear_stress  
   index = 19
  [../]
  [./shear_stress_21]
   type = MaterialStdVectorAux
   variable = shear_stress_21
   property = applied_shear_stress  
   index = 20
  [../]
  [./shear_stress_22]
   type = MaterialStdVectorAux
   variable = shear_stress_22
   property = applied_shear_stress  
   index = 21
  [../]
  [./shear_stress_23]
   type = MaterialStdVectorAux
   variable = shear_stress_23
   property = applied_shear_stress  
   index = 22
  [../]
  [./shear_stress_24]
   type = MaterialStdVectorAux
   variable = shear_stress_24
   property = applied_shear_stress  
   index = 23
  [../]
[]

# slip_resistance
[AuxVariables]
  [./shear_resistance_01]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_02]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_03]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_04]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_05]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_06]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_07]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_08]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_09]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_10]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_11]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_12]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_13]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_14]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_15]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_16]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_17]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_18]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_19]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_20]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_21]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_22]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_23]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./shear_resistance_24]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

[AuxKernels]
  [./shear_resistance_01]
    type = MaterialStdVectorAux
    variable = shear_resistance_01
    property = slip_resistance  
    index = 0
  [../]
  [./shear_resistance_02]
    type = MaterialStdVectorAux
    variable = shear_resistance_02
    property = slip_resistance  
    index = 1
  [../]
  [./shear_resistance_03]
    type = MaterialStdVectorAux
    variable = shear_resistance_03
    property = slip_resistance  
    index = 2
  [../]
  [./shear_resistance_04]
    type = MaterialStdVectorAux
    variable = shear_resistance_04
    property = slip_resistance  
    index = 3
  [../]
  [./shear_resistance_05]
    type = MaterialStdVectorAux
    variable = shear_resistance_05
    property = slip_resistance  
    index = 4
  [../]
  [./shear_resistance_06]
    type = MaterialStdVectorAux
    variable = shear_resistance_06
    property = slip_resistance  
    index = 5
  [../]
  [./shear_resistance_07]
    type = MaterialStdVectorAux
    variable = shear_resistance_07
    property = slip_resistance  
    index = 6
  [../]
  [./shear_resistance_08]
    type = MaterialStdVectorAux
    variable = shear_resistance_08
    property = slip_resistance  
    index = 7
  [../]
  [./shear_resistance_09]
    type = MaterialStdVectorAux
    variable = shear_resistance_09
    property = slip_resistance  
    index = 8
  [../]
  [./shear_resistance_10]
    type = MaterialStdVectorAux
    variable = shear_resistance_10
    property = slip_resistance  
    index = 9
  [../]
  [./shear_resistance_11]
    type = MaterialStdVectorAux
    variable = shear_resistance_11
    property = slip_resistance  
    index = 10
  [../]
  [./shear_resistance_12]
    type = MaterialStdVectorAux
    variable = shear_resistance_12
    property = slip_resistance  
    index = 11
  [../]
  [./shear_resistance_13]
    type = MaterialStdVectorAux
    variable = shear_resistance_13
    property = slip_resistance  
    index = 12
  [../]
  [./shear_resistance_14]
    type = MaterialStdVectorAux
    variable = shear_resistance_14
    property = slip_resistance  
    index = 13
  [../]
  [./shear_resistance_15]
    type = MaterialStdVectorAux
    variable = shear_resistance_15
    property = slip_resistance  
    index = 14
  [../]
  [./shear_resistance_16]
    type = MaterialStdVectorAux
    variable = shear_resistance_16
    property = slip_resistance  
    index = 15
  [../]
  [./shear_resistance_17]
    type = MaterialStdVectorAux
    variable = shear_resistance_17
    property = slip_resistance  
    index = 16
  [../]
  [./shear_resistance_18]
    type = MaterialStdVectorAux
    variable = shear_resistance_18
    property = slip_resistance  
    index = 17
  [../]
  [./shear_resistance_19]
    type = MaterialStdVectorAux
    variable = shear_resistance_19
    property = slip_resistance  
    index = 18
  [../]
  [./shear_resistance_20]
    type = MaterialStdVectorAux
    variable = shear_resistance_20
    property = slip_resistance  
    index = 19
  [../]
  [./shear_resistance_21]
    type = MaterialStdVectorAux
    variable = shear_resistance_21
    property = slip_resistance  
    index = 20
  [../]
  [./shear_resistance_22]
    type = MaterialStdVectorAux
    variable = shear_resistance_22
    property = slip_resistance  
    index = 21
  [../]
  [./shear_resistance_23]
    type = MaterialStdVectorAux
    variable = shear_resistance_23
    property = slip_resistance  
    index = 22
  [../]
  [./shear_resistance_24]
    type = MaterialStdVectorAux
    variable = shear_resistance_24
    property = slip_resistance  
    index = 23
  [../]
[]

[Materials]
  [./compute_stress_wrapper]
    type = ComputeLagrangianWrappedStress
  [../]
[]

#==== Slip increment output variables ======
[AuxVariables]
  [./slip_increment_01]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_02]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_03]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_04]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_05]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_06]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_07]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_08]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_09]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_10]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_11]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_12]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./slip_increment_13]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_14]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_15]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_16]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_17]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_18]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_19]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_20]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_21]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_22]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_23]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./slip_increment_24]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

#==== Slip increment output variables ======
[AuxKernels]
  [./slip_increment_01]
    type = MaterialStdVectorAux
    variable = slip_increment_01
    property = slip_increment  
    index = 0
  [../]
  [./slip_increment_02]
    type = MaterialStdVectorAux
    variable = slip_increment_02
    property = slip_increment  
    index = 1
  [../]
  [./slip_increment_03]
    type = MaterialStdVectorAux
    variable = slip_increment_03
    property = slip_increment  
    index = 2
  [../]
  [./slip_increment_04]
    type = MaterialStdVectorAux
    variable = slip_increment_04
    property = slip_increment  
    index = 3
  [../]
  [./slip_increment_05]
    type = MaterialStdVectorAux
    variable = slip_increment_05
    property = slip_increment  
    index = 4
  [../]
  [./slip_increment_06]
    type = MaterialStdVectorAux
    variable = slip_increment_06
    property = slip_increment  
    index = 5
  [../]
  [./slip_increment_07]
    type = MaterialStdVectorAux
    variable = slip_increment_07
    property = slip_increment  
    index = 6
  [../]
  [./slip_increment_08]
    type = MaterialStdVectorAux
    variable = slip_increment_08
    property = slip_increment  
    index = 7
  [../]
  [./slip_increment_09]
    type = MaterialStdVectorAux
    variable = slip_increment_09
    property = slip_increment  
    index = 8
  [../]
  [./slip_increment_10]
    type = MaterialStdVectorAux
    variable = slip_increment_10
    property = slip_increment  
    index = 9
  [../]
  [./slip_increment_11]
    type = MaterialStdVectorAux
    variable = slip_increment_11
    property = slip_increment  
    index = 10
  [../]
  [./slip_increment_12]
    type = MaterialStdVectorAux
    variable = slip_increment_12
    property = slip_increment  
    index = 11
  [../]
  [./slip_increment_13]
    type = MaterialStdVectorAux
    variable = slip_increment_13
    property = slip_increment  
    index = 12
  [../]
  [./slip_increment_14]
    type = MaterialStdVectorAux
    variable = slip_increment_14
    property = slip_increment  
    index = 13
  [../]
  [./slip_increment_15]
    type = MaterialStdVectorAux
    variable = slip_increment_15
    property = slip_increment  
    index = 14
  [../]
  [./slip_increment_16]
    type = MaterialStdVectorAux
    variable = slip_increment_16
    property = slip_increment  
    index = 15
  [../]
  [./slip_increment_17]
    type = MaterialStdVectorAux
    variable = slip_increment_17
    property = slip_increment  
    index = 16
  [../]
  [./slip_increment_18]
    type = MaterialStdVectorAux
    variable = slip_increment_18
    property = slip_increment  
    index = 17
  [../]
  [./slip_increment_19]
    type = MaterialStdVectorAux
    variable = slip_increment_19
    property = slip_increment  
    index = 18
  [../]
  [./slip_increment_20]
    type = MaterialStdVectorAux
    variable = slip_increment_20
    property = slip_increment  
    index = 19
  [../]
  [./slip_increment_21]
    type = MaterialStdVectorAux
    variable = slip_increment_21
    property = slip_increment  
    index = 20
  [../]
  [./slip_increment_22]
    type = MaterialStdVectorAux
    variable = slip_increment_22
    property = slip_increment  
    index = 21
  [../]
  [./slip_increment_23]
    type = MaterialStdVectorAux
    variable = slip_increment_23
    property = slip_increment  
    index = 22
  [../]
  [./slip_increment_24]
    type = MaterialStdVectorAux
    variable = slip_increment_24
    property = slip_increment  
    index = 23
  [../]
[]

#==== DDE_VEL output variables =====
[AuxVariables]
  [./dde_vel_01]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dde_vel_02]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dde_vel_03]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dde_vel_04]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dde_vel_05]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dde_vel_06]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dde_vel_07]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dde_vel_08]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dde_vel_09]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dde_vel_10]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dde_vel_11]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dde_vel_12]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dde_vel_13]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dde_vel_14]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dde_vel_15]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dde_vel_16]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dde_vel_17]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dde_vel_18]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dde_vel_19]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dde_vel_20]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dde_vel_21]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dde_vel_22]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dde_vel_23]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dde_vel_24]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

#==== DDE_VEL output variables =====
[AuxKernels]
  [./dde_vel_01]
    type = MaterialStdVectorAux
    variable = dde_vel_01
    property = dislo_velocity_edge  
    index = 0
  [../]
  [./dde_vel_02]
    type = MaterialStdVectorAux
    variable = dde_vel_02
    property = dislo_velocity_edge  
    index = 1
  [../]
  [./dde_vel_03]
    type = MaterialStdVectorAux
    variable = dde_vel_03
    property = dislo_velocity_edge  
    index = 2
  [../]
  [./dde_vel_04]
    type = MaterialStdVectorAux
    variable = dde_vel_04
    property = dislo_velocity_edge  
    index = 3
  [../]
  [./dde_vel_05]
    type = MaterialStdVectorAux
    variable = dde_vel_05
    property = dislo_velocity_edge  
    index = 4
  [../]
  [./dde_vel_06]
    type = MaterialStdVectorAux
    variable = dde_vel_06
    property = dislo_velocity_edge  
    index = 5
  [../]
  [./dde_vel_07]
    type = MaterialStdVectorAux
    variable = dde_vel_07
    property = dislo_velocity_edge  
    index = 6
  [../]
  [./dde_vel_08]
    type = MaterialStdVectorAux
    variable = dde_vel_08
    property = dislo_velocity_edge  
    index = 7
  [../]
  [./dde_vel_09]
    type = MaterialStdVectorAux
    variable = dde_vel_09
    property = dislo_velocity_edge  
    index = 8
  [../]
  [./dde_vel_10]
    type = MaterialStdVectorAux
    variable = dde_vel_10
    property = dislo_velocity_edge  
    index = 9
  [../]
  [./dde_vel_11]
    type = MaterialStdVectorAux
    variable = dde_vel_11
    property = dislo_velocity_edge  
    index = 10
  [../]
  [./dde_vel_12]
    type = MaterialStdVectorAux
    variable = dde_vel_12
    property = dislo_velocity_edge  
    index = 11
  [../]
  [./dde_vel_13]
    type = MaterialStdVectorAux
    variable = dde_vel_13
    property = dislo_velocity_edge  
    index = 12
  [../]
  [./dde_vel_14]
    type = MaterialStdVectorAux
    variable = dde_vel_14
    property = dislo_velocity_edge  
    index = 13
  [../]
  [./dde_vel_15]
    type = MaterialStdVectorAux
    variable = dde_vel_15
    property = dislo_velocity_edge  
    index = 14
  [../]
  [./dde_vel_16]
    type = MaterialStdVectorAux
    variable = dde_vel_16
    property = dislo_velocity_edge  
    index = 15
  [../]
  [./dde_vel_17]
    type = MaterialStdVectorAux
    variable = dde_vel_17
    property = dislo_velocity_edge  
    index = 16
  [../]
  [./dde_vel_18]
    type = MaterialStdVectorAux
    variable = dde_vel_18
    property = dislo_velocity_edge  
    index = 17
  [../]
  [./dde_vel_19]
    type = MaterialStdVectorAux
    variable = dde_vel_19
    property = dislo_velocity_edge  
    index = 18
  [../]
  [./dde_vel_20]
    type = MaterialStdVectorAux
    variable = dde_vel_20
    property = dislo_velocity_edge  
    index = 19
  [../]
  [./dde_vel_21]
    type = MaterialStdVectorAux
    variable = dde_vel_21
    property = dislo_velocity_edge  
    index = 20
  [../]
  [./dde_vel_22]
    type = MaterialStdVectorAux
    variable = dde_vel_22
    property = dislo_velocity_edge  
    index = 21
  [../]
  [./dde_vel_23]
    type = MaterialStdVectorAux
    variable = dde_vel_23
    property = dislo_velocity_edge  
    index = 22
  [../]
  [./dde_vel_24]
    type = MaterialStdVectorAux
    variable = dde_vel_24
    property = dislo_velocity_edge  
    index = 23
  [../]
[]
