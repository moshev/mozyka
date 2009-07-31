from geometry import *
from math import *
from array import array
import unittest

class TestVector(unittest.TestCase):
    def setUp(self):
        self.zero = Vector()
        self.e1 = Vector(1, 0, 0)
        self.e2 = Vector(0, 1, 0)
        self.e3 = Vector(0, 0, 1)

    def test_add(self):
        self.assertEqual(self.e1 + self.e2, Vector(1, 1, 0))

    def test_dot(self):
        self.assertAlmostEqual(self.e1 * self.e2, 0)
        self.assertAlmostEqual(self.e2 * self.e3, 0)
        self.assertAlmostEqual(self.e3 * self.e1, 0)

    def test_cross(self):
        self.assertEqual(cross(self.e1, self.e2), self.e3)
        self.assertEqual(cross(self.e2, self.e1), -self.e3)
        self.assertAlmostEqual(self.e3 * self.e3, 1)
        self.assertAlmostEqual(self.e3 * (-self.e3), -1)

class TestGeometry(unittest.TestCase):
    def test_line(self):
        line = Line(Vector(0,0,0),Vector(5,5,0))
        self.assertTrue(line.contains(Vector(3,3,0)))
        line2 = Line(Vector(2,0,0),Vector(0,2,0))
        self.assertEqual(line.intersection(line2),Vector(1,1,0))
        line3 = Line(Vector(1,1,0),Vector(2,2,0))
        self.assertEqual(line.intersection(line3),Line(Vector(0,0,0),Vector(5,5,0)))
        line4 = Line(Vector(1,0,0),Vector(2,1,0))
        self.assertEqual(line.intersection(line4),None)

    def test_ray(self):
        ray = Ray(Vector(0,0,0), Vector(5,5,0))
        self.assertTrue(ray.contains(Vector(3,3,0)))
        self.assertFalse(ray.contains(Vector(-1,-1,0)))

    def test_edge(self):
        edge = Edge(Vector(0,0,0),Vector(5,5,0))
        self.assertTrue(edge.contains(Vector(3,3,0)))
        self.assertFalse(edge.contains(Vector(-1,-1,0)))
        line = Line(Vector(2,0,0),Vector(3,-1,0))
        ray = Ray(Vector(2,0,0),Vector(3,-1,0))
        self.assertTrue(edge.contains(Vector(1,1,0)))
        self.assertEqual(edge.intersection(line),Vector(1,1,0))
        self.assertEqual(edge.intersection(ray),None)
        edge = Edge(Vector(2,2,0),Vector(3,3,0))
        ray = Ray(Vector(0,0,0),Vector(1,1,0))
        self.assertEqual(edge.intersection(ray), edge)

    def test_triangle(self):
        triangle = Triangle(Vector(2,0,0), Vector(0,2,0), Vector(5,5,0))
        triangle = Triangle(Vector(2,2,0), Vector(3,3,0), Vector(5,2,0))
        triangle = Triangle(Vector(5,2,0), Vector(6,4,0), Vector(5,5,0))

    def test_model(self):
        a = Model(Triangle(Vector(0,0,0),Vector(1,0,0),Vector(0,1,0)),Triangle(Vector(0,0,0),Vector(0,1,0),Vector(0,0,1)),Triangle(Vector(0,0,0),Vector(1,0,0),Vector(0,0,1)))
        self.assertTrue(a.faces[0].edge['B'].nextEdge == a.faces[1].edge['C'])
        self.assertTrue(a.faces[0].edge['C'].nextEdge == a.faces[2].edge['C'])
        self.assertTrue(a.faces[1].edge['B'].nextEdge == a.faces[2].edge['B'])
        self.assertEqual(a.intersection(Ray(Vector(0,0,0),Vector(1,1,0))), 0)

    def test_model_arrays(self):
        cube = Model(
                Triangle(Vector(0, 0, 0),
                    Vector(0, 0, 1),
                    Vector(0, 1, 0)),
                Triangle(Vector(0, 1, 0),
                    Vector(0, 0, 1),
                    Vector(0, 1, 1)),
                Triangle(Vector(0, 0, 0),
                    Vector(0, 1, 0),
                    Vector(1, 0, 0)),
                Triangle(Vector(1, 0, 0),
                    Vector(0, 1, 0),
                    Vector(1, 1, 0)),
                Triangle(Vector(1, 0, 0),
                    Vector(1, 1, 0),
                    Vector(1, 0, 1)),
                Triangle(Vector(1, 0, 1),
                    Vector(1, 1, 0),
                    Vector(1, 1, 1)),
                Triangle(Vector(0, 0, 1),
                    Vector(1, 0, 1),
                    Vector(0, 1, 1)),
                Triangle(Vector(0, 1, 1),
                    Vector(1, 0, 1),
                    Vector(1, 1, 1)),
                Triangle(Vector(0, 1, 0),
                    Vector(0, 1, 1),
                    Vector(1, 1, 0)),
                Triangle(Vector(1, 1, 0),
                    Vector(0, 1, 1),
                    Vector(1, 1, 1)),
                Triangle(Vector(0, 0, 0),
                    Vector(1, 0, 0),
                    Vector(0, 0, 1)),
                Triangle(Vector(0, 0, 1),
                    Vector(1, 0, 0),
                    Vector(1, 0, 1)))
        vertices, normals = cube.arrays()
        self.assertEqual(vertices, array('d', [0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1]))
        e = 1/sqrt(3)
        for i, a, b in zip(range(len(normals)), normals, array('d', [-e, -e, -e, -e, -e, e, -e, e, -e, -e, e, -e, -e, -e, e, -e, e, e, -e, -e, -e, -e, e, -e, e, -e, -e, e, -e, -e, -e, e, -e, e, e, -e, e, -e, -e, e, e, -e, e, -e, e, e, -e, e, e, e, -e, e, e, e, -e, -e, e, e, -e, e, -e, e, e, -e, e, e, e, -e, e, e, e, e, -e, e, -e, -e, e, e, e, e, -e, e, e, -e, -e, e, e, e, e, e, -e, -e, -e, e, -e, -e, -e, -e, e, -e, -e, e, e, -e, -e, e, -e, e])):
            self.assertAlmostEqual(a, b, msg="{0} != {1} at index {2}".format(a, b, i))


def suite():
    suite = unittest.TestSuite()
    suite.addTest(unittest.makeSuite(TestVector))
    #suite.addTest(unittest.makeSuite(TestGeometry))
    return suite


if __name__ == '__main__':
    unittest.TextTestRunner().run(suite())


