#ifndef MODEL_HPP
#define MODEL_HPP

#include "instruction.hpp"
#include <cstddef>
#include <cstdint>
#include <optional>
#include <string>
#include <vector>

namespace model {
class Variable {
  size_t bitwidth;
public:
  int index;
  Variable(size_t bitwidth, int index);
};


class Frame {
  std::vector<Variable> variables;
  std::vector<Instruction> instructions;
public:
  int index;
  Frame(int index);
  Frame(std::vector<Variable> variables, std::vector<Instruction> instructions, int index);
  void add_variable(Variable variable);
  void add_instruction(Instruction instruction);
};

class Function {
public:
  int index;
  std::vector<Variable> variables; // Includes arguments and @return
  std::optional<size_t> entry_frame_index;
  std::optional<Variable*> return_variable;
  Function(int index);
  void add_variable(Variable variable);
  void add_frame(Frame frame);
};

class Extern {
  Variable variable;
  std::string name;
public:
  Extern(size_t bitwidth, std::string name, int index);
};

class Const {
  Variable variable;
  std::vector<uint8_t> data;
public:
  Const(size_t bitwidth, std::vector<uint8_t> data, int index);
};

class Context {
public:
  std::vector<Function> functions;
  std::vector<Frame> frames;
  std::vector<Extern> externals;
  std::vector<Const> constants;
  Context();
  void add_function(Function function);
  void add_frame(Frame frame);
  void add_extern(Extern external);
  void add_constant(Const constant);
};
}

#endif
