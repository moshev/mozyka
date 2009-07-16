cimport gl
cimport sdl
from collections import namedtuple
# Key codes {{{
SDLK_UNKNOWN = sdl.SDLK_UNKNOWN
SDLK_FIRST = sdl.SDLK_FIRST
SDLK_BACKSPACE = sdl.SDLK_BACKSPACE
SDLK_TAB = sdl.SDLK_TAB
SDLK_CLEAR = sdl.SDLK_CLEAR
SDLK_RETURN = sdl.SDLK_RETURN
SDLK_PAUSE = sdl.SDLK_PAUSE
SDLK_ESCAPE = sdl.SDLK_ESCAPE
SDLK_SPACE = sdl.SDLK_SPACE
SDLK_EXCLAIM = sdl.SDLK_EXCLAIM
SDLK_QUOTEDBL = sdl.SDLK_QUOTEDBL
SDLK_HASH = sdl.SDLK_HASH
SDLK_DOLLAR = sdl.SDLK_DOLLAR
SDLK_AMPERSAND = sdl.SDLK_AMPERSAND
SDLK_QUOTE = sdl.SDLK_QUOTE
SDLK_LEFTPAREN = sdl.SDLK_LEFTPAREN
SDLK_RIGHTPAREN = sdl.SDLK_RIGHTPAREN
SDLK_ASTERISK = sdl.SDLK_ASTERISK
SDLK_PLUS = sdl.SDLK_PLUS
SDLK_COMMA = sdl.SDLK_COMMA
SDLK_MINUS = sdl.SDLK_MINUS
SDLK_PERIOD = sdl.SDLK_PERIOD
SDLK_SLASH = sdl.SDLK_SLASH
SDLK_0 = sdl.SDLK_0
SDLK_1 = sdl.SDLK_1
SDLK_2 = sdl.SDLK_2
SDLK_3 = sdl.SDLK_3
SDLK_4 = sdl.SDLK_4
SDLK_5 = sdl.SDLK_5
SDLK_6 = sdl.SDLK_6
SDLK_7 = sdl.SDLK_7
SDLK_8 = sdl.SDLK_8
SDLK_9 = sdl.SDLK_9
SDLK_COLON = sdl.SDLK_COLON
SDLK_SEMICOLON = sdl.SDLK_SEMICOLON
SDLK_LESS = sdl.SDLK_LESS
SDLK_EQUALS = sdl.SDLK_EQUALS
SDLK_GREATER = sdl.SDLK_GREATER
SDLK_QUESTION = sdl.SDLK_QUESTION
SDLK_AT = sdl.SDLK_AT
SDLK_LEFTBRACKET = sdl.SDLK_LEFTBRACKET
SDLK_BACKSLASH = sdl.SDLK_BACKSLASH
SDLK_RIGHTBRACKET = sdl.SDLK_RIGHTBRACKET
SDLK_CARET = sdl.SDLK_CARET
SDLK_UNDERSCORE = sdl.SDLK_UNDERSCORE
SDLK_BACKQUOTE = sdl.SDLK_BACKQUOTE
SDLK_a = sdl.SDLK_a
SDLK_b = sdl.SDLK_b
SDLK_c = sdl.SDLK_c
SDLK_d = sdl.SDLK_d
SDLK_e = sdl.SDLK_e
SDLK_f = sdl.SDLK_f
SDLK_g = sdl.SDLK_g
SDLK_h = sdl.SDLK_h
SDLK_i = sdl.SDLK_i
SDLK_j = sdl.SDLK_j
SDLK_k = sdl.SDLK_k
SDLK_l = sdl.SDLK_l
SDLK_m = sdl.SDLK_m
SDLK_n = sdl.SDLK_n
SDLK_o = sdl.SDLK_o
SDLK_p = sdl.SDLK_p
SDLK_q = sdl.SDLK_q
SDLK_r = sdl.SDLK_r
SDLK_s = sdl.SDLK_s
SDLK_t = sdl.SDLK_t
SDLK_u = sdl.SDLK_u
SDLK_v = sdl.SDLK_v
SDLK_w = sdl.SDLK_w
SDLK_x = sdl.SDLK_x
SDLK_y = sdl.SDLK_y
SDLK_z = sdl.SDLK_z
SDLK_DELETE = sdl.SDLK_DELETE
# End of ASCII mapped keysyms

