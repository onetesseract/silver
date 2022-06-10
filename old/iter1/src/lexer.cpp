#include <cctype>
#include <cstdlib>
#include <lexer.hpp>

namespace lexer {
const std::string TokenTypeName(const TokenType token) noexcept {
  switch (token) {
    case TokenType::Eof : return "EOF";
    case TokenType::Identifier : return "Identifier";
    case TokenType::Number : return "Number";
    case TokenType::Unrecognised : return "Unrecognised";
    default : return "Invalid";
  }
}


BadTokenUse::BadTokenUse(std::string message_) : message {message_} {}

const char* BadTokenUse::what() const noexcept {
  return message.c_str();
}


double Token::GetNumber() {
  if (type != TokenType::Number) {
    throw BadTokenUse("Tried to get a Number out of a " + TokenTypeName(type));
  }
  return number;
}

std::string& Token::GetIdString() {
  if (type != TokenType::Identifier) {
    throw BadTokenUse("Tried to get a Identifier out of a " + TokenTypeName(type));
  }
  return idString;
}

int Token::GetUnrec() {
  if (type != TokenType::Unrecognised) {
    throw BadTokenUse("Tried to get a Unrecognised out of a " + TokenTypeName(type));
  }
  return unrec; 
}


Input::Input(std::string inputString_) : inputString {inputString_} {}

int Input::Next() {
  if (index >= inputString.size()) {
    return -1;
  }
  int c = inputString[index];
  index++;
  return c;
}

void Input::Back() {
  index--;
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
    Back();
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
    Back();
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


LexStream::LexStream(Input input_) : input {input_} {}

Token LexStream::Next() {
  if (peeked.has_value()) {
    Token t = peeked.value();
    peeked.reset();
    return t;
  }
  return input.GetToken();
}

Token LexStream::Peek() {
  if (peeked.has_value()) {
    return peeked.value();
  }
  peeked = Next();
  return peeked.value();
}
}
