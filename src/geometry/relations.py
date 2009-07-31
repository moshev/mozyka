from .geometry import *
from ._util import *
__all__ = ['intersect', 'colinear', 'distance', 'cross', 'normalize', 'winding']

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

def winding(u, v, w):
    '''Checks if vectors u, v and w are wound in positive or negative direction.
    Returns the signed area of triangle(u, v, w), which is
    >0 for positive, <0 for negative and =0 if on the same line'''
    pass

class colinear_prep(metaclass = MetaMultidispatcher):
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
    def Plane_Plane(a, b):
        return colinear_test.Vector_Vector(a.normal, b.normal)
    
    def Plane_Vector(p, v):
        return eq(p.normal * v, 0)
    
    def Vector_Vector(u, v):
        ux, uy, uz = u.xyz
        vx, vy, vz = v.xyz
        return eq(uy * vz - uz * vy, 0) and eq(uz * vx - ux * vz, 0) and eq(ux * vy - uy * vx, 0)

def colinear(x, y):
    return colinear_test(colinear_prep(x), colinear_prep(y))

class distance(metaclass = MetaMultidispatcher):
    def Line_Vector(l, v):
        return distance.Vector_Vector(l.lerp((v - l.point) * l.tangent), v)

    def Vector_Vector(u, v):
        return (u - v).len

class intersect(metaclass = MetaMultidispatcher):
    def Edge_Edge(a, b):
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
        if intersect.Line_Vector(Line(e.vertices), v):
            if all(s <= p <= e or e <= p <= s for s, e, p in zip(e.vertices[0].xyz, e.vertices[1].xyz, v.xyz)):
                return v
        return None

    def Line_Line(a, b):
        if a == b:
            return a
        elif colinear(a, b):
            return None
        # Find l and m such that:
        # |(a.lerp(l) - b.lerp(m)) * a.tangent = 0
        # |(a.lerp(l) - b.lerp(m)) * b.tangent = 0
        d = b.point - a.point
        ta = a.tangent
        tb = b.tangent
        c11 = ta ** 2
        c12 = -(ta * tb)
        c13 = ta * d
        c21 = -c12
        c22 = -(tb ** 2)
        c23 = tb * d
        det = c11 * c22 - c12 * c21
        l = (c11 * c23 - c13 * c21) / det
        m = (c12 * c23 - c13 * c22) / det
        v = a.lerp(l)
        if v == b.lerp(m):
            return v
        else:
            return None

    def Line_Plane(l, p):
        if colinear(l, p):
            if intersect(l.point, p):
                return l
            else:
                return None
        else:
            return True

    def Line_Ray(l, r):
        return None

    def Line_Triangle(l, t):
        return None

    def Line_Vector(l, v):
        if colinear(v - l.point, l.tangent):
            return v
        else:
            return None

    def Plane_Plane(a, b):
        return None

    def Plane_Ray(p, r):
        return None

    def Plane_Triangle(p, t):
        return None

    def Plane_Vector(p, v):
        if eq(p.normal * v + p.d, 0):
            return v
        else:
            return None

    def Ray_Ray(a, b):
        return None

    def Ray_Triangle(r, t):
        return None

    def Ray_Vector(r, v):
        if intersect.Line_Vector(Line(point = r.start, tangent = r.direction), v):
            if r.direction * (v - r.start) >= 0:
                return v
        return None

    def Triangle_Triangle(a, b):
        return None

    def Triangle_Vector(t, v):
        if colinear(t.edges[0], t.edges[1]):
            return intersect(t.edges[0], v) or intersect(t.edges[1], v)

        m = sum(t.vertices) / 3.0
        if all(cross(e, v - p) * cross(e, m - p) >= 0 for e, p in zip(t.edgevectors, t.vertices)):
            return v
        else:
            return None

    def Vector_Vector(a, b):
        if a == b:
            return a
        else:
            return None

