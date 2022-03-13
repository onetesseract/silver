#ifndef DECORATOR_HPP
#define DECORATOR_HPP

#include <string>
#include <vector>

namespace parser {
class Decorator {
    std::string type;
    std::vector<std::string> values;
public:
    Decorator(std::string type, std::vector<std::string> values);
};
}

#endif
