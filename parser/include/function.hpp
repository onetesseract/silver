#ifndef FUNCTION_HPP
#define FUNCTION_HPP

#include <string>
#include <vector>
#include <type.hpp>
#include <decorator.hpp>

namespace parser {
class Function {
    std::string name;
    // TODO: frames
    std::vector<Decorator> decorators;
    Type return_type;
public:
    Function(std::string name);
};
}

#endif // ifndef FUNCTION_HPP
