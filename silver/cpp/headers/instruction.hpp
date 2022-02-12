#ifndef INSTRUCTION_HPP
#define INSTRUCTION_HPP

#include <vector>
#include <string>

enum InstructionEnum {
    halt = 0,
    add_byte = 1,
};

class InstructionNotFound : public std::exception {
    virtual const char* what() const throw();
};

class Instruction {
    std::vector<std::string> args;
    InstructionEnum operation;
public:
    Instruction(std::string name, std::vector<std::string> args);
    std::string render();
};

InstructionEnum from_string(std::string name) noexcept(false);

#endif
