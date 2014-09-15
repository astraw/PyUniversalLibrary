# emacs, this is -*-Python-*- mode

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

"""
PyUniversalLibrary is a Python wrapper for Measurement Computing's
Universal Library for data acquisition on Microsoft Windows operating
systems.


Functions not wrapped because the Python UniversalLibrary module
should eliminate the need to call them:

cbErrHandling()
cbDeclareRevision()

"""

import Numeric
cimport c_numeric

__version__ = '20050624'

cdef extern from "Windows.h":
    cdef void * malloc( int size )
    cdef void free( void * ptr )

cdef extern from "Python.h":
    void Py_BEGIN_ALLOW_THREADS()
    void Py_END_ALLOW_THREADS()

#####################################
#
# Python functions and classes
#
#####################################

def _get_error_message(int UDStat):
    """query Universal Library for the description of an error number"""
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

def __declare_revlevel__():
    cdef float RevLevel
    RevLevel = CURRENTREVNUM
    CHK(cbw.cbDeclareRevision(&RevLevel))
    
class UniversalLibraryBaseError( Exception ):
    """base class for all UniversalLibrary exceptions"""
    pass

class UniversalLibraryError( UniversalLibraryBaseError ):
    """error occurred within the C layer of Universal Library"""
    def __init__(self, int UDStat):
        errstr = 'Error %d: %s'%(UDStat,_get_error_message(UDStat))
        self.errno = UDStat
        Exception.__init__(self, errstr)

class UniversalLibraryPythonError( UniversalLibraryBaseError ):
    """error occurred within the Python layer of Universal Library"""
    pass

cdef CHK(int UDStat):
    """raise appropriate exception if error occurred"""
    if UDStat != NOERRORS:
        raise UniversalLibraryError(UDStat)

def CHK_ARRAY( arr, N, nxtype ):
    if len(arr.shape) != 1:
        raise UniversalLibraryPythonError("array is not rank 1")
    if arr.typecode() != nxtype:
        raise UniversalLibraryPythonError("array is not correct data type '%s'"%str(nxtype))
    if len(arr) < N:
        raise UniversalLibraryPythonError("array is not large enough")

###############################
#
# Analog I/O functions for UL
#
###############################

def cbAConvertData (int BoardNum, long NumPoints, c_numeric.ArrayType ADData, 
                    c_numeric.ArrayType ChanTags):
    """Convert data collected by cbAInScan()

    Inputs
    ------
    BoardNum
    NumPoints
    ADData --  modified to contain the data array
    ChanTags --  modified to contain the channel tag array

    """
    CHK_ARRAY( ADData, NumPoints, Numeric.UInt16 )
    CHK_ARRAY( ChanTags, NumPoints, Numeric.UInt16 )
    CHK( cbw.cbAConvertData(BoardNum, NumPoints, <cbw.USHORT*>ADData.data, 
                            <cbw.USHORT*>ChanTags.data))

def cbAConvertPretrigData(int BoardNum, long PreTrigCount, 
                          long TotalCount, c_numeric.ArrayType ADData, 
                          c_numeric.ArrayType ChanTags):
    """Convert data collected by cbAPretrig().

    Inputs
    ------
    BoardNum
    PreTrigCount
    TotalCount
    ADData --  modified to contain the data array
    ChanTags --  modified to contain the channel tag array

    """
    CHK_ARRAY( ADData, NumPoints, Numeric.UInt16 )
    CHK_ARRAY( ChanTags, NumPoints, Numeric.UInt16 )
    CHK( cbw.cbAConvertPretrigData(BoardNum, PreTrigCount, 
                                   TotalCount, <cbw.USHORT*>ADData.data, 
                                   <cbw.USHORT*>ChanTags.data))

def cbACalibrateData (int BoardNum, long NumPoints, int Gain, 
                      c_numeric.ArrayType ADData):
    CHK( cbw.cbACalibrateData ( BoardNum, NumPoints, Gain, 
                                <cbw.USHORT*>ADData.data))

