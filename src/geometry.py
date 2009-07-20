import math
import copy
from array import array
from collections import defaultdict
epsilon = 0.000001
def eq(a, b):
    return abs(a - b) < epsilon

"""3-dimensional vector with coordinates"""
class Vector:
    __slots__ = ('x', 'y', 'z')
    def __init__(self,*args):
        if args is ():
            self.x,self.y,self.z = 0,0,0
        else:
            self.x=args[0]
            self.y=args[1]
            self.z=args[2]

    def __eq__(self,other):
        if other is None:
            return False
        return eq(self.x, other.x) and eq(self.y, other.y) and eq(self.z, other.z)

    def __hash__(self):
        return id(self)

    def __add__(self,other):
        return Vector(self.x + other.x, self.y + other.y, self.z + other.z)

    def __iadd__(self, other):
        self.x += other.x
        self.y += other.y
        self.z += other.z
        return self

    def __sub__(self,other):
        return Vector(self.x - other.x, self.y - other.y, self.z - other.z)

    def __isub__(self, other):
        self.x -= other.x
        self.y -= other.y
        self.z -= other.z
        return self

    def __mul__(self,other):
        if isinstance(other,Vector):
            return self.x * other.x + self.y * other.y + self.z * other.z
        else:
            return Vector(self.x * other, self.y * other, self.z * other)

    def __imul__(self, other):
        self.x *= other
        self.y *= other
        self.z *= other
        return self

    def __truediv__(self, other):
        return Vector(self.x / other, self.y / other, self.z / other)

    def __itruediv__(self, other):
        self.x /= other
        self.y /= other
        self.z /= other
        return self

    def __rmul__(self,other):
        return Vector(self.x * other, self.y * other, self.z * other)

    def __repr__(self):
        return "Vector({0},{1},{2})".format(self.x,self.y,self.z)

    def __str__(self):
        return "Vector({0},{1},{2})".format(self.x,self.y,self.z)

    def __neg__(self):
        return self * (-1)

    def length(self):
        return math.sqrt(self * self)

    def cross(self, other):
        return Vector(self.y * other.z - self.z * other.y,
                self.z * other.x - self.x * other.z, self.x * other.y - self.y * other.x)

    def distance(self,other):
        return (self-other).length()

    def tuple(self):
        return (self.x,self.y,self.z)

    def normalize(self):
        """normalizes the vector"""
        l = self.length()
        if l != 0:
            self /= l

    def normal(self):
        '''returns a normalized vector, colinear to self'''
        v = Vector(self.x, self.y, self.z)
        v.normalize()
        return v

    def colinear(self, other):
        return self.cross(other).length() < epsilon

"""Line created from 2 points"""
class Line:
    def __init__(self, point1, point2):
        self.point = copy.deepcopy(point1)
        self.tangent = (point2 - point1).normal()

    def __eq__(self,other):
        if other is None:
            return False
        return self.contains(other.point) and self.tangent.colinear(other.tangent)

    def distance(self, point):
        l = (point - self.point) * self.tangent
        return point.distance(self.point + l * self.tangent)

    def contains(self,point):
        return self.distance(point) < epsilon

    def point(self,t):
        return Vector(self.x0 + self.a*t,self.y0 + self.b*t,self.z0 + self.c*t)

    def colinear(self, other):
        if isinstance(other, Line):
            return self.tangent.colinear(other.tangent)
        elif isinstance(other, Vector):
            return self.tangent.colinear(other)

    def intersection(self,other):
        """Intersection of 2 lines
        Returns self on equality,
        None when they don't intersect
        a Vector that is the intersection point otherwise"""
        if self == other:
            return self

        if self.colinear(other):
            return None

        x = other.point + (self.distance(other.point) / (1 - abs(self.tangent * other.tangent) ** 2)) * other.tangent
        if self.contains(x):
            return x
        else:
            return None

class Plane:
    def __init__(self, normal, point):
        self.normal = normal
        self.normal.normalize()
        self.point = point
        self.d = -(self.normal * self.point)

    def contains(self, other):
        if isinstance(other, Vector):
            return abs (self.normal * other + self.d) < epsilon
        elif isinstance(other, Line):
            return self.contains(other.point) and abs(self.normal * other.tangent) < epsilon

