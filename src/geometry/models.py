from .geometry import *
from .relations import *
from math import *

__all__ = ['Cube', 'Rectangle', 'Icosahedron']

class Cube(Model):
    vertices = [
            Vector(0, 0, 0),
            Vector(0, 0, 1),
            Vector(0, 1, 1),
            Vector(0, 1, 0),
            Vector(1, 0, 0),
            Vector(1, 0, 1),
            Vector(1, 1, 1),
            Vector(1, 1, 0)]
    def __init__(self):
        Model.__init__(self, *[Triangle(Cube.vertices[a], Cube.vertices[b], Cube.vertices[c]) for (a, b, c) in [
            (0, 1, 3),
            (3, 1, 2),

            (0, 3, 4),
            (4, 3, 7),

            (4, 7, 5),
            (5, 7, 6),

            (1, 5, 2),
            (2, 5, 6),

            (3, 2, 7),
            (7, 2, 6),

            (0, 4, 1),
            (1, 4, 5)]])
        self.smooth = False

class Rectangle(Model):
    def __init__(self):
        vertices = [
                Vector(0, 0, 0),
                Vector(1, 0, 0),
                Vector(1, 1, 0),
                Vector(0, 1, 0)]
        Model.__init__(self, Triangle(vertices[0], vertices[1], vertices[3]),
                Triangle(vertices[3], vertices[1], vertices[2]))
        self.smooth = False

class Icosahedron(Model):
    def __init__(self):
        Model.__init__(self, smooth = True)
        pi_5 = pi / 5.0
        cos_2pi_5 = cos(2.0 * pi_5)
        top = Vector(0, 1, 0)
        upperring = [normalize(Vector(sin(c * pi_5), cos_2pi_5 / (1 - cos_2pi_5), cos(c * pi_5))) for c in range(0, 10, 2)]
        lowerring = [normalize(Vector(sin(c * pi_5), -cos_2pi_5 / (1 - cos_2pi_5), cos(c * pi_5))) for c in range(-1, 9, 2)]
        bottom = Vector(0, -1, 0)
        triangles = []
        for i1, i2 in zip(range(5), ((n + 1) % 5 for n in range(5))):
            triangles.append(Triangle(top, upperring[i1], upperring[i2]))
            triangles.append(Triangle(upperring[i1], lowerring[i1], lowerring[i2]))
            triangles.append(Triangle(lowerring[i2], upperring[i2], upperring[i1]))
            triangles.append(Triangle(bottom, lowerring[i2], lowerring[i1]))
        self.put(triangles)
