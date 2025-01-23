[GlobalParams]
  displacements = 'disp_x disp_y disp_z'
[]

[Mesh]
  type = GeneratedMesh
  dim = 3
  nx = 2
  ny = 2
  nz = 2
  xmax = 0.1
  ymax = 0.1
  zmax = 0.1
  elem_type = HEX8
  displacements = 'disp_x disp_y disp_z'
[]

[Outputs]
    file_base = Discoflux_singleCrystal
    # csv = true
    exodus = true
    # console = true
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
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_EdgePositive_2]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_EdgePositive_3]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_EdgePositive_4]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_EdgePositive_5]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_EdgePositive_6]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_EdgePositive_7]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_EdgePositive_8]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_EdgePositive_9]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_EdgePositive_10]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_EdgePositive_11]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_EdgePositive_12]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  ## NEGATIVE EDGE
  [./DD_EdgeNegative_1]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_EdgeNegative_2]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_EdgeNegative_3]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_EdgeNegative_4]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_EdgeNegative_5]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_EdgeNegative_6]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_EdgeNegative_7]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_EdgeNegative_8]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_EdgeNegative_9]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_EdgeNegative_10]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_EdgeNegative_11]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC 
      value = 50000
    [../]
  [../]
  [./DD_EdgeNegative_12]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  ## POSITIVE SCREW
  [./DD_ScrewPositive_1]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_ScrewPositive_2]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_ScrewPositive_3]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_ScrewPositive_4]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_ScrewPositive_5]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_ScrewPositive_6]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_ScrewPositive_7]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_ScrewPositive_8]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_ScrewPositive_9]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_ScrewPositive_10]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_ScrewPositive_11]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  [./DD_ScrewPositive_12]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 100000
    [../]
  [../]
  ## NEGATIVE Screw
  [./DD_ScrewNegative_1]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_ScrewNegative_2]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_ScrewNegative_3]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_ScrewNegative_4]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_ScrewNegative_5]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_ScrewNegative_6]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_ScrewNegative_7]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_ScrewNegative_8]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_ScrewNegative_9]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_ScrewNegative_10]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_ScrewNegative_11]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
  [./DD_ScrewNegative_12]
    order = FIRST
    family = LAGRANGE
    [./InitialCondition]
      type = ConstantIC
      value = 50000
    [../]
  [../]
[]

