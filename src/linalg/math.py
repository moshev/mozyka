import numbers
import functools
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
            raise NotImplementedError()
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


def identity_matrix(size):
    '''
    Creates a square identity matrix
    '''

    m = matrix(size)

    for i in range(size):
        m[i, i] = 1

    return m

