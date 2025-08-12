[GlobalParams]
  displacements = 'disp_x disp_y disp_z'
  volumetric_locking_correction = true
[]

[Mesh]
  [./MeshFile]
   type = FileMeshGenerator
   file = 'bx_hex8_ne6.e'
  [../]
[]

[Outputs]
    file_base = method_Discoflux
    csv = true
    exodus = true
    # console = true
    # interval = 25
[]

[UserObjects]
  [./prop_read]
    type = PropertyReadFile
    prop_file_name = 'bx-cu-lagb.inp' 
    nprop = 3
    read_type = block
    nblock = 2
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
  # POSITIVE SCREW
  [./DD_ScrewPositive_1]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_2]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_3]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_4]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_5]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_6]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_7]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_8]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_9]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_10]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_11]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_12]
    order = FIRST
    family = LAGRANGE
  [../]
  ## NEGATIVE Screw
  [./DD_ScrewNegative_1]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_2]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_3]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_4]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_5]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_6]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_7]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_8]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_9]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_10]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_11]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_12]
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
    value = 200000
  [../]
  [./ic_DD_EdgePositive_2]
    type = ConstantIC
    variable = DD_EdgePositive_2
    value = 200000
  [../]
  [./ic_DD_EdgePositive_3]
      type = ConstantIC
      variable = DD_EdgePositive_3
      value = 200000
  [../]
  [./ic_DD_EdgePositive_4]
    type = ConstantIC
    variable = DD_EdgePositive_4
    value = 200000
  [../]
  [./ic_DD_EdgePositive_5]
    type = ConstantIC
    variable = DD_EdgePositive_5
    value = 200000
  [../]
    [./ic_DD_EdgePositive_6]
      type = ConstantIC
      variable = DD_EdgePositive_6
      value = 200000
    [../]
  [./ic_DD_EdgePositive_7]
    type = ConstantIC
    variable = DD_EdgePositive_7
    value = 200000
  [../]
  [./ic_DD_EdgePositive_8]
    type = ConstantIC
    variable = DD_EdgePositive_8
    value = 200000
  [../]
    [./ic_DD_EdgePositive_9]
      type = ConstantIC
      variable = DD_EdgePositive_9
      value = 200000
    [../]
  [./ic_DD_EdgePositive_10]
    type = ConstantIC
    variable = DD_EdgePositive_10
    value = 200000
  [../]
  [./ic_DD_EdgePositive_11]
    type = ConstantIC
    variable = DD_EdgePositive_11
    value = 200000
  [../]
  [./ic_DD_EdgePositive_12]
    #type = FunctionIC
    type = ConstantIC
    variable = DD_EdgePositive_12
    #function = init_rho_edge_pos_12
    value = 200000
  [../]
  ## NEGATIVE EDGE
  [./ic_DD_EdgeNegative_1]
    type = ConstantIC
    variable = DD_EdgeNegative_1
    value = 200000
  [../]
  [./ic_DD_EdgeNegative_2]
    type = ConstantIC
    variable = DD_EdgeNegative_2
    value = 200000
  [../]
  [./ic_DD_EdgeNegative_3]
    type = ConstantIC
    variable = DD_EdgeNegative_3
    value = 200000
  [../]
  [./ic_DD_EdgeNegative_4]
    type = ConstantIC
    variable = DD_EdgeNegative_4
    value = 200000
  [../]
  [./ic_DD_EdgeNegative_5]
    type = ConstantIC
    variable = DD_EdgeNegative_5
    value = 200000
  [../]
    [./ic_DD_EdgeNegative_6]
      type = ConstantIC
      variable = DD_EdgeNegative_6
      value = 200000
    [../]
  [./ic_DD_EdgeNegative_7]
    type = ConstantIC
    variable = DD_EdgeNegative_7
    value = 200000
  [../]
  [./ic_DD_EdgeNegative_8]
    type = ConstantIC
    variable = DD_EdgeNegative_8
    value = 200000
  [../]
    [./ic_DD_EdgeNegative_9]
      type = ConstantIC
      variable = DD_EdgeNegative_9
      value = 200000
    [../]
  [./ic_DD_EdgeNegative_10]
    type = ConstantIC
    variable = DD_EdgeNegative_10
    value = 200000
  [../]
  [./ic_DD_EdgeNegative_11]
    type = ConstantIC
    variable = DD_EdgeNegative_11
    value = 200000
  [../]
  [./ic_DD_EdgeNegative_12]
    type = ConstantIC
    #type = FunctionIC
    variable = DD_EdgeNegative_12
    value = 200000
    #function = init_rho_edge_neg_12
  [../]
  # POSITIVE SCREW
  [./ic_DD_ScrewPositive_1]
    type = ConstantIC
    variable = DD_ScrewPositive_1
    value = 200000
  [../]
  [./ic_DD_ScrewPositive_2]
    type = ConstantIC
    variable = DD_ScrewPositive_2
    value = 200000
  [../]
  [./ic_DD_ScrewPositive_3]
      type = ConstantIC
      variable = DD_ScrewPositive_3
      value = 200000
  [../]
  [./ic_DD_ScrewPositive_4]
    type = ConstantIC
    variable = DD_ScrewPositive_4
    value = 200000
  [../]
  [./ic_DD_ScrewPositive_5]
    type = ConstantIC
    variable = DD_ScrewPositive_5
    value = 200000
  [../]
  [./ic_DD_ScrewPositive_6]
    type = ConstantIC
    variable = DD_ScrewPositive_6
    value = 200000
  [../]
  [./ic_DD_ScrewPositive_7]
    type = ConstantIC
    variable = DD_ScrewPositive_7
    value = 200000
  [../]
  [./ic_DD_ScrewPositive_8]
    type = ConstantIC
    variable = DD_ScrewPositive_8
    value = 200000
  [../]
  [./ic_DD_ScrewPositive_9]
    type = ConstantIC
    variable = DD_ScrewPositive_9
    value = 200000
  [../]
  [./ic_DD_ScrewPositive_10]
    type = ConstantIC
    variable = DD_ScrewPositive_10
    value = 200000
  [../]
  [./ic_DD_ScrewPositive_11]
    type = ConstantIC
    variable = DD_ScrewPositive_11
    value = 200000
  [../]
  [./ic_DD_ScrewPositive_12]
    type = ConstantIC
    variable = DD_ScrewPositive_12
    value = 200000
  [../]
  ## NEGATIVE Screw
  [./ic_DD_ScrewNegative_1]
    type = ConstantIC
    variable = DD_ScrewNegative_1
    value = 200000
  [../]
  [./ic_DD_ScrewNegative_2]
    type = ConstantIC
    variable = DD_ScrewNegative_2
    value = 200000
  [../]
  [./ic_DD_ScrewNegative_3]
      type = ConstantIC
      variable = DD_ScrewNegative_3
      value = 200000
  [../]
  [./ic_DD_ScrewNegative_4]
    type = ConstantIC
    variable = DD_ScrewNegative_4
    value = 200000
  [../]
  [./ic_DD_ScrewNegative_5]
    type = ConstantIC
    variable = DD_ScrewNegative_5
    value = 200000
  [../]
  [./ic_DD_ScrewNegative_6]
    type = ConstantIC
    variable = DD_ScrewNegative_6
    value = 200000
  [../]
  [./ic_DD_ScrewNegative_7]
    type = ConstantIC
    variable = DD_ScrewNegative_7
    value = 200000
  [../]
  [./ic_DD_ScrewNegative_8]
    type = ConstantIC
    variable = DD_ScrewNegative_8
    value = 200000
  [../]
  [./ic_DD_ScrewNegative_9]
    type = ConstantIC
    variable = DD_ScrewNegative_9
    value = 200000
  [../]
  [./ic_DD_ScrewNegative_10]
    type = ConstantIC
    variable = DD_ScrewNegative_10
    value = 200000
  [../]
  [./ic_DD_ScrewNegative_11]
    type = ConstantIC
    variable = DD_ScrewNegative_11
    value = 200000
  [../]
  [./ic_DD_ScrewNegative_12]
    type = ConstantIC
    variable = DD_ScrewNegative_12
    value = 200000
  [../]
