use nom::{error::ParseError, sequence::tuple, multi::many0, character::complete::multispace0, IResult};

pub fn delim<'a, F: 'a, S: 'a, O, T, E: ParseError<&'a str>>(inner: F, sep: S) -> impl FnMut(&'a str) -> IResult<&'a str, Vec<O>, E>
    where
    F: Fn(&'a str) -> IResult<&'a str, O, E>,
    S: Fn(&'a str) -> IResult<&'a str, T, E>,
{
    move | input: &'a str | -> IResult<&'a str, Vec<O>, E> {
        let (remnant, (vect, _, last)) = tuple((many0(tuple((inner, multispace0, sep, multispace0))), multispace0, inner))(input)?;
        let mut v = vec![];
        for (i, _, _, _) in vect {
            v.push(i);
        }
        v.push(last);
        Ok((remnant, v))
    }
    // tuple((many0(tuple((inner, multispace0, sep, multispace0))), multispace0, inner)).map(| (vect, _, last) | {
    //     let mut v = vec![];
    //     for (i, _, _, _) in vect {
    //         v.push(i);
    //     }
    //     v.push(last);
    //     v
    // }).into()
}
