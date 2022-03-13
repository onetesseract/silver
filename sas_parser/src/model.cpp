#include "model.hpp"
#include "instruction.hpp"
#include <cstddef>
#include <cstdint>
#include <string>
#include <vector>


using namespace std;

namespace parser {

namespace model {
  Variable::Variable(size_t bitwidth, int index) :  index { index }, bitwidth { bitwidth } {}

  Frame::Frame(int index) : index { index } {}
  Frame::Frame(vector<Variable> variables, vector<Instruction> instructions, int index) : index { index }, variables { variables }, instructions { instructions } {}
  void Frame::add_variable(Variable variable) {
    variables.push_back(variable);
  }
  void Frame::add_instruction(Instruction instruction) {
    instructions.push_back(instruction);
  }

  Function::Function(int index) : index { index } {}
  void Function::add_variable(Variable variable) {
    variables.push_back(variable);
  }

  Extern::Extern(size_t bitwidth, string name, int index) : variable { bitwidth, index }, name { name } {}

  Const::Const(size_t bitwidth, vector<uint8_t> data, int index) : variable { bitwidth, index }, data { data } {}

  Context::Context() {}
  void Context::add_function(Function function) {
    functions.push_back(function);
  }
  void Context::add_frame(Frame frame) {
    frames.push_back(frame);
  }
  void Context::add_extern(Extern external) {
    externals.push_back(external);
  }
  void Context::add_constant(Const constant) {
    constants.push_back(constant);
  }
}
}