[]

[Functions]
  [./init_rho_edge_pos_12]
    type = ParsedFunction
    expression = 'if(x>=-0.1,1.0,0.0)*if(x<=0.025,1.0,0.0)*100000+100000'
  [../]
  [./init_rho_edge_neg_12]
    type = ParsedFunction
    expression = 'if(x>=0.375,1.0,0.0)*if(x<=0.41,1.0,0.0)*100000+100000'
  [../]
  [./disp_load]
    type = ParsedFunction
    expression = '0.1*t'
  [../]
[]


[Kernels]
  [./dot_DD_EdgePositive_1]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_1
    #block = 1
  [../]
  [./Advection_DD_EdgePositive_1]
    type = ConservativeAdvectionDislocation
    variable = DD_EdgePositive_1
    upwinding_type = full
    dislocation_character = edge
    dislocation_sign = positive
    slip_system_index = 1
    #block = 1
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
    #block = 1
  [../]
    [./Advection_DD_EdgePositive_2]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_2
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 2
      #block = 1
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
    [./Advection_DD_EdgePositive_3]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_3
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 3
      #block = 1
    [../]
      [./Source_DD_EdgePositive_3]
        type = DislocationSourceVolume  
        variable = DD_EdgePositive_3
        dislocation_character = edge
        dislocation_sign = positive
        slip_system_index = 3
        #block = 1
      [../]
  [./dot_DD_EdgePositive_4]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgePositive_4
    #block = 1
  [../]
    [./Advection_DD_EdgePositive_4]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_4
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 4
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
    [./Advection_DD_EdgePositive_5]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_5
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 5
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
    [./Advection_DD_EdgePositive_6]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_6
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 6
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
    [./Advection_DD_EdgePositive_7]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_7
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 7
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
    [./Advection_DD_EdgePositive_8]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_8
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 8
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
    [./Advection_DD_EdgePositive_9]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_9
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 9
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
    [./Advection_DD_EdgePositive_10]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_10
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 10
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
    [./Advection_DD_EdgePositive_11]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_11
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 11
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
    [./Advection_DD_EdgePositive_12]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgePositive_12
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 12
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
  
  [./dot_DD_EdgeNegative_1]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_EdgeNegative_1
    #block = 1
  [../]
    [./Advection_DD_EdgeNegative_1]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_1
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 1
      #block = 1
    [../]
      [./Source_DD_EdgeNetative_1]
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
    [./Advection_DD_EdgeNegative_2]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_2
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 2
      #block = 1
    [../]
      [./Source_DD_EdgeNetative_2]
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
    [./Advection_DD_EdgeNegative_3]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_3
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 3
      #block = 1
    [../]
      [./Source_DD_EdgeNetative_3]
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
    [./Advection_DD_EdgeNegative_4]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_4
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 4
      #block = 1
    [../]
      [./Source_DD_EdgeNetative_4]
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
    [./Advection_DD_EdgeNegative_5]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_5
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 5
      #block = 1
    [../]
      [./Source_DD_EdgeNetative_5]
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
    [./Advection_DD_EdgeNegative_6]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_6
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 6
      #block = 1
    [../]
      [./Source_DD_EdgeNetative_6]
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
    [./Advection_DD_EdgeNegative_7]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_7
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 7
      #block = 1
    [../]
      [./Source_DD_EdgeNetative_7]
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
    [./Advection_DD_EdgeNegative_8]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_8
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 8
      #block = 1
    [../]
      [./Source_DD_EdgeNetative_8]
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
    [./Advection_DD_EdgeNegative_9]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_9
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 9
      #block = 1
    [../]
      [./Source_DD_EdgeNetative_9]
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
    [./Advection_DD_EdgeNegative_10]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_10
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 10
      #block = 1
    [../]
      [./Source_DD_EdgeNetative_10]
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
    [./Advection_DD_EdgeNegative_11]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_11
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 11
      #block = 1
    [../]
      [./Source_DD_EdgeNetative_11]
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
    [./Advection_DD_EdgeNegative_12]
      type = ConservativeAdvectionDislocation
      variable = DD_EdgeNegative_12
      upwinding_type = full
      dislocation_character = edge
      dislocation_sign = negative
      slip_system_index = 12
      #block = 1
    [../]
      [./Source_DD_EdgeNetative_12]
        type = DislocationSourceVolume  
        variable = DD_EdgeNegative_12
        dislocation_character = edge
        dislocation_sign = negative
        slip_system_index = 12
        #block = 1
      [../]
  
  
  [./dot_DD_ScrewPositive_1]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_1
    #block = 1
  [../]
    [./Advection_DD_ScrewPositive_1]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_1
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 1
      #block = 1
    [../]
      [./Source_DD_ScrewPositive_1]
        type = DislocationSourceVolume  
        variable = DD_ScrewPositive_1
        dislocation_character = screw
        dislocation_sign = positive
        slip_system_index = 1
        #block = 1
      [../]
  [./dot_DD_ScrewPositive_2]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_2
    #block = 1
  [../]
    [./Advection_DD_ScrewPositive_2]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_2
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 2
      #block = 1
    [../]
      [./Source_DD_ScrewPositive_2]
        type = DislocationSourceVolume  
        variable = DD_ScrewPositive_2
        dislocation_character = screw
        dislocation_sign = positive
        slip_system_index = 2
        #block = 1
      [../]
  [./dot_DD_ScrewPositive_3]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_3
    #block = 1
  [../]
    [./Advection_DD_ScrewPositive_3]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_3
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 3
      #block = 1
    [../]
      [./Source_DD_ScrewPositive_3]
        type = DislocationSourceVolume  
        variable = DD_ScrewPositive_3
        dislocation_character = screw
        dislocation_sign = positive
        slip_system_index = 3
        #block = 1
      [../]
  [./dot_DD_ScrewPositive_4]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_4
    #block = 1
  [../]
    [./Advection_DD_ScrewPositive_4]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_4
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 4
      #block = 1
    [../]
      [./Source_DD_ScrewPositive_4]
        type = DislocationSourceVolume  
        variable = DD_ScrewPositive_4
        dislocation_character = screw
        dislocation_sign = positive
        slip_system_index = 4
        #block = 1
      [../]
  [./dot_DD_ScrewPositive_5]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_5
    #block = 1
  [../]
    [./Advection_DD_ScrewPositive_5]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_5
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 5
      #block = 1
    [../]
      [./Source_DD_ScrewPositive_5]
        type = DislocationSourceVolume  
        variable = DD_ScrewPositive_5
        dislocation_character = screw
        dislocation_sign = positive
        slip_system_index = 5
        #block = 1
      [../]
  [./dot_DD_ScrewPositive_6]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_6
    #block = 1
  [../]
    [./Advection_DD_ScrewPositive_6]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_6
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 6
      #block = 1
    [../]
      [./Source_DD_ScrewPositive_6]
        type = DislocationSourceVolume  
        variable = DD_ScrewPositive_6
        dislocation_character = screw
        dislocation_sign = positive
        slip_system_index = 6
        #block = 1
      [../]
  [./dot_DD_ScrewPositive_7]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_7
    #block = 1
  [../]
    [./Advection_DD_ScrewPositive_7]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_7
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 7
      #block = 1
    [../]
      [./Source_DD_ScrewPositive_7]
        type = DislocationSourceVolume  
        variable = DD_ScrewPositive_7
        dislocation_character = screw
        dislocation_sign = positive
        slip_system_index = 7
        #block = 1
      [../]
  [./dot_DD_ScrewPositive_8]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_8
    #block = 1
  [../]
    [./Advection_DD_ScrewPositive_8]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_8
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 8
      #block = 1
    [../]
      [./Source_DD_ScrewPositive_8]
        type = DislocationSourceVolume  
        variable = DD_ScrewPositive_8
        dislocation_character = screw
        dislocation_sign = positive
        slip_system_index = 8
        #block = 1
      [../]
  [./dot_DD_ScrewPositive_9]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_9
    #block = 1
  [../]
    [./Advection_DD_ScrewPositive_9]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_9
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 9
      #block = 1
    [../]
      [./Source_DD_ScrewPositive_9]
        type = DislocationSourceVolume  
        variable = DD_ScrewPositive_9
        dislocation_character = screw
        dislocation_sign = positive
        slip_system_index = 9
        #block = 1
      [../]
  [./dot_DD_ScrewPositive_10]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_10
    #block = 1
  [../]
    [./Advection_DD_ScrewPositive_10]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_10
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 10
      #block = 1
    [../]
      [./Source_DD_ScrewPositive_10]
        type = DislocationSourceVolume  
        variable = DD_ScrewPositive_10
        dislocation_character = screw
        dislocation_sign = positive
        slip_system_index = 10
        #block = 1
      [../]
  [./dot_DD_ScrewPositive_11]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_11
    #block = 1
  [../]
    [./Advection_DD_ScrewPositive_11]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_11
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 11
      #block = 1
    [../]
      [./Source_DD_ScrewPositive_11]
        type = DislocationSourceVolume  
        variable = DD_ScrewPositive_11
        dislocation_character = screw
        dislocation_sign = positive
        slip_system_index = 11
        #block = 1
      [../]
  [./dot_DD_ScrewPositive_12]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_12
    #block = 1
  [../]
    [./Advection_DD_ScrewPositive_12]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewPositive_12
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 12
      #block = 1
    [../]
      [./Source_DD_ScrewPositive_12]
        type = DislocationSourceVolume  
        variable = DD_ScrewPositive_12
        dislocation_character = screw
        dislocation_sign = positive
        slip_system_index = 12
        #block = 1
      [../]
  
  [./dot_DD_ScrewNegative_1]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_1
    #block = 1
  [../]
    [./Advection_DD_ScrewNegative_1]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_1
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 1
      #block = 1
    [../]
      [./Source_DD_ScrewNegative_1]
        type = DislocationSourceVolume  
        variable = DD_ScrewNegative_1
        dislocation_character = screw
        dislocation_sign = negative
        slip_system_index = 1
        #block = 1
      [../]
  [./dot_DD_ScrewNegative_2]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_2
    #block = 1
  [../]
    [./Advection_DD_ScrewNegative_2]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_2
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 2
      #block = 1
    [../]
      [./Source_DD_ScrewNegative_2]
        type = DislocationSourceVolume  
        variable = DD_ScrewNegative_2
        dislocation_character = screw
        dislocation_sign = negative
        slip_system_index = 2
        #block = 1
      [../]
  [./dot_DD_ScrewNegative_3]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_3
    #block = 1
  [../]
    [./Advection_DD_ScrewNegative_3]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_3
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 3
      #block = 1
    [../]
      [./Source_DD_ScrewNegative_3]
        type = DislocationSourceVolume  
        variable = DD_ScrewNegative_3
        dislocation_character = screw
        dislocation_sign = negative
        slip_system_index = 3
        #block = 1
      [../]
  [./dot_DD_ScrewNegative_4]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_4
    #block = 1
  [../]
    [./Advection_DD_ScrewNegative_4]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_4
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 4
      #block = 1
    [../]
      [./Source_DD_ScrewNegative_4]
        type = DislocationSourceVolume  
        variable = DD_ScrewNegative_4
        dislocation_character = screw
        dislocation_sign = negative
        slip_system_index = 4
        #block = 1
      [../]
  [./dot_DD_ScrewNegative_5]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_5
    #block = 1
  [../]
    [./Advection_DD_ScrewNegative_5]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_5
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 5
      #block = 1
    [../]
      [./Source_DD_ScrewNegative_5]
        type = DislocationSourceVolume  
        variable = DD_ScrewNegative_5
        dislocation_character = screw
        dislocation_sign = negative
        slip_system_index = 5
        #block = 1
      [../]
  [./dot_DD_ScrewNegative_6]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_6
    #block = 1
  [../]
    [./Advection_DD_ScrewNegative_6]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_6
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 6
      #block = 1
    [../]
      [./Source_DD_ScrewNegative_6]
        type = DislocationSourceVolume  
        variable = DD_ScrewNegative_6
        dislocation_character = screw
        dislocation_sign = negative
        slip_system_index = 6
        #block = 1
      [../]
  [./dot_DD_ScrewNegative_7]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_7
    #block = 1
  [../]
    [./Advection_DD_ScrewNegative_7]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_7
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 7
      #block = 1
    [../]
      [./Source_DD_ScrewNegative_7]
        type = DislocationSourceVolume  
        variable = DD_ScrewNegative_7
        dislocation_character = screw
        dislocation_sign = negative
        slip_system_index = 7
        #block = 1
      [../]
  [./dot_DD_ScrewNegative_8]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_8
    #block = 1
  [../]
    [./Advection_DD_ScrewNegative_8]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_8
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 8
      #block = 1
    [../]
      [./Source_DD_ScrewNegative_8]
        type = DislocationSourceVolume  
        variable = DD_ScrewNegative_8
        dislocation_character = screw
        dislocation_sign = negative
        slip_system_index = 8
        #block = 1
      [../]
  [./dot_DD_ScrewNegative_9]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_9
    #block = 1
  [../]
    [./Advection_DD_ScrewNegative_9]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_9
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 9
      #block = 1
    [../]
      [./Source_DD_ScrewNegative_9]
        type = DislocationSourceVolume  
        variable = DD_ScrewNegative_9
        dislocation_character = screw
        dislocation_sign = negative
        slip_system_index = 9
        #block = 1
      [../]
  [./dot_DD_ScrewNegative_10]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_10
    #block = 1
  [../]
    [./Advection_DD_ScrewNegative_10]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_10
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 10
      #block = 1
    [../]
      [./Source_DD_ScrewNegative_10]
        type = DislocationSourceVolume  
        variable = DD_ScrewNegative_10
        dislocation_character = screw
        dislocation_sign = negative
        slip_system_index = 10
        #block = 1
      [../]
  [./dot_DD_ScrewNegative_11]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_11
    #block = 1
  [../]
    [./Advection_DD_ScrewNegative_11]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_11
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 11
      #block = 1
    [../]
      [./Source_DD_ScrewNegative_11]
        type = DislocationSourceVolume  
        variable = DD_ScrewNegative_11
        dislocation_character = screw
        dislocation_sign = negative
        slip_system_index = 11
        #block = 1
      [../]
  [./dot_DD_ScrewNegative_12]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_12
    #block = 1
  [../]
    [./Advection_DD_ScrewNegative_12]
      type = ConservativeAdvectionDislocation
      variable = DD_ScrewNegative_12
      upwinding_type = full
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 12
      #block = 1
    [../]
      [./Source_DD_ScrewNegative_12]
        type = DislocationSourceVolume  
        variable = DD_ScrewNegative_12
        dislocation_character = screw
        dislocation_sign = negative
        slip_system_index = 12
        #block = 1
      [../]
