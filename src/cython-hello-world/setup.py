from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

def get_extensions():
    return [Extension("helloworld", ["helloworld.pyx"]),]