def cbAIn (short BoardNum, short Chan, short Gain, unsigned short DataValue=0):
    """Read A/D input channel

    Inputs
    ------
    
    BoardNum
    Chan
    Gain
    DataValue

    Outputs
    -------
    DataValue
    
    """
    
    CHK(cbw.cbAIn(BoardNum, Chan, Gain, &DataValue))
    return DataValue

def cbAInScan(int BoardNum, int LowChan, int HighChan, long Count,
              long Rate, int Gain, c_numeric.ArrayType ADData,
              int Options):
    """Scan range of A/D channels and store samples in an array

    Inputs
    ------

    BoardNum
    LowChan
    HighChan
    Count
    Rate
    Gain
    ADData -- modified to contain the sampled data
    Options

    Outputs
    -------
    
    Rate
    
    """
    cdef int err
    CHK_ARRAY( ADData, Count, Numeric.Int16 )
    Py_BEGIN_ALLOW_THREADS
    err = cbw.cbAInScan(BoardNum, LowChan, HighChan, Count,
                       &Rate, Gain, ADData.data, Options)
    Py_END_ALLOW_THREADS
    CHK(err)
    return Rate

def cbALoadQueue (int BoardNum, c_numeric.ArrayType ChanArray, c_numeric.ArrayType GainArray, 
                  int NumChans):
    CHK_ARRAY( ChanArray, NumChans, Numeric.Int16 )
    CHK_ARRAY( GainArray, NumChans, Numeric.Int16 )
    CHK(cbw.cbALoadQueue(BoardNum, <short*>ChanArray.data, <short*>GainArray.data, NumChans))
    
def cbAOut(int BoardNum, int Chan, int Gain, cbw.USHORT DataValue):
    CHK( cbw.cbAOut(BoardNum, Chan, Gain, DataValue))

def cbAOutScan (int BoardNum, int LowChan, int HighChan, 
                long Count, long Rate, int Gain, 
                c_numeric.ArrayType MemHandle, int Options):
    cdef int err
    CHK_ARRAY( MemHandle, Count, Numeric.Int16 )
    Py_BEGIN_ALLOW_THREADS
    err = cbw.cbAOutScan( BoardNum, LowChan, HighChan, 
                          Count, &Rate, Gain, 
                          MemHandle.data, Options)
    Py_END_ALLOW_THREADS
    CHK(err)
    return Rate
    
def cbAPretrig (int BoardNum, int LowChan, int HighChan,
                long PreTrigCount, long TotalCount, long Rate, 
                int Gain, c_numeric.ArrayType ADData, int Options):
    """Acquire analog data upon being triggered.

    Inputs
    ------
    
    BoardNum
    LowChan
    HighChan
    PreTrigCount
    TotalCount
    Rate
    Gain
    ADData -- modified to contain the sampled data
    Options

    Outputs
    -------

    PreTrigCount
    TotalCount
    Rate

    """
    
    cdef int err
    CHK_ARRAY( ADData, TotalCount+512, Numeric.Int16 )
    Py_BEGIN_ALLOW_THREADS
    err = cbw.cbAPretrig( BoardNum, LowChan, HighChan,
                          &PreTrigCount, &TotalCount, &Rate, 
                          Gain, ADData.data, Options)
    Py_END_ALLOW_THREADS
    CHK(err)
    return PreTrigCount, TotalCount, Rate

def cbATrig (int BoardNum, int Chan, int TrigType, 
             cbw.USHORT TrigValue, int Gain, cbw.USHORT DataValue):
    CHK(cbw.cbATrig( BoardNum, Chan, TrigType, 
                     TrigValue, Gain, &DataValue))
    return DataValue
    

###################################
#
# Configuration functions for UL
#
###################################

def cbGetConfig(int InfoType, int BoardNum, int DevNum, 
                int ConfigItem, int ConfigVal):
    """Return a configuration option for a card.

    Inputs
    ------
    InfoType
    BoardNum
    DevNum
    ConfigItem
    ConfigVal

    Outputs
    -------
    ConfigVal
    """
    CHK( cbw.cbGetConfig(InfoType, BoardNum, DevNum, 
                          ConfigItem, &ConfigVal))
    return ConfigVal