[]

# [InterfaceKernels]
#   [./Intf_Avd_DD_EdgeNegative_6_1]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgePositive_1
#     slip_system_index_neighbor = 1
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = positive
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_2]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgePositive_2
#     slip_system_index_neighbor = 2
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = positive
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_3]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgePositive_3
#     slip_system_index_neighbor = 3
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = positive
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_4]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgePositive_4
#     slip_system_index_neighbor = 4
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = positive
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_5]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgePositive_5
#     slip_system_index_neighbor = 5
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = positive
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_6]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgePositive_6
#     slip_system_index_neighbor = 6
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = positive
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_7]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgePositive_7
#     slip_system_index_neighbor = 7
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = positive
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_8]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgePositive_8
#     slip_system_index_neighbor = 8
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = positive
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_9]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgePositive_9
#     slip_system_index_neighbor = 9
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = positive
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_10]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgePositive_10
#     slip_system_index_neighbor = 10
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = positive
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_11]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgePositive_11
#     slip_system_index_neighbor = 11
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = positive
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_12]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgePositive_12
#     slip_system_index_neighbor = 12
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = positive
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]

#   [./Intf_Avd_DD_EdgeNegative_6_n1]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgeNegative_1
#     slip_system_index_neighbor = 1
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = negative
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_n2]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgeNegative_2
#     slip_system_index_neighbor = 2
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = negative
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_n3]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgeNegative_3
#     slip_system_index_neighbor = 3
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = negative
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_n4]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgeNegative_4
#     slip_system_index_neighbor = 4
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = negative
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_n5]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgeNegative_5
#     slip_system_index_neighbor = 5
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = negative
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_n6]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgeNegative_6
#     slip_system_index_neighbor = 6
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = negative
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_n7]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     neighbor_var = DD_EdgeNegative_7
#     slip_system_index_neighbor = 7
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     dislocation_sign = negative
#     dislocation_sign_neighbor = negative
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_n8]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     dislocation_sign = negative
#     neighbor_var = DD_EdgeNegative_8
#     slip_system_index_neighbor = 8
#     dislocation_sign_neighbor = negative
#     transfer_type = threshold #max #single threshold
#     dislocation_character = edge
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_n9]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     dislocation_sign = negative
#     neighbor_var = DD_EdgeNegative_9
#     slip_system_index_neighbor = 9
#     dislocation_sign_neighbor = negative
#     dislocation_character = edge
#     transfer_type = threshold #max #single threshold
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_n10]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     dislocation_sign = negative
#     neighbor_var = DD_EdgeNegative_10
#     slip_system_index_neighbor = 10
#     dislocation_sign_neighbor = negative
#     dislocation_character = edge
#     transfer_type = threshold #max #single threshold
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_n11]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     dislocation_sign = negative
#     neighbor_var = DD_EdgeNegative_11
#     slip_system_index_neighbor = 11
#     dislocation_sign_neighbor = negative
#     dislocation_character = edge
#     transfer_type = threshold #max #single threshold
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]
#   [./Intf_Avd_DD_EdgeNegative_6_n12]
#     type = InterfaceDiffusionDislocationLusterMorris
#     variable = DD_EdgeNegative_6
#     slip_system_index = 6
#     dislocation_sign = negative
#     neighbor_var = DD_EdgeNegative_12
#     slip_system_index_neighbor = 12
#     dislocation_sign_neighbor = negative
#     dislocation_character = edge
#     transfer_type = threshold #max #single threshold
#     boundary = surface_GB
#     density_critical = 400000
#     tau_critical = 2
#     matrix_threshold = 0.7
#   [../]

