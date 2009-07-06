cdef extern from 'GL/gl.h':
    # Constants {{{        

    enum:
        # Boolean values {{{
        GL_FALSE
        GL_TRUE
        # Boolean Values }}}
    
        # Data types  {{{
        GL_BYTE
        GL_UNSIGNED_BYTE
        GL_SHORT
        GL_UNSIGNED_SHORT
        GL_INT
        GL_UNSIGNED_INT
        GL_FLOAT
        GL_2_BYTES
        GL_3_BYTES
        GL_4_BYTES
        GL_DOUBLE
        # Data types  }}}
    
        # Primitives  {{{
        GL_POINTS
        GL_LINES
        GL_LINE_LOOP
        GL_LINE_STRIP
        GL_TRIANGLES
        GL_TRIANGLE_STRIP
        GL_TRIANGLE_FAN
        GL_QUADS
        GL_QUAD_STRIP
        GL_POLYGON
        # Primitives  }}}
    
        # Vertex Arrays  {{{
        GL_VERTEX_ARRAY
        GL_NORMAL_ARRAY
        GL_COLOR_ARRAY
        GL_INDEX_ARRAY
        GL_TEXTURE_COORD_ARRAY
        GL_EDGE_FLAG_ARRAY
        GL_VERTEX_ARRAY_SIZE
        GL_VERTEX_ARRAY_TYPE
        GL_VERTEX_ARRAY_STRIDE
        GL_NORMAL_ARRAY_TYPE
        GL_NORMAL_ARRAY_STRIDE
        GL_COLOR_ARRAY_SIZE
        GL_COLOR_ARRAY_TYPE
        GL_COLOR_ARRAY_STRIDE
        GL_INDEX_ARRAY_TYPE
        GL_INDEX_ARRAY_STRIDE
        GL_TEXTURE_COORD_ARRAY_SIZE
        GL_TEXTURE_COORD_ARRAY_TYPE
        GL_TEXTURE_COORD_ARRAY_STRIDE
        GL_EDGE_FLAG_ARRAY_STRIDE
        GL_VERTEX_ARRAY_POINTER
        GL_NORMAL_ARRAY_POINTER
        GL_COLOR_ARRAY_POINTER
        GL_INDEX_ARRAY_POINTER
        GL_TEXTURE_COORD_ARRAY_POINTER
        GL_EDGE_FLAG_ARRAY_POINTER
        GL_V2F
        GL_V3F
        GL_C4UB_V2F
        GL_C4UB_V3F
        GL_C3F_V3F
        GL_N3F_V3F
        GL_C4F_N3F_V3F
        GL_T2F_V3F
        GL_T4F_V4F
        GL_T2F_C4UB_V3F
        GL_T2F_C3F_V3F
        GL_T2F_N3F_V3F
        GL_T2F_C4F_N3F_V3F
        GL_T4F_C4F_N3F_V4F
        # Vertex Arrays  }}}
    
        # Matrix Mode {{{
        GL_MATRIX_MODE
        GL_MODELVIEW
        GL_PROJECTION
        GL_TEXTURE
        # Matrix Mode  }}}
    
        # Points {{{
        GL_POINT_SMOOTH
        GL_POINT_SIZE
        GL_POINT_SIZE_GRANULARITY
        GL_POINT_SIZE_RANGE
        # Points  }}}
    
        # Lines {{{
        GL_LINE_SMOOTH
        GL_LINE_STIPPLE
        GL_LINE_STIPPLE_PATTERN
        GL_LINE_STIPPLE_REPEAT
        GL_LINE_WIDTH
        GL_LINE_WIDTH_GRANULARITY
        GL_LINE_WIDTH_RANGE
        # Lines }}}
    
        # Polygons {{{
        GL_POINT
        GL_LINE
        GL_FILL
        GL_CW
        GL_CCW
        GL_FRONT
        GL_BACK
        GL_POLYGON_MODE
        GL_POLYGON_SMOOTH
        GL_POLYGON_STIPPLE
        GL_EDGE_FLAG
        GL_CULL_FACE
        GL_CULL_FACE_MODE
        GL_FRONT_FACE
        GL_POLYGON_OFFSET_FACTOR
        GL_POLYGON_OFFSET_UNITS
        GL_POLYGON_OFFSET_POINT
        GL_POLYGON_OFFSET_LINE
        GL_POLYGON_OFFSET_FILL
        # Polygons }}}
    
        # Display {{{
        GL_COMPILE
        GL_COMPILE_AND_EXECUTE
        GL_LIST_BASE
        GL_LIST_INDEX
        GL_LIST_MODE
        # Display }}}
    
        # Depth {{{
        GL_NEVER
        GL_LESS
        GL_EQUAL
        GL_LEQUAL
        GL_GREATER
        GL_NOTEQUAL
        GL_GEQUAL
        GL_ALWAYS
        GL_DEPTH_TEST
        GL_DEPTH_BITS
        GL_DEPTH_CLEAR_VALUE
        GL_DEPTH_FUNC
        GL_DEPTH_RANGE
        GL_DEPTH_WRITEMASK
        GL_DEPTH_COMPONENT
        # Depth }}}
    
        # Lighting {{{
        GL_LIGHTING
        GL_LIGHT0
        GL_LIGHT1
        GL_LIGHT2
        GL_LIGHT3
        GL_LIGHT4
        GL_LIGHT5
        GL_LIGHT6
        GL_LIGHT7
        GL_SPOT_EXPONENT
        GL_SPOT_CUTOFF
        GL_CONSTANT_ATTENUATION
        GL_LINEAR_ATTENUATION
        GL_QUADRATIC_ATTENUATION
        GL_AMBIENT
        GL_DIFFUSE
        GL_SPECULAR
        GL_SHININESS
        GL_EMISSION
        GL_POSITION
        GL_SPOT_DIRECTION
        GL_AMBIENT_AND_DIFFUSE
        GL_COLOR_INDEXES
        GL_LIGHT_MODEL_TWO_SIDE
        GL_LIGHT_MODEL_LOCAL_VIEWER
        GL_LIGHT_MODEL_AMBIENT
        GL_FRONT_AND_BACK
        GL_SHADE_MODEL
        GL_FLAT
        GL_SMOOTH
        GL_COLOR_MATERIAL
        GL_COLOR_MATERIAL_FACE
        GL_COLOR_MATERIAL_PARAMETER
        GL_NORMALIZE
        # Lighting }}}
    
        # User {{{
        GL_CLIP_PLANE0
        GL_CLIP_PLANE1
        GL_CLIP_PLANE2
        GL_CLIP_PLANE3
        GL_CLIP_PLANE4
        GL_CLIP_PLANE5
        # User }}}
    
        # Accumulation {{{
        GL_ACCUM_RED_BITS
        GL_ACCUM_GREEN_BITS
        GL_ACCUM_BLUE_BITS
        GL_ACCUM_ALPHA_BITS
        GL_ACCUM_CLEAR_VALUE
        GL_ACCUM
        GL_ADD
        GL_LOAD
        GL_MULT
        GL_RETURN
        # Accumulation }}}
    
        # Alpha {{{
        GL_ALPHA_TEST
        GL_ALPHA_TEST_REF
        GL_ALPHA_TEST_FUNC
        # Alpha }}}
    
        # Blending {{{
        GL_BLEND
        GL_BLEND_SRC
        GL_BLEND_DST
        GL_ZERO
        GL_ONE
        GL_SRC_COLOR
        GL_ONE_MINUS_SRC_COLOR
        GL_SRC_ALPHA
        GL_ONE_MINUS_SRC_ALPHA
        GL_DST_ALPHA
        GL_ONE_MINUS_DST_ALPHA
        GL_DST_COLOR
        GL_ONE_MINUS_DST_COLOR
        GL_SRC_ALPHA_SATURATE
        # Blending }}}
    
        # Render {{{
        GL_FEEDBACK
        GL_RENDER
        GL_SELECT
        # Render }}}
    
        # Feedback {{{
        GL_2D
        GL_3D
        GL_3D_COLOR
        GL_3D_COLOR_TEXTURE
        GL_4D_COLOR_TEXTURE
        GL_POINT_TOKEN
        GL_LINE_TOKEN
        GL_LINE_RESET_TOKEN
        GL_POLYGON_TOKEN
        GL_BITMAP_TOKEN
        GL_DRAW_PIXEL_TOKEN
        GL_COPY_PIXEL_TOKEN
        GL_PASS_THROUGH_TOKEN
        GL_FEEDBACK_BUFFER_POINTER
        GL_FEEDBACK_BUFFER_SIZE
        GL_FEEDBACK_BUFFER_TYPE
        # Feedback }}}
    
        # Selection {{{
        GL_SELECTION_BUFFER_POINTER
        GL_SELECTION_BUFFER_SIZE
        # Selection }}}
    
        # Fog {{{
        GL_FOG
        GL_FOG_MODE
        GL_FOG_DENSITY
        GL_FOG_COLOR
        GL_FOG_INDEX
        GL_FOG_START
        GL_FOG_END
        GL_LINEAR
        GL_EXP
        GL_EXP2
        # Fog }}}
    
        # Logic {{{
        GL_LOGIC_OP
        GL_INDEX_LOGIC_OP
        GL_COLOR_LOGIC_OP
        GL_LOGIC_OP_MODE
        GL_CLEAR
        GL_SET
        GL_COPY
        GL_COPY_INVERTED
        GL_NOOP
        GL_INVERT
        GL_AND
        GL_NAND
        GL_OR
        GL_NOR
        GL_XOR
        GL_EQUIV
        GL_AND_REVERSE
        GL_AND_INVERTED
        GL_OR_REVERSE
        GL_OR_INVERTED
        # Logic }}}
    
        # Stencil {{{
        GL_STENCIL_BITS
        GL_STENCIL_TEST
        GL_STENCIL_CLEAR_VALUE
        GL_STENCIL_FUNC
        GL_STENCIL_VALUE_MASK
        GL_STENCIL_FAIL
        GL_STENCIL_PASS_DEPTH_FAIL
        GL_STENCIL_PASS_DEPTH_PASS
        GL_STENCIL_REF
        GL_STENCIL_WRITEMASK
        GL_STENCIL_INDEX
        GL_KEEP
        GL_REPLACE
        GL_INCR
        GL_DECR
        # Stencil }}}
    
        # Buffers {{{
        GL_NONE
        GL_LEFT
        GL_RIGHT
        GL_FRONT_LEFT
        GL_FRONT_RIGHT
        GL_BACK_LEFT
        GL_BACK_RIGHT
        GL_AUX0
        GL_AUX1
        GL_AUX2
        GL_AUX3
        GL_COLOR_INDEX
        GL_RED
        GL_GREEN
        GL_BLUE
        GL_ALPHA
        GL_LUMINANCE
        GL_LUMINANCE_ALPHA
        GL_ALPHA_BITS
        GL_RED_BITS
        GL_GREEN_BITS
        GL_BLUE_BITS
        GL_INDEX_BITS
        GL_SUBPIXEL_BITS
        GL_AUX_BUFFERS
        GL_READ_BUFFER
        GL_DRAW_BUFFER
        GL_DOUBLEBUFFER
        GL_STEREO
        GL_BITMAP
        GL_COLOR
        GL_DEPTH
        GL_STENCIL
        GL_DITHER
        GL_RGB
        GL_RGBA
        # Buffers }}}
    
        # Implementation {{{
        GL_MAX_LIST_NESTING
        GL_MAX_EVAL_ORDER
        GL_MAX_LIGHTS
        GL_MAX_CLIP_PLANES
        GL_MAX_TEXTURE_SIZE
        GL_MAX_PIXEL_MAP_TABLE
        GL_MAX_ATTRIB_STACK_DEPTH
        GL_MAX_MODELVIEW_STACK_DEPTH
        GL_MAX_NAME_STACK_DEPTH
        GL_MAX_PROJECTION_STACK_DEPTH
        GL_MAX_TEXTURE_STACK_DEPTH
        GL_MAX_VIEWPORT_DIMS
        GL_MAX_CLIENT_ATTRIB_STACK_DEPTH
        # Implementation }}}
    
        # Gets {{{
        GL_ATTRIB_STACK_DEPTH
        GL_CLIENT_ATTRIB_STACK_DEPTH
        GL_COLOR_CLEAR_VALUE
        GL_COLOR_WRITEMASK
        GL_CURRENT_INDEX
        GL_CURRENT_COLOR
        GL_CURRENT_NORMAL
        GL_CURRENT_RASTER_COLOR
        GL_CURRENT_RASTER_DISTANCE
        GL_CURRENT_RASTER_INDEX
        GL_CURRENT_RASTER_POSITION
        GL_CURRENT_RASTER_TEXTURE_COORDS
        GL_CURRENT_RASTER_POSITION_VALID
        GL_CURRENT_TEXTURE_COORDS
        GL_INDEX_CLEAR_VALUE
        GL_INDEX_MODE
        GL_INDEX_WRITEMASK
        GL_MODELVIEW_MATRIX
        GL_MODELVIEW_STACK_DEPTH
        GL_NAME_STACK_DEPTH
        GL_PROJECTION_MATRIX
        GL_PROJECTION_STACK_DEPTH
        GL_RENDER_MODE
        GL_RGBA_MODE
        GL_TEXTURE_MATRIX
        GL_TEXTURE_STACK_DEPTH
        GL_VIEWPORT
        # Gets }}}
    
        # Evaluators {{{
        GL_AUTO_NORMAL
        GL_MAP1_COLOR_4
        GL_MAP1_INDEX
        GL_MAP1_NORMAL
        GL_MAP1_TEXTURE_COORD_1
        GL_MAP1_TEXTURE_COORD_2
        GL_MAP1_TEXTURE_COORD_3
        GL_MAP1_TEXTURE_COORD_4
        GL_MAP1_VERTEX_3
        GL_MAP1_VERTEX_4
        GL_MAP2_COLOR_4
        GL_MAP2_INDEX
        GL_MAP2_NORMAL
        GL_MAP2_TEXTURE_COORD_1
        GL_MAP2_TEXTURE_COORD_2
        GL_MAP2_TEXTURE_COORD_3
        GL_MAP2_TEXTURE_COORD_4
        GL_MAP2_VERTEX_3
        GL_MAP2_VERTEX_4
        GL_MAP1_GRID_DOMAIN
        GL_MAP1_GRID_SEGMENTS
        GL_MAP2_GRID_DOMAIN
        GL_MAP2_GRID_SEGMENTS
        GL_COEFF
        GL_ORDER
        GL_DOMAIN
        # Evaluators }}}
    
        # H{{{
        GL_PERSPECTIVE_CORRECTION_HINT
        GL_POINT_SMOOTH_HINT
        GL_LINE_SMOOTH_HINT
        GL_POLYGON_SMOOTH_HINT
        GL_FOG_HINT
        GL_DONT_CARE
        GL_FASTEST
        GL_NICEST
        # H}}}
    
        # Scissor {{{
        GL_SCISSOR_BOX
        GL_SCISSOR_TEST
        # Scissor }}}
    
        # Pixel {{{
        GL_MAP_COLOR
        GL_MAP_STENCIL
        GL_INDEX_SHIFT
        GL_INDEX_OFFSET
        GL_RED_SCALE
        GL_RED_BIAS
        GL_GREEN_SCALE
        GL_GREEN_BIAS
        GL_BLUE_SCALE
        GL_BLUE_BIAS
        GL_ALPHA_SCALE
        GL_ALPHA_BIAS
        GL_DEPTH_SCALE
        GL_DEPTH_BIAS
        GL_PIXEL_MAP_S_TO_S_SIZE
        GL_PIXEL_MAP_I_TO_I_SIZE
        GL_PIXEL_MAP_I_TO_R_SIZE
        GL_PIXEL_MAP_I_TO_G_SIZE
        GL_PIXEL_MAP_I_TO_B_SIZE
        GL_PIXEL_MAP_I_TO_A_SIZE
        GL_PIXEL_MAP_R_TO_R_SIZE
        GL_PIXEL_MAP_G_TO_G_SIZE
        GL_PIXEL_MAP_B_TO_B_SIZE
        GL_PIXEL_MAP_A_TO_A_SIZE
        GL_PIXEL_MAP_S_TO_S
        GL_PIXEL_MAP_I_TO_I
        GL_PIXEL_MAP_I_TO_R
        GL_PIXEL_MAP_I_TO_G
        GL_PIXEL_MAP_I_TO_B
        GL_PIXEL_MAP_I_TO_A
        GL_PIXEL_MAP_R_TO_R
        GL_PIXEL_MAP_G_TO_G
        GL_PIXEL_MAP_B_TO_B
        GL_PIXEL_MAP_A_TO_A
        GL_PACK_ALIGNMENT
        GL_PACK_LSB_FIRST
        GL_PACK_ROW_LENGTH
        GL_PACK_SKIP_PIXELS
        GL_PACK_SKIP_ROWS
        GL_PACK_SWAP_BYTES
        GL_UNPACK_ALIGNMENT
        GL_UNPACK_LSB_FIRST
        GL_UNPACK_ROW_LENGTH
        GL_UNPACK_SKIP_PIXELS
        GL_UNPACK_SKIP_ROWS
        GL_UNPACK_SWAP_BYTES
        GL_ZOOM_X
        GL_ZOOM_Y
        # Pixel }}}
    
        # Texture {{{
        GL_TEXTURE_ENV
        GL_TEXTURE_ENV_MODE
        GL_TEXTURE_1D
        GL_TEXTURE_2D
        GL_TEXTURE_WRAP_S
        GL_TEXTURE_WRAP_T
        GL_TEXTURE_MAG_FILTER
        GL_TEXTURE_MIN_FILTER
        GL_TEXTURE_ENV_COLOR
        GL_TEXTURE_GEN_S
        GL_TEXTURE_GEN_T
        GL_TEXTURE_GEN_MODE
        GL_TEXTURE_BORDER_COLOR
        GL_TEXTURE_WIDTH
        GL_TEXTURE_HEIGHT
        GL_TEXTURE_BORDER
        GL_TEXTURE_COMPONENTS
        GL_TEXTURE_RED_SIZE
        GL_TEXTURE_GREEN_SIZE
        GL_TEXTURE_BLUE_SIZE
        GL_TEXTURE_ALPHA_SIZE
        GL_TEXTURE_LUMINANCE_SIZE
        GL_TEXTURE_INTENSITY_SIZE
        GL_NEAREST_MIPMAP_NEAREST
        GL_NEAREST_MIPMAP_LINEAR
        GL_LINEAR_MIPMAP_NEAREST
        GL_LINEAR_MIPMAP_LINEAR
        GL_OBJECT_LINEAR
        GL_OBJECT_PLANE
        GL_EYE_LINEAR
        GL_EYE_PLANE
        GL_SPHERE_MAP
        GL_DECAL
        GL_MODULATE
        GL_NEAREST
        GL_REPEAT
        GL_CLAMP
        GL_S
        GL_T
        GL_R
        GL_Q
        GL_TEXTURE_GEN_R
        GL_TEXTURE_GEN_Q
        # Texture }}}
    
        # Utility {{{
        GL_VENDOR
        GL_RENDERER
        GL_VERSION
        GL_EXTENSIONS
        # Utility }}}
    
        # Errors {{{
        GL_NO_ERROR
        GL_INVALID_ENUM
        GL_INVALID_VALUE
        GL_INVALID_OPERATION
        GL_STACK_OVERFLOW
        GL_STACK_UNDERFLOW
        GL_OUT_OF_MEMORY
        # Errors }}}
    
        # glPush {{{
        GL_CURRENT_BIT
        GL_POINT_BIT
        GL_LINE_BIT
        GL_POLYGON_BIT
        GL_POLYGON_STIPPLE_BIT
        GL_PIXEL_MODE_BIT
        GL_LIGHTING_BIT
        GL_FOG_BIT
        GL_DEPTH_BUFFER_BIT
        GL_ACCUM_BUFFER_BIT
        GL_STENCIL_BUFFER_BIT
        GL_VIEWPORT_BIT
        GL_TRANSFORM_BIT
        GL_ENABLE_BIT
        GL_COLOR_BUFFER_BIT
        GL_HINT_BIT
        GL_EVAL_BIT
        GL_LIST_BIT
        GL_TEXTURE_BIT
        GL_SCISSOR_BIT
        GL_ALL_ATTRIB_BITS
        # glPush }}}
    
    
        # OpenGL {{{
        GL_PROXY_TEXTURE_1D
        GL_PROXY_TEXTURE_2D
        GL_TEXTURE_PRIORITY
        GL_TEXTURE_RESIDENT
        GL_TEXTURE_BINDING_1D
        GL_TEXTURE_BINDING_2D
        GL_TEXTURE_INTERNAL_FORMAT
        GL_ALPHA4
        GL_ALPHA8
        GL_ALPHA12
        GL_ALPHA16
        GL_LUMINANCE4
        GL_LUMINANCE8
        GL_LUMINANCE12
        GL_LUMINANCE16
        GL_LUMINANCE4_ALPHA4
        GL_LUMINANCE6_ALPHA2
        GL_LUMINANCE8_ALPHA8
        GL_LUMINANCE12_ALPHA4
        GL_LUMINANCE12_ALPHA12
        GL_LUMINANCE16_ALPHA16
        GL_INTENSITY
        GL_INTENSITY4
        GL_INTENSITY8
        GL_INTENSITY12
        GL_INTENSITY16
        GL_R3_G3_B2
        GL_RGB4
        GL_RGB5
        GL_RGB8
        GL_RGB10
        GL_RGB12
        GL_RGB16
        GL_RGBA2
        GL_RGBA4
        GL_RGB5_A1
        GL_RGBA8
        GL_RGB10_A2
        GL_RGBA12
        GL_RGBA16
        GL_CLIENT_PIXEL_STORE_BIT
        GL_CLIENT_VERTEX_ARRAY_BIT
        GL_ALL_CLIENT_ATTRIB_BITS
        GL_CLIENT_ALL_ATTRIB_BITS
        # OpenGL }}}

        # GL Imaging {{{
        GL_CONSTANT_COLOR
        GL_ONE_MINUS_CONSTANT_COLOR
        GL_CONSTANT_ALPHA
        GL_ONE_MINUS_CONSTANT_ALPHA
        GL_COLOR_TABLE
        GL_POST_CONVOLUTION_COLOR_TABLE
        GL_POST_COLOR_MATRIX_COLOR_TABLE
        GL_PROXY_COLOR_TABLE
        GL_PROXY_POST_CONVOLUTION_COLOR_TABLE
        GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE
        GL_COLOR_TABLE_SCALE
        GL_COLOR_TABLE_BIAS
        GL_COLOR_TABLE_FORMAT
        GL_COLOR_TABLE_WIDTH
        GL_COLOR_TABLE_RED_SIZE
        GL_COLOR_TABLE_GREEN_SIZE
        GL_COLOR_TABLE_BLUE_SIZE
        GL_COLOR_TABLE_ALPHA_SIZE
        GL_COLOR_TABLE_LUMINANCE_SIZE
        GL_COLOR_TABLE_INTENSITY_SIZE
        GL_CONVOLUTION_1D
        GL_CONVOLUTION_2D
        GL_SEPARABLE_2D
        GL_CONVOLUTION_BORDER_MODE
        GL_CONVOLUTION_FILTER_SCALE
        GL_CONVOLUTION_FILTER_BIAS
        GL_REDUCE
        GL_CONVOLUTION_FORMAT
        GL_CONVOLUTION_WIDTH
        GL_CONVOLUTION_HEIGHT
        GL_MAX_CONVOLUTION_WIDTH
        GL_MAX_CONVOLUTION_HEIGHT
        GL_POST_CONVOLUTION_RED_SCALE
        GL_POST_CONVOLUTION_GREEN_SCALE
        GL_POST_CONVOLUTION_BLUE_SCALE
        GL_POST_CONVOLUTION_ALPHA_SCALE
        GL_POST_CONVOLUTION_RED_BIAS
        GL_POST_CONVOLUTION_GREEN_BIAS
        GL_POST_CONVOLUTION_BLUE_BIAS
        GL_POST_CONVOLUTION_ALPHA_BIAS
        GL_CONSTANT_BORDER
        GL_REPLICATE_BORDER
        GL_CONVOLUTION_BORDER_COLOR
        GL_COLOR_MATRIX
        GL_COLOR_MATRIX_STACK_DEPTH
        GL_MAX_COLOR_MATRIX_STACK_DEPTH
        GL_POST_COLOR_MATRIX_RED_SCALE
        GL_POST_COLOR_MATRIX_GREEN_SCALE
        GL_POST_COLOR_MATRIX_BLUE_SCALE
        GL_POST_COLOR_MATRIX_ALPHA_SCALE
        GL_POST_COLOR_MATRIX_RED_BIAS
        GL_POST_COLOR_MATRIX_GREEN_BIAS
        GL_POST_COLOR_MATRIX_BLUE_BIAS
        GL_POST_COLOR_MATRIX_ALPHA_BIAS
        GL_HISTOGRAM
        GL_PROXY_HISTOGRAM
        GL_HISTOGRAM_WIDTH
        GL_HISTOGRAM_FORMAT
        GL_HISTOGRAM_RED_SIZE
        GL_HISTOGRAM_GREEN_SIZE
        GL_HISTOGRAM_BLUE_SIZE
        GL_HISTOGRAM_ALPHA_SIZE
        GL_HISTOGRAM_LUMINANCE_SIZE
        GL_HISTOGRAM_SINK
        GL_MINMAX
        GL_MINMAX_FORMAT
        GL_MINMAX_SINK
        GL_TABLE_TOO_LARGE
        GL_BLEND_EQUATION
        GL_MIN
        GL_MAX
        GL_FUNC_ADD
        GL_FUNC_SUBTRACT
        GL_FUNC_REVERSE_SUBTRACT
        GL_BLEND_COLOR
        # GL Imaging }}}

        # multitexture  {{{
        GL_TEXTURE0
        GL_TEXTURE1
        GL_TEXTURE2
        GL_TEXTURE3
        GL_TEXTURE4
        GL_TEXTURE5
        GL_TEXTURE6
        GL_TEXTURE7
        GL_TEXTURE8
        GL_TEXTURE9
        GL_TEXTURE10
        GL_TEXTURE11
        GL_TEXTURE12
        GL_TEXTURE13
        GL_TEXTURE14
        GL_TEXTURE15
        GL_TEXTURE16
        GL_TEXTURE17
        GL_TEXTURE18
        GL_TEXTURE19
        GL_TEXTURE20
        GL_TEXTURE21
        GL_TEXTURE22
        GL_TEXTURE23
        GL_TEXTURE24
        GL_TEXTURE25
        GL_TEXTURE26
        GL_TEXTURE27
        GL_TEXTURE28
        GL_TEXTURE29
        GL_TEXTURE30
        GL_TEXTURE31
        GL_ACTIVE_TEXTURE
        GL_CLIENT_ACTIVE_TEXTURE
        GL_MAX_TEXTURE_UNITS
        # multitexture  }}}

        # texture_cube_map  {{{
        GL_NORMAL_MAP
        GL_REFLECTION_MAP
        GL_TEXTURE_CUBE_MAP
        GL_TEXTURE_BINDING_CUBE_MAP
        GL_TEXTURE_CUBE_MAP_POSITIVE_X
        GL_TEXTURE_CUBE_MAP_NEGATIVE_X
        GL_TEXTURE_CUBE_MAP_POSITIVE_Y
        GL_TEXTURE_CUBE_MAP_NEGATIVE_Y
        GL_TEXTURE_CUBE_MAP_POSITIVE_Z
        GL_TEXTURE_CUBE_MAP_NEGATIVE_Z
        GL_PROXY_TEXTURE_CUBE_MAP
        GL_MAX_CUBE_MAP_TEXTURE_SIZE
        # texture_cube_map  }}}

        # texture_compression  {{{
        GL_COMPRESSED_ALPHA
        GL_COMPRESSED_LUMINANCE
        GL_COMPRESSED_LUMINANCE_ALPHA
        GL_COMPRESSED_INTENSITY
        GL_COMPRESSED_RGB
        GL_COMPRESSED_RGBA
        GL_TEXTURE_COMPRESSION_HINT
        GL_TEXTURE_COMPRESSED_IMAGE_SIZE
        GL_TEXTURE_COMPRESSED
        GL_NUM_COMPRESSED_TEXTURE_FORMATS
        GL_COMPRESSED_TEXTURE_FORMATS
        # texture_compression  }}}

        # multisample  {{{
        GL_MULTISAMPLE
        GL_SAMPLE_ALPHA_TO_COVERAGE
        GL_SAMPLE_ALPHA_TO_ONE
        GL_SAMPLE_COVERAGE
        GL_SAMPLE_BUFFERS
        GL_SAMPLES
        GL_SAMPLE_COVERAGE_VALUE
        GL_SAMPLE_COVERAGE_INVERT
        GL_MULTISAMPLE_BIT
        # multisample  }}}

        # transpose_matrix  {{{
        GL_TRANSPOSE_MODELVIEW_MATRIX
        GL_TRANSPOSE_PROJECTION_MATRIX
        GL_TRANSPOSE_TEXTURE_MATRIX
        GL_TRANSPOSE_COLOR_MATRIX
        # transpose_matrix  }}}

        # texture_env_combine  {{{
        GL_COMBINE
        GL_COMBINE_RGB
        GL_COMBINE_ALPHA
        GL_SOURCE0_RGB
        GL_SOURCE1_RGB
        GL_SOURCE2_RGB
        GL_SOURCE0_ALPHA
        GL_SOURCE1_ALPHA
        GL_SOURCE2_ALPHA
        GL_OPERAND0_RGB
        GL_OPERAND1_RGB
        GL_OPERAND2_RGB
        GL_OPERAND0_ALPHA
        GL_OPERAND1_ALPHA
        GL_OPERAND2_ALPHA
        GL_RGB_SCALE
        GL_ADD_SIGNED
        GL_INTERPOLATE
        GL_SUBTRACT
        GL_CONSTANT
        GL_PRIMARY_COLOR
        GL_PREVIOUS
        # texture_env_combine  }}}

        # texture_env_dot3  {{{
        GL_DOT3_RGB
        GL_DOT3_RGBA
        # texture_env_dot3  }}}

        # texture_border_clamp  {{{
        GL_CLAMP_TO_BORDER
        # texture_border_clamp  }}}

    # Constants }}}

    # Functions {{{

    # Miscellaneous {{{
    void glClearIndex( float c )
    void glClearColor( float red, float green, float blue, float alpha )
    void glClear( unsigned int mask )
    void glIndexMask( unsigned int mask )
    void glColorMask( unsigned char red, unsigned char green, unsigned char blue, unsigned char alpha )
    void glAlphaFunc( unsigned int func, float ref )
    void glBlendFunc( unsigned int sfactor, unsigned int dfactor )
    void glLogicOp( unsigned int opcode )
    void glCullFace( unsigned int mode )
    void glFrontFace( unsigned int mode )
    void glPointSize( float size )
    void glLineWidth( float width )
    void glLineStipple( int factor, unsigned short pattern )
    void glPolygonMode( unsigned int face, unsigned int mode )
    void glPolygonOffset( float factor, float units )
    void glPolygonStipple( unsigned char *mask )
    void glGetPolygonStipple( unsigned char *mask )
    void glEdgeFlag( unsigned char flag )
    void glEdgeFlagv( unsigned char *flag )
    void glScissor( int x, int y, int width, int height)
    void glClipPlane( unsigned int plane, double *equation )
    void glGetClipPlane( unsigned int plane, double *equation )
    void glDrawBuffer( unsigned int mode )
    void glReadBuffer( unsigned int mode )
    void glEnable( unsigned int cap )
    void glDisable( unsigned int cap )
    unsigned char glIsEnabled( unsigned int cap )
    # Miscellaneous }}}

    # GL 1.1 {{{
    void glEnableClientState( unsigned int cap )
    void glDisableClientState( unsigned int cap )
    void glGetBooleanv( unsigned int pname, unsigned char *params )
    void glGetDoublev( unsigned int pname, double *params )
    void glGetFloatv( unsigned int pname, float *params )
    void glGetIntegerv( unsigned int pname, int *params )
    void glPushAttrib( unsigned int mask )
    void glPopAttrib()
    void glPushClientAttrib( unsigned int mask )
    void glPopClientAttrib()
    int glRenderMode( unsigned int mode )
    unsigned int glGetError()
    unsigned char * glGetString( unsigned int name )
    void glFinish()
    void glFlush()
    void glHint( unsigned int target, unsigned int mode )
    # GL 1.1 }}}

    # Depth Buffer {{{
    void glClearDepth( double depth )
    void glDepthFunc( unsigned int func )
    void glDepthMask( unsigned char flag )
    void glDepthRange( double near_val, double far_val )
    # Depth Buffer }}}

    # Accumulation Buffer {{{
    void glClearAccum( float red, float green, float blue, float alpha )
    void glAccum( unsigned int op, float value )
    # Accumulation Buffer }}}

    # Transformation {{{
    void glMatrixMode( unsigned int mode )
    void glOrtho( double left, double right, double bottom, double top, double near_val, double far_val )
    void glFrustum( double left, double right, double bottom, double top, double near_val, double far_val )
    void glViewport( int x, int y, int width, int height )
    void glPushMatrix()
    void glPopMatrix()
    void glLoadIdentity()
    void glLoadMatrixd( double *m )
    void glLoadMatrixf( float *m )
    void glMultMatrixd( double *m )
    void glMultMatrixf( float *m )
    void glRotated( double angle, double x, double y, double z )
    void glRotatef( float angle, float x, float y, float z )
    void glScaled( double x, double y, double z )
    void glScalef( float x, float y, float z )
    void glTranslated( double x, double y, double z )
    void glTranslatef( float x, float y, float z )
    # Transformation }}}

    # Display Lists {{{
    unsigned char glIsList( unsigned int list )
    void glDeleteLists( unsigned int list, int range )
    unsigned int glGenLists( int range )
    void glNewList( unsigned int list, unsigned int mode )
    void glEndList()
    void glCallList( unsigned int list )
    void glCallLists( int n, unsigned int type, void *lists )
    void glListBase( unsigned int base )
    # Display Lists }}}

    # Vertex Arrays  gl(1.1) {{{
    void glVertexPointer( int size, unsigned int type, int stride, void *ptr )
    void glNormalPointer( unsigned int type, int stride, void *ptr )
    void glColorPointer( int size, unsigned int type, int stride, void *ptr )
    void glIndexPointer( unsigned int type, int stride, void *ptr )
    void glTexCoordPointer( int size, unsigned int type, int stride, void *ptr )
    void glEdgeFlagPointer( int stride, void *ptr )
    void glGetPointerv( unsigned int pname, void **params )
    void glArrayElement( int i )
    void glDrawArrays( unsigned int mode, int first, int count )
    void glDrawElements( unsigned int mode, int count, unsigned int type, void *indices )
    void glInterleavedArrays( unsigned int format, int stride, void *pointer )
    # Vertex Arrays  gl(1.1) }}}

    # Lighting {{{
    void glShadeModel( unsigned int mode )
    void glLightf( unsigned int light, unsigned int pname, float param )
    void glLighti( unsigned int light, unsigned int pname, int param )
    void glLightfv( unsigned int light, unsigned int pname, float *params )
    void glLightiv( unsigned int light, unsigned int pname, int *params )
    void glGetLightfv( unsigned int light, unsigned int pname, float *params )
    void glGetLightiv( unsigned int light, unsigned int pname, int *params )
    void glLightModelf( unsigned int pname, float param )
    void glLightModeli( unsigned int pname, int param )
    void glLightModelfv( unsigned int pname, float *params )
    void glLightModeliv( unsigned int pname, int *params )
    void glMaterialf( unsigned int face, unsigned int pname, float param )
    void glMateriali( unsigned int face, unsigned int pname, int param )
    void glMaterialfv( unsigned int face, unsigned int pname, float *params )
    void glMaterialiv( unsigned int face, unsigned int pname, int *params )
    void glGetMaterialfv( unsigned int face, unsigned int pname, float *params )
    void glGetMaterialiv( unsigned int face, unsigned int pname, int *params )
    void glColorMaterial( unsigned int face, unsigned int mode )
    # Lighting }}}

    # Raster functions {{{
    void glPixelZoom( float xfactor, float yfactor )
    void glPixelStoref( unsigned int pname, float param )
    void glPixelStorei( unsigned int pname, int param )
    void glPixelTransferf( unsigned int pname, float param )
    void glPixelTransferi( unsigned int pname, int param )
    void glPixelMapfv( unsigned int map, int mapsize, float *values )
    void glPixelMapuiv( unsigned int map, int mapsize, unsigned int *values )
    void glPixelMapusv( unsigned int map, int mapsize, unsigned short *values )
    void glGetPixelMapfv( unsigned int map, float *values )
    void glGetPixelMapuiv( unsigned int map, unsigned int *values )
    void glGetPixelMapusv( unsigned int map, unsigned short *values )
    void glBitmap( int width, int height, float xorig, float yorig, float xmove, float ymove, unsigned char *bitmap )
    void glReadPixels( int x, int y, int width, int height, unsigned int format, unsigned int type, void *pixels )
    void glDrawPixels( int width, int height, unsigned int format, unsigned int type, void *pixels )
    void glCopyPixels( int x, int y, int width, int height, unsigned int type )
    # Raster functions }}}

    # Stenciling {{{
    void glStencilFunc( unsigned int func, int ref, unsigned int mask )
    void glStencilMask( unsigned int mask )
    void glStencilOp( unsigned int fail, unsigned int zfail, unsigned int zpass )
    void glClearStencil( int s )
    # Stenciling }}}

    # Texture mapping {{{
    void glTexGend( unsigned int coord, unsigned int pname, double param )
    void glTexGenf( unsigned int coord, unsigned int pname, float param )
    void glTexGeni( unsigned int coord, unsigned int pname, int param )
    void glTexGendv( unsigned int coord, unsigned int pname, double *params )
    void glTexGenfv( unsigned int coord, unsigned int pname, float *params )
    void glTexGeniv( unsigned int coord, unsigned int pname, int *params )
    void glGetTexGendv( unsigned int coord, unsigned int pname, double *params )
    void glGetTexGenfv( unsigned int coord, unsigned int pname, float *params )
    void glGetTexGeniv( unsigned int coord, unsigned int pname, int *params )
    void glTexEnvf( unsigned int target, unsigned int pname, float param )
    void glTexEnvi( unsigned int target, unsigned int pname, int param )
    void glTexEnvfv( unsigned int target, unsigned int pname, float *params )
    void glTexEnviv( unsigned int target, unsigned int pname, int *params )
    void glGetTexEnvfv( unsigned int target, unsigned int pname, float *params )
    void glGetTexEnviv( unsigned int target, unsigned int pname, int *params )
    void glTexParameterf( unsigned int target, unsigned int pname, float param )
    void glTexParameteri( unsigned int target, unsigned int pname, int param )
    void glTexParameterfv( unsigned int target, unsigned int pname, float *params )
    void glTexParameteriv( unsigned int target, unsigned int pname, int *params )
    void glGetTexParameterfv( unsigned int target, unsigned int pname, float *params)
    void glGetTexParameteriv( unsigned int target, unsigned int pname, int *params )
    void glGetTexLevelParameterfv( unsigned int target, int level, unsigned int pname, float *params )
    void glGetTexLevelParameteriv( unsigned int target, int level, unsigned int pname, int *params )
    void glTexImage1D( unsigned int target, int level, int internalFormat, int width, int border, unsigned int format, unsigned int type, void *pixels )
    void glTexImage2D( unsigned int target, int level, int internalFormat, int width, int height, int border, unsigned int format, unsigned int type, void *pixels )
    void glGetTexImage( unsigned int target, int level, unsigned int format, unsigned int type, void *pixels )

    void glGenTextures( int n, unsigned int *textures )
    void glDeleteTextures( int n, unsigned int *textures)
    void glBindTexture( unsigned int target, unsigned int texture )
    void glPrioritizeTextures( int n, unsigned int *textures, float *priorities )
    unsigned char glAreTexturesResident( int n, unsigned int *textures, unsigned char *residences )
    unsigned char glIsTexture( unsigned int texture )
    void glTexSubImage1D( unsigned int target, int level, int xoffset, int width, unsigned int format, unsigned int type, void *pixels )
    void glTexSubImage2D( unsigned int target, int level, int xoffset, int yoffset, int width, int height, unsigned int format, unsigned int type, void *pixels )
    void glCopyTexImage1D( unsigned int target, int level, unsigned int internalformat, int x, int y, int width, int border )
    void glCopyTexImage2D( unsigned int target, int level, unsigned int internalformat, int x, int y, int width, int height, int border )
    void glCopyTexSubImage1D( unsigned int target, int level, int xoffset, int x, int y, int width )
    void glCopyTexSubImage2D( unsigned int target, int level, int xoffset, int yoffset, int x, int y, int width, int height )
    # Texture mapping }}}

    # Evaluators {{{
    void glMap1d( unsigned int target, double u1, double u2, int stride, int order, double *points )
    void glMap1f( unsigned int target, float u1, float u2, int stride, int order, float *points )
    void glMap2d( unsigned int target, double u1, double u2, int ustride, int uorder, double v1, double v2, int vstride, int vorder, double *points )
    void glMap2f( unsigned int target, float u1, float u2, int ustride, int uorder, float v1, float v2, int vstride, int vorder, float *points )
    void glGetMapdv( unsigned int target, unsigned int query, double *v )
    void glGetMapfv( unsigned int target, unsigned int query, float *v )
    void glGetMapiv( unsigned int target, unsigned int query, int *v )
    void glEvalCoord1d( double u )
    void glEvalCoord1f( float u )
    void glEvalCoord1dv( double *u )
    void glEvalCoord1fv( float *u )
    void glEvalCoord2d( double u, double v )
    void glEvalCoord2f( float u, float v )
    void glEvalCoord2dv( double *u )
    void glEvalCoord2fv( float *u )
    void glMapGrid1d( int un, double u1, double u2 )
    void glMapGrid1f( int un, float u1, float u2 )
    void glMapGrid2d( int un, double u1, double u2, int vn, double v1, double v2 )
    void glMapGrid2f( int un, float u1, float u2, int vn, float v1, float v2 )
    void glEvalPoint1( int i )
    void glEvalPoint2( int i, int j )
    void glEvalMesh1( unsigned int mode, int i1, int i2 )
    void glEvalMesh2( unsigned int mode, int i1, int i2, int j1, int j2 )
    # Evaluators }}}

    # Fog {{{
    void glFogf( unsigned int pname, float param )
    void glFogi( unsigned int pname, int param )
    void glFogfv( unsigned int pname, float *params )
    void glFogiv( unsigned int pname, int *params )
    # Fog }}}

    # OpenGL 1.2 {{{
    void glDrawRangeElements( unsigned int mode, unsigned int start, unsigned int end, int count, unsigned int type, void *indices )
    void glTexImage3D( unsigned int target, int level, int internalFormat, int width, int height, int depth, int border, unsigned int format, unsigned int type, void *pixels )
    void glTexSubImage3D( unsigned int target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, unsigned int format, unsigned int type, void *pixels)
    void glCopyTexSubImage3D( unsigned int target, int level, int xoffset, int yoffset, int zoffset, int x, int y, int width, int height )
    # OpenGL 1.2 }}}

    # GL_ARB_imaging {{{
    void glColorTable( unsigned int target, unsigned int internalformat, int width, unsigned int format, unsigned int type, void *table )
    void glColorSubTable( unsigned int target, int start, int count, unsigned int format, unsigned int type, void *data )
    void glColorTableParameteriv(unsigned int target, unsigned int pname, int *params)
    void glColorTableParameterfv(unsigned int target, unsigned int pname, float *params)
    void glCopyColorSubTable( unsigned int target, int start, int x, int y, int width )
    void glCopyColorTable( unsigned int target, unsigned int internalformat, int x, int y, int width )
    void glGetColorTable( unsigned int target, unsigned int format, unsigned int type, void *table )
    void glGetColorTableParameterfv( unsigned int target, unsigned int pname, float *params )
    void glGetColorTableParameteriv( unsigned int target, unsigned int pname, int *params )
    void glBlendEquation( unsigned int mode )
    void glBlendColor( float red, float green, float blue, float alpha )
    void glHistogram( unsigned int target, int width, unsigned int internalformat, unsigned char sink )
    void glResetHistogram( unsigned int target )
    void glGetHistogram( unsigned int target, unsigned char reset, unsigned int format, unsigned int type, void *values )
    void glGetHistogramParameterfv( unsigned int target, unsigned int pname, float *params )
    void glGetHistogramParameteriv( unsigned int target, unsigned int pname, int *params )
    void glMinmax( unsigned int target, unsigned int internalformat, unsigned char sink )
    void glResetMinmax( unsigned int target )
    void glGetMinmax( unsigned int target, unsigned char reset, unsigned int format, unsigned int types, void *values )
    void glGetMinmaxParameterfv( unsigned int target, unsigned int pname, float *params )
    void glGetMinmaxParameteriv( unsigned int target, unsigned int pname, int *params )
    void glConvolutionFilter1D( unsigned int target, unsigned int internalformat, int width, unsigned int format, unsigned int type, void *image )
    void glConvolutionFilter2D( unsigned int target, unsigned int internalformat, int width, int height, unsigned int format, unsigned int type, void *image )
    void glConvolutionParameterf( unsigned int target, unsigned int pname, float params )
    void glConvolutionParameterfv( unsigned int target, unsigned int pname, float *params )
    void glConvolutionParameteri( unsigned int target, unsigned int pname, int params )
    void glConvolutionParameteriv( unsigned int target, unsigned int pname, int *params )
    void glCopyConvolutionFilter1D( unsigned int target, unsigned int internalformat, int x, int y, int width )
    void glCopyConvolutionFilter2D( unsigned int target, unsigned int internalformat, int x, int y, int width, int height)
    void glGetConvolutionFilter( unsigned int target, unsigned int format, unsigned int type, void *image )
    void glGetConvolutionParameterfv( unsigned int target, unsigned int pname, float *params )
    void glGetConvolutionParameteriv( unsigned int target, unsigned int pname, int *params )
    void glSeparableFilter2D( unsigned int target, unsigned int internalformat, int width, int height, unsigned int format, unsigned int type, void *row, void *column )
    void glGetSeparableFilter( unsigned int target, unsigned int format, unsigned int type, void *row, void *column, void *span )
    # GL_ARB_imaging }}}

    # OpenGL 1.3 {{{
    void glActiveTexture( unsigned int texture )
    void glClientActiveTexture( unsigned int texture )
    void glCompressedTexImage1D( unsigned int target, int level, unsigned int internalformat, int width, int border, int imageSize, void *data )
    void glCompressedTexImage2D( unsigned int target, int level, unsigned int internalformat, int width, int height, int border, int imageSize, void *data )
    void glCompressedTexImage3D( unsigned int target, int level, unsigned int internalformat, int width, int height, int depth, int border, int imageSize, void *data )
    void glCompressedTexSubImage1D( unsigned int target, int level, int xoffset, int width, unsigned int format, int imageSize, void *data )
    void glCompressedTexSubImage2D( unsigned int target, int level, int xoffset, int yoffset, int width, int height, unsigned int format, int imageSize, void *data )
    void glCompressedTexSubImage3D( unsigned int target, int level, int xoffset, int yoffset, int zoffset, int width, int height, int depth, unsigned int format, int imageSize, void *data )
    void glGetCompressedTexImage( unsigned int target, int lod, void *img )
    void glLoadTransposeMatrixd( double m[16] )
    void glLoadTransposeMatrixf( float m[16] )
    void glMultTransposeMatrixd( double m[16] )
    void glMultTransposeMatrixf( float m[16] )
    void glSampleCoverage( float value, unsigned char invert )
    # OpenGL 1.3 }}}

    # Functions }}}

