import flatbuffers
from silver import Frame, Instruction, Function
import Silver.Encoding.Variable
import Silver.Encoding.Frame
import Silver.Encoding.Function

builder = flatbuffers.Builder(1024)

def compile_instruction(variables:list, instruction:Instruction) -> bytearray:
	out = bytearray(8) # change this to change instruction length
	out[0] = instruction.operation.value
	out[1] = 0
	if instruction.operation.name in ["add_byte"]: # variables-only
		arg_index = 0
		for i in instruction.args:
			iter_index = 0
			broken = False
			for (name, _) in variables:
				if name == i:
					bytes_ = iter_index.to_bytes(2, "little")
					out[(arg_index * 2) + 2] = bytes_[0]
					out[(arg_index * 2) + 3] = bytes_[1]
					broken = True
					break
				iter_index += 1
			if not broken:
				# we are broken
				raise Exception(f"Could not find variable {i}")
	else:
		raise Exception(f"Unimplemented instruction {instruction.operation.name}")
	
	return out


def encode_variable(variable):
	_varname, byte_length = variable
	Silver.Encoding.Variable.Start(builder)
	Silver.Encoding.Variable.AddByteLength(builder, byte_length)
	var = Silver.Encoding.Variable.End(builder)
	return var



def compile_frame(_variables:list, frame:Frame, base_index:int):
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
		instructions += compile_instruction(variables, i)

	Silver.Encoding.Frame.StartVariablesVector(builder, len(compiled_variables))
	for i in compiled_variables[::-1]:
		builder.PrependUOffsetTRelative(i)
	variables_vec = builder.EndVector()
	Silver.Encoding.Frame.Start(builder)
	Silver.Encoding.Frame.AddVariables(builder, variables_vec)
	Silver.Encoding.Frame.AddInstructionsIndex(builder, base_index)
	frame = Silver.Encoding.Frame.End(builder)

	return frame, instructions

def compile_variable(variable, data_index=None, published_name=None):
	_name, byte_length = variable
	if not published_name is None:
		Silver.Encoding.Variable.StartPublishedNameVector(builder, len(published_name))
		for i in list(published_name)[::-1]:
			builder.PrependByte(i)
		published_vec = builder.EndVector()

	Silver.Encoding.Variable.Start(builder)
	Silver.Encoding.Variable.AddByteLength(builder, int(byte_length))
	if not data_index is None:
		Silver.Encoding.Variable.AddDataIndex(builder, data_index)
	if not published_name is None:
		Silver.Encoding.Variable.AddPublishedName(builder, published_vec)

	var = Silver.Encoding.Variable.End(builder)
	return var



def compile_function(function:Function, base_index:int):
	variables = []
	args = []
	has_return = False
	for i in function.decorators:
		if i.typ == "entry_frame":
			raise Exception("Entry frame decorator is redundant") # use first frame
		elif i.typ == "return":
			has_return = True
			if len(variables) != 0:
				raise Exception("Return must be before any arguments")
			variables.append((i.return_name, i.return_bytewidth))
			return_bytewidth = i.return_bytewidth
		elif i.typ == "arg":
			if len(variables) != int(i.arg_index) - (1 if not has_return else 0):
				raise Exception(f"Bad argument indexing - should be {len(variables)} (possible -1), but is {i.arg_index} - {has_return} return")
			args.append((i.arg_name, i.arg_bytewidth))
			variables.append((i.arg_name, i.arg_bytewidth))
		else:
			raise Exception(f"Unknown or invalid-on-function decorator {i.typ}")

	frames = []
	instructions = bytearray()
	for i in function.frames:
		frame, instructions_compiled = compile_frame(variables, i, len(instructions) + base_index)
		instructions += instructions_compiled
		frames.append(frame)

	Silver.Encoding.Function.StartFramesVector(builder, len(frames))
	for i in frames[::-1]:
		builder.PrependUOffsetTRelative(i)
	frames_vec = builder.EndVector()

	args_comp = []
	for i in args:
		args_comp.append(compile_variable(i))

	Silver.Encoding.Function.StartArgsVector(builder, len(args))
	for i in args_comp[::-1]:
		builder.PrependUOffsetTRelative(i)
	args_vec = builder.EndVector()

	Silver.Encoding.Function.Start(builder)
	Silver.Encoding.Function.AddArgs(builder, args_vec)
	Silver.Encoding.Function.AddFrames(builder, frames_vec)

	if has_return:
		Silver.Encoding.Function.AddReturnByteWidth(builder, int(return_bytewidth))
	
	fn = Silver.Encoding.Function.End(builder)

	# TODO: implement published name

	return (fn, instructions)











def compile():
	pass