#     [./Intf_Avd_DD_EdgePositive_9_1]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgePositive_1
#       slip_system_index_neighbor = 1
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = positive
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_2]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgePositive_2
#       slip_system_index_neighbor = 2
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = positive
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_3]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgePositive_3
#       slip_system_index_neighbor = 3
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = positive
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_4]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgePositive_4
#       slip_system_index_neighbor = 4
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = positive
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_5]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgePositive_5
#       slip_system_index_neighbor = 5
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = positive
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_6]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgePositive_6
#       slip_system_index_neighbor = 6
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = positive
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_7]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgePositive_7
#       slip_system_index_neighbor = 7
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = positive
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_8]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgePositive_8
#       slip_system_index_neighbor = 8
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = positive
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_9]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgePositive_9
#       slip_system_index_neighbor = 9
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = positive
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_10]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgePositive_10
#       slip_system_index_neighbor = 10
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = positive
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_11]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgePositive_11
#       slip_system_index_neighbor = 11
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = positive
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_12]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgePositive_12
#       slip_system_index_neighbor = 12
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = positive
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
  
#     [./Intf_Avd_DD_EdgePositive_9_n1]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgeNegative_1
#       slip_system_index_neighbor = 1
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = negative
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_n2]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgeNegative_2
#       slip_system_index_neighbor = 2
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = negative
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_n3]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgeNegative_3
#       slip_system_index_neighbor = 3
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = negative
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_n4]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgeNegative_4
#       slip_system_index_neighbor = 4
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = negative
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_n5]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgeNegative_5
#       slip_system_index_neighbor = 5
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = negative
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_n6]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgeNegative_6
#       slip_system_index_neighbor = 6
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = negative
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_n7]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       neighbor_var = DD_EdgeNegative_7
#       slip_system_index_neighbor = 7
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       dislocation_sign = positive
#       dislocation_sign_neighbor = negative
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_n8]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       dislocation_sign = positive
#       neighbor_var = DD_EdgeNegative_8
#       slip_system_index_neighbor = 8
#       dislocation_sign_neighbor = negative
#       transfer_type = threshold #max #single threshold
#       dislocation_character = edge
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_n9]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       dislocation_sign = positive
#       neighbor_var = DD_EdgeNegative_9
#       slip_system_index_neighbor = 9
#       dislocation_sign_neighbor = negative
#       dislocation_character = edge
#       transfer_type = threshold #max #single threshold
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_n10]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       dislocation_sign = positive
#       neighbor_var = DD_EdgeNegative_10
#       slip_system_index_neighbor = 10
#       dislocation_sign_neighbor = negative
#       dislocation_character = edge
#       transfer_type = threshold #max #single threshold
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_n11]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       dislocation_sign = positive
#       neighbor_var = DD_EdgeNegative_11
#       slip_system_index_neighbor = 11
#       dislocation_sign_neighbor = negative
#       dislocation_character = edge
#       transfer_type = threshold #max #single threshold
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
#     [./Intf_Avd_DD_EdgePositive_9_n12]
#       type = InterfaceDiffusionDislocationLusterMorris
#       variable = DD_EdgePositive_9
#       slip_system_index = 9
#       dislocation_sign = positive
#       neighbor_var = DD_EdgeNegative_12
#       slip_system_index_neighbor = 12
#       dislocation_sign_neighbor = negative
#       dislocation_character = edge
#       transfer_type = threshold #max #single threshold
#       boundary = surface_GB
#       density_critical = 400000
#       tau_critical = 2
#       matrix_threshold = 0.7
#     [../]
# []

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
  [./BC_ZX]
    type = FunctionDirichletBC
    variable = disp_x
    boundary = 'z0'
    # boundary = back
    function = 0.0
  [../]
  [./BC_ZY]
    type = FunctionDirichletBC
    variable = disp_y
    boundary = 'z0'
    # boundary = back
    function = 0.0
  [../]
  [./BC_Z]
    type = FunctionDirichletBC
    variable = disp_z
    boundary = 'z0'
    # boundary = back
    function = 0.0
  [../]

    [./BC_Z1X]
      type = FunctionDirichletBC
      variable = disp_x
      boundary = 'z1'
      # boundary = front
      function = 0.0
    [../]
    [./BC_Z1Y]
      type = FunctionDirichletBC
      variable = disp_y
      # boundary = front
      boundary = 'z1'
      function = 0.0
    [../]

  # Compression along z
  [./BC_Loading]
    type = FunctionDirichletBC
    variable = disp_z
    boundary = 'z0 z1'
    # boundary = front
    function = '-0.001*z*t'
  [../]
  
