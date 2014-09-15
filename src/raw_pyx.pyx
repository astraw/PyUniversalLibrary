# Copyright (c) 2005, California Institute of Technology
# All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:

#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.

#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.

#     * Neither the name of the California Institute of Technology nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior
#       written permission.

# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# Author: Andrew Straw

#emacs, this is -*-Python-*- mode

import Numeric
cimport c_numeric

__version__ = '20050623'

cdef extern from "Windows.h":
    cdef void * malloc( int size )
    cdef void free( void * ptr )

cdef extern from "Python.h":
    void Py_BEGIN_ALLOW_THREADS()
    void Py_END_ALLOW_THREADS()
    
def _get_error_message(int UDStat):
    cdef char* err_msg
    cdef int err2

    err_msg = <char*>malloc(ERRSTRLEN)
    if err_msg == NULL:
        raise MemoryError('Could not allocate memory to get error message')

    err2 = cbw.cbGetErrMsg(UDStat,err_msg)
    if err2:
        raise SystemError('Error %d while getting error message for error %d'%(err2,UDStat))
    origerrstr = str(err_msg)
    free(<void*>err_msg)
    return origerrstr

class UniversalLibraryError( Exception ):
    def __init__(self, int UDStat):
        errstr = 'Error %d: %s'%(UDStat,_get_error_message(UDStat))
        self.errno = UDStat
        Exception.__init__(self, errstr)

cdef CHK(int UDStat):
    if UDStat != NOERRORS:
        raise UniversalLibraryError(UDStat)

def cbDeclareRevision( float RevLevel ):
    CHK(cbw.cbDeclareRevision(&RevLevel))
    return RevLevel

def cbGetRevision():
    cdef float RevNum, VxDRevNum
    cbw.cbGetRevision (&RevNum, &VxDRevNum)
    return RevNum, VxDRevNum

def cbErrHandling (int ErrReporting, int ErrHandling):
    CHK(cbw.cbErrHandling(ErrReporting, ErrHandling))

def cbAIn (short BoardNum, short Chan, short Gain, unsigned short DataValue=0):
    CHK(cbw.cbAIn(BoardNum, Chan, Gain, &DataValue))
    return DataValue

def cbToEngUnits(short BoardNum, short Range, unsigned short DataVal, float EngUnits=0.0):
    CHK(cbw.cbToEngUnits(BoardNum, Range, DataVal, &EngUnits))
    return EngUnits

def cbAInScan(int BoardNum, int LowChan, int HighChan, long Count,
              long Rate, int Gain, c_numeric.ArrayType ADData,
              int Options):
    cdef int err
    assert Count == ADData.shape[0]
    assert len(ADData.shape) == 1
    assert ADData.typecode() == Numeric.Int16
    Py_BEGIN_ALLOW_THREADS
    err = cbw.cbAInScan(BoardNum, LowChan, HighChan, Count,
                       &Rate, Gain, ADData.data, Options)
    Py_END_ALLOW_THREADS
    CHK(err)
    return Rate

def cbAPretrig (int BoardNum, int LowChan, int HighChan,
                long PreTrigCount, long TotalCount, long Rate, 
                int Gain, c_numeric.ArrayType ADData, int Options):
    cdef int err
    assert TotalCount <= ADData.shape[0]
    assert len(ADData.shape) == 1
    assert ADData.typecode() == Numeric.Int16
    Py_BEGIN_ALLOW_THREADS
    err = cbw.cbAPretrig( BoardNum, LowChan, HighChan,
                          &PreTrigCount, &TotalCount, &Rate, 
                          Gain, ADData.data, Options)
    Py_END_ALLOW_THREADS
    CHK(err)
    return PreTrigCount, TotalCount, Rate
    
def cbGetStatus(int BoardNum, short Status, long CurCount, # as above
                long CurIndex,int FunctionType):
    CHK( cbw.cbGetStatus(BoardNum, &Status, &CurCount, &CurIndex, FunctionType))
    return Status, CurCount, CurIndex

def cbSetTrigger(int BoardNum, int TrigType, cbw.USHORT LowThreshold, 
                 cbw.USHORT HighThreshold):
    CHK( cbw.cbSetTrigger(BoardNum,TrigType,LowThreshold,HighThreshold))

# Declare UL Revision Level upon module import
cbDeclareRevision( CURRENTREVNUM )
