cimport gl
cimport sdl

def init():
    sdl.SDL_Init(sdl.SDL_INIT_VIDEO | sdl.SDL_INIT_AUDIO)

def quit():
    sdl.SDL_Quit()

class Window:
    def __init__(self, width, height, title, icon):
        sdl.SDL_SetVideoMode(width, height, 32, sdl.SDL_OPENGL)
        iconbytes = icon.encode(u"utf-8")
        titlebytes = title.encode(u"utf-8")
        sdl.SDL_WM_SetCaption(titlebytes, iconbytes)