# International keyboard syms
SDLK_WORLD_0 = sdl.SDLK_WORLD_0
SDLK_WORLD_1 = sdl.SDLK_WORLD_1
SDLK_WORLD_2 = sdl.SDLK_WORLD_2
SDLK_WORLD_3 = sdl.SDLK_WORLD_3
SDLK_WORLD_4 = sdl.SDLK_WORLD_4
SDLK_WORLD_5 = sdl.SDLK_WORLD_5
SDLK_WORLD_6 = sdl.SDLK_WORLD_6
SDLK_WORLD_7 = sdl.SDLK_WORLD_7
SDLK_WORLD_8 = sdl.SDLK_WORLD_8
SDLK_WORLD_9 = sdl.SDLK_WORLD_9
SDLK_WORLD_10 = sdl.SDLK_WORLD_10
SDLK_WORLD_11 = sdl.SDLK_WORLD_11
SDLK_WORLD_12 = sdl.SDLK_WORLD_12
SDLK_WORLD_13 = sdl.SDLK_WORLD_13
SDLK_WORLD_14 = sdl.SDLK_WORLD_14
SDLK_WORLD_15 = sdl.SDLK_WORLD_15
SDLK_WORLD_16 = sdl.SDLK_WORLD_16
SDLK_WORLD_17 = sdl.SDLK_WORLD_17
SDLK_WORLD_18 = sdl.SDLK_WORLD_18
SDLK_WORLD_19 = sdl.SDLK_WORLD_19
SDLK_WORLD_20 = sdl.SDLK_WORLD_20
SDLK_WORLD_21 = sdl.SDLK_WORLD_21
SDLK_WORLD_22 = sdl.SDLK_WORLD_22
SDLK_WORLD_23 = sdl.SDLK_WORLD_23
SDLK_WORLD_24 = sdl.SDLK_WORLD_24
SDLK_WORLD_25 = sdl.SDLK_WORLD_25
SDLK_WORLD_26 = sdl.SDLK_WORLD_26
SDLK_WORLD_27 = sdl.SDLK_WORLD_27
SDLK_WORLD_28 = sdl.SDLK_WORLD_28
SDLK_WORLD_29 = sdl.SDLK_WORLD_29
SDLK_WORLD_30 = sdl.SDLK_WORLD_30
SDLK_WORLD_31 = sdl.SDLK_WORLD_31
SDLK_WORLD_32 = sdl.SDLK_WORLD_32
SDLK_WORLD_33 = sdl.SDLK_WORLD_33
SDLK_WORLD_34 = sdl.SDLK_WORLD_34
SDLK_WORLD_35 = sdl.SDLK_WORLD_35
SDLK_WORLD_36 = sdl.SDLK_WORLD_36
SDLK_WORLD_37 = sdl.SDLK_WORLD_37
SDLK_WORLD_38 = sdl.SDLK_WORLD_38
SDLK_WORLD_39 = sdl.SDLK_WORLD_39
SDLK_WORLD_40 = sdl.SDLK_WORLD_40
SDLK_WORLD_41 = sdl.SDLK_WORLD_41
SDLK_WORLD_42 = sdl.SDLK_WORLD_42
SDLK_WORLD_43 = sdl.SDLK_WORLD_43
SDLK_WORLD_44 = sdl.SDLK_WORLD_44
SDLK_WORLD_45 = sdl.SDLK_WORLD_45
SDLK_WORLD_46 = sdl.SDLK_WORLD_46
SDLK_WORLD_47 = sdl.SDLK_WORLD_47
SDLK_WORLD_48 = sdl.SDLK_WORLD_48
SDLK_WORLD_49 = sdl.SDLK_WORLD_49
SDLK_WORLD_50 = sdl.SDLK_WORLD_50
SDLK_WORLD_51 = sdl.SDLK_WORLD_51
SDLK_WORLD_52 = sdl.SDLK_WORLD_52
SDLK_WORLD_53 = sdl.SDLK_WORLD_53
SDLK_WORLD_54 = sdl.SDLK_WORLD_54
SDLK_WORLD_55 = sdl.SDLK_WORLD_55
SDLK_WORLD_56 = sdl.SDLK_WORLD_56
SDLK_WORLD_57 = sdl.SDLK_WORLD_57
SDLK_WORLD_58 = sdl.SDLK_WORLD_58
SDLK_WORLD_59 = sdl.SDLK_WORLD_59
SDLK_WORLD_60 = sdl.SDLK_WORLD_60
SDLK_WORLD_61 = sdl.SDLK_WORLD_61
SDLK_WORLD_62 = sdl.SDLK_WORLD_62
SDLK_WORLD_63 = sdl.SDLK_WORLD_63
SDLK_WORLD_64 = sdl.SDLK_WORLD_64
SDLK_WORLD_65 = sdl.SDLK_WORLD_65
SDLK_WORLD_66 = sdl.SDLK_WORLD_66
SDLK_WORLD_67 = sdl.SDLK_WORLD_67
SDLK_WORLD_68 = sdl.SDLK_WORLD_68
SDLK_WORLD_69 = sdl.SDLK_WORLD_69
SDLK_WORLD_70 = sdl.SDLK_WORLD_70
SDLK_WORLD_71 = sdl.SDLK_WORLD_71
SDLK_WORLD_72 = sdl.SDLK_WORLD_72
SDLK_WORLD_73 = sdl.SDLK_WORLD_73
SDLK_WORLD_74 = sdl.SDLK_WORLD_74
SDLK_WORLD_75 = sdl.SDLK_WORLD_75
SDLK_WORLD_76 = sdl.SDLK_WORLD_76
SDLK_WORLD_77 = sdl.SDLK_WORLD_77
SDLK_WORLD_78 = sdl.SDLK_WORLD_78
SDLK_WORLD_79 = sdl.SDLK_WORLD_79
SDLK_WORLD_80 = sdl.SDLK_WORLD_80
SDLK_WORLD_81 = sdl.SDLK_WORLD_81
SDLK_WORLD_82 = sdl.SDLK_WORLD_82
SDLK_WORLD_83 = sdl.SDLK_WORLD_83
SDLK_WORLD_84 = sdl.SDLK_WORLD_84
SDLK_WORLD_85 = sdl.SDLK_WORLD_85
SDLK_WORLD_86 = sdl.SDLK_WORLD_86
SDLK_WORLD_87 = sdl.SDLK_WORLD_87
SDLK_WORLD_88 = sdl.SDLK_WORLD_88
SDLK_WORLD_89 = sdl.SDLK_WORLD_89
SDLK_WORLD_90 = sdl.SDLK_WORLD_90
SDLK_WORLD_91 = sdl.SDLK_WORLD_91
SDLK_WORLD_92 = sdl.SDLK_WORLD_92
SDLK_WORLD_93 = sdl.SDLK_WORLD_93
SDLK_WORLD_94 = sdl.SDLK_WORLD_94
SDLK_WORLD_95 = sdl.SDLK_WORLD_95

