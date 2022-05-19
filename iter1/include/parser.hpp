#include <string>
#include <memory>
#include <vector>

namespace parser {
class Type {
  std::string name;

public:
  Type(std::string name) : name {name} {} // TODO: better typing
  std::string& GetName();
};

class Expr {
public:
  Type type;

  Expr(Type type);

  virtual ~Expr() {};
  virtual void PrettyPrint(int offset) = 0;
};

class NumberExpr : public Expr {
  double val;

public:
  NumberExpr(double val);
  void PrettyPrint(int offset) override;
};

class VariableExpr : public Expr {
  std::string name;

public:
  VariableExpr(std::string name);

  std::string& GetName();
  void PrettyPrint(int offset) override;
};

class VarDefExpr : public Expr {
  std::unique_ptr<VariableExpr> variable;

public:
  VarDefExpr(std::unique_ptr<VariableExpr> variable, Type type);
  void PrettyPrint(int offset) override;
};

class BinaryExpr : public Expr {
  std::unique_ptr<VariableExpr> op;
  std::unique_ptr<Expr> LHS, RHS;

public:
  BinaryExpr(std::unique_ptr<VariableExpr> op, std::unique_ptr<Expr> LHS, std::unique_ptr<Expr> RHS);
  void PrettyPrint(int offset) override;
};

class CallExpr : public Expr {
  std::unique_ptr<VariableExpr> callee;
  std::vector<std::unique_ptr<Expr>> args;

public:
  CallExpr(std::unique_ptr<VariableExpr> callee, std::vector<std::unique_ptr<Expr>> args);
  void PrettyPrint(int offset) override;
};

class PrototypeExpr : public Expr {
  std::string name;
  std::vector<std::unique_ptr<VarDefExpr>> inputs;

public:
  PrototypeExpr(std::string name, std::vector<std::unique_ptr<VarDefExpr>> inputs, Type return_type);

  std::string& GetName();
  void PrettyPrint(int offset) override;
};

class FunctionDefExpr : public Expr {
  std::unique_ptr<PrototypeExpr> prototype;
  std::unique_ptr<Expr> body;

public:
  FunctionDefExpr(std::unique_ptr<PrototypeExpr> prototype, std::unique_ptr<Expr> body);
  void PrettyPrint(int offset) override;
};
}