[]

[Physics/SolidMechanics/QuasiStatic/all]
  strain = FINITE
  add_variables = true
  new_system = true
  # formulation = total
  incremental = true
[]

[Materials]
  [./elasticity_tensor]
    type = ComputeElasticityTensorCP
    C_ijkl = '1.684e5 1.214e5 1.214e5 1.684e5 1.214e5 1.684e5 0.754e5 0.754e5 0.754e5'
    # C_ijkl = '11e3 12e3 13e3 22e3 23e3 33e3 44e3 55e3 66e3'
    # C_ijkl = '11e3 12e3 12e3 11e3 12e3 11e3 44e3 44e3 44e3'
    # C_ijkl = '1.684e4 1.214e4 1.214e4 1.684e4 1.214e4 1.684e4 0.754e4 0.754e4 0.754e4'
    fill_method = symmetric9
    read_prop_user_object = prop_read
  [../]
  [stress_brass]
    type = ComputeMultipleCrystalPlasticityOrowanStress
    crystal_plasticity_models = 'CP_DiscoFlux'
    tan_mod_type = exact
    # maximum_substep_iteration = 20
    print_state_variable_convergence_error_messages = true
    # rtol = 0.0001
    # abs_tol = 1e-12
  []
  [./CP_DiscoFlux]
    # type = DiscoFluxCPOrowanDragLinearStressUpdate
    # vs_edge = 1.62e-5
    # vs_screw = 2.2e-5
    # B0 =  0.00000052
    # B0s = 0.0000004
    # Coeff_backstress = 0.02
    type = DiscoFluxCPOrowanStressUpdate
    number_slip_systems = 12
    slip_sys_file_name = /Users/bmurgas/workspace/auxfiles/input_slip_sys.inp
    lattice_friction = 15 #15
    Coeff_hardening = 0.25
    slip_increment_tolerance = 0.02 #2.0e-2 10.0
    dislo_density_factor_CDT = 1.0
    # initial_athermal = 30
    mean_free_path_init_flag = true
    disloc_den_threshold_flag = true
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
  dislo_density_initial = 2000
  C_multi  = 0.004  #8.5e-06 0.4
  C_trap   = 0.0036  #5.5e-03 0.36
  C_m_ann  = 0.0016  #0.5 0.16
  C_im_ann = 0.0016 #0.5 0.16
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
  petsc_options = '-snes_ksp_ew'
  petsc_options_iname = '-pc_type -pc_hypre_type -ksp_gmres_restart'
  petsc_options_value = 'hypre    boomeramg          31'
  line_search = 'none'
  l_max_its = 50
  nl_max_its = 50
  nl_abs_tol = 1e-5 #1e-6
  l_abs_tol = 1e-5

  dtmax = 0.2
  dtmin = 1e-10
  end_time = 100 #100 200
  [./TimeStepper]
    type = ConstantDT
    dt = 0.1
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
  [./Flux_12]
    family = MONOMIAL_VEC
    order = FIRST
  []
  [./Flux_11]
    family = MONOMIAL_VEC
    order = FIRST
  []
  [./Flux_10]
    family = MONOMIAL_VEC
    order = FIRST
  []
  [./Flux_9]
    family = MONOMIAL_VEC
    order = FIRST
  []
  [./Flux_8]
    family = MONOMIAL_VEC
    order = FIRST
  []
  [./Flux_7]
    family = MONOMIAL_VEC
    order = FIRST
  []
  [./Flux_6]
    family = MONOMIAL_VEC
    order = FIRST
  []
  [./Flux_5]
    family = MONOMIAL_VEC
    order = FIRST
  []
  [./Flux_4]
    family = MONOMIAL_VEC
    order = FIRST
  []
  [./Flux_3]
    family = MONOMIAL_VEC
    order = FIRST
  []
  [./Flux_2]
    family = MONOMIAL_VEC
    order = FIRST
  []
  [./Flux_1]
    family = MONOMIAL_VEC
    order = FIRST
  []
