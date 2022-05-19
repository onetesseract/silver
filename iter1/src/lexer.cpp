#include <cctype>
#include <cstdlib>
#include <lexer.hpp>

namespace lexer {
Input::Input(std::string inputString_) : inputString {inputString_} {}

int Input::Next() {
  if (index >= inputString.size()) {
    return -1;
  }
  int c = inputString[index];
  index++;
  return c;
}

Token Input::GetToken() {
  int last_char = ' ';

  while (std::isspace(last_char)) {
    last_char = Next();
  }

  if (std::isalpha(last_char)) {
    std::string id_string;
    while (std::isalpha(last_char)) {
      id_string += last_char;
      last_char = Next();
    }
    return Token {
      .idString = id_string,
      .type = TokenType::Identifier,
    };
  }

  if (isdigit(last_char) || last_char == '.') {
    std::string num_string;
    while (isdigit(last_char) || last_char == '.') {
      num_string += last_char;
      last_char = Next();
    }
    return Token {
      .number = strtod(num_string.c_str(), 0),
      .type = TokenType::Number,
    };
  }

  if (last_char == EOF) {
    return Token {
      .type = TokenType::Eof,
    };
  }

  return Token {
    .unrec = last_char,
    .type = TokenType::Unrecognised,
  };
}
}
