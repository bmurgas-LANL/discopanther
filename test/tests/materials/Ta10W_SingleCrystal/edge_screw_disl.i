[GlobalParams]
  displacements = 'disp_x disp_y disp_z'
  volumetric_locking_correction = true
[]

[Postprocessors]
  [./pp_DD_mobile_01]
    type = ElementAverageValue
    variable = DD_mobile_01
  [../]
  [./pp_DD_mobile_02]
    type = ElementAverageValue
    variable = DD_mobile_02
  [../]
  [./pp_DD_mobile_03]
    type = ElementAverageValue
    variable = DD_mobile_03
  [../]
  [./pp_DD_mobile_04]
    type = ElementAverageValue
    variable = DD_mobile_04
  [../]
  [./pp_DD_mobile_05]
    type = ElementAverageValue
    variable = DD_mobile_05
  [../]
  [./pp_DD_mobile_06]
    type = ElementAverageValue
    variable = DD_mobile_06
  [../]
  [./pp_DD_mobile_07]
    type = ElementAverageValue
    variable = DD_mobile_07
  [../]
  [./pp_DD_mobile_08]
    type = ElementAverageValue
    variable = DD_mobile_08
  [../]
  [./pp_DD_mobile_09]
    type = ElementAverageValue
    variable = DD_mobile_09
  [../]
  [./pp_DD_mobile_10]
    type = ElementAverageValue
    variable = DD_mobile_10
  [../]
  [./pp_DD_mobile_11]
    type = ElementAverageValue
    variable = DD_mobile_11
  [../]
  [./pp_DD_mobile_12]
    type = ElementAverageValue
    variable = DD_mobile_12
  [../]
  [./pp_DD_mobile_13]
    type = ElementAverageValue
    variable = DD_mobile_13
  [../]
  [./pp_DD_mobile_14]
    type = ElementAverageValue
    variable = DD_mobile_14
  [../]
  [./pp_DD_mobile_15]
    type = ElementAverageValue
    variable = DD_mobile_15
  [../]
  [./pp_DD_mobile_16]
    type = ElementAverageValue
    variable = DD_mobile_16
  [../]
  [./pp_DD_mobile_17]
    type = ElementAverageValue
    variable = DD_mobile_17
  [../]
  [./pp_DD_mobile_18]
    type = ElementAverageValue
    variable = DD_mobile_18
  [../]
  [./pp_DD_mobile_19]
    type = ElementAverageValue
    variable = DD_mobile_19
  [../]
  [./pp_DD_mobile_20]
    type = ElementAverageValue
    variable = DD_mobile_20
  [../]
  [./pp_DD_mobile_21]
    type = ElementAverageValue
    variable = DD_mobile_21
  [../]
  [./pp_DD_mobile_22]
    type = ElementAverageValue
    variable = DD_mobile_22
  [../]
  [./pp_DD_mobile_23]
    type = ElementAverageValue
    variable = DD_mobile_23
  [../]
  [./pp_DD_mobile_24]
    type = ElementAverageValue
    variable = DD_mobile_24
  [../]

  [./pp_DD_immobile_01]
    type = ElementAverageValue
    variable = DD_immobile_01
  [../]
  [./pp_DD_immobile_02]
    type = ElementAverageValue
    variable = DD_immobile_02
  [../]
  [./pp_DD_immobile_03]
    type = ElementAverageValue
    variable = DD_immobile_03
  [../]
  [./pp_DD_immobile_04]
    type = ElementAverageValue
    variable = DD_immobile_04
  [../]
  [./pp_DD_immobile_05]
    type = ElementAverageValue
    variable = DD_immobile_05
  [../]
  [./pp_DD_immobile_06]
    type = ElementAverageValue
    variable = DD_immobile_06
  [../]
  [./pp_DD_immobile_07]
    type = ElementAverageValue
    variable = DD_immobile_07
  [../]
  [./pp_DD_immobile_08]
    type = ElementAverageValue
    variable = DD_immobile_08
  [../]
  [./pp_DD_immobile_09]
    type = ElementAverageValue
    variable = DD_immobile_09
  [../]
  [./pp_DD_immobile_10]
    type = ElementAverageValue
    variable = DD_immobile_10
  [../]
  [./pp_DD_immobile_11]
    type = ElementAverageValue
    variable = DD_immobile_11
  [../]
  [./pp_DD_immobile_12]
    type = ElementAverageValue
    variable = DD_immobile_12
  [../]
  [./pp_DD_immobile_13]
    type = ElementAverageValue
    variable = DD_immobile_13
  [../]
  [./pp_DD_immobile_14]
    type = ElementAverageValue
    variable = DD_immobile_14
  [../]
  [./pp_DD_immobile_15]
    type = ElementAverageValue
    variable = DD_immobile_15
  [../]
  [./pp_DD_immobile_16]
    type = ElementAverageValue
    variable = DD_immobile_16
  [../]
  [./pp_DD_immobile_17]
    type = ElementAverageValue
    variable = DD_immobile_17
  [../]
  [./pp_DD_immobile_18]
    type = ElementAverageValue
    variable = DD_immobile_18
  [../]
  [./pp_DD_immobile_19]
    type = ElementAverageValue
    variable = DD_immobile_19
  [../]
  [./pp_DD_immobile_20]
    type = ElementAverageValue
    variable = DD_immobile_20
  [../]
  [./pp_DD_immobile_21]
    type = ElementAverageValue
    variable = DD_immobile_21
  [../]
  [./pp_DD_immobile_22]
    type = ElementAverageValue
    variable = DD_immobile_22
  [../]
  [./pp_DD_immobile_23]
    type = ElementAverageValue
    variable = DD_immobile_23
  [../]
  [./pp_DD_immobile_24]
    type = ElementAverageValue
    variable = DD_immobile_24
  [../]

  [./pp_shear_resistance_01]
    type = ElementAverageValue
    variable = shear_resistance_01
  [../]
  [./pp_shear_resistance_02]
    type = ElementAverageValue
    variable = shear_resistance_02
  [../]
  [./pp_shear_resistance_03]
    type = ElementAverageValue
    variable = shear_resistance_03
  [../]
  [./pp_shear_resistance_04]
    type = ElementAverageValue
    variable = shear_resistance_04
  [../]
  [./pp_shear_resistance_05]
    type = ElementAverageValue
    variable = shear_resistance_05
  [../]
  [./pp_shear_resistance_06]
    type = ElementAverageValue
    variable = shear_resistance_06
  [../]
  [./pp_shear_resistance_07]
    type = ElementAverageValue
    variable = shear_resistance_07
  [../]
  [./pp_shear_resistance_08]
    type = ElementAverageValue
    variable = shear_resistance_08
  [../]
  [./pp_shear_resistance_09]
    type = ElementAverageValue
    variable = shear_resistance_09
  [../]
  [./pp_shear_resistance_10]
    type = ElementAverageValue
    variable = shear_resistance_10
  [../]
  [./pp_shear_resistance_11]
    type = ElementAverageValue
    variable = shear_resistance_11
  [../]
  [./pp_shear_resistance_12]
    type = ElementAverageValue
    variable = shear_resistance_12
  [../]
  [./pp_shear_resistance_13]
    type = ElementAverageValue
    variable = shear_resistance_13
  [../]
  [./pp_shear_resistance_14]
    type = ElementAverageValue
    variable = shear_resistance_14
  [../]
  [./pp_shear_resistance_15]
    type = ElementAverageValue
    variable = shear_resistance_15
  [../]
  [./pp_shear_resistance_16]
    type = ElementAverageValue
    variable = shear_resistance_16
  [../]
  [./pp_shear_resistance_17]
    type = ElementAverageValue
    variable = shear_resistance_17
  [../]
  [./pp_shear_resistance_18]
    type = ElementAverageValue
    variable = shear_resistance_18
  [../]
  [./pp_shear_resistance_19]
    type = ElementAverageValue
    variable = shear_resistance_19
  [../]
  [./pp_shear_resistance_20]
    type = ElementAverageValue
    variable = shear_resistance_20
  [../]
  [./pp_shear_resistance_21]
    type = ElementAverageValue
    variable = shear_resistance_21
  [../]
  [./pp_shear_resistance_22]
    type = ElementAverageValue
    variable = shear_resistance_22
  [../]
  [./pp_shear_resistance_23]
    type = ElementAverageValue
    variable = shear_resistance_23
  [../]
  [./pp_shear_resistance_24]
    type = ElementAverageValue
    variable = shear_resistance_24
  [../]

  [./pp_shear_stress_14]
    type = ElementAverageValue
    variable = shear_stress_14
  [../]
  [./pp_shear_stress_17]
    type = ElementAverageValue
    variable = shear_stress_17
  [../]
  [./pp_shear_stress_20]
    type = ElementAverageValue
    variable = shear_stress_20
  [../]
  [./pp_shear_stress_23]
    type = ElementAverageValue
    variable = shear_stress_23
  [../]

  [./pp_back_stress_14]
    type = ElementAverageValue
    variable = back_stress_14
  [../]
  [./pp_back_stress_17]
    type = ElementAverageValue
    variable = back_stress_17
  [../]
  [./pp_back_stress_20]
    type = ElementAverageValue
    variable = back_stress_20
  [../]
  [./pp_back_stress_23]
    type = ElementAverageValue
    variable = back_stress_23
  [../]

  [./pp_sat_edgepos_14]
    type = ElementAverageValue
    variable = sat_edgepos_14
  [../]
  [./pp_sat_edgepos_17]
    type = ElementAverageValue
    variable = sat_edgepos_17
  [../]
  [./pp_sat_edgepos_20]
    type = ElementAverageValue
    variable = sat_edgepos_20
  [../]
  [./pp_sat_edgepos_23]
    type = ElementAverageValue
    variable = sat_edgepos_23
  [../]

  [./pp_sat_edgeneg_14]
    type = ElementAverageValue
    variable = sat_edgeneg_14
  [../]
  [./pp_sat_edgeneg_17]
    type = ElementAverageValue
    variable = sat_edgeneg_17
  [../]
  [./pp_sat_edgeneg_20]
    type = ElementAverageValue
    variable = sat_edgeneg_20
  [../]
  [./pp_sat_edgeneg_23]
    type = ElementAverageValue
    variable = sat_edgeneg_23
  [../]

  [./pp_sat_screwpos_14]
    type = ElementAverageValue
    variable = sat_screwpos_14
  [../]
  [./pp_sat_screwpos_17]
    type = ElementAverageValue
    variable = sat_screwpos_17
  [../]
  [./pp_sat_screwpos_20]
    type = ElementAverageValue
    variable = sat_screwpos_20
  [../]
  [./pp_sat_screwpos_23]
    type = ElementAverageValue
    variable = sat_screwpos_23
  [../]

  [./pp_sat_screwneg_14]
    type = ElementAverageValue
    variable = sat_screwneg_14
  [../]
  [./pp_sat_screwneg_17]
    type = ElementAverageValue
    variable = sat_screwneg_17
  [../]
  [./pp_sat_screwneg_20]
    type = ElementAverageValue
    variable = sat_screwneg_20
  [../]
  [./pp_sat_screwneg_23]
    type = ElementAverageValue
    variable = sat_screwneg_23
  [../]

  [./pp_slip_increment_01]
    type = ElementAverageValue
    variable = slip_increment_01
  [../]
  [./pp_slip_increment_02]
    type = ElementAverageValue
    variable = slip_increment_02
  [../]
  [./pp_slip_increment_03]
    type = ElementAverageValue
    variable = slip_increment_03
  [../]
  [./pp_slip_increment_04]
    type = ElementAverageValue
    variable = slip_increment_04
  [../]
  [./pp_slip_increment_05]
    type = ElementAverageValue
    variable = slip_increment_05
  [../]
  [./pp_slip_increment_06]
    type = ElementAverageValue
    variable = slip_increment_06
  [../]
  [./pp_slip_increment_07]
    type = ElementAverageValue
    variable = slip_increment_07
  [../]
  [./pp_slip_increment_08]
    type = ElementAverageValue
    variable = slip_increment_08
  [../]
  [./pp_slip_increment_09]
    type = ElementAverageValue
    variable = slip_increment_09
  [../]
  [./pp_slip_increment_10]
    type = ElementAverageValue
    variable = slip_increment_10
  [../]
  [./pp_slip_increment_11]
    type = ElementAverageValue
    variable = slip_increment_11
  [../]
  [./pp_slip_increment_12]
    type = ElementAverageValue
    variable = slip_increment_12
  [../]
  [./pp_slip_increment_13]
    type = ElementAverageValue
    variable = slip_increment_13
  [../]
  [./pp_slip_increment_14]
    type = ElementAverageValue
    variable = slip_increment_14
  [../]
  [./pp_slip_increment_15]
    type = ElementAverageValue
    variable = slip_increment_15
  [../]
  [./pp_slip_increment_16]
    type = ElementAverageValue
    variable = slip_increment_16
  [../]
  [./pp_slip_increment_17]
    type = ElementAverageValue
    variable = slip_increment_17
  [../]
  [./pp_slip_increment_18]
    type = ElementAverageValue
    variable = slip_increment_18
  [../]
  [./pp_slip_increment_19]
    type = ElementAverageValue
    variable = slip_increment_19
  [../]
  [./pp_slip_increment_20]
    type = ElementAverageValue
    variable = slip_increment_20
  [../]
  [./pp_slip_increment_21]
    type = ElementAverageValue
    variable = slip_increment_21
  [../]
  [./pp_slip_increment_22]
    type = ElementAverageValue
    variable = slip_increment_22
  [../]
  [./pp_slip_increment_23]
    type = ElementAverageValue
    variable = slip_increment_23
  [../]
  [./pp_slip_increment_24]
    type = ElementAverageValue
    variable = slip_increment_24
  [../]
