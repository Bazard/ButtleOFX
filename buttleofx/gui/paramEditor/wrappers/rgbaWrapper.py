from .paramWrapper import ParamWrapper

from PyQt5 import QtCore

class RGBAWrapper(ParamWrapper):
    """
        Gui class, which maps a ParamRGBA.
    """

    def __init__(self, param):
        ParamWrapper.__init__(self, param)

    #################### getters ####################

    def getDefaultR(self):
        return self._param.getDefaultR()

    def getDefaultG(self):
        return self._param.getDefaultG()

    def getDefaultB(self):
        return self._param.getDefaultB()

    def getDefaultA(self):
        return self._param.getDefaultA()

    def getValueR(self):
        return self._param.getValueR()

    def getValueG(self):
        return self._param.getValueG()

    def getValueB(self):
        return self._param.getValueB()

    def getValueA(self):
        return self._param.getValueA()

    #################### setters ####################

    def setValueR(self, value):
        self._param.setValueR(value)

    def setValueG(self, value):
        self._param.setValueG(value)

    def setValueB(self, value):
        self._param.setValueB(value)

    def setValueA(self, value):
        self._param.setValueA(value)

    #@QtCore.pyqtSlot(float, float, float, float)
    #def setValue(self, r, g, b, a):
    #    self._param.setValue(r, g, b, a)

    changed = QtCore.pyqtSignal()

    ################################################## DATA EXPOSED TO QML ##################################################

    r = QtCore.pyqtProperty(float, getValueR, setValueR, notify=changed)
    g = QtCore.pyqtProperty(float, getValueG, setValueG, notify=changed)
    b = QtCore.pyqtProperty(float, getValueB, setValueB, notify=changed)
    a = QtCore.pyqtProperty(float, getValueA, setValueA, notify=changed)
