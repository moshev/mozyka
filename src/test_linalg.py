from linalg import *
import unittest

class TestBasic(unittest.TestCase):

    def setUp(self):
        self.array = ndarray((3, 3), base=list(range(9)))

    def test_copy(self):
        '''
        Test that copying shares data
        '''
        copyarray = array(self.array)
        self.assertFalse(copyarray is self.array)
        self.assertFalse(copyarray.buffer is self.array.buffer)
        self.assertSameElements(copyarray.buffer, self.array.buffer)

    def test_range(self):
        '''
        Test creating an ndarray from a range
        '''
        array1 = array(range(3))
        self.assertEqual(array1.shape, (3,))
        self.assertSameElements(array1.buffer, range(3))

        array2 = array([list(range(3))] * 3)
        self.assertEqual(array2.shape, (3,3))
        self.assertSameElements(array1.buffer, list(range(3)) * 3)

    def test_vector_set(self):
        '''
        Test assigning to a vector of elements
        '''
        arr = ndarray((3, 3))
        arr[0] = range(3)
        self.assertSameElements(arr[0], range(3))
        self.assertSameElements(arr[1], [0] * 3)
        self.assertSameElements(arr[2], [0] * 3)

class TestSimpleIdx(unittest.TestCase):

    def setUp(self):
        self.array1d = ndarray((6,), base=list(range(6)))
        self.array4d = ndarray((4, 2, 3, 3), base=list(range(72)))

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
        self.array4d = ndarray((4, 2, 3, 3), base=list(range(72)))   

    def test_level1(self):
        '''
        Test getting a sub-array from an array
        '''
        self.assertEqual(self.array4d[0], ndarray((2, 3, 3), base=list(range(18))))
        self.assertIs(self.array4d[1].base, self.array4d)

    def test_multilevel(self):
        '''
        Test getting a sub-sub-sub array
        '''
        self.assertSameElements(self.array4d[2][0][1], self.array4d[2, 0, 1])

class TestArrayMath(unittest.TestCase):

    def setUp(self):
        self.array = ndarray((2, 2), base=list(range(4)))

    def test_same(self):
        other = ndarray((2, 2), base=list(range(4)))
        result_add = self.array + other
        self.assertSameElements(result_add.buffer, [x + x for x in range(4)])
        result_mul = self.array * other
        self.assertSameElements(result_mul.buffer, [x * x for x in range(4)])

    def test_scalar(self):
        result = self.array + 4
        self.assertSameElements(result.buffer, [x + 4 for x in range(4)])

class TestMath(unittest.TestCase):

    def setUp(self):
        self.vector = vector(array=ndarray((4,), base=[0, 1, 0, 1]))
        self.identity_matrix = identity_matrix(4)

    def test_initialization(self):
        self.assertSameElements(self.vector.array, [0, 1, 0, 1])

    def test_multiplication(self):
        m = self.identity_matrix * self.vector
        self.assertSameElements(m.array, [0, 1, 0, 1])

    def test_gaussian_decomposition(self):
        m = matrix(array=array([
[0.511779539539, 0.398510172288, 0.675326308903, 0.924379685986],
[0.438320890402, 0.392642977493, 0.354439110111, 0.415673177932],
[0.615214193708, 0.79257968066, 0.756285458803, 0.499050181293],
[0.578050771601, 0.913565282093, 0.115584670984, 0.307027987161]]))
        
        a, b = gaussian_decomposition(m)
        for i in range(1, len(a)):
            for j in range(i):
                self.assertAlmostEqual(a[i, j], 0)
                self.assertAlmostEqual(b[j, i], 0)

        m2 = a * b
        for mitem, m2item in zip (m.array.base, m2.array.base):
            self.assertAlmostEqual(mitem, m2item)
        

if __name__ == '__main__':
    unittest.main()

