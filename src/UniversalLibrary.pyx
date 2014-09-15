
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




# WARNING WARNING WARNING WARNING WARNING WARNING

# This is an automatically generated file.  See
# ../autogen_pyx.py for the script that generates this file.

cimport cbw

CURRENTREVNUM                  =       5.56
NOERRORS                       =          0
BADBOARD                       =          1
DEADDIGITALDEV                 =          2
DEADCOUNTERDEV                 =          3
DEADDADEV                      =          4
DEADADDEV                      =          5
NOTDIGITALCONF                 =          6
NOTCOUNTERCONF                 =          7
NOTDACONF                      =          8
NOTADCONF                      =          9
NOTMUXCONF                     =         10
BADPORTNUM                     =         11
BADCOUNTERDEVNUM               =         12
BADDADEVNUM                    =         13
BADSAMPLEMODE                  =         14
BADINT                         =         15
BADADCHAN                      =         16
BADCOUNT                       =         17
BADCNTRCONFIG                  =         18
BADDAVAL                       =         19
BADDACHAN                      =         20
ALREADYACTIVE                  =         22
PAGEOVERRUN                    =         23
BADRATE                        =         24
COMPATMODE                     =         25
TRIGSTATE                      =         26
ADSTATUSHUNG                   =         27
TOOFEW                         =         28
OVERRUN                        =         29
BADRANGE                       =         30
NOPROGGAIN                     =         31
BADFILENAME                    =         32
DISKISFULL                     =         33
COMPATWARN                     =         34
BADPOINTER                     =         35
TOOMANYGAINS                   =         36
RATEWARNING                    =         37
CONVERTDMA                     =         38
DTCONNECTERR                   =         39
FORECONTINUOUS                 =         40
BADBOARDTYPE                   =         41
WRONGDIGCONFIG                 =         42
NOTCONFIGURABLE                =         43
BADPORTCONFIG                  =         44
BADFIRSTPOINT                  =         45
ENDOFFILE                      =         46
NOT8254CTR                     =         47
NOT9513CTR                     =         48
BADTRIGTYPE                    =         49
BADTRIGVALUE                   =         50
BADOPTION                      =         52
BADPRETRIGCOUNT                =         53
BADDIVIDER                     =         55
BADSOURCE                      =         56
BADCOMPARE                     =         57
BADTIMEOFDAY                   =         58
BADGATEINTERVAL                =         59
BADGATECNTRL                   =         60
BADCOUNTEREDGE                 =         61
BADSPCLGATE                    =         62
BADRELOAD                      =         63
BADRECYCLEFLAG                 =         64
BADBCDFLAG                     =         65
BADDIRECTION                   =         66
BADOUTCONTROL                  =         67
BADBITNUMBER                   =         68
NONEENABLED                    =         69
BADCTRCONTROL                  =         70
BADEXPCHAN                     =         71
WRONGADRANGE                   =         72
OUTOFRANGE                     =         73
BADTEMPSCALE                   =         74
BADERRCODE                     =         75
NOQUEUE                        =         76
CONTINUOUSCOUNT                =         77
UNDERRUN                       =         78
BADMEMMODE                     =         79
FREQOVERRUN                    =         80
NOCJCCHAN                      =         81
BADCHIPNUM                     =         82
DIGNOTENABLED                  =         83
CONVERT16BITS                  =         84
NOMEMBOARD                     =         85
DTACTIVE                       =         86
NOTMEMCONF                     =         87
ODDCHAN                        =         88
CTRNOINIT                      =         89
NOT8536CTR                     =         90
FREERUNNING                    =         91
INTERRUPTED                    =         92
NOSELECTORS                    =         93
NOBURSTMODE                    =         94
NOTWINDOWSFUNC                 =         95
NOTSIMULCONF                   =         96
EVENODDMISMATCH                =         97
M1RATEWARNING                  =         98
NOTRS485                       =         99
NOTDOSFUNC                     =        100
RANGEMISMATCH                  =        101
CLOCKTOOSLOW                   =        102
BADCALFACTORS                  =        103
BADCONFIGTYPE                  =        104
BADCONFIGITEM                  =        105
NOPCMCIABOARD                  =        106
NOBACKGROUND                   =        107
STRINGTOOSHORT                 =        108
CONVERTEXTMEM                  =        109
BADEUADD                       =        110
DAS16JRRATEWARNING             =        111
DAS08TOOLOWRATE                =        112
AMBIGSENSORONGP                =        114
NOSENSORTYPEONGP               =        115
NOCONVERSIONNEEDED             =        116
NOEXTCONTINUOUS                =        117
INVALIDPRETRIGCONVERT          =        118
BADCTRREG                      =        119
BADTRIGTHRESHOLD               =        120
BADPCMSLOTREF                  =        121
AMBIGPCMSLOTREF                =        122
BADSENSORTYPE                  =        123
DELBOARDNOTEXIST               =        124
NOBOARDNAMEFILE                =        125
CFGFILENOTFOUND                =        126
NOVDDINSTALLED                 =        127
NOWINDOWSMEMORY                =        128
OUTOFDOSMEMORY                 =        129
OBSOLETEOPTION                 =        130
NOPCMREGKEY                    =        131
NOCBUL32SYS                    =        132
NODMAMEMORY                    =        133
IRQNOTAVAILABLE                =        134
NOT7266CTR                     =        135
BADQUADRATURE                  =        136
BADCOUNTMODE                   =        137
BADENCODING                    =        138
BADINDEXMODE                   =        139
BADINVERTINDEX                 =        140
BADFLAGPINS                    =        141
NOCTRSTATUS                    =        142
NOGATEALLOWED                  =        143
NOINDEXALLOWED                 =        144
OPENCONNECTION                 =        145
BMCONTINUOUSCOUNT              =        146
BADCALLBACKFUNC                =        147
MBUSINUSE                      =        148
MBUSNOCTLR                     =        149
BADEVENTTYPE                   =        150
ALREADYENABLED                 =        151
BADEVENTSIZE                   =        152
CANTINSTALLEVENT               =        153
BADBUFFERSIZE                  =        154
BADAIMODE                      =        155
BADSIGNAL                      =        156
BADCONNECTION                  =        157
BADINDEX                       =        158
NOCONNECTION                   =        159
BADBURSTIOCOUNT                =        160
DEADDEV                        =        161
NOTREADY                       =        165
AIFUNCTION                     =          1
AOFUNCTION                     =          2
DIFUNCTION                     =          3
DOFUNCTION                     =          4
CTRFUNCTION                    =          5
COARSE_GAIN                    =       0x01
COARSE_OFFSET                  =       0x02
FINE_GAIN                      =       0x04
FINE_OFFSET                    =       0x08
GAIN                           = COARSE_GAIN
OFFSET                         = COARSE_OFFSET
INTERNALERR                    =        200
CANT_LOCK_DMA_BUF              =        201
DMA_IN_USE                     =        202
BAD_MEM_HANDLE                 =        203
NO_ENHANCED_MODE               =        204
MEMBOARDPROGERROR              =        211
INTERNAL32_ERR                 =        300
NO_MEMORY_FOR_BUFFER           =        301
WIN95_CANNOT_SETUP_ISR_DATA    =        302
WIN31_CANNOT_SETUP_ISR_DATA    =        303
CFG_FILE_READ_FAILURE          =        304
CFG_FILE_WRITE_FAILURE         =        305
CREATE_BOARD_FAILURE           =        306
DEVELOPMENT_OPTION             =        307
CFGFILE_CANT_OPEN              =        308
CFGFILE_BAD_ID                 =        309
CFGFILE_BAD_REV                =        310
CFGFILE_NOINSERT               =        311
CFGFILE_NOREPLACE              =        312
BIT_NOT_ZERO                   =        313
BIT_NOT_ONE                    =        314
BAD_CTRL_REG                   =        315
BAD_OUTP_REG                   =        316
BAD_RDBK_REG                   =        317
NO_CTRL_REG                    =        318
NO_OUTP_REG                    =        319
NO_RDBK_REG                    =        320
CTRL_REG_FAIL                  =        321
OUTP_REG_FAIL                  =        322
RDBK_REG_FAIL                  =        323
FUNCTION_NOT_IMPLEMENTED       =        324
BAD_RTD_CONVERSION             =        325
NO_PCI_BIOS                    =        326
BAD_PCI_INDEX                  =        327
NO_PCI_BOARD                   =        328
PCI_ASSIGN_FAILED              =        329
PCI_NO_ADDRESS                 =        330
PCI_NO_IRQ                     =        331
CANT_INIT_ISR_INFO             =        332
CANT_PASS_USER_BUFFER          =        333
CANT_INSTALL_INT               =        334
CANT_UNINSTALL_INT             =        335
CANT_START_DMA                 =        336
CANT_GET_STATUS                =        337
CANT_GET_PRINT_PORT            =        338
CANT_MAP_PCM_CIS               =        339
CANT_GET_PCM_CFG               =        340
CANT_GET_PCM_CCSR              =        341
CANT_GET_PCI_INFO              =        342
DOS_ERR_OFFSET                 =        500
DOSBADFUNC                     =        501
DOSFILENOTFOUND                =        502
DOSPATHNOTFOUND                =        503
DOSNOHANDLES                   =        504
DOSACCESSDENIED                =        505
DOSINVALIDHANDLE               =        506
DOSNOMEMORY                    =        507
DOSBADDRIVE                    =        515
DOSTOOMANYFILES                =        518
DOSWRITEPROTECT                =        519
DOSDRIVENOTREADY               =        521
DOSSEEKERROR                   =        525
DOSWRITEFAULT                  =        529
DOSREADFAULT                   =        530
DOSGENERALFAULT                =        531
WIN_CANNOT_ENABLE_INT          =        603
WIN_CANNOT_DISABLE_INT         =        605
WIN_CANT_PAGE_LOCK_BUFFER      =        606
NO_PCM_CARD                    =        630
ERRSTRLEN                      =        256
BOARDNAMELEN                   =         25
IDLE                           =          0
RUNNING                        =          1
FOREGROUND                     =     0x0000
BACKGROUND                     =     0x0001
SINGLEEXEC                     =     0x0000
CONTINUOUS                     =     0x0002
TIMED                          =     0x0000
EXTCLOCK                       =     0x0004
NOCONVERTDATA                  =     0x0000
CONVERTDATA                    =     0x0008
NODTCONNECT                    =     0x0000
DTCONNECT                      =     0x0010
DEFAULTIO                      =     0x0000
SINGLEIO                       =     0x0020
DMAIO                          =     0x0040
BLOCKIO                        =     0x0060
BURSTIO                        =    0x10000
RETRIGMODE                     =    0x20000
BYTEXFER                       =     0x0000
WORDXFER                       =     0x0100
INDIVIDUAL                     =     0x0000
SIMULTANEOUS                   =     0x0200
FILTER                         =     0x0000
NOFILTER                       =     0x0400
NORMMEMORY                     =     0x0000
EXTMEMORY                      =     0x0800
BURSTMODE                      =     0x1000
NOTODINTS                      =     0x2000
EXTTRIGGER                     =     0x4000
NOCALIBRATEDATA                =     0x8000
CALIBRATEDATA                  =     0x0000
ENABLED                        =          1
DISABLED                       =          0
UPDATEIMMEDIATE                =          0
UPDATEONCOMMAND                =          1
NOTUSED                        =         -1
DONTPRINT                      =          0
PRINTWARNINGS                  =          1
PRINTFATAL                     =          2
PRINTALL                       =          3
DONTSTOP                       =          0
STOPFATAL                      =          1
STOPALL                        =          2
DIGITALOUT                     =          1
DIGITALIN                      =          2
DTIN                           =          0
DTOUT                          =          2
FROMHERE                       =         -1
GETFIRST                       =         -2
GETNEXT                        =         -3
CELSIUS                        =          0
FAHRENHEIT                     =          1
KELVIN                         =          2
VOLTS                          =          4
NOSCALE                        =          5
AUXPORT                        =          1
FIRSTPORTA                     =         10
FIRSTPORTB                     =         11
FIRSTPORTCL                    =         12
FIRSTPORTCH                    =         13
SECONDPORTA                    =         14
SECONDPORTB                    =         15
SECONDPORTCL                   =         16
SECONDPORTCH                   =         17
THIRDPORTA                     =         18
THIRDPORTB                     =         19
THIRDPORTCL                    =         20
THIRDPORTCH                    =         21
FOURTHPORTA                    =         22
FOURTHPORTB                    =         23
FOURTHPORTCL                   =         24
FOURTHPORTCH                   =         25
FIFTHPORTA                     =         26
FIFTHPORTB                     =         27
FIFTHPORTCL                    =         28
FIFTHPORTCH                    =         29
SIXTHPORTA                     =         30
SIXTHPORTB                     =         31
SIXTHPORTCL                    =         32
SIXTHPORTCH                    =         33
SEVENTHPORTA                   =         34
SEVENTHPORTB                   =         35
SEVENTHPORTCL                  =         36
SEVENTHPORTCH                  =         37
EIGHTHPORTA                    =         38
EIGHTHPORTB                    =         39
EIGHTHPORTCL                   =         40
EIGHTHPORTCH                   =         41
RSE                            =     0x1000
NRSE                           =     0x2000
DIFF                           =     0x4000
BIP20VOLTS                     =         15
BIP10VOLTS                     =          1
BIP5VOLTS                      =          0
BIP4VOLTS                      =         16
BIP2PT5VOLTS                   =          2
BIP2VOLTS                      =         14
BIP1PT25VOLTS                  =          3
BIP1VOLTS                      =          4
BIPPT625VOLTS                  =          5
BIPPT5VOLTS                    =          6
BIPPT25VOLTS                   =         12
BIPPT2VOLTS                    =         13
BIPPT1VOLTS                    =          7
BIPPT05VOLTS                   =          8
BIPPT01VOLTS                   =          9
BIPPT005VOLTS                  =         10
BIP1PT67VOLTS                  =         11
UNI10VOLTS                     =        100
UNI5VOLTS                      =        101
UNI4VOLTS                      =        114
UNI2PT5VOLTS                   =        102
UNI2VOLTS                      =        103
UNI1PT67VOLTS                  =        109
UNI1PT25VOLTS                  =        104
UNI1VOLTS                      =        105
UNIPT5VOLTS                    =        110
UNIPT25VOLTS                   =        111
UNIPT2VOLTS                    =        112
UNIPT1VOLTS                    =        106
UNIPT05VOLTS                   =        113
UNIPT02VOLTS                   =        108
UNIPT01VOLTS                   =        107
MA4TO20                        =        200
MA2TO10                        =        201
MA1TO5                         =        202
MAPT5TO2PT5                    =        203
MA0TO20                        =        204
UNIPOLAR                       =        300
BIPOLAR                        =        301
ADDA1                          =          0
ADDA2                          =          1
NOTLINKED                      =          0
GATECTR2                       =          1
TRIGCTR2                       =          2
INCTR2                         =          3
HIGHONLASTCOUNT                =          0
ONESHOT                        =          1
RATEGENERATOR                  =          2
SQUAREWAVE                     =          3
SOFTWARESTROBE                 =          4
HARDWARESTROBE                 =          5
LOADREG                        =          0
LOADANDHOLDREG                 =          1
ONETIME                        =          0
RECYCLE                        =          1
COUNTDOWN                      =          0
COUNTUP                        =          1
POSITIVEEDGE                   =          0
NEGATIVEEDGE                   =          1
ALWAYSLOW                      =          0
HIGHPULSEONTC                  =          1
TOGGLEONTC                     =          2
DISCONNECTED                   =          4
LOWPULSEONTC                   =          5
HIGHUNTILTC                    =          6
TCPREVCTR                      =          0
CTRINPUT1                      =          1
CTRINPUT2                      =          2
CTRINPUT3                      =          3
CTRINPUT4                      =          4
CTRINPUT5                      =          5
GATE1                          =          6
GATE2                          =          7
GATE3                          =          8
GATE4                          =          9
GATE5                          =         10
FREQ1                          =         11
FREQ2                          =         12
FREQ3                          =         13
FREQ4                          =         14
FREQ5                          =         15
CTRINPUT6                      =        101
CTRINPUT7                      =        102
CTRINPUT8                      =        103
CTRINPUT9                      =        104
CTRINPUT10                     =        105
GATE6                          =        106
GATE7                          =        107
GATE8                          =        108
GATE9                          =        109
GATE10                         =        110
FREQ6                          =        111
FREQ7                          =        112
FREQ8                          =        113
FREQ9                          =        114
FREQ10                         =        115
CTRINPUT11                     =        201
CTRINPUT12                     =        202
CTRINPUT13                     =        203
CTRINPUT14                     =        204
CTRINPUT15                     =        205
GATE11                         =        206
GATE12                         =        207
GATE13                         =        208
GATE14                         =        209
GATE15                         =        210
FREQ11                         =        211
FREQ12                         =        212
FREQ13                         =        213
FREQ14                         =        214
FREQ15                         =        215
CTRINPUT16                     =        301
CTRINPUT17                     =        302
CTRINPUT18                     =        303
CTRINPUT19                     =        304
CTRINPUT20                     =        305
GATE16                         =        306
GATE17                         =        307
GATE18                         =        308
GATE19                         =        309
GATE20                         =        310
FREQ16                         =        311
FREQ17                         =        312
FREQ18                         =        313
FREQ19                         =        314
FREQ20                         =        315
LOADREG1                       =          1
LOADREG2                       =          2
LOADREG3                       =          3
LOADREG4                       =          4
LOADREG5                       =          5
LOADREG6                       =          6
LOADREG7                       =          7
LOADREG8                       =          8
LOADREG9                       =          9
LOADREG10                      =         10
LOADREG11                      =         11
LOADREG12                      =         12
LOADREG13                      =         13
LOADREG14                      =         14
LOADREG15                      =         15
LOADREG16                      =         16
LOADREG17                      =         17
LOADREG18                      =         18
LOADREG19                      =         19
LOADREG20                      =         20
HOLDREG1                       =        101
HOLDREG2                       =        102
HOLDREG3                       =        103
HOLDREG4                       =        104
HOLDREG5                       =        105
HOLDREG6                       =        106
HOLDREG7                       =        107
HOLDREG8                       =        108
HOLDREG9                       =        109
HOLDREG10                      =        110
HOLDREG11                      =        111
HOLDREG12                      =        112
HOLDREG13                      =        113
HOLDREG14                      =        114
HOLDREG15                      =        115
HOLDREG16                      =        116
HOLDREG17                      =        117
HOLDREG18                      =        118
HOLDREG19                      =        119
HOLDREG20                      =        120
ALARM1CHIP1                    =        201
ALARM2CHIP1                    =        202
ALARM1CHIP2                    =        301
ALARM2CHIP2                    =        302
ALARM1CHIP3                    =        401
ALARM2CHIP3                    =        402
ALARM1CHIP4                    =        501
ALARM2CHIP4                    =        502
COUNT1                         =        601
COUNT2                         =        602
COUNT3                         =        603
COUNT4                         =        604
PRESET1                        =        701
PRESET2                        =        702
PRESET3                        =        703
PRESET4                        =        704
PRESCALER1                     =        801
PRESCALER2                     =        802
PRESCALER3                     =        803
PRESCALER4                     =        804
NOGATE                         =          0
AHLTCPREVCTR                   =          1
AHLNEXTGATE                    =          2
AHLPREVGATE                    =          3
AHLGATE                        =          4
ALLGATE                        =          5
AHEGATE                        =          6
ALEGATE                        =          7
NO_QUAD                        =          0
X1_QUAD                        =          1
X2_QUAD                        =          2
X4_QUAD                        =          4
NORMAL_MODE                    =          0
RANGE_LIMIT                    =          1
NO_RECYCLE                     =          2
MODULO_N                       =          3
BCD_ENCODING                   =          1
BINARY_ENCODING                =          2
INDEX_DISABLED                 =          0
LOAD_CTR                       =          1
LOAD_OUT_LATCH                 =          2
RESET_CTR                      =          3
CARRY_BORROW                   =          1
COMPARE_BORROW                 =          2
CARRYBORROW_UPDOWN             =          3
INDEX_ERROR                    =          4
C_UNDERFLOW                    =     0x0001
C_OVERFLOW                     =     0x0002
C_COMPARE                      =     0x0004
C_SIGN                         =     0x0008
C_ERROR                        =     0x0010
C_UP_DOWN                      =     0x0020
C_INDEX                        =     0x0040
TRIGABOVE                      =          0
TRIGBELOW                      =          1
GATE_NEG_HYS                   =          2
GATE_POS_HYS                   =          3
GATE_ABOVE                     =          4
GATE_BELOW                     =          5
GATE_IN_WINDOW                 =          6
GATE_OUT_WINDOW                =          7
GATE_HIGH                      =          8
GATE_LOW                       =          9
TRIG_HIGH                      =         10
TRIG_LOW                       =         11
TRIG_POS_EDGE                  =         12
TRIG_NEG_EDGE                  =         13
AUXIN0                         =       0x01
AUXIN1                         =       0x02
AUXIN2                         =       0x04
AUXIN3                         =       0x08
AUXIN4                         =       0x10
AUXIN5                         =       0x20
AUXOUT0                        =     0x0100
AUXOUT1                        =     0x0200
AUXOUT2                        =     0x0400
DS_CONNECTOR                   =    0x01000
MAX_CONNECTIONS                =          4
ADC_CONVERT                    =     0x0001
ADC_GATE                       =     0x0002
ADC_START_TRIG                 =     0x0004
ADC_STOP_TRIG                  =     0x0008
ADC_TB_SRC                     =     0x0010
ADC_SCANCLK                    =     0x0020
ADC_SSH                        =     0x0040
ADC_STARTSCAN                  =     0x0080
ADC_SCAN_STOP                  =     0x0100
DAC_UPDATE                     =     0x0200
DAC_TB_SRC                     =     0x0400
DAC_START_TRIG                 =     0x0800
SYNC_CLK                       =     0x1000
CTR1_CLK                       =     0x2000
CTR2_CLK                       =     0x4000
DGND                           =     0x8000
SIGNAL_IN                      =          2
SIGNAL_OUT                     =          4
INVERTED                       =          1
NONINVERTED                    =          0
GLOBALINFO                     =          1
BOARDINFO                      =          2
DIGITALINFO                    =          3
COUNTERINFO                    =          4
EXPANSIONINFO                  =          5
MISCINFO                       =          6
EXPINFOARRAY                   =          7
MEMINFO                        =          8
GIVERSION                      =         36
GINUMBOARDS                    =         38
GINUMEXPBOARDS                 =         40
BIBASEADR                      =          0
BIBOARDTYPE                    =          1
BIINTLEVEL                     =          2
BIDMACHAN                      =          3
BIINITIALIZED                  =          4
BICLOCK                        =          5
BIRANGE                        =          6
BINUMADCHANS                   =          7
BIUSESEXPS                     =          8
BIDINUMDEVS                    =          9
BIDIDEVNUM                     =         10
BICINUMDEVS                    =         11
BICIDEVNUM                     =         12
BINUMDACHANS                   =         13
BIWAITSTATE                    =         14
BINUMIOPORTS                   =         15
BIPARENTBOARD                  =         16
BIDTBOARD                      =         17
BINUMEXPS                      =         18
BINOITEM                       =         99
BIDACSAMPLEHOLD                =        100
BIDIOENABLE                    =        101
BI330OPMODE                    =        102
BI9513CHIPNSRC                 =        103
BICTR0SRC                      =        104
BICTR1SRC                      =        105
BICTR2SRC                      =        106
BIPACERCTR0SRC                 =        107
BIDAC0VREF                     =        108
BIDAC1VREF                     =        109
BIINTP2LEVEL                   =        110
BIWAITSTATEP2                  =        111
BIADPOLARITY                   =        112
BITRIGEDGE                     =        113
BIDACRANGE                     =        114
BIDACUPDATE                    =        115
BIDACINSTALLED                 =        116
BIADCFG                        =        117
BIADINPUTMODE                  =        118
BIDACPOLARITY                  =        119
BITEMPMODE                     =        120
BITEMPREJFREQ                  =        121
BIDISOFILTER                   =        122
BIINT32SRC                     =        123
BIINT32PRIORITY                =        124
BIMEMSIZE                      =        125
BIMEMCOUNT                     =        126
BIPRNPORT                      =        127
BIPRNDELAY                     =        128
BIPPIODIO                      =        129
BICTR3SRC                      =        130
BICTR4SRC                      =        131
BICTR5SRC                      =        132
BICTRINTSRC                    =        133
BICTRLINKING                   =        134
BISBX0BOARDNUM                 =        135
BISBX0ADDRESS                  =        136
BISBX0DMACHAN                  =        137
BISBX0INTLEVEL0                =        138
BISBX0INTLEVEL1                =        139
BISBX1BOARDNUM                 =        140
BISBX1ADDRESS                  =        141
BISBX1DMACHAN                  =        142
BISBX1INTLEVEL0                =        143
BISBX1INTLEVEL1                =        144
BISBXBUSWIDTH                  =        145
BICALFACTOR1                   =        146
BICALFACTOR2                   =        147
BIDACTRIG                      =        148
BICHANCFG                      =        149
BIPROTOCOL                     =        150
BICOMADDR2                     =        151
BICTSRTS1                      =        152
BICTSRTS2                      =        153
BICTRLLINES                    =        154
BIWAITSTATEP1                  =        155
BIINTP1LEVEL                   =        156
BICTR6SRC                      =        157
BICTR7SRC                      =        158
BICTR8SRC                      =        159
BICTR9SRC                      =        160
BICTR10SRC                     =        161
BICTR11SRC                     =        162
BICTR12SRC                     =        163
BICTR13SRC                     =        164
BICTR14SRC                     =        165
BITCGLOBALAVG                  =        166
BITCCJCSTATE                   =        167
BITCCHANRANGE                  =        168
BITCCHANTYPE                   =        169
BITCFWVERSION                  =        170
BIFWVERSION                    = BITCFWVERSION
BIPHACFG                       =        180
BIPHBCFG                       =        190
BIINDEXCFG                     =        200
BISLOTNUM                      =        201
BIAIWAVETYPE                   =        202
BIPWRUPSTATE                   =        203
BIIRQCONNECT                   =        204
BITRIGPOLARITY                 =        205
BICTLRNUM                      =        206
BIPWRJMPR                      =        207
BINUMTEMPCHANS                 =        208
BIADTRIGSRC                    =        209
BIBNCSRC                       =        210
BIBNCTHRESHOLD                 =        211
BIBURSTMODE                    =        212
BIDITHERON                     =        213
BISERIALNUM                    =        214
BIDACUPDATEMODE                =        215
BIDACUPDATECMD                 =        216
BIDACSTARTUP                   =        217
BIADTRIGCOUNT                  =        219
BIADFIFOSIZE                   =        220
BIADSOURCE                     =        221
BICALOUTPUT                    =        222
BISRCADPACER                   =        223
BIMFGSERIALNUM                 =        224
BIPCIREVID                     =        225
BIDIALARMMASK                  =        230
DIBASEADR                      =          0
DIINITIALIZED                  =          1
DIDEVTYPE                      =          2
DIMASK                         =          3
DIREADWRITE                    =          4
DICONFIG                       =          5
DINUMBITS                      =          6
DICURVAL                       =          7
DIINMASK                       =          8
DIOUTMASK                      =          9
CIBASEADR                      =          0
CIINITIALIZED                  =          1
CICTRTYPE                      =          2
CICTRNUM                       =          3
CICONFIGBYTE                   =          4
XIBOARDTYPE                    =          0
XIMUX_AD_CHAN1                 =          1
XIMUX_AD_CHAN2                 =          2
XIRANGE1                       =          3
XIRANGE2                       =          4
XICJCCHAN                      =          5
XITHERMTYPE                    =          6
XINUMEXPCHANS                  =          7
XIPARENTBOARD                  =          8
XISPARE0                       =          9
XI5VOLTSOURCE                  =        100
XICHANCONFIG                   =        101
XIVSOURCE                      =        102
XIVSELECT                      =        103
XICHGAIN                       =        104
XIGND                          =        105
XIVADCHAN                      =        106
XIRESISTANCE                   =        107
XIFACGAIN                      =        108
XICUSTOMGAIN                   =        109
XICHCUSTOM                     =        110
XIIEXE                         =        111
MIBASEADR                      =        100
MIINTLEVEL                     =        101
MIMEMSIZE                      =        102
MIMEMCOUNT                     =        103
ON_SCAN_ERROR                  =     0x0001
ON_EXTERNAL_INTERRUPT          =     0x0002
ON_PRETRIGGER                  =     0x0004
ON_DATA_AVAILABLE              =     0x0008
ON_END_OF_AI_SCAN              =     0x0010
ON_END_OF_AO_SCAN              =     0x0020
ON_CHANGE_DI                   =     0x0040
ALL_EVENT_TYPES                =     0xffff
NUM_EVENT_TYPES                =          6
MAX_NUM_EVENT_TYPES            =         32
SCAN_ERROR_IDX                 =          0
EXTERNAL_INTERRUPT_IDX         =          1
PRETRIGGER_IDX                 =          2
DATA_AVAILABLE_IDX             =          3
END_OF_AI_IDX                  =          4
END_OF_AO_IDX                  =          5

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
