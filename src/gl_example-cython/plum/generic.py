from . import klump
from .klump import init, quit
from . import key, mouse

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
            key.process_event(event)
        elif isinstance(event, (klump.MouseButtonEvent, klump.MouseMotionEvent)):
            mouse.process_event(event)
        elif isinstance(event, klump.QuitEvent):
            break
        else:
            print("Unsupported Event ", event.type)

