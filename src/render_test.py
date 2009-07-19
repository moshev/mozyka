import plum
import geometry

class Cube(geometry.Model):
    vertices = [
            geometry.Vector(0, 0, 0),
            geometry.Vector(0, 0, 1),
            geometry.Vector(0, 1, 1),
            geometry.Vector(0, 1, 0),
            geometry.Vector(1, 0, 0),
            geometry.Vector(1, 0, 1),
            geometry.Vector(1, 1, 1),
            geometry.Vector(1, 1, 0)]
    def __init__(self):
        geometry.Model.__init__(self, *[geometry.Triangle(Cube.vertices[a], Cube.vertices[b], Cube.vertices[c]) for (a, b, c) in [
            (0, 1, 3),
            (1, 2, 3),

            (0, 4, 3),
            (4, 7, 3),

            (4, 5, 7),
            (5, 6, 7),

            (5, 1, 6),
            (1, 2, 6),

            (3, 7, 2),
            (7, 6, 2),

            (0, 1, 4),
            (1, 5, 4)]])


class Renderer:
    def __init__(self, model, gl):
        self.model = model
        self.gl = gl

    def __call__(self):
        self.gl.begin_scene()
        self.gl.render_triangles(*self.model.arrays())
        self.gl.end_scene()

plum.init()
w = plum.init_screen(800, 600, "Press A or B", "")
gl = plum.GL(800, 600)

cube = Cube()
render = Renderer(cube, gl)

w.key.add_handler(plum.keycode['b'], lambda state: render() if state == plum.keystate.RELEASED else False)

render()
w.main_loop()

plum.quit()

