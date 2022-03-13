use nom::{IResult, sequence::{separated_pair, pair, delimited, tuple}, character::complete::{multispace0, alpha1, alphanumeric1, char}, combinator::recognize, branch::alt, multi::{many0, separated_list0}, bytes::complete::tag, error::ParseError};

fn whitespace_surround<'a, F: 'a, O, E: ParseError<&'a str>>(inner: F) -> impl FnMut(&'a str) -> IResult<&'a str, O, E>
  where
  F: Fn(&'a str) -> IResult<&'a str, O, E>,
{
  delimited(
    multispace0,
    inner,
    multispace0
  )
}

pub trait Parse<I>: Sized {
    fn parse(_: I) -> IResult<I, Self>;
}

#[derive(Debug, Clone)]
pub struct Identifier<'a> {
    content: &'a str,
}

impl<'a> From<&'a str> for Identifier<'a> {
    fn from(val: &'a str) -> Self {
        Identifier { content: val }
    }
}

impl<'a> Parse<&'a str> for Identifier<'a> {
    fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, val) = recognize(
            pair(
                alt((alpha1, tag("_"))),
                many0(alt((alphanumeric1, tag("_"))))
            )
        )(input)?;
        Ok((remnant, val.into()))
    }
}

#[derive(Debug, Clone)]
pub struct TypeSig<'a> {
    name: Identifier<'a>,
    type_name: Identifier<'a>,
}

impl<'a> From<(Identifier<'a>, Identifier<'a>)> for TypeSig<'a> {
    fn from(val: (Identifier<'a>, Identifier<'a>)) -> Self {
        TypeSig { name: val.0, type_name: val.1}
    }
}

impl<'a> Parse<&'a str> for TypeSig<'a> {
    fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, signature) = separated_pair(Identifier::parse, multispace0, Identifier::parse)(input)?;
        Ok((remnant, signature.into()))
    }
}

#[derive(Debug, Clone)]
pub struct TypeSigList<'a> {
    types: Vec<TypeSig<'a>>
}

impl<'a> From<Vec<TypeSig<'a>>> for TypeSigList<'a> {
    fn from(val: Vec<TypeSig<'a>>) -> Self {
        TypeSigList { types: val }
    }
}

impl<'a> Parse<&'a str> for TypeSigList<'a> {
    fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, values) = delimited(
            char('('),
            separated_list0(
                whitespace_surround(char(',')),
                TypeSig::parse
            ),
            char(')')
        )(input)?;
        Ok((remnant, values.into()))
    }
}

#[derive(Debug, Clone)]
pub struct FunctionSig<'a> {
    args: TypeSigList<'a>,
    return_type: Identifier<'a>,
}

impl<'a> From<(TypeSigList<'a>, Identifier<'a>)> for FunctionSig<'a> {
    fn from(val: (TypeSigList<'a>, Identifier<'a>)) -> Self {
        FunctionSig { args: val.0, return_type: val.1 }
    }
}

impl<'a> Parse<&'a str> for FunctionSig<'a> {
    fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (args, _, return_type)) = tuple((TypeSigList::parse, whitespace_surround(tag("->")), Identifier::parse))(input)?;
        Ok((remnant, (args, return_type).into()))
    }
}

#[derive(Debug, Clone)]
pub struct Assignment<'a> {
    lhs: Identifier<'a>, // TODO: should this be a Thing?
    rhs: Thing<'a>,
}

impl<'a> From<(Identifier<'a>, Thing<'a>)> for Assignment<'a> {
    fn from(val: (Identifier<'a>, Thing<'a>)) -> Self {
        Assignment { lhs: val.0, rhs: val.1}
    }
}

impl<'a> Parse<&'a str> for Assignment<'a> {
    fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (lhs, _, rhs)) = tuple((Identifier::parse, whitespace_surround(char('=')), Thing::parse))(input)?;
        Ok((remnant, (lhs, rhs).into()))
    }
}

