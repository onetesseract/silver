#include <instruction.hpp>

using namespace std;

const char* InstructionNotFound::what() const throw() {
    return "Instruction not found!";
}

InstructionEnum from_string(string name) noexcept(false) {
    if (name == "halt") {
        return InstructionEnum::halt;
    } else if (name == "add_byte") {
        return InstructionEnum::add_byte;
    } else {
        throw new InstructionNotFound();
    }
}

Instruction::Instruction(string name, vector<string> args) : args { args }, operation { from_string(name) } {}
