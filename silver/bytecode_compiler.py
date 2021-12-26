import flatbuffers
from silver import Frame, Instruction, Function
import Silver.Encoding.Variable
import Silver.Encoding.Frame as EncFrame
import Silver.Encoding.Function as EncFunc

builder = flatbuffers.Builder(1024)

def compile_instruction(variables:list, instruction:Instruction) -> bytearray:
    out = bytearray(8) # change this to change instruction length
    out[0] = instruction.operation.value
    out[1] = 0
    if instruction.operation.name in ["add_byte"]: # variables-only
        for i in instruction.args:
            pass # got to here


def encode_variable(variable):
    _varname, byte_length = variable
    Silver.Encoding.Variable.Start(builder)
    Silver.Encoding.Variable.AddByteLength(builder, byte_length)
    var = Silver.Encoding.Variable.End(builder)
    return var

    

def compile_frame(_variables:list, frame:Frame) -> (EncFrame, bytearray):
    variables = _variables
    compiled_variables = []
    instructions = bytearray()
    for i in frame.decorators:
        if i.typ == "variable":
            variables.append((i.var_name, i.var_bytewidth))
        else:
            raise Exception(f"Unknown or invalid-on-frame decorator {i.typ}")
    for i in variables[len(_variables):]:
        compiled_variables.append(encode_variable(i))

    for i in frame.instructions:
        pass

def compile_function(function:Function) -> (EncFunc, bytearray):
    variables = []
    has_return = False
    for i in function.decorators:
        if i.typ == "entry_frame":
            raise Exception("Entry frame decorator is redundant") # use first frame
        elif i.typ == "return":
            has_return = True
            if len(variables) != 0:
                raise Exception("Return must be before any arguments")
            variables.append((i.return_name, i.return_bytewidth))
        elif i.type == "arg":
            if len(variables) != i.arg_index + (1 if has_return else 0):
                raise Exception(f"Bad argument indexing - should be {len(variables)} (possible -1), but is {i.arg_index} - {has_return} return")
            variables.append((i.arg_name, i.arg_bytewidth))
        else:
            raise Exception(f"Unknown or invalid-on-function decorator {i.typ}")
    
    


def compile():
    pass

