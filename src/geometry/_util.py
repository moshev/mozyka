import re
import types
epsilon = 0.000001
def eq(a, b):
    return abs(a - b) < epsilon


class MetaMultidispatcher(type):
    def _swapargs(f):
        return lambda a, b: f(b, a)

    def __new__(metacls, name, bases, handlers):
        '''
        Use like this:
        class Dispatcher(metaclass = MetaMultidispatcher):
            # The metaclass needs to know about the globals
            g = globals()

            def A_B(a, b):
                ... handling of types A and B ...
            def G_E_F(...):
                ... handling of classes G, E, F ...
            def F_G_E(...):
                ... this is different from the above ...

        If called with exactly two arguments of type A and B and A_B is undefined, B_A is tried
        instead. Throws AttributeError when there is no signature satisfying the arguments.

        Each function is directly callable from each other function.

        The referenced names must be defined in the current context. Unfortunately,
        names with underscores are not supported.
        '''
        g = handlers['g']
        functiondict = dict()
        namere = re.compile(r'([a-z]+_)*[a-z]+', re.IGNORECASE)
        for signature, handler in handlers.items():
            if not (isinstance(handler, types.FunctionType) and namere.match(signature)):
                continue
            try:
                sig = tuple(eval(clsname, g) for clsname in signature.split('_'))
                handler.__globals__.update(handlers)
                functiondict[sig] = handler
                if len(sig) == 2:
                    rsig = (sig[1], sig[0])
                    if rsig not in functiondict:
                        functiondict[rsig] = MetaMultidispatcher._swapargs(handler)
            except NameError:
                continue
        handlers['functiondict'] = functiondict
        return type.__new__(metacls, name, bases, handlers)

    def __call__(self, *args):
        if len(args) == 0:
            raise AttributeError('Need at least one argument')
        sig = tuple(arg.__class__ for arg in args)
        if sig in self.functiondict:
            return self.functiondict[sig](*args)
        else:
            raise AttributeError('Cannot find function accepting types {0}'.format(arg.__class__.__name__ for arg in args))

