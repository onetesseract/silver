#include <instruction.hpp>

using namespace std;

namespace parser {
const char* InstructionNotFound::what() const throw() {
    return "Instruction not found!";
}

InstructionEnum from_string(string name) noexcept(false) {
  return lookup[name];
}

Instruction::Instruction(string name, vector<string> args) : args { args }, operation { from_string(name) } {}
}
