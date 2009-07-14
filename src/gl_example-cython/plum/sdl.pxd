cdef extern from "SDL/SDL.h":
    # Types {{{
    ctypedef signed char        Sint8
    ctypedef unsigned char      Uint8
    ctypedef signed short       Sint16
    ctypedef unsigned short     Uint16
    ctypedef signed int         Sint32
    ctypedef unsigned int       Uint32
    ctypedef signed long long   Sint64
    ctypedef unsigned long long Uint64

    struct FILE:
        pass

    enum SDL_bool:
        SDL_FALSE
        SDL_TRUE

    enum:
        SDL_MAX_TRACKS

    enum:
        SDL_INIT_TIMER
        SDL_INIT_AUDIO
        SDL_INIT_VIDEO
        SDL_INIT_CDROM
        SDL_INIT_JOYSTICK
        SDL_INIT_NOPARACHUTE
        SDL_INIT_EVENTTHREAD
        SDL_INIT_EVERYTHING

    enum:
        # Available for SDL_CreateRGBSurface() or SDL_SetVideoMode() */
        SDL_SWSURFACE
        SDL_HWSURFACE
        SDL_ASYNCBLIT
        # Available for SDL_SetVideoMode() */
        SDL_ANYFORMAT
        SDL_HWPALETTE
        SDL_DOUBLEBUF
        SDL_FULLSCREEN
        SDL_OPENGL
        SDL_OPENGLBLIT
        SDL_RESIZABLE
        SDL_NOFRAME
        # Used internally (read-only) */
        SDL_HWACCEL
        SDL_SRCCOLORKEY
        SDL_RLEACCELOK
        SDL_RLEACCEL
        SDL_SRCALPHA
        SDL_PREALLOC

    struct _SDL_iconv_t:
        pass
    ctypedef _SDL_iconv_t *SDL_iconv_t

    struct SDL_SysWMmsg:
        pass
        
    struct SDL_AudioSpec:
        int freq
        Uint16 format
        Uint8  channels
        Uint8  silence
        Uint16 samples
        Uint16 padding
        Uint32 size
        void (*callback)(void *userdata, Uint8 *stream, int len)
        void  *userdata

    struct SDL_AudioCVT:
        int needed
        Uint16 src_format
        Uint16 dst_format
        double rate_incr
        Uint8 *buf
        int    len
        int    len_cvt
        int    len_mult
        double len_ratio
        void (*filters[10])(SDL_AudioCVT *cvt, Uint16 format)
        int filter_index

    enum SDL_audiostatus:
        SDL_AUDIO_STOPPED
        SDL_AUDIO_PLAYING
        SDL_AUDIO_PAUSED

    enum CDstatus:
        CD_TRAYEMPTY
        CD_STOPPED
        CD_PLAYING
        CD_PAUSED
        CD_ERROR

    struct SDL_CDtrack:
        Uint8 id
        Uint8 type
        Uint16 unused
        Uint32 length
        Uint32 offset

    struct SDL_CD:
        int id
        CDstatus status

        int numtracks
        int cur_track
        int cur_frame
        SDL_CDtrack track[SDL_MAX_TRACKS+1]

    enum SDL_errorcode:
        SDL_ENOMEM
        SDL_EFREAD
        SDL_EFWRITE
        SDL_EFSEEK
        SDL_UNSUPPORTED
        SDL_LASTERROR

    enum:
        SDL_NOEVENT
        SDL_ACTIVEEVENT
        SDL_KEYDOWN
        SDL_KEYUP
        SDL_MOUSEMOTION
        SDL_MOUSEBUTTONDOWN
        SDL_MOUSEBUTTONUP
        SDL_JOYAXISMOTION
        SDL_JOYBALLMOTION
        SDL_JOYHATMOTION
        SDL_JOYBUTTONDOWN
        SDL_JOYBUTTONUP
        SDL_QUIT
        SDL_SYSWMEVENT
        SDL_EVENT_RESERVEDA
        SDL_EVENT_RESERVEDB
        SDL_VIDEORESIZE
        SDL_VIDEOEXPOSE
        SDL_EVENT_RESERVED2
        SDL_EVENT_RESERVED3
        SDL_EVENT_RESERVED4
        SDL_EVENT_RESERVED5
        SDL_EVENT_RESERVED6
        SDL_EVENT_RESERVED7
        SDL_USEREVENT
        SDL_NUMEVENTS

    enum:
        SDL_ACTIVEEVENTMASK
        SDL_KEYDOWNMASK
        SDL_KEYUPMASK
        SDL_KEYEVENTMASK
        SDL_MOUSEMOTIONMASK
        SDL_MOUSEBUTTONDOWNMASK
        SDL_MOUSEBUTTONUPMASK
        SDL_MOUSEEVENTMASK
        SDL_JOYAXISMOTIONMASK
        SDL_JOYBALLMOTIONMASK
        SDL_JOYHATMOTIONMASK
        SDL_JOYBUTTONDOWNMASK
        SDL_JOYBUTTONUPMASK
        SDL_JOYEVENTMASK
        SDL_VIDEORESIZEMASK
        SDL_VIDEOEXPOSEMASK
        SDL_QUITMASK
        SDL_SYSWMEVENTMASK

    enum SDLKey:
        # The keyboard syms have been cleverly chosen to map to ASCII
        SDLK_UNKNOWN
        SDLK_FIRST
        SDLK_BACKSPACE
        SDLK_TAB
        SDLK_CLEAR
        SDLK_RETURN
        SDLK_PAUSE
        SDLK_ESCAPE
        SDLK_SPACE
        SDLK_EXCLAIM
        SDLK_QUOTEDBL
        SDLK_HASH
        SDLK_DOLLAR
        SDLK_AMPERSAND
        SDLK_QUOTE
        SDLK_LEFTPAREN
        SDLK_RIGHTPAREN
        SDLK_ASTERISK
        SDLK_PLUS
        SDLK_COMMA
        SDLK_MINUS
        SDLK_PERIOD
        SDLK_SLASH
        SDLK_0
        SDLK_1
        SDLK_2
        SDLK_3
        SDLK_4
        SDLK_5
        SDLK_6
        SDLK_7
        SDLK_8
        SDLK_9
        SDLK_COLON
        SDLK_SEMICOLON
        SDLK_LESS
        SDLK_EQUALS
        SDLK_GREATER
        SDLK_QUESTION
        SDLK_AT
        SDLK_LEFTBRACKET
        SDLK_BACKSLASH
        SDLK_RIGHTBRACKET
        SDLK_CARET
        SDLK_UNDERSCORE
        SDLK_BACKQUOTE
        SDLK_a
        SDLK_b
        SDLK_c
        SDLK_d
        SDLK_e
        SDLK_f
        SDLK_g
        SDLK_h
        SDLK_i
        SDLK_j
        SDLK_k
        SDLK_l
        SDLK_m
        SDLK_n
        SDLK_o
        SDLK_p
        SDLK_q
        SDLK_r
        SDLK_s
        SDLK_t
        SDLK_u
        SDLK_v
        SDLK_w
        SDLK_x
        SDLK_y
        SDLK_z
        SDLK_DELETE
        # End of ASCII mapped keysyms

        # International keyboard syms
        SDLK_WORLD_0
        SDLK_WORLD_1
        SDLK_WORLD_2
        SDLK_WORLD_3
        SDLK_WORLD_4
        SDLK_WORLD_5
        SDLK_WORLD_6
        SDLK_WORLD_7
        SDLK_WORLD_8
        SDLK_WORLD_9
        SDLK_WORLD_10
        SDLK_WORLD_11
        SDLK_WORLD_12
        SDLK_WORLD_13
        SDLK_WORLD_14
        SDLK_WORLD_15
        SDLK_WORLD_16
        SDLK_WORLD_17
        SDLK_WORLD_18
        SDLK_WORLD_19
        SDLK_WORLD_20
        SDLK_WORLD_21
        SDLK_WORLD_22
        SDLK_WORLD_23
        SDLK_WORLD_24
        SDLK_WORLD_25
        SDLK_WORLD_26
        SDLK_WORLD_27
        SDLK_WORLD_28
        SDLK_WORLD_29
        SDLK_WORLD_30
        SDLK_WORLD_31
        SDLK_WORLD_32
        SDLK_WORLD_33
        SDLK_WORLD_34
        SDLK_WORLD_35
        SDLK_WORLD_36
        SDLK_WORLD_37
        SDLK_WORLD_38
        SDLK_WORLD_39
        SDLK_WORLD_40
        SDLK_WORLD_41
        SDLK_WORLD_42
        SDLK_WORLD_43
        SDLK_WORLD_44
        SDLK_WORLD_45
        SDLK_WORLD_46
        SDLK_WORLD_47
        SDLK_WORLD_48
        SDLK_WORLD_49
        SDLK_WORLD_50
        SDLK_WORLD_51
        SDLK_WORLD_52
        SDLK_WORLD_53
        SDLK_WORLD_54
        SDLK_WORLD_55
        SDLK_WORLD_56
        SDLK_WORLD_57
        SDLK_WORLD_58
        SDLK_WORLD_59
        SDLK_WORLD_60
        SDLK_WORLD_61
        SDLK_WORLD_62
        SDLK_WORLD_63
        SDLK_WORLD_64
        SDLK_WORLD_65
        SDLK_WORLD_66
        SDLK_WORLD_67
        SDLK_WORLD_68
        SDLK_WORLD_69
        SDLK_WORLD_70
        SDLK_WORLD_71
        SDLK_WORLD_72
        SDLK_WORLD_73
        SDLK_WORLD_74
        SDLK_WORLD_75
        SDLK_WORLD_76
        SDLK_WORLD_77
        SDLK_WORLD_78
        SDLK_WORLD_79
        SDLK_WORLD_80
        SDLK_WORLD_81
        SDLK_WORLD_82
        SDLK_WORLD_83
        SDLK_WORLD_84
        SDLK_WORLD_85
        SDLK_WORLD_86
        SDLK_WORLD_87
        SDLK_WORLD_88
        SDLK_WORLD_89
        SDLK_WORLD_90
        SDLK_WORLD_91
        SDLK_WORLD_92
        SDLK_WORLD_93
        SDLK_WORLD_94
        SDLK_WORLD_95

        # Numeric keypad
        SDLK_KP0
        SDLK_KP1
        SDLK_KP2
        SDLK_KP3
        SDLK_KP4
        SDLK_KP5
        SDLK_KP6
        SDLK_KP7
        SDLK_KP8
        SDLK_KP9
        SDLK_KP_PERIOD
        SDLK_KP_DIVIDE
        SDLK_KP_MULTIPLY
        SDLK_KP_MINUS
        SDLK_KP_PLUS
        SDLK_KP_ENTER
        SDLK_KP_EQUALS

        # Arrows + Home/End pad
        SDLK_UP
        SDLK_DOWN
        SDLK_RIGHT
        SDLK_LEFT
        SDLK_INSERT
        SDLK_HOME
        SDLK_END
        SDLK_PAGEUP
        SDLK_PAGEDOWN

        # Function keys
        SDLK_F1
        SDLK_F2
        SDLK_F3
        SDLK_F4
        SDLK_F5
        SDLK_F6
        SDLK_F7
        SDLK_F8
        SDLK_F9
        SDLK_F10
        SDLK_F11
        SDLK_F12
        SDLK_F13
        SDLK_F14
        SDLK_F15

        # Key state modifier keys
        SDLK_NUMLOCK
        SDLK_CAPSLOCK
        SDLK_SCROLLOCK
        SDLK_RSHIFT
        SDLK_LSHIFT
        SDLK_RCTRL
        SDLK_LCTRL
        SDLK_RALT
        SDLK_LALT
        SDLK_RMETA
        SDLK_LMETA
        SDLK_LSUPER # Left "Windows" key
        SDLK_RSUPER # Right "Windows" key
        SDLK_MODE # "Alt Gr" key
        SDLK_COMPOSE # Multi-key compose key

        # Miscellaneous function keys
        SDLK_HELP
        SDLK_PRINT
        SDLK_SYSREQ
        SDLK_BREAK
        SDLK_MENU
        SDLK_POWER # Power Macintosh power key
        SDLK_EURO # Some european keyboards
        SDLK_UNDO # Atari keyboard has Undo

        SDLK_LAST

    # Enumeration of valid key mods (possibly OR'd together)
    enum SDLMod:
        KMOD_NONE
        KMOD_LSHIFT
        KMOD_RSHIFT
        KMOD_LCTRL
        KMOD_RCTRL
        KMOD_LALT
        KMOD_RALT
        KMOD_LMETA
        KMOD_RMETA
        KMOD_NUM
        KMOD_CAPS
        KMOD_MODE
        KMOD_RESERVED
        KMOD_CTRL
        KMOD_SHIFT
        KMOD_ALT
        KMOD_META

    struct SDL_keysym:
        Uint8 scancode
        SDLKey sym
        SDLMod mod
        Uint16 unicode

    struct SDL_ActiveEvent:
        Uint8 type
        Uint8 gain
        Uint8 state

    struct SDL_KeyboardEvent:
        Uint8 type
        Uint8 state
        SDL_keysym keysym

    struct SDL_MouseMotionEvent:
        Uint8 type
        Uint8 which
        Uint8 state
        Uint16 x, y
        Sint16 xrel
        Sint16 yrel

    struct SDL_MouseButtonEvent:
        Uint8 type
        Uint8 which
        Uint8 button
        Uint8 state
        Uint16 x, y

    struct SDL_JoyAxisEvent:
        Uint8 type
        Uint8 which
        Uint8 axis
        Sint16 value

    struct SDL_JoyBallEvent:
        Uint8 type
        Uint8 which
        Uint8 ball
        Sint16 xrel
        Sint16 yrel

    struct SDL_JoyHatEvent:
        Uint8 type
        Uint8 which
        Uint8 hat
        Uint8 value

    struct SDL_JoyButtonEvent:
        Uint8 type
        Uint8 which
        Uint8 button
        Uint8 state

    struct SDL_ResizeEvent:
        Uint8 type
        int w
        int h

    struct SDL_ExposeEvent:
        Uint8 type

    struct SDL_QuitEvent:
        Uint8 type

    struct SDL_UserEvent:
        Uint8 type
        int code
        void *data1
        void *data2

    struct SDL_SysWMmsg:
        pass

    struct SDL_SysWMEvent:
        Uint8 type
        SDL_SysWMmsg *msg

    union SDL_Event:
        Uint8 type
        SDL_ActiveEvent active
        SDL_KeyboardEvent key
        SDL_MouseMotionEvent motion
        SDL_MouseButtonEvent button
        SDL_JoyAxisEvent jaxis
        SDL_JoyBallEvent jball
        SDL_JoyHatEvent jhat
        SDL_JoyButtonEvent jbutton
        SDL_ResizeEvent resize
        SDL_ExposeEvent expose
        SDL_QuitEvent quit
        SDL_UserEvent user
        SDL_SysWMEvent syswm

    enum SDL_eventaction:
        SDL_ADDEVENT
        SDL_PEEKEVENT
        SDL_GETEVENT

    struct SDL_mutex:
        pass

    struct SDL_semaphore:
        pass

    struct SDL_cond:
        pass

    struct SDL_RWops:
        int (*seek)(SDL_RWops *context, int offset, int whence)
        int (*read)(SDL_RWops *context, void *ptr, int size, int maxnum)
        int (*write)(SDL_RWops *context, void *ptr, int size, int num)
        int (*close)(SDL_RWops *context)
        Uint32 type

    struct SDL_Thread:
        pass

    struct _SDL_TimerID:
        pass
    ctypedef _SDL_TimerID *SDL_TimerID

    struct SDL_Rect:
        Sint16 x, y
        Uint16 w, h

    struct SDL_Color:
        Uint8 r
        Uint8 g
        Uint8 b
        Uint8 unused

    struct SDL_Palette:
        int       ncolors
        SDL_Color *colors

    struct SDL_PixelFormat:
        SDL_Palette *palette
        Uint8  BitsPerPixel
        Uint8  BytesPerPixel
        Uint8  Rloss
        Uint8  Gloss
        Uint8  Bloss
        Uint8  Aloss
        Uint8  Rshift
        Uint8  Gshift
        Uint8  Bshift
        Uint8  Ashift
        Uint32 Rmask
        Uint32 Gmask
        Uint32 Bmask
        Uint32 Amask

        Uint32 colorkey

        Uint8  alpha

    struct SDL_Surface:
        Uint32 flags
        SDL_PixelFormat *format
        int w, h
        Uint16 pitch
        void *pixels
        int offset

        SDL_Rect clip_rect
        Uint32 unused1

        Uint32 locked

        unsigned int format_version

        int refcount

    struct SDL_VideoInfo:
        Uint32 hw_available
        Uint32 wm_available
        Uint32 blit_hw
        Uint32 blit_hw_CC
        Uint32 blit_hw_A
        Uint32 blit_sw
        Uint32 blit_sw_CC
        Uint32 blit_sw_A
        Uint32 blit_fill
        Uint32 video_mem
        SDL_PixelFormat *vfmt
        int    current_w
        int    current_h

    struct SDL_Overlay:
        Uint32 format
        int w, h
        int planes
        Uint16 *pitches
        Uint8 **pixels

        Uint32 hw_overlay
        Uint32 UnusedBits

    enum SDL_GLattr:
        SDL_GL_RED_SIZE
        SDL_GL_GREEN_SIZE
        SDL_GL_BLUE_SIZE
        SDL_GL_ALPHA_SIZE
        SDL_GL_BUFFER_SIZE
        SDL_GL_DOUBLEBUFFER
        SDL_GL_DEPTH_SIZE
        SDL_GL_STENCIL_SIZE
        SDL_GL_ACCUM_RED_SIZE
        SDL_GL_ACCUM_GREEN_SIZE
        SDL_GL_ACCUM_BLUE_SIZE
        SDL_GL_ACCUM_ALPHA_SIZE
        SDL_GL_STEREO
        SDL_GL_MULTISAMPLEBUFFERS
        SDL_GL_MULTISAMPLESAMPLES
        SDL_GL_ACCELERATED_VISUAL
        SDL_GL_SWAP_CONTROL

    enum SDL_GrabMode:
        SDL_GRAB_QUERY
        SDL_GRAB_OFF
        SDL_GRAB_ON
        SDL_GRAB_FULLSCREEN

    struct SDL_version:
        Uint8 major
        Uint8 minor
        Uint8 patch

    struct SDL_cond :
        pass
    ctypedef int (*SDL_EventFilter)(SDL_Event *event)
    ctypedef Uint32 (*SDL_TimerCallback)(Uint32 interval)
    ctypedef Uint32 (*SDL_NewTimerCallback)(Uint32 interval, void *param)
    # Types }}}

    # Functions {{{
    int SDL_Init(Uint32 flags)
    int SDL_InitSubSystem(Uint32 flags)
    void SDL_QuitSubSystem(Uint32 flags)
    Uint32 SDL_WasInit(Uint32 flags)
    void SDL_Quit()

    int SDL_main(int argc, char *argv[])
    char * SDL_getenv(char *name)
    int SDL_putenv(char *variable)
    void SDL_qsort(void *base, size_t nmemb, size_t size, int (*compare)(void *, void *))
    void * SDL_memset(void *dst, int c, size_t len)
    void * SDL_memcpy(void *dst, void *src, size_t len)
    void * SDL_revcpy(void *dst, void *src, size_t len)
    int SDL_memcmp(void *s1, void *s2, size_t len)
    size_t SDL_strlen(char *string)
    size_t SDL_strlcpy(char *dst, char *src, size_t maxlen)
    size_t SDL_strlcat(char *dst, char *src, size_t maxlen)
    char * SDL_strdup(char *string)
    char * SDL_strrev(char *string)
    char * SDL_strupr(char *string)
    char * SDL_strlwr(char *string)
    char * SDL_strchr(char *string, int c)
    char * SDL_strrchr(char *string, int c)
    char * SDL_strstr(char *haystack, char *needle)
    char * SDL_ltoa(long value, char *string, int radix)
    char * SDL_ultoa(unsigned long value, char *string, int radix)
    long SDL_strtol(char *string, char **endp, int base)
    unsigned long SDL_strtoul(char *string, char **endp, int base)
    char* SDL_lltoa(Sint64 value, char *string, int radix)
    char* SDL_ulltoa(Uint64 value, char *string, int radix)
    Sint64 SDL_strtoll(char *string, char **endp, int base)
    Uint64 SDL_strtoull(char *string, char **endp, int base)
    double SDL_strtod(char *string, char **endp)
    int SDL_strcmp(char *str1, char *str2)
    int SDL_strncmp(char *str1, char *str2, size_t maxlen)
    int SDL_strcasecmp(char *str1, char *str2)
    int SDL_strncasecmp(char *str1, char *str2, size_t maxlen)
    int SDL_sscanf(char *text, char *fmt, ...)
    int SDL_snprintf(char *text, size_t maxlen, char *fmt, ...)
    SDL_iconv_t SDL_iconv_open(char *tocode, char *fromcode)
    int SDL_iconv_close(SDL_iconv_t cd)
    size_t SDL_iconv(SDL_iconv_t cd, char **inbuf, size_t *inbytesleft, char **outbuf, size_t *outbytesleft)
    char * SDL_iconv_string(char *tocode, char *fromcode, char *inbuf, size_t inbytesleft)
    int SDL_AudioInit(char *driver_name)
    void SDL_AudioQuit()
    char * SDL_AudioDriverName(char *namebuf, int maxlen)
    int SDL_OpenAudio(SDL_AudioSpec *desired, SDL_AudioSpec *obtained)
    SDL_audiostatus SDL_GetAudioStatus()
    void SDL_PauseAudio(int pause_on)
    SDL_AudioSpec * SDL_LoadWAV_RW(SDL_RWops *src, int freesrc, SDL_AudioSpec *spec, Uint8 **audio_buf, Uint32 *audio_len)
    void SDL_FreeWAV(Uint8 *audio_buf)
    int SDL_BuildAudioCVT(SDL_AudioCVT *cvt, Uint16 src_format, Uint8 src_channels, int src_rate, Uint16 dst_format, Uint8 dst_channels, int dst_rate)
    int SDL_ConvertAudio(SDL_AudioCVT *cvt)
    void SDL_MixAudio(Uint8 *dst, Uint8 *src, Uint32 len, int volume)
    void SDL_LockAudio()
    void SDL_UnlockAudio()
    void SDL_CloseAudio()
    int SDL_CDNumDrives()
    char * SDL_CDName(int drive)
    SDL_CD * SDL_CDOpen(int drive)
    CDstatus SDL_CDStatus(SDL_CD *cdrom)
    int SDL_CDPlayTracks(SDL_CD *cdrom, int start_track, int start_frame, int ntracks, int nframes)
    int SDL_CDPlay(SDL_CD *cdrom, int start, int length)
    int SDL_CDPause(SDL_CD *cdrom)
    int SDL_CDResume(SDL_CD *cdrom)
    int SDL_CDStop(SDL_CD *cdrom)
    int SDL_CDEject(SDL_CD *cdrom)
    void SDL_CDClose(SDL_CD *cdrom)
    SDL_bool SDL_HasRDTSC()
    SDL_bool SDL_HasMMX()
    SDL_bool SDL_HasMMXExt()
    SDL_bool SDL_Has3DNow()
    SDL_bool SDL_Has3DNowExt()
    SDL_bool SDL_HasSSE()
    SDL_bool SDL_HasSSE2()
    SDL_bool SDL_HasAltiVec()
    Uint16 SDL_Swap16(Uint16 x)
    Uint32 SDL_Swap32(Uint32 x)
    Uint64 SDL_Swap64(Uint64 x)
    void SDL_SetError(char *fmt, ...)
    char * SDL_GetError()
    void SDL_ClearError()
    void SDL_Error(SDL_errorcode code)
    void SDL_PumpEvents()
    int SDL_PeepEvents(SDL_Event *events, int numevents, SDL_eventaction action, Uint32 mask)
    int SDL_PollEvent(SDL_Event *event)
    int SDL_WaitEvent(SDL_Event *event)
    int SDL_PushEvent(SDL_Event *event)
    void SDL_SetEventFilter(SDL_EventFilter filter)
    SDL_EventFilter SDL_GetEventFilter()
    Uint8 SDL_EventState(Uint8 type, int state)
    void * SDL_LoadObject(char *sofile)
    void * SDL_LoadFunction(void *handle, char *name)
    void SDL_UnloadObject(void *handle)
    SDL_mutex * SDL_CreateMutex()
    int SDL_mutexP(SDL_mutex *mutex)
    int SDL_mutexV(SDL_mutex *mutex)
    void SDL_DestroyMutex(SDL_mutex *mutex)
    SDL_semaphore * SDL_CreateSemaphore(Uint32 initial_value)
    void SDL_DestroySemaphore(SDL_semaphore *sem)
    int SDL_SemWait(SDL_semaphore *sem)
    int SDL_SemTryWait(SDL_semaphore *sem)
    int SDL_SemWaitTimeout(SDL_semaphore *sem, Uint32 ms)
    int SDL_SemPost(SDL_semaphore *sem)
    Uint32 SDL_SemValue(SDL_semaphore *sem)
    SDL_cond * SDL_CreateCond()
    void SDL_DestroyCond(SDL_cond *cond)
    int SDL_CondSignal(SDL_cond *cond)
    int SDL_CondBroadcast(SDL_cond *cond)
    int SDL_CondWait(SDL_cond *cond, SDL_mutex *mut)
    int SDL_CondWaitTimeout(SDL_cond *cond, SDL_mutex *mutex, Uint32 ms)
    SDL_RWops * SDL_RWFromFile(char *file, char *mode)
    SDL_RWops * SDL_RWFromFP(FILE *fp, int autoclose)
    SDL_RWops * SDL_RWFromMem(void *mem, int size)
    SDL_RWops * SDL_RWFromConstMem(void *mem, int size)
    SDL_RWops * SDL_AllocRW()
    void SDL_FreeRW(SDL_RWops *area)
    Uint16 SDL_ReadLE16(SDL_RWops *src)
    Uint16 SDL_ReadBE16(SDL_RWops *src)
    Uint32 SDL_ReadLE32(SDL_RWops *src)
    Uint32 SDL_ReadBE32(SDL_RWops *src)
    Uint64 SDL_ReadLE64(SDL_RWops *src)
    Uint64 SDL_ReadBE64(SDL_RWops *src)
    int SDL_WriteLE16(SDL_RWops *dst, Uint16 value)
    int SDL_WriteBE16(SDL_RWops *dst, Uint16 value)
    int SDL_WriteLE32(SDL_RWops *dst, Uint32 value)
    int SDL_WriteBE32(SDL_RWops *dst, Uint32 value)
    int SDL_WriteLE64(SDL_RWops *dst, Uint64 value)
    int SDL_WriteBE64(SDL_RWops *dst, Uint64 value)
    SDL_Thread * SDL_CreateThread(int (*fn)(void *), void *data)
    Uint32 SDL_ThreadID()
    Uint32 SDL_GetThreadID(SDL_Thread *thread)
    void SDL_WaitThread(SDL_Thread *thread, int *status)
    void SDL_KillThread(SDL_Thread *thread)
    Uint32 SDL_GetTicks()
    void SDL_Delay(Uint32 ms)
    int SDL_SetTimer(Uint32 interval, SDL_TimerCallback callback)
    SDL_TimerID SDL_AddTimer(Uint32 interval, SDL_NewTimerCallback callback, void *param)
    SDL_bool SDL_RemoveTimer(SDL_TimerID t)
    int SDL_blit(SDL_Surface *src, SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect)
    int SDL_VideoInit(char *driver_name, Uint32 flags)
    void SDL_VideoQuit()
    char * SDL_VideoDriverName(char *namebuf, int maxlen)
    SDL_Surface * SDL_GetVideoSurface()
    SDL_VideoInfo * SDL_GetVideoInfo()
    int SDL_VideoModeOK(int width, int height, int bpp, Uint32 flags)
    SDL_Rect ** SDL_ListModes(SDL_PixelFormat *format, Uint32 flags)
    SDL_Surface * SDL_SetVideoMode (int width, int height, int bpp, Uint32 flags)
    void SDL_UpdateRects (SDL_Surface *screen, int numrects, SDL_Rect *rects)
    void SDL_UpdateRect (SDL_Surface *screen, Sint32 x, Sint32 y, Uint32 w, Uint32 h)
    int SDL_Flip(SDL_Surface *screen)
    int SDL_SetGamma(float red, float green, float blue)
    int SDL_SetGammaRamp(Uint16 *red, Uint16 *green, Uint16 *blue)
    int SDL_GetGammaRamp(Uint16 *red, Uint16 *green, Uint16 *blue)
    int SDL_SetColors(SDL_Surface *surface, SDL_Color *colors, int firstcolor, int ncolors)
    int SDL_SetPalette(SDL_Surface *surface, int flags, SDL_Color *colors, int firstcolor, int ncolors)
    Uint32 SDL_MapRGB (SDL_PixelFormat * format, Uint8 r, Uint8 g, Uint8 b)
    Uint32 SDL_MapRGBA (SDL_PixelFormat * format, Uint8 r, Uint8 g, Uint8 b, Uint8 a)
    void SDL_GetRGB(Uint32 pixel, SDL_PixelFormat *fmt, Uint8 *r, Uint8 *g, Uint8 *b)
    void SDL_GetRGBA(Uint32 pixel, SDL_PixelFormat *fmt, Uint8 *r, Uint8 *g, Uint8 *b, Uint8 *a)
    SDL_Surface * SDL_CreateRGBSurface (Uint32 flags, int width, int height, int depth, Uint32 Rmask, Uint32 Gmask, Uint32 Bmask, Uint32 Amask)
    SDL_Surface * SDL_CreateRGBSurfaceFrom(void *pixels, int width, int height, int depth, int pitch, Uint32 Rmask, Uint32 Gmask, Uint32 Bmask, Uint32 Amask)
    void SDL_FreeSurface(SDL_Surface *surface)
    int SDL_LockSurface(SDL_Surface *surface)
    void SDL_UnlockSurface(SDL_Surface *surface)
    SDL_Surface * SDL_LoadBMP_RW(SDL_RWops *src, int freesrc)
    int SDL_SaveBMP_RW (SDL_Surface *surface, SDL_RWops *dst, int freedst)
    int SDL_SetColorKey (SDL_Surface *surface, Uint32 flag, Uint32 key)
    int SDL_SetAlpha(SDL_Surface *surface, Uint32 flag, Uint8 alpha)
    SDL_bool SDL_SetClipRect(SDL_Surface *surface, SDL_Rect *rect)
    void SDL_GetClipRect(SDL_Surface *surface, SDL_Rect *rect)
    SDL_Surface * SDL_ConvertSurface (SDL_Surface *src, SDL_PixelFormat *fmt, Uint32 flags)
    int SDL_UpperBlit (SDL_Surface *src, SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect)
    int SDL_LowerBlit (SDL_Surface *src, SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect)
    int SDL_FillRect (SDL_Surface *dst, SDL_Rect *dstrect, Uint32 color)
    SDL_Surface * SDL_DisplayFormat(SDL_Surface *surface)
    SDL_Surface * SDL_DisplayFormatAlpha(SDL_Surface *surface)
    SDL_Overlay * SDL_CreateYUVOverlay(int width, int height, Uint32 format, SDL_Surface *display)
    int SDL_LockYUVOverlay(SDL_Overlay *overlay)
    void SDL_UnlockYUVOverlay(SDL_Overlay *overlay)
    int SDL_DisplayYUVOverlay(SDL_Overlay *overlay, SDL_Rect *dstrect)
    void SDL_FreeYUVOverlay(SDL_Overlay *overlay)
    int SDL_GL_LoadLibrary(char *path)
    void * SDL_GL_GetProcAddress(char* proc)
    int SDL_GL_SetAttribute(SDL_GLattr attr, int value)
    int SDL_GL_GetAttribute(SDL_GLattr attr, int* value)
    void SDL_GL_SwapBuffers()
    void SDL_GL_UpdateRects(int numrects, SDL_Rect* rects)
    void SDL_GL_Lock()
    void SDL_GL_Unlock()
    void SDL_WM_SetCaption(char *title, char *icon)
    void SDL_WM_GetCaption(char **title, char **icon)
    void SDL_WM_SetIcon(SDL_Surface *icon, Uint8 *mask)
    int SDL_WM_IconifyWindow()
    int SDL_WM_ToggleFullScreen(SDL_Surface *surface)
    SDL_GrabMode SDL_WM_GrabInput(SDL_GrabMode mode)
    int SDL_SoftStretch(SDL_Surface *src, SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect)
    SDL_version * SDL_Linked_Version()
    # Functions }}}

