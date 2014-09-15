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

cdef extern from "cbw.h":

    ctypedef unsigned short USHORT
    ctypedef void* HGLOBAL
    int cbACalibrateData (int BoardNum, long NumPoints, int Gain, 
                          USHORT *ADData)
    int cbGetRevision (float *RevNum, float *VxDRevNum)
    int cbLoadConfig(char *CfgFileName)
    int cbSaveConfig(char *CfgFileName)
    int cbAConvertData (int BoardNum, long NumPoints, USHORT *ADData, 
                        USHORT *ChanTags)
    int cbDeclareRevision(float *RevNum)
    int cbErrHandling (int ErrReporting, int ErrHandling)

    int cbAIn (int BoardNum, int Chan, int Gain, USHORT *DataValue)
    int cbToEngUnits (int BoardNum, int Range, USHORT DataVal, float *EngUnits)

    int cbAInScan (int BoardNum, int LowChan, int HighChan, long Count,
                            long *Rate, int Gain, HGLOBAL MemHandle, 
							int Options)
    int cbGetIOStatus (int BoardNum, short *Status, long *CurCount,
                   long *CurIndex,int FunctionType)
    int cbGetStatus (int BoardNum, short *Status, long *CurCount, # as above
                   long *CurIndex,int FunctionType)                                                   
    int cbStopIOBackground (int BoardNum, int FunctionType)
    int cbStopBackground (int BoardNum, int FunctionType) # as above
    int cbAPretrig (int BoardNum, int LowChan, int HighChan,
                             long *PreTrigCount, long *TotalCount, long *Rate, 
                             int Gain, HGLOBAL MemHandle, int Options)
    int cbSetTrigger (int BoardNum, int TrigType, USHORT LowThreshold, 
		                       USHORT HighThreshold)
    int cbGetErrMsg(int ErrCode, char *ErrMsg)                      
