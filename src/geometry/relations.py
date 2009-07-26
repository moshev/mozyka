from .geometry import *
__all__ = ['intersect', 'colinear', 'eq']

epsilon = 0.000001
def eq(a, b):
    return abs(a - b) < epsilon

def colinear_prep_Edge(e):
    return e.vertices[1] - e.vertices[0]

def colinear_prep_Line(l):
    return l.tangent

def colinear_prep_Plane(p):
    return p

def colinear_prep_Ray(r):
    return r.direction

def colinear_prep_Triangle(t):
    return Plane(*t.vertices)

def colinear_prep_Vector(v):
    return v

def colinear_Vector_Vector(u, v):
    return eq(u.cross(v), 0)

# Classes:
# Edge
# Line
# Plane
# Ray
# Triangle
# Vector

