use crate::lexer::Lexer;

use super::{vardef::VarDef, Expr, ParseError, ParserState, ParseResult, ExprVal};

#[derive(Debug, Clone)]
pub struct LambdaExpr<'a> {
    pub args: Vec<VarDef<'a>>,
    pub body: Expr<'a>,
}

impl<'a> LambdaExpr<'a> {
    pub fn parse(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, Expr<'a>> {
        if lexer.peek_char().render() != "~" {
            return Err(ParseError::new(lexer, format!("Expected `~`")));
        }
        lexer.take_char();
        lexer.eat_wsp();

        if lexer.peek_char().render() != "(" {
            return Err(ParseError::new(lexer, format!("Expected `(` for start of lambda")));
        }
        lexer.take_char();

        let mut args = vec![];

        while lexer.peek_char().render() != ")" && !lexer.is_eof() {
            lexer.eat_wsp();
            let v = VarDef::parse_raw(lexer.clone(), state.clone())?;
            args.push(v);

            lexer.eat_wsp();
            if lexer.peek_char().render() != ")" {
                if lexer.take_char().render() != "," {
                    return Err(ParseError::new(lexer, format!("Expected `,` for lambda args sep")));
                }
            }
        }

        lexer.eat_wsp();

        let body = Expr::parse(lexer.clone(), state.clone())?;


        Ok(Expr { val: Box::new(ExprVal::LambdaExpr(LambdaExpr{ args, body })) })
    }

}
