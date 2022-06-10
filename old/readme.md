this readme is outdated and invalidated, read at your own risk  
# Silver
_A really stupid programming thing_  
The idea for this whole mess is to have silver's own syntax compile to a generic silver-assembly (.sas) file and _then_ we can do loads of screwery with it, like compile to native, bytecode, interpret it, etc.  
Given it has types and (unique-enough, numerical) names for functions & variables, we could hypothetically "compile" it into another language with or without types like C or C++ or most things I guess (but not rust until we have not stupid memory)

## Indexing
_I know this is a stupid solution, dont @ me_  
Every _thing_ (variable, constant, function, frame, etc) has an index. Indexes are calculated in such a way that for any frame within any number of other frames within a function, no index points to two variables, and all indexes that are present are continuous from zero.  
This means indexes do not have to be completely unique, as if two functions have arguments with the same index they will never both be, uhh..., present? in the immediate stack of variables, so the indexes will never clash.
  
## The Assembly Spec
_I'm not sure about this either_  
Unless a _thing_ is supposed to contain other _things_ it is declared by an @`thing`, such as `@const` for constants.  
Directly after a @-declaration comes the values for the _indexes_, a way of accessing specific variables. More on indexes at some point. After the indexes comes a _bitwidth_, or how bit-wide a data value is (eg a 32-bit integer is, unsuprisingly, 32 bits). The value after the bitwidth, if there is one, depends on the thing being declared. Here is the syntax table:  
| Declarator | What it defines | Additional values (if any) |
|------------|-----------------|-------------------|
|`@const`    | A (global) constant | The value for the constant (required) |
|`@extern`   | An external variable, constant or function | The name to link to (required) |
|`@return`   | The bitwidth & index of a variable to be returned. This creates the variable being returned. ||
|`@arg`      | The bitwidth & index of an argument to be passed to the function. This creates the argument as a variable. ||
|`@var`      | The bitwidth & index of a variable. (TODO: figure out initial values) ||
  
If a _thing_ is intended to contain other _things_ (like a function or a frame) it is declared by a ~`thing`. _It is still a thing like anthing else and requires a unique index, this just makes it easier for me because I am lazy and want the programmer to do additional work on my behalf._  
Following this, functions are defined as `~function` then an index, and frames as `~frame` and index.  

### Instructions
_I promise more are coming later!_
Instructions are not prefixed. They're just there. Here they are:  
| Operation name | What it does | Operand 1 | Operand 2 | Operand 3 |
|----------------|--------------|-----------|-----------|-----------|
| add\_u8        | Adds two u8s (unsigned byte) | Output | Input 1 | Input 2 |
  
_more are coming I promise_  
The syntax for `call` is strange and stupid, (and unimplemented), because there isn't a reasonable limit to the number of arguments a function can have. It goes `call` function-index then argument 1, argument 2 etc etc. _Technically_ any variable can be used as the index, and it'll (I'm not sure what it'll do, this is a problem for future me to fix (TODO)).
