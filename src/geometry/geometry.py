import math
import numbers
import types
from copy import copy
from array import array
from collections import defaultdict
from itertools import islice
from ._util import *
from .relations import *
__all__ = ['Vector', 'normalize', 'cross', 'Edge', 'Line', 'Ray', 'Plane', 'Triangle', 'Model']

class Vector:
    __slots__ = ['xyz']
    def __init__(self, *args):
        '''
        init(): creates a vector with xyz = (0.0, 0.0, 0.0)
        init(x, y, z): creates a vector with xyz = (x, y, z)
        init(iterable or generator): creates a vector with xyz = tuple(iterable or generator)
        '''
        if len(args) == 0:
            self.xyz = (0.0, 0.0, 0.0)
        elif len(args) == 1:
            self.xyz = tuple(args[0])
        else:
            self.xyz = tuple(args)

    x = property(lambda self: self.xyz[0])
    y = property(lambda self: self.xyz[1])
    z = property(lambda self: self.xyz[2])

    def __eq__(self,other):
        if other is None:
            return False
        return all(eq(a, b) for a, b in zip(self.xyz, other.xyz))

    def __hash__(self):
        return id(self)

    def __add__(self,other):
        return Vector(a + b for a, b in zip(self.xyz, other.xyz))

    def __sub__(self,other):
        return Vector(a - b for a, b in zip(self.xyz, other.xyz))

    def __mul__(self,other):
        if isinstance(other,Vector):
            return sum(a * b for a, b in zip(self.xyz, other.xyz))
        else:
            return Vector(a * other for a in self.xyz)

    def __rmul__(self,other):
        return Vector(a * other for a in self.xyz)

    def __truediv__(self, other):
        return Vector(a / other for a in self.xyz)

    def __repr__(self):
        return "Vector{0}".format(self.xyz)

    def __neg__(self):
        return self * (-1)

    def __abs__(self):
        '''Length of vector'''
        return math.sqrt(self * self)

    def __pow__(self, other):
        if isinstance(other, numbers.Real) and int(other) == other:
            i = int(other)
            if i == 1:
                return self
            else:
                return (a ** i for a in self.xyz)
        else:
            return NotImplemented

    len = property(__abs__)

def cross(u, v):
    ux, uy, uz = u.xyz
    vx, vy, vz = v.xyz
    return Vector(uy * vz - uz * vy, uz * vx - ux * vz, ux * vy - uy * vx)

def normalize(v):
    l = v.len
    if l != 0:
        return v / l
    else:
        return v

class Line:
    def __init__(self, *args, point = None, tangent = None):
        '''Line(a, b): line between points a, b
        Line(pair): line between pair[0] and pair[1]
        Line(point = a, tangent = v): line containing a, colinear to v'''
        if len(args) == 0:
            assert point is not None and tangent is not None
            self.point = point
            self.tangent = normalize(tangent)
        elif len(args) == 1:
            assert points is None and tangent is None
            self.__init__(*args[0])
        elif len(args) == 2:
            assert points is None and tangent is None
            self.point = args[0]
            self.tangent = normalize(args[1] - args[0])
        else:
            raise AttributeError

    def __eq__(self,other):
        if other is None:
            return False
        return intersect(self, other.point) and colinear(self.tangent, other.tangent)

    def distance(self, point):
        l = (point - self.point) * self.tangent
        return abs(point - self.point - l * self.tangent)

    def point(self, t):
        return self.point + t * self.tangent

class Plane:
    def __init__(self, *args, point = None, normal = None):
        '''Plane(point, normal): Plane containing point, perpendicular to normal
        Plane(A, B, C): Plane defined by points A, B and C, with normal (B - A) x (C - A)
        '''
        if len(args) == 0:
            self.point = point
            self.normal = normal.normalise()
            self.d = -(self.normal * self.point)
        elif len(args) == 3:
            self.__init__(args[0], (args[1] - args[0]).cross(args[2] - args[0]))
        else:
            raise AttributeError

class Ray:
    def __init__(self, start, direction):
        self.start = start
        self.direction = direction

    def line(self):
        return Line(self.start,self.direction)

class Edge:
    __slots__ = ['vertices', 'neighbour', 'triangle']
    def __init__(self,*args):
        if len(args) == 0:
            self.vertices = (Vector(), Vector())
            self.neighbour = None
            self.triangle = None
        else:
            self.vertices = (args[0], args[1])
            self.neighbour = None
            if len(args) == 3:
            	self.triangle = args[2]
            else:
                self.triangle = None

    def __eq__(self,other):
        return (self.vertex1,self.vertex2) == (other.vertex1,other.vertex2) or (self.vertex1,self.vertex2) == (other.vertex2,other.vertex1)

    def __str__(self):
        return "Edge{0}".format(self.vertices)

class Triangle:
    '''Triangle with 3 points'''
    def __init__(self, a, b, c):
        '''Triangle(a, b, c): new triangle with points v1, v2 and v3'''
        self.vertices = (a, b, c)
        self.edges = (Edge(b, c), Edge(c, a), Edge(a, b))

    a = property(lambda self: self.vertices[0])
    b = property(lambda self: self.vertices[1])
    c = property(lambda self: self.vertices[2])

    def normal(self):
        return normalize(cross(self.b - self.a, self.c - self.a))

class Model:
    def __init__(self,*args,smooth = True):
        self.dirty = True
        self.faces = list()
        self.points = list()
        self.smooth = smooth
        self.put(args)

    def put(self,triangles):
        for triangle in triangles:
            points = list(triangle.vertices)
            for i, p in zip(range(3), points):
                try:
                    points[i] = self.points[self.points.index(p)]
                except ValueError:
                    self.points.append(p)
            new_face = Triangle(*points)
            for face in self.faces:
                for edge in face.edge.values():
                    for new_edge in new_face.edge.values():
                        if new_edge == edge:
                            new_edge.nextEdge = edge
                            edge.nextEdge = new_edge
            self.faces.append(new_face)
        self.dirty = True

    def refill_arrays(self):
        self.cached_vertices = array('d')
        self.cached_normals = array('d')
        if self.smooth:
            normals = defaultdict(Vector)
            centre = sum(self.points, Vector())
            centre /= len(self.points)
            for point in self.points:
                normals[point] = (point - centre).normal()
            for face in self.faces:
                for vertex in (face.vertex['A'], face.vertex['B'], face.vertex['C']):
                    self.cached_vertices.append(vertex.x)
                    self.cached_vertices.append(vertex.y)
                    self.cached_vertices.append(vertex.z)
                    normal = normals[vertex]
                    self.cached_normals.append(normal.x)
                    self.cached_normals.append(normal.y)
                    self.cached_normals.append(normal.z)
        else:
            for face in self.faces:
                normal = face.normal()
                for vertex in (face.vertex['A'], face.vertex['B'], face.vertex['C']):
                    self.cached_vertices.append(vertex.x)
                    self.cached_vertices.append(vertex.y)
                    self.cached_vertices.append(vertex.z)
                    self.cached_normals.append(normal.x)
                    self.cached_normals.append(normal.y)
                    self.cached_normals.append(normal.z)

        self.dirty = False

    def arrays(self):
        '''Returns a tuple (vertices, normals) of arrays of doubles,
        each containing 9*T elements,
        where T is the number of triangles in the model'''
        if self.dirty:
            self.refill_arrays()
        return (self.cached_vertices, self.cached_normals)