[Kernels]
  [./dot_DD_EdgePositive_1]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_1
  [../]
  [./Advection_DD_EdgePositive_1]
    type = ConservativeAdvectionDislocation
    variable = DD_EdgePositive_1
    upwinding_type = full
    dislocation_character = edge
    dislocation_sign = positive
    slip_system_index = 1
  [../]
  [./dot_DD_EdgePositive_2]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_2
  [../]
    [./Advection_DD_EdgePositive_2]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_2
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 2
    [../]
  [./dot_DD_EdgePositive_3]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_3
  [../]
    [./Advection_DD_EdgePositive_3]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_3
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 3
    [../]
  [./dot_DD_EdgePositive_4]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_4
  [../]
    [./Advection_DD_EdgePositive_4]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_4
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 4
    [../]
  [./dot_DD_EdgePositive_5]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_5
  [../]
    [./Advection_DD_EdgePositive_5]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_5
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 5
    [../]
  [./dot_DD_EdgePositive_6]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_6
  [../]
    [./Advection_DD_EdgePositive_6]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_6
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 6
    [../]
  [./dot_DD_EdgePositive_7]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_7
  [../]
    [./Advection_DD_EdgePositive_7]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_7
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 7
    [../]
  [./dot_DD_EdgePositive_8]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_8
  [../]
    [./Advection_DD_EdgePositive_8]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_8
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 8
    [../]
  [./dot_DD_EdgePositive_9]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_9
  [../]
    [./Advection_DD_EdgePositive_9]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_9
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 9
    [../]
  [./dot_DD_EdgePositive_10]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_10
  [../]
    [./Advection_DD_EdgePositive_10]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_10
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 10
    [../]
  [./dot_DD_EdgePositive_11]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_11
  [../]
    [./Advection_DD_EdgePositive_11]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_11
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 11
    [../]
  [./dot_DD_EdgePositive_12]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_12
  [../]
    [./Advection_DD_EdgePositive_12]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_12
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 12
    [../]
  
  #### EDGE NEGATIVE
  [./dot_DD_EdgeNegative_1]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_1
  [../]
  [./Advection_DD_EdgeNegative_1]
    type = ConservativeAdvectionDislocation
    variable = DD_EdgeNegative_1
    upwinding_type = full
    dislocation_character = edge
    dislocation_sign = negative
    slip_system_index = 1
  [../]
  [./dot_DD_EdgeNegative_2]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_2
  [../]
  [./Advection_DD_EdgeNegative_2]
    type = ConservativeAdvectionDislocation
    variable = DD_EdgeNegative_2
    upwinding_type = full
    dislocation_character = edge
    dislocation_sign = negative
    slip_system_index = 2
  [../]
  [./dot_DD_EdgeNegative_3]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_3
  [../]
    [./Advection_DD_EdgeNegative_3]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_3
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 3
    [../]
  [./dot_DD_EdgeNegative_4]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_4
  [../]
    [./Advection_DD_EdgeNegative_4]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_4
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 4
    [../]
  [./dot_DD_EdgeNegative_5]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_5
  [../]
    [./Advection_DD_EdgeNegative_5]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_5
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 5
    [../]
  [./dot_DD_EdgeNegative_6]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_6
  [../]
    [./Advection_DD_EdgeNegative_6]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_6
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 6
    [../]
  [./dot_DD_EdgeNegative_7]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_7
  [../]
    [./Advection_DD_EdgeNegative_7]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_7
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 7
    [../]
  [./dot_DD_EdgeNegative_8]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_8
  [../]
    [./Advection_DD_EdgeNegative_8]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_8
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 8
    [../]
  [./dot_DD_EdgeNegative_9]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_9
  [../]
    [./Advection_DD_EdgeNegative_9]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_9
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 9
    [../]
  [./dot_DD_EdgeNegative_10]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_10
  [../]
    [./Advection_DD_EdgeNegative_10]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_10
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 10
    [../]
  [./dot_DD_EdgeNegative_11]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_11
  [../]
    [./Advection_DD_EdgeNegative_11]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_11
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 11
    [../]
  [./dot_DD_EdgeNegative_12]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_12
  [../]
    [./Advection_DD_EdgeNegative_12]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_12
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 12
    [../]
  
  [./dot_DD_ScrewPositive_1]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_1
  [../]
    [./Advection_DD_ScrewPositive_1]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_1
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 1
    [../]
  [./dot_DD_ScrewPositive_2]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_2
  [../]
    [./Advection_DD_ScrewPositive_2]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_2
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 2
    [../]
  [./dot_DD_ScrewPositive_3]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_3
  [../]
    [./Advection_DD_ScrewPositive_3]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_3
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 3
    [../]
  [./dot_DD_ScrewPositive_4]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_4
  [../]
    [./Advection_DD_ScrewPositive_4]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_4
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 4
    [../]
  [./dot_DD_ScrewPositive_5]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_5
  [../]
    [./Advection_DD_ScrewPositive_5]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_5
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 5
    [../]
  [./dot_DD_ScrewPositive_6]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_6
  [../]
    [./Advection_DD_ScrewPositive_6]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_6
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 6
    [../]
  [./dot_DD_ScrewPositive_7]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_7
  [../]
    [./Advection_DD_ScrewPositive_7]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_7
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 7
    [../]
  [./dot_DD_ScrewPositive_8]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_8
  [../]
    [./Advection_DD_ScrewPositive_8]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_8
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 8
    [../]
  [./dot_DD_ScrewPositive_9]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_9
  [../]
    [./Advection_DD_ScrewPositive_9]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_9
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 9
    [../]
  [./dot_DD_ScrewPositive_10]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_10
  [../]
    [./Advection_DD_ScrewPositive_10]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_10
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 10
    [../]
  [./dot_DD_ScrewPositive_11]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_11
  [../]
    [./Advection_DD_ScrewPositive_11]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_11
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 11
    [../]
  [./dot_DD_ScrewPositive_12]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_12
  [../]
    [./Advection_DD_ScrewPositive_12]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_12
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 12
    [../]
  
  [./dot_DD_ScrewNegative_1]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_1
  [../]
    [./Advection_DD_ScrewNegative_1]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_1
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 1
    [../]
  [./dot_DD_ScrewNegative_2]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_2
  [../]
    [./Advection_DD_ScrewNegative_2]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_2
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 2
    [../]
  [./dot_DD_ScrewNegative_3]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_3
  [../]
    [./Advection_DD_ScrewNegative_3]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_3
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 3
    [../]
  [./dot_DD_ScrewNegative_4]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_4
  [../]
    [./Advection_DD_ScrewNegative_4]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_4
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 4
    [../]
  [./dot_DD_ScrewNegative_5]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_5
  [../]
    [./Advection_DD_ScrewNegative_5]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_5
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 5
    [../]
  [./dot_DD_ScrewNegative_6]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_6
  [../]
    [./Advection_DD_ScrewNegative_6]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_6
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 6
    [../]
  [./dot_DD_ScrewNegative_7]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_7
  [../]
    [./Advection_DD_ScrewNegative_7]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_7
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 7
    [../]
  [./dot_DD_ScrewNegative_8]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_8
  [../]
    [./Advection_DD_ScrewNegative_8]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_8
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 8
    [../]
  [./dot_DD_ScrewNegative_9]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_9
  [../]
    [./Advection_DD_ScrewNegative_9]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_9
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 9
    [../]
  [./dot_DD_ScrewNegative_10]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_10
  [../]
    [./Advection_DD_ScrewNegative_10]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_10
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 10
    [../]
  [./dot_DD_ScrewNegative_11]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_11
  [../]
    [./Advection_DD_ScrewNegative_11]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_11
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 11
    [../]
  [./dot_DD_ScrewNegative_12]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_12
  [../]
    [./Advection_DD_ScrewNegative_12]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_12
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 12
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
    execute_on = 'initial final'
  []
  [euler_angle_2]
    type = MaterialRealVectorValueAux
    variable = euler_angle_2
    property = updated_Euler_angle
    component = 1
    execute_on = 'initial final'
  []
  [euler_angle_3]
    type = MaterialRealVectorValueAux
    variable = euler_angle_3
    property = updated_Euler_angle
    component = 2
    execute_on = 'initial final'
  []
