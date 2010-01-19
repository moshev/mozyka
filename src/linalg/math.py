import numbers
from ndarray import *

def dot(ndarr, vector):
    if not isinstance(ndarr, ndarray) or not isinstance(vector, ndarray):
        raise TypeError()
    if vector.dimensions != 1:
        raise ValueError("Second operand is {0} dimensional - not a vector".format(vector.dimensions))

    return sum(ndarr * vector)

def vector(size):
    '''
    Creates a null vector with size coordinates
    '''
    if size <= 0:
        raise ValueError()
    
    return ndarray((size,))

def matrix(rows, columns = 0):
    '''
    Creates a rows by columns matrix. If columns is 0, creates a square matrix.
    The matrix is row-major indexed.
    '''
    if rows <= 0 or columns < 0:
        raise ValueError()

    if columns == 0: columns = rows

    return ndarray((columns, rows))

def identity_matrix(size):
    '''
    Creates a square identity matrix
    '''

    m = matrix(size)

    for i in range(size):
        m[i, i] = 1

