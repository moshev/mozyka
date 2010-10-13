import collections
import numbers
import copy
import operator
from functools import reduce
from itertools import starmap
from array import array as _array

__all__ = ['ndarray', 'array']

def infer_shape(sequence):
    shape = []
    if isinstance(sequence, ndarray):
        return sequence.shape

    while isinstance(sequence, collections.Sequence):
        shape.append(len(sequence))
        sequence = sequence[0]
    return tuple(shape)

def listify(iterable):
    '''
    Takes an iterable and returns a list of the contents.
    If the iterable contains iterables, they are listified recursively.
    '''
    return [listify(x) if isinstance(x, collections.Iterable) else x for x in iterable]

def flatten(listlist):
    '''
    Takes a list of [lists of...] items.
    returns a single-level list of all items.
    '''
    if not isinstance(listlist, list):
        raise TypeError('\'' + listlist.__class__.__name__ + '\' is not a list.')

    flat = []
    for item in listlist:
        if isinstance(item, list):
            flat += flatten(item)
        else:
            flat.append(item)
    return flat

def array(buffer):
    if isinstance(buffer, ndarray):
        return ndarray(buffer.shape, copy=True, base=buffer)
    elif isinstance(buffer, collections.Sequence):
        shape = infer_shape(buffer)
        
        for i in range(len(shape) - 1):
            buffer = sum((list(x) for x in buffer), [])
        
        if len(shape) == 1:
            buffer = list(buffer)
        
        return ndarray(shape, base=buffer)
    elif isinstance(buffer, collections.Iterable):
        buffer = listify(buffer)
        shape = infer_shape(buffer)
        return ndarray(shape, base=flatten(buffer))
    else:
        raise TypeError(buffer.__class__.__name__)

