#include "parser.hpp"
#include "model.hpp"
#include <cstdint>
#include <cstdlib>
#include <exception>
#include <iostream>
#include <fstream>
#include <iterator>
#include <string>
#include <stdexcept>
#include <string.h>
#include <algorithm>

using namespace std;

// https://stackoverflow.com/questions/216823/how-to-trim-a-stdstring#217605
static inline void ltrim(string& s) {
  s.erase(s.begin(), std::find_if(s.begin(), s.end(), [](unsigned char ch) {
        return !std::isspace(ch);
  }));
}
static inline void rtrim(std::string &s) {
    s.erase(std::find_if(s.rbegin(), s.rend(), [](int ch) {
        return !std::isspace(ch);
    }).base(), s.end());
}

// https://stackoverflow.com/questions/5888022/split-string-by-single-spaces
static size_t split(const std::string &txt, std::vector<std::string> &strs, char ch) {
    size_t pos = txt.find( ch );
    size_t initialPos = 0;
    strs.clear();

    // Decompose statement
    while( pos != std::string::npos ) {
        strs.push_back( txt.substr( initialPos, pos - initialPos ) );
        initialPos = pos + 1;

        pos = txt.find( ch, initialPos );
    }

    // Add the last one
    strs.push_back( txt.substr( initialPos, std::min( pos, txt.size() ) - initialPos + 1 ) );

    return strs.size();
}



class InternalError : public exception {
  string error;
public:
  InternalError(string error) : error { error } {};
  virtual const char * what() const throw() {
    return error.c_str();
  }
};

static vector<uint8_t> parse_data(string data) {
  // TODO: fancier
  vector<uint8_t> ret;
  int data_int = atoi(data.c_str());
  for (size_t i = 0; i < sizeof(int); i++) {
    ret[sizeof(int) - 2] = data_int >> (i * 8);
  }
  return ret;
}

namespace parser {
  NotWithinA::NotWithinA(string requires_within, string trying_to_define) : err { ("Trying to define " + trying_to_define +" which is " + requires_within + "-dependent") } {}
  const char* NotWithinA::what() const throw() {
    return err.c_str();
  }

  Parser::Parser(ifstream& file) : file { file } {}
  void Parser::handle_at(vector<string> tokens) {
    if (tokens[0] == "@const") {
      // @const <index> <bitwidth> <data>
      int index = atoi(tokens[1].c_str());
      vector<uint8_t> data = parse_data(tokens[3]);
      size_t bitwidth = atoi(tokens[2].c_str());
      model::Const constant {bitwidth, data, index};
      context.add_constant(constant);
    } 
    else if (tokens[0] == "@extern") {
      // @extern <index> <bitwidth> <name>
      int index = atoi(tokens[1].c_str());
      size_t bitwidth = atoi(tokens[2].c_str());
      model::Extern external = { bitwidth, tokens[3], index };
      context.add_extern(external);
    }
    else if (tokens[0] == "@arg") {
      // @arg <index> <bitwidth>
      int index = atoi(tokens[1].c_str());
      size_t bitwidth = atoi(tokens[2].c_str());
      model::Variable arg { bitwidth, index };
      if (!function.has_value()) {
        throw NotWithinA("a function", "argument");
      }
      function.value()->add_variable(arg);
    }
    else if (tokens[0] == "@return") {
      // @return <index> <bitwidth>
      int index = atoi(tokens[1].c_str());
      size_t bitwidth = atoi(tokens[2].c_str());
      model::Variable ret { bitwidth, index };
      if (!function.has_value()) {
        throw NotWithinA("a function", "argument");
      }
      function.value()->add_variable(ret);
      function.value()->return_variable = &function.value()->variables.back();
    }
    else if (tokens[0] == "@var") {
      // @arg <index> <bitwidth>
      int index = atoi(tokens[1].c_str());
      size_t bitwidth = atoi(tokens[2].c_str());
      model::Variable var { bitwidth, index };
      if (!frame.has_value()) {
        throw NotWithinA("a frame", "argument");
      }
      frame.value()->add_variable(var);
    }
    else {
      throw InternalError("Unimplemented " + tokens[0]);
    }
  }
  void Parser::handle_line(string line) {
    ltrim(line);
    rtrim(line);
    vector<string> raw_tokens;
    split(line, raw_tokens, ' ');
    vector<string> tokens;
    copy_if(raw_tokens.begin(), raw_tokens.end(), back_inserter(tokens), [](string s) {
      ltrim(s);
      rtrim(s);
      return s != "";
    });
    if (tokens.size() == 0) { // } || tokens[0] == "") {
      // empty line
      return;
    }
    switch (tokens[0][0]) {
      case '#' : {
        // We hit a comment!
        return;
      };
      case '~' : {
        // hit a frame or function def
        if (tokens[0] == "~function"){
          if (tokens.size() == 1) {
            throw InternalError("No index on function");
          }
          int index = atoi(tokens.back().c_str());
          context.add_function(model::Function(index));
          function = &context.functions.back();
        } else if (tokens[0] == "~frame") {
          if (tokens.size() == 1) {
            throw InternalError("No index on frame");
          }
          int index = atoi(tokens.back().c_str());
          context.add_frame(model::Frame(index));
          frame = &context.frames.back();
        }
        break;
      }
      case '@' : {
        handle_at(tokens);
        break;
      }
      default : {
        throw InternalError("I do not know how to parse '" + line + "'");
      }
    }
  }

  model::Context Parser::parse() {
    while (file) {
      string line;
      getline(file, line);
      handle_line(line);
    }
    throw exception();
  }
  
}
