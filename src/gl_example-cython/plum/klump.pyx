cimport gl
cimport sdl

def init():
    sdl.SDL_Init(sdl.SDL_INIT_VIDEO | sdl.SDL_INIT_AUDIO)

def quit():
    sdl.SDL_Quit()

cdef class Surface:
    cdef sdl.SDL_Surface* sdl_surface

def set_video_params(width, height, title, icon):
    cdef sdl.SDL_Surface* sdl_surface = sdl.SDL_SetVideoMode(width, height, 32, sdl.SDL_OPENGL)
    iconbytes = icon.encode(u"utf-8")
    titlebytes = title.encode(u"utf-8")
    sdl.SDL_WM_SetCaption(titlebytes, iconbytes)
    s = Surface()
    s.sdl_surface = sdl_surface
    return s