def cbGetSignal(int BoardNum, int Direction, int Signal, int Index, int Connection, int Polarity):
    """Retrieve the information for the specified timing and control signal

    Inputs
    ------

    BoardNum
    Direction
    Signal
    Index
    Connection
    Polarity

    Outputs
    -------

    Connection
    Polarity
    
    """
    CHK(cbw.cbGetSignal(BoardNum, Direction, Signal, Index,&Connection,&Polarity))
    return Connection, Polarity

def cbSelectSignal(int BoardNum, int Direction, int Signal, int Connection, int Polarity):
    """Configure timing and control signal to use specific connections as a source or destination.

    Inputs
    ------
    
    BoardNum
    Direction
    Signal
    Connection
    Polarity
    
    """
    CHK(cbw.cbSelectSignal(BoardNum, Direction, Signal, Connection, Polarity))

def cbSetConfig (int InfoType, int BoardNum, int DevNum, 
                 int ConfigItem, int ConfigVal):
    """Set configuration option for a card.

    Inputs
    ------
    InfoType
    BoardNum
    DevNum
    ConfigItem
    ConfigVal
    """
    CHK(cbw.cbSetConfig(InfoType,BoardNum,DevNum, ConfigItem,ConfigVal))
    
def cbSetTrigger(int BoardNum, int TrigType, cbw.USHORT LowThreshold, 
                 cbw.USHORT HighThreshold):
    """Selects trigger source and sets up parameters

    Inputs
    ------
    
    BoardNum
    TrigType
    LowThreshold
    HighThreshold
    
    """
    CHK( cbw.cbSetTrigger(BoardNum,TrigType,LowThreshold,HighThreshold))


################################
#
# Digital I/O functions for UL
#
################################

def cbDBitIn(int BoardNum, int PortType, int BitNum, 
             cbw.USHORT BitValue):
    """Read state of a single digital input bit.

    Inputs
    ------
    
    BoardNum
    PortType
    BitNum
    BitValue

    Outputs
    -------

    BitValue

    """
    CHK(cbw.cbDBitIn(BoardNum, PortType, BitNum, &BitValue))
    return BitValue

def cbDBitOut (int BoardNum, int PortType, int BitNum, cbw.USHORT BitValue):
    """Set state of a single digital output bit.

    Inputs
    ------
    
    BoardNum
    PortType
    BitNum
    BitValue
    
    """
    
    CHK( cbw.cbDBitOut( BoardNum, PortType, BitNum, BitValue))

def cbDConfigBit(int BoardNum, int PortNum, int BitNum, int Direction):
    """Configure a digital bit as Input or Output.

    Inputs
    ------
    BoardNum
    PortNum
    BitNum
    Direction

    """
    CHK(cbw.cbDConfigBit(BoardNum, PortNum, BitNum, Direction))

def cbDConfigPort(int BoardNum, int PortNum, int Direction):
    """Configure digital port as input or output.

    Inputs
    ------
    BoardNum
    PortNum
    Direction
    
    """
    CHK( cbw.cbDConfigPort( BoardNum, PortNum, Direction))

def cbDIn (int BoardNum, int PortNum, cbw.USHORT DataValue):
    """Read a digital port

    Inputs
    ------
    BoardNum
    PortNum
    DataValue

    Outputs
    -------
    DataValue

    """
    CHK(cbw.cbDIn(BoardNum, PortNum, &DataValue))
    return DataValue

