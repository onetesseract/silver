# automatically generated by the FlatBuffers compiler, do not modify

# namespace: Encoding

import flatbuffers
from flatbuffers.compat import import_numpy
np = import_numpy()

class Frame(object):
    __slots__ = ['_tab']

    @classmethod
    def GetRootAs(cls, buf, offset=0):
        n = flatbuffers.encode.Get(flatbuffers.packer.uoffset, buf, offset)
        x = Frame()
        x.Init(buf, n + offset)
        return x

    @classmethod
    def GetRootAsFrame(cls, buf, offset=0):
        """This method is deprecated. Please switch to GetRootAs."""
        return cls.GetRootAs(buf, offset)
    # Frame
    def Init(self, buf, pos):
        self._tab = flatbuffers.table.Table(buf, pos)

    # Frame
    def Variables(self, j):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            x = self._tab.Vector(o)
            x += flatbuffers.number_types.UOffsetTFlags.py_type(j) * 4
            x = self._tab.Indirect(x)
            from Silver.Encoding.Variable import Variable
            obj = Variable()
            obj.Init(self._tab.Bytes, x)
            return obj
        return None

    # Frame
    def VariablesLength(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        if o != 0:
            return self._tab.VectorLen(o)
        return 0

    # Frame
    def VariablesIsNone(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(4))
        return o == 0

    # Frame
    def InstructionsIndex(self):
        o = flatbuffers.number_types.UOffsetTFlags.py_type(self._tab.Offset(6))
        if o != 0:
            return self._tab.Get(flatbuffers.number_types.Uint32Flags, o + self._tab.Pos)
        return 0

def Start(builder): builder.StartObject(2)
def FrameStart(builder):
    """This method is deprecated. Please switch to Start."""
    return Start(builder)
def AddVariables(builder, variables): builder.PrependUOffsetTRelativeSlot(0, flatbuffers.number_types.UOffsetTFlags.py_type(variables), 0)
def FrameAddVariables(builder, variables):
    """This method is deprecated. Please switch to AddVariables."""
    return AddVariables(builder, variables)
def StartVariablesVector(builder, numElems): return builder.StartVector(4, numElems, 4)
def FrameStartVariablesVector(builder, numElems):
    """This method is deprecated. Please switch to Start."""
    return StartVariablesVector(builder, numElems)
def AddInstructionsIndex(builder, instructionsIndex): builder.PrependUint32Slot(1, instructionsIndex, 0)
def FrameAddInstructionsIndex(builder, instructionsIndex):
    """This method is deprecated. Please switch to AddInstructionsIndex."""
    return AddInstructionsIndex(builder, instructionsIndex)
def End(builder): return builder.EndObject()
def FrameEnd(builder):
    """This method is deprecated. Please switch to End."""
    return End(builder)