from math import *
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
        if self is None:
            return other is None
        if other is None:
            return self is None
        return abs(self.x - other.x)<epsilon and abs(self.y - other.y)<epsilon and abs(self.z - other.z)<epsilon

    def __add__(self,other):
        return Vector(self.x + other.x, self.y + other.y, self.z + other.z)

    def __sub__(self,other):
        return Vector(self.x - other.x, self.y - other.y, self.z - other.z)

    def __mul__(self,other):
        if isinstance(other,Vector):
            return Vector(self.y * other.z - self.z * other.y, self.z * other.x - self.x * other.z, self.x * other.y - self.y * other.x)
        else:
            return Vector(self.x * other, self.y * other, self.z * other)

    def __rmul__(self,other):
        return Vector(self.x * other, self.y * other, self.z * other)

    def __str__(self):
        return "Vector({0},{1},{2})".format(self.x,self.y,self.z)

    def dist(self,other):
        x = self.x - other.x
        y = self.y - other.y
        z = self.z - other.z
        return sqrt(x*x + y*y + z*z)

    def tuple(self):
        return (self.x,self.y,self.z)

    def normalize(self):
        """vector with length 1"""
        if self == Vector():
            return self
        else:
            length = sqrt(self.x*self.x + self.y*self.y + self.z*self.z)
            return self*(1/length)

"""Line created from 2 points"""
class Line:
    def __init__(self, point1, point2):
        (self.x0,self.y0,self.z0) = point1.tuple()
        (self.a,self.b,self.c) = (point2.x - self.x0,point2.y - self.y0,point2.z - self.z0)

    def __eq__(self,other):
        if other == None or self == None:
            return 0
        return self.belong(other.point(0)) and self.belong(other.point(1))

    def belong(self,point):
        if self.a != 0:
            t = (point.x - self.x0)/self.a
            return (point.y == self.y0 + self.b*t) and (point.z == self.z0 + self.c*t)
        if (self.x0 == point.x) and (self.b != 0):
            t = (point.y - self.y0)/self.b
            return point.z == self.z0 + self.c*t
        return point.y == self.y0

    def point(self,t):
        return Vector(self.x0 + self.a*t,self.y0 + self.b*t,self.z0 + self.c*t)


    """Intersection of 2 lines"""
    def intersection(self,other):
        if self == other:
            return self

        if self.a != 0:
            denominator = self.a*other.b - self.b*other.a
            if denominator !=0:
                t2 = (self.a*(self.y0 - other.y0) + self.b*(other.x0 - self.x0))/denominator
                t1 = (other.x0 -self.x0 + other.a*t2)/self.a
                if self.point(t1) == other.point(t2):
                    return self.point(t1)
                else:
                    return None

            denominator = self.a*other.c - self.c*other.a
            if denominator !=0:
                t2 = (self.a*(self.z0 - other.z0) + self.c*(other.x0 - self.x0))/denominator
                t1 = (other.x0 -self.x0 + other.a*t2)/self.a
                if self.point(t1) == other.point(t2):
                    return self.point(t1)
                else:
                    return None
            return None

        if self.b != 0:
            denominator = other.a
            if denominator !=0:
                t2 = (self.x0 - other.x0)/denominator
                t1 = (other.y0 -self.y0 + other.b*t2)/self.b
                if self.point(t1) == other.point(t2):
                    return self.point(t1)
                else:
                    return None

            denominator = self.b*other.c - self.c*other.b
            if denominator !=0:
                t2 = (self.b*(self.z0 - other.z0) + self.c*(other.y0 - self.y0))/denominator
                t1 = (other.y0 -self.y0 + other.b*t2)/self.b
                if self.point(t1) == other.point(t2):
                    return self.point(t1)
                else:
                    return None
            return None

        if self.c != 0:
            denominator = other.a
            if denominator !=0:
                t2 = (self.x0 - other.x0)/denominator
                t1 = (other.x0 -self.x0 + other.a*t2)/self.c
                if self.point(t1) == other.point(t2):
                    return self.point(t1)
                else:
                    return None

            denominator = other.b
            if denominator !=0:
                t2 = (self.y0 - other.y0)/denominator
                t1 = (other.x0 -self.x0 + other.a*t2)/self.c
                if self.point(t1) == other.point(t2):
                    return self.point(t1)
                else:
                    return None
            return None

        return other.belong(self.point(0)) 

"""Ray with start point and direction"""
class Ray:
    def __init__(self, start, direction):
        self.start = start
        self.direction = direction

    def line(self):
        return Line(self.start,self.direction)

    def belong(self,point):
        return self.line().belong(point) and (point.x - self.start.x)*(self.direction.x - self.start.x) >= 0 and (point.y - self.start.y)*(self.direction.y - self.start.y) >= 0 and (point.z - self.start.z)*(self.direction.z - self.start.z) >= 0


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

    def belong(self,point):
        return self.line().belong(point) and (self.vertex1.x - point.x)*(point.x - self.vertex2.x) >= 0 and (self.vertex1.y - point.y)*(point.y - self.vertex2.y) >= 0 and (self.vertex1.z - point.z)*(point.z - self.vertex2.z) >= 0

    """Intersection of the edge and line or ray"""
    def intersection(self, line):
        if isinstance(line, Ray):
            intersect = self.intersection(line.line())
            if isinstance(intersect, Edge):
                if line.belong(intersect.vertex1) and line.belong(intersect.vertex2):
                    return intersect
                if line.belong(intersect.vertex1):
                    return Edge(line.start,intersect.vertex1,intersect.nextEdge)
                if line.belong(intersect.vertex2):
                    return Edge(line.start,intersect.vertex2,intersect.nextEdge)
            if not(intersect is None) and line.belong(intersect):
                return intersect
            else:
                return None

        if isinstance(line, Line):
            intersect = line.intersection(self.line())
            if isinstance(intersect,Line):
                return self
            if not(intersect is None) and self.belong(intersect):
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

    """Intersection of the triangle and ray like a distence"""
    def intersection(self,ray):
        intersect = {}
        intersect['A'] = self.edge['A'].intersection(ray)
        intersect['B'] = self.edge['B'].intersection(ray)
        intersect['C'] = self.edge['C'].intersection(ray)

        dist = None
        for i in intersect.keys():
            if not(intersect[i] is None):
                if isinstance(intersect[i],Vector):
                    curr_dist = intersect[i].dist(ray.start)
                else:
                    if intersect[i].vertex1.dist(ray.start) > intersect[i].vertex2.dist(ray.start):
                        curr_dist = intersect[i].vertex2.dist(ray.start)
                    else:
                        curr_dist = intersect[i].vertex1.dist(ray.start)

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
            
            
        
            
    