# Numeric keypad
SDLK_KP0 = sdl.SDLK_KP0
SDLK_KP1 = sdl.SDLK_KP1
SDLK_KP2 = sdl.SDLK_KP2
SDLK_KP3 = sdl.SDLK_KP3
SDLK_KP4 = sdl.SDLK_KP4
SDLK_KP5 = sdl.SDLK_KP5
SDLK_KP6 = sdl.SDLK_KP6
SDLK_KP7 = sdl.SDLK_KP7
SDLK_KP8 = sdl.SDLK_KP8
SDLK_KP9 = sdl.SDLK_KP9
SDLK_KP_PERIOD = sdl.SDLK_KP_PERIOD
SDLK_KP_DIVIDE = sdl.SDLK_KP_DIVIDE
SDLK_KP_MULTIPLY = sdl.SDLK_KP_MULTIPLY
SDLK_KP_MINUS = sdl.SDLK_KP_MINUS
SDLK_KP_PLUS = sdl.SDLK_KP_PLUS
SDLK_KP_ENTER = sdl.SDLK_KP_ENTER
SDLK_KP_EQUALS = sdl.SDLK_KP_EQUALS

# Arrows + Home/End pad
SDLK_UP = sdl.SDLK_UP
SDLK_DOWN = sdl.SDLK_DOWN
SDLK_RIGHT = sdl.SDLK_RIGHT
SDLK_LEFT = sdl.SDLK_LEFT
SDLK_INSERT = sdl.SDLK_INSERT
SDLK_HOME = sdl.SDLK_HOME
SDLK_END = sdl.SDLK_END
SDLK_PAGEUP = sdl.SDLK_PAGEUP
SDLK_PAGEDOWN = sdl.SDLK_PAGEDOWN

