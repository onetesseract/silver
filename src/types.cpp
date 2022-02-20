#include <type.hpp>

using namespace std;

Type::Type(string name, size_t size) : name {name}, size {size} {}
Type::Type() : name {"void"}, size {0} {}