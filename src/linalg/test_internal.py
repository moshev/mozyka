from ndarray import infer_shape, listify, flatten
import unittest

class TestNDArray(unittest.TestCase):

    def test_infer_shape(self):
        self.assertEqual(infer_shape([1, 2, 3]), (3,))
        self.assertEqual(infer_shape([[1, 2, 3]]), (1,3))
        self.assertEqual(infer_shape([[1, 2, 3], [2, 3, 4]]), (2,3))

    def test_listify(self):
        self.assertEqual(listify(range(3)), [0, 1, 2])
        self.assertEqual(listify(range(3) for x in range(3)), [[0, 1, 2]] * 3)

    def test_flatten(self):
        self.assertEqual(flatten([0, 1, 2, 3]), [0, 1, 2, 3])
        self.assertEqual(flatten([[0], [1], [2]]), [0, 1, 2])
        self.assertEqual(flatten([[0, 1], 2, [3, [4]]]), list(range(5)))

if __name__ == '__main__':
    unittest.main()


