#emacs, this is -*-Python-*- mode

cdef extern from "Numeric/arrayobject.h":
    ctypedef enum AyArray_TYPES:
        PyArray_UBYTE
    void import_array()
    ctypedef class Numeric.ArrayType [object PyArrayObject]:
        cdef char *data
        cdef int nd
        cdef int *dimensions, *strides
