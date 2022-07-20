use crate::lexer::{LexString, Lexer};

use super::{Expr, ExprVal, ParseResult, call::{CallExpr, TargetType}, ParserState, keywords::{KEYWORDS, parse_keywords}, proto::FnType};

#[derive(Debug, Clone, Hash, PartialEq, Eq)]
pub struct VariableExpr<'a> {
    pub name: LexString<'a>
}

impl<'a> VariableExpr<'a> {
    pub fn parse_raw(lexer: Lexer<'a>) -> Self {
        VariableExpr { name: lexer.take_identifier() }
    }
    pub fn parse(lexer: Lexer<'a>, state: ParserState) -> ParseResult<Expr> {
        let v = Self::parse_raw(lexer.clone());
        
        if KEYWORDS.contains(&v.name.render().as_str()) {
            return parse_keywords(lexer, state, v.name);
        }

        lexer.eat_wsp();
        if lexer.peek_char().render() == "(" || lexer.peek_char().render() == "<" {
            Ok(Expr::new(ExprVal::Call(CallExpr::parse_raw(lexer, v, state)?)))
        } else {
            if state.data.read().unwrap().prefix_fns.contains(&v.name.render().to_string()) {
                // is a Prefix Fn
                Ok(Expr::new(ExprVal::Call(CallExpr { target: TargetType::Named(v), inputs: vec![Expr::parse_primary(lexer, state)?], types: None, calltype: FnType::Prefix})))
            }
            // else if state.data.read().unwrap().infix_fns.contains_key(lexer.peek_identifier().render()) {
            //     // is an Infix Fn first argument
            //     Ok(Expr::new("unknown".to_string(), ExprVal::Call(CallExpr { target: VariableExpr::parse_raw(lexer.clone() /*, state.clone()*/), inputs: vec![Expr::new("unknown".to_string(), ExprVal::Variable(v)), Expr::parse(lexer, state)?]})))
            // } 
            else if state.data.read().unwrap().suffix_fns.contains(&lexer.peek_identifier().render().to_string()) {
                // is a Suffix FirstArg
                Ok(Expr::new(ExprVal::Call(CallExpr {target: TargetType::Named(VariableExpr::parse_raw(lexer.clone())), inputs: vec![Expr::new(ExprVal::Variable(v))], types: None, calltype: FnType::Suffix})))
            } else {
                // infix fns are handled by binary parsing, hopefully
                Ok(Expr::new(ExprVal::Variable(v)))
            }
        }
    }
}