[]

[BCs]
  ##############################################
  # X : Left and Right
  # Y : Bottom and Top
  # Z : Back and Front
  ##############################################
  [./BC_X]
    type = FunctionDirichletBC
    variable = disp_x
    # boundary = 'x0'
    boundary = left
    function = 0.0
  [../]
    [./BC_Y]
    type = FunctionDirichletBC
    variable = disp_y
    # boundary = 'y0'
    boundary = bottom
    function = 0.0
  [../]
    [./BC_Z]
    type = FunctionDirichletBC
    variable = disp_z
    # boundary = 'z0'
    boundary = back
    function = 0.0
  [../]

  [./BC_Loading]
    type = FunctionDirichletBC
    variable = disp_y
    # boundary = 'y0 y1 '
    boundary = top
    function = '0.001*y*t'
  [../]

  # [./BC_X0]
  #   type = FunctionDirichletBC
  #   variable = disp_x
  #   boundary = 'x0 y0 z0'
  #   function = 0.0
  # [../]
  # [./BC_Y0]
  #   type = FunctionDirichletBC
  #   variable = disp_y
  #   boundary = 'x0 y0 z0'
  #   function = 0.0
  # [../]
  # [./BC_Z0]
  #   type = FunctionDirichletBC
  #   variable = disp_z
  #   boundary = 'x0 y0 z0'
  #   function = 0.0
  # [../]

  # [./Periodic]
  #   [./rho_edge_positive]
  #     variable = DD_EdgePositive
  #     auto_direction = 'x y z'
  #   [../]
  #   [./rho_edge_negative]
  #     variable = DD_EdgeNegative
  #     auto_direction = 'x y z'
  #   [../]
  # [../] 
  
[]

[Physics/SolidMechanics/QuasiStatic/all]
  strain = FINITE
  add_variables = true
  new_system = true
  formulation = total
  incremental = true
[]

