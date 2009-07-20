from collections import defaultdict, namedtuple
from . import klump

keycode = {}
for name in dir(klump):
    if name.startswith('SDLK_'):
        keycode[name.replace('SDLK_', '', 1).lower()] = eval('klump.{0}'.format(name))
    elif name.startswith('KMOD_'):
        keycode[name.replace('KMOD_', 'MOD_', 1)] = eval('klump.{0}'.format(name))

keyname = {code: name for name, code in keycode.items()}

keystate = namedtuple('KeyState', 'PRESSED RELEASED')(klump.SDL_PRESSED, klump.SDL_RELEASED)

class Key:
    def __init__(self):
        self.handlers = defaultdict(list)
    
    def invoke_handlers(self, key, state):
        for handler in reversed(self.handlers[key]):
            handler(state)
    
    def add_handler(self, key, action):
        '''
        key is a keycodes
        action is a callable, taking one argument - the key state (keystate.PRESSED or keystate.RELEASED)
        '''
        self.handlers[key].append(action)
    
    def process_event(self, event):
        '''event - a klump.KeyEvent event'''
        self.invoke_handlers(event.code, event.state)

class Mouse:
    class DragState:
        def __init__(self):
            self.start_x = 0
            self.start_y = 0
            self.buttons = set()

    def __init__(self):
        self.draghandlers = defaultdict(list)
        self.clickhandlers = defaultdict(list)
        self.dragstate = self.DragState()
    
    def add_draghandler(self, button, action):
        '''button is a number from 1 through 8
        action is an object with three methods:
        start(x, y) - called at start of drag. x, y - mouse coordinates
        drag(x, y, xrel, yrel) - called while dragging
        stop(x, y) - called at end of drag. x, y - mouse coordinates
        '''
        self.draghandlers[button].append(action)
    
    def add_clickhandler(self, button, action):
        '''action is a callable that is called when the given button is clicked.
        takes two arguments - x and y coordinate'''
        self.clickhandlers[button].append(action)
    
    def startdrag(self, button, x, y):
        for handler in reversed(self.draghandlers[button]):
            handler.start(x, y)
    
    def drag(self, button, x, y, xrel, yrel):
        for handler in reversed(self.draghandlers[button]):
            handler.drag(x, y, xrel, yrel)
    
    def stopdrag(self, button, x, y):
        for handler in reversed(self.draghandlers[button]):
            handler.stop(x, y)
    
    def click(self, button, x, y):
        for handler in reversed(self.clickhandlers[button]):
            handler(x, y)
    
    def process_event(self, event):
        if isinstance(event, klump.MouseButtonEvent):
            if event.state == klump.SDL_PRESSED:
                self.dragstate.start_x, self.dragstate.start_y = event.x, event.y
            elif event.state == klump.SDL_RELEASED:
                if event.button in self.dragstate.buttons:
                    self.stopdrag(event.button, event.x, event.y)
                    self.dragstate.buttons.remove(event.button)
                self.click(event.button, event.x, event.y)
        elif isinstance(event, klump.MouseMotionEvent):
            for button in event.buttons:
                if button not in self.dragstate.buttons:
                    self.startdrag(button, self.dragstate.start_x, self.dragstate.start_y)
                    self.dragstate.buttons.add(button)
                self.drag(button, event.x, event.y, event.xrel, event.yrel)

class Screen:
    def __init__(self, hw_surface):
        self.hw_surface = hw_surface
        self.key = Key()
        self.mouse = Mouse()

    def main_loop(self):
        '''
        Waits for events until it receives a Quit event
        '''
        while True:
            event = klump.wait_for_next_event()
            if isinstance(event, klump.KeyEvent):
                self.key.process_event(event)
            elif isinstance(event, (klump.MouseButtonEvent, klump.MouseMotionEvent)):
                self.mouse.process_event(event)
            elif isinstance(event, klump.QuitEvent):
                break
            else:
                print("Unsupported Event ", event.type)

def init_screen(width, height, title, icon):
    """
    width and height - numbers in pixels
    title - string
    icon - string
    """
    hw_surface = klump.set_video_params(width, height, title.encode("utf-8"), icon.encode("utf-8"))
    return Screen(hw_surface)

