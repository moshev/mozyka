from _util import *
import unittest

MM = MetaMultidispatcher
class A: pass

class B: pass

class C: pass

class D: pass

def foo():
    return 'foo'

class MD(metaclass = MetaMultidispatcher):
    def A_B(a, b):
        return 'a b'
    
    def A_C(a, c):
        return 'a c'
    
    def B_A(b, a):
        return 'swapped ' + MD.A_B(a, b)

    def D(d):
        return 'd'

    def A_B_C(a, b, c):
        return foo()

class TestMultiDispatch(unittest.TestCase):
    def setUp(self):
        self.a = A()
        self.b = B()
        self.c = C()
        self.d = D()

    def testStraight(self):
        self.assertEqual(MD(self.a, self.c), 'a c')
        self.assertEqual(MD(self.a, self.b), 'a b')

    def testSwapped(self):
        self.assertEqual(MD(self.c, self.a), 'a c')

    def testGlobals(self):
        self.assertEqual(MD(self.b, self.a), 'swapped a b')

    def testSingle(self):
        self.assertEqual(MD(self.d), 'd')

    def testFoo(self):
        self.assertEqual(MD(self.a, self.b, self.c), 'foo')

if __name__ == '__main__':
    unittest.TextTestRunner().run(unittest.makeSuite(TestMultiDispatch))

