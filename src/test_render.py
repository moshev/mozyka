import plum
from geometry import *

class Renderer:
    def __init__(self, model, gl, translate = Vector(0, 0, -1.5), scale = Vector(1, 1, 1), rotate = Vector(0, 0, 0)):
        self.model = model
        self.gl = gl
        self.translate = translate
        self.scale = scale
        self.rotate = rotate

    def __call__(self):
        self.gl.clear_screen()
        self.gl.begin_scene()
        self.gl.set_colour(1, 1, 1)
        self.gl.translate(self.translate.x, self.translate.y, self.translate.z)
        self.gl.rotate(self.rotate.x, self.rotate.y, self.rotate.z)
        self.gl.scale(self.scale.x, self.scale.y, self.scale.z)
        vertices, normals = self.model.arrays()
        self.gl.render_triangles(vertices, normals)
        self.gl.end_scene()
        error = gl.last_error()
        if error != 0:
            print("GL error: {0}".format(error))

class RenderOnPress:
    def __init__(self, renderer):
        self.renderer = renderer

    def __call__(self, state):
        if state == plum.keystate.RELEASED:
            self.renderer()

class Dragger:
    def __init__(self, renderer):
        self.renderer = renderer

    def start(self, x, y):
        print("Starting drag at {0}, {1}".format(x, y))

    def drag(self, x, y, xrel, yrel):
        self.renderer.translate += Vector(xrel/400, -yrel/300, 0)
        self.renderer()

    def stop(self, x, y):
        print("Stopping drag at {0}, {1}".format(x, y))

class Rotater:
    def __init__(self, renderer):
        self.renderer = renderer

    def start(self, x, y):
        print("Starting rotate at {0}, {1}".format(x, y))

    def drag(self, x, y, xrel, yrel):
        self.renderer.rotate += Vector(-yrel, xrel, 0)
        self.renderer()

    def stop(self, x, y):
        print("Stopping rotate at {0}, {1}".format(x, y))

class ModelSwitcherOnPress:
    def __init__(self, renderer, models):
        self.renderer = renderer
        self.models = models
        self.index = 0

    def __call__(self, state):
        if state == plum.keystate.RELEASED:
            self.index += 1
            if self.index >= len(self.models):
                self.index = 0
            self.renderer.model = self.models[self.index]
            self.renderer()

plum.init()
w = plum.init_screen(800, 600, "Press space or drag mouse", "")
err = plum.sdl_error()
if err != "":
    print("SDL error: " + err)
gl = plum.GL(800, 600)
cube, rect, ico = Cube(), Rectangle(), Icosahedron()
render = Renderer(cube, gl, translate=Vector(-0.5, -0.5, -2.6))
w.key.add_handler(plum.keycode['space'], ModelSwitcherOnPress(render, (cube, rect, ico)))
w.mouse.add_draghandler(1, Dragger(render))
w.mouse.add_draghandler(3, Rotater(render))
render()

w.main_loop()

plum.quit()