[]

# [Mesh]
#   [./MeshFile]
#    type = FileMeshGenerator
#    file = 'mesh_4block.e'
#   [../]
#   [./rename]
#     type = RenameBlockGenerator
#     input = MeshFile
#     # old_block = '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255 256 257 258 259 260 261 262 263 264 265 266 267 268 269 270 271 272 273 274 275 276 277 278 279 280 281 282 283 284 285 286 287 288 289 290 291 292 293 294 295 296 297 298 299 300 301 302 303 304 305 306 307 308 309 310 311 312 313 314 315 316 317 318 319 320 321 322 323 324 325 326 327 328 329 330 331 332 333 334 335 336 337 338 339 340 341 342 343'
#     # new_block = '0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255 256 257 258 259 260 261 262 263 264 265 266 267 268 269 270 271 272 273 274 275 276 277 278 279 280 281 282 283 284 285 286 287 288 289 290 291 292 293 294 295 296 297 298 299 300 301 302 303 304 305 306 307 308 309 310 311 312 313 314 315 316 317 318 319 320 321 322 323 324 325 326 327 328 329 330 331 332 333 334 335 336 337 338 339 340 341 342'
#     # old_block = '1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16'
#     # new_block = '0 1 2 3 4 5 6 7 8 9  10 11 12 13 14 15'
#     old_block = '1 2 3 4'
#     new_block = '0 1 2 3'
#   [../]
# []

