from ndarray import *
import unittest

class TestBasic(unittest.TestCase):

    def setUp(self):
        self.array = ndarray((3, 3), list(range(9)))

    def test_copy(self):
        '''
        Test that copying shares data
        '''
        copyarray = array(self.array)
        self.assertFalse(copyarray is self.array)
        self.assertFalse(copyarray.buffer is self.array.buffer)
        self.assertListEqual(copyarray.buffer, self.array.buffer)

class TestSimpleIdx(unittest.TestCase):

    def setUp(self):
        self.array0d = ndarray((), 3)
        self.array1d = ndarray((6,), list(range(6)))
        self.array4d = ndarray((4, 2, 3, 3), list(range(72)))

    def test_0d(self):
        '''
        Test scalar equality and indexing (must raise)
        '''
        self.assertEqual(self.array0d, 3)
        with self.assertRaises(TypeError):
            self.array0d[0]

    def test_1d(self):
        '''
        Test dimensionality checks and simple indexing
        '''
        self.assertSameElements(range(6), (self.array1d[i] for i in range(6)))
        with self.assertRaises(IndexError):
            self.array1d[1, 1]

    def test_4d(self):
        '''
        Test simple 4-dimensional indexing
        '''
        self.assertSameElements(range(72), (self.array4d[i, j, k, l] for i in range(4) for j in range(2) for k in range(3) for l in range(3)))

class TestComplexIdx(unittest.TestCase):
 
    def setUp(self):
        self.array4d = ndarray((4, 2, 3, 3), list(range(72)))   

    def test_level1(self):
        '''
        Test getting a sub-array from an array
        '''
        self.assertEqual(self.array4d[0], ndarray((2, 3, 3), range(18)))
        self.assertIs(self.array4d[1].base, self.array4d)

    def test_multilevel(self):
        '''
        Test getting a sub-sub-sub array
        '''
        self.assertSameElements(self.array4d[2][0][1], self.array4d[2, 0, 1])

class TestMath(unittest.TestCase):

    def setUp(self):
        self.vector = ndarray((4,), [0, 1, 0, 1])
        self.matrix = ndarray((4, 4))

if __name__ == '__main__':
    unittest.main()

