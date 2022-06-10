#include <cstdio>
#include <memory>
#include <parser.hpp>

#include <iostream>
#include <vector>

void spc_out(int count) {
  for (int i = 0; i < count; i++) {
    std::cout << ' ';
  }
}

namespace parser {
std::string& Type::GetName() {
  return name;
}


Expr::Expr(Type type_) : type {type_} {}


NumberExpr::NumberExpr(double val_) : Expr {Type {"double"}}, val {val_} {}

void NumberExpr::PrettyPrint(int offset) {
  spc_out(offset);
  std::cout << "NumberExpr " << val << std::endl;
}


VariableExpr::VariableExpr(std::string name_) : Expr {Type {"unknown"}}, name {name_} {}

std::string& VariableExpr::GetName() {
  return name;
}

void VariableExpr::PrettyPrint(int offset) {
  spc_out(offset);
  std::cout << "VariableExpr " << name << std::endl;
}


VarDefExpr::VarDefExpr(std::unique_ptr<VariableExpr> variable_, Type type_) : Expr {type_}, variable {std::move(variable_)} {}

void VarDefExpr::PrettyPrint(int offset) {
  spc_out(offset);
  std::cout << "VarDefExpr " << variable->GetName() << " defining as " << type.GetName() << std::endl;
}


BinaryExpr::BinaryExpr(std::unique_ptr<VariableExpr> op_, std::unique_ptr<Expr> LHS_, std::unique_ptr<Expr> RHS_) : Expr {LHS->type}, op {std::move(op_)}, LHS {std::move(LHS_)}, RHS {std::move(RHS_)} {}

void BinaryExpr::PrettyPrint(int offset) {
  LHS->PrettyPrint(offset + 1);
  op->PrettyPrint(offset + 1);
  RHS->PrettyPrint(offset + 1);
}


CallExpr::CallExpr(std::unique_ptr<VariableExpr> callee_, std::vector<std::unique_ptr<Expr>> args_) : Expr {Type {"unknown"}}, callee {std::move(callee_)}, args {std::move(args_)} {}

void CallExpr::PrettyPrint(int offset) {
  spc_out(offset);
  std::cout << callee->GetName() << " (\n";
  for(auto& arg : args) {
    arg->PrettyPrint(offset + 1);
  }
  spc_out(offset);
  std::cout << ")" << std::endl;
}


PrototypeExpr::PrototypeExpr(std::string name_, std::vector<std::unique_ptr<VarDefExpr>> inputs_, Type return_type_) : Expr {return_type_}, name {std::move(name_)}, inputs {std::move(inputs_)} {} 

std::string& PrototypeExpr::GetName() {
  return name;
}

void PrototypeExpr::PrettyPrint(int offset) {
  std::cout << "man idk";
}


FunctionDefExpr::FunctionDefExpr(std::unique_ptr<PrototypeExpr> prototype_, std::unique_ptr<Expr> body_) : Expr {prototype_->type}, prototype {std::move(prototype_)}, body {std::move(body_)} {}

void FunctionDefExpr::PrettyPrint(int offset) {
  std::cout << "man idk";
}


Parser::Parser(lexer::LexStream stream_) : stream {stream_} {}

lexer::Token Parser::Next() {
  return stream.Next();
}

lexer::Token Parser::Peek() {
  return stream.Peek();
}


std::unique_ptr<Expr> LogError(const std::string message) {
  fprintf(stderr, "%s", message.c_str());
  return nullptr;
}

//----------------------
//       parsing mechanism
//----------------------


std::unique_ptr<Expr> ParseNumberExpr(Parser &parser) {
  auto result = std::make_unique<NumberExpr>(NumberExpr(parser.Next().GetNumber()));
  return std::move(result);
}

std::unique_ptr<Expr> ParseParenExpr(Parser& parser) {
  // eat (
  lexer::Token t = parser.Next();
  if (t.type != lexer::TokenType::Unrecognised || t.GetUnrec() != '(') {
    return LogError("Expected (, did not get it.");
  }

  // parse expr
  auto expr = ParsePrimary(parser);

  // eat )
  t = parser.Next();
  if (t.type != lexer::TokenType::Unrecognised || t.GetUnrec() != ')') {
    return LogError("Expected ), got " + lexer::TokenTypeName(t.type) + " instead");
  }

  return expr;
}

std::unique_ptr<Expr> ParseIdExpr(Parser& parser) {
  std::string idName = parser.Next().GetIdString();

  auto p = parser.Peek();

  // is it a call?
  if (p.type == lexer::TokenType::Unrecognised && p.GetUnrec() == '(') {
    // eat the (
    parser.Next();
    // our input list
    std::vector<std::unique_ptr<Expr>> inputs;

    p = parser.Peek();
    if (p.type != lexer::TokenType::Unrecognised || p.GetUnrec() != ')') {
      while (true) {
        if (auto input = ParsePrimary(parser)) {
          inputs.push_back(std::move(input));
        } else {
          return nullptr; // hit an error
        }

        p = parser.Peek();

        if (p.type == lexer::TokenType::Unrecognised && p.GetUnrec() == ')') {
          break;
        }

        if (p.type != lexer::TokenType::Unrecognised || p.GetUnrec() != ',') {
          return LogError("Expected , or ( in call input lists");
        }

        // eat what we peeked
        parser.Next();
      }
    }

    return std::make_unique<CallExpr>(CallExpr(std::make_unique<VariableExpr>(idName), std::move(inputs)));
  } else {
    // no its a var-ref
    LogError("varname ");
    LogError(idName);
    return std::make_unique<VariableExpr>(idName);
  }
}

std::unique_ptr<VarDefExpr> ParseVardef() {

}

std::unique_ptr<PrototypeExpr> ParseProto(Parser& parser) {
  auto p = parser.Peek();
  if (p.type == lexer::TokenType::Identifier) {
    PrototypeType type;
    auto kw = p.GetIdString();
    if (kw == "func") {
      type = PrototypeType::Normal;
    } else if (kw == "infix") {
      type = PrototypeType::Infix;
    } else if (kw == "prefix") {
      type = PrototypeType::Prefix;
    } else if (kw == "suffix") {
      type = PrototypeType::Suffix;
    } else {
      LogError("Unexpected " + kw + " when expected a function keyword");
      return nullptr;
    }

    auto fnName = parser.Next().GetIdString();

    p = parser.Peek();

    if (p.type != lexer::TokenType::Unrecognised || p.GetUnrec() != '(') {
      LogError("Unexpected not-( in function decl");
      return nullptr;
    }



  }
}

std::unique_ptr<Expr> ParsePrimary(Parser& parser) {
  switch (parser.Peek().type) {
    case lexer::TokenType::Identifier : return ParseIdExpr(parser);
    case lexer::TokenType::Number : return ParseNumberExpr(parser);
    case lexer::TokenType::Unrecognised : {
      switch (parser.Peek().GetUnrec()) {
        case '(' : return ParseParenExpr(parser);
        default : return LogError("Unknown unrecognised");
      }
    }
    default : return LogError("Bad thing to parse");
  }
}
}


int main(int argv, char** argc) {
  parser::Parser p = parser::Parser(lexer::LexStream(lexer::Input(argc[argv-1])));
  auto k = parser::ParsePrimary(p);
  k->PrettyPrint(0);
}
