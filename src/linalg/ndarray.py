import collections
import copy
import operator
from functools import reduce
from itertools import starmap

__all__ = ['ndarray', 'array']

def infer_shape(sequence):
    shape = []
    while isinstance(sequence, collections.Sequence):
        shape.append(len(sequence))
        sequence = sequence[0]
    return tuple(shape)

class simplebuffer(list):
    def __init__(self, size):
        super().__init__([0.0])
        if size > 0:
            super().__imul__(size)

def array(object):
    if isinstance(object, ndarray):
        return ndarray(object.shape, object.buffer)
    elif isinstance(object, collections.Sequence):
        shape = infer_shape(object)
        for i in range(len(shape) - 1):
            object = sum(object, [])
        return ndarray(shape, buffer)
    else:
        raise TypeError("Can't create array from " + object.__class__.__name__)

class ndarray:
    def __init__(self, shape, buffer=None):
        '''
        shape is a tuple, describing the array dimensions.
        shape may be (), in which case the ndarray is actually a scalar
        buffer is a linearly expanded buffer of values. It is copied.
        An array containing 10 elements is created like so:
        >>> ndarray(shape=(10,))
        array([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
        A 3x3 matrix is:
        >>> ndarray((3, 3), [1, 2, 3, 4, 5, 6, 7, 8, 9]):
        array([[1.0, 2.0, 3.0], [4.0, 5.0, 6.0], [7.0, 8.0, 9.0]])
        '''
        self.shape = shape
        c_type = None
        data_len = 1
        # How many elements each dimension takes
        # i.e. when shape = (2, 3, 1), then self.weights = (3, 1, 1)
        # And buffer is e.g. [1, 2, 3, 4, 5, 6]
        # then the ndarray is
        # [[[1,],  -> logical index (0, 0, 0), linear index 0*3 + 0*1 + 0*1
        #   [2,],  -> logical index (0, 1, 0), linear index 0*3 + 1*1 + 0*1
        #   [3,]],
        #  [[4,],
        #   [5,],  -> logical index (1, 1, 0), linear index 1*3 + 1*1 + 0*1
        #   [6,]]]
        self.weights = [1]
        for dim in reversed(shape):
            if dim <= 0:
                raise ValueError('shape must have only positive dimensions dimensions')
            data_len *= dim
            self.weights.insert(0, dim * self.weights[0])
        self.weights = tuple(self.weights[1:])
        if shape != ():
            self.buffer = simplebuffer(data_len)
            if buffer is not None:
                self.buffer[:] = tuple(map(float, buffer))
        else:
            self.buffer = buffer or 0.0

    def __len__(self):
        if self.shape == ():
            return 0
        else:
            return shape[0]

    def __iter__(self):
        return Iterator(self)

    def __reversed__(self):
        return ReverseIterator(self)

    def __contains__(self, item):
        # TODO:
        raise NotImplementedError()

    def __setitem__(self, key, value):
        # TODO:
        raise NotImplementedError()

    def __getitem__(self, key):
        if self.shape == ():
            raise IndexError('Indexing 0-d array not allowed.')

        if not isinstance(key, tuple):
            index = key
            resulting_shape = self.shape[1:]
        else:
            if len(key) > len(self.shape):
                raise IndexError('Index has more dimensions than array.')
            index = sum(starmap(operator.mul, zip(self.weights, key)))
            resulting_shape = self.shape[len(key):]

        if resulting_shape != ():
            raise NotImplementedError

        return self.buffer[index]

    def __repr__(self):
        # TODO: Fix formatting
        return 'array({0})'.format(self.buffer)

class Iterator:
    def __init__(self, array):
        self.array = array
        self.pos = 0

    def __iter__(self):
        return self

    def __next__(self):
        if self.pos >= self.array.shape[0]:
            raise StopIteration
        ret = self.array[self.pos]
        self.pos += 1
        return ret

class ReverseIterator:
    def __init__(self, array):
        self.array = array
        self.pos = array.shape[0] - 1

    def __iter__(self):
        return self

    def __next__(self):
        if self.pos < 0:
            raise StopIteration
        ret = self.array[self.pos]
        self.pos -= 1
        return ret