def cbDInScan( int BoardNum, int PortNum, long Count, long Rate,
               c_numeric.ArrayType MemHandle, int Options):
    """Multiple reads of a digital port

    Inputs
    ------

    BoardNum
    PortNum
    Count
    Rate
    MemHandle -- modified to contain the sampled data
    Options

    Outputs
    -------

    Rate

    """
    cdef int err
    CHK_ARRAY( MemHandle, Count, Numeric.UInt8 )
    Py_BEGIN_ALLOW_THREADS
    err = cbw.cbDInScan( BoardNum, PortNum,Count,  &Rate,
                         MemHandle.data, Options)
    Py_END_ALLOW_THREADS
    CHK(err)
    return Rate

def cbDOut(int BoardNum, int PortNum, cbw.USHORT DataValue):
    """Write to digital output

    Inputs
    ------
    BoardNum
    PortNum
    DataValue
    
    """
    CHK(cbw.cbDOut(BoardNum, PortNum, DataValue))

def cbDOutScan (int BoardNum, int PortNum, long Count, long Rate,
                c_numeric.ArrayType MemHandle, int Options):
    """Perform multiple writes to digital output

    Inputs
    ------
    
    BoardNum
    PortNum
    Count
    Rate
    MemHandle -- modified to contain the sampled data
    Options

    Outputs
    -------

    Rate

    """
    cdef int err
    CHK_ARRAY( MemHandle, Count, Numeric.UInt8 )
    Py_BEGIN_ALLOW_THREADS
    err = cbw.cbDOutScan( BoardNum, PortNum, Count, &Rate,
                          MemHandle.data, Options)
    Py_END_ALLOW_THREADS
    CHK(err)
    return Rate

#####################################
#
# Revision Control functions for UL
#
#####################################

def cbGetRevision():
    cdef float RevNum, VxDRevNum
    cbw.cbGetRevision (&RevNum, &VxDRevNum)
    return RevNum, VxDRevNum

###############################
#
# Temperature Input Functions
#
###############################

def cbTIn( int BoardNum, int Chan, int Scale, float TempValue,
           int Options):
    """Read temperature.

    Inputs
    ------

    BoardNum
    Chan
    Scale
    TempValue
    Options

    Outputs
    -------
    
    TempValue


    """
    
    CHK( cbw.cbTIn( BoardNum, Chan, Scale, &TempValue, Options))
    return TempValue

def cbTInScan (int BoardNum, int LowChan, int HighChan, int Scale,
               c_numeric.ArrayType DataBuffer, int Options):
    """Read a range of temperature channels

    Inputs
    ------

    BoardNum
    LowChan
    HighChan
    Scale
    DataBuffer -- modified to contain the sampled data
    Options

    """
    CHK_ARRAY( DataBuffer, HighChan - LowChan + 1, Numeric.Float32 )
    CHK(cbw.cbTInScan(BoardNum, LowChan, HighChan, Scale,
                      <float*>DataBuffer.data, Options))
    
###############################
#
# Miscellaneous functions
#
###############################

def cbFromEngUnits (int BoardNum, int Range, float EngUnits, 
                    cbw.USHORT DataVal):
    """Convert a voltage or current to an A/D count value
    
    Inputs
    ------
    
    BoardNum
    Range
    EngUnits
    DataVal
    
    Outputs
    -------

    DataVal
    
    """
    CHK(cbw.cbFromEngUnits(BoardNum,Range, EngUnits, &DataVal))
    return DataVal

def cbToEngUnits(short BoardNum, short Range, unsigned short DataVal, float EngUnits=0.0):
    """Converts an A/D count value to voltage value

    Inputs
    ------

    BoardNum
    Range
    DataVal
    EngUnits

    Outputs
    -------

    EngUnits

    """
    
    CHK(cbw.cbToEngUnits(BoardNum, Range, DataVal, &EngUnits))
    return EngUnits
    
def cbGetStatus(int BoardNum, short Status, long CurCount, # as above
                long CurIndex,int FunctionType):
    """Returns status about potentially currently running background operation"""
    CHK( cbw.cbGetStatus(BoardNum, &Status, &CurCount, &CurIndex, FunctionType))
    return Status, CurCount, CurIndex

###############################
#
# Module initialization
#
###############################

# Declare UL Revision Level upon module import
__declare_revlevel__()
