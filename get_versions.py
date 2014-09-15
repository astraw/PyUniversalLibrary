import sys
print 'Python',sys.version

import Numeric
print 'Numeric',Numeric.__version__

import UniversalLibrary as UL
print 'PyUniversalLibrary',UL.__version__
print 'Universal Library C API',UL.cbGetRevision()
