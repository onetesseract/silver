use crate::lexer::{LexString, Lexer};

use super::{ty::Ty, vardef::VarDef, ParserState, ParseResult, ParseError, Expr};

#[derive(Debug, Clone)]
pub enum FnType {
    Normal,
    Infix,
    Suffix,
    Prefix,
}

#[derive(Debug, Clone)]
pub struct FnProto<'a> {
    class: FnType,
    return_ty: Ty,
    name: LexString<'a>,
    args: Vec<VarDef<'a>>,
}

impl<'a> FnProto<'a> {
    pub fn parse(lexer: Lexer<'a>, state: ParserState) -> ParseResult<'a, Self> {
        let class = match lexer.peek_identifier().render() {
            "func" => FnType::Normal,
            "infix" => FnType::Infix,
            "suffix" => FnType::Suffix,
            "prefix" => FnType::Prefix,
            x => return Err(ParseError::new(lexer, format!("Expected `func`, `infix`, `suffix`, or `prefix`; found `{}`", x))),
        };
        lexer.take_identifier(); // eat it
        lexer.eat_wsp();
        let name = lexer.peek_identifier();
        if name.render() == "" {
            return Err(ParseError::new(lexer, format!("Expected a valid function name")));
        }
        lexer.take_identifier();

        lexer.eat_wsp();

        let c = lexer.take_char().render();
        if c != "(" {
            return Err(ParseError::new(lexer, format!("Expected ( in fndef, found {}", c)));
        }
        lexer.eat_wsp();
        let mut args: Vec<VarDef> = vec![];
        if lexer.peek_char().render() != ")" {
            loop {
                args.push(VarDef::parse_raw(lexer.clone(), state.clone())?);
                lexer.eat_wsp();
                if lexer.peek_char().render() == ")" {
                    break;
                }
                if lexer.peek_char().render() != "," {
                    return Err(ParseError::new(lexer, format!("Expected , to separate args")));
                }
                lexer.take_char(); // eat ,
            }
        }
        // eat the (
        lexer.take_char();

        // TODO: type::parse
        lexer.eat_wsp();
        let return_ty = Ty { ty: lexer.take_identifier().render().to_string() };
        
        Ok(FnProto { class, return_ty, name, args })
    }
}

mod tests {
    #[test]
    fn proto_test() {
        let l = crate::lexer::Lexer::new("func f(x int) int");
        let s = crate::syntax::ParserState::new();
        println!("proto - {:#?}", crate::syntax::proto::FnProto::parse(l, s));
    }
}
