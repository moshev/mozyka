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
        self.assertSequenceEqual(copyarray.buffer, self.array.buffer)

    def test_range(self):
        '''
        Test creating an ndarray from a range
        '''
        array1 = array(range(3))
        self.assertEqual(array1.shape, (3,))
        self.assertSameElements(array1.buffer, range(3))

        array2 = array([list(range(3))] * 3)
        self.assertEqual(array2.shape, (3,3))
        self.assertSequenceEqual(array2.buffer, list(range(3)) * 3)

    def test_vector_set(self):
        '''
        Test assigning to a vector of elements
        '''
        arr = ndarray((3, 3))
        arr[0] = range(3)
        self.assertSequenceEqual(arr[0], range(3))
        self.assertSequenceEqual(arr[1], [0] * 3)
        self.assertSequenceEqual(arr[2], [0] * 3)

    def test_copy_from_to_view(self):
        '''
        Test copying from and to a view
        '''
        a = array(range(x*3, x*3 + 3) for x in range(3))
        b = array(range(0, 3) for x in range(3))
        self.assertSequenceEqual(a[0], b[0])
        self.assertEqual(a[0], b[0])
        self.assertNotEqual(a[1], b[0])
        a[1] = b[0]
        self.assertSequenceEqual(a[1], b[0])
        self.assertEqual(a[1], b[0])


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
        self.assertSequenceEqual(self.array4d[2][0][1], self.array4d[2, 0, 1])

class TestArrayMath(unittest.TestCase):

    def setUp(self):
        self.array = ndarray((2, 2), base=list(range(4)))

    def test_same(self):
        other = ndarray((2, 2), base=list(range(4)))
        result_add = self.array + other
        self.assertSequenceEqual(result_add.buffer, [x + x for x in range(4)])
        result_mul = self.array * other
        self.assertSequenceEqual(result_mul.buffer, [x * x for x in range(4)])

    def test_scalar(self):
        result = self.array + 4
        self.assertSequenceEqual(result.buffer, [x + 4 for x in range(4)])

class TestMath(unittest.TestCase):

    def setUp(self):
        self.vector = vector(array=ndarray((4,), base=[0, 1, 0, 1]))
        self.identity_matrix = identity_matrix(4)

    def test_initialization(self):
        self.assertSequenceEqual(self.vector.array, [0, 1, 0, 1])

    def test_multiplication(self):
        m = self.identity_matrix * self.vector
        self.assertSequenceEqual(m.array, [0, 1, 0, 1])

    def test_gaussian_decomposition1(self):
        m = matrix(array=array([[1, 0, 0, 0],
                                [1, 1, 0, 0],
                                [1, 1, 1, 0],
                                [1, 1, 1, 1]]))
        
        a, b = gaussian_decomposition(m)
        self.assertEqual(a.array, identity_matrix(4).array)
        self.assertEqual(b.array, array([[ 1,  0,  0, 0],
                                         [-1,  1,  0, 0],
                                         [ 0, -1,  1, 0],
                                         [ 0,  0, -1, 1]]))

        m2 = a * b
        for i in range(1, len(a)):
            for j in range(i):
                self.assertAlmostEqual(a[i, j], 0)
                self.assertAlmostEqual(b[j, i], 0)
                self.assertAlmostEqual(m[i, j], m2[i, j], msg='Matrices differ at index {0}'.format((i, j)))

    def test_gaussian_decomposition2(self):
        m = matrix(array=array([[0.511779539539, 0.398510172288, 0.675326308903, 0.924379685986],
                                [0.438320890402, 0.392642977493, 0.354439110111, 0.415673177932],
                                [0.615214193708, 0.792579680660, 0.756285458803, 0.499050181293],
                                [0.578050771601, 0.913565282093, 0.115584670984, 0.307027987161]]))
        
        a, b = gaussian_decomposition(m)
        m2 = a * b
        for i in range(1, len(a)):
            for j in range(i):
                self.assertAlmostEqual(a[i, j], 0)
                self.assertAlmostEqual(b[j, i], 0)
                self.assertAlmostEqual(m[i, j], m2[i, j], msg='Matrices differ at index {0}'.format((i, j)))


if __name__ == '__main__':
    unittest.main()