# Function keys
SDLK_F1 = sdl.SDLK_F1
SDLK_F2 = sdl.SDLK_F2
SDLK_F3 = sdl.SDLK_F3
SDLK_F4 = sdl.SDLK_F4
SDLK_F5 = sdl.SDLK_F5
SDLK_F6 = sdl.SDLK_F6
SDLK_F7 = sdl.SDLK_F7
SDLK_F8 = sdl.SDLK_F8
SDLK_F9 = sdl.SDLK_F9
SDLK_F10 = sdl.SDLK_F10
SDLK_F11 = sdl.SDLK_F11
SDLK_F12 = sdl.SDLK_F12
SDLK_F13 = sdl.SDLK_F13
SDLK_F14 = sdl.SDLK_F14
SDLK_F15 = sdl.SDLK_F15

# Key state modifier keys
SDLK_NUMLOCK = sdl.SDLK_NUMLOCK
SDLK_CAPSLOCK = sdl.SDLK_CAPSLOCK
SDLK_SCROLLOCK = sdl.SDLK_SCROLLOCK
SDLK_RSHIFT = sdl.SDLK_RSHIFT
SDLK_LSHIFT = sdl.SDLK_LSHIFT
SDLK_RCTRL = sdl.SDLK_RCTRL
SDLK_LCTRL = sdl.SDLK_LCTRL
SDLK_RALT = sdl.SDLK_RALT
SDLK_LALT = sdl.SDLK_LALT
SDLK_RMETA = sdl.SDLK_RMETA
SDLK_LMETA = sdl.SDLK_LMETA
SDLK_LSUPER = sdl.SDLK_LSUPER # Left "Windows" key
SDLK_RSUPER = sdl.SDLK_RSUPER # Right "Windows" key
SDLK_MODE = sdl.SDLK_MODE # "Alt Gr" key
SDLK_COMPOSE = sdl.SDLK_COMPOSE # Multi-key compose key

# Miscellaneous function keys
SDLK_HELP = sdl.SDLK_HELP
SDLK_PRINT = sdl.SDLK_PRINT
SDLK_SYSREQ = sdl.SDLK_SYSREQ
SDLK_BREAK = sdl.SDLK_BREAK
SDLK_MENU = sdl.SDLK_MENU
SDLK_POWER = sdl.SDLK_POWER # Power Macintosh power key
SDLK_EURO = sdl.SDLK_EURO # Some european keyboards
SDLK_UNDO = sdl.SDLK_UNDO # Atari keyboard has Undo

SDLK_LAST = sdl.SDLK_LAST

