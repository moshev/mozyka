from . import klump

# used as a stack.
draghandlers = {n:[] for n in range (1,9)}
clickhandlers = {n:[] for n in range (1,9)}

def draghandler(button, action):
    '''button is a number from 1 through 8
    action is an object with three methods:
    start(x, y) - called at start of drag. x, y - mouse coordinates
    drag(x, y, xrel, yrel) - called while dragging
    stop(x, y) - called at end of drag. x, y - mouse coordinates
    '''
    draghandlers[button].append(action)

def clickhandler(button, action):
    '''action is a callable that is called when the given button is clicked.
    takes two arguments - x and y coordinate'''
    clickhandlers[button].append(action)

def startdrag(button, x, y):
    for handler in reversed(draghandlers[button]):
        handler.start(x, y)

def drag(button, x, y, xrel, yrel):
    for handler in reversed(draghandlers[button]):
        handler.drag(x, y, xrel, yrel)

def stopdrag(button, x, y):
    for handler in reversed(draghandlers[button]):
        handler.stop(x, y)

def click(button, x, y):
    for handler in reversed(clickhandlers[button]):
        handler(x, y)

last_x = 0
last_y = 0
dragging = set()
def process_event(event):
    global last_x, last_y, dragging
    if isinstance(event, klump.MouseButtonEvent):
        if event.state == klump.SDL_PRESSED:
            last_x, last_y = event.x, event.y
        elif event.state == klump.SDL_RELEASED:
            if event.button in dragging:
                stopdrag(event.button, event.x, event.y)
                dragging.remove(event.button)
            click(event.button, event.x, event.y)
    elif isinstance(event, klump.MouseMotionEvent):
        for button in event.buttons:
            if button not in dragging:
                startdrag(button, last_x, last_y)
                dragging.add(button)
            drag(button, event.x, event.y, event.xrel, event.yrel)