[Materials]
  [./elasticity_tensor]
    type = ComputeElasticityTensorCP
    C_ijkl = '1.684e5 1.214e5 1.214e5 1.684e5 1.214e5 1.684e5 0.754e5 0.754e5 0.754e5'
    fill_method = symmetric9
    euler_angle_1 = 0
    euler_angle_2 = 0
    euler_angle_3 = 0
  [../]
  [stress_cu]
    type = ComputeMultipleCrystalPlasticityOrowanStress
    crystal_plasticity_models = 'CP_DiscoFlux'
    tan_mod_type = exact
  []
  [./CP_DiscoFlux]
    type = DiscoFluxCPOrowanStressUpdate
    number_slip_systems = 12
    slip_sys_file_name = input_slip_sys.inp
    lattice_friction = 15
    Coeff_hardening = 0.85
    slip_increment_tolerance = 2.0e-2 
    dislo_density_factor_CDT = 1.0
    DD_EdgePositive_1 = DD_EdgePositive_1
    DD_EdgePositive_2 = DD_EdgePositive_2
    DD_EdgePositive_3 = DD_EdgePositive_3
    DD_EdgePositive_4 = DD_EdgePositive_4
    DD_EdgePositive_5 = DD_EdgePositive_5
    DD_EdgePositive_6 = DD_EdgePositive_6
    DD_EdgePositive_7 = DD_EdgePositive_7
    DD_EdgePositive_8 = DD_EdgePositive_8
    DD_EdgePositive_9 = DD_EdgePositive_9
    DD_EdgePositive_10 = DD_EdgePositive_10
    DD_EdgePositive_11 = DD_EdgePositive_11
    DD_EdgePositive_12 = DD_EdgePositive_12
    DD_EdgeNegative_1 = DD_EdgeNegative_1
    DD_EdgeNegative_2 = DD_EdgeNegative_2
    DD_EdgeNegative_3 = DD_EdgeNegative_3
    DD_EdgeNegative_4 = DD_EdgeNegative_4
    DD_EdgeNegative_5 = DD_EdgeNegative_5
    DD_EdgeNegative_6 = DD_EdgeNegative_6
    DD_EdgeNegative_7 = DD_EdgeNegative_7
    DD_EdgeNegative_8 = DD_EdgeNegative_8
    DD_EdgeNegative_9 = DD_EdgeNegative_9
    DD_EdgeNegative_10 = DD_EdgeNegative_10
    DD_EdgeNegative_11 = DD_EdgeNegative_11
    DD_EdgeNegative_12 = DD_EdgeNegative_12
    DD_ScrewPositive_1 = DD_ScrewPositive_1
    DD_ScrewPositive_2 = DD_ScrewPositive_2
    DD_ScrewPositive_3 = DD_ScrewPositive_3
    DD_ScrewPositive_4 = DD_ScrewPositive_4
    DD_ScrewPositive_5 = DD_ScrewPositive_5
    DD_ScrewPositive_6 = DD_ScrewPositive_6
    DD_ScrewPositive_7 = DD_ScrewPositive_7
    DD_ScrewPositive_8 = DD_ScrewPositive_8
    DD_ScrewPositive_9 = DD_ScrewPositive_9
    DD_ScrewPositive_10 = DD_ScrewPositive_10
    DD_ScrewPositive_11 = DD_ScrewPositive_11
    DD_ScrewPositive_12 = DD_ScrewPositive_12
    DD_ScrewNegative_1 = DD_ScrewNegative_1
    DD_ScrewNegative_2= DD_ScrewNegative_2
    DD_ScrewNegative_3 = DD_ScrewNegative_3
    DD_ScrewNegative_4 = DD_ScrewNegative_4
    DD_ScrewNegative_5 = DD_ScrewNegative_5
    DD_ScrewNegative_6 = DD_ScrewNegative_6
    DD_ScrewNegative_7 = DD_ScrewNegative_7
    DD_ScrewNegative_8 = DD_ScrewNegative_8
    DD_ScrewNegative_9 = DD_ScrewNegative_9
    DD_ScrewNegative_10 = DD_ScrewNegative_10
    DD_ScrewNegative_11 = DD_ScrewNegative_11
    DD_ScrewNegative_12 = DD_ScrewNegative_12
    print_state_variable_convergence_error_messages = true
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
    dislo_density_initial = 1.0e+05
    C_multi =  0.0  #8.5e-06
    C_trap =   0.0  #5.5e-03
    C_m_ann =  0.0  #0.5
    C_im_ann = 0.0 #0.5
    burgers_vector_mag = 2.52e-07
