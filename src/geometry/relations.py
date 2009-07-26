from .geometry import *
__all__ = ['intersect', 'colinear', 'eq']

epsilon = 0.000001
def eq(a, b):
    return abs(a - b) < epsilon

def multidispatch(name):
    '''returns a function named name, that performs multiple dispatch, by calling the function
    named name_class_class_..._class for each class in args'''
    def do_dispatch(*args)
        class_chain = '_'.join(sorted(arg.__class__.__name__ for arg in args))
        return eval(name + '_' + class_chain)(*args)
    do_dispatch.__name__ = name
    return do_dispatch

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

colinear_prep = multidispatch('colinear_prep')

def colinear_test_Plane_Plane(a, b):
    return colinear_test_Vector_Vector(a.normal, b.normal)

def colinear_test_Plane_Vector(p, v):
    return eq(p.normal * v, 0)

def colinear_test_Vector_Vector(u, v):
    return eq(u.cross(v), 0)

colinear_test = multidispatch('colinear_test')

def colinear(e1, e2):
    return colinear_test(colinear_prep(e1), colinear_prep(e2))

def intersect_test_Edge_Edge(a, b):
    if a == b:
        return a
    p = intersect_Line_Line(Line(a.vertices), Line(b.vertices))
    if p is None:
        return None
    elif isinstance(p, Line):
        return Edge(*(va if intersect(b, va) else vb for va, vb in zip(a.vertices, b.vertices)))
    elif intersect(a, p) and intersect(b, p):
        return p
    else:
        return None

# Classes:
# Edge
# Line
# Plane
# Ray
# Triangle
# Vector

