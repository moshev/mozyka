import numbers
from ndarray import *

def dot(ndarr, vector):
    if not isinstance(ndarr, ndarray) or not isinstance(vector, ndarray):
        raise TypeError()
    if vector.dimensions != 1:
        raise ValueError("Second operand is {0} dimensional - not a vector".format(vector.dimensions))

    return sum(ndarr * vector)