class ndarray:
    def __init__(self, shape, copy=True, offset=0, base=None):
        '''
        shape is a tuple, describing the array dimensions.

        copy - whether to copy the base buffer (if not None)
        
        offset - offset into the base buffer, relative to its start.
        If the base is a view on another ndarray, its offset is added to the given offset.
        
        base - a base ndarray or sequence to take values from.
        If copy is false and base is not None, this creates a view on the base.
        
        An array containing 10 elements is created like so:
        
        >>> ndarray(shape=(10,))
        ndarray((10,), [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])

        A 3x3 matrix is:
        
        >>> ndarray((3, 3), [1, 2, 3, 4, 5, 6, 7, 8, 9]):
        ndarray((3, 3), [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0])
        '''

        if shape == ():
            raise ValueError('shape must be a nonempty tuple')

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

        buffer = base.buffer if isinstance(base, ndarray) else base

        if buffer is None:
            self.base = None
            self.offset = 0
            self.buffer = _array('d', [0.0] * data_len)
        else:
            if copy:
                self.base = None
                self.offset = 0
                self.buffer = _array('d', buffer[offset:offset + data_len])
            else:
                self.base = base
                self.offset = offset
                self.buffer = buffer

    @property
    def dimensions(self):
        return len(self.shape)

    @property
    def flat_length(self):
        return reduce(operator.mul, self.shape)

    @property
    def is_view(self):
        return self.base is not None

    def __copy_on_write(self):
        if self.base is not None:
            self.buffer = _array('d', self.buffer[self.offset:self.offset + self.flat_length])
            self.base = None

    def __parse_index(self, index):
        '''
        Returns linear index into the backing array and the resulting shape.
        i.e. (linear_index + offset, self.shape[length(index):])
        raises IndexError if index out of bounds
        '''
        if isinstance(index, tuple):
            if len(index) > len(self.shape):
                raise IndexError('Index has more dimensions than array.')
            if any(dim > limit or dim < 0 for dim, limit in zip(index, self.shape)):
                raise IndexError('Dimension index out of bounds.')

            return (sum(starmap(operator.mul, zip(self.weights, index))) + self.offset, self.shape[len(index):])
        else:
            if index > self.shape[0]:
                raise IndexError('Index overflow.')
            if index < 0:
                raise IndexError('Index less than 0.')

            return (index * self.weights[0] + self.offset, self.shape[1:])

    @staticmethod
    def __apply_op(op, lhs, rhs, result=None):
        '''
        Broadcasts lhs and rhs as neccessary and applies op elementwise, storing the result in result.
        If result is None, returns a new ndarray.
        lhs must be an ndarray.
        if rhs is not, it is assumed to be a number.
        '''
        if not isinstance(rhs, ndarray):
            if result is None:
                result = ndarray(lhs.shape)
            else:
                assert(result.shape == lhs.shape)
            
            if lhs.dimensions == 1:
                for i, v in zip(range(len(lhs)), lhs):
                    result[i] = op(rhs, v)
            else:
                for l, r in zip(lhs, result):
                    ndarray.__apply_op(op, l, rhs, r)
            
            return result

        if lhs.dimensions < rhs.dimensions:
            lhs, rhs = rhs, lhs

        if rhs.dimensions < lhs.dimensions:
            newshape = tuple([1] * (lhs.dimensions - rhs.dimensions) + list(rhs.shape))
            rhs = ndarray(newshape, False, 0, rhs)

        resulting_shape = tuple(max(l, r) for l, r in zip(lhs.shape, rhs.shape))

        if result is None:
            result = ndarray(resulting_shape)

        if result.shape != resulting_shape:
            raise ValueError(
                "ndarray of shape {0} can't hold result of operation on arrays with shapes {1} and {2}".format(resulting_shape, lhs.shape, rhs.shape))

        if lhs.dimensions == 1:
            ls = lhs.shape[0]
            rs = rhs.shape[0]
            for i in range(result.shape[0]):
                result[i] = op(lhs[i % ls], rhs[i % rs])
        else:
            for l, r, o in zip(lhs, rhs, result):
                ndarray.__apply_op(op, l, r, o)

        return result

    def __len__(self):
        if self.shape == ():
            return 0
        else:
            return self.shape[0]

    def __iter__(self):
        return Iterator(self)

    def __reversed__(self):
        return ReverseIterator(self)

    def __contains__(self, item):
        # TODO:
        raise NotImplementedError()

    def __setitem__(self, key, value):
        if isinstance(key, slice):
            raise NotImplementedError()

        index, resulting_shape = self.__parse_index(key)

        if resulting_shape != ():
            raise NotImplementedError()
        else:
            self.buffer[index] = value

    def __getitem__(self, key):
        if self.shape == ():
            raise TypeError('Indexing 0-d array not allowed.')

        index, resulting_shape = self.__parse_index(key)

        if resulting_shape != ():
            return ndarray(resulting_shape, copy=False, offset=index, base=self)
        else:
            return self.buffer[index]

    def __repr__(self):
        # TODO: Fix formatting
        return 'ndarray({0}, {1})'.format(self.shape, self.buffer)

    def __eq__(self, other):
        if isinstance(other, collections.Sequence):
            shape = infer_shape(other)
            if self.shape != shape:
                return False

            return all(my == foreign for my, foreign in zip(self, other))

        return NotImplemented

    def __add__(self, other):
        return ndarray.__apply_op(operator.add, self, other)

    def __sub__(self, other):
        return ndarray.__apply_op(operator.sub, self, other)

    def __mul__(self, other):
        return ndarray.__apply_op(operator.mul, self, other)

    def __div__(self, other):
        return ndarray.__apply_op(operator.div, self, other)

    def __deepcopy__(self, memo):
        return ndarray(shape=self.shape, copy=False, offset=self.offset, base=copy.deepcopy(self.base, memo))

collections.Sequence.register(ndarray)

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

collections.Iterator.register(Iterator)

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

collections.Iterator.register(ReverseIterator)