[]

[AuxKernels]
  [./Flux_12]
    type = DislocationFluxEdgeVec
    dislocation = DD_EdgePositive_12
    dislocation_character = edge
    dislocation_sign = positive
    slip_system_index = 12
    variable = Flux_12
    execute_on = 'INITIAL TIMESTEP_END'
  [../]
  [./Flux_11]
    type = DislocationFluxEdgeVec
    dislocation = DD_EdgePositive_11
    dislocation_character = edge
    dislocation_sign = positive
    slip_system_index = 11
    variable = Flux_11
    execute_on = 'INITIAL TIMESTEP_END'
  [../]
  [./Flux_10]
    type = DislocationFluxEdgeVec
    dislocation = DD_EdgePositive_10
    dislocation_character = edge
    dislocation_sign = positive
    slip_system_index = 10
    variable = Flux_10
    execute_on = 'INITIAL TIMESTEP_END'
  [../]
    [./Flux_9]
      type = DislocationFluxEdgeVec
      dislocation = DD_EdgePositive_9
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 9
      variable = Flux_9
      execute_on = 'INITIAL TIMESTEP_END'
    [../]
  [./Flux_8]
    type = DislocationFluxEdgeVec
    dislocation = DD_EdgePositive_8
    dislocation_character = edge
    dislocation_sign = positive
    slip_system_index = 8
    variable = Flux_8
    execute_on = 'INITIAL TIMESTEP_END'
  [../]
  [./Flux_7]
    type = DislocationFluxEdgeVec
    dislocation = DD_EdgePositive_7
    dislocation_character = edge
    dislocation_sign = positive
    slip_system_index = 7
    variable = Flux_7
    execute_on = 'INITIAL TIMESTEP_END'
  [../]
  [./Flux_6]
    type = DislocationFluxEdgeVec
    dislocation = DD_EdgePositive_6
    dislocation_character = edge
    dislocation_sign = positive
    slip_system_index = 6
    variable = Flux_6
    execute_on = 'INITIAL TIMESTEP_END'
  [../]
  [./Flux_5]
    type = DislocationFluxEdgeVec
    dislocation = DD_EdgePositive_5
    dislocation_character = edge
    dislocation_sign = positive
    slip_system_index = 5
    variable = Flux_5
    execute_on = 'INITIAL TIMESTEP_END'
  [../]
  [./Flux_4]
    type = DislocationFluxEdgeVec
    dislocation = DD_EdgePositive_4
    dislocation_character = edge
    dislocation_sign = positive
    slip_system_index = 4
    variable = Flux_4
    execute_on = 'INITIAL TIMESTEP_END'
  [../]
  [./Flux_3]
    type = DislocationFluxEdgeVec
    dislocation = DD_EdgePositive_3
    dislocation_character = edge
    dislocation_sign = positive
    slip_system_index = 3
    variable = Flux_3
    execute_on = 'INITIAL TIMESTEP_END'
  [../]
  [./Flux_2]
    type = DislocationFluxEdgeVec
    dislocation = DD_EdgePositive_2
    dislocation_character = edge
    dislocation_sign = positive
    slip_system_index = 2
    variable = Flux_2
    execute_on = 'INITIAL TIMESTEP_END'
  [../]
    [./Flux_1]
      type = DislocationFluxEdgeVec
      dislocation = DD_EdgePositive_1
      dislocation_character = edge
      dislocation_sign = positive
      slip_system_index = 1
      variable = Flux_1
      execute_on = 'INITIAL TIMESTEP_END'
    [../]