[Mesh]
  [singlecrystal]
    type = GeneratedMeshGenerator
    dim = 3
    nx = 3
    ny = 3
    nz = 3
    xmax = 0.1
    ymax = 0.1
    zmax = 0.1
    elem_type = HEX8
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
    file_base = method_Discoflux
    csv = true
    # exodus = false
    # console = true
    # interval = 25
    # [out]
    #   type = Checkpoint
    #   time_step_interval = 10
    #   num_files = 2
    #   # wall_time_interval = 3600 # seconds
    # []
    [out]
      type = Exodus
      time_step_interval = 1
    []
[]

[UserObjects]
  [./prop_read]
    type = PropertyReadFile
    prop_file_name = 'bx-cu-lagb3.inp' 
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

  ## POSITIVE SCREW
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
  [./DD_ScrewPositive_13]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_14]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_15]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_16]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_17]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_18]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_19]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_20]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_21]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_22]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_23]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewPositive_24]
    order = FIRST
    family = LAGRANGE
  [../]

  ## NEGATIVE SCREW
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
  [./DD_ScrewNegative_13]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_14]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_15]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_16]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_17]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_18]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_19]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_20]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_21]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_22]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_23]
    order = FIRST
    family = LAGRANGE
  [../]
  [./DD_ScrewNegative_24]
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
    value = 625
  [../]
  [./ic_DD_EdgePositive_2]
    type = ConstantIC
    variable = DD_EdgePositive_2
    value = 625
  [../]
  [./ic_DD_EdgePositive_3]
      type = ConstantIC
      variable = DD_EdgePositive_3
      value = 625
  [../]
  [./ic_DD_EdgePositive_4]
    type = ConstantIC
    variable = DD_EdgePositive_4
    value = 625
  [../]
  [./ic_DD_EdgePositive_5]
    type = ConstantIC
    variable = DD_EdgePositive_5
    value = 625
  [../]
    [./ic_DD_EdgePositive_6]
      type = ConstantIC
      variable = DD_EdgePositive_6
      value = 625
    [../]
  [./ic_DD_EdgePositive_7]
    type = ConstantIC
    variable = DD_EdgePositive_7
    value = 625
  [../]
  [./ic_DD_EdgePositive_8]
    type = ConstantIC
    variable = DD_EdgePositive_8
    value = 625
  [../]
    [./ic_DD_EdgePositive_9]
      type = ConstantIC
      variable = DD_EdgePositive_9
      value = 625
    [../]
  [./ic_DD_EdgePositive_10]
    type = ConstantIC
    variable = DD_EdgePositive_10
    value = 625
  [../]
  [./ic_DD_EdgePositive_11]
    type = ConstantIC
    variable = DD_EdgePositive_11
    value = 625
  [../]
  [./ic_DD_EdgePositive_12]
    #type = FunctionIC
    type = ConstantIC
    variable = DD_EdgePositive_12
    #function = init_rho_edge_pos_12
    value = 625
  [../]
  [./ic_DD_EdgePositive_13]
    type = ConstantIC
    variable = DD_EdgePositive_13
    value = 625
  [../]
  [./ic_DD_EdgePositive_14]
    type = ConstantIC
    variable = DD_EdgePositive_14
    value = 625
  [../]
  [./ic_DD_EdgePositive_15]
      type = ConstantIC
      variable = DD_EdgePositive_15
      value = 625
  [../]
  [./ic_DD_EdgePositive_16]
    type = ConstantIC
    variable = DD_EdgePositive_16
    value = 625
  [../]
  [./ic_DD_EdgePositive_17]
    type = ConstantIC
    variable = DD_EdgePositive_17
    value = 625
  [../]
  [./ic_DD_EdgePositive_18]
    type = ConstantIC
    variable = DD_EdgePositive_18
    value = 625
  [../]
  [./ic_DD_EdgePositive_19]
    type = ConstantIC
    variable = DD_EdgePositive_19
    value = 625
  [../]
  [./ic_DD_EdgePositive_20]
    type = ConstantIC
    variable = DD_EdgePositive_20
    value = 625
  [../]
    [./ic_DD_EdgePositive_21]
      type = ConstantIC
      variable = DD_EdgePositive_21
      value = 625
    [../]
  [./ic_DD_EdgePositive_22]
    type = ConstantIC
    variable = DD_EdgePositive_22
    value = 625
  [../]
  [./ic_DD_EdgePositive_23]
    type = ConstantIC
    variable = DD_EdgePositive_23
    value = 625
  [../]
  [./ic_DD_EdgePositive_24]
    #type = FunctionIC
    type = ConstantIC
    variable = DD_EdgePositive_24
    #function = init_rho_edge_pos_12
    value = 625
  [../]

  ## NEGATIVE EDGE
  [./ic_DD_EdgeNegative_1]
    type = ConstantIC
    variable = DD_EdgeNegative_1
    value = 625
  [../]
  [./ic_DD_EdgeNegative_2]
    type = ConstantIC
    variable = DD_EdgeNegative_2
    value = 625
  [../]
  [./ic_DD_EdgeNegative_3]
    type = ConstantIC
    variable = DD_EdgeNegative_3
    value = 625
  [../]
  [./ic_DD_EdgeNegative_4]
    type = ConstantIC
    variable = DD_EdgeNegative_4
    value = 625
  [../]
  [./ic_DD_EdgeNegative_5]
    type = ConstantIC
    variable = DD_EdgeNegative_5
    value = 625
  [../]
    [./ic_DD_EdgeNegative_6]
      type = ConstantIC
      variable = DD_EdgeNegative_6
      value = 625
    [../]
  [./ic_DD_EdgeNegative_7]
    type = ConstantIC
    variable = DD_EdgeNegative_7
    value = 625
  [../]
  [./ic_DD_EdgeNegative_8]
    type = ConstantIC
    variable = DD_EdgeNegative_8
    value = 625
  [../]
    [./ic_DD_EdgeNegative_9]
      type = ConstantIC
      variable = DD_EdgeNegative_9
      value = 625
    [../]
  [./ic_DD_EdgeNegative_10]
    type = ConstantIC
    variable = DD_EdgeNegative_10
    value = 625
  [../]
  [./ic_DD_EdgeNegative_11]
    type = ConstantIC
    variable = DD_EdgeNegative_11
    value = 625
  [../]
  [./ic_DD_EdgeNegative_12]
    type = ConstantIC
    #type = FunctionIC
    variable = DD_EdgeNegative_12
    value = 625
    #function = init_rho_edge_neg_12
  [../]
  [./ic_DD_EdgeNegative_13]
    type = ConstantIC
    variable = DD_EdgeNegative_13
    value = 625
  [../]
  [./ic_DD_EdgeNegative_14]
    type = ConstantIC
    variable = DD_EdgeNegative_14
    value = 625
  [../]
  [./ic_DD_EdgeNegative_15]
      type = ConstantIC
      variable = DD_EdgeNegative_15
      value = 625
  [../]
  [./ic_DD_EdgeNegative_16]
    type = ConstantIC
    variable = DD_EdgeNegative_16
    value = 625
  [../]
  [./ic_DD_EdgeNegative_17]
    type = ConstantIC
    variable = DD_EdgeNegative_17
    value = 625
  [../]
  [./ic_DD_EdgeNegative_18]
    type = ConstantIC
    variable = DD_EdgeNegative_18
    value = 625
  [../]
  [./ic_DD_EdgeNegative_19]
    type = ConstantIC
    variable = DD_EdgeNegative_19
    value = 625
  [../]
  [./ic_DD_EdgeNegative_20]
    type = ConstantIC
    variable = DD_EdgeNegative_20
    value = 625
  [../]
  [./ic_DD_EdgeNegative_21]
    type = ConstantIC
    variable = DD_EdgeNegative_21
    value = 625
  [../]
  [./ic_DD_EdgeNegative_22]
    type = ConstantIC
    variable = DD_EdgeNegative_22
    value = 625
  [../]
  [./ic_DD_EdgeNegative_23]
    type = ConstantIC
    variable = DD_EdgeNegative_23
    value = 625
  [../]
  [./ic_DD_EdgeNegative_24]
    #type = FunctionIC
    type = ConstantIC
    variable = DD_EdgeNegative_24
    #function = init_rho_edge_pos_12
    value = 625
  [../]

  ## POSITIVE SCREW
  [./ic_DD_ScrewPositive_1]
    type = ConstantIC
    variable = DD_ScrewPositive_1
    value = 625
  [../]
  [./ic_DD_ScrewPositive_2]
    type = ConstantIC
    variable = DD_ScrewPositive_2
    value = 625
  [../]
  [./ic_DD_ScrewPositive_3]
      type = ConstantIC
      variable = DD_ScrewPositive_3
      value = 625
  [../]
  [./ic_DD_ScrewPositive_4]
    type = ConstantIC
    variable = DD_ScrewPositive_4
    value = 625
  [../]
  [./ic_DD_ScrewPositive_5]
    type = ConstantIC
    variable = DD_ScrewPositive_5
    value = 625
  [../]
    [./ic_DD_ScrewPositive_6]
      type = ConstantIC
      variable = DD_ScrewPositive_6
      value = 625
    [../]
  [./ic_DD_ScrewPositive_7]
    type = ConstantIC
    variable = DD_ScrewPositive_7
    value = 625
  [../]
  [./ic_DD_ScrewPositive_8]
    type = ConstantIC
    variable = DD_ScrewPositive_8
    value = 625
  [../]
    [./ic_DD_ScrewPositive_9]
      type = ConstantIC
      variable = DD_ScrewPositive_9
      value = 625
    [../]
  [./ic_DD_ScrewPositive_10]
    type = ConstantIC
    variable = DD_ScrewPositive_10
    value = 625
  [../]
  [./ic_DD_ScrewPositive_11]
    type = ConstantIC
    variable = DD_ScrewPositive_11
    value = 625
  [../]
  [./ic_DD_ScrewPositive_12]
    #type = FunctionIC
    type = ConstantIC
    variable = DD_ScrewPositive_12
    #function = init_rho_screw_pos_12
    value = 625
  [../]
  [./ic_DD_ScrewPositive_13]
    type = ConstantIC
    variable = DD_ScrewPositive_13
    value = 625
  [../]
  [./ic_DD_ScrewPositive_14]
    type = ConstantIC
    variable = DD_ScrewPositive_14
    value = 625
  [../]
  [./ic_DD_ScrewPositive_15]
      type = ConstantIC
      variable = DD_ScrewPositive_15
      value = 625
  [../]
  [./ic_DD_ScrewPositive_16]
    type = ConstantIC
    variable = DD_ScrewPositive_16
    value = 625
  [../]
  [./ic_DD_ScrewPositive_17]
    type = ConstantIC
    variable = DD_ScrewPositive_17
    value = 625
  [../]
  [./ic_DD_ScrewPositive_18]
    type = ConstantIC
    variable = DD_ScrewPositive_18
    value = 625
  [../]
  [./ic_DD_ScrewPositive_19]
    type = ConstantIC
    variable = DD_ScrewPositive_19
    value = 625
  [../]
  [./ic_DD_ScrewPositive_20]
    type = ConstantIC
    variable = DD_ScrewPositive_20
    value = 625
  [../]
    [./ic_DD_ScrewPositive_21]
      type = ConstantIC
      variable = DD_ScrewPositive_21
      value = 625
    [../]
  [./ic_DD_ScrewPositive_22]
    type = ConstantIC
    variable = DD_ScrewPositive_22
    value = 625
  [../]
  [./ic_DD_ScrewPositive_23]
    type = ConstantIC
    variable = DD_ScrewPositive_23
    value = 625
  [../]
  [./ic_DD_ScrewPositive_24]
    #type = FunctionIC
    type = ConstantIC
    variable = DD_ScrewPositive_24
    #function = init_rho_screw_pos_12
    value = 625
  [../]

  ## NEGATIVE SCREW
  [./ic_DD_ScrewNegative_1]
    type = ConstantIC
    variable = DD_ScrewNegative_1
    value = 625
  [../]
  [./ic_DD_ScrewNegative_2]
    type = ConstantIC
    variable = DD_ScrewNegative_2
    value = 625
  [../]
  [./ic_DD_ScrewNegative_3]
    type = ConstantIC
    variable = DD_ScrewNegative_3
    value = 625
  [../]
  [./ic_DD_ScrewNegative_4]
    type = ConstantIC
    variable = DD_ScrewNegative_4
    value = 625
  [../]
  [./ic_DD_ScrewNegative_5]
    type = ConstantIC
    variable = DD_ScrewNegative_5
    value = 625
  [../]
    [./ic_DD_ScrewNegative_6]
      type = ConstantIC
      variable = DD_ScrewNegative_6
      value = 625
    [../]
  [./ic_DD_ScrewNegative_7]
    type = ConstantIC
    variable = DD_ScrewNegative_7
    value = 625
  [../]
  [./ic_DD_ScrewNegative_8]
    type = ConstantIC
    variable = DD_ScrewNegative_8
    value = 625
  [../]
    [./ic_DD_ScrewNegative_9]
      type = ConstantIC
      variable = DD_ScrewNegative_9
      value = 625
    [../]
  [./ic_DD_ScrewNegative_10]
    type = ConstantIC
    variable = DD_ScrewNegative_10
    value = 625
  [../]
  [./ic_DD_ScrewNegative_11]
    type = ConstantIC
    variable = DD_ScrewNegative_11
    value = 625
  [../]
  [./ic_DD_ScrewNegative_12]
    type = ConstantIC
    #type = FunctionIC
    variable = DD_ScrewNegative_12
    value = 625
    #function = init_rho_screw_neg_12
  [../]
  [./ic_DD_ScrewNegative_13]
    type = ConstantIC
    variable = DD_ScrewNegative_13
    value = 625
  [../]
  [./ic_DD_ScrewNegative_14]
    type = ConstantIC
    variable = DD_ScrewNegative_14
    value = 625
  [../]
  [./ic_DD_ScrewNegative_15]
      type = ConstantIC
      variable = DD_ScrewNegative_15
      value = 625
  [../]
  [./ic_DD_ScrewNegative_16]
    type = ConstantIC
    variable = DD_ScrewNegative_16
    value = 625
  [../]
  [./ic_DD_ScrewNegative_17]
    type = ConstantIC
    variable = DD_ScrewNegative_17
    value = 625
  [../]
  [./ic_DD_ScrewNegative_18]
    type = ConstantIC
    variable = DD_ScrewNegative_18
    value = 625
  [../]
  [./ic_DD_ScrewNegative_19]
    type = ConstantIC
    variable = DD_ScrewNegative_19
    value = 625
  [../]
  [./ic_DD_ScrewNegative_20]
    type = ConstantIC
    variable = DD_ScrewNegative_20
    value = 625
  [../]
  [./ic_DD_ScrewNegative_21]
    type = ConstantIC
    variable = DD_ScrewNegative_21
    value = 625
  [../]
  [./ic_DD_ScrewNegative_22]
    type = ConstantIC
    variable = DD_ScrewNegative_22
    value = 625
  [../]
  [./ic_DD_ScrewNegative_23]
    type = ConstantIC
    variable = DD_ScrewNegative_23
    value = 625
  [../]
  [./ic_DD_ScrewNegative_24]
    #type = FunctionIC
    type = ConstantIC
    variable = DD_ScrewNegative_24
    #function = init_rho_screw_pos_12
    value = 625
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

  # Positive screw
  [./dot_DD_ScrewPositive_1]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_1
    # block = 1
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
    # block = 1
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
    [./Source_DD_ScrewPositive_3]
      type = DislocationSourceVolume  
      variable = DD_ScrewPositive_3
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 3
      # block = 1
    [../]
  [./dot_DD_ScrewPositive_4]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_4
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
    [./Source_DD_ScrewPositive_12]
      type = DislocationSourceVolume  
      variable = DD_ScrewPositive_12
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 12
      #block = 1
    [../]
  
  [./dot_DD_ScrewPositive_13]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_13
    # block = 1
  [../]
    [./Source_DD_ScrewPositive_13]
      type = DislocationSourceVolume  
      variable = DD_ScrewPositive_13
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 13
      #block = 1
    [../]
  [./dot_DD_ScrewPositive_14]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_14
    # block = 1
  [../]
    [./Source_DD_ScrewPositive_14]
      type = DislocationSourceVolume  
      variable = DD_ScrewPositive_14
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 14
      #block = 1
    [../]
  [./dot_DD_ScrewPositive_15]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_15
    #block = 1
  [../]
    [./Source_DD_ScrewPositive_15]
      type = DislocationSourceVolume  
      variable = DD_ScrewPositive_15
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 15
      # block = 1
    [../]
  [./dot_DD_ScrewPositive_16]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_16
    #block = 1
  [../]
    [./Source_DD_ScrewPositive_16]
      type = DislocationSourceVolume  
      variable = DD_ScrewPositive_16
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 16
      #block = 1
    [../]
  [./dot_DD_ScrewPositive_17]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_17
    #block = 1
  [../]
    [./Source_DD_ScrewPositive_17]
      type = DislocationSourceVolume  
      variable = DD_ScrewPositive_17
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 17
      #block = 1
    [../]
  [./dot_DD_ScrewPositive_18]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_18
    #block = 1
  [../]
    [./Source_DD_ScrewPositive_18]
      type = DislocationSourceVolume  
      variable = DD_ScrewPositive_18
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 18
      #block = 1
    [../]
  [./dot_DD_ScrewPositive_19]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_19
    #block = 1
  [../]
    [./Source_DD_ScrewPositive_19]
      type = DislocationSourceVolume  
      variable = DD_ScrewPositive_19
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 19
      #block = 1
    [../]
  [./dot_DD_ScrewPositive_20]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_20
    #block = 1
  [../]
    [./Source_DD_ScrewPositive_20]
      type = DislocationSourceVolume  
      variable = DD_ScrewPositive_20
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 20
      #block = 1
    [../]
  [./dot_DD_ScrewPositive_21]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_21
    #block = 1
  [../]
    [./Source_DD_ScrewPositive_21]
      type = DislocationSourceVolume  
      variable = DD_ScrewPositive_21
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 21
      #block = 1
    [../]
  [./dot_DD_ScrewPositive_22]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_22
    #block = 1
  [../]
    [./Source_DD_ScrewPositive_22]
      type = DislocationSourceVolume  
      variable = DD_ScrewPositive_22
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 22
      #block = 1
    [../]
  [./dot_DD_ScrewPositive_23]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_23
    #block = 1
  [../]
    [./Source_DD_ScrewPositive_23]
      type = DislocationSourceVolume  
      variable = DD_ScrewPositive_23
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 23
      #block = 1
    [../]
  [./dot_DD_ScrewPositive_24]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewPositive_24
    #block = 1
  [../]
    [./Source_DD_ScrewPositive_24]
      type = DislocationSourceVolume  
      variable = DD_ScrewPositive_24
      dislocation_character = screw
      dislocation_sign = positive
      slip_system_index = 24
      #block = 1
    [../]

  # ==========
  [./dot_DD_ScrewNegative_1]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_1
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
    [./Source_DD_ScrewNegative_12]
      type = DislocationSourceVolume  
      variable = DD_ScrewNegative_12
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 12
      #block = 1
    [../]

  [./dot_DD_ScrewNegative_13]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_13
    # block = 1
  [../]
    [./Source_DD_ScrewNegative_13]
      type = DislocationSourceVolume  
      variable = DD_ScrewNegative_13
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 13
      #block = 1
    [../]
  [./dot_DD_ScrewNegative_14]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_14
    # block = 1
  [../]
    [./Source_DD_ScrewNegative_14]
      type = DislocationSourceVolume  
      variable = DD_ScrewNegative_14
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 14
      #block = 1
    [../]
  [./dot_DD_ScrewNegative_15]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_15
    #block = 1
  [../]
    [./Source_DD_ScrewNegative_15]
      type = DislocationSourceVolume  
      variable = DD_ScrewNegative_15
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 15
      # block = 1
    [../]
  [./dot_DD_ScrewNegative_16]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_16
    #block = 1
  [../]
    [./Source_DD_ScrewNegative_16]
      type = DislocationSourceVolume  
      variable = DD_ScrewNegative_16
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 16
      #block = 1
    [../]
  [./dot_DD_ScrewNegative_17]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_17
    #block = 1
  [../]
    [./Source_DD_ScrewNegative_17]
      type = DislocationSourceVolume  
      variable = DD_ScrewNegative_17
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 17
      #block = 1
    [../]
  [./dot_DD_ScrewNegative_18]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_18
    #block = 1
  [../]
    [./Source_DD_ScrewNegative_18]
      type = DislocationSourceVolume  
      variable = DD_ScrewNegative_18
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 18
      #block = 1
    [../]
  [./dot_DD_ScrewNegative_19]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_19
    #block = 1
  [../]
    [./Source_DD_ScrewNegative_19]
      type = DislocationSourceVolume  
      variable = DD_ScrewNegative_19
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 19
      #block = 1
    [../]
  [./dot_DD_ScrewNegative_20]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_20
    #block = 1
  [../]
    [./Source_DD_ScrewNegative_20]
      type = DislocationSourceVolume  
      variable = DD_ScrewNegative_20
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 20
      #block = 1
    [../]
  [./dot_DD_ScrewNegative_21]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_21
    #block = 1
  [../]
    [./Source_DD_ScrewNegative_21]
      type = DislocationSourceVolume  
      variable = DD_ScrewNegative_21
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 21
      #block = 1
    [../]
  [./dot_DD_ScrewNegative_22]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_22
    #block = 1
  [../]
    [./Source_DD_ScrewNegative_22]
      type = DislocationSourceVolume  
      variable = DD_ScrewNegative_22
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 22
      #block = 1
    [../]
  [./dot_DD_ScrewNegative_23]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_23
    #block = 1
  [../]
    [./Source_DD_ScrewNegative_23]
      type = DislocationSourceVolume  
      variable = DD_ScrewNegative_23
      dislocation_character = screw
      dislocation_sign = negative
      slip_system_index = 23
      #block = 1
    [../]
  [./dot_DD_ScrewNegative_24]
    # type = TimeDerivative  
    type = MassLumpedTimeDerivative
    variable = DD_ScrewNegative_24
    #block = 1
  [../]
    [./Source_DD_ScrewNegative_24]
      type = DislocationSourceVolume  
      variable = DD_ScrewNegative_24
      dislocation_character = screw
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
    C_ijkl = '2.8251e5 1.6124e5 1.6124e5 2.8251e5 1.6124e5 2.8251e5 0.8315e5 0.8315e5 0.8315e5'
    fill_method = symmetric9
    read_prop_user_object = prop_read
    C_ijkl_t = '-1.93e1 -3.12e0 -3.12e0 -1.93e1 -3.12e0 -1.93e1 -1.47e1 -1.47e1 -1.47e1'
    temp0 = 300
    temp = 400
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
    slip_sys_file_name        = ./input_slip_sys.inp
    lattice_friction          = 480.0
    lattice_friction_112      = 575.0
    lattice_friction_112_atw  = 1075.0
    lattice_friction_screw    = 600.0
    Coeff_hardening           = 0.52
    Coeff_backstress          = 0.0
    initial_athermal          = 102.0
    initial_athermal_screw    = 102.0
    dd_sat                    = 1.e6
    sat_A                     = 5.52e-18
    min_dd                    = 1.0
    nrec                      = 4.0
    gamdot_ref                = 1e-3 #0.01971736462951501e6
    q1                        = 0.3137048561088953
    q2                        = 1.8103019457710243
    B0                        = 1.25e-12
    B0s                       = 1.25e-12
    vs_edge                   = 2.e6
    vs_screw                  = 2.e6
    temp                      = 400
    omega0                    = 1e11
    g0                        = 0.2
    mu                        = 78.49e+3
    nu                        = 0.334



    slip_increment_tolerance = 0.01
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

    DD_ScrewPositive_1   = DD_ScrewPositive_1
    DD_ScrewPositive_2   = DD_ScrewPositive_2
    DD_ScrewPositive_3   = DD_ScrewPositive_3
    DD_ScrewPositive_4   = DD_ScrewPositive_4
    DD_ScrewPositive_5   = DD_ScrewPositive_5
    DD_ScrewPositive_6   = DD_ScrewPositive_6
    DD_ScrewPositive_7   = DD_ScrewPositive_7
    DD_ScrewPositive_8   = DD_ScrewPositive_8
    DD_ScrewPositive_9   = DD_ScrewPositive_9
    DD_ScrewPositive_10  = DD_ScrewPositive_10
    DD_ScrewPositive_11  = DD_ScrewPositive_11
    DD_ScrewPositive_12  = DD_ScrewPositive_12
    DD_ScrewPositive_13  = DD_ScrewPositive_13
    DD_ScrewPositive_14  = DD_ScrewPositive_14
    DD_ScrewPositive_15  = DD_ScrewPositive_15
    DD_ScrewPositive_16  = DD_ScrewPositive_16
    DD_ScrewPositive_17  = DD_ScrewPositive_17
    DD_ScrewPositive_18  = DD_ScrewPositive_18
    DD_ScrewPositive_19  = DD_ScrewPositive_19
    DD_ScrewPositive_20  = DD_ScrewPositive_20
    DD_ScrewPositive_21  = DD_ScrewPositive_21
    DD_ScrewPositive_22  = DD_ScrewPositive_22
    DD_ScrewPositive_23  = DD_ScrewPositive_23
    DD_ScrewPositive_24  = DD_ScrewPositive_24

    DD_ScrewNegative_1   = DD_ScrewNegative_1
    DD_ScrewNegative_2   = DD_ScrewNegative_2
    DD_ScrewNegative_3   = DD_ScrewNegative_3
    DD_ScrewNegative_4   = DD_ScrewNegative_4
    DD_ScrewNegative_5   = DD_ScrewNegative_5
    DD_ScrewNegative_6   = DD_ScrewNegative_6
    DD_ScrewNegative_7   = DD_ScrewNegative_7
    DD_ScrewNegative_8   = DD_ScrewNegative_8
    DD_ScrewNegative_9   = DD_ScrewNegative_9
    DD_ScrewNegative_10  = DD_ScrewNegative_10
    DD_ScrewNegative_11  = DD_ScrewNegative_11
    DD_ScrewNegative_12  = DD_ScrewNegative_12
    DD_ScrewNegative_13  = DD_ScrewNegative_13
    DD_ScrewNegative_14  = DD_ScrewNegative_14
    DD_ScrewNegative_15  = DD_ScrewNegative_15
    DD_ScrewNegative_16  = DD_ScrewNegative_16
    DD_ScrewNegative_17  = DD_ScrewNegative_17
    DD_ScrewNegative_18  = DD_ScrewNegative_18
    DD_ScrewNegative_19  = DD_ScrewNegative_19
    DD_ScrewNegative_20  = DD_ScrewNegative_20
    DD_ScrewNegative_21  = DD_ScrewNegative_21
    DD_ScrewNegative_22  = DD_ScrewNegative_22
    DD_ScrewNegative_23  = DD_ScrewNegative_23
    DD_ScrewNegative_24  = DD_ScrewNegative_24

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
  number_slip_systems     = 24
  dislo_density_initial   = 247500
  zeta                    = 0.1
  C_multi                 = 0.4
  C_trap                  = 0.1 
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
  [./back_stress_14]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./back_stress_17]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./back_stress_20]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./back_stress_23]
    order = CONSTANT
    family = MONOMIAL
  [../]

  [./sat_edgepos_14]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./sat_edgepos_17]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./sat_edgepos_20]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./sat_edgepos_23]
    order = CONSTANT
    family = MONOMIAL
  [../]

  [./sat_edgeneg_14]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./sat_edgeneg_17]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./sat_edgeneg_20]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./sat_edgeneg_23]
    order = CONSTANT
    family = MONOMIAL
  [../]

  [./sat_screwpos_14]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./sat_screwpos_17]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./sat_screwpos_20]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./sat_screwpos_23]
    order = CONSTANT
    family = MONOMIAL
  [../]

  [./sat_screwneg_14]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./sat_screwneg_17]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./sat_screwneg_20]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./sat_screwneg_23]
    order = CONSTANT
    family = MONOMIAL
  [../]

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
  [./back_stress_14]
    type = MaterialStdVectorAux
    variable = back_stress_14
    property = back_stress
    index = 13
  [../]
  [./back_stress_17]
    type = MaterialStdVectorAux
    variable = back_stress_17
    property = back_stress
    index = 16
  [../]
  [./back_stress_20]
    type = MaterialStdVectorAux
    variable = back_stress_20
    property = back_stress
    index = 19
  [../]
  [./back_stress_23]
    type = MaterialStdVectorAux
    variable = back_stress_23
    property = back_stress
    index = 22
  [../]

  [./sat_edgepos_14]
    type = MaterialStdVectorAux
    variable = sat_edgepos_14
    property = saturation_immobile_density_edgepos
    index = 13
  [../]
  [./sat_edgepos_17]
    type = MaterialStdVectorAux
    variable = sat_edgepos_17
    property = saturation_immobile_density_edgepos
    index = 16
  [../]
  [./sat_edgepos_20]
    type = MaterialStdVectorAux
    variable = sat_edgepos_20
    property = saturation_immobile_density_edgepos
    index = 19
  [../]
  [./sat_edgepos_23]
    type = MaterialStdVectorAux
    variable = sat_edgepos_23
    property = saturation_immobile_density_edgepos
    index = 22
  [../]

  [./sat_edgeneg_14]
    type = MaterialStdVectorAux
    variable = sat_edgeneg_14
    property = saturation_immobile_density_edgeneg
    index = 13
  [../]
  [./sat_edgeneg_17]
    type = MaterialStdVectorAux
    variable = sat_edgeneg_17
    property = saturation_immobile_density_edgeneg
    index = 16
  [../]
  [./sat_edgeneg_20]
    type = MaterialStdVectorAux
    variable = sat_edgeneg_20
    property = saturation_immobile_density_edgeneg
    index = 19
  [../]
  [./sat_edgeneg_23]
    type = MaterialStdVectorAux
    variable = sat_edgeneg_23
    property = saturation_immobile_density_edgeneg
    index = 22
  [../]

  [./sat_screwpos_14]
    type = MaterialStdVectorAux
    variable = sat_screwpos_14
    property = saturation_immobile_density_screwpos
    index = 13
  [../]
  [./sat_screwpos_17]
    type = MaterialStdVectorAux
    variable = sat_screwpos_17
    property = saturation_immobile_density_screwpos
    index = 16
  [../]
  [./sat_screwpos_20]
    type = MaterialStdVectorAux
    variable = sat_screwpos_20
    property = saturation_immobile_density_screwpos
    index = 19
  [../]
  [./sat_screwpos_23]
    type = MaterialStdVectorAux
    variable = sat_screwpos_23
    property = saturation_immobile_density_screwpos
    index = 22
  [../]

  [./sat_screwneg_14]
    type = MaterialStdVectorAux
    variable = sat_screwneg_14
    property = saturation_immobile_density_screwneg
    index = 13
  [../]
  [./sat_screwneg_17]
    type = MaterialStdVectorAux
    variable = sat_screwneg_17
    property = saturation_immobile_density_screwneg
    index = 16
  [../]
  [./sat_screwneg_20]
    type = MaterialStdVectorAux
    variable = sat_screwneg_20
    property = saturation_immobile_density_screwneg
    index = 19
  [../]
  [./sat_screwneg_23]
    type = MaterialStdVectorAux
    variable = sat_screwneg_23
    property = saturation_immobile_density_screwneg
    index = 22
  [../]

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