"""Ray with start point and direction"""
class Ray:
    def __init__(self, start, direction):
        self.start = start
        self.direction = direction

    def line(self):
        return Line(self.start,self.direction)

    def contains(self,point):
        return self.line().contains(point) and (point.x - self.start.x)*(self.direction.x - self.start.x) >= 0 and (point.y - self.start.y)*(self.direction.y - self.start.y) >= 0 and (point.z - self.start.z)*(self.direction.z - self.start.z) >= 0


"""edge with 2 point and optional nextEdge"""
class Edge:
    def __init__(self,*args):
        if args is ():
            self.vertex1 = Vector()
            self.vertex2 = Vector()
            self.nextEdge = None
            self.triangle = None
        else:
            self.vertex1 = args[0]
            self.vertex2 = args[1]
            self.nextEdge = None
            if(len(args)>2):
            	self.triangle = args[2]
            else:
                self.triangle = None

    def __eq__(self,other):
        return (self.vertex1,self.vertex2) == (other.vertex1,other.vertex2) or (self.vertex1,self.vertex2) == (other.vertex2,other.vertex1)

    def __str__(self):
        return "Edge({0}, {1})".format(self.vertex1,self.vertex2)

    __repr__ = __str__

    def line(self):
        return Line(self.vertex1, self.vertex2)

    def contains(self,point):
        vec1 = point - self.vertex1
        vec2 = self.vertex2 - self.vertex1
        factor = (vec1 * vec2) / (vec2 * vec2)
        return (0 <= factor <= 1) and (factor * vec2 == vec1)

    """Intersection of the edge and line or ray"""
    def intersection(self, line):
        if isinstance(line, Ray):
            intersect = self.intersection(line.line())
            if isinstance(intersect, Edge):
                if line.contains(intersect.vertex1) and line.contains(intersect.vertex2):
                    return intersect
                if line.contains(intersect.vertex1):
                    return Edge(line.start,intersect.vertex1,intersect.nextEdge)
                if line.contains(intersect.vertex2):
                    return Edge(line.start,intersect.vertex2,intersect.nextEdge)
            if not(intersect is None) and line.contains(intersect):
                return intersect
            else:
                return None

        if isinstance(line, Line):
            intersect = line.intersection(self.line())
            if isinstance(intersect,Line):
                return self
            if intersect is not None and self.contains(intersect):
                return intersect
            else:
                return None

class Triangle:
    """Triangle with 3 points"""
    def __init__(self,vertexA,vertexB,vertexC):
        self.vertex = {'A' : vertexA,
        'B' : vertexB,
        'C' : vertexC}
        self.edge = { 'A' : Edge(vertexB,vertexC,self),
        'B' : Edge(vertexC,vertexA,self),
        'C' : Edge(vertexA,vertexB,self)}

    """Intersection of the triangle and ray like a distance"""
    def intersection(self,ray):
        intersect = {}
        intersect['A'] = self.edge['A'].intersection(ray)
        intersect['B'] = self.edge['B'].intersection(ray)
        intersect['C'] = self.edge['C'].intersection(ray)

        dist = None
        for i in intersect.keys():
            if not(intersect[i] is None):
                if isinstance(intersect[i],Vector):
                    curr_dist = intersect[i].distance(ray.start)
                else:
                    if intersect[i].vertex1.distance(ray.start) > intersect[i].vertex2.distance(ray.start):
                        curr_dist = intersect[i].vertex2.distance(ray.start)
                    else:
                        curr_dist = intersect[i].vertex1.distance(ray.start)

                if curr_dist != None and (dist == None or dist > curr_dist):
                    dist = curr_dist
        return dist

    def normal(self):
        return (self.vertex['B'] - self.vertex['A']).cross(self.vertex['C'] - self.vertex['A']).normal()

class Model:
    def __init__(self,*args,smooth = True):
        self.dirty = True
        self.faces = list()
        self.points = list()
        self.smooth = smooth
        self.put(args)

    def put(self,triangles):
        abc = ('A', 'B', 'C')
        for triangle in triangles:
            points = [triangle.vertex[l] for l in abc]
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

    """returns the distance from ray.start to the model"""
    def intersection(self,ray):
        dist = None
        for triangle in self.faces:
            curr_dist = triangle.intersection(ray)
            if curr_dist != None and (dist == None or curr_dist<dist):
                dist = curr_dist
        return dist

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

