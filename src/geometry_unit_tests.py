from geometry import *
from math import *
import unittest

class DataModelTest(unittest.TestCase):
    def test_vector(self):
        a = Vector()
        b = Vector(0,0,0)
        self.assertTrue(a==b)
        self.assertEqual(Vector(0,3,4).normalize(),Vector(0,3/5,4/5))
        self.assertEqual(a.dist(Vector(3,0,0)),3)

    def test_line(self):
        line = Line(Vector(0,0,0),Vector(5,5,0))
        self.assertTrue(line.belong(Vector(3,3,0)))
        line2 = Line(Vector(2,0,0),Vector(0,2,0))
        self.assertEqual(line.intersection(line2),Vector(1,1,0))
        line3 = Line(Vector(1,1,0),Vector(2,2,0))
        self.assertEqual(line.intersection(line3),Line(Vector(0,0,0),Vector(5,5,0)))
        line4 = Line(Vector(1,0,0),Vector(2,1,0))
        self.assertEqual(line.intersection(line4),None)

    def test_ray(self):
        ray = Ray(Vector(0,0,0),Vector(5,5,0))
        self.assertTrue(ray.belong(Vector(3,3,0)))
        self.assertFalse(ray.belong(Vector(-1,-1,0)))

    def test_edge(self):
        edge = Edge(Vector(0,0,0),Vector(5,5,0))
        self.assertTrue(edge.belong(Vector(3,3,0)))
        self.assertFalse(edge.belong(Vector(-1,-1,0)))
        line = Line(Vector(2,0,0),Vector(3,-1,0))
        ray = Ray(Vector(2,0,0),Vector(3,-1,0))
        self.assertEqual(edge.intersection(line),Vector(1,1,0))
        self.assertEqual(edge.intersection(ray),None)
        edge = Edge(Vector(2,2,0),Vector(3,3,0))
        ray = Ray(Vector(0,0,0),Vector(1,1,0))
        self.assertEqual(edge.intersection(ray), edge)

    def test_triangle(self):
        triangle = Triangle(Vector(2,0,0),Vector(0,2,0),Vector(5,5,0))
        self.assertEqual(triangle.intersection(Ray(Vector(0,0,0),Vector(1,1,0))), sqrt(2))
        triangle = Triangle(Vector(2,2,0),Vector(3,3,0),Vector(5,2,0))
        self.assertEqual(triangle.intersection(Ray(Vector(0,0,0),Vector(1,1,0))), 2*sqrt(2))
        triangle = Triangle(Vector(5,2,0),Vector(6,4,0),Vector(5,5,0))
        self.assertEqual(triangle.intersection(Ray(Vector(0,0,0),Vector(1,1,0))), 5*sqrt(2))

    def test_model(self):
        a = Model(Triangle(Vector(0,0,0),Vector(1,0,0),Vector(0,1,0)),Triangle(Vector(0,0,0),Vector(0,1,0),Vector(0,0,1)),Triangle(Vector(0,0,0),Vector(1,0,0),Vector(0,0,1)))
        self.assertTrue(a.bag[0].edge['B'].nextEdge == a.bag[1].edge['C'])
        self.assertTrue(a.bag[0].edge['C'].nextEdge == a.bag[2].edge['C'])
        self.assertTrue(a.bag[1].edge['B'].nextEdge == a.bag[2].edge['B'])
        self.assertEqual(a.intersection(Ray(Vector(0,0,0),Vector(1,1,0))), 0)

def suite():

    suite = unittest.TestSuite()

    suite.addTest(unittest.makeSuite(DataModelTest))

    return suite


if __name__ == '__main__':
    suiteFew = unittest.TestSuite()

    suiteFew.addTest(DataModelTest("test_vector"))

    suiteFew.addTest(DataModelTest("test_model"))

    suiteFew.addTest(DataModelTest("test_triangle"))

    suiteFew.addTest(DataModelTest("test_line"))

    suiteFew.addTest(DataModelTest("test_ray"))

    suiteFew.addTest(DataModelTest("test_edge"))

    #unittest.TextTestRunner(verbosity=2).run(suiteFew)

    unittest.TextTestRunner(verbosity=2).run(suite())


