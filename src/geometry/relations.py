from .geometry import *
from ._util import *
__all__ = ['intersect', 'colinear', 'distance']

class colinear_prep(metaclass = MetaMultidispatcher):
    g = globals()

    def Edge(e):
        return e.vertices[1] - e.vertices[0]
    
    def Line(l):
        return l.tangent
    
    def Plane(p):
        return p
    
    def Ray(r):
        return r.direction
    
    def Triangle(t):
        return Plane(*t.vertices)
    
    def Vector(v):
        return v

class colinear_test(metaclass = MetaMultidispatcher):
    g = globals()

    def Plane_Plane(a, b):
        return Vector_Vector(a.normal, b.normal)
    
    def Plane_Vector(p, v):
        return eq(p.normal * v, 0)
    
    def Vector_Vector(u, v):
        return eq((u * v) ** 2, (u ** 2) * (v ** 2))

def colinear(x, y):
    return colinear_test(colinear_prep(x), colinear_prep(y))

class distance(metaclass = MetaMultidispatcher):
    g = globals()

    def Line_Vector(l, v):
        return (v - l.point) * l.tangent

class intersect(metaclass = MetaMultidispatcher):
    g = globals()

    def Edge_Edge(a, b):
        if a == b:
            return a
        p = intersect(Line(a.vertices), Line(b.vertices))
        if p is None:
            return None
        elif isinstance(p, Line):
            return Edge(*(va if intersect(b, va) else vb for va, vb in zip(a.vertices, b.vertices)))
        elif intersect(a, p) and intersect(b, p):
            return p
        else:
            return None

    def Edge_Line(e, l):
        return None

    def Edge_Plane(e, p):
        return None

    def Edge_Ray(e, r):
        return None

    def Edge_Triangle(e, t):
        return None

    def Edge_Vector(e, v):
        return None

    def Line_Line(a, b):
        if a == b:
            return a
        return None

    def Line_Plane(l, p):
        return None

    def Line_Ray(l, r):
        return None

    def Line_Triangle(l, t):
        return None

    def Line_Vector(l, v):
        return None

    def Plane_Plane(a, b):
        return None

    def Plane_Ray(p, r):
        return None

    def Plane_Triangle(p, t):
        return None

    def Plane_Vector(p, v):
        return eq(p.normal * v + p.d, 0) or None

    def Ray_Ray(a, b):
        return None

    def Ray_Triangle(r, t):
        return None

    def Ray_Vector(r, v):
        return None

    def Triangle_Triangle(a, b):
        return None

    def Triangle_Vector(t, v):
        return None

    def Vector_Vector(a, b):
        if a == b:
            return a
        else:
            return None

# Classes:
# Edge
# Line
# Plane
# Ray
# Triangle
# Vector