[]

[Preconditioning]
  [./smp]
    type = SMP
    full = true
  [../]
[]

[Executioner]
  type = Transient

  solve_type = 'PJFNK'
  line_search = 'none'
  petsc_options_iname = '-pc_type -pc_factor_mat_solver_package -snes_type'
  petsc_options_value = 'lu       superlu_dist                  vinewtonrsls'

  # solve_type = 'NEWTON'
  # petsc_options = '-snes_ksp_ew'
  # petsc_options_iname = '-pc_type -pc_factor_mat_solver_package'
  # petsc_options_value = 'lu       superlu_dist                 '

  nl_abs_tol = 1e-5 
  nl_max_its = 10
  l_abs_tol = 1e-5
  l_max_its = 20

  dtmax = 0.2
  dtmin = 0.000001
  end_time = 1 #100 to model up to 10 percent of strain
  [./TimeStepper]
    type = ConstantDT
    dt = 0.2
    growth_factor = 1.01
  [../]
[]

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

[AuxVariables]
  [./shear_stress_01]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_resistance_01]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./back_stress_01]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_01]
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
  [./back_stress_01]
   type = MaterialStdVectorAux
   variable = back_stress_01
   property = back_stress
   index = 0
  [../]
  [./shear_resistance_01]
    type = MaterialStdVectorAux
    variable = shear_resistance_01
    property = slip_resistance  
    index = 0
  [../]
  [./DD_mobile_01]
   type = MaterialStdVectorAux
   variable = DD_mobile_01
   property = dislocation_immobile
   index = 0
  [../]
[]

[AuxVariables]
  [./shear_stress_02]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_resistance_02]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./back_stress_02]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_02]
   order = CONSTANT
   family = MONOMIAL
  [../]
[]

[AuxKernels]
[./shear_stress_02]
   type = MaterialStdVectorAux
   variable = shear_stress_02
   property = applied_shear_stress  
   index = 1
  [../]
[./back_stress_02]
   type = MaterialStdVectorAux
   variable = back_stress_02
   property = back_stress
   index = 1
  [../]
  [./shear_resistance_02]
    type = MaterialStdVectorAux
    variable = shear_resistance_02
    property = slip_resistance  
    index = 1
  [../]
[./DD_mobile_02]
   type = MaterialStdVectorAux
   variable = DD_mobile_02
   property = dislocation_immobile
   index = 1
  [../]
[]

[AuxVariables]
  [./shear_stress_03]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_resistance_03]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./back_stress_03]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_03]
   order = CONSTANT
   family = MONOMIAL
  [../]
[]

[AuxKernels]
[./shear_stress_03]
   type = MaterialStdVectorAux
   variable = shear_stress_03
   property = applied_shear_stress  
   index = 2
  [../]
[./back_stress_03]
   type = MaterialStdVectorAux
   variable = back_stress_03
   property = back_stress
   index = 2
  [../]
  [./shear_resistance_03]
    type = MaterialStdVectorAux
    variable = shear_resistance_03
    property = slip_resistance  
    index = 2
  [../]
[./DD_mobile_03]
   type = MaterialStdVectorAux
   variable = DD_mobile_03
   property = dislocation_immobile
   index = 2
  [../]
[]

[AuxVariables]
  [./shear_stress_04]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_resistance_04]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./back_stress_04]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_04]
   order = CONSTANT
   family = MONOMIAL
  [../]
[]

[AuxKernels]
[./shear_stress_04]
   type = MaterialStdVectorAux
   variable = shear_stress_04
   property = applied_shear_stress  
   index = 3
  [../]
[./back_stress_04]
   type = MaterialStdVectorAux
   variable = back_stress_04
   property = back_stress
   index = 3
  [../]
  [./shear_resistance_04]
    type = MaterialStdVectorAux
    variable = shear_resistance_04
    property = slip_resistance  
    index = 3
  [../]
[./DD_mobile_04]
   type = MaterialStdVectorAux
   variable = DD_mobile_04
   property = dislocation_immobile
   index = 3
  [../]
[]

[AuxVariables]
  [./shear_stress_05]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_resistance_05]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./back_stress_05]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_05]
   order = CONSTANT
   family = MONOMIAL
  [../]
[]

