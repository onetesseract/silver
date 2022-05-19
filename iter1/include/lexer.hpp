#include <string>

namespace lexer {

/**
 * @brief The enum representing a lexical token. Positive values are character values.
 */
enum TokenType {
  Eof = -1,
  Identifier = -2,
  Number = -3,
  Unrecognised = -4,
};

struct Token {
  std::string idString; // filled if identifier
  double number; // if number
  int unrec; // if unrecognised

  TokenType type;
};

class Input {
  std::string inputString;
  int index = 0;

  Input(std::string inputString);

  int Next();

  Token GetToken();
};

} // namespace lexer
