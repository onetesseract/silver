#include <string>
#include <optional>

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
const std::string TokenTypeName(const TokenType) noexcept;


class BadTokenUse : public std::exception {
  std::string message;
public:
  BadTokenUse(std::string message);
  const char* what() const noexcept override;
};

struct Token {
  std::string idString; // filled if identifier
  double number; // if number
  int unrec; // if Unrecognised

public:
  double GetNumber();
  std::string& GetIdString();
  int GetUnrec();

  TokenType type;
};

class Input {
  std::string inputString;
  int index = 0;

public:
  Input(std::string inputString);

  int Next();
  void Back();

  Token GetToken();
};

class LexStream {
  std::optional<Token> peeked;

  Input input;

public:
  LexStream(Input input);

  Token Next();
  Token Peek();
};

} // namespace lexer