[]

# [AuxVariables]
#   [./DD_EP_01]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EP_02]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EP_03]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EP_04]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EP_05]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EP_06]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EP_07]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EP_08]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EP_09]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EP_10]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EP_11]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EP_12]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
# []


# [AuxKernels]
#   [./DD_EP_01]
#    type = MaterialRealAux
#    variable = DD_EP_01
#    property = DD_EdgePositive_1
#   [../]
#   [./DD_EP_02]
#    type = MaterialRealAux
#    variable = DD_EP_02
#    property = DD_EdgePositive_2  
#   [../]
#   [./DD_EP_03]
#    type = MaterialRealAux
#    variable = DD_EP_03
#    property = DD_EdgePositive_3
#   [../]
#   [./DD_EP_04]
#    type = MaterialRealAux
#    variable = DD_EP_04
#    property = DD_EdgePositive_4
#   [../]
#   [./DD_EP_05]
#    type = MaterialRealAux
#    variable = DD_EP_05
#    property = DD_EdgePositive_5
#   [../]
#   [./DD_EP_06]
#    type = MaterialRealAux
#    variable = DD_EP_06
#    property = DD_EdgePositive_6
#   [../]
#   [./DD_EP_07]
#    type = MaterialRealAux
#    variable = DD_EP_07
#    property = DD_EdgePositive_7
#   [../]
#   [./DD_EP_08]
#    type = MaterialRealAux
#    variable = DD_EP_08
#    property = DD_EdgePositive_8
#   [../]
#   [./DD_EP_09]
#    type = MaterialRealAux
#    variable = DD_EP_09
#    property = DD_EdgePositive_9
#   [../]
#   [./DD_EP_10]
#    type = MaterialRealAux
#    variable = DD_EP_10
#    property = DD_EdgePositive_10
#   [../]
#   [./DD_EP_11]
#    type = MaterialRealAux
#    variable = DD_EP_11
#    property = DD_EdgePositive_11
#   [../]
#   [./DD_EP_12]
#    type = MaterialRealAux
#    variable = DD_EP_12
#    property = DD_EdgePositive_12
#   [../]
# []
  

# [AuxVariables]
#   [./DD_EN_01]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EN_02]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EN_03]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EN_04]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EN_05]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EN_06]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EN_07]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EN_08]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EN_09]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EN_10]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EN_11]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_EN_12]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
# []


