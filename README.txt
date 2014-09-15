==================
PyUniversalLibrary
==================

PyUniversalLibrary is a Python wrapper for Measurement Computing's
Universal Library for data acquisition on Microsoft Windows operating
systems.

This document is both the `webpage for PyUniversalLibrary`_ and the
README.txt file (distributed with the source code of
PyUniversalLibrary).  It is in reStructuredText_ format.

.. _webpage for PyUniversalLibrary: http://www.its.caltech.edu/~astraw/pyul.html
.. _reStructuredText: http://docutils.sourceforge.net/rst.html

.. contents::

Work in Progress
----------------

Currently PyUniversalLibrary is incomplete.  I have so far wrapped
analog I/O, digital I/O, and temperature functions.  Some of these I
have not personally needed, so please be aware of potential bugs.  If
you need more functionality, you will hopefully find that the start I
have made in wrapping this library useful. I welcome your changes and
additions.  I will include them with the next release with appropriate
credit.

**Current version:** 20050624

Also of interest
----------------

Various Python wrappers for data acquisition are available.  Here are a few I know of:

 * National Instruments NI-DAQ: http://sourceforge.net/projects/uncpythontools/
 * Data Translation: `Martin Spacek`_ has indicated (personal commication) he has drivers
 * Comedi apparently comes with Python wrappers: http://www.comedi.org/

.. _Martin Spacek: http://www.ece.ualberta.ca/~mspacek/

Installation and Download
-------------------------

You must download and install InstaCal_ from `Measurement Computing`_.
This contains the various libraries needed to access your hardware.

You must have Python_ installed.

You must have Numeric_ installed.

**Download PyUniversalLibrary:** Grab a binary installer or the source
code from the `download directory`_.

*For the binary installers, make sure you match the Python and Numeric
version numbers.* (The Universal Library DLLs can supposedly adjust
their interface to the version PyUniversalLibrary was built with.)

*To get the examples, download the source code.* You can still install
the binaries without compiling anything.

To compile the source code, you will need Pyrex_ and the Universal
Library C API.  Run::

 python autogen.py # re-generates the source files using MCC's headers
 python setup.py install # compiles and installs the source

Optional
````````

If you intend make significant use of PyUniversalLibrary, I suggest
you buy `Universal Library`_ C API. It costs $50 and includes
extensive documentation and example code.

.. _Measurement Computing: http://measurementcomputing.com/
.. _InstaCal: ftp://ftp.computerboards.com/DAQ_Software_CD/swinstall.exe
.. _Python: http://www.python.org
.. _Numeric: http://numeric.scipy.org/
.. _download directory: http://www.its.caltech.edu/~astraw/PyUniversalLibrary
.. _Pyrex: http://www.cosc.canterbury.ac.nz/~greg/python/Pyrex/
.. _Universal Library: http://www.measurementcomputing.com/cbicatalog/cbiproduct.asp?dept%5Fid=347&pf%5Fid=1084&mscssid=T6FXUB9D01HH8JDAJRKLJ7WRHLKA7FDF

Examples
--------

Here is ulai01.py from the example directory.  It is a direct
translation of the essentials of ulai01.c, included with `Universal
Library`_. Error checking occurs automatically through Python
exceptions.

::

  import UniversalLibrary as UL

  BoardNum = 0
  Gain = UL.BIP5VOLTS
  Chan = 0

  while 1:
      DataValue = UL.cbAIn(BoardNum, Chan, Gain)
      EngUnits = UL.cbToEngUnits(BoardNum, Gain, DataValue)

      print DataValue, EngUnits


Further examples are included, including a simple wxPython_/matplotlib_ based oscilloscope.

.. _wxPython: http://wxpython.org/
.. _matplotlib: http://matplotlib.sourceforge.net/

Usage notes
-----------

Naming conventions
``````````````````

'PyUL' is used here to mean the UniversalLibray Python module. Because
UniversalLibrary is cumbersome to type, the example programs actually
use "import UniversalLibrary as UL".

PyUniversalLibrary endeavors to keep function signatures identical to
the C API. These sometimes result in non-Pythonic quirks: some
arguments to a function have no effect on that function because in C
they are output variables.  In these cases, they are returned as
outputs from the function.

Error handling
``````````````

The PyUL checks for errors upon every call and raises a
UniversalLibraryError if an error was encountered.  Instances of
UniversalLibraryError have an errno attribute which can be converted
to a string with a call to _get_error_message(errno).

Initialization
``````````````

The short story is that importing PyUL ("import UniversalLibrary")
will do all initialization necessary.

The long story is that C programs call the cbDeclareRevision() and
cbErrHandling() functions upon initialization.  PyUL calls
cbDeclareRevision() automatically, and calling cbErrHandling() is not
needed because the default state DONTPRINT, DONTSTOP, which is exactly
what PyUL expects, because PyUL checks all the error codes anyhow.

License
-------

BSD license.  See the file LICENSE.txt distributed with the source
code.

Owner: `California Institute of Technology`_
Author: `Andrew Straw`_

.. _California Institute of Technology: http://www.caltech.edu
.. _Andrew Straw: http://www.its.caltech.edu/~astraw