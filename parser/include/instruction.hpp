#ifndef INSTRUCTION_HPP
#define INSTRUCTION_HPP

#include <vector>
#include <string>
#include <map>

namespace parser {
class InstructionNotFound : public std::exception {
    virtual const char* what() const throw();
};
enum InstructionEnum {
    halt = 0x00, // yeets the process lol
    call = 0x01, // return-index (can be anything if no return value), target-function-index, start of contiguois arguments
    jump = 0x02, // frame-index 
    if_ = 0x03,  // condition-variable-index, frame-if-true-index, frame-if-false-or-cont-frame-index
    u8_add = 0x10, // return-index, a-index, b-index
};

// just here because we can't do map constructors >:(
class InstructionLookup {
  std::map<std::string, InstructionEnum> instructionMap;
public:
  InstructionLookup() {
    using ::parser::InstructionEnum;
    instructionMap["halt"] = halt; // TODO: can this be macroified or bettered
    instructionMap["call"] = call;
    instructionMap["jump"] = jump;
    instructionMap["if"] = if_;

    instructionMap["u8_add"] = u8_add;
  }
  InstructionEnum operator[] (std::string name) const noexcept(false) {
    if (instructionMap.find(name) == instructionMap.end()) {
      throw InstructionNotFound();
    }
    return instructionMap.at(name);
  }
};

static const InstructionLookup lookup;

class Instruction {
    std::vector<std::string> args;
    InstructionEnum operation;
public:
    Instruction(std::string name, std::vector<std::string> args);
    std::string render();
};

InstructionEnum from_string(std::string name) noexcept(false);
}

#endif
