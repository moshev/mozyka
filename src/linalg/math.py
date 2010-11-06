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

    def __mul__(self, other):
        if isinstance(other, vector):
            return sum(self.array * other.array)
        elif isinstance(other, numbers.Number):
            return vector(array=(self.array * other))
        else:
            raise NotImplementedError()

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
            if self.shape[1] != other.shape[0]:
                raise ValueError('Incompatible shapes')
            zerovec = array([0] * other.shape[1])
            values = array(sum((scalar * row for scalar, row in zip (myrow, other.array)), zerovec) for myrow in self.array)
            return matrix(array=values)
        elif isinstance(other, vector):
            if self.array.shape[0] != len(other):
                raise ValueError('Incompatible shapes')
            result_array = array(row * other for row in self)
            return vector(array=result_array)
        else:
            raise NotImplementedError()

    def __iter__(self):
        for i in range(self.shape[0]):
            yield self[i]

    def __len__(self):
        return self.shape[0]

    @property
    def shape(self):
        return self.array.shape

def gaussian_decomposition(square_matrix):
    """
    Returns a tuple of matrices (A, B), which have only zeroes above or below the diagonal and
    matrix == A * B
    The matrix must be square.
    """
    if len(square_matrix.shape) != 2 or square_matrix.shape[0] != square_matrix.shape[1]:
        raise ValueError('Matrix not square')

    size = square_matrix.shape[0]
    l = copy.deepcopy(square_matrix.array)
    r = identity_matrix(size).array
    for i in range(size - 1):
        if l[i, i] == 0:
            continue

        m = l[i, i]
        
        lnorm = l[i] / m
        rnorm = array(r[i])
        
        for irow in range(i+1, size):
            r[irow] -= l[irow, i] * rnorm
            l[irow] -= l[irow, i] * lnorm
        
    return (matrix(array=l), matrix(array=r))

def solve(a, b):
    '''
    Returns a n-vector x, which is the solution to the linear system
    | a * x = b
    where a is an n-by-m matrix and b is an m-vector.
    a and b can be instances of matrix and vector or ndarray.
    returns None if the system doesn't have a solution.
    '''
    # TODO: write this
    return None

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
        return matrix[0, 0] * matrix[1, 1] * matrix[2, 2] +\
               matrix[1, 0] * matrix[2, 1] * matrix[0, 2] +\
               matrix[2, 0] * matrix[0, 1] * matrix[1, 2] -\
               matrix[0, 0] * matrix[2, 1] * matrix[1, 2] -\
               matrix[1, 0] * matrix[0, 1] * matrix[2, 2] -\
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

