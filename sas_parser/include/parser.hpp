#include "model.hpp"
#include <exception>
#include <fstream>
#include <string>
#include <optional>
#include <vector>

namespace parser {
class NotWithinA : public std::exception {
  std::string err;
public:
  NotWithinA(std::string requires_within, std::string trying_to_define);
  virtual const char* what() const throw();
};
class Parser {
  std::ifstream& file;
  size_t index;
  model::Context context;
  std::optional<model::Function*> function;
  std::optional<model::Frame*> frame;
  void handle_line(std::string line);
  void handle_at(std::vector<std::string> tokens);
public:
  Parser(std::ifstream& file);
  model::Context parse();
};
}
