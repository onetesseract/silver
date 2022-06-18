// use crate::lexer::Lexer;
//
// use super::{variable::VariableExpr, Expr, ParseResult, ExprVal, ParserState, call::CallExpr};
//
// #[derive(Debug, Clone)]
// pub struct BinaryExpr<'a> {
//     op: VariableExpr<'a>,
//     lhs: Expr<'a>,
//     rhs: Expr<'a>,
// }

pub mod BinaryExpr {
    use crate::{lexer::{Lexer, LexString}, syntax::{ParserState, ParseResult, Expr, ExprVal, call::CallExpr, variable::VariableExpr}};

    pub fn maybe_suffix_fn<'a>(lexer: Lexer<'a>, lhs: Expr<'a>, op: LexString<'a>, state: ParserState) -> ParseResult<'a, Expr<'a>> {
        // println!("OP: {}, {:?}", op.render());
        if state.data.read().unwrap().suffix_fns.contains(&op.render().to_string()) {
            // it is a prefix fn
            lexer.take_identifier(); // eat the op
            Ok(Expr::new(ExprVal::Call(CallExpr { target: VariableExpr { name: op }, inputs: vec![lhs], types: None})))
        } else {
            Ok(lhs)
        }
    }

    pub fn maybe_parse_raw<'a>(lexer: Lexer<'a>, state: ParserState) -> ParseResult<Expr> {
        let lhs = Expr::parse_primary(lexer.clone(), state.clone())?;
        lexer.eat_wsp();
        parse_binop_rhs(lexer, lhs, -1, state)
    }
    fn parse_binop_rhs<'a>(lexer: Lexer<'a>, lhs: Expr<'a>, prec: isize, state: ParserState) -> ParseResult<'a, Expr<'a>> {
        let mut lhs = lhs;
        loop {
            // If this is a binop that binds at least as tightly as the current binop,
            // consume it, otherwise we are done.
            lexer.eat_wsp();
            let op = lexer.peek_identifier();
            let read = state.clone();
            let read = read.data.read().unwrap();
            let parsed_prec = read.infix_fns.get(&op.render().to_string());
            let parsed_prec = match parsed_prec {
                Some(s) => *s,
                None => return maybe_suffix_fn(lexer, lhs, op, state),
            };
            if prec > parsed_prec || op.render() == "" {
                return Ok(lhs);
            }
            drop(read);
            // ok its a binop, eat it
            println!("ate `{}`", lexer.take_identifier().render());

            lexer.eat_wsp();
            let mut rhs = Expr::parse_primary(lexer.clone(), state.clone())?;
            lexer.eat_wsp();

            let peek_op = lexer.peek_identifier().render();
            let peek_prec = match state.clone().data.read().unwrap().infix_fns.get(&peek_op.to_string()) {
                Some(s) => *s,
                None => -1,
            };
            if parsed_prec < peek_prec {
                rhs = parse_binop_rhs(lexer.clone(), rhs, prec + 1, state.clone())?;
            }
            lhs = Expr::new(ExprVal::Call(CallExpr { target: VariableExpr { name: op }, inputs: vec![lhs, rhs], types: None}));
        }
    }
}
