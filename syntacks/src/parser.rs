/* 
 * CHAR = 'A' | 'B' ....
 * FNDEF = STR: name, "(", {ARG}: args, ")", EXPR: body :: "~function $name\n$args\n$body"
 *
 * */

use nom::{IResult, sequence::{tuple, pair}, character::{complete::{multispace0, alpha1, alphanumeric1}, is_alphanumeric}, bytes::complete::{tag, take_while1}, branch::alt, combinator::{recognize, opt}, multi::many0_count};

pub type ParsingFn<'a, O> = dyn Fn(&'a str) -> IResult<&'a str, O>;

#[derive(Debug, Clone)]
pub enum Rule<'a> {
    Concatenation(Box<Rule<'a>>, Box<Rule<'a>>),
    Alternation(Box<Rule<'a>>, Box<Rule<'a>>),
    Optional(Box<Rule<'a>>),
    Repeated(Box<Rule<'a>>),
    Group(Box<Rule<'a>>),
    Str(String),
    Exception { rule: Box<Rule<'a>>, exception: Box<Rule<'a>> },
    Named(Box<Rule<'a>>, &'a str),
    Identifier(&'a str),
}
impl<'a> Rule<'a> {
    fn parse_atom(input: &'a str) -> IResult<&'a str, Self> {
        alt((Rule::parse_opt, Rule::parse_rep, Rule::parse_group, Rule::parse_str, Rule::parse_id))(input)
    }
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        alt((Rule::parse_exc, Rule::parse_concat, Rule::parse_alt, Rule::parse_named, Rule::parse_atom))(input)
    }
    fn parse_concat(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (r1, _, _, _, r2)) = tuple((Rule::parse_atom, multispace0, tag(","), multispace0, Rule::parse))(input)?;
        Ok((remnant, Rule::Concatenation(Box::new(r1), Box::new(r2))))
    }
    fn parse_alt(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (r1, _, _, _, r2)) = tuple((Rule::parse_atom, multispace0, tag("|"), multispace0, Rule::parse))(input)?;
        Ok((remnant, Rule::Alternation(Box::new(r1), Box::new(r2))))
    }
    fn parse_opt(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (_, _, r1, _, _,)) = tuple((tag("["), multispace0, Rule::parse, multispace0, tag("]")))(input)?;
        Ok((remnant, Rule::Optional(Box::new(r1))))
    }
    fn parse_rep(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (_, _, r1, _, _,)) = tuple((tag("{"), multispace0, Rule::parse, multispace0, tag("}")))(input)?;
        Ok((remnant, Rule::Repeated(Box::new(r1)))) 
    }
    fn parse_group(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (_, _, r1, _, _,)) = tuple((tag("("), multispace0, Rule::parse, multispace0, tag(")")))(input)?;
        Ok((remnant, Rule::Group(Box::new(r1)))) 
    }
    fn parse_str(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, string) = crate::recipies::string::parse_string(input)?;
        Ok((remnant, Rule::Str(string)))
    }
    fn parse_exc(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (r1, _, _, _, r2)) = tuple((Rule::parse_atom, multispace0, tag("-"), multispace0, Rule::parse))(input)?;
        Ok((remnant, Rule::Exception {rule: Box::new(r1), exception: Box::new(r2)}))
    }
    fn parse_named(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (r1, _, _, _, name)) = tuple((Rule::parse_atom, multispace0, tag(":"), multispace0, take_while1(|c: char| is_alphanumeric(c as u8))))(input)?;
        Ok((remnant, Rule::Named(Box::new(r1), name)))
    }
    fn parse_id(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, id) = crate::recipies::id::parse_id(input)?;
        Ok((remnant, Rule::Identifier(id)))
    }
}

#[derive(Debug, Clone)]
pub struct Statement<'a> {
    pub name: &'a str,
    pub rule: Rule<'a>,
    pub content: Option<String>,
}
impl<'a> Statement<'a> {
    pub fn parse(input: &'a str) -> IResult<&'a str, Self> {
        let (remnant, (name, _, _, _, rule, _, opt, _)) = tuple((crate::recipies::id::parse_id, multispace0, tag("="), multispace0, Rule::parse, multispace0, opt(tuple((tag("::"), multispace0, crate::recipies::string::parse_string, multispace0))), tag(";")))(input)?;
        let content = match opt {
            Some((_, _, content, _)) => Some(content),
            None => None
        };
        Ok((remnant, Statement {name, rule, content}))
    }
}

// ------------
