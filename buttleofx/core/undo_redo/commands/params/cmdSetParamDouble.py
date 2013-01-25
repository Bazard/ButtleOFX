from buttleofx.core.undo_redo.manageTools import UndoableCommand


class CmdSetParamDouble(UndoableCommand):
    """
        Command that update the value of a paramDouble.
        Attributes :
        - param : the target param wich will be changed by the update
        - newValue : the value wich will be mofidy in the target
        - oldValue : the old value of the target param, wich will be used for reset the target in case of undo command
    """

    def __init__(self, param, newValue):
        self._param = param
        self._oldValue = param.getValue()
        self._newValue = newValue

    def undoCmd(self):
        """
            Undoes the movement of the node.
            The target node is reset with the old coordinates.
        """
        self._param.getTuttleParam().setValue(float(self._oldValue))
        self._param.changed()

        print "TuttleParam new Value : ", self._param.getValue()

    def redoCmd(self):
        """
            Redoes the movement of the node.
        """
        return self.doCmd()

    def doCmd(self):
        """
            Executes the movement of the node.
        """
        self._param.getTuttleParam().setValue(float(self._newValue))
        self._param.changed()

        print "TuttleParam new Value : ", self._param.getValue()
