from ndarray import *
import unittest

class TestNDArray(unittest.TestCase):

    def setUp(self):
        self.array = ndarray((3, 3), list(range(9)))

    def test_copy(self):
        copyarray = array(self.array)
        self.assertFalse(copyarray is self.array)
        self.assertFalse(copyarray.buffer is self.array.buffer)
        self.assertListEqual(copyarray.buffer, self.array.buffer)

    def test_simple_indexing(self):
        self.assertEqual(self.array[0, 0], 0.0)
        self.assertEqual(self.array[0, 1], 1.0)
        self.assertEqual(self.array[1, 1], 4.0)
        self.assertEqual(self.array[2, 1], 7.0)

    def test_single_level_indexing(self):
        self.assertEqual(self.array[1], [3, 4, 5])

if __name__ == '__main__':
    unittest.main()

