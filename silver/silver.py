import sys
import enum

class Instruction:
	"""
	One logical operation upon arguments.
	"""
	def __init__(self, name:str, args:list[str]):
		self.args = args
		self.operation = None
		for i in InstructionEnum:
			if i.name == name:
				self.operation = i
				break
		if self.operation is None:
			raise Exception(f"No such instruction {name}")
	
	def render(self) -> str:
		string = self.operation.name
		for i in self.args:
			string += (" " + i)
		return string


class InstructionEnum(enum.Enum):
	add_8 = 0

class Decorator:
	"""
	A decorator attaches additional meaning to a `Function` or `Frame`.
	"""
	def __init__(self, typ:str, vals:list[str]):
		self.typ = typ
		self.vals = vals
		if typ == "entry_frame":
			self.entry_frame = vals[0]
		if self.typ == "arg":
			self.arg_index = vals[0]
			self.arg_name = vals[1]
			self.arg_bitwidth = vals[2]
		if self.typ == "return":
			self.return_name = vals[0]
			self.return_bitwidth = vals[1]
	
	def render(self) -> str:
		string = self.typ
		for i in self.vals:
			string += (" " + i)
		return string

class Function:
	def __init__(self, name):
		self.name = name
		self.frames = []
		self.decorators = []

	def set_rtype(self, rtype):
		self.rtype = rtype

	def add_frame(self, frame):
		self.frames.append(frame)

	def decorate(self, decorator:Decorator):
		if len(self.frames) != 0:
			self.frames[-1].decorate(decorator)
		else:
			self.decorators.append(decorator)
	
	def render(self) -> str:
		string = f"Function {self.name} - {len(self.frames)} frames, {len(self.decorators)} decorators:\nDecorators:"
		for i in self.decorators:
			string += "\n	" + i.render()
		string += "\nFrames:"
		for i in self.frames:
			string += "\n	" + i.render()
		return string


class Frame:
	def __init__(self, name:str):
		self.name = name
		self.instructions = []
		self.decorators = []

	def decorate(self, decorator:Decorator):
		self.decorators.append(decorator)
	
	def add_instruction(self, instruction:Instruction):
		self.instructions.append(instruction)
	
	def render(self) -> str:
		string = f"Frame {self.name} - {len(self.instructions)} instructions, {len(self.decorators)} decorators:\nDecorators:"
		for i in self.decorators:
			string += "\n	" + i.render()
		string += "Instructions:"
		for i in self.instructions:
			string += "\n	" + i.render()
		return string


def read_until_comment(string:str) -> str:
	"""
	Reads a string until the first '#', then returns what it read up to. Returns all the string before '#'
	"""
	out = ""
	for i in string:
		if i == "#": break
		out += i
	return out

def main():
	function = None

	file_name = sys.argv[-1]
	print(file_name)
	file = open(file_name, "r")
	cont = file.read()

	for _line in cont.splitlines():
		line = read_until_comment(_line).strip()
		if line.strip() == "": continue
		print(line, line[0])

		line = read_until_comment(_line).strip()
		print(line)
		if line[0] == "~":

			# function or frame start
			if line[1:].startswith("function"):
				function = Function(line.split(" ")[-1])

			if line[1:].startswith("frame"):
				frame = Frame(line.split(" ")[-1])
				function.add_frame(frame)

		elif line[0] == "@":

			# decorator upon a thing
			decorations = line[1:].split(" ")
			decorator = Decorator(decorations[0], decorations[1:])
			function.decorate(decorator)
		
		else:
			
			# instruction
			args = line.split(" ")
			inst = Instruction(args[0], args[1:])
			function.frames[-1].add_instruction(inst)

	print(function.render())








if __name__ == "__main__":
	main()