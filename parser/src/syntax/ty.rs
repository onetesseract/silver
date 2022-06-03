use crate::lexer::LexString;

#[derive(Debug, Clone)]
pub struct Ty<'a> {
    pub ty: LexString<'a>,
}
