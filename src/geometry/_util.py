import re
import types
epsilon = 0.000001
def eq(a, b):
    return abs(a - b) < epsilon

class MetaMultidispatcher(type):
    def __swapargs(f):
        return lambda a, b: f(b, a)

    def __new__(metacls, name, bases, members):
        '''
        Use like this:
        class Dispatcher(metaclass = MetaMultidispatcher):
            def A_B(a, b):
                ... handling of types A and B ...
            def G_E_F(...):
                ... handling of classes G, E, F ...
            def F_G_E(...):
                ... this is different from the above ...

        When A_B is defined without a corresponding B_A, it is generated instead.
        Throws AttributeError when there is no signature satisfying the arguments.

        The referenced names must be defined in the current context.
        Raises NameError when a class can't be found.
        Unsupported: names with underscores, names with dots (e.g. package.Class)

        The resulting object will be a class with an overloaded __call__.
        '''
        functiondict = dict()
        namere = re.compile(r'([a-z]+_)*[a-z]+', re.IGNORECASE)
        for signature, handler in members.items():
            if not (isinstance(handler, types.FunctionType) and namere.match(signature)):
                continue
            try:
                sig = tuple(handler.__globals__[clsname] for clsname in signature.split('_'))
            except KeyError:
                raise NameError(signature)
            functiondict[sig] = handler
            if len(sig) == 2:
                rsig = (sig[1], sig[0])
                if rsig not in functiondict:
                    functiondict[rsig] = metacls.__swapargs(handler)
        members['functiondict'] = functiondict
        return type.__new__(metacls, name, bases, members)

    def __call__(self, *args):
        if len(args) == 0:
            raise AttributeError('Need at least one argument')
        sig = tuple(arg.__class__ for arg in args)
        if sig in self.functiondict:
            return self.functiondict[sig](*args)
        else:
            raise AttributeError('Cannot find function accepting types {0}'.format(tuple(arg.__class__.__name__ for arg in args)))

