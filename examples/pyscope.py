#!/usr/bin/env python
"""
Copyright (C) Jeremy O'Donoghue, 2003
Copyright (C) California Institute of Technology, 2005-2006
 
License: This work is licensed under the PSF. A copy is available at
http://www.python.org/psf/license.html

Authors: Jeremy O'Donoghue, Andrew Straw, and others

"""
import matplotlib
matplotlib.use('WX')
from matplotlib.backends.backend_wx import FigureCanvasWx,\
     FigureManager, NavigationToolbar2Wx

from matplotlib.figure import Figure
from matplotlib.axes import Subplot
from wxPython.wx import *
import threading

import UniversalLibrary as UL
import numpy

EVT_TRIG_ID = wxNewId()
def EVT_TRIG(win, func):
    win.Connect(-1, -1, EVT_TRIG_ID, func)
class TrigEvent(wxPyEvent):
    def __init__(self,totalcount,data):
        wxPyEvent.__init__(self)
        self.SetEventType(EVT_TRIG_ID)
        self.totalcount = totalcount
        self.data = data

def daq_thread_func(wxapp):
    TotalCount = 3000
    ADData = numpy.zeros((TotalCount+512,), dtype=numpy.int16)
    
    BoardNum = 0
    UDStat = 0
    Gain = UL.BIP5VOLTS

    LowChan = 0
    HighChan = 1

    Rate = 20000

    PretrigCount = 500
    
    Options = UL.CONVERTDATA
    while 1:
        PretrigCount, TotalCount, Rate = UL.cbAPretrig (BoardNum,
                                                        LowChan,
                                                        HighChan,
                                                        PretrigCount,
                                                        TotalCount,
                                                        Rate, Gain,
                                                        ADData, Options)
        datacopy = ADData[:]
        wxapp.AddPendingEvent(TrigEvent(TotalCount,datacopy))

class App(wxApp):
    def OnInit(self,*args,**kw):
        wxInitAllImageHandlers()
        self.frame = wxFrame( None, -1, "PyScope")

        self.frame.fig = Figure((5,4), 75)
        self.frame.canvas = FigureCanvasWx(self.frame, -1, self.frame.fig)
        self.frame.toolbar = NavigationToolbar2Wx(self.frame.canvas)
        self.frame.toolbar.Realize()

        # On Windows, default frame size behaviour is incorrect
        # you don't need this under Linux
        tw, th = self.frame.toolbar.GetSizeTuple()
        fw, fh = self.frame.canvas.GetSizeTuple()
        self.frame.toolbar.SetSize(wxSize(fw, th))

        # Create a figure manager to manage things
        self.frame.figmgr = FigureManager(self.frame.canvas, 1, self)
        # Now put all into a sizer
        sizer = wxBoxSizer(wxVERTICAL)
        # This way of adding to sizer allows resizing
        sizer.Add(self.frame.canvas, 1, wxLEFT|wxTOP|wxGROW)
        # Best to allow the toolbar to resize!
        sizer.Add(self.frame.toolbar, 0, wxGROW)
        self.frame.SetSizer(sizer)
        self.frame.Fit()
        EVT_TRIG(self, self.OnTrig)

        # finalize wx stuff
        self.frame.SetAutoLayout(true)
        self.frame.Show()
        self.SetTopWindow(self.frame)
        return True
        
    def GetToolBar(self):
        # You will need to override GetToolBar if you are using an 
        # unmanaged toolbar in your frame
        return self.frame.toolbar
		
    def OnTrig(self, evt):
        assert evt.GetEventType() == EVT_TRIG_ID
        
        ch0 = evt.data[0:evt.totalcount:2]
        ch1 = evt.data[1:evt.totalcount:2]
        
        if hasattr(self.frame,'ind'):
            # we have already been run once and have an old copy of data
            self.frame.lines[0].set_data( self.frame.ind, ch0 )
            self.frame.lines[1].set_data( self.frame.ind, ch1 )
        else:
            a = self.frame.fig.add_subplot(111)
            self.frame.ind = numpy.arange( len(ch0) )*0.1
            self.frame.lines = a.plot(self.frame.ind, ch0, 'b-',
                                      self.frame.ind, ch1, 'g-' )
        self.frame.canvas.draw()
        self.frame.canvas.gui_repaint()
        
if __name__ == '__main__':
    app = App(redirect=False)

    daq_thread = threading.Thread(target=daq_thread_func,args=(app,))
    daq_thread.setDaemon(True)
    daq_thread.start()
    
    app.MainLoop()
