#include <memory>
#include <parser.hpp>

#include <iostream>

namespace parser {
std::string& Type::GetName() {
  return name;
}


Expr::Expr(Type type_) : type {type_} {}


NumberExpr::NumberExpr(double val_) : Expr {Type {"double"}}, val {val_} {}

void NumberExpr::PrettyPrint(int offset) {
  std::cout << (' ' * offset) << val << std::endl;
}


VariableExpr::VariableExpr(std::string name_) : Expr {Type {"unknown"}}, name {name_} {}

std::string& VariableExpr::GetName() {
  return name;
}

void VariableExpr::PrettyPrint(int offset) {
  std::cout << (' ' * offset) << name << std::endl;
}


VarDefExpr::VarDefExpr(std::unique_ptr<VariableExpr> variable_, Type type_) : Expr {type_}, variable {std::move(variable_)} {}

void VarDefExpr::PrettyPrint(int offset) {
  std::cout << (' ' * offset) << variable->GetName() << " defining as " << type.GetName() << std::endl;
}


BinaryExpr::BinaryExpr(std::unique_ptr<VariableExpr> op_, std::unique_ptr<Expr> LHS_, std::unique_ptr<Expr> RHS_) : Expr {LHS->type}, op {std::move(op_)}, LHS {std::move(LHS_)}, RHS {std::move(RHS_)} {}

void BinaryExpr::PrettyPrint(int offset) {
  LHS->PrettyPrint(offset + 1);
  op->PrettyPrint(offset + 1);
  RHS->PrettyPrint(offset + 1);
}


CallExpr::CallExpr(std::unique_ptr<VariableExpr> callee_, std::vector<std::unique_ptr<Expr>> args_) : Expr {Type {"unknown"}}, callee {std::move(callee_)}, args {std::move(args_)} {}

void CallExpr::PrettyPrint(int offset) {
  std::cout << (' ' * offset) << callee->GetName() << " (\n";
  for(auto& arg : args) {
    arg->PrettyPrint(offset + 1);
  }
  std::cout << (' ' * offset) << ")" << std::endl;
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

}
int main() {
  // auto cexpr = parser::CallExpr(
  //   std::unique_ptr<parser::VariableExpr>(parser::VariableExpr("callee")),
  //   std::vector<std::unique_ptr<parser::Expr>>(std::unique_ptr<Expr>(
  //     parser::BinaryExpr(
  //       std::unique_ptr<parser::VariableExpr>(parser::VariableExpr("oper")),
  //       std::unique_ptr<parser::Expr>(dynamic_cast<parser::Expr*>(&parser::NumberExpr(2))),
  //       std::unique_ptr<parser::Expr>((Expr) parser::NumberExpr(8.7462))
  //       )
  //     )
  //   )
  // );
}
