import collections
import copy
from operator import mul
from functools import reduce
from itertools import starmap
from array import array as pyarray

__all__ = ['ndarray', 'array']

def infer_shape(sequence):
    shape = []
    while isinstance(sequence, collections.Sequence):
        shape.append(len(sequence))
        sequence = sequence[0]
    return tuple(shape)

class linearbuffer():
    def __init__(self, size, base=None, copy=False, offset=0):
        '''
        Constructs a linear buffer of float values, backed by efficient
        storage, supporting the buffer interface. Has copy-on-write semantics
        for slicing operations.
        size -- number of elements
        base -- base buffer when forming a view from slicing
        copy -- whether to copy the given base
        offset -- offset inside base at which this buffer's item 0 is
        '''
        self.offset = offset
        self.view = not base or not copy
        if base is None:
            self.values = pyarray('d', [0] * size)
        else:
            if copy:
                self.values = pyarray('d', base[offset:offset + size])
            else:
                self.values = base

    def __setitem__(self, index, value):
        raise NotImplemented
 
    def __getitem__(self, index):
        if isinstance(index, slice):
            if index.step != None:
                raise NotImplementedError('Slicing with step.')
            else:
                return linearbuffer(size=(index.stop - index.start),
                                    base=self.values,
                                    copy=True,
                                    offset=index.start)
        else:
            raise NotImplementedError

def array(buffer):
    if isinstance(buffer, ndarray):
        return ndarray(buffer.shape, buffer.buffer, copy=False, base=buffer)
    elif isinstance(buffer, collections.Sequence):
        shape = infer_shape(buffer)
        for i in range(len(shape) - 1):
            buffer = sum(buffer, [])
        return ndarray(shape, buffer)
    else:
        raise TypeError("Can't create array from " + buffer.__class__.__name__)

class ndarray:
    def __init__(self, shape, buffer=None, copy=True, offset=0, base=None):
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
        self.offset = offset
        if shape != ():
            self.buffer = linearbuffer(data_len)
            if buffer is not None:
                if copy:
                    self.buffer[:] = tuple(map(float, buffer))
                else:
                    self.buffer = buffer
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
            raise TypeError('Indexing 0-d array not allowed.')

        if not isinstance(key, tuple):
            index = key
            if index > self.shape[0]:
                raise IndexError('Index overflow.')
            if index < 0:
                raise IndexError('Index less than 0.')
            resulting_shape = self.shape[1:]
        else:
            if len(key) > len(self.shape):
                raise IndexError('Index has more dimensions than array.')
            if any(dim > limit or dim < 0 for dim, limit in zip(key, self.shape)):
                raise IndexError('Dimension index out of bounds.')
            index = sum(starmap(mul, zip(self.weights, key)))
            resulting_shape = self.shape[len(key):]

        if resulting_shape != ():
            return ndarray(resulting_shape, buffer=self.buffer,
                           copy=False, base=self)
        else:
            return self.buffer[index]

    def __repr__(self):
        # TODO: Fix formatting
        return 'ndarray({0}, {1})'.format(self.shape, self.buffer)

    def __eq__(self, other):
        if isinstance(other, ndarray):
            return self.shape == other.shape and self.buffer == other.buffer
        else:
            shape = infer_shape(other)
            return self.shape == shape and self.buffer == other

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