#==== DDE_VEL output variables =====
[AuxVariables]
  [./dds_vel_01]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dds_vel_02]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dds_vel_03]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dds_vel_04]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dds_vel_05]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dds_vel_06]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dds_vel_07]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dds_vel_08]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dds_vel_09]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dds_vel_10]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dds_vel_11]
   order = CONSTANT
   family = MONOMIAL
  [../]
  [./dds_vel_12]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dds_vel_13]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dds_vel_14]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dds_vel_15]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dds_vel_16]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dds_vel_17]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dds_vel_18]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dds_vel_19]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dds_vel_20]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dds_vel_21]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dds_vel_22]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dds_vel_23]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./dds_vel_24]
    order = CONSTANT
    family = MONOMIAL
  [../]
[]

#==== dds_vel output variables =====
[AuxKernels]
  [./dds_vel_01]
    type = MaterialStdVectorAux
    variable = dds_vel_01
    property = dislo_velocity_screw  
    index = 0
  [../]
  [./dds_vel_02]
    type = MaterialStdVectorAux
    variable = dds_vel_02
    property = dislo_velocity_screw  
    index = 1
  [../]
  [./dds_vel_03]
    type = MaterialStdVectorAux
    variable = dds_vel_03
    property = dislo_velocity_screw  
    index = 2
  [../]
  [./dds_vel_04]
    type = MaterialStdVectorAux
    variable = dds_vel_04
    property = dislo_velocity_screw  
    index = 3
  [../]
  [./dds_vel_05]
    type = MaterialStdVectorAux
    variable = dds_vel_05
    property = dislo_velocity_screw  
    index = 4
  [../]
  [./dds_vel_06]
    type = MaterialStdVectorAux
    variable = dds_vel_06
    property = dislo_velocity_screw  
    index = 5
  [../]
  [./dds_vel_07]
    type = MaterialStdVectorAux
    variable = dds_vel_07
    property = dislo_velocity_screw  
    index = 6
  [../]
  [./dds_vel_08]
    type = MaterialStdVectorAux
    variable = dds_vel_08
    property = dislo_velocity_screw  
    index = 7
  [../]
  [./dds_vel_09]
    type = MaterialStdVectorAux
    variable = dds_vel_09
    property = dislo_velocity_screw  
    index = 8
  [../]
  [./dds_vel_10]
    type = MaterialStdVectorAux
    variable = dds_vel_10
    property = dislo_velocity_screw  
    index = 9
  [../]
  [./dds_vel_11]
    type = MaterialStdVectorAux
    variable = dds_vel_11
    property = dislo_velocity_screw  
    index = 10
  [../]
  [./dds_vel_12]
    type = MaterialStdVectorAux
    variable = dds_vel_12
    property = dislo_velocity_screw  
    index = 11
  [../]
  [./dds_vel_13]
    type = MaterialStdVectorAux
    variable = dds_vel_13
    property = dislo_velocity_screw  
    index = 12
  [../]
  [./dds_vel_14]
    type = MaterialStdVectorAux
    variable = dds_vel_14
    property = dislo_velocity_screw  
    index = 13
  [../]
  [./dds_vel_15]
    type = MaterialStdVectorAux
    variable = dds_vel_15
    property = dislo_velocity_screw  
    index = 14
  [../]
  [./dds_vel_16]
    type = MaterialStdVectorAux
    variable = dds_vel_16
    property = dislo_velocity_screw  
    index = 15
  [../]
  [./dds_vel_17]
    type = MaterialStdVectorAux
    variable = dds_vel_17
    property = dislo_velocity_screw  
    index = 16
  [../]
  [./dds_vel_18]
    type = MaterialStdVectorAux
    variable = dds_vel_18
    property = dislo_velocity_screw  
    index = 17
  [../]
  [./dds_vel_19]
    type = MaterialStdVectorAux
    variable = dds_vel_19
    property = dislo_velocity_screw  
    index = 18
  [../]
  [./dds_vel_20]
    type = MaterialStdVectorAux
    variable = dds_vel_20
    property = dislo_velocity_screw  
    index = 19
  [../]
  [./dds_vel_21]
    type = MaterialStdVectorAux
    variable = dds_vel_21
    property = dislo_velocity_screw  
    index = 20
  [../]
  [./dds_vel_22]
    type = MaterialStdVectorAux
    variable = dds_vel_22
    property = dislo_velocity_screw  
    index = 21
  [../]
  [./dds_vel_23]
    type = MaterialStdVectorAux
    variable = dds_vel_23
    property = dislo_velocity_screw  
    index = 22
  [../]
  [./dds_vel_24]
    type = MaterialStdVectorAux
    variable = dds_vel_24
    property = dislo_velocity_screw  
    index = 23
  [../]
[]
