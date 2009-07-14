from . import klump
from .klump import init, quit
from . import key

def init_main_window(width, height, title, icon):
    """
    width and height - numbers in pixels
    title - string
    icon - string
    """
    return klump.set_video_params(width, height, title.encode("utf-8"), icon.encode("utf-8"))

def main_loop():
    '''
    Waits for events until it receives a Quit event
    '''
    while True:
        event = klump.wait_for_next_event()
        if isinstance(event, klump.KeyEvent):
            key.Handler.invoke_handlers(event.code)
        elif isinstance(event, klump.UnsupportedEvent):
            print("Unsupported Event ", event.type)
        elif isinstance(event, klump.QuitEvent):
            break

