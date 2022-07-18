use crate::lexer::Lexer;

use super::{ParserState, Expr, ParseError, ParseResult, call::{CallExpr, TargetType, CallType}, ExprVal};

pub fn maybe_bracket_call<'a>(lexer: Lexer<'a>, state: ParserState, expr: Expr<'a>) -> ParseResult<'a, Expr<'a>> {
    let possible = lexer.peek_identifier();
    let mut pair = None;
    for (i, j) in state.data.read().unwrap().brack_pairs.clone() {
        if i == possible.render() {
            pair = Some((i, j));
            break;
        }
    }
    let pair = match pair {
        Some(s) => s,
        None => return Ok(expr),
    };

    lexer.take_identifier(); // eat initial
    lexer.eat_wsp();
    let mut inputs = vec![expr];
    if lexer.peek_identifier().render() != pair.1 {
        loop {
            inputs.push(Expr::parse(lexer.clone(), state.clone())?);
            lexer.eat_wsp();

            if lexer.peek_identifier().render() == pair.1 {
                break;
            }
            if lexer.take_char().render() != "," {
                return Err(ParseError::new(lexer, format!("Expected , to separate arguments")));
            }
            lexer.eat_wsp();
        }
    }
    let second = lexer.take_identifier(); // eat second of pair

    Ok(Expr {val: Box::new(ExprVal::Call(CallExpr {target: TargetType::Brackets(possible, second), inputs, calltype: CallType::Brackets, types: None }))})
}