// TODO: will have to switch to Higher-Level Things and Lower-Level Things or make Assignment-Identifier work with & or *

#[derive(Debug, Clone)]
pub struct Block<'a> {
    contents: Vec<Thing<'a>>
}

impl<'a> From<Vec<Thing<'a>>> for Block<'a> {
    fn from(val: Vec<Thing<'a>>) -> Self {
        Block { contents: val }
    }
}

impl<'a> Parse<&'a str> for Block<'a> {
    fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, values) = delimited(
            char('{'),
            many0(whitespace_surround(Thing::parse)),
            char('}')
        )(input)?;
        Ok((remnant, values.into()))
    }
}

#[derive(Debug, Clone)]
pub struct Function<'a> {
    sig: FunctionSig<'a>,
    body: Thing<'a>,
}

impl<'a> From<(FunctionSig<'a>, Thing<'a>)> for Function<'a> {
    fn from(val: (FunctionSig<'a>, Thing<'a>)) -> Self {
        Function { sig: val.0, body: val.1 }
    }
}

impl<'a> Parse<&'a str> for Function<'a> {
    fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (sig, body)) = tuple((FunctionSig::parse, whitespace_surround(Thing::parse)))(input)?;
        Ok((remnant, (sig, body).into()))
    }
}

#[derive(Debug, Clone)]
pub enum Thing<'a> {
    Identifier(Identifier<'a>),
    Assignment(Box<Assignment<'a>>),
    FunctionSig(FunctionSig<'a>),
    Block(Box<Block<'a>>),
    Function(Box<Function<'a>>),
}

// macro_rules! parse_to_thing {
//     ($x:expr) => {
//         impl<'a> $x<'a> {
//             fn parse_to_thing(input: &'a str) -> IResult<&'a str, Thing<'a>> {
//                 let (remnant, val) = $x::parse(input)?;
//                 Ok((remnant, Thing::$x(val)))
//             }
//         }
//     };
// }

// TODO: make a working macro for this 

impl<'a> Assignment<'a> {
    fn parse_to_thing(input: &'a str) -> IResult<&'a str, Thing<'a>> {
        let (remnant, val) = Assignment::parse(input)?;
        Ok((remnant, Thing::Assignment(Box::new(val))))
    }
}

impl<'a> Identifier<'a> {
    fn parse_to_thing(input: &'a str) -> IResult<&'a str, Thing<'a>> {
        let (remnant, val) = Identifier::parse(input)?;
        Ok((remnant, Thing::Identifier(val)))
    }
}

impl<'a> FunctionSig<'a> {
    fn parse_to_thing(input: &'a str) -> IResult<&'a str, Thing<'a>> {
        let (remnant, val) = FunctionSig::parse(input)?;
        Ok((remnant, Thing::FunctionSig(val)))
    }
}

impl<'a> Block<'a> {
    fn parse_to_thing(input: &'a str) -> IResult<&'a str, Thing<'a>> {
        let (remnant, val) = Block::parse(input)?;
        Ok((remnant, Thing::Block(Box::new(val))))
    }
}

impl<'a> Function<'a> {
    fn parse_to_thing(input: &'a str) -> IResult<&'a str, Thing<'a>> {
        let (remnant, val) = Function::parse(input)?;
        Ok((remnant, Thing::Function(Box::new(val))))
    }
}

impl<'a> Parse<&'a str> for Thing<'a> {
    fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((
            Assignment::parse_to_thing,
            Function::parse_to_thing,
            FunctionSig::parse_to_thing,
            Identifier::parse_to_thing,
            Block::parse_to_thing,
        ))(input)
    }
}

#[cfg(test)]
mod tests {
    use super::{Thing, Parse};

    #[test]
    fn parse_test() {
        let res = Thing::parse("a = (x String) -> Error { aaaa = bcs }");
        println!("{:?}", res);
    }
}