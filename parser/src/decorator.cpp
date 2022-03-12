#include <decorator.hpp>

using namespace std;

namespace parser {
Decorator::Decorator(string type, vector<string> values) : type {type}, values {values} {}
}
