import math
import copy
epsilon = 0.0001

"""3-dimensional vector with coordinates"""
class Vector:
    def __init__(self,*args):
        if args is ():
            (self.x,self.y,self.z) = (0,0,0)
        else:
            self.x=args[0]
            self.y=args[1]
            self.z=args[2]

    def __eq__(self,other):
        if other is None:
            return False
        return abs(self.x - other.x)<epsilon and abs(self.y - other.y)<epsilon and abs(self.z - other.z)<epsilon

    def __add__(self,other):
        return Vector(self.x + other.x, self.y + other.y, self.z + other.z)

    def __sub__(self,other):
        return Vector(self.x - other.x, self.y - other.y, self.z - other.z)

    def __mul__(self,other):
        if isinstance(other,Vector):
            return self.x * other.x + self.y * other.y + self.z * other.z
        else:
            return Vector(self.x * other, self.y * other, self.z * other)

    def __rmul__(self,other):
        return Vector(self.x * other, self.y * other, self.z * other)

    def __str__(self):
        return "Vector({0},{1},{2})".format(self.x,self.y,self.z)

    def length(self):
        return math.sqrt(self.x*self.x + self.y*self.y + self.z*self.z)

    def cross(self, other):
        return Vector(self.y * other.z - self.z * other.y,
                self.z * other.x - self.x * other.z, self.x * other.y - self.y * other.x)

    def distance(self,other):
        return (self-other).length()

    def tuple(self):
        return (self.x,self.y,self.z)

    def normalize(self):
        """vector with length 1"""
        if self == Vector():
            return self
        else:
            return self*(1/self.length())

    def colinear(self, other):
        return self.cross(other).length() < epsilon

"""Line created from 2 points"""
class Line:
    def __init__(self, point1, point2):
        self.point = copy.deepcopy(point1)
        self.tangent = (point1 - point2)
        self.tangent.normalize()

    def __eq__(self,other):
        if other is None:
            return 0
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

        x = other.point + self.distance(other.point) * (self.tangent * other.tangent) * other.tangent
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
        return "Edge({0},{1})".format(self.vertex1,self.vertex2)

    def line(self):
        return Line(self.vertex1,self.vertex2)

    def contains(self,point):
        factor = (point - self.vertex1).length() / (self.vertex2 - self.vertex1).length()
        return (0 <= factor <= 1) and ((1 - factor) * self.vertex1 + factor * self.vertex2) == point

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
            if not(intersect is None) and self.contains(intersect):
                return intersect
            else:
                return None

"""Triangle with 3 points"""
class Triangle:
    def __init__(self,vertexA,vertexB,vertexC):
        self.vertex = {'A' : vertexA,
        'B' : vertexB,
        'C' : vertexC}
        self.edge = { 'A' : Edge(vertexB,vertexC,self),
        'B' : Edge(vertexA,vertexC,self),
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

class Model:
    def __init__(self,*args):
        self.bag = ()
        for triangle in args:
            self.put(triangle)

    def put(self,triangle):
        for tri in self.bag:
            for edge1 in triangle.edge.values():
                for edge2 in tri.edge.values():
                    if edge1 == edge2:
                        edge1.nextEdge = edge2
                        edge2.nextEdge = edge1
        self.bag = self.bag + (triangle,)

    """returns the distance from ray.start to the model"""
    def intersection(self,ray):
        dist = None
        for triangle in self.bag:
            curr_dist = triangle.intersection(ray)
            if curr_dist != None and (dist == None or curr_dist<dist):
                dist = curr_dist
        return dist
            
            
        
            
    