[AuxKernels]
[./shear_stress_05]
   type = MaterialStdVectorAux
   variable = shear_stress_05
   property = applied_shear_stress  
   index = 4
  [../]
[./back_stress_05]
   type = MaterialStdVectorAux
   variable = back_stress_05
   property = back_stress
   index = 4
  [../]
  [./shear_resistance_05]
    type = MaterialStdVectorAux
    variable = shear_resistance_05
    property = slip_resistance  
    index = 4
  [../]
[./DD_mobile_05]
   type = MaterialStdVectorAux
   variable = DD_mobile_05
   property = dislocation_immobile
   index = 4
  [../]
[]

[AuxVariables]
  [./shear_stress_06]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_resistance_06]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./back_stress_06]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_06]
   order = CONSTANT
   family = MONOMIAL
  [../]
[]

[AuxKernels]
[./shear_stress_06]
   type = MaterialStdVectorAux
   variable = shear_stress_06
   property = applied_shear_stress  
   index = 5
  [../]
[./back_stress_06]
   type = MaterialStdVectorAux
   variable = back_stress_06
   property = back_stress
   index = 5
  [../]
    [./shear_resistance_06]
      type = MaterialStdVectorAux
      variable = shear_resistance_06
      property = slip_resistance
      index = 5
    [../]
[./DD_mobile_06]
   type = MaterialStdVectorAux
   variable = DD_mobile_06
   property = dislocation_immobile
   index = 5
  [../]
[]

[AuxVariables]
  [./shear_stress_07]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_resistance_07]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./back_stress_07]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_07]
   order = CONSTANT
   family = MONOMIAL
  [../]
[]

[AuxKernels]
[./shear_stress_07]
   type = MaterialStdVectorAux
   variable = shear_stress_07
   property = applied_shear_stress  
   index = 6
  [../]
[./back_stress_07]
   type = MaterialStdVectorAux
   variable = back_stress_07
   property = back_stress
   index = 6
  [../]
    [./shear_resistance_07]
      type = MaterialStdVectorAux
      variable = shear_resistance_07
      property = slip_resistance
      index = 6
    [../]
[./DD_mobile_07]
   type = MaterialStdVectorAux
   variable = DD_mobile_07
   property = dislocation_immobile
   index = 6
  [../]
[]


[AuxVariables]
  [./shear_stress_08]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_resistance_08]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./back_stress_08]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_08]
   order = CONSTANT
   family = MONOMIAL
  [../]
[]

[AuxKernels]
[./shear_stress_08]
   type = MaterialStdVectorAux
   variable = shear_stress_08
   property = applied_shear_stress  
   index = 7
  [../]
[./back_stress_08]
   type = MaterialStdVectorAux
   variable = back_stress_08
   property = back_stress
   index = 7
  [../]
    [./shear_resistance_08]
      type = MaterialStdVectorAux
      variable = shear_resistance_08
      property = slip_resistance
      index = 7
    [../]
[./DD_mobile_08]
   type = MaterialStdVectorAux
   variable = DD_mobile_08
   property = dislocation_immobile
   index = 7
  [../]
[]



[AuxVariables]
  [./shear_stress_09]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_resistance_09]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./back_stress_09]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_09]
   order = CONSTANT
   family = MONOMIAL
  [../]
[]

[AuxKernels]
[./shear_stress_09]
   type = MaterialStdVectorAux
   variable = shear_stress_09
   property = applied_shear_stress  
   index = 8
  [../]
[./back_stress_09]
   type = MaterialStdVectorAux
   variable = back_stress_09
   property = back_stress
   index = 8
  [../]
    [./shear_resistance_09]
      type = MaterialStdVectorAux
      variable = shear_resistance_09
      property = slip_resistance
      index = 8
    [../]
[./DD_mobile_09]
   type = MaterialStdVectorAux
   variable = DD_mobile_09
   property = dislocation_immobile
   index = 8
  [../]
[]


[AuxVariables]
  [./shear_stress_10]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_resistance_10]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./back_stress_10]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_10]
   order = CONSTANT
   family = MONOMIAL
  [../]
[]

[AuxKernels]
[./shear_stress_10]
   type = MaterialStdVectorAux
   variable = shear_stress_10
   property = applied_shear_stress  
   index = 9
  [../]