# Enumeration of valid key mods (possibly OR'd together)
KMOD_NONE = sdl.KMOD_NONE
KMOD_LSHIFT = sdl.KMOD_LSHIFT
KMOD_RSHIFT = sdl.KMOD_RSHIFT
KMOD_LCTRL = sdl.KMOD_LCTRL
KMOD_RCTRL = sdl.KMOD_RCTRL
KMOD_LALT = sdl.KMOD_LALT
KMOD_RALT = sdl.KMOD_RALT
KMOD_LMETA = sdl.KMOD_LMETA
KMOD_RMETA = sdl.KMOD_RMETA
KMOD_NUM = sdl.KMOD_NUM
KMOD_CAPS = sdl.KMOD_CAPS
KMOD_MODE = sdl.KMOD_MODE
KMOD_RESERVED = sdl.KMOD_RESERVED
KMOD_CTRL = sdl.KMOD_CTRL
KMOD_SHIFT = sdl.KMOD_SHIFT
KMOD_ALT = sdl.KMOD_ALT
KMOD_META = sdl.KMOD_META

SDL_PRESSED = sdl.SDL_PRESSED
SDL_RELEASED = sdl.SDL_RELEASED
# }}} Key codes

cdef class Surface:
    cdef sdl.SDL_Surface* sdl_surface

# state is SDL_PRESSED or SDL_RELEASED.
# code is one of SDLK_*
# modifier is a bitmask of held KMOD_*
# unicode is unicode value of the registered character
KeyEvent = namedtuple(u'KeyEvent', u'state code modifier unicode')

# buttons is a set of numbers from 1 through 8, indicating which buttons are held
# x and y are absolute coords,
# xrel and yrel are deltas, relative to the previous position
MouseMotionEvent = namedtuple(u'MouseMotionEvent', u'buttons x y xrel yrel')

# state is SDL_PRESSED or SDL_RELEASED
# button is an integer from 1 through 8
# x and y are absolute coordinates of the pointer
MouseButtonEvent = namedtuple(u'MouseButtonEvent', u'state button x y')

class QuitEvent:
    pass

UnsupportedEvent = namedtuple(u'UnsupportedEvent', u'type')

def init():
    """Call this function to initialize the graphics and audio systems."""
    sdl.SDL_Init(sdl.SDL_INIT_VIDEO | sdl.SDL_INIT_AUDIO | sdl.SDL_INIT_TIMER)

def quit():
    """Call this function to deinitialize the audio and graphics. After this call, all open windows are closed."""
    sdl.SDL_Quit()

def set_video_params(width, height, title, icon):
    """
    width and height are ints
    title and icon are bytes - utf-8 encoded strings. To convert a string to bytes, use str.encode("utf-8")
    """
    cdef sdl.SDL_Surface* sdl_surface = sdl.SDL_SetVideoMode(width, height, 32, sdl.SDL_OPENGL)
    sdl.SDL_WM_SetCaption(title, icon)
    cdef Surface s = Surface()
    s.sdl_surface = sdl_surface
    return s

def get_last_error():
    """
    returns a string - description of the last encountered SDL error
    """
    cdef char* error = sdl.SDL_GetError()
    if error == None:
        return u""
    else:
        return bytes(error).decode(u"utf-8")

def wait_for_next_event():
    """
    Waits until there's a new event and returns it.
    returns None on error
    """
    cdef sdl.SDL_Event event
    cdef int i
    if sdl.SDL_WaitEvent(&event) == 1:
        if event.type == sdl.SDL_KEYDOWN or event.type == sdl.SDL_KEYUP:
            return KeyEvent(event.key.state, event.key.keysym.sym, event.key.keysym.mod, event.key.keysym.unicode)
        elif event.type == sdl.SDL_MOUSEMOTION:
            buttons = set()
            for i in range(1, 9):
                if event.motion.state & sdl.SDL_BUTTON(i):
                    buttons.add(i)
            return MouseMotionEvent(buttons, event.motion.x, event.motion.y,
                    event.motion.xrel, event.motion.yrel)
        elif event.type == sdl.SDL_MOUSEBUTTONDOWN or event.type == sdl.SDL_MOUSEBUTTONUP:
            return MouseButtonEvent(event.button.state, event.button.button, event.button.x, event.button.y)
        elif event.type == sdl.SDL_QUIT:
            return QuitEvent()
        else:
            return UnsupportedEvent(event.type)
    else:
        return None

