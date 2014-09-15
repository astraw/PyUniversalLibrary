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
import UniversalLibrary as UL

BoardNum = 0
devNum = 0
FirstPort = 0

FirstPort = UL.cbGetConfig(UL.DIGITALINFO, BoardNum, devNum, UL.DIDEVTYPE, FirstPort)

PortNum = UL.FIRSTPORTA
Direction = UL.DIGITALOUT
UL.cbDConfigPort (BoardNum, PortNum, Direction)

DataValue = 0
UL.cbDOut(BoardNum, PortNum, DataValue)

if FirstPort == UL.AUXPORT:
    devNum = 1
    UL.cbGetConfig(UL.DIGITALINFO, BoardNum, devNum, UL.DIDEVTYPE, FirstPort)

if FirstPort==UL.FIRSTPORTA:
    FirstBit = 0
elif FirstPort==UL.FIRSTPORTB:
    FirstBit = 8
elif FirstPort==UL.FIRSTPORTCL:
    FirstBit = 16
elif FirstPort==UL.FIRSTPORTCH:
    FirstBit = 20
else:
    FirstBit = 0
    
Direction = UL.DIGITALOUT
UL.cbDConfigPort(BoardNum, FirstPort+1, Direction)
DataValue = 5
BitLevel = 1
for BitNum in range(8):
    if BitNum == DataValue and BitLevel==1:
        BitValue = 1
    elif BitNum == DataValue and BitLevel==0:
        BitValue = 0
    else:
        BitValue = 0
    
    PortType=UL.FIRSTPORTA
    UL.cbDBitOut(BoardNum, PortType, FirstBit+BitNum, BitValue)
