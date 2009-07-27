from _util import *
import unittest

MM = MetaMultidispatcher
class A: pass

class B: pass

class C: pass

class MD(metaclass = MM):
    g = globals()
    def A_B(a, b):
        return 'a b'
    def A_C(a, c):
        return 'a c'
    def B_A(b, a):
        return 'swapped ' + A_B(a, b)

class TestMultiDispatch(unittest.TestCase):
    def setUp(self):
        self.a = A()
        self.b = B()
        self.c = C()

    def testStraight(self):
        self.assertEqual(MD(self.a, self.c), 'a c')
        self.assertEqual(MD(self.a, self.b), 'a b')
    def testSwapped(self):
        self.assertEqual(MD(self.c, self.a), 'a c')
    def testGlobals(self):
        self.assertEqual(MD(self.b, self.a), 'swapped a b')

if __name__ == '__main__':
    unittest.TextTestRunner().run(unittest.makeSuite(TestMultiDispatch))

