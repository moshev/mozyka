from ndarray import *
from ndarray import linearbuffer
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

class TestBuffer(unittest.TestCase):
    
    def setUp(self):
        self.buffer = linearbuffer(10)

    def test_indexing(self):
        '''
        Tests indexing and bounds checks
        '''
        self.assertEqual(self.buffer[0], 0.0)
        with self.assertRaises(IndexError):
            dummy = self.buffer[100]
        with self.assertRaises(IndexError):
            self.buffer[20] = 5

    def test_views(self):
        # indices relations:
        # data:  0 1 2 3 4 5 6 7 8 9 size = 10
        # view1:   0   1   2   3   4 size = 5
        # view2:       0           1 size = 2
        data = linearbuffer(10)
        view1 = data[1::2]
        view2 = view1[1:5:3]
        self.assertEqual(len(data), 10)
        self.assertEqual(len(view1), 5)
        self.assertEqual(len(view2), 2)

        self.assertEqual(view1[0], 0.0)
        data[1] = 1
        self.assertEqual(view1[0], 1.0)

        self.assertEqual(data[5], 0.0)
        view1[2] = 1
        self.assertEqual(data[5], 1.0)

        self.assertEqual(data[9], 0.0)
        self.assertEqual(view1[4], 0.0)
        view2[1] = 1
        self.assertEqual(data[9], 1.0)
        self.assertEqual(view1[4], 1.0)

    def test_equal(self):
        buffer2 = linearbuffer(5)
        self.assertEqual(self.buffer[:5], buffer2)

if __name__ == '__main__':
    unittest.main()