[./back_stress_10]
   type = MaterialStdVectorAux
   variable = back_stress_10
   property = back_stress
   index = 9
  [../]
    [./shear_resistance_10]
      type = MaterialStdVectorAux
      variable = shear_resistance_10
      property = slip_resistance
      index = 9
    [../]
[./DD_mobile_10]
   type = MaterialStdVectorAux
   variable = DD_mobile_10
   property = dislocation_immobile
   index = 9
  [../]
[]

[AuxVariables]
  [./shear_stress_11]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_resistance_11]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./back_stress_11]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_11]
   order = CONSTANT
   family = MONOMIAL
  [../]
[]

[AuxKernels]
[./shear_stress_11]
   type = MaterialStdVectorAux
   variable = shear_stress_11
   property = applied_shear_stress  
   index = 10
  [../]
[./back_stress_11]
   type = MaterialStdVectorAux
   variable = back_stress_11
   property = back_stress
   index = 10
  [../]
    [./shear_resistance_11]
      type = MaterialStdVectorAux
      variable = shear_resistance_11
      property = slip_resistance
      index = 10
    [../]
[./DD_mobile_11]
   type = MaterialStdVectorAux
   variable = DD_mobile_11
   property = dislocation_immobile
   index = 10
  [../]
[]

[AuxVariables]
  [./shear_stress_12]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./shear_resistance_12]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./back_stress_12]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./DD_mobile_12]
   order = CONSTANT
   family = MONOMIAL
  [../]
[]

[AuxKernels]
[./shear_stress_12]
   type = MaterialStdVectorAux
   variable = shear_stress_12
   property = applied_shear_stress  
   index = 11
  [../]
[./back_stress_12]
   type = MaterialStdVectorAux
   variable = back_stress_12
   property = back_stress
   index = 11
  [../]
    [./shear_resistance_12]
      type = MaterialStdVectorAux
      variable = shear_resistance_12
      property = slip_resistance
      index = 11
    [../]
[./DD_mobile_12]
   type = MaterialStdVectorAux
   variable = DD_mobile_12
   property = dislocation_immobile
   index = 11
  [../]
[]

[Materials]
  [./compute_stress_wrapper]
    type = ComputeLagrangianWrappedStress
  [../]
[]

[AuxVariables]
  [./GND_density_01]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./GND_density_02]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./GND_density_03]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./GND_density_04]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./GND_density_05]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./GND_density_06]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./GND_density_07]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./GND_density_08]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./GND_density_09]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./GND_density_10]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./GND_density_11]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./GND_density_12]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

[AuxKernels]
[./GND_density_01]
    type = MaterialStdVectorAux
    variable = GND_density_01
    property = kappa  
    index = 0
  [../]
[./GND_density_02]
    type = MaterialStdVectorAux
    variable = GND_density_02
    property = kappa  
    index = 1
  [../]
[./GND_density_03]
    type = MaterialStdVectorAux
    variable = GND_density_03
    property = kappa  
    index = 2
  [../]
[./GND_density_04]
    type = MaterialStdVectorAux
    variable = GND_density_04
    property = kappa  
    index = 3
  [../]
[./GND_density_05]
    type = MaterialStdVectorAux
    variable = GND_density_05
    property = kappa  
    index = 4
  [../]
[./GND_density_06]
    type = MaterialStdVectorAux
    variable = GND_density_06
    property = kappa  
    index = 5
  [../]
[./GND_density_07]
    type = MaterialStdVectorAux
    variable = GND_density_07
    property = kappa  
    index = 6
  [../]
[./GND_density_08]
    type = MaterialStdVectorAux
    variable = GND_density_08
    property = kappa  
    index = 7
  [../]
[./GND_density_09]
    type = MaterialStdVectorAux
    variable = GND_density_09
    property = kappa  
    index = 8
  [../]
[./GND_density_10]
    type = MaterialStdVectorAux
    variable = GND_density_10
    property = kappa  
    index = 9
  [../]
[./GND_density_11]
    type = MaterialStdVectorAux
    variable = GND_density_11
    property = kappa  
    index = 10
  [../]
[./GND_density_12]
    type = MaterialStdVectorAux
    variable = GND_density_12
    property = kappa  
    index = 11
  [../]
[]

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
[]

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
[]

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
[]

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
[]