# [AuxKernels]
#   [./DD_EN_01]
#    type = MaterialRealAux
#    variable = DD_EN_01
#    property = DD_EdgeNegative_1
#   [../]
#   [./DD_EN_02]
#    type = MaterialRealAux
#    variable = DD_EN_02
#    property = DD_EdgeNegative_2
#   [../]
#   [./DD_EN_03]
#    type = MaterialRealAux
#    variable = DD_EN_03
#    property = DD_EdgeNegative_3
#   [../]
#   [./DD_EN_04]
#    type = MaterialRealAux
#    variable = DD_EN_04
#    property = DD_EdgeNegative_4
#   [../]
#   [./DD_EN_05]
#    type = MaterialRealAux
#    variable = DD_EN_05
#    property = DD_EdgeNegative_5
#   [../]
#   [./DD_EN_06]
#    type = MaterialRealAux
#    variable = DD_EN_06
#    property = DD_EdgeNegative_6
#   [../]
#   [./DD_EN_07]
#    type = MaterialRealAux
#    variable = DD_EN_07
#    property = DD_EdgeNegative_7
#   [../]
#   [./DD_EN_08]
#    type = MaterialRealAux
#    variable = DD_EN_08
#    property = DD_EdgeNegative_8
#   [../]
#   [./DD_EN_09]
#    type = MaterialRealAux
#    variable = DD_EN_09
#    property = DD_EdgeNegative_9
#   [../]
#   [./DD_EN_10]
#    type = MaterialRealAux
#    variable = DD_EN_10
#    property = DD_EdgeNegative_10
#   [../]
#   [./DD_EN_11]
#    type = MaterialRealAux
#    variable = DD_EN_11
#    property = DD_EdgeNegative_11
#   [../]
#   [./DD_EN_12]
#    type = MaterialRealAux
#    variable = DD_EN_12 
#    property = DD_EdgeNegative_12
#   [../]
# []

# [AuxVariables]
#   [./DD_SP_01]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SP_02]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SP_03]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SP_04]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SP_05]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SP_06]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SP_07]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SP_08]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SP_09]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SP_10]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SP_11]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SP_12]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
# []


# [AuxKernels]
#   [./DD_SP_01]
#    type = MaterialRealAux
#    variable = DD_SP_01
#    property = DD_ScrewPositive_1
#   [../]
#   [./DD_SP_02]
#    type = MaterialRealAux
#    variable = DD_SP_02
#    property = DD_ScrewPositive_2
#   [../]
#   [./DD_SP_03]
#    type = MaterialRealAux
#    variable = DD_SP_03
#    property = DD_ScrewPositive_3
#   [../]
#   [./DD_SP_04]
#    type = MaterialRealAux
#    variable = DD_SP_04
#    property = DD_ScrewPositive_4
#   [../]
#   [./DD_SP_05]
#    type = MaterialRealAux
#    variable = DD_SP_05
#    property = DD_ScrewPositive_5
#   [../]
#   [./DD_SP_06]
#    type = MaterialRealAux
#    variable = DD_SP_06
#    property = DD_ScrewPositive_6
#   [../]
#   [./DD_SP_07]
#    type = MaterialRealAux
#    variable = DD_SP_07
#    property = DD_ScrewPositive_7
#   [../]
#   [./DD_SP_08]
#    type = MaterialRealAux
#    variable = DD_SP_08
#    property = DD_ScrewPositive_8
#   [../]
#   [./DD_SP_09]
#    type = MaterialRealAux
#    variable = DD_SP_09
#    property = DD_ScrewPositive_9
#   [../]
#   [./DD_SP_10]
#    type = MaterialRealAux
#    variable = DD_SP_10 
#    property = DD_ScrewPositive_10
#   [../]
#   [./DD_SP_11]
#    type = MaterialRealAux
#    variable = DD_SP_11 
#    property = DD_ScrewPositive_11
#   [../]
#   [./DD_SP_12]
#    type = MaterialRealAux
#    variable = DD_SP_12
#    property = DD_ScrewPositive_12
#   [../]
# []
  

# [AuxVariables]
#   [./DD_SN_01]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SN_02]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SN_03]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SN_04]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SN_05]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SN_06]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SN_07]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SN_08]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SN_09]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SN_10]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SN_11]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
#   [./DD_SN_12]
#    order = CONSTANT
#    family = MONOMIAL
#   [../]
# []


# [AuxKernels]
#   [./DD_SN_01]
#    type = MaterialRealAux
#    variable = DD_SN_01
#    property = DD_ScrewNegative_1
#   [../]
#   [./DD_SN_02]
#    type = MaterialRealAux
#    variable = DD_SN_02
#    property = DD_ScrewNegative_2
#   [../]
#   [./DD_SN_03]
#    type = MaterialRealAux
#    variable = DD_SN_03
#    property = DD_ScrewNegative_3
#   [../]
#   [./DD_SN_04]
#    type = MaterialRealAux
#    variable = DD_SN_04
#    property = DD_ScrewNegative_4
#   [../]
#   [./DD_SN_05]
#    type = MaterialRealAux
#    variable = DD_SN_05
#    property = DD_ScrewNegative_5
#   [../]
#   [./DD_SN_06]
#    type = MaterialRealAux
#    variable = DD_SN_06
#    property = DD_ScrewNegative_6
#   [../]
#   [./DD_SN_07]
#    type = MaterialRealAux
#    variable = DD_SN_07
#    property = DD_ScrewNegative_7
#   [../]
#   [./DD_SN_08]
#    type = MaterialRealAux
#    variable = DD_SN_08
#    property = DD_ScrewNegative_8
#   [../]
#   [./DD_SN_09]
#    type = MaterialRealAux
#    variable = DD_SN_09
#    property = DD_ScrewNegative_9
#   [../]
#   [./DD_SN_10]
#    type = MaterialRealAux
#    variable = DD_SN_10
#    property = DD_ScrewNegative_10
#   [../]
#   [./DD_SN_11]
#    type = MaterialRealAux
#    variable = DD_SN_11
#    property = DD_ScrewNegative_11
#   [../]
#   [./DD_SN_12]
#    type = MaterialRealAux #ElementAverageValue
#    variable = DD_SN_12
#    property = DD_ScrewNegative_12
#   [../]
# []

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
