from .geometry import *
from ._util import *
__all__ = ['intersect', 'colinear', 'distance', 'winding']

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
        v = intersect(Line(a.vertices), Line(b.vertices))
        if v is None:
            return None
        elif isinstance(v, Line):
            ia = tuple(p for p in a.vertices if intersect.Edge_Vector(b, p, skip_linetest = True))
            ib = tuple(p for p in b.vertices if intersect.Edge_Vector(a, p, skip_linetest = True))
            if len(ia) == 0:
                if len(ib) == 0:
                    return None
                else:
                    assert len(ib) == 2
                    return b
            elif len(ia) == 1:
                assert len(ib) == 1
                return Edge(ia[0], ib[0])
            else:
                assert len(ia) == 2
                assert len(ib) == 0
                return a
        else:
            if intersect.Edge_Vector(a, v, skip_linetest = True) and intersect.Edge_Vector(b, v, skip_linetest = True):
                return v
            else:
                return None

    def Edge_Line(e, l):
        v = intersect(Line(e.vertices), l)
        if v is None:
            return None
        elif v == l:
            return e
        else:
            raise NotImplementedError

    def Edge_Plane(e, p):
        return None

    def Edge_Ray(e, r):
        return None

    def Edge_Triangle(e, t):
        return None

    def Edge_Vector(e, v, skip_linetest = False):
        if skip_linetest or intersect.Line_Vector(Line(e.vertices), v):
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
        v = intersect.Line_Line(l, Line(point = r.start, tangent = r.direction))
        if v is None:
            return None
        elif v == l:
            return r
        else:
            return v if (v - r.start) * r.direction >= 0 else None

    def Line_Triangle(l, t):
        return None

    def Line_Vector(l, v):
        if colinear(v - l.point, l.tangent):
            return v
        else:
            return None

    def Plane_Plane(a, b):
        tangent = cross(a.normal, b.normal)
        if tangent == Vector(0, 0, 0):
            if intersect(b, a.point):
                return a
            else:
                return None
        else:
            raise NotImplementedError
            

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

