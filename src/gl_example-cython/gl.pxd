cdef extern from 'GL/gl.h':
    # Constants {{{        

    # Boolean values {{{
    cdef int FALSE "GL_FALSE"
    cdef int TRUE "GL_TRUE"
    # Boolean Values }}}
    
    # Data types  {{{
    cdef int BYTE "GL_BYTE"
    cdef int UNSIGNED_BYTE "GL_UNSIGNED_BYTE"
    cdef int SHORT "GL_SHORT"
    cdef int UNSIGNED_SHORT "GL_UNSIGNED_SHORT"
    cdef int INT "GL_INT"
    cdef int UNSIGNED_INT "GL_UNSIGNED_INT"
    cdef int FLOAT "GL_FLOAT"
    cdef int 2_BYTES "GL_2_BYTES"
    cdef int 3_BYTES "GL_3_BYTES"
    cdef int 4_BYTES "GL_4_BYTES"
    cdef int DOUBLE "GL_DOUBLE"
    # Data types  }}}
    
    # Primitives  {{{
    cdef int POINTS "GL_POINTS"
    cdef int LINES "GL_LINES"
    cdef int LINE_LOOP "GL_LINE_LOOP"
    cdef int LINE_STRIP "GL_LINE_STRIP"
    cdef int TRIANGLES "GL_TRIANGLES"
    cdef int TRIANGLE_STRIP "GL_TRIANGLE_STRIP"
    cdef int TRIANGLE_FAN "GL_TRIANGLE_FAN"
    cdef int QUADS "GL_QUADS"
    cdef int QUAD_STRIP "GL_QUAD_STRIP"
    cdef int POLYGON "GL_POLYGON"
    # Primitives  }}}
    
    # Vertex Arrays  {{{
    cdef int VERTEX_ARRAY "GL_VERTEX_ARRAY"
    cdef int NORMAL_ARRAY "GL_NORMAL_ARRAY"
    cdef int COLOR_ARRAY "GL_COLOR_ARRAY"
    cdef int INDEX_ARRAY "GL_INDEX_ARRAY"
    cdef int TEXTURE_COORD_ARRAY "GL_TEXTURE_COORD_ARRAY"
    cdef int EDGE_FLAG_ARRAY "GL_EDGE_FLAG_ARRAY"
    cdef int VERTEX_ARRAY_SIZE "GL_VERTEX_ARRAY_SIZE"
    cdef int VERTEX_ARRAY_TYPE "GL_VERTEX_ARRAY_TYPE"
    cdef int VERTEX_ARRAY_STRIDE "GL_VERTEX_ARRAY_STRIDE"
    cdef int NORMAL_ARRAY_TYPE "GL_NORMAL_ARRAY_TYPE"
    cdef int NORMAL_ARRAY_STRIDE "GL_NORMAL_ARRAY_STRIDE"
    cdef int COLOR_ARRAY_SIZE "GL_COLOR_ARRAY_SIZE"
    cdef int COLOR_ARRAY_TYPE "GL_COLOR_ARRAY_TYPE"
    cdef int COLOR_ARRAY_STRIDE "GL_COLOR_ARRAY_STRIDE"
    cdef int INDEX_ARRAY_TYPE "GL_INDEX_ARRAY_TYPE"
    cdef int INDEX_ARRAY_STRIDE "GL_INDEX_ARRAY_STRIDE"
    cdef int TEXTURE_COORD_ARRAY_SIZE "GL_TEXTURE_COORD_ARRAY_SIZE"
    cdef int TEXTURE_COORD_ARRAY_TYPE "GL_TEXTURE_COORD_ARRAY_TYPE"
    cdef int TEXTURE_COORD_ARRAY_STRIDE "GL_TEXTURE_COORD_ARRAY_STRIDE"
    cdef int EDGE_FLAG_ARRAY_STRIDE "GL_EDGE_FLAG_ARRAY_STRIDE"
    cdef int VERTEX_ARRAY_POINTER "GL_VERTEX_ARRAY_POINTER"
    cdef int NORMAL_ARRAY_POINTER "GL_NORMAL_ARRAY_POINTER"
    cdef int COLOR_ARRAY_POINTER "GL_COLOR_ARRAY_POINTER"
    cdef int INDEX_ARRAY_POINTER "GL_INDEX_ARRAY_POINTER"
    cdef int TEXTURE_COORD_ARRAY_POINTER "GL_TEXTURE_COORD_ARRAY_POINTER"
    cdef int EDGE_FLAG_ARRAY_POINTER "GL_EDGE_FLAG_ARRAY_POINTER"
    cdef int V2F "GL_V2F"
    cdef int V3F "GL_V3F"
    cdef int C4UB_V2F "GL_C4UB_V2F"
    cdef int C4UB_V3F "GL_C4UB_V3F"
    cdef int C3F_V3F "GL_C3F_V3F"
    cdef int N3F_V3F "GL_N3F_V3F"
    cdef int C4F_N3F_V3F "GL_C4F_N3F_V3F"
    cdef int T2F_V3F "GL_T2F_V3F"
    cdef int T4F_V4F "GL_T4F_V4F"
    cdef int T2F_C4UB_V3F "GL_T2F_C4UB_V3F"
    cdef int T2F_C3F_V3F "GL_T2F_C3F_V3F"
    cdef int T2F_N3F_V3F "GL_T2F_N3F_V3F"
    cdef int T2F_C4F_N3F_V3F "GL_T2F_C4F_N3F_V3F"
    cdef int T4F_C4F_N3F_V4F "GL_T4F_C4F_N3F_V4F"
    # Vertex Arrays  }}}
    
    # Matrix Mode {{{
    cdef int MATRIX_MODE "GL_MATRIX_MODE"
    cdef int MODELVIEW "GL_MODELVIEW"
    cdef int PROJECTION "GL_PROJECTION"
    cdef int TEXTURE "GL_TEXTURE"
    # Matrix Mode  }}}
    
    # Points {{{
    cdef int POINT_SMOOTH "GL_POINT_SMOOTH"
    cdef int POINT_SIZE "GL_POINT_SIZE"
    cdef int POINT_SIZE_GRANULARITY  "GL_POINT_SIZE_GRANULARITY "
    cdef int POINT_SIZE_RANGE "GL_POINT_SIZE_RANGE"
    # Points  }}}
    
    # Lines {{{
    cdef int LINE_SMOOTH "GL_LINE_SMOOTH"
    cdef int LINE_STIPPLE "GL_LINE_STIPPLE"
    cdef int LINE_STIPPLE_PATTERN "GL_LINE_STIPPLE_PATTERN"
    cdef int LINE_STIPPLE_REPEAT "GL_LINE_STIPPLE_REPEAT"
    cdef int LINE_WIDTH "GL_LINE_WIDTH"
    cdef int LINE_WIDTH_GRANULARITY "GL_LINE_WIDTH_GRANULARITY"
    cdef int LINE_WIDTH_RANGE "GL_LINE_WIDTH_RANGE"
    # Lines }}}
    
    # Polygons {{{
    cdef int POINT "GL_POINT"
    cdef int LINE "GL_LINE"
    cdef int FILL "GL_FILL"
    cdef int CW "GL_CW"
    cdef int CCW "GL_CCW"
    cdef int FRONT "GL_FRONT"
    cdef int BACK "GL_BACK"
    cdef int POLYGON_MODE "GL_POLYGON_MODE"
    cdef int POLYGON_SMOOTH "GL_POLYGON_SMOOTH"
    cdef int POLYGON_STIPPLE "GL_POLYGON_STIPPLE"
    cdef int EDGE_FLAG "GL_EDGE_FLAG"
    cdef int CULL_FACE "GL_CULL_FACE"
    cdef int CULL_FACE_MODE "GL_CULL_FACE_MODE"
    cdef int FRONT_FACE "GL_FRONT_FACE"
    cdef int POLYGON_OFFSET_FACTOR "GL_POLYGON_OFFSET_FACTOR"
    cdef int POLYGON_OFFSET_UNITS "GL_POLYGON_OFFSET_UNITS"
    cdef int POLYGON_OFFSET_POINT "GL_POLYGON_OFFSET_POINT"
    cdef int POLYGON_OFFSET_LINE "GL_POLYGON_OFFSET_LINE"
    cdef int POLYGON_OFFSET_FILL "GL_POLYGON_OFFSET_FILL"
    # Polygons }}}
    
    # Display {{{
    cdef int COMPILE "GL_COMPILE"
    cdef int COMPILE_AND_EXECUTE "GL_COMPILE_AND_EXECUTE"
    cdef int LIST_BASE "GL_LIST_BASE"
    cdef int LIST_INDEX "GL_LIST_INDEX"
    cdef int LIST_MODE "GL_LIST_MODE"
    # Display }}}
    
    # Depth {{{
    cdef int NEVER "GL_NEVER"
    cdef int LESS "GL_LESS"
    cdef int EQUAL "GL_EQUAL"
    cdef int LEQUAL "GL_LEQUAL"
    cdef int GREATER "GL_GREATER"
    cdef int NOTEQUAL "GL_NOTEQUAL"
    cdef int GEQUAL "GL_GEQUAL"
    cdef int ALWAYS "GL_ALWAYS"
    cdef int DEPTH_TEST "GL_DEPTH_TEST"
    cdef int DEPTH_BITS "GL_DEPTH_BITS"
    cdef int DEPTH_CLEAR_VALUE "GL_DEPTH_CLEAR_VALUE"
    cdef int DEPTH_FUNC "GL_DEPTH_FUNC"
    cdef int DEPTH_RANGE "GL_DEPTH_RANGE"
    cdef int DEPTH_WRITEMASK "GL_DEPTH_WRITEMASK"
    cdef int DEPTH_COMPONENT "GL_DEPTH_COMPONENT"
    # Depth }}}
    
    # Lighting {{{
    cdef int LIGHTING "GL_LIGHTING"
    cdef int LIGHT0 "GL_LIGHT0"
    cdef int LIGHT1 "GL_LIGHT1"
    cdef int LIGHT2 "GL_LIGHT2"
    cdef int LIGHT3 "GL_LIGHT3"
    cdef int LIGHT4 "GL_LIGHT4"
    cdef int LIGHT5 "GL_LIGHT5"
    cdef int LIGHT6 "GL_LIGHT6"
    cdef int LIGHT7 "GL_LIGHT7"
    cdef int SPOT_EXPONENT "GL_SPOT_EXPONENT"
    cdef int SPOT_CUTOFF "GL_SPOT_CUTOFF"
    cdef int CONSTANT_ATTENUATION "GL_CONSTANT_ATTENUATION"
    cdef int LINEAR_ATTENUATION "GL_LINEAR_ATTENUATION"
    cdef int QUADRATIC_ATTENUATION "GL_QUADRATIC_ATTENUATION"
    cdef int AMBIENT "GL_AMBIENT"
    cdef int DIFFUSE "GL_DIFFUSE"
    cdef int SPECULAR "GL_SPECULAR"
    cdef int SHININESS "GL_SHININESS"
    cdef int EMISSION "GL_EMISSION"
    cdef int POSITION "GL_POSITION"
    cdef int SPOT_DIRECTION "GL_SPOT_DIRECTION"
    cdef int AMBIENT_AND_DIFFUSE "GL_AMBIENT_AND_DIFFUSE"
    cdef int COLOR_INDEXES "GL_COLOR_INDEXES"
    cdef int LIGHT_MODEL_TWO_SIDE "GL_LIGHT_MODEL_TWO_SIDE"
    cdef int LIGHT_MODEL_LOCAL_VIEWER "GL_LIGHT_MODEL_LOCAL_VIEWER"
    cdef int LIGHT_MODEL_AMBIENT "GL_LIGHT_MODEL_AMBIENT"
    cdef int FRONT_AND_BACK "GL_FRONT_AND_BACK"
    cdef int SHADE_MODEL "GL_SHADE_MODEL"
    cdef int FLAT "GL_FLAT"
    cdef int SMOOTH "GL_SMOOTH"
    cdef int COLOR_MATERIAL "GL_COLOR_MATERIAL"
    cdef int COLOR_MATERIAL_FACE "GL_COLOR_MATERIAL_FACE"
    cdef int COLOR_MATERIAL_PARAMETER "GL_COLOR_MATERIAL_PARAMETER"
    cdef int NORMALIZE "GL_NORMALIZE"
    # Lighting }}}
    
    # User {{{
    cdef int CLIP_PLANE0 "GL_CLIP_PLANE0"
    cdef int CLIP_PLANE1 "GL_CLIP_PLANE1"
    cdef int CLIP_PLANE2 "GL_CLIP_PLANE2"
    cdef int CLIP_PLANE3 "GL_CLIP_PLANE3"
    cdef int CLIP_PLANE4 "GL_CLIP_PLANE4"
    cdef int CLIP_PLANE5 "GL_CLIP_PLANE5"
    # User }}}
    
    # Accumulation {{{
    cdef int ACCUM_RED_BITS "GL_ACCUM_RED_BITS"
    cdef int ACCUM_GREEN_BITS "GL_ACCUM_GREEN_BITS"
    cdef int ACCUM_BLUE_BITS "GL_ACCUM_BLUE_BITS"
    cdef int ACCUM_ALPHA_BITS "GL_ACCUM_ALPHA_BITS"
    cdef int ACCUM_CLEAR_VALUE "GL_ACCUM_CLEAR_VALUE"
    cdef int ACCUM "GL_ACCUM"
    cdef int ADD "GL_ADD"
    cdef int LOAD "GL_LOAD"
    cdef int MULT "GL_MULT"
    cdef int RETURN "GL_RETURN"
    # Accumulation }}}
    
    # Alpha {{{
    cdef int ALPHA_TEST "GL_ALPHA_TEST"
    cdef int ALPHA_TEST_REF "GL_ALPHA_TEST_REF"
    cdef int ALPHA_TEST_FUNC "GL_ALPHA_TEST_FUNC"
    # Alpha }}}
    
    # Blending {{{
    cdef int BLEND "GL_BLEND"
    cdef int BLEND_SRC "GL_BLEND_SRC"
    cdef int BLEND_DST "GL_BLEND_DST"
    cdef int ZERO "GL_ZERO"
    cdef int ONE "GL_ONE"
    cdef int SRC_COLOR "GL_SRC_COLOR"
    cdef int ONE_MINUS_SRC_COLOR "GL_ONE_MINUS_SRC_COLOR"
    cdef int SRC_ALPHA "GL_SRC_ALPHA"
    cdef int ONE_MINUS_SRC_ALPHA "GL_ONE_MINUS_SRC_ALPHA"
    cdef int DST_ALPHA "GL_DST_ALPHA"
    cdef int ONE_MINUS_DST_ALPHA "GL_ONE_MINUS_DST_ALPHA"
    cdef int DST_COLOR "GL_DST_COLOR"
    cdef int ONE_MINUS_DST_COLOR "GL_ONE_MINUS_DST_COLOR"
    cdef int SRC_ALPHA_SATURATE "GL_SRC_ALPHA_SATURATE"
    # Blending }}}
    
    # Render {{{
    cdef int FEEDBACK "GL_FEEDBACK"
    cdef int RENDER "GL_RENDER"
    cdef int SELECT "GL_SELECT"
    # Render }}}
    
    # Feedback {{{
    cdef int 2D "GL_2D"
    cdef int 3D "GL_3D"
    cdef int 3D_COLOR "GL_3D_COLOR"
    cdef int 3D_COLOR_TEXTURE "GL_3D_COLOR_TEXTURE"
    cdef int 4D_COLOR_TEXTURE "GL_4D_COLOR_TEXTURE"
    cdef int POINT_TOKEN "GL_POINT_TOKEN"
    cdef int LINE_TOKEN "GL_LINE_TOKEN"
    cdef int LINE_RESET_TOKEN "GL_LINE_RESET_TOKEN"
    cdef int POLYGON_TOKEN "GL_POLYGON_TOKEN"
    cdef int BITMAP_TOKEN "GL_BITMAP_TOKEN"
    cdef int DRAW_PIXEL_TOKEN "GL_DRAW_PIXEL_TOKEN"
    cdef int COPY_PIXEL_TOKEN "GL_COPY_PIXEL_TOKEN"
    cdef int PASS_THROUGH_TOKEN "GL_PASS_THROUGH_TOKEN"
    cdef int FEEDBACK_BUFFER_POINTER "GL_FEEDBACK_BUFFER_POINTER"
    cdef int FEEDBACK_BUFFER_SIZE "GL_FEEDBACK_BUFFER_SIZE"
    cdef int FEEDBACK_BUFFER_TYPE "GL_FEEDBACK_BUFFER_TYPE"
    # Feedback }}}
    
    # Selection {{{
    cdef int SELECTION_BUFFER_POINTER "GL_SELECTION_BUFFER_POINTER"
    cdef int SELECTION_BUFFER_SIZE "GL_SELECTION_BUFFER_SIZE"
    # Selection }}}
    
    # Fog {{{
    cdef int FOG "GL_FOG"
    cdef int FOG_MODE "GL_FOG_MODE"
    cdef int FOG_DENSITY "GL_FOG_DENSITY"
    cdef int FOG_COLOR "GL_FOG_COLOR"
    cdef int FOG_INDEX "GL_FOG_INDEX"
    cdef int FOG_START "GL_FOG_START"
    cdef int FOG_END "GL_FOG_END"
    cdef int LINEAR "GL_LINEAR"
    cdef int EXP "GL_EXP"
    cdef int EXP2 "GL_EXP2"
    # Fog }}}
    
    # Logic {{{
    cdef int LOGIC_OP "GL_LOGIC_OP"
    cdef int INDEX_LOGIC_OP "GL_INDEX_LOGIC_OP"
    cdef int COLOR_LOGIC_OP "GL_COLOR_LOGIC_OP"
    cdef int LOGIC_OP_MODE "GL_LOGIC_OP_MODE"
    cdef int CLEAR "GL_CLEAR"
    cdef int SET "GL_SET"
    cdef int COPY "GL_COPY"
    cdef int COPY_INVERTED "GL_COPY_INVERTED"
    cdef int NOOP "GL_NOOP"
    cdef int INVERT "GL_INVERT"
    cdef int AND "GL_AND"
    cdef int NAND "GL_NAND"
    cdef int OR "GL_OR"
    cdef int NOR "GL_NOR"
    cdef int XOR "GL_XOR"
    cdef int EQUIV "GL_EQUIV"
    cdef int AND_REVERSE "GL_AND_REVERSE"
    cdef int AND_INVERTED "GL_AND_INVERTED"
    cdef int OR_REVERSE "GL_OR_REVERSE"
    cdef int OR_INVERTED "GL_OR_INVERTED"
    # Logic }}}
    
    # Stencil {{{
    cdef int STENCIL_BITS "GL_STENCIL_BITS"
    cdef int STENCIL_TEST "GL_STENCIL_TEST"
    cdef int STENCIL_CLEAR_VALUE "GL_STENCIL_CLEAR_VALUE"
    cdef int STENCIL_FUNC "GL_STENCIL_FUNC"
    cdef int STENCIL_VALUE_MASK "GL_STENCIL_VALUE_MASK"
    cdef int STENCIL_FAIL "GL_STENCIL_FAIL"
    cdef int STENCIL_PASS_DEPTH_FAIL "GL_STENCIL_PASS_DEPTH_FAIL"
    cdef int STENCIL_PASS_DEPTH_PASS "GL_STENCIL_PASS_DEPTH_PASS"
    cdef int STENCIL_REF "GL_STENCIL_REF"
    cdef int STENCIL_WRITEMASK "GL_STENCIL_WRITEMASK"
    cdef int STENCIL_INDEX "GL_STENCIL_INDEX"
    cdef int KEEP "GL_KEEP"
    cdef int REPLACE "GL_REPLACE"
    cdef int INCR "GL_INCR"
    cdef int DECR "GL_DECR"
    # Stencil }}}
    
    # Buffers {{{
    cdef int NONE "GL_NONE"
    cdef int LEFT "GL_LEFT"
    cdef int RIGHT "GL_RIGHT"
    cdef int FRONT_LEFT "GL_FRONT_LEFT"
    cdef int FRONT_RIGHT "GL_FRONT_RIGHT"
    cdef int BACK_LEFT "GL_BACK_LEFT"
    cdef int BACK_RIGHT "GL_BACK_RIGHT"
    cdef int AUX0 "GL_AUX0"
    cdef int AUX1 "GL_AUX1"
    cdef int AUX2 "GL_AUX2"
    cdef int AUX3 "GL_AUX3"
    cdef int COLOR_INDEX "GL_COLOR_INDEX"
    cdef int RED "GL_RED"
    cdef int GREEN "GL_GREEN"
    cdef int BLUE "GL_BLUE"
    cdef int ALPHA "GL_ALPHA"
    cdef int LUMINANCE "GL_LUMINANCE"
    cdef int LUMINANCE_ALPHA "GL_LUMINANCE_ALPHA"
    cdef int ALPHA_BITS "GL_ALPHA_BITS"
    cdef int RED_BITS "GL_RED_BITS"
    cdef int GREEN_BITS "GL_GREEN_BITS"
    cdef int BLUE_BITS "GL_BLUE_BITS"
    cdef int INDEX_BITS "GL_INDEX_BITS"
    cdef int SUBPIXEL_BITS "GL_SUBPIXEL_BITS"
    cdef int AUX_BUFFERS "GL_AUX_BUFFERS"
    cdef int READ_BUFFER "GL_READ_BUFFER"
    cdef int DRAW_BUFFER "GL_DRAW_BUFFER"
    cdef int DOUBLEBUFFER "GL_DOUBLEBUFFER"
    cdef int STEREO "GL_STEREO"
    cdef int BITMAP "GL_BITMAP"
    cdef int COLOR "GL_COLOR"
    cdef int DEPTH "GL_DEPTH"
    cdef int STENCIL "GL_STENCIL"
    cdef int DITHER "GL_DITHER"
    cdef int RGB "GL_RGB"
    cdef int RGBA "GL_RGBA"
    # Buffers }}}
    
    # Implementation {{{
    cdef int MAX_LIST_NESTING "GL_MAX_LIST_NESTING"
    cdef int MAX_EVAL_ORDER "GL_MAX_EVAL_ORDER"
    cdef int MAX_LIGHTS "GL_MAX_LIGHTS"
    cdef int MAX_CLIP_PLANES "GL_MAX_CLIP_PLANES"
    cdef int MAX_TEXTURE_SIZE "GL_MAX_TEXTURE_SIZE"
    cdef int MAX_PIXEL_MAP_TABLE "GL_MAX_PIXEL_MAP_TABLE"
    cdef int MAX_ATTRIB_STACK_DEPTH "GL_MAX_ATTRIB_STACK_DEPTH"
    cdef int MAX_MODELVIEW_STACK_DEPTH "GL_MAX_MODELVIEW_STACK_DEPTH"
    cdef int MAX_NAME_STACK_DEPTH "GL_MAX_NAME_STACK_DEPTH"
    cdef int MAX_PROJECTION_STACK_DEPTH "GL_MAX_PROJECTION_STACK_DEPTH"
    cdef int MAX_TEXTURE_STACK_DEPTH "GL_MAX_TEXTURE_STACK_DEPTH"
    cdef int MAX_VIEWPORT_DIMS "GL_MAX_VIEWPORT_DIMS"
    cdef int MAX_CLIENT_ATTRIB_STACK_DEPTH "GL_MAX_CLIENT_ATTRIB_STACK_DEPTH"
    # Implementation }}}
    
    # Gets {{{
    cdef int ATTRIB_STACK_DEPTH "GL_ATTRIB_STACK_DEPTH"
    cdef int CLIENT_ATTRIB_STACK_DEPTH "GL_CLIENT_ATTRIB_STACK_DEPTH"
    cdef int COLOR_CLEAR_VALUE "GL_COLOR_CLEAR_VALUE"
    cdef int COLOR_WRITEMASK "GL_COLOR_WRITEMASK"
    cdef int CURRENT_INDEX "GL_CURRENT_INDEX"
    cdef int CURRENT_COLOR "GL_CURRENT_COLOR"
    cdef int CURRENT_NORMAL "GL_CURRENT_NORMAL"
    cdef int CURRENT_RASTER_COLOR "GL_CURRENT_RASTER_COLOR"
    cdef int CURRENT_RASTER_DISTANCE "GL_CURRENT_RASTER_DISTANCE"
    cdef int CURRENT_RASTER_INDEX "GL_CURRENT_RASTER_INDEX"
    cdef int CURRENT_RASTER_POSITION "GL_CURRENT_RASTER_POSITION"
    cdef int CURRENT_RASTER_TEXTURE_COORDS "GL_CURRENT_RASTER_TEXTURE_COORDS"
    cdef int CURRENT_RASTER_POSITION_VALID "GL_CURRENT_RASTER_POSITION_VALID"
    cdef int CURRENT_TEXTURE_COORDS "GL_CURRENT_TEXTURE_COORDS"
    cdef int INDEX_CLEAR_VALUE "GL_INDEX_CLEAR_VALUE"
    cdef int INDEX_MODE "GL_INDEX_MODE"
    cdef int INDEX_WRITEMASK "GL_INDEX_WRITEMASK"
    cdef int MODELVIEW_MATRIX "GL_MODELVIEW_MATRIX"
    cdef int MODELVIEW_STACK_DEPTH "GL_MODELVIEW_STACK_DEPTH"
    cdef int NAME_STACK_DEPTH "GL_NAME_STACK_DEPTH"
    cdef int PROJECTION_MATRIX "GL_PROJECTION_MATRIX"
    cdef int PROJECTION_STACK_DEPTH "GL_PROJECTION_STACK_DEPTH"
    cdef int RENDER_MODE "GL_RENDER_MODE"
    cdef int RGBA_MODE "GL_RGBA_MODE"
    cdef int TEXTURE_MATRIX "GL_TEXTURE_MATRIX"
    cdef int TEXTURE_STACK_DEPTH "GL_TEXTURE_STACK_DEPTH"
    cdef int VIEWPORT "GL_VIEWPORT"
    # Gets }}}
    
    # Evaluators {{{
    cdef int AUTO_NORMAL "GL_AUTO_NORMAL"
    cdef int MAP1_COLOR_4 "GL_MAP1_COLOR_4"
    cdef int MAP1_INDEX "GL_MAP1_INDEX"
    cdef int MAP1_NORMAL "GL_MAP1_NORMAL"
    cdef int MAP1_TEXTURE_COORD_1 "GL_MAP1_TEXTURE_COORD_1"
    cdef int MAP1_TEXTURE_COORD_2 "GL_MAP1_TEXTURE_COORD_2"
    cdef int MAP1_TEXTURE_COORD_3 "GL_MAP1_TEXTURE_COORD_3"
    cdef int MAP1_TEXTURE_COORD_4 "GL_MAP1_TEXTURE_COORD_4"
    cdef int MAP1_VERTEX_3 "GL_MAP1_VERTEX_3"
    cdef int MAP1_VERTEX_4 "GL_MAP1_VERTEX_4"
    cdef int MAP2_COLOR_4 "GL_MAP2_COLOR_4"
    cdef int MAP2_INDEX "GL_MAP2_INDEX"
    cdef int MAP2_NORMAL "GL_MAP2_NORMAL"
    cdef int MAP2_TEXTURE_COORD_1 "GL_MAP2_TEXTURE_COORD_1"
    cdef int MAP2_TEXTURE_COORD_2 "GL_MAP2_TEXTURE_COORD_2"
    cdef int MAP2_TEXTURE_COORD_3 "GL_MAP2_TEXTURE_COORD_3"
    cdef int MAP2_TEXTURE_COORD_4 "GL_MAP2_TEXTURE_COORD_4"
    cdef int MAP2_VERTEX_3 "GL_MAP2_VERTEX_3"
    cdef int MAP2_VERTEX_4 "GL_MAP2_VERTEX_4"
    cdef int MAP1_GRID_DOMAIN "GL_MAP1_GRID_DOMAIN"
    cdef int MAP1_GRID_SEGMENTS "GL_MAP1_GRID_SEGMENTS"
    cdef int MAP2_GRID_DOMAIN "GL_MAP2_GRID_DOMAIN"
    cdef int MAP2_GRID_SEGMENTS "GL_MAP2_GRID_SEGMENTS"
    cdef int COEFF "GL_COEFF"
    cdef int ORDER "GL_ORDER"
    cdef int DOMAIN "GL_DOMAIN"
    # Evaluators }}}
    
    # Hcdef {{{
    cdef int PERSPECTIVE_CORRECTION_HINT "GL_PERSPECTIVE_CORRECTION_HINT"
    cdef int POINT_SMOOTH_HINT "GL_POINT_SMOOTH_HINT"
    cdef int LINE_SMOOTH_HINT "GL_LINE_SMOOTH_HINT"
    cdef int POLYGON_SMOOTH_HINT "GL_POLYGON_SMOOTH_HINT"
    cdef int FOG_HINT "GL_FOG_HINT"
    cdef int DONT_CARE "GL_DONT_CARE"
    cdef int FASTEST "GL_FASTEST"
    cdef int NICEST "GL_NICEST"
    # Hcdef }}}
    
    # Scissor {{{
    cdef int SCISSOR_BOX "GL_SCISSOR_BOX"
    cdef int SCISSOR_TEST "GL_SCISSOR_TEST"
    # Scissor }}}
    
    # Pixel {{{
    cdef int MAP_COLOR "GL_MAP_COLOR"
    cdef int MAP_STENCIL "GL_MAP_STENCIL"
    cdef int INDEX_SHIFT "GL_INDEX_SHIFT"
    cdef int INDEX_OFFSET "GL_INDEX_OFFSET"
    cdef int RED_SCALE "GL_RED_SCALE"
    cdef int RED_BIAS "GL_RED_BIAS"
    cdef int GREEN_SCALE "GL_GREEN_SCALE"
    cdef int GREEN_BIAS "GL_GREEN_BIAS"
    cdef int BLUE_SCALE "GL_BLUE_SCALE"
    cdef int BLUE_BIAS "GL_BLUE_BIAS"
    cdef int ALPHA_SCALE "GL_ALPHA_SCALE"
    cdef int ALPHA_BIAS "GL_ALPHA_BIAS"
    cdef int DEPTH_SCALE "GL_DEPTH_SCALE"
    cdef int DEPTH_BIAS "GL_DEPTH_BIAS"
    cdef int PIXEL_MAP_S_TO_S_SIZE "GL_PIXEL_MAP_S_TO_S_SIZE"
    cdef int PIXEL_MAP_I_TO_I_SIZE "GL_PIXEL_MAP_I_TO_I_SIZE"
    cdef int PIXEL_MAP_I_TO_R_SIZE "GL_PIXEL_MAP_I_TO_R_SIZE"
    cdef int PIXEL_MAP_I_TO_G_SIZE "GL_PIXEL_MAP_I_TO_G_SIZE"
    cdef int PIXEL_MAP_I_TO_B_SIZE "GL_PIXEL_MAP_I_TO_B_SIZE"
    cdef int PIXEL_MAP_I_TO_A_SIZE "GL_PIXEL_MAP_I_TO_A_SIZE"
    cdef int PIXEL_MAP_R_TO_R_SIZE "GL_PIXEL_MAP_R_TO_R_SIZE"
    cdef int PIXEL_MAP_G_TO_G_SIZE "GL_PIXEL_MAP_G_TO_G_SIZE"
    cdef int PIXEL_MAP_B_TO_B_SIZE "GL_PIXEL_MAP_B_TO_B_SIZE"
    cdef int PIXEL_MAP_A_TO_A_SIZE "GL_PIXEL_MAP_A_TO_A_SIZE"
    cdef int PIXEL_MAP_S_TO_S "GL_PIXEL_MAP_S_TO_S"
    cdef int PIXEL_MAP_I_TO_I "GL_PIXEL_MAP_I_TO_I"
    cdef int PIXEL_MAP_I_TO_R "GL_PIXEL_MAP_I_TO_R"
    cdef int PIXEL_MAP_I_TO_G "GL_PIXEL_MAP_I_TO_G"
    cdef int PIXEL_MAP_I_TO_B "GL_PIXEL_MAP_I_TO_B"
    cdef int PIXEL_MAP_I_TO_A "GL_PIXEL_MAP_I_TO_A"
    cdef int PIXEL_MAP_R_TO_R "GL_PIXEL_MAP_R_TO_R"
    cdef int PIXEL_MAP_G_TO_G "GL_PIXEL_MAP_G_TO_G"
    cdef int PIXEL_MAP_B_TO_B "GL_PIXEL_MAP_B_TO_B"
    cdef int PIXEL_MAP_A_TO_A "GL_PIXEL_MAP_A_TO_A"
    cdef int PACK_ALIGNMENT "GL_PACK_ALIGNMENT"
    cdef int PACK_LSB_FIRST "GL_PACK_LSB_FIRST"
    cdef int PACK_ROW_LENGTH "GL_PACK_ROW_LENGTH"
    cdef int PACK_SKIP_PIXELS "GL_PACK_SKIP_PIXELS"
    cdef int PACK_SKIP_ROWS "GL_PACK_SKIP_ROWS"
    cdef int PACK_SWAP_BYTES "GL_PACK_SWAP_BYTES"
    cdef int UNPACK_ALIGNMENT "GL_UNPACK_ALIGNMENT"
    cdef int UNPACK_LSB_FIRST "GL_UNPACK_LSB_FIRST"
    cdef int UNPACK_ROW_LENGTH "GL_UNPACK_ROW_LENGTH"
    cdef int UNPACK_SKIP_PIXELS "GL_UNPACK_SKIP_PIXELS"
    cdef int UNPACK_SKIP_ROWS "GL_UNPACK_SKIP_ROWS"
    cdef int UNPACK_SWAP_BYTES "GL_UNPACK_SWAP_BYTES"
    cdef int ZOOM_X "GL_ZOOM_X"
    cdef int ZOOM_Y "GL_ZOOM_Y"
    # Pixel }}}
    
    # Texture {{{
    cdef int TEXTURE_ENV "GL_TEXTURE_ENV"
    cdef int TEXTURE_ENV_MODE "GL_TEXTURE_ENV_MODE"
    cdef int TEXTURE_1D "GL_TEXTURE_1D"
    cdef int TEXTURE_2D "GL_TEXTURE_2D"
    cdef int TEXTURE_WRAP_S "GL_TEXTURE_WRAP_S"
    cdef int TEXTURE_WRAP_T "GL_TEXTURE_WRAP_T"
    cdef int TEXTURE_MAG_FILTER "GL_TEXTURE_MAG_FILTER"
    cdef int TEXTURE_MIN_FILTER "GL_TEXTURE_MIN_FILTER"
    cdef int TEXTURE_ENV_COLOR "GL_TEXTURE_ENV_COLOR"
    cdef int TEXTURE_GEN_S "GL_TEXTURE_GEN_S"
    cdef int TEXTURE_GEN_T "GL_TEXTURE_GEN_T"
    cdef int TEXTURE_GEN_MODE "GL_TEXTURE_GEN_MODE"
    cdef int TEXTURE_BORDER_COLOR "GL_TEXTURE_BORDER_COLOR"
    cdef int TEXTURE_WIDTH "GL_TEXTURE_WIDTH"
    cdef int TEXTURE_HEIGHT "GL_TEXTURE_HEIGHT"
    cdef int TEXTURE_BORDER "GL_TEXTURE_BORDER"
    cdef int TEXTURE_COMPONENTS "GL_TEXTURE_COMPONENTS"
    cdef int TEXTURE_RED_SIZE "GL_TEXTURE_RED_SIZE"
    cdef int TEXTURE_GREEN_SIZE "GL_TEXTURE_GREEN_SIZE"
    cdef int TEXTURE_BLUE_SIZE "GL_TEXTURE_BLUE_SIZE"
    cdef int TEXTURE_ALPHA_SIZE "GL_TEXTURE_ALPHA_SIZE"
    cdef int TEXTURE_LUMINANCE_SIZE "GL_TEXTURE_LUMINANCE_SIZE"
    cdef int TEXTURE_INTENSITY_SIZE "GL_TEXTURE_INTENSITY_SIZE"
    cdef int NEAREST_MIPMAP_NEAREST "GL_NEAREST_MIPMAP_NEAREST"
    cdef int NEAREST_MIPMAP_LINEAR "GL_NEAREST_MIPMAP_LINEAR"
    cdef int LINEAR_MIPMAP_NEAREST "GL_LINEAR_MIPMAP_NEAREST"
    cdef int LINEAR_MIPMAP_LINEAR "GL_LINEAR_MIPMAP_LINEAR"
    cdef int OBJECT_LINEAR "GL_OBJECT_LINEAR"
    cdef int OBJECT_PLANE "GL_OBJECT_PLANE"
    cdef int EYE_LINEAR "GL_EYE_LINEAR"
    cdef int EYE_PLANE "GL_EYE_PLANE"
    cdef int SPHERE_MAP "GL_SPHERE_MAP"
    cdef int DECAL "GL_DECAL"
    cdef int MODULATE "GL_MODULATE"
    cdef int NEAREST "GL_NEAREST"
    cdef int REPEAT "GL_REPEAT"
    cdef int CLAMP "GL_CLAMP"
    cdef int S "GL_S"
    cdef int T "GL_T"
    cdef int R "GL_R"
    cdef int Q "GL_Q"
    cdef int TEXTURE_GEN_R "GL_TEXTURE_GEN_R"
    cdef int TEXTURE_GEN_Q "GL_TEXTURE_GEN_Q"
    # Texture }}}
    
    # Utility {{{
    cdef int VENDOR "GL_VENDOR"
    cdef int RENDERER "GL_RENDERER"
    cdef int VERSION "GL_VERSION"
    cdef int EXTENSIONS "GL_EXTENSIONS"
    # Utility }}}
    
    # Errors {{{
    cdef int NO_ERROR  "GL_NO_ERROR "
    cdef int INVALID_ENUM "GL_INVALID_ENUM"
    cdef int INVALID_VALUE "GL_INVALID_VALUE"
    cdef int INVALID_OPERATION "GL_INVALID_OPERATION"
    cdef int STACK_OVERFLOW "GL_STACK_OVERFLOW"
    cdef int STACK_UNDERFLOW "GL_STACK_UNDERFLOW"
    cdef int OUT_OF_MEMORY "GL_OUT_OF_MEMORY"
    # Errors }}}
    
    # glPush {{{
    cdef int CURRENT_BIT "GL_CURRENT_BIT"
    cdef int POINT_BIT "GL_POINT_BIT"
    cdef int LINE_BIT "GL_LINE_BIT"
    cdef int POLYGON_BIT "GL_POLYGON_BIT"
    cdef int POLYGON_STIPPLE_BIT "GL_POLYGON_STIPPLE_BIT"
    cdef int PIXEL_MODE_BIT "GL_PIXEL_MODE_BIT"
    cdef int LIGHTING_BIT "GL_LIGHTING_BIT"
    cdef int FOG_BIT "GL_FOG_BIT"
    cdef int DEPTH_BUFFER_BIT "GL_DEPTH_BUFFER_BIT"
    cdef int ACCUM_BUFFER_BIT "GL_ACCUM_BUFFER_BIT"
    cdef int STENCIL_BUFFER_BIT "GL_STENCIL_BUFFER_BIT"
    cdef int VIEWPORT_BIT "GL_VIEWPORT_BIT"
    cdef int TRANSFORM_BIT "GL_TRANSFORM_BIT"
    cdef int ENABLE_BIT "GL_ENABLE_BIT"
    cdef int COLOR_BUFFER_BIT "GL_COLOR_BUFFER_BIT"
    cdef int HINT_BIT "GL_HINT_BIT"
    cdef int EVAL_BIT "GL_EVAL_BIT"
    cdef int LIST_BIT "GL_LIST_BIT"
    cdef int TEXTURE_BIT "GL_TEXTURE_BIT"
    cdef int SCISSOR_BIT "GL_SCISSOR_BIT"
    cdef int ALL_ATTRIB_BITS "GL_ALL_ATTRIB_BITS"
    # glPush }}}
    
    
    # OpenGL {{{
    cdef int PROXY_TEXTURE_1D "GL_PROXY_TEXTURE_1D"
    cdef int PROXY_TEXTURE_2D "GL_PROXY_TEXTURE_2D"
    cdef int TEXTURE_PRIORITY "GL_TEXTURE_PRIORITY"
    cdef int TEXTURE_RESIDENT "GL_TEXTURE_RESIDENT"
    cdef int TEXTURE_BINDING_1D "GL_TEXTURE_BINDING_1D"
    cdef int TEXTURE_BINDING_2D "GL_TEXTURE_BINDING_2D"
    cdef int TEXTURE_INTERNAL_FORMAT "GL_TEXTURE_INTERNAL_FORMAT"
    cdef int ALPHA4 "GL_ALPHA4"
    cdef int ALPHA8 "GL_ALPHA8"
    cdef int ALPHA12 "GL_ALPHA12"
    cdef int ALPHA16 "GL_ALPHA16"
    cdef int LUMINANCE4 "GL_LUMINANCE4"
    cdef int LUMINANCE8 "GL_LUMINANCE8"
    cdef int LUMINANCE12 "GL_LUMINANCE12"
    cdef int LUMINANCE16 "GL_LUMINANCE16"
    cdef int LUMINANCE4_ALPHA4 "GL_LUMINANCE4_ALPHA4"
    cdef int LUMINANCE6_ALPHA2 "GL_LUMINANCE6_ALPHA2"
    cdef int LUMINANCE8_ALPHA8 "GL_LUMINANCE8_ALPHA8"
    cdef int LUMINANCE12_ALPHA4 "GL_LUMINANCE12_ALPHA4"
    cdef int LUMINANCE12_ALPHA12 "GL_LUMINANCE12_ALPHA12"
    cdef int LUMINANCE16_ALPHA16 "GL_LUMINANCE16_ALPHA16"
    cdef int INTENSITY "GL_INTENSITY"
    cdef int INTENSITY4 "GL_INTENSITY4"
    cdef int INTENSITY8 "GL_INTENSITY8"
    cdef int INTENSITY12 "GL_INTENSITY12"
    cdef int INTENSITY16 "GL_INTENSITY16"
    cdef int R3_G3_B2 "GL_R3_G3_B2"
    cdef int RGB4 "GL_RGB4"
    cdef int RGB5 "GL_RGB5"
    cdef int RGB8 "GL_RGB8"
    cdef int RGB10 "GL_RGB10"
    cdef int RGB12 "GL_RGB12"
    cdef int RGB16 "GL_RGB16"
    cdef int RGBA2 "GL_RGBA2"
    cdef int RGBA4 "GL_RGBA4"
    cdef int RGB5_A1 "GL_RGB5_A1"
    cdef int RGBA8 "GL_RGBA8"
    cdef int RGB10_A2 "GL_RGB10_A2"
    cdef int RGBA12 "GL_RGBA12"
    cdef int RGBA16 "GL_RGBA16"
    cdef int CLIENT_PIXEL_STORE_BIT "GL_CLIENT_PIXEL_STORE_BIT"
    cdef int CLIENT_VERTEX_ARRAY_BIT "GL_CLIENT_VERTEX_ARRAY_BIT"
    cdef int ALL_CLIENT_ATTRIB_BITS  "GL_ALL_CLIENT_ATTRIB_BITS "
    cdef int CLIENT_ALL_ATTRIB_BITS  "GL_CLIENT_ALL_ATTRIB_BITS "
    # OpenGL }}}

    # GL Imaging {{{
    cdef int CONSTANT_COLOR "GL_CONSTANT_COLOR"
    cdef int ONE_MINUS_CONSTANT_COLOR "GL_ONE_MINUS_CONSTANT_COLOR"
    cdef int CONSTANT_ALPHA "GL_CONSTANT_ALPHA"
    cdef int ONE_MINUS_CONSTANT_ALPHA "GL_ONE_MINUS_CONSTANT_ALPHA"
    cdef int COLOR_TABLE "GL_COLOR_TABLE"
    cdef int POST_CONVOLUTION_COLOR_TABLE "GL_POST_CONVOLUTION_COLOR_TABLE"
    cdef int POST_COLOR_MATRIX_COLOR_TABLE "GL_POST_COLOR_MATRIX_COLOR_TABLE"
    cdef int PROXY_COLOR_TABLE "GL_PROXY_COLOR_TABLE"
    cdef int PROXY_POST_CONVOLUTION_COLOR_TABLE "GL_PROXY_POST_CONVOLUTION_COLOR_TABLE"
    cdef int PROXY_POST_COLOR_MATRIX_COLOR_TABLE "GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE"
    cdef int COLOR_TABLE_SCALE "GL_COLOR_TABLE_SCALE"
    cdef int COLOR_TABLE_BIAS "GL_COLOR_TABLE_BIAS"
    cdef int COLOR_TABLE_FORMAT "GL_COLOR_TABLE_FORMAT"
    cdef int COLOR_TABLE_WIDTH "GL_COLOR_TABLE_WIDTH"
    cdef int COLOR_TABLE_RED_SIZE "GL_COLOR_TABLE_RED_SIZE"
    cdef int COLOR_TABLE_GREEN_SIZE "GL_COLOR_TABLE_GREEN_SIZE"
    cdef int COLOR_TABLE_BLUE_SIZE "GL_COLOR_TABLE_BLUE_SIZE"
    cdef int COLOR_TABLE_ALPHA_SIZE "GL_COLOR_TABLE_ALPHA_SIZE"
    cdef int COLOR_TABLE_LUMINANCE_SIZE "GL_COLOR_TABLE_LUMINANCE_SIZE"
    cdef int COLOR_TABLE_INTENSITY_SIZE "GL_COLOR_TABLE_INTENSITY_SIZE"
    cdef int CONVOLUTION_1D "GL_CONVOLUTION_1D"
    cdef int CONVOLUTION_2D "GL_CONVOLUTION_2D"
    cdef int SEPARABLE_2D "GL_SEPARABLE_2D"
    cdef int CONVOLUTION_BORDER_MODE "GL_CONVOLUTION_BORDER_MODE"
    cdef int CONVOLUTION_FILTER_SCALE "GL_CONVOLUTION_FILTER_SCALE"
    cdef int CONVOLUTION_FILTER_BIAS "GL_CONVOLUTION_FILTER_BIAS"
    cdef int REDUCE "GL_REDUCE"
    cdef int CONVOLUTION_FORMAT "GL_CONVOLUTION_FORMAT"
    cdef int CONVOLUTION_WIDTH "GL_CONVOLUTION_WIDTH"
    cdef int CONVOLUTION_HEIGHT "GL_CONVOLUTION_HEIGHT"
    cdef int MAX_CONVOLUTION_WIDTH "GL_MAX_CONVOLUTION_WIDTH"
    cdef int MAX_CONVOLUTION_HEIGHT "GL_MAX_CONVOLUTION_HEIGHT"
    cdef int POST_CONVOLUTION_RED_SCALE "GL_POST_CONVOLUTION_RED_SCALE"
    cdef int POST_CONVOLUTION_GREEN_SCALE "GL_POST_CONVOLUTION_GREEN_SCALE"
    cdef int POST_CONVOLUTION_BLUE_SCALE "GL_POST_CONVOLUTION_BLUE_SCALE"
    cdef int POST_CONVOLUTION_ALPHA_SCALE "GL_POST_CONVOLUTION_ALPHA_SCALE"
    cdef int POST_CONVOLUTION_RED_BIAS "GL_POST_CONVOLUTION_RED_BIAS"
    cdef int POST_CONVOLUTION_GREEN_BIAS "GL_POST_CONVOLUTION_GREEN_BIAS"
    cdef int POST_CONVOLUTION_BLUE_BIAS "GL_POST_CONVOLUTION_BLUE_BIAS"
    cdef int POST_CONVOLUTION_ALPHA_BIAS "GL_POST_CONVOLUTION_ALPHA_BIAS"
    cdef int CONSTANT_BORDER "GL_CONSTANT_BORDER"
    cdef int REPLICATE_BORDER "GL_REPLICATE_BORDER"
    cdef int CONVOLUTION_BORDER_COLOR "GL_CONVOLUTION_BORDER_COLOR"
    cdef int COLOR_MATRIX "GL_COLOR_MATRIX"
    cdef int COLOR_MATRIX_STACK_DEPTH "GL_COLOR_MATRIX_STACK_DEPTH"
    cdef int MAX_COLOR_MATRIX_STACK_DEPTH "GL_MAX_COLOR_MATRIX_STACK_DEPTH"
    cdef int POST_COLOR_MATRIX_RED_SCALE "GL_POST_COLOR_MATRIX_RED_SCALE"
    cdef int POST_COLOR_MATRIX_GREEN_SCALE "GL_POST_COLOR_MATRIX_GREEN_SCALE"
    cdef int POST_COLOR_MATRIX_BLUE_SCALE "GL_POST_COLOR_MATRIX_BLUE_SCALE"
    cdef int POST_COLOR_MATRIX_ALPHA_SCALE "GL_POST_COLOR_MATRIX_ALPHA_SCALE"
    cdef int POST_COLOR_MATRIX_RED_BIAS "GL_POST_COLOR_MATRIX_RED_BIAS"
    cdef int POST_COLOR_MATRIX_GREEN_BIAS "GL_POST_COLOR_MATRIX_GREEN_BIAS"
    cdef int POST_COLOR_MATRIX_BLUE_BIAS "GL_POST_COLOR_MATRIX_BLUE_BIAS"
    cdef int POST_COLOR_MATRIX_ALPHA_BIAS "GL_POST_COLOR_MATRIX_ALPHA_BIAS"
    cdef int HISTOGRAM "GL_HISTOGRAM"
    cdef int PROXY_HISTOGRAM "GL_PROXY_HISTOGRAM"
    cdef int HISTOGRAM_WIDTH "GL_HISTOGRAM_WIDTH"
    cdef int HISTOGRAM_FORMAT "GL_HISTOGRAM_FORMAT"
    cdef int HISTOGRAM_RED_SIZE "GL_HISTOGRAM_RED_SIZE"
    cdef int HISTOGRAM_GREEN_SIZE "GL_HISTOGRAM_GREEN_SIZE"
    cdef int HISTOGRAM_BLUE_SIZE "GL_HISTOGRAM_BLUE_SIZE"
    cdef int HISTOGRAM_ALPHA_SIZE "GL_HISTOGRAM_ALPHA_SIZE"
    cdef int HISTOGRAM_LUMINANCE_SIZE "GL_HISTOGRAM_LUMINANCE_SIZE"
    cdef int HISTOGRAM_SINK "GL_HISTOGRAM_SINK"
    cdef int MINMAX "GL_MINMAX"
    cdef int MINMAX_FORMAT "GL_MINMAX_FORMAT"
    cdef int MINMAX_SINK "GL_MINMAX_SINK"
    cdef int TABLE_TOO_LARGE "GL_TABLE_TOO_LARGE"
    cdef int BLEND_EQUATION "GL_BLEND_EQUATION"
    cdef int MIN "GL_MIN"
    cdef int MAX "GL_MAX"
    cdef int FUNC_ADD "GL_FUNC_ADD"
    cdef int FUNC_SUBTRACT "GL_FUNC_SUBTRACT"
    cdef int FUNC_REVERSE_SUBTRACT "GL_FUNC_REVERSE_SUBTRACT"
    cdef int BLEND_COLOR "GL_BLEND_COLOR"
    # GL Imaging }}}

    # multitexture  {{{
    cdef int TEXTURE0 "GL_TEXTURE0"
    cdef int TEXTURE1 "GL_TEXTURE1"
    cdef int TEXTURE2 "GL_TEXTURE2"
    cdef int TEXTURE3 "GL_TEXTURE3"
    cdef int TEXTURE4 "GL_TEXTURE4"
    cdef int TEXTURE5 "GL_TEXTURE5"
    cdef int TEXTURE6 "GL_TEXTURE6"
    cdef int TEXTURE7 "GL_TEXTURE7"
    cdef int TEXTURE8 "GL_TEXTURE8"
    cdef int TEXTURE9 "GL_TEXTURE9"
    cdef int TEXTURE10 "GL_TEXTURE10"
    cdef int TEXTURE11 "GL_TEXTURE11"
    cdef int TEXTURE12 "GL_TEXTURE12"
    cdef int TEXTURE13 "GL_TEXTURE13"
    cdef int TEXTURE14 "GL_TEXTURE14"
    cdef int TEXTURE15 "GL_TEXTURE15"
    cdef int TEXTURE16 "GL_TEXTURE16"
    cdef int TEXTURE17 "GL_TEXTURE17"
    cdef int TEXTURE18 "GL_TEXTURE18"
    cdef int TEXTURE19 "GL_TEXTURE19"
    cdef int TEXTURE20 "GL_TEXTURE20"
    cdef int TEXTURE21 "GL_TEXTURE21"
    cdef int TEXTURE22 "GL_TEXTURE22"
    cdef int TEXTURE23 "GL_TEXTURE23"
    cdef int TEXTURE24 "GL_TEXTURE24"
    cdef int TEXTURE25 "GL_TEXTURE25"
    cdef int TEXTURE26 "GL_TEXTURE26"
    cdef int TEXTURE27 "GL_TEXTURE27"
    cdef int TEXTURE28 "GL_TEXTURE28"
    cdef int TEXTURE29 "GL_TEXTURE29"
    cdef int TEXTURE30 "GL_TEXTURE30"
    cdef int TEXTURE31 "GL_TEXTURE31"
    cdef int ACTIVE_TEXTURE "GL_ACTIVE_TEXTURE"
    cdef int CLIENT_ACTIVE_TEXTURE "GL_CLIENT_ACTIVE_TEXTURE"
    cdef int MAX_TEXTURE_UNITS "GL_MAX_TEXTURE_UNITS"
    # multitexture  }}}

    # texture_cube_map  {{{
    cdef int NORMAL_MAP "GL_NORMAL_MAP"
    cdef int REFLECTION_MAP "GL_REFLECTION_MAP"
    cdef int TEXTURE_CUBE_MAP "GL_TEXTURE_CUBE_MAP"
    cdef int TEXTURE_BINDING_CUBE_MAP "GL_TEXTURE_BINDING_CUBE_MAP"
    cdef int TEXTURE_CUBE_MAP_POSITIVE_X "GL_TEXTURE_CUBE_MAP_POSITIVE_X"
    cdef int TEXTURE_CUBE_MAP_NEGATIVE_X "GL_TEXTURE_CUBE_MAP_NEGATIVE_X"
    cdef int TEXTURE_CUBE_MAP_POSITIVE_Y "GL_TEXTURE_CUBE_MAP_POSITIVE_Y"
    cdef int TEXTURE_CUBE_MAP_NEGATIVE_Y "GL_TEXTURE_CUBE_MAP_NEGATIVE_Y"
    cdef int TEXTURE_CUBE_MAP_POSITIVE_Z "GL_TEXTURE_CUBE_MAP_POSITIVE_Z"
    cdef int TEXTURE_CUBE_MAP_NEGATIVE_Z "GL_TEXTURE_CUBE_MAP_NEGATIVE_Z"
    cdef int PROXY_TEXTURE_CUBE_MAP "GL_PROXY_TEXTURE_CUBE_MAP"
    cdef int MAX_CUBE_MAP_TEXTURE_SIZE "GL_MAX_CUBE_MAP_TEXTURE_SIZE"
    # texture_cube_map  }}}

    # texture_compression  {{{
    cdef int COMPRESSED_ALPHA "GL_COMPRESSED_ALPHA"
    cdef int COMPRESSED_LUMINANCE "GL_COMPRESSED_LUMINANCE"
    cdef int COMPRESSED_LUMINANCE_ALPHA "GL_COMPRESSED_LUMINANCE_ALPHA"
    cdef int COMPRESSED_INTENSITY "GL_COMPRESSED_INTENSITY"
    cdef int COMPRESSED_RGB "GL_COMPRESSED_RGB"
    cdef int COMPRESSED_RGBA "GL_COMPRESSED_RGBA"
    cdef int TEXTURE_COMPRESSION_HINT "GL_TEXTURE_COMPRESSION_HINT"
    cdef int TEXTURE_COMPRESSED_IMAGE_SIZE "GL_TEXTURE_COMPRESSED_IMAGE_SIZE"
    cdef int TEXTURE_COMPRESSED "GL_TEXTURE_COMPRESSED"
    cdef int NUM_COMPRESSED_TEXTURE_FORMATS "GL_NUM_COMPRESSED_TEXTURE_FORMATS"
    cdef int COMPRESSED_TEXTURE_FORMATS "GL_COMPRESSED_TEXTURE_FORMATS"
    # texture_compression  }}}

    # multisample  {{{
    cdef int MULTISAMPLE "GL_MULTISAMPLE"
    cdef int SAMPLE_ALPHA_TO_COVERAGE "GL_SAMPLE_ALPHA_TO_COVERAGE"
    cdef int SAMPLE_ALPHA_TO_ONE "GL_SAMPLE_ALPHA_TO_ONE"
    cdef int SAMPLE_COVERAGE "GL_SAMPLE_COVERAGE"
    cdef int SAMPLE_BUFFERS "GL_SAMPLE_BUFFERS"
    cdef int SAMPLES "GL_SAMPLES"
    cdef int SAMPLE_COVERAGE_VALUE "GL_SAMPLE_COVERAGE_VALUE"
    cdef int SAMPLE_COVERAGE_INVERT "GL_SAMPLE_COVERAGE_INVERT"
    cdef int MULTISAMPLE_BIT "GL_MULTISAMPLE_BIT"
    # multisample  }}}

    # transpose_matrix  {{{
    cdef int TRANSPOSE_MODELVIEW_MATRIX "GL_TRANSPOSE_MODELVIEW_MATRIX"
    cdef int TRANSPOSE_PROJECTION_MATRIX "GL_TRANSPOSE_PROJECTION_MATRIX"
    cdef int TRANSPOSE_TEXTURE_MATRIX "GL_TRANSPOSE_TEXTURE_MATRIX"
    cdef int TRANSPOSE_COLOR_MATRIX "GL_TRANSPOSE_COLOR_MATRIX"
    # transpose_matrix  }}}

    # texture_env_combine  {{{
    cdef int COMBINE "GL_COMBINE"
    cdef int COMBINE_RGB "GL_COMBINE_RGB"
    cdef int COMBINE_ALPHA "GL_COMBINE_ALPHA"
    cdef int SOURCE0_RGB "GL_SOURCE0_RGB"
    cdef int SOURCE1_RGB "GL_SOURCE1_RGB"
    cdef int SOURCE2_RGB "GL_SOURCE2_RGB"
    cdef int SOURCE0_ALPHA "GL_SOURCE0_ALPHA"
    cdef int SOURCE1_ALPHA "GL_SOURCE1_ALPHA"
    cdef int SOURCE2_ALPHA "GL_SOURCE2_ALPHA"
    cdef int OPERAND0_RGB "GL_OPERAND0_RGB"
    cdef int OPERAND1_RGB "GL_OPERAND1_RGB"
    cdef int OPERAND2_RGB "GL_OPERAND2_RGB"
    cdef int OPERAND0_ALPHA "GL_OPERAND0_ALPHA"
    cdef int OPERAND1_ALPHA "GL_OPERAND1_ALPHA"
    cdef int OPERAND2_ALPHA "GL_OPERAND2_ALPHA"
    cdef int RGB_SCALE "GL_RGB_SCALE"
    cdef int ADD_SIGNED "GL_ADD_SIGNED"
    cdef int INTERPOLATE "GL_INTERPOLATE"
    cdef int SUBTRACT "GL_SUBTRACT"
    cdef int CONSTANT "GL_CONSTANT"
    cdef int PRIMARY_COLOR "GL_PRIMARY_COLOR"
    cdef int PREVIOUS "GL_PREVIOUS"
    # texture_env_combine  }}}

    # texture_env_dot3  {{{
    cdef int DOT3_RGB "GL_DOT3_RGB"
    cdef int DOT3_RGBA "GL_DOT3_RGBA"
    # texture_env_dot3  }}}

    # texture_border_clamp  {{{
    cdef int CLAMP_TO_BORDER "GL_CLAMP_TO_BORDER"
    # texture_border_clamp  }}}

    # Constants }}}

    # Functions {{{

    # Miscellaneous {{{
    cdef void glClearIndex( GLfloat c )
    cdef void glClearColor( GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha )
    cdef void glClear( GLbitfield mask )
    cdef void glIndexMask( GLuint mask )
    cdef void glColorMask( GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha )
    cdef void glAlphaFunc( GLenum func, GLclampf ref )
    cdef void glBlendFunc( GLenum sfactor, GLenum dfactor )
    cdef void glLogicOp( GLenum opcode )
    cdef void glCullFace( GLenum mode )
    cdef void glFrontFace( GLenum mode )
    cdef void glPointSize( GLfloat size )
    cdef void glLineWidth( GLfloat width )
    cdef void glLineStipple( GLint factor, GLushort pattern )
    cdef void glPolygonMode( GLenum face, GLenum mode )
    cdef void glPolygonOffset( GLfloat factor, GLfloat units )
    cdef void glPolygonStipple( const GLubyte *mask )
    cdef void glGetPolygonStipple( GLubyte *mask )
    cdef void glEdgeFlag( GLboolean flag )
    cdef void glEdgeFlagv( const GLboolean *flag )
    cdef void glScissor( GLint x, GLint y, GLsizei width, GLsizei height)
    cdef void glClipPlane( GLenum plane, const GLdouble *equation )
    cdef void glGetClipPlane( GLenum plane, GLdouble *equation )
    cdef void glDrawBuffer( GLenum mode )
    cdef void glReadBuffer( GLenum mode )
    cdef void glEnable( GLenum cap )
    cdef void glDisable( GLenum cap )
    cdef GLboolean glIsEnabled( GLenum cap )
    # Miscellaneous }}}

    # GL 1.1 {{{
    cdef void glEnableClientState( GLenum cap )
    cdef void glDisableClientState( GLenum cap )
    cdef void glGetBooleanv( GLenum pname, GLboolean *params )
    cdef void glGetDoublev( GLenum pname, GLdouble *params )
    cdef void glGetFloatv( GLenum pname, GLfloat *params )
    cdef void glGetIntegerv( GLenum pname, GLint *params )
    cdef void glPushAttrib( GLbitfield mask )
    cdef void glPopAttrib( void )
    cdef void glPushClientAttrib( GLbitfield mask )
    cdef void glPopClientAttrib( void )
    cdef GLint glRenderMode( GLenum mode )
    cdef GLenum glGetError( void )
    cdef const GLubyte * glGetString( GLenum name )
    cdef void glFinish( void )
    cdef void glFlush( void )
    cdef void glHint( GLenum target, GLenum mode )
    # GL 1.1 }}}

    # Depth Buffer {{{
    cdef void glClearDepth( GLclampd depth )
    cdef void glDepthFunc( GLenum func )
    cdef void glDepthMask( GLboolean flag )
    cdef void glDepthRange( GLclampd near_val, GLclampd far_val )
    # Depth Buffer }}}

    # Accumulation Buffer {{{
    cdef void glClearAccum( GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha )
    cdef void glAccum( GLenum op, GLfloat value )
    # Accumulation Buffer }}}

    # Transformation {{{
    cdef void glMatrixMode( GLenum mode )
    cdef void glOrtho( GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble near_val, GLdouble far_val )
    cdef void glFrustum( GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble near_val, GLdouble far_val )
    cdef void glViewport( GLint x, GLint y, GLsizei width, GLsizei height )
    cdef void glPushMatrix( void )
    cdef void glPopMatrix( void )
    cdef void glLoadIdentity( void )
    cdef void glLoadMatrixd( const GLdouble *m )
    cdef void glLoadMatrixf( const GLfloat *m )
    cdef void glMultMatrixd( const GLdouble *m )
    cdef void glMultMatrixf( const GLfloat *m )
    cdef void glRotated( GLdouble angle, GLdouble x, GLdouble y, GLdouble z )
    cdef void glRotatef( GLfloat angle, GLfloat x, GLfloat y, GLfloat z )
    cdef void glScaled( GLdouble x, GLdouble y, GLdouble z )
    cdef void glScalef( GLfloat x, GLfloat y, GLfloat z )
    cdef void glTranslated( GLdouble x, GLdouble y, GLdouble z )
    cdef void glTranslatef( GLfloat x, GLfloat y, GLfloat z )
    # Transformation }}}

    # Display Lists {{{
    cdef GLboolean glIsList( GLuint list )
    cdef void glDeleteLists( GLuint list, GLsizei range )
    cdef GLuint glGenLists( GLsizei range )
    cdef void glNewList( GLuint list, GLenum mode )
    cdef void glEndList( void )
    cdef void glCallList( GLuint list )
    cdef void glCallLists( GLsizei n, GLenum type, const GLvoid *lists )
    cdef void glListBase( GLuint base )
    # Display Lists }}}

    # Vertex Arrays  (1.1) {{{
    cdef void glVertexPointer( GLint size, GLenum type, GLsizei stride, const GLvoid *ptr )
    cdef void glNormalPointer( GLenum type, GLsizei stride, const GLvoid *ptr )
    cdef void glColorPointer( GLint size, GLenum type, GLsizei stride, const GLvoid *ptr )
    cdef void glIndexPointer( GLenum type, GLsizei stride, const GLvoid *ptr )
    cdef void glTexCoordPointer( GLint size, GLenum type, GLsizei stride, const GLvoid *ptr )
    cdef void glEdgeFlagPointer( GLsizei stride, const GLvoid *ptr )
    cdef void glGetPointerv( GLenum pname, GLvoid **params )
    cdef void glArrayElement( GLint i )
    cdef void glDrawArrays( GLenum mode, GLint first, GLsizei count )
    cdef void glDrawElements( GLenum mode, GLsizei count, GLenum type, const GLvoid *indices )
    cdef void glInterleavedArrays( GLenum format, GLsizei stride, const GLvoid *pointer )
    # Vertex Arrays  (1.1) }}}

    # Lighting {{{
    cdef void glShadeModel( GLenum mode )
    cdef void glLightf( GLenum light, GLenum pname, GLfloat param )
    cdef void glLighti( GLenum light, GLenum pname, GLint param )
    cdef void glLightfv( GLenum light, GLenum pname, const GLfloat *params )
    cdef void glLightiv( GLenum light, GLenum pname, const GLint *params )
    cdef void glGetLightfv( GLenum light, GLenum pname, GLfloat *params )
    cdef void glGetLightiv( GLenum light, GLenum pname, GLint *params )
    cdef void glLightModelf( GLenum pname, GLfloat param )
    cdef void glLightModeli( GLenum pname, GLint param )
    cdef void glLightModelfv( GLenum pname, const GLfloat *params )
    cdef void glLightModeliv( GLenum pname, const GLint *params )
    cdef void glMaterialf( GLenum face, GLenum pname, GLfloat param )
    cdef void glMateriali( GLenum face, GLenum pname, GLint param )
    cdef void glMaterialfv( GLenum face, GLenum pname, const GLfloat *params )
    cdef void glMaterialiv( GLenum face, GLenum pname, const GLint *params )
    cdef void glGetMaterialfv( GLenum face, GLenum pname, GLfloat *params )
    cdef void glGetMaterialiv( GLenum face, GLenum pname, GLint *params )
    cdef void glColorMaterial( GLenum face, GLenum mode )
    # Lighting }}}

    # Raster functions {{{
    cdef void glPixelZoom( GLfloat xfactor, GLfloat yfactor )
    cdef void glPixelStoref( GLenum pname, GLfloat param )
    cdef void glPixelStorei( GLenum pname, GLint param )
    cdef void glPixelTransferf( GLenum pname, GLfloat param )
    cdef void glPixelTransferi( GLenum pname, GLint param )
    cdef void glPixelMapfv( GLenum map, GLsizei mapsize, const GLfloat *values )
    cdef void glPixelMapuiv( GLenum map, GLsizei mapsize, const GLuint *values )
    cdef void glPixelMapusv( GLenum map, GLsizei mapsize, const GLushort *values )
    cdef void glGetPixelMapfv( GLenum map, GLfloat *values )
    cdef void glGetPixelMapuiv( GLenum map, GLuint *values )
    cdef void glGetPixelMapusv( GLenum map, GLushort *values )
    cdef void glBitmap( GLsizei width, GLsizei height, GLfloat xorig, GLfloat yorig, GLfloat xmove, GLfloat ymove, const GLubyte *bitmap )
    cdef void glReadPixels( GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels )
    cdef void glDrawPixels( GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *pixels )
    cdef void glCopyPixels( GLint x, GLint y, GLsizei width, GLsizei height, GLenum type )
    # Raster functions }}}

    # Stenciling {{{
    cdef void glStencilFunc( GLenum func, GLint ref, GLuint mask )
    cdef void glStencilMask( GLuint mask )
    cdef void glStencilOp( GLenum fail, GLenum zfail, GLenum zpass )
    cdef void glClearStencil( GLint s )
    # Stenciling }}}

    # Texture mapping {{{
    cdef void glTexGend( GLenum coord, GLenum pname, GLdouble param )
    cdef void glTexGenf( GLenum coord, GLenum pname, GLfloat param )
    cdef void glTexGeni( GLenum coord, GLenum pname, GLint param )
    cdef void glTexGendv( GLenum coord, GLenum pname, const GLdouble *params )
    cdef void glTexGenfv( GLenum coord, GLenum pname, const GLfloat *params )
    cdef void glTexGeniv( GLenum coord, GLenum pname, const GLint *params )
    cdef void glGetTexGendv( GLenum coord, GLenum pname, GLdouble *params )
    cdef void glGetTexGenfv( GLenum coord, GLenum pname, GLfloat *params )
    cdef void glGetTexGeniv( GLenum coord, GLenum pname, GLint *params )
    cdef void glTexEnvf( GLenum target, GLenum pname, GLfloat param )
    cdef void glTexEnvi( GLenum target, GLenum pname, GLint param )
    cdef void glTexEnvfv( GLenum target, GLenum pname, const GLfloat *params )
    cdef void glTexEnviv( GLenum target, GLenum pname, const GLint *params )
    cdef void glGetTexEnvfv( GLenum target, GLenum pname, GLfloat *params )
    cdef void glGetTexEnviv( GLenum target, GLenum pname, GLint *params )
    cdef void glTexParameterf( GLenum target, GLenum pname, GLfloat param )
    cdef void glTexParameteri( GLenum target, GLenum pname, GLint param )
    cdef void glTexParameterfv( GLenum target, GLenum pname, const GLfloat *params )
    cdef void glTexParameteriv( GLenum target, GLenum pname, const GLint *params )
    cdef void glGetTexParameterfv( GLenum target, GLenum pname, GLfloat *params)
    cdef void glGetTexParameteriv( GLenum target, GLenum pname, GLint *params )
    cdef void glGetTexLevelParameterfv( GLenum target, GLint level, GLenum pname, GLfloat *params )
    cdef void glGetTexLevelParameteriv( GLenum target, GLint level, GLenum pname, GLint *params )
    cdef void glTexImage1D( GLenum target, GLint level, GLint internalFormat, GLsizei width, GLint border, GLenum format, GLenum type, const GLvoid *pixels )
    cdef void glTexImage2D( GLenum target, GLint level, GLint internalFormat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels )
    cdef void glGetTexImage( GLenum target, GLint level, GLenum format, GLenum type, GLvoid *pixels )

    cdef void glGenTextures( GLsizei n, GLuint *textures )
    cdef void glDeleteTextures( GLsizei n, const GLuint *textures)
    cdef void glBindTexture( GLenum target, GLuint texture )
    cdef void glPrioritizeTextures( GLsizei n, const GLuint *textures, const GLclampf *priorities )
    cdef GLboolean glAreTexturesResident( GLsizei n, const GLuint *textures, GLboolean *residences )
    cdef GLboolean glIsTexture( GLuint texture )
    cdef void glTexSubImage1D( GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const GLvoid *pixels )
    cdef void glTexSubImage2D( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *pixels )
    cdef void glCopyTexImage1D( GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border )
    cdef void glCopyTexImage2D( GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border )
    cdef void glCopyTexSubImage1D( GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width )
    cdef void glCopyTexSubImage2D( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height )
    # Texture mapping }}}

    # Evaluators {{{
    cdef void glMap1d( GLenum target, GLdouble u1, GLdouble u2, GLint stride, GLint order, const GLdouble *points )
    cdef void glMap1f( GLenum target, GLfloat u1, GLfloat u2, GLint stride, GLint order, const GLfloat *points )
    cdef void glMap2d( GLenum target, GLdouble u1, GLdouble u2, GLint ustride, GLint uorder, GLdouble v1, GLdouble v2, GLint vstride, GLint vorder, const GLdouble *points )
    cdef void glMap2f( GLenum target, GLfloat u1, GLfloat u2, GLint ustride, GLint uorder, GLfloat v1, GLfloat v2, GLint vstride, GLint vorder, const GLfloat *points )
    cdef void glGetMapdv( GLenum target, GLenum query, GLdouble *v )
    cdef void glGetMapfv( GLenum target, GLenum query, GLfloat *v )
    cdef void glGetMapiv( GLenum target, GLenum query, GLint *v )
    cdef void glEvalCoord1d( GLdouble u )
    cdef void glEvalCoord1f( GLfloat u )
    cdef void glEvalCoord1dv( const GLdouble *u )
    cdef void glEvalCoord1fv( const GLfloat *u )
    cdef void glEvalCoord2d( GLdouble u, GLdouble v )
    cdef void glEvalCoord2f( GLfloat u, GLfloat v )
    cdef void glEvalCoord2dv( const GLdouble *u )
    cdef void glEvalCoord2fv( const GLfloat *u )
    cdef void glMapGrid1d( GLint un, GLdouble u1, GLdouble u2 )
    cdef void glMapGrid1f( GLint un, GLfloat u1, GLfloat u2 )
    cdef void glMapGrid2d( GLint un, GLdouble u1, GLdouble u2, GLint vn, GLdouble v1, GLdouble v2 )
    cdef void glMapGrid2f( GLint un, GLfloat u1, GLfloat u2, GLint vn, GLfloat v1, GLfloat v2 )
    cdef void glEvalPoint1( GLint i )
    cdef void glEvalPoint2( GLint i, GLint j )
    cdef void glEvalMesh1( GLenum mode, GLint i1, GLint i2 )
    cdef void glEvalMesh2( GLenum mode, GLint i1, GLint i2, GLint j1, GLint j2 )
    # Evaluators }}}

    # Fog {{{
    cdef void glFogf( GLenum pname, GLfloat param )
    cdef void glFogi( GLenum pname, GLint param )
    cdef void glFogfv( GLenum pname, const GLfloat *params )
    cdef void glFogiv( GLenum pname, const GLint *params )
    # Fog }}}

    # OpenGL 1.2 {{{
    cdef void glDrawRangeElements( GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const GLvoid *indices )
    cdef void glTexImage3D( GLenum target, GLint level, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const GLvoid *pixels )
    cdef void glTexSubImage3D( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const GLvoid *pixels)
    cdef void glCopyTexSubImage3D( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height )
    # OpenGL 1.2 }}}

    # GL_ARB_imaging {{{
    cdef void glColorTable( GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const GLvoid *table )
    cdef void glColorSubTable( GLenum target, GLsizei start, GLsizei count, GLenum format, GLenum type, const GLvoid *data )
    cdef void glColorTableParameteriv(GLenum target, GLenum pname, const GLint *params)
    cdef void glColorTableParameterfv(GLenum target, GLenum pname, const GLfloat *params)
    cdef void glCopyColorSubTable( GLenum target, GLsizei start, GLint x, GLint y, GLsizei width )
    cdef void glCopyColorTable( GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width )
    cdef void glGetColorTable( GLenum target, GLenum format, GLenum type, GLvoid *table )
    cdef void glGetColorTableParameterfv( GLenum target, GLenum pname, GLfloat *params )
    cdef void glGetColorTableParameteriv( GLenum target, GLenum pname, GLint *params )
    cdef void glBlendEquation( GLenum mode )
    cdef void glBlendColor( GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha )
    cdef void glHistogram( GLenum target, GLsizei width, GLenum internalformat, GLboolean sink )
    cdef void glResetHistogram( GLenum target )
    cdef void glGetHistogram( GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values )
    cdef void glGetHistogramParameterfv( GLenum target, GLenum pname, GLfloat *params )
    cdef void glGetHistogramParameteriv( GLenum target, GLenum pname, GLint *params )
    cdef void glMinmax( GLenum target, GLenum internalformat, GLboolean sink )
    cdef void glResetMinmax( GLenum target )
    cdef void glGetMinmax( GLenum target, GLboolean reset, GLenum format, GLenum types, GLvoid *values )
    cdef void glGetMinmaxParameterfv( GLenum target, GLenum pname, GLfloat *params )
    cdef void glGetMinmaxParameteriv( GLenum target, GLenum pname, GLint *params )
    cdef void glConvolutionFilter1D( GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const GLvoid *image )
    cdef void glConvolutionFilter2D( GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *image )
    cdef void glConvolutionParameterf( GLenum target, GLenum pname, GLfloat params )
    cdef void glConvolutionParameterfv( GLenum target, GLenum pname, const GLfloat *params )
    cdef void glConvolutionParameteri( GLenum target, GLenum pname, GLint params )
    cdef void glConvolutionParameteriv( GLenum target, GLenum pname, const GLint *params )
    cdef void glCopyConvolutionFilter1D( GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width )
    cdef void glCopyConvolutionFilter2D( GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height)
    cdef void glGetConvolutionFilter( GLenum target, GLenum format, GLenum type, GLvoid *image )
    cdef void glGetConvolutionParameterfv( GLenum target, GLenum pname, GLfloat *params )
    cdef void glGetConvolutionParameteriv( GLenum target, GLenum pname, GLint *params )
    cdef void glSeparableFilter2D( GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *row, const GLvoid *column )
    cdef void glGetSeparableFilter( GLenum target, GLenum format, GLenum type, GLvoid *row, GLvoid *column, GLvoid *span )
    # GL_ARB_imaging }}}

    # OpenGL 1.3 {{{
    cdef void glActiveTexture( GLenum texture )
    cdef void glClientActiveTexture( GLenum texture )
    cdef void glCompressedTexImage1D( GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const GLvoid *data )
    cdef void glCompressedTexImage2D( GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const GLvoid *data )
    cdef void glCompressedTexImage3D( GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const GLvoid *data )
    cdef void glCompressedTexSubImage1D( GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const GLvoid *data )
    cdef void glCompressedTexSubImage2D( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const GLvoid *data )
    cdef void glCompressedTexSubImage3D( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const GLvoid *data )
    cdef void glGetCompressedTexImage( GLenum target, GLint lod, GLvoid *img )
    cdef void glLoadTransposeMatrixd( const GLdouble m[16] )
    cdef void glLoadTransposeMatrixf( const GLfloat m[16] )
    cdef void glMultTransposeMatrixd( const GLdouble m[16] )
    cdef void glMultTransposeMatrixf( const GLfloat m[16] )
    cdef void glSampleCoverage( GLclampf value, GLboolean invert )
    # OpenGL 1.3 }}}

    # Functions }}}

