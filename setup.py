import os, sys
from distutils.core import setup, Extension
from Pyrex.Distutils import build_ext

mcc_cpppath = [r"C:\MCC\C"]
mcc_libpath = [r"C:\MCC\C"]
mcc_libs = [ "cbw32" ]

PyUL_source = 'src/UniversalLibrary.pyx'

if not os.path.exists(PyUL_source):
    print 'error: %s does not exist, generate with "python autogen.py"'%PyUL_source
    sys.exit(1)

ext_modules = []
ext_modules.append(Extension(name='UniversalLibrary',
                             sources=[PyUL_source],
                             include_dirs = mcc_cpppath,
                             library_dirs = mcc_libpath,
                             libraries = mcc_libs,
                             ))
setup(name='PyUniversalLibrary',
      license='BSD',
      version='20050623',
      author='Andrew Straw',
      ext_modules= ext_modules,
      cmdclass = {'build_ext': build_ext}, # use Pyrex's build_ext command
      )
