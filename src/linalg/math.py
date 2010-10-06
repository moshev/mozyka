import numbers
import functools
import copy
import operator
from .ndarray import *

def dot(ndarr, vector):
    if not isinstance(ndarr, ndarray) or not isinstance(vector, ndarray):
        raise TypeError()
    if vector.dimensions != 1:
        raise ValueError("Second operand is {0} dimensional - not a vector".format(vector.dimensions))

    return sum(ndarr * vector)


class vector:
    def __init__(self, size=0, array=None):
        '''
        Creates a null vector with size coordinates,
        or a vector backed by the given array.
        '''
        if array is not None:
            assert(array.dimensions == 1)
            assert(array.shape[0] == size or size == 0)
            self.array = array
        else:
            self.array = ndarray((size,))

    @functools.wraps(ndarray.__setitem__)
    def __setitem__(self, *args):
        return self.array.__setitem__(*args)

    @functools.wraps(ndarray.__getitem__)
    def __getitem__(self, *args):
        return self.array.__getitem__(*args)

    def __len__(self):
        return len(self.array)

class matrix:
    def __init__(self, rows=0, columns=0, array=None):
        '''
        Creates a rows by columns matrix. If columns is 0, creates a square matrix.
        The matrix is row-major indexed. You may provide an array to be wrapped, instead of creating a new one.
        '''
        if array is not None:
            assert(array.dimensions == 2)
            self.array = array
        else:
            if columns == 0: columns = rows

            self.array = ndarray((columns, rows))

    @functools.wraps(ndarray.__setitem__)
    def __setitem__(self, *args):
        return self.array.__setitem__(*args)

    def __getitem__(self, *args):
        item = self.array.__getitem__(*args)
        if isinstance(item, ndarray):
            return vector(array=item)
        else:
            return item
    
    def __mul__(self, other):
        if isinstance(other, matrix):
            raise NotImplementedError()
        elif isinstance(other, vector):
            if self.array.shape[0] != len(other):
                raise ValueError('Incompatible shapes')
            result_array = ndarray((self.array.shape[1],))
            for column, scalar in zip(self.array, other.array):
                result_array += column * scalar
            return vector(array=result_array)
        else:
            raise NotImplementedError()

    @property
    def shape(self):
        return self.array.shape

def gaussian_decomposition(matrix):
    """
    Returns a tuple of matrices (A, B), which have only zeroes above or below the diagonal and
    matrix == A * B
    The matrix must be square.
    """
    if len(matrix.shape) != 2 or matrix.shape[0] != matrix.shape[1]:
        raise ValueError('Matrix not square')

    size = matrix.shape[0]
    l = copy.deepcopy(matrix)
    r = identity_matrix(size)
    for col in l:
        m, im = max(zip(col, range(len(col))))
        if m == 0.0:
            continue
        
        # normalize row with largest element.
        for lcol, rcol in zip(l, r):
            lcol[im] /= m
            rcol[im] /= m

        for irow in range(size):
            if irow = im: continue

            for lcol, rcol in zip(l, r):
                lcol[irow] *= 1 - lcol[im]
                rcol[irow] *= 1 - rcol[im]
    return (l, r)


def determinant(matrix):
    """
    Computes the determinant of a matrix.
    """
    if len(matrix.shape) != 2 or matrix.shape[0] != matrix.shape[1]:
        raise ValueError('Matrix not square')

    if matrix.shape[0] == 1:
        return matrix[0]
    elif matrix.shape[0] == 2:
        return matrix[0, 0] * matrix[1, 1] - matrix[0, 1] * matrix[1, 0]
    elif matrix.shape[0] == 3:
        return matrix[0, 0] * matrix[1, 1] * matrix[2, 2] +
               matrix[1, 0] * matrix[2, 1] * matrix[0, 2] +
               matrix[2, 0] * matrix[0, 1] * matrix[1, 2] -
               matrix[0, 0] * matrix[2, 1] * matrix[1, 2] -
               matrix[1, 0] * matrix[0, 1] * matrix[2, 2] -
               matrix[2, 0] * matrix[1, 1] * matrix[0, 2]
    else:
        l, r = gaussian_decomposition(matrix)
        return functools.reduce(operator.mul, (l[i, i] * r[i, i] for i in range(matrix.shape[0])))

def identity_matrix(size):
    '''
    Creates a square identity matrix
    '''

    m = matrix(size)

    for i in range(size):
        m[i, i] = 1

    return m

