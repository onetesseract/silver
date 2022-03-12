#ifndef TYPE_HPP
#define TYPE_HPP

#include <string>

namespace parser {
class Type {
    std::string name;
    /// Size in bits
    size_t size;
public:
    Type(std::string name, size_t size);
    /// Generates the void type
    Type();
};
}
#endif // ifndef TYPE_HPP
