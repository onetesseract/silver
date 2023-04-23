; ModuleID = 'silver.silver'
source_filename = "silver.silver"

@global_str = private unnamed_addr constant [19 x i8] c"Assertion failed: \00", align 1
@global_str.11 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@global_str.12 = private unnamed_addr constant [22 x i8] c"Assertion succeeded: \00", align 1
@global_str.13 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@global_str.14 = private unnamed_addr constant [19 x i8] c"Assertion failed: \00", align 1
@global_str.15 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@global_str.16 = private unnamed_addr constant [8 x i8] c"Panic!\0A\00", align 1
@global_str.18 = private unnamed_addr constant [8 x i8] c"Panic!\0A\00", align 1
@global_str.21 = private unnamed_addr constant [4 x i8] c" t\0A\00", align 1
@global_str.23 = private unnamed_addr constant [44 x i8] c"Trying to add two non-contiguous LexStrings\00", align 1
@global_str.24 = private unnamed_addr constant [15 x i8] c"+-><*/=%!&.[]|\00", align 1
@global_str.25 = private unnamed_addr constant [11 x i8] c"Expected `\00", align 1
@global_str.26 = private unnamed_addr constant [12 x i8] c"` but got `\00", align 1
@global_str.27 = private unnamed_addr constant [3 x i8] c"`\0A\00", align 1
@global_str.28 = private unnamed_addr constant [18 x i8] c"invalid character\00", align 1
@global_str.30 = private unnamed_addr constant [15 x i8] c"Expected str `\00", align 1
@global_str.31 = private unnamed_addr constant [12 x i8] c"` but got `\00", align 1
@global_str.32 = private unnamed_addr constant [3 x i8] c"`\0A\00", align 1
@global_str.33 = private unnamed_addr constant [18 x i8] c"invalid character\00", align 1
@global_str.34 = private unnamed_addr constant [16 x i8] c"ExprType#Number\00", align 1
@global_str.35 = private unnamed_addr constant [20 x i8] c"ExprType#Identifier\00", align 1
@global_str.36 = private unnamed_addr constant [15 x i8] c"ExprType#Block\00", align 1
@global_str.37 = private unnamed_addr constant [16 x i8] c"ExprType#String\00", align 1
@global_str.38 = private unnamed_addr constant [12 x i8] c"ExprType#If\00", align 1
@global_str.39 = private unnamed_addr constant [15 x i8] c"ExprType#While\00", align 1
@global_str.40 = private unnamed_addr constant [48 x i8] c"Debug expr type for this one not implmented yet\00", align 1
@global_str.41 = private unnamed_addr constant [29 x i8] c"Dunno how to debug this type\00", align 1
@global_str.43 = private unnamed_addr constant [16 x i8] c"Parsing number\0A\00", align 1
@global_str.44 = private unnamed_addr constant [16 x i8] c"Expected number\00", align 1
@global_str.47 = private unnamed_addr constant [2 x i8] c"`\00", align 1
@global_str.48 = private unnamed_addr constant [2 x i8] c"`\00", align 1
@global_str.49 = private unnamed_addr constant [25 x i8] c"Parsing identifier expr\0A\00", align 1
@global_str.50 = private unnamed_addr constant [26 x i8] c"Expected valid identifier\00", align 1
@global_str.54 = private unnamed_addr constant [9 x i8] c"Block: {\00", align 1
@global_str.55 = private unnamed_addr constant [21 x i8] c"} using last value: \00", align 1
@global_str.56 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@global_str.57 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@global_str.58 = private unnamed_addr constant [20 x i8] c"Parsing block expr\0A\00", align 1
@global_str.59 = private unnamed_addr constant [12 x i8] c"parsing ex\0A\00", align 1
@global_str.61 = private unnamed_addr constant [12 x i8] c"Broke loop\0A\00", align 1
@global_str.62 = private unnamed_addr constant [6 x i8] c"got: \00", align 1
@global_str.63 = private unnamed_addr constant [6 x i8] c"len: \00", align 1
@global_str.74 = private unnamed_addr constant [5 x i8] c"IF: \00", align 1
@global_str.75 = private unnamed_addr constant [7 x i8] c"THEN: \00", align 1
@global_str.76 = private unnamed_addr constant [7 x i8] c"ELSE: \00", align 1
@global_str.77 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@global_str.78 = private unnamed_addr constant [5 x i8] c"else\00", align 1
@global_str.82 = private unnamed_addr constant [8 x i8] c"WHILE: \00", align 1
@global_str.83 = private unnamed_addr constant [5 x i8] c"DO: \00", align 1
@global_str.84 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@global_str.89 = private unnamed_addr constant [13 x i8] c"Parsing expr\00", align 1
@global_str.90 = private unnamed_addr constant [3 x i8] c"if\00", align 1
@global_str.91 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@global_str.92 = private unnamed_addr constant [16 x i8] c"Cannot parse: `\00", align 1
@global_str.93 = private unnamed_addr constant [3 x i8] c"`\0A\00", align 1
@global_str.95 = private unnamed_addr constant [32 x i8] c"{if {a; b; c} while c b else f}\00", align 1

declare i8* @malloc(i64)

declare i8* @realloc(i8*, i64)

declare i64 @strlen(i8*)

declare void @free(i8*)

declare void @strcpy(i8*, i8*)

declare void @strncpy(i8*, i8*, i64)

declare void @memcpy(i8*, i8*, i64)

declare i64 @strcmp(i8*, i8*)

declare void @printf(i8*)

declare void @putchar(i8)

declare void @exit(i64)

declare i64 @pow(i64, i64)

define i1 @"=="(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_cmp_eq = icmp eq i64 %a_variable_load, %b_variable_load
  ret i1 %asm_int_cmp_eq
}

define i1 @"!="(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_cmp_eq = icmp ne i64 %a_variable_load, %b_variable_load
  ret i1 %asm_int_cmp_eq
}

define i1 @"<"(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_cmp_ult = icmp ult i64 %a_variable_load, %b_variable_load
  ret i1 %asm_int_cmp_ult
}

define i1 @">"(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_cmp_ugt = icmp ugt i64 %a_variable_load, %b_variable_load
  ret i1 %asm_int_cmp_ugt
}

define i1 @"<="(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_cmp_ule = icmp ule i64 %a_variable_load, %b_variable_load
  ret i1 %asm_int_cmp_ule
}

define i1 @">="(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_cmp_uge = icmp uge i64 %a_variable_load, %b_variable_load
  ret i1 %asm_int_cmp_uge
}

define i64 @"&&"(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_and = and i64 %a_variable_load, %b_variable_load
  ret i64 %asm_int_and
}

define i64 @"||"(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_or = or i64 %a_variable_load, %b_variable_load
  ret i64 %asm_int_or
}

define i1 @"==.1"(i8 %0, i8 %1) {
entry_block:
  %b = alloca i8, align 1
  %a = alloca i8, align 1
  store i8 %0, i8* %a, align 1
  store i8 %1, i8* %b, align 1
  %a_variable_load = load i8, i8* %a, align 1
  %b_variable_load = load i8, i8* %b, align 1
  %asm_int_cmp_eq = icmp eq i8 %a_variable_load, %b_variable_load
  ret i1 %asm_int_cmp_eq
}

define i1 @"!=.2"(i8 %0, i8 %1) {
entry_block:
  %b = alloca i8, align 1
  %a = alloca i8, align 1
  store i8 %0, i8* %a, align 1
  store i8 %1, i8* %b, align 1
  %a_variable_load = load i8, i8* %a, align 1
  %b_variable_load = load i8, i8* %b, align 1
  %asm_int_cmp_eq = icmp ne i8 %a_variable_load, %b_variable_load
  ret i1 %asm_int_cmp_eq
}

define i1 @"<.3"(i8 %0, i8 %1) {
entry_block:
  %b = alloca i8, align 1
  %a = alloca i8, align 1
  store i8 %0, i8* %a, align 1
  store i8 %1, i8* %b, align 1
  %a_variable_load = load i8, i8* %a, align 1
  %b_variable_load = load i8, i8* %b, align 1
  %asm_int_cmp_ult = icmp ult i8 %a_variable_load, %b_variable_load
  ret i1 %asm_int_cmp_ult
}

define i1 @">.4"(i8 %0, i8 %1) {
entry_block:
  %b = alloca i8, align 1
  %a = alloca i8, align 1
  store i8 %0, i8* %a, align 1
  store i8 %1, i8* %b, align 1
  %a_variable_load = load i8, i8* %a, align 1
  %b_variable_load = load i8, i8* %b, align 1
  %asm_int_cmp_ugt = icmp ugt i8 %a_variable_load, %b_variable_load
  ret i1 %asm_int_cmp_ugt
}

define i1 @"<=.5"(i8 %0, i8 %1) {
entry_block:
  %b = alloca i8, align 1
  %a = alloca i8, align 1
  store i8 %0, i8* %a, align 1
  store i8 %1, i8* %b, align 1
  %a_variable_load = load i8, i8* %a, align 1
  %b_variable_load = load i8, i8* %b, align 1
  %asm_int_cmp_ule = icmp ule i8 %a_variable_load, %b_variable_load
  ret i1 %asm_int_cmp_ule
}

define i1 @">=.6"(i8 %0, i8 %1) {
entry_block:
  %b = alloca i8, align 1
  %a = alloca i8, align 1
  store i8 %0, i8* %a, align 1
  store i8 %1, i8* %b, align 1
  %a_variable_load = load i8, i8* %a, align 1
  %b_variable_load = load i8, i8* %b, align 1
  %asm_int_cmp_uge = icmp uge i8 %a_variable_load, %b_variable_load
  ret i1 %asm_int_cmp_uge
}

define i8 @"&&.7"(i8 %0, i8 %1) {
entry_block:
  %b = alloca i8, align 1
  %a = alloca i8, align 1
  store i8 %0, i8* %a, align 1
  store i8 %1, i8* %b, align 1
  %a_variable_load = load i8, i8* %a, align 1
  %b_variable_load = load i8, i8* %b, align 1
  %asm_int_and = and i8 %a_variable_load, %b_variable_load
  ret i8 %asm_int_and
}

define i8 @"||.8"(i8 %0, i8 %1) {
entry_block:
  %b = alloca i8, align 1
  %a = alloca i8, align 1
  store i8 %0, i8* %a, align 1
  store i8 %1, i8* %b, align 1
  %a_variable_load = load i8, i8* %a, align 1
  %b_variable_load = load i8, i8* %b, align 1
  %asm_int_or = or i8 %a_variable_load, %b_variable_load
  ret i8 %asm_int_or
}

define i1 @"&&.9"(i1 %0, i1 %1) {
entry_block:
  %b = alloca i1, align 1
  %a = alloca i1, align 1
  store i1 %0, i1* %a, align 1
  store i1 %1, i1* %b, align 1
  %a_variable_load = load i1, i1* %a, align 1
  %b_variable_load = load i1, i1* %b, align 1
  %asm_bool_and = and i1 %a_variable_load, %b_variable_load
  ret i1 %asm_bool_and
}

define i1 @"||.10"(i1 %0, i1 %1) {
entry_block:
  %b = alloca i1, align 1
  %a = alloca i1, align 1
  store i1 %0, i1* %a, align 1
  store i1 %1, i1* %b, align 1
  %a_variable_load = load i1, i1* %a, align 1
  %b_variable_load = load i1, i1* %b, align 1
  %asm_bool_or = or i1 %a_variable_load, %b_variable_load
  ret i1 %asm_bool_or
}

define i64 @"%"(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_sub = srem i64 %a_variable_load, %b_variable_load
  ret i64 %asm_int_sub
}

define i1 @"!"(i1 %0) {
entry_block:
  %a = alloca i1, align 1
  store i1 %0, i1* %a, align 1
  %a_variable_load = load i1, i1* %a, align 1
  %asm_bool_not = xor i1 %a_variable_load, true
  ret i1 %asm_bool_not
}

define i64 @"+"(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_add = add i64 %a_variable_load, %b_variable_load
  ret i64 %asm_int_add
}

define i64 @-(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_sub = sub i64 %a_variable_load, %b_variable_load
  ret i64 %asm_int_sub
}

define i64 @"*"(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %asm_int_mul = mul i64 %a_variable_load, %b_variable_load
  ret i64 %asm_int_mul
}

define i64 @"^"(i64 %0, i64 %1) {
entry_block:
  %macro_arg_space5 = alloca i64, align 8
  %macro_arg_space = alloca i64, align 8
  %total = alloca i64, align 8
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %b_variable_load = load i64, i64* %b, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2719, end: 2721, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %b_variable_load, i64 0)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2719, end: 2721, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_else_block

if_then_block:                                    ; preds = %entry_block
  br label %if_cont_block

if_else_block:                                    ; preds = %entry_block
  %b_variable_load1 = load i64, i64* %a, align 4
  store i64 %b_variable_load1, i64* %total, align 4
  br label %while_loop_cond_check_basic_block

if_cont_block:                                    ; preds = %while_loop_cont_basic_block, %if_then_block
  %if_phi = phi i64 [ 1, %if_then_block ], [ %total_variable_load7, %while_loop_cont_basic_block ]
  ret i64 %if_phi

while_loop_cond_check_basic_block:                ; preds = %while_loop_body_basic_block, %if_else_block
  %b_variable_load2 = load i64, i64* %b, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2772, end: 2773, rendered-as: \22-\22 } })_call" = call i64 @-(i64 %b_variable_load2, i64 1)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2777, end: 2778, rendered-as: \22>\22 } })_call" = call i1 @">"(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2772, end: 2773, rendered-as: \22-\22 } })_call", i64 0)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2777, end: 2778, rendered-as: \22>\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %total_variable_load = load i64, i64* %total, align 4
  %a_variable_load = load i64, i64* %a, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2803, end: 2804, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 %total_variable_load, i64 %a_variable_load)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2803, end: 2804, rendered-as: \22*\22 } })_call", i64* %macro_arg_space, align 4
  %b_variable_load3 = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load3, i64* %total, align 4
  %b_variable_load4 = load i64, i64* %b, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2820, end: 2821, rendered-as: \22-\22 } })_call" = call i64 @-(i64 %b_variable_load4, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2820, end: 2821, rendered-as: \22-\22 } })_call", i64* %macro_arg_space5, align 4
  %b_variable_load6 = load i64, i64* %macro_arg_space5, align 4
  store i64 %b_variable_load6, i64* %b, align 4
  br label %while_loop_cond_check_basic_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %total_variable_load7 = load i64, i64* %total, align 4
  br label %if_cont_block
}

define void @assert(i1 %0, i8* %1) {
entry_block:
  %message = alloca i8*, align 8
  %val = alloca i1, align 1
  store i1 %0, i1* %val, align 1
  store i8* %1, i8** %message, align 8
  %val_variable_load = load i1, i1* %val, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2892, end: 2893, rendered-as: \22!\22 } })_call" = call i1 @"!"(i1 %val_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2892, end: 2893, rendered-as: \22!\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @global_str, i32 0, i32 0))
  %message_variable_load = load i8*, i8** %message, align 8
  call void @printf(i8* %message_variable_load)
  call void @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @global_str.11, i32 0, i32 0))
  call void @exit(i64 1)
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  ret void
}

define void @assertVerbose(i1 %0, i8* %1) {
entry_block:
  %message = alloca i8*, align 8
  %val = alloca i1, align 1
  store i1 %0, i1* %val, align 1
  store i8* %1, i8** %message, align 8
  %val_variable_load = load i1, i1* %val, align 1
  br i1 %val_variable_load, label %if_then_block, label %if_else_block

if_then_block:                                    ; preds = %entry_block
  call void @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @global_str.12, i32 0, i32 0))
  %message_variable_load = load i8*, i8** %message, align 8
  call void @printf(i8* %message_variable_load)
  call void @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @global_str.13, i32 0, i32 0))
  br label %if_cont_block

if_else_block:                                    ; preds = %entry_block
  call void @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @global_str.14, i32 0, i32 0))
  %message_variable_load1 = load i8*, i8** %message, align 8
  call void @printf(i8* %message_variable_load1)
  call void @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @global_str.15, i32 0, i32 0))
  call void @exit(i64 1)
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_else_block, %if_then_block
  ret void
}

define void @panic(i8* %0) {
entry_block:
  %message = alloca i8*, align 8
  store i8* %0, i8** %message, align 8
  call void @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_str.16, i32 0, i32 0))
  %message_variable_load = load i8*, i8** %message, align 8
  call void @printf(i8* %message_variable_load)
  call void @exit(i64 1)
  ret void
}

define void @panic.17() {
entry_block:
  call void @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_str.18, i32 0, i32 0))
  call void @exit(i64 1)
  ret void
}

define void @debugPrint(i8* %0) {
entry_block:
  %message = alloca i8*, align 8
  store i8* %0, i8** %message, align 8
  %message_variable_load = load i8*, i8** %message, align 8
  call void @printf(i8* %message_variable_load)
  ret void
}

declare void @printint(i64)

define i8* @"brackets-[-]"(i8* %0, i64 %1) {
entry_block:
  %index = alloca i64, align 8
  %str = alloca i8*, align 8
  store i8* %0, i8** %str, align 8
  store i64 %1, i64* %index, align 4
  %str_variable_load = load i8*, i8** %str, align 8
  %index_variable_load = load i64, i64* %index, align 4
  %asm_gep = getelementptr inbounds i8, i8* %str_variable_load, i64 %index_variable_load
  ret i8* %asm_gep
}

define i1 @"==.19"(i8* %0, i8* %1) {
entry_block:
  %b = alloca i8*, align 8
  %a = alloca i8*, align 8
  store i8* %0, i8** %a, align 8
  store i8* %1, i8** %b, align 8
  %a_variable_load = load i8*, i8** %a, align 8
  %b_variable_load = load i8*, i8** %b, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3675, end: 3681, rendered-as: \22strcmp\22 } })_call" = call i64 @strcmp(i8* %a_variable_load, i8* %b_variable_load)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3688, end: 3690, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3675, end: 3681, rendered-as: \22strcmp\22 } })_call", i64 0)
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3688, end: 3690, rendered-as: \22==\22 } })_call"
}

define i1 @"!=.20"(i8* %0, i8* %1) {
entry_block:
  %b = alloca i8*, align 8
  %a = alloca i8*, align 8
  store i8* %0, i8** %a, align 8
  store i8* %1, i8** %b, align 8
  %a_variable_load = load i8*, i8** %a, align 8
  %b_variable_load = load i8*, i8** %b, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3739, end: 3745, rendered-as: \22strcmp\22 } })_call" = call i64 @strcmp(i8* %a_variable_load, i8* %b_variable_load)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3752, end: 3754, rendered-as: \22!=\22 } })_call" = call i1 @"!="(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3739, end: 3745, rendered-as: \22strcmp\22 } })_call", i64 0)
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3752, end: 3754, rendered-as: \22!=\22 } })_call"
}

define i8* @copy(i8* %0) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %dupl = alloca i8*, align 8
  %str = alloca i8*, align 8
  store i8* %0, i8** %str, align 8
  %str_variable_load = load i8*, i8** %str, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3828, end: 3834, rendered-as: \22strlen\22 } })_call" = call i64 @strlen(i8* %str_variable_load)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3837, end: 3838, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3828, end: 3834, rendered-as: \22strlen\22 } })_call", i64 1)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3817, end: 3823, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3837, end: 3838, rendered-as: \22+\22 } })_call")
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3817, end: 3823, rendered-as: \22malloc\22 } })_call", i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %dupl, align 8
  %dupl_variable_load = load i8*, i8** %dupl, align 8
  %str_variable_load1 = load i8*, i8** %str, align 8
  call void @strcpy(i8* %dupl_variable_load, i8* %str_variable_load1)
  %dupl_variable_load2 = load i8*, i8** %dupl, align 8
  ret i8* %dupl_variable_load2
}

define i1 @contains(i8* %0, i8 %1) {
entry_block:
  %macro_arg_space5 = alloca i64, align 8
  %macro_arg_space1 = alloca i64, align 8
  %index = alloca i64, align 8
  %macro_arg_space = alloca i64, align 8
  %length = alloca i64, align 8
  %char = alloca i8, align 1
  %str = alloca i8*, align 8
  store i8* %0, i8** %str, align 8
  store i8 %1, i8* %char, align 1
  %str_variable_load = load i8*, i8** %str, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4210, end: 4216, rendered-as: \22strlen\22 } })_call" = call i64 @strlen(i8* %str_variable_load)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4210, end: 4216, rendered-as: \22strlen\22 } })_call", i64* %macro_arg_space, align 4
  %b_variable_load = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load, i64* %length, align 4
  store i64 0, i64* %macro_arg_space1, align 4
  %b_variable_load2 = load i64, i64* %macro_arg_space1, align 4
  store i64 %b_variable_load2, i64* %index, align 4
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %if_cont_block, %entry_block
  %index_variable_load = load i64, i64* %index, align 4
  %length_variable_load = load i64, i64* %length, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4256, end: 4258, rendered-as: \22!=\22 } })_call" = call i1 @"!="(i64 %index_variable_load, i64 %length_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4256, end: 4258, rendered-as: \22!=\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %str_variable_load3 = load i8*, i8** %str, align 8
  %index_variable_load4 = load i64, i64* %index, align 4
  %"Brackets(LexString { lexer: \22...\22, start: 4284, end: 4285, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 4290, end: 4291, rendered-as: \22]\22 })_call" = call i8* @"brackets-[-]"(i8* %str_variable_load3, i64 %index_variable_load4)
  %deref_load = load i8, i8* %"Brackets(LexString { lexer: \22...\22, start: 4284, end: 4285, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 4290, end: 4291, rendered-as: \22]\22 })_call", align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4293, end: 4295, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %deref_load, i8 %char_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4293, end: 4295, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  ret i1 false

if_then_block:                                    ; preds = %while_loop_body_basic_block
  ret i1 true
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %while_loop_body_basic_block
  %a_variable_load = load i64, i64* %index, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2297, end: 2298, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2297, end: 2298, rendered-as: \22+\22 } })_call", i64* %macro_arg_space5, align 4
  %b_variable_load6 = load i64, i64* %macro_arg_space5, align 4
  store i64 %b_variable_load6, i64* %index, align 4
  %a_variable_load7 = load i64, i64* %index, align 4
  br label %while_loop_cond_check_basic_block
}

define i1 @isNumeric(i8 %0) {
entry_block:
  %char = alloca i8, align 1
  store i8 %0, i8* %char, align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4417, end: 4419, rendered-as: \22>=\22 } })_call" = call i1 @">=.6"(i8 %char_variable_load, i8 48)
  %char_variable_load1 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4434, end: 4436, rendered-as: \22<=\22 } })_call" = call i1 @"<=.5"(i8 %char_variable_load1, i8 57)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4425, end: 4427, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4417, end: 4419, rendered-as: \22>=\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4434, end: 4436, rendered-as: \22<=\22 } })_call")
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4425, end: 4427, rendered-as: \22&&\22 } })_call"
}

define i1 @isAlpha(i8 %0) {
entry_block:
  %char = alloca i8, align 1
  store i8 %0, i8* %char, align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4483, end: 4485, rendered-as: \22>=\22 } })_call" = call i1 @">=.6"(i8 %char_variable_load, i8 65)
  %char_variable_load1 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4500, end: 4502, rendered-as: \22<=\22 } })_call" = call i1 @"<=.5"(i8 %char_variable_load1, i8 90)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4491, end: 4493, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4483, end: 4485, rendered-as: \22>=\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4500, end: 4502, rendered-as: \22<=\22 } })_call")
  %char_variable_load2 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4517, end: 4519, rendered-as: \22>=\22 } })_call" = call i1 @">=.6"(i8 %char_variable_load2, i8 97)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4508, end: 4510, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4491, end: 4493, rendered-as: \22&&\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4517, end: 4519, rendered-as: \22>=\22 } })_call")
  %char_variable_load3 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4534, end: 4536, rendered-as: \22<=\22 } })_call" = call i1 @"<=.5"(i8 %char_variable_load3, i8 122)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4525, end: 4527, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4508, end: 4510, rendered-as: \22||\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4534, end: 4536, rendered-as: \22<=\22 } })_call")
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4525, end: 4527, rendered-as: \22&&\22 } })_call"
}

define i1 @isAlphanumeric(i8 %0) {
entry_block:
  %char = alloca i8, align 1
  store i8 %0, i8* %char, align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4589, end: 4598, rendered-as: \22isNumeric\22 } })_call" = call i1 @isNumeric(i8 %char_variable_load)
  %char_variable_load1 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4609, end: 4616, rendered-as: \22isAlpha\22 } })_call" = call i1 @isAlpha(i8 %char_variable_load1)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4601, end: 4603, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4589, end: 4598, rendered-as: \22isNumeric\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4609, end: 4616, rendered-as: \22isAlpha\22 } })_call")
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4601, end: 4603, rendered-as: \22||\22 } })_call"
}

define i1 @isWhitespace(i8 %0) {
entry_block:
  %char = alloca i8, align 1
  store i8 %0, i8* %char, align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4666, end: 4674, rendered-as: \22contains\22 } })_call" = call i1 @contains(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @global_str.21, i32 0, i32 0), i8 %char_variable_load)
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4666, end: 4674, rendered-as: \22contains\22 } })_call"
}

define void @printRepeatedChar(i8 %0, i64 %1) {
entry_block:
  %macro_arg_space = alloca i64, align 8
  %repeat = alloca i64, align 8
  %char = alloca i8, align 1
  store i8 %0, i8* %char, align 1
  store i64 %1, i64* %repeat, align 4
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %while_loop_body_basic_block, %entry_block
  %repeat_variable_load = load i64, i64* %repeat, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4750, end: 4752, rendered-as: \22!=\22 } })_call" = call i1 @"!="(i64 %repeat_variable_load, i64 0)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4750, end: 4752, rendered-as: \22!=\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  call void @putchar(i8 32)
  %a_variable_load = load i64, i64* %repeat, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2352, end: 2353, rendered-as: \22-\22 } })_call" = call i64 @-(i64 %a_variable_load, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2352, end: 2353, rendered-as: \22-\22 } })_call", i64* %macro_arg_space, align 4
  %b_variable_load = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load, i64* %repeat, align 4
  %a_variable_load1 = load i64, i64* %repeat, align 4
  br label %while_loop_cond_check_basic_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  ret void
}

define void @printIndentation(i64 %0) {
entry_block:
  %indentation = alloca i64, align 8
  store i64 %0, i64* %indentation, align 4
  call void @putchar(i8 10)
  %indentation_variable_load = load i64, i64* %indentation, align 4
  call void @printRepeatedChar(i8 32, i64 %indentation_variable_load)
  ret void
}

define { i8*, i64, i64 } @"lexer#new"(i8* %0) {
entry_block:
  %macro_arg_space5 = alloca i64, align 8
  %macro_arg_space = alloca i64, align 8
  %lexer = alloca { i8*, i64, i64 }, align 8
  %input = alloca i8*, align 8
  store i8* %0, i8** %input, align 8
  %struct_gep = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer, i32 0, i32 1
  store i64 0, i64* %macro_arg_space, align 4
  %b_variable_load = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load, i64* %struct_gep, align 4
  %struct_gep1 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer, i32 0, i32 0
  %b_variable_load2 = load i8*, i8** %input, align 8
  store i8* %b_variable_load2, i8** %struct_gep1, align 8
  %struct_gep3 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer, i32 0, i32 2
  %struct_gep4 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer, i32 0, i32 0
  %struct_gep_deref = load i8*, i8** %struct_gep4, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5202, end: 5208, rendered-as: \22strlen\22 } })_call" = call i64 @strlen(i8* %struct_gep_deref)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5202, end: 5208, rendered-as: \22strlen\22 } })_call", i64* %macro_arg_space5, align 4
  %b_variable_load6 = load i64, i64* %macro_arg_space5, align 4
  store i64 %b_variable_load6, i64* %struct_gep3, align 4
  %lexer_variable_load = load { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer, align 8
  ret { i8*, i64, i64 } %lexer_variable_load
}

define { i8*, i64, i64 } @peek({ i8*, i64, i64 }* %0) {
entry_block:
  %dupl = alloca { i8*, i64, i64 }, align 8
  %lexer = alloca { i8*, i64, i64 }*, align 8
  store { i8*, i64, i64 }* %0, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %dupl, i32 0, i32 0
  %lexer_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep1 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load, i32 0, i32 0
  %b_variable_load = load i8*, i8** %struct_gep1, align 8
  store i8* %b_variable_load, i8** %struct_gep, align 8
  %struct_gep2 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %dupl, i32 0, i32 1
  %lexer_variable_load3 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep4 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load3, i32 0, i32 1
  %b_variable_load5 = load i64, i64* %struct_gep4, align 4
  store i64 %b_variable_load5, i64* %struct_gep2, align 4
  %struct_gep6 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %dupl, i32 0, i32 2
  %lexer_variable_load7 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep8 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load7, i32 0, i32 2
  %b_variable_load9 = load i64, i64* %struct_gep8, align 4
  store i64 %b_variable_load9, i64* %struct_gep6, align 4
  %dupl_variable_load = load { i8*, i64, i64 }, { i8*, i64, i64 }* %dupl, align 8
  ret { i8*, i64, i64 } %dupl_variable_load
}

define i8 @peekChar({ i8*, i64, i64 }* %0) {
entry_block:
  %lexer = alloca { i8*, i64, i64 }*, align 8
  store { i8*, i64, i64 }* %0, { i8*, i64, i64 }** %lexer, align 8
  %lexer_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load, i32 0, i32 1
  %struct_gep_deref = load i64, i64* %struct_gep, align 4
  %lexer_variable_load1 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep2 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load1, i32 0, i32 2
  %struct_gep_deref3 = load i64, i64* %struct_gep2, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5453, end: 5455, rendered-as: \22>=\22 } })_call" = call i1 @">="(i64 %struct_gep_deref, i64 %struct_gep_deref3)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5453, end: 5455, rendered-as: \22>=\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  ret i8 0
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %lexer_variable_load4 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep5 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load4, i32 0, i32 0
  %struct_gep_deref6 = load i8*, i8** %struct_gep5, align 8
  %lexer_variable_load7 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep8 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load7, i32 0, i32 1
  %struct_gep_deref9 = load i64, i64* %struct_gep8, align 4
  %"Brackets(LexString { lexer: \22...\22, start: 5525, end: 5526, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 5537, end: 5538, rendered-as: \22]\22 })_call" = call i8* @"brackets-[-]"(i8* %struct_gep_deref6, i64 %struct_gep_deref9)
  %deref_load = load i8, i8* %"Brackets(LexString { lexer: \22...\22, start: 5525, end: 5526, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 5537, end: 5538, rendered-as: \22]\22 })_call", align 1
  ret i8 %deref_load
}

define i8 @takeChar({ i8*, i64, i64 }* %0) {
entry_block:
  %macro_arg_space4 = alloca i64, align 8
  %macro_arg_space = alloca i8, align 1
  %a = alloca i8, align 1
  %lexer = alloca { i8*, i64, i64 }*, align 8
  store { i8*, i64, i64 }* %0, { i8*, i64, i64 }** %lexer, align 8
  %lexer_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5600, end: 5608, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load)
  store i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5600, end: 5608, rendered-as: \22peekChar\22 } })_call", i8* %macro_arg_space, align 1
  %b_variable_load = load i8, i8* %macro_arg_space, align 1
  store i8 %b_variable_load, i8* %a, align 1
  %lexer_variable_load1 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load1, i32 0, i32 1
  %lexer_variable_load2 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep3 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load2, i32 0, i32 1
  %struct_gep_deref = load i64, i64* %struct_gep3, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5642, end: 5643, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %struct_gep_deref, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5642, end: 5643, rendered-as: \22+\22 } })_call", i64* %macro_arg_space4, align 4
  %b_variable_load5 = load i64, i64* %macro_arg_space4, align 4
  store i64 %b_variable_load5, i64* %struct_gep, align 4
  %a_variable_load = load i8, i8* %a, align 1
  ret i8 %a_variable_load
}

define i1 @isEof({ i8*, i64, i64 }* %0) {
entry_block:
  %lexer = alloca { i8*, i64, i64 }*, align 8
  store { i8*, i64, i64 }* %0, { i8*, i64, i64 }** %lexer, align 8
  %lexer_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load, i32 0, i32 1
  %struct_gep_deref = load i64, i64* %struct_gep, align 4
  %lexer_variable_load1 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep2 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load1, i32 0, i32 2
  %struct_gep_deref3 = load i64, i64* %struct_gep2, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5704, end: 5706, rendered-as: \22>=\22 } })_call" = call i1 @">="(i64 %struct_gep_deref, i64 %struct_gep_deref3)
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5704, end: 5706, rendered-as: \22>=\22 } })_call"
}

define { { i8*, i64, i64 }*, i64, i64 } @"+.22"({ { i8*, i64, i64 }*, i64, i64 } %0, { { i8*, i64, i64 }*, i64, i64 } %1) {
entry_block:
  %macro_arg_space = alloca i64, align 8
  %result = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %b = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %a = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %0, { { i8*, i64, i64 }*, i64, i64 }* %a, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %1, { { i8*, i64, i64 }*, i64, i64 }* %b, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %a, i32 0, i32 1
  %struct_gep_deref = load i64, i64* %struct_gep, align 4
  %struct_gep1 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %a, i32 0, i32 2
  %struct_gep_deref2 = load i64, i64* %struct_gep1, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5904, end: 5905, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %struct_gep_deref, i64 %struct_gep_deref2)
  %struct_gep3 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %b, i32 0, i32 1
  %struct_gep_deref4 = load i64, i64* %struct_gep3, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5916, end: 5918, rendered-as: \22!=\22 } })_call" = call i1 @"!="(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5904, end: 5905, rendered-as: \22+\22 } })_call", i64 %struct_gep_deref4)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5916, end: 5918, rendered-as: \22!=\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @panic(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @global_str.23, i32 0, i32 0))
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %struct_gep5 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %result, i32 0, i32 1
  %struct_gep6 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %a, i32 0, i32 1
  %b_variable_load = load i64, i64* %struct_gep6, align 4
  store i64 %b_variable_load, i64* %struct_gep5, align 4
  %struct_gep7 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %result, i32 0, i32 2
  %struct_gep8 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %a, i32 0, i32 2
  %struct_gep_deref9 = load i64, i64* %struct_gep8, align 4
  %struct_gep10 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %b, i32 0, i32 2
  %struct_gep_deref11 = load i64, i64* %struct_gep10, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6199, end: 6200, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %struct_gep_deref9, i64 %struct_gep_deref11)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6199, end: 6200, rendered-as: \22+\22 } })_call", i64* %macro_arg_space, align 4
  %b_variable_load12 = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load12, i64* %struct_gep7, align 4
  %struct_gep13 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %result, i32 0, i32 0
  %struct_gep14 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %a, i32 0, i32 0
  %b_variable_load15 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep14, align 8
  store { i8*, i64, i64 }* %b_variable_load15, { i8*, i64, i64 }** %struct_gep13, align 8
  %result_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %result, align 8
  ret { { i8*, i64, i64 }*, i64, i64 } %result_variable_load
}

define { { i8*, i64, i64 }*, i64, i64 } @"lexstring#new"({ i8*, i64, i64 }* %0, i64 %1, i64 %2) {
entry_block:
  %macro_arg_space = alloca i64, align 8
  %lexstring = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %end = alloca i64, align 8
  %start = alloca i64, align 8
  %parent = alloca { i8*, i64, i64 }*, align 8
  store { i8*, i64, i64 }* %0, { i8*, i64, i64 }** %parent, align 8
  store i64 %1, i64* %start, align 4
  store i64 %2, i64* %end, align 4
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %lexstring, i32 0, i32 0
  %b_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %parent, align 8
  store { i8*, i64, i64 }* %b_variable_load, { i8*, i64, i64 }** %struct_gep, align 8
  %struct_gep1 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %lexstring, i32 0, i32 1
  %b_variable_load2 = load i64, i64* %start, align 4
  store i64 %b_variable_load2, i64* %struct_gep1, align 4
  %struct_gep3 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %lexstring, i32 0, i32 2
  %end_variable_load = load i64, i64* %end, align 4
  %start_variable_load = load i64, i64* %start, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6457, end: 6458, rendered-as: \22-\22 } })_call" = call i64 @-(i64 %end_variable_load, i64 %start_variable_load)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6457, end: 6458, rendered-as: \22-\22 } })_call", i64* %macro_arg_space, align 4
  %b_variable_load4 = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load4, i64* %struct_gep3, align 4
  %lexstring_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %lexstring, align 8
  ret { { i8*, i64, i64 }*, i64, i64 } %lexstring_variable_load
}

define i8* @render({ { i8*, i64, i64 }*, i64, i64 }* %0) {
entry_block:
  %macro_arg_space17 = alloca i8, align 1
  %macro_arg_space16 = alloca i8*, align 8
  %macro_arg_space = alloca i8*, align 8
  %str = alloca i8*, align 8
  %lexstring = alloca { { i8*, i64, i64 }*, i64, i64 }*, align 8
  store { { i8*, i64, i64 }*, i64, i64 }* %0, { { i8*, i64, i64 }*, i64, i64 }** %lexstring, align 8
  %lexstring_variable_load = load { { i8*, i64, i64 }*, i64, i64 }*, { { i8*, i64, i64 }*, i64, i64 }** %lexstring, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %lexstring_variable_load, i32 0, i32 2
  %struct_gep_deref = load i64, i64* %struct_gep, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6712, end: 6713, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %struct_gep_deref, i64 1)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6691, end: 6697, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6712, end: 6713, rendered-as: \22+\22 } })_call")
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6691, end: 6697, rendered-as: \22malloc\22 } })_call", i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %str, align 8
  %str_variable_load = load i8*, i8** %str, align 8
  %lexstring_variable_load1 = load { { i8*, i64, i64 }*, i64, i64 }*, { { i8*, i64, i64 }*, i64, i64 }** %lexstring, align 8
  %struct_gep2 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %lexstring_variable_load1, i32 0, i32 0
  %struct_gep_deref3 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep2, align 8
  %struct_gep4 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %struct_gep_deref3, i32 0, i32 0
  %struct_gep_deref5 = load i8*, i8** %struct_gep4, align 8
  %lexstring_variable_load6 = load { { i8*, i64, i64 }*, i64, i64 }*, { { i8*, i64, i64 }*, i64, i64 }** %lexstring, align 8
  %struct_gep7 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %lexstring_variable_load6, i32 0, i32 1
  %struct_gep_deref8 = load i64, i64* %struct_gep7, align 4
  %"Brackets(LexString { lexer: \22...\22, start: 6759, end: 6760, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 6776, end: 6777, rendered-as: \22]\22 })_call" = call i8* @"brackets-[-]"(i8* %struct_gep_deref5, i64 %struct_gep_deref8)
  %lexstring_variable_load9 = load { { i8*, i64, i64 }*, i64, i64 }*, { { i8*, i64, i64 }*, i64, i64 }** %lexstring, align 8
  %struct_gep10 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %lexstring_variable_load9, i32 0, i32 2
  %struct_gep_deref11 = load i64, i64* %struct_gep10, align 4
  call void @strncpy(i8* %str_variable_load, i8* %"Brackets(LexString { lexer: \22...\22, start: 6759, end: 6760, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 6776, end: 6777, rendered-as: \22]\22 })_call", i64 %struct_gep_deref11)
  %str_variable_load12 = load i8*, i8** %str, align 8
  %lexstring_variable_load13 = load { { i8*, i64, i64 }*, i64, i64 }*, { { i8*, i64, i64 }*, i64, i64 }** %lexstring, align 8
  %struct_gep14 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %lexstring_variable_load13, i32 0, i32 2
  %struct_gep_deref15 = load i64, i64* %struct_gep14, align 4
  %"Brackets(LexString { lexer: \22...\22, start: 6802, end: 6803, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 6816, end: 6817, rendered-as: \22]\22 })_call" = call i8* @"brackets-[-]"(i8* %str_variable_load12, i64 %struct_gep_deref15)
  store i8* %"Brackets(LexString { lexer: \22...\22, start: 6802, end: 6803, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 6816, end: 6817, rendered-as: \22]\22 })_call", i8** %macro_arg_space16, align 8
  store i8 0, i8* %macro_arg_space17, align 1
  %a_variable_load = load i8*, i8** %macro_arg_space16, align 8
  %b_variable_load18 = load i8, i8* %macro_arg_space17, align 1
  store i8 %b_variable_load18, i8* %a_variable_load, align 1
  %str_variable_load19 = load i8*, i8** %str, align 8
  ret i8* %str_variable_load19
}

define void @debugLexString({ { i8*, i64, i64 }*, i64, i64 }* %0, i64 %1) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %str = alloca i8*, align 8
  %indentation = alloca i64, align 8
  %val = alloca { { i8*, i64, i64 }*, i64, i64 }*, align 8
  store { { i8*, i64, i64 }*, i64, i64 }* %0, { { i8*, i64, i64 }*, i64, i64 }** %val, align 8
  store i64 %1, i64* %indentation, align 4
  %val_variable_load = load { { i8*, i64, i64 }*, i64, i64 }*, { { i8*, i64, i64 }*, i64, i64 }** %val, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6918, end: 6924, rendered-as: \22render\22 } })_call" = call i8* @render({ { i8*, i64, i64 }*, i64, i64 }* %val_variable_load)
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6918, end: 6924, rendered-as: \22render\22 } })_call", i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %str, align 8
  %indentation_variable_load = load i64, i64* %indentation, align 4
  call void @printIndentation(i64 %indentation_variable_load)
  %str_variable_load = load i8*, i8** %str, align 8
  call void @printf(i8* %str_variable_load)
  %str_variable_load1 = load i8*, i8** %str, align 8
  call void @free(i8* %str_variable_load1)
  ret void
}

define { { i8*, i64, i64 }*, i64, i64 } @takeNumber({ i8*, i64, i64 }* %0) {
entry_block:
  %macro_arg_space15 = alloca i1, align 1
  %macro_arg_space11 = alloca i64, align 8
  %macro_arg_space6 = alloca i1, align 1
  %first_dot = alloca i1, align 1
  %macro_arg_space = alloca i64, align 8
  %string = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %lexer = alloca { i8*, i64, i64 }*, align 8
  store { i8*, i64, i64 }* %0, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 1
  %lexer_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep1 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load, i32 0, i32 1
  %b_variable_load = load i64, i64* %struct_gep1, align 4
  store i64 %b_variable_load, i64* %struct_gep, align 4
  %struct_gep2 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  store i64 0, i64* %macro_arg_space, align 4
  %b_variable_load3 = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load3, i64* %struct_gep2, align 4
  %struct_gep4 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 0
  %b_variable_load5 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  store { i8*, i64, i64 }* %b_variable_load5, { i8*, i64, i64 }** %struct_gep4, align 8
  store i1 true, i1* %macro_arg_space6, align 1
  %b_variable_load7 = load i1, i1* %macro_arg_space6, align 1
  store i1 %b_variable_load7, i1* %first_dot, align 1
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %if_cont_block, %entry_block
  %lexer_variable_load8 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7276, end: 7284, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load8)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7287, end: 7296, rendered-as: \22isNumeric\22 } })_call" = call i1 @isNumeric(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7276, end: 7284, rendered-as: \22peekChar\22 } })_call")
  %lexer_variable_load9 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7310, end: 7318, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load9)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7321, end: 7323, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7310, end: 7318, rendered-as: \22peekChar\22 } })_call", i8 46)
  %first_dot_variable_load = load i1, i1* %first_dot, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7329, end: 7331, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7321, end: 7323, rendered-as: \22==\22 } })_call", i1 %first_dot_variable_load)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7299, end: 7301, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7287, end: 7296, rendered-as: \22isNumeric\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7329, end: 7331, rendered-as: \22&&\22 } })_call")
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7299, end: 7301, rendered-as: \22||\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %struct_gep10 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load = load i64, i64* %struct_gep10, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2297, end: 2298, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2297, end: 2298, rendered-as: \22+\22 } })_call", i64* %macro_arg_space11, align 4
  %b_variable_load12 = load i64, i64* %macro_arg_space11, align 4
  store i64 %b_variable_load12, i64* %struct_gep10, align 4
  %a_variable_load13 = load i64, i64* %struct_gep10, align 4
  %lexer_variable_load14 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7387, end: 7395, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load14)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7398, end: 7400, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7387, end: 7395, rendered-as: \22takeChar\22 } })_call", i8 46)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7398, end: 7400, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %string_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  ret { { i8*, i64, i64 }*, i64, i64 } %string_variable_load

if_then_block:                                    ; preds = %while_loop_body_basic_block
  store i1 false, i1* %macro_arg_space15, align 1
  %b_variable_load16 = load i1, i1* %macro_arg_space15, align 1
  store i1 %b_variable_load16, i1* %first_dot, align 1
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %while_loop_body_basic_block
  br label %while_loop_cond_check_basic_block
}

define i1 @isConventionalId(i8 %0, i1 %1) {
entry_block:
  %first = alloca i1, align 1
  %char = alloca i8, align 1
  store i8 %0, i8* %char, align 1
  store i1 %1, i1* %first, align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7505, end: 7512, rendered-as: \22isAlpha\22 } })_call" = call i1 @isAlpha(i8 %char_variable_load)
  %char_variable_load1 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7524, end: 7533, rendered-as: \22isNumeric\22 } })_call" = call i1 @isNumeric(i8 %char_variable_load1)
  %first_variable_load = load i1, i1* %first, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7539, end: 7540, rendered-as: \22!\22 } })_call" = call i1 @"!"(i1 %first_variable_load)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7536, end: 7538, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7524, end: 7533, rendered-as: \22isNumeric\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7539, end: 7540, rendered-as: \22!\22 } })_call")
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7515, end: 7517, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7505, end: 7512, rendered-as: \22isAlpha\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7536, end: 7538, rendered-as: \22&&\22 } })_call")
  %char_variable_load2 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7556, end: 7558, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %char_variable_load2, i8 95)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7547, end: 7549, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7515, end: 7517, rendered-as: \22||\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7556, end: 7558, rendered-as: \22==\22 } })_call")
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7547, end: 7549, rendered-as: \22||\22 } })_call"
}

define i1 @isSpecialId(i8 %0) {
entry_block:
  %char = alloca i8, align 1
  store i8 %0, i8* %char, align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7619, end: 7627, rendered-as: \22contains\22 } })_call" = call i1 @contains(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @global_str.24, i32 0, i32 0), i8 %char_variable_load)
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7619, end: 7627, rendered-as: \22contains\22 } })_call"
}

define { { i8*, i64, i64 }*, i64, i64 } @takeIdentifier({ i8*, i64, i64 }* %0) {
entry_block:
  %macro_arg_space27 = alloca i64, align 8
  %macro_arg_space14 = alloca i1, align 1
  %macro_arg_space10 = alloca i64, align 8
  %macro_arg_space6 = alloca i1, align 1
  %first = alloca i1, align 1
  %macro_arg_space = alloca i64, align 8
  %string = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %lexer = alloca { i8*, i64, i64 }*, align 8
  store { i8*, i64, i64 }* %0, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 1
  %lexer_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep1 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load, i32 0, i32 1
  %b_variable_load = load i64, i64* %struct_gep1, align 4
  store i64 %b_variable_load, i64* %struct_gep, align 4
  %struct_gep2 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  store i64 0, i64* %macro_arg_space, align 4
  %b_variable_load3 = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load3, i64* %struct_gep2, align 4
  %struct_gep4 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 0
  %b_variable_load5 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  store { i8*, i64, i64 }* %b_variable_load5, { i8*, i64, i64 }** %struct_gep4, align 8
  store i1 true, i1* %macro_arg_space6, align 1
  %b_variable_load7 = load i1, i1* %macro_arg_space6, align 1
  store i1 %b_variable_load7, i1* %first, align 1
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %if_cont_block, %entry_block
  %lexer_variable_load8 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7838, end: 7846, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load8)
  %first_variable_load = load i1, i1* %first, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7849, end: 7865, rendered-as: \22isConventionalId\22 } })_call" = call i1 @isConventionalId(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7838, end: 7846, rendered-as: \22peekChar\22 } })_call", i1 %first_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7849, end: 7865, rendered-as: \22isConventionalId\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %struct_gep9 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load = load i64, i64* %struct_gep9, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2297, end: 2298, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2297, end: 2298, rendered-as: \22+\22 } })_call", i64* %macro_arg_space10, align 4
  %b_variable_load11 = load i64, i64* %macro_arg_space10, align 4
  store i64 %b_variable_load11, i64* %struct_gep9, align 4
  %a_variable_load12 = load i64, i64* %struct_gep9, align 4
  %first_variable_load13 = load i1, i1* %first, align 1
  br i1 %first_variable_load13, label %if_then_block, label %if_cont_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %struct_gep17 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %struct_gep_deref = load i64, i64* %struct_gep17, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8023, end: 8025, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref, i64 0)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8023, end: 8025, rendered-as: \22==\22 } })_call", label %if_then_block18, label %if_cont_block19

if_then_block:                                    ; preds = %while_loop_body_basic_block
  store i1 false, i1* %macro_arg_space14, align 1
  %b_variable_load15 = load i1, i1* %macro_arg_space14, align 1
  store i1 %b_variable_load15, i1* %first, align 1
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %while_loop_body_basic_block
  %lexer_variable_load16 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7984, end: 7992, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load16)
  br label %while_loop_cond_check_basic_block

if_then_block18:                                  ; preds = %while_loop_cont_basic_block
  br label %while_loop_cond_check_basic_block20

if_cont_block19:                                  ; preds = %while_loop_cont_basic_block22, %while_loop_cont_basic_block
  %string_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  ret { { i8*, i64, i64 }*, i64, i64 } %string_variable_load

while_loop_cond_check_basic_block20:              ; preds = %while_loop_body_basic_block21, %if_then_block18
  %lexer_variable_load23 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8050, end: 8058, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load23)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8061, end: 8072, rendered-as: \22isSpecialId\22 } })_call" = call i1 @isSpecialId(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8050, end: 8058, rendered-as: \22peekChar\22 } })_call")
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8061, end: 8072, rendered-as: \22isSpecialId\22 } })_call", label %while_loop_body_basic_block21, label %while_loop_cont_basic_block22

while_loop_body_basic_block21:                    ; preds = %while_loop_cond_check_basic_block20
  %struct_gep24 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load25 = load i64, i64* %struct_gep24, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2297, end: 2298, rendered-as: \22+\22 } })_call26" = call i64 @"+"(i64 %a_variable_load25, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2297, end: 2298, rendered-as: \22+\22 } })_call26", i64* %macro_arg_space27, align 4
  %b_variable_load28 = load i64, i64* %macro_arg_space27, align 4
  store i64 %b_variable_load28, i64* %struct_gep24, align 4
  %a_variable_load29 = load i64, i64* %struct_gep24, align 4
  %lexer_variable_load30 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8160, end: 8168, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load30)
  br label %while_loop_cond_check_basic_block20

while_loop_cont_basic_block22:                    ; preds = %while_loop_cond_check_basic_block20
  br label %if_cont_block19
}

define { { i8*, i64, i64 }*, i64, i64 } @takeOnlyWhitespace({ i8*, i64, i64 }* %0) {
entry_block:
  %macro_arg_space8 = alloca i64, align 8
  %macro_arg_space = alloca i64, align 8
  %string = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %lexer = alloca { i8*, i64, i64 }*, align 8
  store { i8*, i64, i64 }* %0, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 1
  %lexer_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep1 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load, i32 0, i32 1
  %b_variable_load = load i64, i64* %struct_gep1, align 4
  store i64 %b_variable_load, i64* %struct_gep, align 4
  %struct_gep2 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  store i64 0, i64* %macro_arg_space, align 4
  %b_variable_load3 = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load3, i64* %struct_gep2, align 4
  %struct_gep4 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 0
  %b_variable_load5 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  store { i8*, i64, i64 }* %b_variable_load5, { i8*, i64, i64 }** %struct_gep4, align 8
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %while_loop_body_basic_block, %entry_block
  %lexer_variable_load6 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8388, end: 8396, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load6)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8399, end: 8411, rendered-as: \22isWhitespace\22 } })_call" = call i1 @isWhitespace(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8388, end: 8396, rendered-as: \22peekChar\22 } })_call")
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8399, end: 8411, rendered-as: \22isWhitespace\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %struct_gep7 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load = load i64, i64* %struct_gep7, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2297, end: 2298, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2297, end: 2298, rendered-as: \22+\22 } })_call", i64* %macro_arg_space8, align 4
  %b_variable_load9 = load i64, i64* %macro_arg_space8, align 4
  store i64 %b_variable_load9, i64* %struct_gep7, align 4
  %a_variable_load10 = load i64, i64* %struct_gep7, align 4
  %lexer_variable_load11 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8455, end: 8463, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load11)
  br label %while_loop_cond_check_basic_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %string_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  ret { { i8*, i64, i64 }*, i64, i64 } %string_variable_load
}

define { { i8*, i64, i64 }*, i64, i64 } @takeComment({ i8*, i64, i64 }* %0) {
entry_block:
  %macro_arg_space65 = alloca i64, align 8
  %macro_arg_space59 = alloca i64, align 8
  %macro_arg_space55 = alloca i64, align 8
  %macro_arg_space41 = alloca i64, align 8
  %macro_arg_space37 = alloca i64, align 8
  %macro_arg_space28 = alloca i64, align 8
  %macro_arg_space22 = alloca i64, align 8
  %macro_arg_space20 = alloca i64, align 8
  %macro_arg_space13 = alloca i8, align 1
  %c = alloca i8, align 1
  %macro_arg_space10 = alloca { i8*, i64, i64 }*, align 8
  %peeked = alloca { i8*, i64, i64 }*, align 8
  %macro_arg_space8 = alloca { i8*, i64, i64 }, align 8
  %peeked_ = alloca { i8*, i64, i64 }, align 8
  %macro_arg_space = alloca i64, align 8
  %string = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %lexer = alloca { i8*, i64, i64 }*, align 8
  store { i8*, i64, i64 }* %0, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 1
  %lexer_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep1 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load, i32 0, i32 1
  %b_variable_load = load i64, i64* %struct_gep1, align 4
  store i64 %b_variable_load, i64* %struct_gep, align 4
  %struct_gep2 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  store i64 0, i64* %macro_arg_space, align 4
  %b_variable_load3 = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load3, i64* %struct_gep2, align 4
  %struct_gep4 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 0
  %b_variable_load5 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  store { i8*, i64, i64 }* %b_variable_load5, { i8*, i64, i64 }** %struct_gep4, align 8
  %lexer_variable_load6 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8658, end: 8666, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load6)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8669, end: 8671, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8658, end: 8666, rendered-as: \22peekChar\22 } })_call", i8 47)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8669, end: 8671, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  %lexer_variable_load7 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8709, end: 8713, rendered-as: \22peek\22 } })_call" = call { i8*, i64, i64 } @peek({ i8*, i64, i64 }* %lexer_variable_load7)
  store { i8*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8709, end: 8713, rendered-as: \22peek\22 } })_call", { i8*, i64, i64 }* %macro_arg_space8, align 8
  %b_variable_load9 = load { i8*, i64, i64 }, { i8*, i64, i64 }* %macro_arg_space8, align 8
  store { i8*, i64, i64 } %b_variable_load9, { i8*, i64, i64 }* %peeked_, align 8
  store { i8*, i64, i64 }* %peeked_, { i8*, i64, i64 }** %macro_arg_space10, align 8
  %b_variable_load11 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %macro_arg_space10, align 8
  store { i8*, i64, i64 }* %b_variable_load11, { i8*, i64, i64 }** %peeked, align 8
  %peeked_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %peeked, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8767, end: 8775, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %peeked_variable_load)
  %peeked_variable_load12 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %peeked, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8802, end: 8810, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %peeked_variable_load12)
  store i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8802, end: 8810, rendered-as: \22peekChar\22 } })_call", i8* %macro_arg_space13, align 1
  %b_variable_load14 = load i8, i8* %macro_arg_space13, align 1
  store i8 %b_variable_load14, i8* %c, align 1
  %c_variable_load = load i8, i8* %c, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8827, end: 8829, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %c_variable_load, i8 47)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8827, end: 8829, rendered-as: \22==\22 } })_call", label %if_then_block15, label %if_else_block

if_cont_block:                                    ; preds = %if_cont_block16, %entry_block
  %string_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  ret { { i8*, i64, i64 }*, i64, i64 } %string_variable_load

if_then_block15:                                  ; preds = %if_then_block
  %lexer_variable_load17 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8854, end: 8862, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load17)
  %lexer_variable_load18 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8884, end: 8892, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load18)
  %struct_gep19 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  store i64 2, i64* %macro_arg_space20, align 4
  %a_variable_load = load i64, i64* %struct_gep19, align 4
  %b_variable_load21 = load i64, i64* %macro_arg_space20, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 %b_variable_load21)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call", i64* %macro_arg_space22, align 4
  %b_variable_load23 = load i64, i64* %macro_arg_space22, align 4
  store i64 %b_variable_load23, i64* %struct_gep19, align 4
  %a_variable_load24 = load i64, i64* %struct_gep19, align 4
  br label %while_loop_cond_check_basic_block

if_else_block:                                    ; preds = %if_then_block
  %c_variable_load31 = load i8, i8* %c, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9043, end: 9045, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %c_variable_load31, i8 42)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9043, end: 9045, rendered-as: \22==\22 } })_call", label %if_then_block32, label %if_cont_block33

if_cont_block16:                                  ; preds = %if_cont_block33, %while_loop_cont_basic_block
  br label %if_cont_block

while_loop_cond_check_basic_block:                ; preds = %while_loop_body_basic_block, %if_then_block15
  %lexer_variable_load25 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8954, end: 8962, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load25)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8965, end: 8967, rendered-as: \22!=\22 } })_call" = call i1 @"!=.2"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8954, end: 8962, rendered-as: \22takeChar\22 } })_call", i8 10)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8965, end: 8967, rendered-as: \22!=\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %struct_gep26 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load27 = load i64, i64* %struct_gep26, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2297, end: 2298, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load27, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2297, end: 2298, rendered-as: \22+\22 } })_call", i64* %macro_arg_space28, align 4
  %b_variable_load29 = load i64, i64* %macro_arg_space28, align 4
  store i64 %b_variable_load29, i64* %struct_gep26, align 4
  %a_variable_load30 = load i64, i64* %struct_gep26, align 4
  br label %while_loop_cond_check_basic_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  br label %if_cont_block16

if_then_block32:                                  ; preds = %if_else_block
  %lexer_variable_load34 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9070, end: 9078, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load34)
  %lexer_variable_load35 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9100, end: 9108, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load35)
  %struct_gep36 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  store i64 2, i64* %macro_arg_space37, align 4
  %a_variable_load38 = load i64, i64* %struct_gep36, align 4
  %b_variable_load39 = load i64, i64* %macro_arg_space37, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call40" = call i64 @"+"(i64 %a_variable_load38, i64 %b_variable_load39)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call40", i64* %macro_arg_space41, align 4
  %b_variable_load42 = load i64, i64* %macro_arg_space41, align 4
  store i64 %b_variable_load42, i64* %struct_gep36, align 4
  %a_variable_load43 = load i64, i64* %struct_gep36, align 4
  br label %while_loop_cond_check_basic_block44

if_cont_block33:                                  ; preds = %while_loop_cont_basic_block46, %if_else_block
  br label %if_cont_block16

while_loop_cond_check_basic_block44:              ; preds = %if_cont_block49, %if_then_block32
  br i1 true, label %while_loop_body_basic_block45, label %while_loop_cont_basic_block46

while_loop_body_basic_block45:                    ; preds = %while_loop_cond_check_basic_block44
  %lexer_variable_load47 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9196, end: 9204, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load47)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9207, end: 9209, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9196, end: 9204, rendered-as: \22takeChar\22 } })_call", i8 42)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9207, end: 9209, rendered-as: \22==\22 } })_call", label %if_then_block48, label %if_cont_block49

while_loop_cont_basic_block46:                    ; preds = %if_then_block51, %while_loop_cond_check_basic_block44
  br label %if_cont_block33

if_then_block48:                                  ; preds = %while_loop_body_basic_block45
  %lexer_variable_load50 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9245, end: 9253, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load50)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9256, end: 9258, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9245, end: 9253, rendered-as: \22peekChar\22 } })_call", i8 47)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9256, end: 9258, rendered-as: \22==\22 } })_call", label %if_then_block51, label %if_cont_block52

if_cont_block49:                                  ; preds = %if_cont_block52, %while_loop_body_basic_block45
  %struct_gep62 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load63 = load i64, i64* %struct_gep62, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2297, end: 2298, rendered-as: \22+\22 } })_call64" = call i64 @"+"(i64 %a_variable_load63, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2297, end: 2298, rendered-as: \22+\22 } })_call64", i64* %macro_arg_space65, align 4
  %b_variable_load66 = load i64, i64* %macro_arg_space65, align 4
  store i64 %b_variable_load66, i64* %struct_gep62, align 4
  %a_variable_load67 = load i64, i64* %struct_gep62, align 4
  br label %while_loop_cond_check_basic_block44

if_then_block51:                                  ; preds = %if_then_block48
  %lexer_variable_load53 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9299, end: 9307, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load53)
  %struct_gep54 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  store i64 2, i64* %macro_arg_space55, align 4
  %a_variable_load56 = load i64, i64* %struct_gep54, align 4
  %b_variable_load57 = load i64, i64* %macro_arg_space55, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call58" = call i64 @"+"(i64 %a_variable_load56, i64 %b_variable_load57)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call58", i64* %macro_arg_space59, align 4
  %b_variable_load60 = load i64, i64* %macro_arg_space59, align 4
  store i64 %b_variable_load60, i64* %struct_gep54, align 4
  %a_variable_load61 = load i64, i64* %struct_gep54, align 4
  br label %while_loop_cont_basic_block46
  br label %if_cont_block52

if_cont_block52:                                  ; preds = %if_then_block51, %if_then_block48
  br label %if_cont_block49
}

define { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %0) {
entry_block:
  %macro_arg_space13 = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %macro_arg_space9 = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %macro_arg_space5 = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %macro_arg_space3 = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %macro_arg_space = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %string = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %lexer = alloca { i8*, i64, i64 }*, align 8
  store { i8*, i64, i64 }* %0, { i8*, i64, i64 }** %lexer, align 8
  %lexer_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9599, end: 9617, rendered-as: \22takeOnlyWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeOnlyWhitespace({ i8*, i64, i64 }* %lexer_variable_load)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9599, end: 9617, rendered-as: \22takeOnlyWhitespace\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  %b_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %while_loop_body_basic_block, %entry_block
  %lexer_variable_load1 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9637, end: 9645, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load1)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9648, end: 9650, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9637, end: 9645, rendered-as: \22peekChar\22 } })_call", i8 47)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9648, end: 9650, rendered-as: \22==\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %lexer_variable_load2 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9681, end: 9692, rendered-as: \22takeComment\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeComment({ i8*, i64, i64 }* %lexer_variable_load2)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9681, end: 9692, rendered-as: \22takeComment\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space3, align 8
  %a_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  %b_variable_load4 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space3, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @"+.22"({ { i8*, i64, i64 }*, i64, i64 } %a_variable_load, { { i8*, i64, i64 }*, i64, i64 } %b_variable_load4)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space5, align 8
  %b_variable_load6 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space5, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load6, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  %a_variable_load7 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  %lexer_variable_load8 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9720, end: 9738, rendered-as: \22takeOnlyWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeOnlyWhitespace({ i8*, i64, i64 }* %lexer_variable_load8)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9720, end: 9738, rendered-as: \22takeOnlyWhitespace\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space9, align 8
  %a_variable_load10 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  %b_variable_load11 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space9, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call12" = call { { i8*, i64, i64 }*, i64, i64 } @"+.22"({ { i8*, i64, i64 }*, i64, i64 } %a_variable_load10, { { i8*, i64, i64 }*, i64, i64 } %b_variable_load11)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call12", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space13, align 8
  %b_variable_load14 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space13, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load14, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  %a_variable_load15 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  br label %while_loop_cond_check_basic_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %string_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  ret { { i8*, i64, i64 }*, i64, i64 } %string_variable_load
}

define { { i8*, i64, i64 }*, i64, i64 } @require({ i8*, i64, i64 }* %0, i8 %1) {
entry_block:
  %macro_arg_space = alloca i64, align 8
  %string = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %char = alloca i8, align 1
  %lexer = alloca { i8*, i64, i64 }*, align 8
  store { i8*, i64, i64 }* %0, { i8*, i64, i64 }** %lexer, align 8
  store i8 %1, i8* %char, align 1
  %lexer_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9842, end: 9856, rendered-as: \22takeWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %lexer_variable_load)
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 1
  %lexer_variable_load1 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep2 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load1, i32 0, i32 1
  %b_variable_load = load i64, i64* %struct_gep2, align 4
  store i64 %b_variable_load, i64* %struct_gep, align 4
  %struct_gep3 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 0
  %b_variable_load4 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  store { i8*, i64, i64 }* %b_variable_load4, { i8*, i64, i64 }** %struct_gep3, align 8
  %struct_gep5 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  store i64 1, i64* %macro_arg_space, align 4
  %b_variable_load6 = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load6, i64* %struct_gep5, align 4
  %lexer_variable_load7 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9991, end: 9999, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load7)
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10002, end: 10004, rendered-as: \22!=\22 } })_call" = call i1 @"!=.2"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9991, end: 9999, rendered-as: \22takeChar\22 } })_call", i8 %char_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10002, end: 10004, rendered-as: \22!=\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @global_str.25, i32 0, i32 0))
  %char_variable_load8 = load i8, i8* %char, align 1
  call void @putchar(i8 %char_variable_load8)
  call void @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @global_str.26, i32 0, i32 0))
  %char_variable_load9 = load i8, i8* %char, align 1
  call void @putchar(i8 %char_variable_load9)
  call void @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @global_str.27, i32 0, i32 0))
  call void @panic(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @global_str.28, i32 0, i32 0))
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %string_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  ret { { i8*, i64, i64 }*, i64, i64 } %string_variable_load
}

define { { i8*, i64, i64 }*, i64, i64 } @require.29({ i8*, i64, i64 }* %0, i8* %1) {
entry_block:
  %macro_arg_space = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %string = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %str = alloca i8*, align 8
  %lexer = alloca { i8*, i64, i64 }*, align 8
  store { i8*, i64, i64 }* %0, { i8*, i64, i64 }** %lexer, align 8
  store i8* %1, i8** %str, align 8
  %lexer_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10277, end: 10291, rendered-as: \22takeWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %lexer_variable_load)
  %lexer_variable_load1 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10330, end: 10344, rendered-as: \22takeIdentifier\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeIdentifier({ i8*, i64, i64 }* %lexer_variable_load1)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10330, end: 10344, rendered-as: \22takeIdentifier\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  %b_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10366, end: 10372, rendered-as: \22render\22 } })_call" = call i8* @render({ { i8*, i64, i64 }*, i64, i64 }* %string)
  %str_variable_load = load i8*, i8** %str, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10375, end: 10377, rendered-as: \22!=\22 } })_call" = call i1 @"!=.20"(i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10366, end: 10372, rendered-as: \22render\22 } })_call", i8* %str_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10375, end: 10377, rendered-as: \22!=\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @global_str.30, i32 0, i32 0))
  %str_variable_load2 = load i8*, i8** %str, align 8
  call void @printf(i8* %str_variable_load2)
  call void @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @global_str.31, i32 0, i32 0))
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10495, end: 10501, rendered-as: \22render\22 } })_call" = call i8* @render({ { i8*, i64, i64 }*, i64, i64 }* %string)
  call void @printf(i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10495, end: 10501, rendered-as: \22render\22 } })_call")
  call void @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @global_str.32, i32 0, i32 0))
  call void @panic(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @global_str.33, i32 0, i32 0))
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %string_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  ret { { i8*, i64, i64 }*, i64, i64 } %string_variable_load
}

define { { i8*, i64, i64 }* } @"parser#new"({ i8*, i64, i64 }* %0) {
entry_block:
  %parser = alloca { { i8*, i64, i64 }* }, align 8
  %lexer = alloca { i8*, i64, i64 }*, align 8
  store { i8*, i64, i64 }* %0, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser, i32 0, i32 0
  %b_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  store { i8*, i64, i64 }* %b_variable_load, { i8*, i64, i64 }** %struct_gep, align 8
  %parser_variable_load = load { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser, align 8
  ret { { i8*, i64, i64 }* } %parser_variable_load
}

define void @debugExprType(i64* %0, i64 %1) {
entry_block:
  %indentation = alloca i64, align 8
  %val = alloca i64*, align 8
  store i64* %0, i64** %val, align 8
  store i64 %1, i64* %indentation, align 4
  %indentation_variable_load = load i64, i64* %indentation, align 4
  call void @printIndentation(i64 %indentation_variable_load)
  %val_variable_load = load i64*, i64** %val, align 8
  %deref_load = load i64, i64* %val_variable_load, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12791, end: 12793, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %deref_load, i64 1)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12791, end: 12793, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_else_block

if_then_block:                                    ; preds = %entry_block
  call void @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @global_str.34, i32 0, i32 0))
  br label %if_cont_block

if_else_block:                                    ; preds = %entry_block
  %val_variable_load1 = load i64*, i64** %val, align 8
  %deref_load2 = load i64, i64* %val_variable_load1, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12866, end: 12868, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %deref_load2, i64 2)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12866, end: 12868, rendered-as: \22==\22 } })_call", label %if_then_block3, label %if_else_block4

if_cont_block:                                    ; preds = %if_cont_block5, %if_then_block
  ret void

if_then_block3:                                   ; preds = %if_else_block
  call void @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @global_str.35, i32 0, i32 0))
  br label %if_cont_block5

if_else_block4:                                   ; preds = %if_else_block
  %val_variable_load6 = load i64*, i64** %val, align 8
  %deref_load7 = load i64, i64* %val_variable_load6, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12949, end: 12951, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %deref_load7, i64 3)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12949, end: 12951, rendered-as: \22==\22 } })_call", label %if_then_block8, label %if_else_block9

if_cont_block5:                                   ; preds = %if_cont_block10, %if_then_block3
  br label %if_cont_block

if_then_block8:                                   ; preds = %if_else_block4
  call void @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @global_str.36, i32 0, i32 0))
  br label %if_cont_block10

if_else_block9:                                   ; preds = %if_else_block4
  %val_variable_load11 = load i64*, i64** %val, align 8
  %deref_load12 = load i64, i64* %val_variable_load11, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13022, end: 13024, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %deref_load12, i64 4)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13022, end: 13024, rendered-as: \22==\22 } })_call", label %if_then_block13, label %if_else_block14

if_cont_block10:                                  ; preds = %if_cont_block15, %if_then_block8
  br label %if_cont_block5

if_then_block13:                                  ; preds = %if_else_block9
  call void @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @global_str.37, i32 0, i32 0))
  br label %if_cont_block15

if_else_block14:                                  ; preds = %if_else_block9
  %val_variable_load16 = load i64*, i64** %val, align 8
  %deref_load17 = load i64, i64* %val_variable_load16, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13097, end: 13099, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %deref_load17, i64 5)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13097, end: 13099, rendered-as: \22==\22 } })_call", label %if_then_block18, label %if_else_block19

if_cont_block15:                                  ; preds = %if_cont_block20, %if_then_block13
  br label %if_cont_block10

if_then_block18:                                  ; preds = %if_else_block14
  call void @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @global_str.38, i32 0, i32 0))
  br label %if_cont_block20

if_else_block19:                                  ; preds = %if_else_block14
  %val_variable_load21 = load i64*, i64** %val, align 8
  %deref_load22 = load i64, i64* %val_variable_load21, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13164, end: 13166, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %deref_load22, i64 6)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13164, end: 13166, rendered-as: \22==\22 } })_call", label %if_then_block23, label %if_else_block24

if_cont_block20:                                  ; preds = %if_cont_block25, %if_then_block18
  br label %if_cont_block15

if_then_block23:                                  ; preds = %if_else_block19
  call void @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @global_str.39, i32 0, i32 0))
  br label %if_cont_block25

if_else_block24:                                  ; preds = %if_else_block19
  call void @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @global_str.40, i32 0, i32 0))
  br label %if_cont_block25

if_cont_block25:                                  ; preds = %if_else_block24, %if_then_block23
  br label %if_cont_block20
}

define { i8*, i64 } @parseExpr({ { i8*, i64, i64 }* }* %0) {
entry_block:
  %expr = alloca { i8*, i64 }, align 8
  %macro_arg_space44 = alloca { i8*, i64 }, align 8
  %e43 = alloca { i8*, i64 }, align 8
  %macro_arg_space41 = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, align 8
  %ba = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, align 8
  %macro_arg_space33 = alloca { i8*, i64 }, align 8
  %e = alloca { i8*, i64 }, align 8
  %macro_arg_space20 = alloca i8*, align 8
  %next = alloca i8*, align 8
  %macro_arg_space18 = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %nextTok = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %macro_arg_space16 = alloca { i8*, i64, i64 }*, align 8
  %peeked = alloca { i8*, i64, i64 }*, align 8
  %macro_arg_space14 = alloca { i8*, i64, i64 }, align 8
  %peeked_ = alloca { i8*, i64, i64 }, align 8
  %macro_arg_space = alloca i8, align 1
  %next_char = alloca i8, align 1
  %parser = alloca { { i8*, i64, i64 }* }*, align 8
  store { { i8*, i64, i64 }* }* %0, { { i8*, i64, i64 }* }** %parser, align 8
  call void @debugPrint(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @global_str.89, i32 0, i32 0))
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load, i32 0, i32 0
  %struct_gep_deref = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22517, end: 22531, rendered-as: \22takeWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %struct_gep_deref)
  %parser_variable_load1 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep2 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load1, i32 0, i32 0
  %struct_gep_deref3 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep2, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22569, end: 22577, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %struct_gep_deref3)
  store i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22569, end: 22577, rendered-as: \22peekChar\22 } })_call", i8* %macro_arg_space, align 1
  %b_variable_load = load i8, i8* %macro_arg_space, align 1
  store i8 %b_variable_load, i8* %next_char, align 1
  %next_char_variable_load = load i8, i8* %next_char, align 1
  call void @putchar(i8 %next_char_variable_load)
  %next_char_variable_load4 = load i8, i8* %next_char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22683, end: 22692, rendered-as: \22isNumeric\22 } })_call" = call i1 @isNumeric(i8 %next_char_variable_load4)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22683, end: 22692, rendered-as: \22isNumeric\22 } })_call", label %if_then_block, label %if_else_block

if_then_block:                                    ; preds = %entry_block
  %parser_variable_load5 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22712, end: 22727, rendered-as: \22parseNumberExpr\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, i64 } @parseNumberExpr({ { i8*, i64, i64 }* }* %parser_variable_load5)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22730, end: 22736, rendered-as: \22asExpr\22 } })_call" = call { i8*, i64 } @asExpr({ { { i8*, i64, i64 }*, i64, i64 }, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22712, end: 22727, rendered-as: \22parseNumberExpr\22 } })_call")
  br label %if_cont_block

if_else_block:                                    ; preds = %entry_block
  %next_char_variable_load6 = load i8, i8* %next_char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22764, end: 22780, rendered-as: \22isConventionalId\22 } })_call" = call i1 @isConventionalId(i8 %next_char_variable_load6, i1 true)
  %next_char_variable_load7 = load i8, i8* %next_char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22800, end: 22811, rendered-as: \22isSpecialId\22 } })_call" = call i1 @isSpecialId(i8 %next_char_variable_load7)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22787, end: 22789, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22764, end: 22780, rendered-as: \22isConventionalId\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22800, end: 22811, rendered-as: \22isSpecialId\22 } })_call")
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22787, end: 22789, rendered-as: \22||\22 } })_call", label %if_then_block8, label %if_else_block9

if_cont_block:                                    ; preds = %if_cont_block10, %if_then_block
  %if_phi56 = phi { i8*, i64 } [ %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22730, end: 22736, rendered-as: \22asExpr\22 } })_call", %if_then_block ], [ %if_phi55, %if_cont_block10 ]
  ret { i8*, i64 } %if_phi56

if_then_block8:                                   ; preds = %if_else_block
  %parser_variable_load11 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep12 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load11, i32 0, i32 0
  %struct_gep_deref13 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep12, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22856, end: 22860, rendered-as: \22peek\22 } })_call" = call { i8*, i64, i64 } @peek({ i8*, i64, i64 }* %struct_gep_deref13)
  store { i8*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22856, end: 22860, rendered-as: \22peek\22 } })_call", { i8*, i64, i64 }* %macro_arg_space14, align 8
  %b_variable_load15 = load { i8*, i64, i64 }, { i8*, i64, i64 }* %macro_arg_space14, align 8
  store { i8*, i64, i64 } %b_variable_load15, { i8*, i64, i64 }* %peeked_, align 8
  store { i8*, i64, i64 }* %peeked_, { i8*, i64, i64 }** %macro_arg_space16, align 8
  %b_variable_load17 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %macro_arg_space16, align 8
  store { i8*, i64, i64 }* %b_variable_load17, { i8*, i64, i64 }** %peeked, align 8
  %peeked_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %peeked, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22936, end: 22950, rendered-as: \22takeIdentifier\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeIdentifier({ i8*, i64, i64 }* %peeked_variable_load)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22936, end: 22950, rendered-as: \22takeIdentifier\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space18, align 8
  %b_variable_load19 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space18, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load19, { { i8*, i64, i64 }*, i64, i64 }* %nextTok, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22985, end: 22991, rendered-as: \22render\22 } })_call" = call i8* @render({ { i8*, i64, i64 }*, i64, i64 }* %nextTok)
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22985, end: 22991, rendered-as: \22render\22 } })_call", i8** %macro_arg_space20, align 8
  %b_variable_load21 = load i8*, i8** %macro_arg_space20, align 8
  store i8* %b_variable_load21, i8** %next, align 8
  %next_variable_load = load i8*, i8** %next, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23021, end: 23023, rendered-as: \22==\22 } })_call" = call i1 @"==.19"(i8* %next_variable_load, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @global_str.90, i32 0, i32 0))
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23021, end: 23023, rendered-as: \22==\22 } })_call", label %if_then_block22, label %if_else_block23

if_else_block9:                                   ; preds = %if_else_block
  %next_char_variable_load36 = load i8, i8* %next_char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23235, end: 23237, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %next_char_variable_load36, i8 123)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23235, end: 23237, rendered-as: \22==\22 } })_call", label %if_then_block37, label %if_else_block38

if_cont_block10:                                  ; preds = %if_cont_block39, %if_cont_block24
  %if_phi55 = phi { i8*, i64 } [ %e_variable_load, %if_cont_block24 ], [ %if_phi54, %if_cont_block39 ]
  br label %if_cont_block

if_then_block22:                                  ; preds = %if_then_block8
  %parser_variable_load25 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23037, end: 23048, rendered-as: \22parseIfExpr\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } } @parseIfExpr({ { i8*, i64, i64 }* }* %parser_variable_load25)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23051, end: 23057, rendered-as: \22asExpr\22 } })_call" = call { i8*, i64 } @asExpr.80({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23037, end: 23048, rendered-as: \22parseIfExpr\22 } })_call")
  br label %if_cont_block24

if_else_block23:                                  ; preds = %if_then_block8
  %next_variable_load26 = load i8*, i8** %next, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23082, end: 23084, rendered-as: \22==\22 } })_call" = call i1 @"==.19"(i8* %next_variable_load26, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @global_str.91, i32 0, i32 0))
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23082, end: 23084, rendered-as: \22==\22 } })_call", label %if_then_block27, label %if_else_block28

if_cont_block24:                                  ; preds = %if_cont_block29, %if_then_block22
  %if_phi32 = phi { i8*, i64 } [ %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23051, end: 23057, rendered-as: \22asExpr\22 } })_call", %if_then_block22 ], [ %if_phi, %if_cont_block29 ]
  store { i8*, i64 } %if_phi32, { i8*, i64 }* %macro_arg_space33, align 8
  %b_variable_load34 = load { i8*, i64 }, { i8*, i64 }* %macro_arg_space33, align 8
  store { i8*, i64 } %b_variable_load34, { i8*, i64 }* %e, align 8
  %next_variable_load35 = load i8*, i8** %next, align 8
  call void @free(i8* %next_variable_load35)
  %e_variable_load = load { i8*, i64 }, { i8*, i64 }* %e, align 8
  br label %if_cont_block10

if_then_block27:                                  ; preds = %if_else_block23
  %parser_variable_load30 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23101, end: 23115, rendered-as: \22parseWhileExpr\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } } @parseWhileExpr({ { i8*, i64, i64 }* }* %parser_variable_load30)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23118, end: 23124, rendered-as: \22asExpr\22 } })_call" = call { i8*, i64 } @asExpr.87({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23101, end: 23115, rendered-as: \22parseWhileExpr\22 } })_call")
  br label %if_cont_block29

if_else_block28:                                  ; preds = %if_else_block23
  %parser_variable_load31 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23149, end: 23168, rendered-as: \22parseIdentifierExpr\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 } } @parseIdentifierExpr({ { i8*, i64, i64 }* }* %parser_variable_load31)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23171, end: 23177, rendered-as: \22asExpr\22 } })_call" = call { i8*, i64 } @asExpr.52({ { { i8*, i64, i64 }*, i64, i64 } } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23149, end: 23168, rendered-as: \22parseIdentifierExpr\22 } })_call")
  br label %if_cont_block29

if_cont_block29:                                  ; preds = %if_else_block28, %if_then_block27
  %if_phi = phi { i8*, i64 } [ %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23118, end: 23124, rendered-as: \22asExpr\22 } })_call", %if_then_block27 ], [ %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23171, end: 23177, rendered-as: \22asExpr\22 } })_call", %if_else_block28 ]
  br label %if_cont_block24

if_then_block37:                                  ; preds = %if_else_block9
  %parser_variable_load40 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23275, end: 23289, rendered-as: \22parseBlockExpr\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } @parseBlockExpr({ { i8*, i64, i64 }* }* %parser_variable_load40)
  store { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23275, end: 23289, rendered-as: \22parseBlockExpr\22 } })_call", { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %macro_arg_space41, align 8
  %b_variable_load42 = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %macro_arg_space41, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } %b_variable_load42, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %ba, align 8
  %ba_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %ba, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23314, end: 23320, rendered-as: \22asExpr\22 } })_call" = call { i8*, i64 } @asExpr.65({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } %ba_variable_load)
  store { i8*, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23314, end: 23320, rendered-as: \22asExpr\22 } })_call", { i8*, i64 }* %macro_arg_space44, align 8
  %b_variable_load45 = load { i8*, i64 }, { i8*, i64 }* %macro_arg_space44, align 8
  store { i8*, i64 } %b_variable_load45, { i8*, i64 }* %e43, align 8
  %e_variable_load46 = load { i8*, i64 }, { i8*, i64 }* %e43, align 8
  br label %if_cont_block39

if_else_block38:                                  ; preds = %if_else_block9
  %next_char_variable_load47 = load i8, i8* %next_char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23358, end: 23360, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %next_char_variable_load47, i8 34)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23358, end: 23360, rendered-as: \22==\22 } })_call", label %if_then_block48, label %if_else_block49

if_cont_block39:                                  ; preds = %if_cont_block50, %if_then_block37
  %if_phi54 = phi { i8*, i64 } [ %e_variable_load46, %if_then_block37 ], [ %if_phi53, %if_cont_block50 ]
  br label %if_cont_block10

if_then_block48:                                  ; preds = %if_else_block38
  %parser_variable_load51 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23380, end: 23395, rendered-as: \22parseStringExpr\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, i8* } @parseStringExpr({ { i8*, i64, i64 }* }* %parser_variable_load51)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23398, end: 23404, rendered-as: \22asExpr\22 } })_call" = call { i8*, i64 } @asExpr.72({ { { i8*, i64, i64 }*, i64, i64 }, i8* } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23380, end: 23395, rendered-as: \22parseStringExpr\22 } })_call")
  br label %if_cont_block50

if_else_block49:                                  ; preds = %if_else_block38
  call void @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @global_str.92, i32 0, i32 0))
  %next_char_variable_load52 = load i8, i8* %next_char, align 1
  call void @putchar(i8 %next_char_variable_load52)
  call void @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @global_str.93, i32 0, i32 0))
  call void @panic.17()
  %expr_variable_load = load { i8*, i64 }, { i8*, i64 }* %expr, align 8
  br label %if_cont_block50

if_cont_block50:                                  ; preds = %if_else_block49, %if_then_block48
  %if_phi53 = phi { i8*, i64 } [ %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 23398, end: 23404, rendered-as: \22asExpr\22 } })_call", %if_then_block48 ], [ %expr_variable_load, %if_else_block49 ]
  br label %if_cont_block39
}

define void @debugBlockExpr({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %0, i64 %1) {
entry_block:
  %macro_arg_space7 = alloca i64, align 8
  %macro_arg_space = alloca i64, align 8
  %i = alloca i64, align 8
  %exprs = alloca { i64, i64, { i8*, i64 }* }, align 8
  %indentation = alloca i64, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %0, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %val, align 8
  store i64 %1, i64* %indentation, align 4
  %indentation_variable_load = load i64, i64* %indentation, align 4
  call void @printIndentation(i64 %indentation_variable_load)
  %val_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %val, align 8
  %struct_gep = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %val_variable_load, i32 0, i32 1
  %b_variable_load = load { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %struct_gep, align 8
  store { i64, i64, { i8*, i64 }* } %b_variable_load, { i64, i64, { i8*, i64 }* }* %exprs, align 8
  call void @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @global_str.54, i32 0, i32 0))
  store i64 0, i64* %macro_arg_space, align 4
  %b_variable_load1 = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load1, i64* %i, align 4
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %while_loop_body_basic_block, %entry_block
  %i_variable_load = load i64, i64* %i, align 4
  %struct_gep2 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %exprs, i32 0, i32 0
  %struct_gep_deref = load i64, i64* %struct_gep2, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16619, end: 16620, rendered-as: \22<\22 } })_call" = call i1 @"<"(i64 %i_variable_load, i64 %struct_gep_deref)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16619, end: 16620, rendered-as: \22<\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %val_variable_load3 = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %val, align 8
  %struct_gep4 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %val_variable_load3, i32 0, i32 1
  %i_variable_load5 = load i64, i64* %i, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16670, end: 16673, rendered-as: \22get\22 } })_call" = call { i8*, i64 }* @get({ i64, i64, { i8*, i64 }* }* %struct_gep4, i64 %i_variable_load5)
  %indentation_variable_load6 = load i64, i64* %indentation, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16697, end: 16698, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %indentation_variable_load6, i64 2)
  call void @debugExpr({ i8*, i64 }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16670, end: 16673, rendered-as: \22get\22 } })_call", i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16697, end: 16698, rendered-as: \22+\22 } })_call")
  %a_variable_load = load i64, i64* %i, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2297, end: 2298, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2297, end: 2298, rendered-as: \22+\22 } })_call", i64* %macro_arg_space7, align 4
  %b_variable_load8 = load i64, i64* %macro_arg_space7, align 4
  store i64 %b_variable_load8, i64* %i, align 4
  %a_variable_load9 = load i64, i64* %i, align 4
  br label %while_loop_cond_check_basic_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %indentation_variable_load10 = load i64, i64* %indentation, align 4
  call void @printIndentation(i64 %indentation_variable_load10)
  call void @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @global_str.55, i32 0, i32 0))
  %val_variable_load11 = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %val, align 8
  %struct_gep12 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %val_variable_load11, i32 0, i32 2
  %struct_gep_deref13 = load i1, i1* %struct_gep12, align 1
  br i1 %struct_gep_deref13, label %if_then_block, label %if_else_block

if_then_block:                                    ; preds = %while_loop_cont_basic_block
  br label %if_cont_block

if_else_block:                                    ; preds = %while_loop_cont_basic_block
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_else_block, %if_then_block
  %if_phi = phi i8* [ getelementptr inbounds ([5 x i8], [5 x i8]* @global_str.56, i32 0, i32 0), %if_then_block ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @global_str.57, i32 0, i32 0), %if_else_block ]
  call void @printf(i8* %if_phi)
  ret void
}

define void @debugIdentifierExpr({ { { i8*, i64, i64 }*, i64, i64 } }* %0, i64 %1) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %id = alloca i8*, align 8
  %indentation = alloca i64, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 } }*, align 8
  store { { { i8*, i64, i64 }*, i64, i64 } }* %0, { { { i8*, i64, i64 }*, i64, i64 } }** %val, align 8
  store i64 %1, i64* %indentation, align 4
  %indentation_variable_load = load i64, i64* %indentation, align 4
  call void @printIndentation(i64 %indentation_variable_load)
  call void @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @global_str.47, i32 0, i32 0))
  %val_variable_load = load { { { i8*, i64, i64 }*, i64, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 } }** %val, align 8
  %struct_gep = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* %val_variable_load, i32 0, i32 0
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15602, end: 15608, rendered-as: \22render\22 } })_call" = call i8* @render({ { i8*, i64, i64 }*, i64, i64 }* %struct_gep)
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15602, end: 15608, rendered-as: \22render\22 } })_call", i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %id, align 8
  %id_variable_load = load i8*, i8** %id, align 8
  call void @printf(i8* %id_variable_load)
  %id_variable_load1 = load i8*, i8** %id, align 8
  call void @free(i8* %id_variable_load1)
  call void @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @global_str.48, i32 0, i32 0))
  ret void
}

define void @debugNumberExpr({ { { i8*, i64, i64 }*, i64, i64 }, i64 }* %0, i64 %1) {
entry_block:
  %indentation = alloca i64, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, i64 }*, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %0, { { { i8*, i64, i64 }*, i64, i64 }, i64 }** %val, align 8
  store i64 %1, i64* %indentation, align 4
  %val_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, i64 }*, { { { i8*, i64, i64 }*, i64, i64 }, i64 }** %val, align 8
  %struct_gep = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, i64 }, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %val_variable_load, i32 0, i32 0
  %indentation_variable_load = load i64, i64* %indentation, align 4
  call void @debugLexString({ { i8*, i64, i64 }*, i64, i64 }* %struct_gep, i64 %indentation_variable_load)
  ret void
}

define void @debugStringExpr({ { { i8*, i64, i64 }*, i64, i64 }, i8* }* %0, i64 %1) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %id = alloca i8*, align 8
  %indentation = alloca i64, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, i8* }*, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, i8* }* %0, { { { i8*, i64, i64 }*, i64, i64 }, i8* }** %val, align 8
  store i64 %1, i64* %indentation, align 4
  %indentation_variable_load = load i64, i64* %indentation, align 4
  call void @printIndentation(i64 %indentation_variable_load)
  %val_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, i8* }*, { { { i8*, i64, i64 }*, i64, i64 }, i8* }** %val, align 8
  %struct_gep = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, i8* }, { { { i8*, i64, i64 }*, i64, i64 }, i8* }* %val_variable_load, i32 0, i32 0
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18767, end: 18773, rendered-as: \22render\22 } })_call" = call i8* @render({ { i8*, i64, i64 }*, i64, i64 }* %struct_gep)
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18767, end: 18773, rendered-as: \22render\22 } })_call", i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %id, align 8
  %id_variable_load = load i8*, i8** %id, align 8
  call void @printf(i8* %id_variable_load)
  %id_variable_load1 = load i8*, i8** %id, align 8
  call void @free(i8* %id_variable_load1)
  ret void
}

define void @debugIfExpr({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %0, i64 %1) {
entry_block:
  %indentation = alloca i64, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }*, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %0, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }** %val, align 8
  store i64 %1, i64* %indentation, align 4
  %indentation_variable_load = load i64, i64* %indentation, align 4
  call void @printIndentation(i64 %indentation_variable_load)
  call void @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @global_str.74, i32 0, i32 0))
  %val_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }** %val, align 8
  %struct_gep = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %val_variable_load, i32 0, i32 1
  %indentation_variable_load1 = load i64, i64* %indentation, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20259, end: 20260, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %indentation_variable_load1, i64 2)
  call void @debugExpr({ i8*, i64 }* %struct_gep, i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20259, end: 20260, rendered-as: \22+\22 } })_call")
  %indentation_variable_load2 = load i64, i64* %indentation, align 4
  call void @printIndentation(i64 %indentation_variable_load2)
  call void @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @global_str.75, i32 0, i32 0))
  %val_variable_load3 = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }** %val, align 8
  %struct_gep4 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %val_variable_load3, i32 0, i32 2
  %indentation_variable_load5 = load i64, i64* %indentation, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20361, end: 20362, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %indentation_variable_load5, i64 2)
  call void @debugExpr({ i8*, i64 }* %struct_gep4, i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20361, end: 20362, rendered-as: \22+\22 } })_call")
  %val_variable_load6 = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }** %val, align 8
  %struct_gep7 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %val_variable_load6, i32 0, i32 3
  %struct_gep_deref = load i1, i1* %struct_gep7, align 1
  br i1 %struct_gep_deref, label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  %indentation_variable_load8 = load i64, i64* %indentation, align 4
  call void @printIndentation(i64 %indentation_variable_load8)
  call void @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @global_str.76, i32 0, i32 0))
  %val_variable_load9 = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }** %val, align 8
  %struct_gep10 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %val_variable_load9, i32 0, i32 4
  %indentation_variable_load11 = load i64, i64* %indentation, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20493, end: 20494, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %indentation_variable_load11, i64 2)
  call void @debugExpr({ i8*, i64 }* %struct_gep10, i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20493, end: 20494, rendered-as: \22+\22 } })_call")
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  ret void
}

define void @debugWhileExpr({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %0, i64 %1) {
entry_block:
  %indentation = alloca i64, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }*, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %0, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }** %val, align 8
  store i64 %1, i64* %indentation, align 4
  %indentation_variable_load = load i64, i64* %indentation, align 4
  call void @printIndentation(i64 %indentation_variable_load)
  call void @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_str.82, i32 0, i32 0))
  %val_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }** %val, align 8
  %struct_gep = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %val_variable_load, i32 0, i32 1
  %indentation_variable_load1 = load i64, i64* %indentation, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21727, end: 21728, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %indentation_variable_load1, i64 2)
  call void @debugExpr({ i8*, i64 }* %struct_gep, i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21727, end: 21728, rendered-as: \22+\22 } })_call")
  %indentation_variable_load2 = load i64, i64* %indentation, align 4
  call void @printIndentation(i64 %indentation_variable_load2)
  call void @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @global_str.83, i32 0, i32 0))
  %val_variable_load3 = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }** %val, align 8
  %struct_gep4 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %val_variable_load3, i32 0, i32 2
  %indentation_variable_load5 = load i64, i64* %indentation, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21827, end: 21828, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %indentation_variable_load5, i64 2)
  call void @debugExpr({ i8*, i64 }* %struct_gep4, i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21827, end: 21828, rendered-as: \22+\22 } })_call")
  ret void
}

define void @debugExpr({ i8*, i64 }* %0, i64 %1) {
entry_block:
  %indentation = alloca i64, align 8
  %val = alloca { i8*, i64 }*, align 8
  store { i8*, i64 }* %0, { i8*, i64 }** %val, align 8
  store i64 %1, i64* %indentation, align 4
  %val_variable_load = load { i8*, i64 }*, { i8*, i64 }** %val, align 8
  %struct_gep = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %val_variable_load, i32 0, i32 1
  %indentation_variable_load = load i64, i64* %indentation, align 4
  call void @debugExprType(i64* %struct_gep, i64 %indentation_variable_load)
  %val_variable_load1 = load { i8*, i64 }*, { i8*, i64 }** %val, align 8
  %struct_gep2 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %val_variable_load1, i32 0, i32 1
  %struct_gep_deref = load i64, i64* %struct_gep2, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13884, end: 13886, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref, i64 3)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13884, end: 13886, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_else_block

if_then_block:                                    ; preds = %entry_block
  %val_variable_load3 = load { i8*, i64 }*, { i8*, i64 }** %val, align 8
  %struct_gep4 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %val_variable_load3, i32 0, i32 0
  %struct_gep_deref5 = load i8*, i8** %struct_gep4, align 8
  %bitcast = bitcast i8* %struct_gep_deref5 to { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*
  %indentation_variable_load6 = load i64, i64* %indentation, align 4
  call void @debugBlockExpr({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %bitcast, i64 %indentation_variable_load6)
  br label %if_cont_block

if_else_block:                                    ; preds = %entry_block
  %val_variable_load7 = load { i8*, i64 }*, { i8*, i64 }** %val, align 8
  %struct_gep8 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %val_variable_load7, i32 0, i32 1
  %struct_gep_deref9 = load i64, i64* %struct_gep8, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13994, end: 13996, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref9, i64 2)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13994, end: 13996, rendered-as: \22==\22 } })_call", label %if_then_block10, label %if_else_block11

if_cont_block:                                    ; preds = %if_cont_block12, %if_then_block
  ret void

if_then_block10:                                  ; preds = %if_else_block
  %val_variable_load13 = load { i8*, i64 }*, { i8*, i64 }** %val, align 8
  %struct_gep14 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %val_variable_load13, i32 0, i32 0
  %struct_gep_deref15 = load i8*, i8** %struct_gep14, align 8
  %bitcast16 = bitcast i8* %struct_gep_deref15 to { { { i8*, i64, i64 }*, i64, i64 } }*
  %indentation_variable_load17 = load i64, i64* %indentation, align 4
  call void @debugIdentifierExpr({ { { i8*, i64, i64 }*, i64, i64 } }* %bitcast16, i64 %indentation_variable_load17)
  br label %if_cont_block12

if_else_block11:                                  ; preds = %if_else_block
  %val_variable_load18 = load { i8*, i64 }*, { i8*, i64 }** %val, align 8
  %struct_gep19 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %val_variable_load18, i32 0, i32 1
  %struct_gep_deref20 = load i64, i64* %struct_gep19, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14119, end: 14121, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref20, i64 1)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14119, end: 14121, rendered-as: \22==\22 } })_call", label %if_then_block21, label %if_else_block22

if_cont_block12:                                  ; preds = %if_cont_block23, %if_then_block10
  br label %if_cont_block

if_then_block21:                                  ; preds = %if_else_block11
  %val_variable_load24 = load { i8*, i64 }*, { i8*, i64 }** %val, align 8
  %struct_gep25 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %val_variable_load24, i32 0, i32 0
  %struct_gep_deref26 = load i8*, i8** %struct_gep25, align 8
  %bitcast27 = bitcast i8* %struct_gep_deref26 to { { { i8*, i64, i64 }*, i64, i64 }, i64 }*
  %indentation_variable_load28 = load i64, i64* %indentation, align 4
  call void @debugNumberExpr({ { { i8*, i64, i64 }*, i64, i64 }, i64 }* %bitcast27, i64 %indentation_variable_load28)
  br label %if_cont_block23

if_else_block22:                                  ; preds = %if_else_block11
  %val_variable_load29 = load { i8*, i64 }*, { i8*, i64 }** %val, align 8
  %struct_gep30 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %val_variable_load29, i32 0, i32 1
  %struct_gep_deref31 = load i64, i64* %struct_gep30, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14232, end: 14234, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref31, i64 4)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14232, end: 14234, rendered-as: \22==\22 } })_call", label %if_then_block32, label %if_else_block33

if_cont_block23:                                  ; preds = %if_cont_block34, %if_then_block21
  br label %if_cont_block12

if_then_block32:                                  ; preds = %if_else_block22
  %val_variable_load35 = load { i8*, i64 }*, { i8*, i64 }** %val, align 8
  %struct_gep36 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %val_variable_load35, i32 0, i32 0
  %struct_gep_deref37 = load i8*, i8** %struct_gep36, align 8
  %bitcast38 = bitcast i8* %struct_gep_deref37 to { { { i8*, i64, i64 }*, i64, i64 }, i8* }*
  %indentation_variable_load39 = load i64, i64* %indentation, align 4
  call void @debugStringExpr({ { { i8*, i64, i64 }*, i64, i64 }, i8* }* %bitcast38, i64 %indentation_variable_load39)
  br label %if_cont_block34

if_else_block33:                                  ; preds = %if_else_block22
  %val_variable_load40 = load { i8*, i64 }*, { i8*, i64 }** %val, align 8
  %struct_gep41 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %val_variable_load40, i32 0, i32 1
  %struct_gep_deref42 = load i64, i64* %struct_gep41, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14345, end: 14347, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref42, i64 5)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14345, end: 14347, rendered-as: \22==\22 } })_call", label %if_then_block43, label %if_else_block44

if_cont_block34:                                  ; preds = %if_cont_block45, %if_then_block32
  br label %if_cont_block23

if_then_block43:                                  ; preds = %if_else_block33
  %val_variable_load46 = load { i8*, i64 }*, { i8*, i64 }** %val, align 8
  %struct_gep47 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %val_variable_load46, i32 0, i32 0
  %struct_gep_deref48 = load i8*, i8** %struct_gep47, align 8
  %bitcast49 = bitcast i8* %struct_gep_deref48 to { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }*
  %indentation_variable_load50 = load i64, i64* %indentation, align 4
  call void @debugIfExpr({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %bitcast49, i64 %indentation_variable_load50)
  br label %if_cont_block45

if_else_block44:                                  ; preds = %if_else_block33
  %val_variable_load51 = load { i8*, i64 }*, { i8*, i64 }** %val, align 8
  %struct_gep52 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %val_variable_load51, i32 0, i32 1
  %struct_gep_deref53 = load i64, i64* %struct_gep52, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14446, end: 14448, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref53, i64 6)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14446, end: 14448, rendered-as: \22==\22 } })_call", label %if_then_block54, label %if_else_block55

if_cont_block45:                                  ; preds = %if_cont_block56, %if_then_block43
  br label %if_cont_block34

if_then_block54:                                  ; preds = %if_else_block44
  %val_variable_load57 = load { i8*, i64 }*, { i8*, i64 }** %val, align 8
  %struct_gep58 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %val_variable_load57, i32 0, i32 0
  %struct_gep_deref59 = load i8*, i8** %struct_gep58, align 8
  %bitcast60 = bitcast i8* %struct_gep_deref59 to { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }*
  %indentation_variable_load61 = load i64, i64* %indentation, align 4
  call void @debugWhileExpr({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %bitcast60, i64 %indentation_variable_load61)
  br label %if_cont_block56

if_else_block55:                                  ; preds = %if_else_block44
  call void @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @global_str.41, i32 0, i32 0))
  br label %if_cont_block56

if_cont_block56:                                  ; preds = %if_else_block55, %if_then_block54
  br label %if_cont_block45
}

define void @drop({ i8*, i64 } %0) {
entry_block:
  %expr = alloca { i8*, i64 }, align 8
  store { i8*, i64 } %0, { i8*, i64 }* %expr, align 8
  %struct_gep = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 0
  %struct_gep_deref = load i8*, i8** %struct_gep, align 8
  call void @free(i8* %struct_gep_deref)
  ret void
}

declare void @debugNumberExpr.42({ { { i8*, i64, i64 }*, i64, i64 }, i64 }*, i64)

define { { { i8*, i64, i64 }*, i64, i64 }, i64 } @parseNumberExpr({ { i8*, i64, i64 }* }* %0) {
entry_block:
  %expr = alloca { { { i8*, i64, i64 }*, i64, i64 }, i64 }, align 8
  %macro_arg_space = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %number = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %parser = alloca { { i8*, i64, i64 }* }*, align 8
  store { { i8*, i64, i64 }* }* %0, { { i8*, i64, i64 }* }** %parser, align 8
  call void @debugPrint(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @global_str.43, i32 0, i32 0))
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load, i32 0, i32 0
  %struct_gep_deref = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14899, end: 14909, rendered-as: \22takeNumber\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeNumber({ i8*, i64, i64 }* %struct_gep_deref)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14899, end: 14909, rendered-as: \22takeNumber\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  %b_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load, { { i8*, i64, i64 }*, i64, i64 }* %number, align 8
  %struct_gep1 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %number, i32 0, i32 2
  %struct_gep_deref2 = load i64, i64* %struct_gep1, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14932, end: 14934, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref2, i64 0)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14932, end: 14934, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @panic(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @global_str.44, i32 0, i32 0))
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %struct_gep3 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, i64 }, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %expr, i32 0, i32 0
  %b_variable_load4 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %number, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load4, { { i8*, i64, i64 }*, i64, i64 }* %struct_gep3, align 8
  %expr_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, i64 }, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %expr, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 }, i64 } %expr_variable_load
}

define { { { i8*, i64, i64 }*, i64, i64 }, i64 }* @copy.45({ { { i8*, i64, i64 }*, i64, i64 }, i64 } %0) {
entry_block:
  %macro_arg_space = alloca { { { i8*, i64, i64 }*, i64, i64 }, i64 }*, align 8
  %data = alloca { { { i8*, i64, i64 }*, i64, i64 }, i64 }*, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, i64 }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, i64 } %0, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %val, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15133, end: 15139, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 }, i64 }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 }, i64 }, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* null, i32 1) to i64))
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15133, end: 15139, rendered-as: \22malloc\22 } })_call" to { { { i8*, i64, i64 }*, i64, i64 }, i64 }*
  store { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %bitcast, { { { i8*, i64, i64 }*, i64, i64 }, i64 }** %macro_arg_space, align 8
  %b_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, i64 }*, { { { i8*, i64, i64 }*, i64, i64 }, i64 }** %macro_arg_space, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %b_variable_load, { { { i8*, i64, i64 }*, i64, i64 }, i64 }** %data, align 8
  %data_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, i64 }*, { { { i8*, i64, i64 }*, i64, i64 }, i64 }** %data, align 8
  %bitcast1 = bitcast { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %data_variable_load to i8*
  %bitcast2 = bitcast { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %val to i8*
  call void @memcpy(i8* %bitcast1, i8* %bitcast2, i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 }, i64 }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 }, i64 }, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* null, i32 1) to i64))
  %data_variable_load3 = load { { { i8*, i64, i64 }*, i64, i64 }, i64 }*, { { { i8*, i64, i64 }*, i64, i64 }, i64 }** %data, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %data_variable_load3
}

define { i8*, i64 } @asExpr({ { { i8*, i64, i64 }*, i64, i64 }, i64 } %0) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %expr = alloca { i8*, i64 }, align 8
  %number = alloca { { { i8*, i64, i64 }*, i64, i64 }, i64 }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, i64 } %0, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %number, align 8
  %struct_gep = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 1
  store i64 1, i64* %struct_gep, align 4
  %struct_gep1 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 0
  %number_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, i64 }, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %number, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15415, end: 15419, rendered-as: \22copy\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, i64 }* @copy.45({ { { i8*, i64, i64 }*, i64, i64 }, i64 } %number_variable_load)
  %bitcast = bitcast { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15415, end: 15419, rendered-as: \22copy\22 } })_call" to i8*
  store i8* %bitcast, i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %struct_gep1, align 8
  %expr_variable_load = load { i8*, i64 }, { i8*, i64 }* %expr, align 8
  ret { i8*, i64 } %expr_variable_load
}

declare void @debugIdentifierExpr.46({ { { i8*, i64, i64 }*, i64, i64 } }*, i64)

define { { { i8*, i64, i64 }*, i64, i64 } } @parseIdentifierExpr({ { i8*, i64, i64 }* }* %0) {
entry_block:
  %expr = alloca { { { i8*, i64, i64 }*, i64, i64 } }, align 8
  %macro_arg_space = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %id = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %parser = alloca { { i8*, i64, i64 }* }*, align 8
  store { { i8*, i64, i64 }* }* %0, { { i8*, i64, i64 }* }** %parser, align 8
  call void @debugPrint(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @global_str.49, i32 0, i32 0))
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load, i32 0, i32 0
  %struct_gep_deref = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15854, end: 15868, rendered-as: \22takeIdentifier\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeIdentifier({ i8*, i64, i64 }* %struct_gep_deref)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15854, end: 15868, rendered-as: \22takeIdentifier\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  %b_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load, { { i8*, i64, i64 }*, i64, i64 }* %id, align 8
  %struct_gep1 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %id, i32 0, i32 2
  %struct_gep_deref2 = load i64, i64* %struct_gep1, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15887, end: 15889, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref2, i64 0)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15887, end: 15889, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @panic(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @global_str.50, i32 0, i32 0))
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %struct_gep3 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* %expr, i32 0, i32 0
  %b_variable_load4 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %id, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load4, { { i8*, i64, i64 }*, i64, i64 }* %struct_gep3, align 8
  %expr_variable_load = load { { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* %expr, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 } } %expr_variable_load
}

define { { { i8*, i64, i64 }*, i64, i64 } }* @copy.51({ { { i8*, i64, i64 }*, i64, i64 } } %0) {
entry_block:
  %macro_arg_space = alloca { { { i8*, i64, i64 }*, i64, i64 } }*, align 8
  %data = alloca { { { i8*, i64, i64 }*, i64, i64 } }*, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 } }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 } } %0, { { { i8*, i64, i64 }*, i64, i64 } }* %val, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16091, end: 16097, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 } }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* null, i32 1) to i64))
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16091, end: 16097, rendered-as: \22malloc\22 } })_call" to { { { i8*, i64, i64 }*, i64, i64 } }*
  store { { { i8*, i64, i64 }*, i64, i64 } }* %bitcast, { { { i8*, i64, i64 }*, i64, i64 } }** %macro_arg_space, align 8
  %b_variable_load = load { { { i8*, i64, i64 }*, i64, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 } }** %macro_arg_space, align 8
  store { { { i8*, i64, i64 }*, i64, i64 } }* %b_variable_load, { { { i8*, i64, i64 }*, i64, i64 } }** %data, align 8
  %data_variable_load = load { { { i8*, i64, i64 }*, i64, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 } }** %data, align 8
  %bitcast1 = bitcast { { { i8*, i64, i64 }*, i64, i64 } }* %data_variable_load to i8*
  %bitcast2 = bitcast { { { i8*, i64, i64 }*, i64, i64 } }* %val to i8*
  call void @memcpy(i8* %bitcast1, i8* %bitcast2, i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 } }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* null, i32 1) to i64))
  %data_variable_load3 = load { { { i8*, i64, i64 }*, i64, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 } }** %data, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 } }* %data_variable_load3
}

define { i8*, i64 } @asExpr.52({ { { i8*, i64, i64 }*, i64, i64 } } %0) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %expr = alloca { i8*, i64 }, align 8
  %id = alloca { { { i8*, i64, i64 }*, i64, i64 } }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 } } %0, { { { i8*, i64, i64 }*, i64, i64 } }* %id, align 8
  %struct_gep = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 1
  store i64 2, i64* %struct_gep, align 4
  %struct_gep1 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 0
  %id_variable_load = load { { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* %id, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16355, end: 16359, rendered-as: \22copy\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 } }* @copy.51({ { { i8*, i64, i64 }*, i64, i64 } } %id_variable_load)
  %bitcast = bitcast { { { i8*, i64, i64 }*, i64, i64 } }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16355, end: 16359, rendered-as: \22copy\22 } })_call" to i8*
  store i8* %bitcast, i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %struct_gep1, align 8
  %expr_variable_load = load { i8*, i64 }, { i8*, i64 }* %expr, align 8
  ret { i8*, i64 } %expr_variable_load
}

declare void @debugBlockExpr.53({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, i64)

define { i8*, i64 }* @get({ i64, i64, { i8*, i64 }* }* %0, i64 %1) {
entry_block:
  %data = alloca { i8*, i64 }*, align 8
  %index = alloca i64, align 8
  %va = alloca { i64, i64, { i8*, i64 }* }*, align 8
  store { i64, i64, { i8*, i64 }* }* %0, { i64, i64, { i8*, i64 }* }** %va, align 8
  store i64 %1, i64* %index, align 4
  %va_variable_load = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %struct_gep = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va_variable_load, i32 0, i32 2
  %b_variable_load = load { i8*, i64 }*, { i8*, i64 }** %struct_gep, align 8
  store { i8*, i64 }* %b_variable_load, { i8*, i64 }** %data, align 8
  %data_variable_load = load { i8*, i64 }*, { i8*, i64 }** %data, align 8
  %index_variable_load = load i64, i64* %index, align 4
  %asm_gep = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %data_variable_load, i64 %index_variable_load
  ret { i8*, i64 }* %asm_gep
}

define { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } @parseBlockExpr({ { i8*, i64, i64 }* }* %0) {
entry_block:
  %macro_arg_space54 = alloca i1, align 1
  %macro_arg_space51 = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %end = alloca i64, align 8
  %macro_arg_space27 = alloca i1, align 1
  %macro_arg_space18 = alloca { i8*, i64 }, align 8
  %internal_expr = alloca { i8*, i64 }, align 8
  %macro_arg_space9 = alloca i1, align 1
  %last_semicolon = alloca i1, align 1
  %macro_arg_space = alloca { i64, i64, { i8*, i64 }* }, align 8
  %exprs = alloca { i64, i64, { i8*, i64 }* }, align 8
  %expr = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, align 8
  %start = alloca i64, align 8
  %parser = alloca { { i8*, i64, i64 }* }*, align 8
  store { { i8*, i64, i64 }* }* %0, { { i8*, i64, i64 }* }** %parser, align 8
  call void @debugPrint(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @global_str.58, i32 0, i32 0))
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load, i32 0, i32 0
  %struct_gep_deref = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17059, end: 17073, rendered-as: \22takeWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %struct_gep_deref)
  %parser_variable_load1 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep2 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load1, i32 0, i32 0
  %struct_gep_deref3 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep2, align 8
  %struct_gep4 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %struct_gep_deref3, i32 0, i32 1
  %b_variable_load = load i64, i64* %struct_gep4, align 4
  store i64 %b_variable_load, i64* %start, align 4
  %parser_variable_load5 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep6 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load5, i32 0, i32 0
  %struct_gep_deref7 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep6, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17137, end: 17144, rendered-as: \22require\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @require({ i8*, i64, i64 }* %struct_gep_deref7, i8 123)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17206, end: 17223, rendered-as: \22variablearray#new\22 } })_call" = call { i64, i64, { i8*, i64 }* } @"variablearray#new"()
  store { i64, i64, { i8*, i64 }* } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17206, end: 17223, rendered-as: \22variablearray#new\22 } })_call", { i64, i64, { i8*, i64 }* }* %macro_arg_space, align 8
  %b_variable_load8 = load { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %macro_arg_space, align 8
  store { i64, i64, { i8*, i64 }* } %b_variable_load8, { i64, i64, { i8*, i64 }* }* %exprs, align 8
  store i1 true, i1* %macro_arg_space9, align 1
  %b_variable_load10 = load i1, i1* %macro_arg_space9, align 1
  store i1 %b_variable_load10, i1* %last_semicolon, align 1
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %if_cont_block, %entry_block
  %parser_variable_load11 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep12 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load11, i32 0, i32 0
  %struct_gep_deref13 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep12, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17293, end: 17298, rendered-as: \22isEof\22 } })_call" = call i1 @isEof({ i8*, i64, i64 }* %struct_gep_deref13)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17278, end: 17279, rendered-as: \22!\22 } })_call" = call i1 @"!"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17293, end: 17298, rendered-as: \22isEof\22 } })_call")
  %parser_variable_load14 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep15 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load14, i32 0, i32 0
  %struct_gep_deref16 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep15, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17319, end: 17327, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %struct_gep_deref16)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17330, end: 17332, rendered-as: \22!=\22 } })_call" = call i1 @"!=.2"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17319, end: 17327, rendered-as: \22peekChar\22 } })_call", i8 125)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17302, end: 17304, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17278, end: 17279, rendered-as: \22!\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17330, end: 17332, rendered-as: \22!=\22 } })_call")
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17302, end: 17304, rendered-as: \22&&\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %parser_variable_load17 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17377, end: 17386, rendered-as: \22parseExpr\22 } })_call" = call { i8*, i64 } @parseExpr({ { i8*, i64, i64 }* }* %parser_variable_load17)
  store { i8*, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17377, end: 17386, rendered-as: \22parseExpr\22 } })_call", { i8*, i64 }* %macro_arg_space18, align 8
  %b_variable_load19 = load { i8*, i64 }, { i8*, i64 }* %macro_arg_space18, align 8
  store { i8*, i64 } %b_variable_load19, { i8*, i64 }* %internal_expr, align 8
  call void @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @global_str.59, i32 0, i32 0))
  %struct_gep20 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %internal_expr, i32 0, i32 1
  call void @debugExprType(i64* %struct_gep20, i64 0)
  %internal_expr_variable_load = load { i8*, i64 }, { i8*, i64 }* %internal_expr, align 8
  call void @append({ i64, i64, { i8*, i64 }* }* %exprs, { i8*, i64 } %internal_expr_variable_load)
  %parser_variable_load21 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep22 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load21, i32 0, i32 0
  %struct_gep_deref23 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep22, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17729, end: 17743, rendered-as: \22takeWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %struct_gep_deref23)
  %parser_variable_load24 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep25 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load24, i32 0, i32 0
  %struct_gep_deref26 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep25, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17771, end: 17779, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %struct_gep_deref26)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17782, end: 17784, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17771, end: 17779, rendered-as: \22peekChar\22 } })_call", i8 125)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17782, end: 17784, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

while_loop_cont_basic_block:                      ; preds = %if_then_block, %while_loop_cond_check_basic_block
  %parser_variable_load35 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep36 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load35, i32 0, i32 0
  %struct_gep_deref37 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep36, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18029, end: 18036, rendered-as: \22require\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @require({ i8*, i64, i64 }* %struct_gep_deref37, i8 125)
  call void @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @global_str.63, i32 0, i32 0))
  %struct_gep38 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %exprs, i32 0, i32 0
  %struct_gep_deref39 = load i64, i64* %struct_gep38, align 4
  call void @printint(i64 %struct_gep_deref39)
  %parser_variable_load40 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep41 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load40, i32 0, i32 0
  %struct_gep_deref42 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep41, align 8
  %struct_gep43 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %struct_gep_deref42, i32 0, i32 1
  %b_variable_load44 = load i64, i64* %struct_gep43, align 4
  store i64 %b_variable_load44, i64* %end, align 4
  %struct_gep45 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %expr, i32 0, i32 1
  %b_variable_load46 = load { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %exprs, align 8
  store { i64, i64, { i8*, i64 }* } %b_variable_load46, { i64, i64, { i8*, i64 }* }* %struct_gep45, align 8
  %struct_gep47 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %expr, i32 0, i32 0
  %parser_variable_load48 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep49 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load48, i32 0, i32 0
  %struct_gep_deref50 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep49, align 8
  %start_variable_load = load i64, i64* %start, align 4
  %end_variable_load = load i64, i64* %end, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18177, end: 18190, rendered-as: \22lexstring#new\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @"lexstring#new"({ i8*, i64, i64 }* %struct_gep_deref50, i64 %start_variable_load, i64 %end_variable_load)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18177, end: 18190, rendered-as: \22lexstring#new\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space51, align 8
  %b_variable_load52 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space51, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load52, { { i8*, i64, i64 }*, i64, i64 }* %struct_gep47, align 8
  %struct_gep53 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %expr, i32 0, i32 2
  %last_semicolon_variable_load = load i1, i1* %last_semicolon, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18245, end: 18246, rendered-as: \22!\22 } })_call" = call i1 @"!"(i1 %last_semicolon_variable_load)
  store i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18245, end: 18246, rendered-as: \22!\22 } })_call", i1* %macro_arg_space54, align 1
  %b_variable_load55 = load i1, i1* %macro_arg_space54, align 1
  store i1 %b_variable_load55, i1* %struct_gep53, align 1
  %expr_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %expr, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } %expr_variable_load

if_then_block:                                    ; preds = %while_loop_body_basic_block
  call void @debugPrint(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @global_str.61, i32 0, i32 0))
  call void @debugPrint(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @global_str.62, i32 0, i32 0))
  store i1 false, i1* %macro_arg_space27, align 1
  %b_variable_load28 = load i1, i1* %macro_arg_space27, align 1
  store i1 %b_variable_load28, i1* %last_semicolon, align 1
  br label %while_loop_cont_basic_block
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %while_loop_body_basic_block
  %parser_variable_load29 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep30 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load29, i32 0, i32 0
  %struct_gep_deref31 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep30, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17951, end: 17958, rendered-as: \22require\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @require({ i8*, i64, i64 }* %struct_gep_deref31, i8 59)
  %parser_variable_load32 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep33 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load32, i32 0, i32 0
  %struct_gep_deref34 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep33, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17986, end: 18000, rendered-as: \22takeWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %struct_gep_deref34)
  br label %while_loop_cond_check_basic_block
}

define { i64, i64, { i8*, i64 }* } @"variablearray#new"() {
entry_block:
  %macro_arg_space5 = alloca i64, align 8
  %macro_arg_space2 = alloca i64, align 8
  %macro_arg_space = alloca { i8*, i64 }*, align 8
  %va = alloca { i64, i64, { i8*, i64 }* }, align 8
  %struct_gep = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va, i32 0, i32 2
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11053, end: 11054, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint ({ i8*, i64 }* getelementptr ({ i8*, i64 }, { i8*, i64 }* null, i32 1) to i64), i64 64)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11035, end: 11041, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11053, end: 11054, rendered-as: \22*\22 } })_call")
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11035, end: 11041, rendered-as: \22malloc\22 } })_call" to { i8*, i64 }*
  store { i8*, i64 }* %bitcast, { i8*, i64 }** %macro_arg_space, align 8
  %b_variable_load = load { i8*, i64 }*, { i8*, i64 }** %macro_arg_space, align 8
  store { i8*, i64 }* %b_variable_load, { i8*, i64 }** %struct_gep, align 8
  %struct_gep1 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va, i32 0, i32 0
  store i64 0, i64* %macro_arg_space2, align 4
  %b_variable_load3 = load i64, i64* %macro_arg_space2, align 4
  store i64 %b_variable_load3, i64* %struct_gep1, align 4
  %struct_gep4 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va, i32 0, i32 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11117, end: 11118, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint ({ i8*, i64 }* getelementptr ({ i8*, i64 }, { i8*, i64 }* null, i32 1) to i64), i64 64)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11117, end: 11118, rendered-as: \22*\22 } })_call", i64* %macro_arg_space5, align 4
  %b_variable_load6 = load i64, i64* %macro_arg_space5, align 4
  store i64 %b_variable_load6, i64* %struct_gep4, align 4
  %va_variable_load = load { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va, align 8
  ret { i64, i64, { i8*, i64 }* } %va_variable_load
}

define void @append({ i64, i64, { i8*, i64 }* }* %0, { i8*, i64 } %1) {
entry_block:
  %macro_arg_space27 = alloca { i8*, i64 }*, align 8
  %macro_arg_space15 = alloca i64, align 8
  %macro_arg_space11 = alloca i64, align 8
  %macro_arg_space1 = alloca i64, align 8
  %macro_arg_space = alloca i64, align 8
  %val = alloca { i8*, i64 }, align 8
  %va = alloca { i64, i64, { i8*, i64 }* }*, align 8
  store { i64, i64, { i8*, i64 }* }* %0, { i64, i64, { i8*, i64 }* }** %va, align 8
  store { i8*, i64 } %1, { i8*, i64 }* %val, align 8
  %va_variable_load = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %struct_gep = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va_variable_load, i32 0, i32 0
  store i64 1, i64* %macro_arg_space, align 4
  %a_variable_load = load i64, i64* %struct_gep, align 4
  %b_variable_load = load i64, i64* %macro_arg_space, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 %b_variable_load)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call", i64* %macro_arg_space1, align 4
  %b_variable_load2 = load i64, i64* %macro_arg_space1, align 4
  store i64 %b_variable_load2, i64* %struct_gep, align 4
  %a_variable_load3 = load i64, i64* %struct_gep, align 4
  %va_variable_load4 = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %struct_gep5 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va_variable_load4, i32 0, i32 0
  %struct_gep_deref = load i64, i64* %struct_gep5, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11480, end: 11481, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 %struct_gep_deref, i64 ptrtoint ({ i8*, i64 }* getelementptr ({ i8*, i64 }, { i8*, i64 }* null, i32 1) to i64))
  %va_variable_load6 = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %struct_gep7 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va_variable_load6, i32 0, i32 1
  %struct_gep_deref8 = load i64, i64* %struct_gep7, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11494, end: 11495, rendered-as: \22>\22 } })_call" = call i1 @">"(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11480, end: 11481, rendered-as: \22*\22 } })_call", i64 %struct_gep_deref8)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11494, end: 11495, rendered-as: \22>\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  %va_variable_load9 = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %struct_gep10 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va_variable_load9, i32 0, i32 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11545, end: 11546, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint ({ i8*, i64 }* getelementptr ({ i8*, i64 }, { i8*, i64 }* null, i32 1) to i64), i64 64)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11545, end: 11546, rendered-as: \22*\22 } })_call", i64* %macro_arg_space11, align 4
  %a_variable_load12 = load i64, i64* %struct_gep10, align 4
  %b_variable_load13 = load i64, i64* %macro_arg_space11, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call14" = call i64 @"+"(i64 %a_variable_load12, i64 %b_variable_load13)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call14", i64* %macro_arg_space15, align 4
  %b_variable_load16 = load i64, i64* %macro_arg_space15, align 4
  store i64 %b_variable_load16, i64* %struct_gep10, align 4
  %a_variable_load17 = load i64, i64* %struct_gep10, align 4
  %va_variable_load18 = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %struct_gep19 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va_variable_load18, i32 0, i32 2
  %va_variable_load20 = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %struct_gep21 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va_variable_load20, i32 0, i32 2
  %struct_gep_deref22 = load { i8*, i64 }*, { i8*, i64 }** %struct_gep21, align 8
  %bitcast = bitcast { i8*, i64 }* %struct_gep_deref22 to i8*
  %va_variable_load23 = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %struct_gep24 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va_variable_load23, i32 0, i32 1
  %struct_gep_deref25 = load i64, i64* %struct_gep24, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11571, end: 11578, rendered-as: \22realloc\22 } })_call" = call i8* @realloc(i8* %bitcast, i64 %struct_gep_deref25)
  %bitcast26 = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11571, end: 11578, rendered-as: \22realloc\22 } })_call" to { i8*, i64 }*
  store { i8*, i64 }* %bitcast26, { i8*, i64 }** %macro_arg_space27, align 8
  %b_variable_load28 = load { i8*, i64 }*, { i8*, i64 }** %macro_arg_space27, align 8
  store { i8*, i64 }* %b_variable_load28, { i8*, i64 }** %struct_gep19, align 8
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %va_variable_load29 = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %va_variable_load30 = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %struct_gep31 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va_variable_load30, i32 0, i32 0
  %struct_gep_deref32 = load i64, i64* %struct_gep31, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11690, end: 11691, rendered-as: \22-\22 } })_call" = call i64 @-(i64 %struct_gep_deref32, i64 1)
  %val_variable_load = load { i8*, i64 }, { i8*, i64 }* %val, align 8
  call void @set({ i64, i64, { i8*, i64 }* }* %va_variable_load29, i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11690, end: 11691, rendered-as: \22-\22 } })_call", { i8*, i64 } %val_variable_load)
  ret void
}

define void @set({ i64, i64, { i8*, i64 }* }* %0, i64 %1, { i8*, i64 } %2) {
entry_block:
  %val = alloca { i8*, i64 }, align 8
  %index = alloca i64, align 8
  %va = alloca { i64, i64, { i8*, i64 }* }*, align 8
  store { i64, i64, { i8*, i64 }* }* %0, { i64, i64, { i8*, i64 }* }** %va, align 8
  store i64 %1, i64* %index, align 4
  store { i8*, i64 } %2, { i8*, i64 }* %val, align 8
  %va_variable_load = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %index_variable_load = load i64, i64* %index, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11339, end: 11342, rendered-as: \22get\22 } })_call" = call { i8*, i64 }* @get.60({ i64, i64, { i8*, i64 }* }* %va_variable_load, i64 %index_variable_load)
  %bitcast = bitcast { i8*, i64 }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11339, end: 11342, rendered-as: \22get\22 } })_call" to i8*
  %bitcast1 = bitcast { i8*, i64 }* %val to i8*
  call void @memcpy(i8* %bitcast, i8* %bitcast1, i64 ptrtoint ({ i8*, i64 }* getelementptr ({ i8*, i64 }, { i8*, i64 }* null, i32 1) to i64))
  ret void
}

define { i8*, i64 }* @get.60({ i64, i64, { i8*, i64 }* }* %0, i64 %1) {
entry_block:
  %data = alloca { i8*, i64 }*, align 8
  %index = alloca i64, align 8
  %va = alloca { i64, i64, { i8*, i64 }* }*, align 8
  store { i64, i64, { i8*, i64 }* }* %0, { i64, i64, { i8*, i64 }* }** %va, align 8
  store i64 %1, i64* %index, align 4
  %va_variable_load = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %struct_gep = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va_variable_load, i32 0, i32 2
  %b_variable_load = load { i8*, i64 }*, { i8*, i64 }** %struct_gep, align 8
  store { i8*, i64 }* %b_variable_load, { i8*, i64 }** %data, align 8
  %data_variable_load = load { i8*, i64 }*, { i8*, i64 }** %data, align 8
  %index_variable_load = load i64, i64* %index, align 4
  %asm_gep = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %data_variable_load, i64 %index_variable_load
  ret { i8*, i64 }* %asm_gep
}

define { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* @copy.64({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } %0) {
entry_block:
  %macro_arg_space = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, align 8
  %data = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } %0, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %val, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18344, end: 18350, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* null, i32 1) to i64))
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18344, end: 18350, rendered-as: \22malloc\22 } })_call" to { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*
  store { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %bitcast, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %macro_arg_space, align 8
  %b_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %macro_arg_space, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %b_variable_load, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %data, align 8
  %data_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %data, align 8
  %bitcast1 = bitcast { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %data_variable_load to i8*
  %bitcast2 = bitcast { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %val to i8*
  call void @memcpy(i8* %bitcast1, i8* %bitcast2, i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* null, i32 1) to i64))
  %data_variable_load3 = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %data, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %data_variable_load3
}

define { i8*, i64 } @asExpr.65({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } %0) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %expr = alloca { i8*, i64 }, align 8
  %id = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } %0, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %id, align 8
  %struct_gep = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 1
  store i64 3, i64* %struct_gep, align 4
  %struct_gep1 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 0
  %id_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %id, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18587, end: 18591, rendered-as: \22copy\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* @copy.64({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } %id_variable_load)
  %bitcast = bitcast { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18587, end: 18591, rendered-as: \22copy\22 } })_call" to i8*
  store i8* %bitcast, i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %struct_gep1, align 8
  %expr_variable_load = load { i8*, i64 }, { i8*, i64 }* %expr, align 8
  ret { i8*, i64 } %expr_variable_load
}

declare void @debugStringExpr.66({ { { i8*, i64, i64 }*, i64, i64 }, i8* }*, i64)

define { { { i8*, i64, i64 }*, i64, i64 }, i8* } @parseStringExpr({ { i8*, i64, i64 }* }* %0) {
entry_block:
  %macro_arg_space33 = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %s = alloca { { { i8*, i64, i64 }*, i64, i64 }, i8* }, align 8
  %end = alloca i64, align 8
  %macro_arg_space17 = alloca i1, align 1
  %macro_arg_space11 = alloca i8, align 1
  %next_char = alloca i8, align 1
  %macro_arg_space6 = alloca i1, align 1
  %escaped = alloca i1, align 1
  %macro_arg_space = alloca { i64, i64, i8* }, align 8
  %str = alloca { i64, i64, i8* }, align 8
  %start = alloca i64, align 8
  %parser = alloca { { i8*, i64, i64 }* }*, align 8
  store { { i8*, i64, i64 }* }* %0, { { i8*, i64, i64 }* }** %parser, align 8
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load, i32 0, i32 0
  %struct_gep_deref = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep, align 8
  %struct_gep1 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %struct_gep_deref, i32 0, i32 1
  %b_variable_load = load i64, i64* %struct_gep1, align 4
  store i64 %b_variable_load, i64* %start, align 4
  %parser_variable_load2 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep3 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load2, i32 0, i32 0
  %struct_gep_deref4 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep3, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18993, end: 19000, rendered-as: \22require\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @require({ i8*, i64, i64 }* %struct_gep_deref4, i8 34)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 19038, end: 19055, rendered-as: \22variablearray#new\22 } })_call" = call { i64, i64, i8* } @"variablearray#new.67"()
  store { i64, i64, i8* } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 19038, end: 19055, rendered-as: \22variablearray#new\22 } })_call", { i64, i64, i8* }* %macro_arg_space, align 8
  %b_variable_load5 = load { i64, i64, i8* }, { i64, i64, i8* }* %macro_arg_space, align 8
  store { i64, i64, i8* } %b_variable_load5, { i64, i64, i8* }* %str, align 8
  store i1 false, i1* %macro_arg_space6, align 1
  %b_variable_load7 = load i1, i1* %macro_arg_space6, align 1
  store i1 %b_variable_load7, i1* %escaped, align 1
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %if_cont_block, %entry_block
  br i1 true, label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %parser_variable_load8 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep9 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load8, i32 0, i32 0
  %struct_gep_deref10 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep9, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 19144, end: 19152, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %struct_gep_deref10)
  store i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 19144, end: 19152, rendered-as: \22takeChar\22 } })_call", i8* %macro_arg_space11, align 1
  %b_variable_load12 = load i8, i8* %macro_arg_space11, align 1
  store i8 %b_variable_load12, i8* %next_char, align 1
  %escaped_variable_load = load i1, i1* %escaped, align 1
  br i1 %escaped_variable_load, label %if_then_block, label %if_else_block

while_loop_cont_basic_block:                      ; preds = %if_then_block20, %while_loop_cond_check_basic_block
  %parser_variable_load24 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep25 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load24, i32 0, i32 0
  %struct_gep_deref26 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep25, align 8
  %struct_gep27 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %struct_gep_deref26, i32 0, i32 1
  %b_variable_load28 = load i64, i64* %struct_gep27, align 4
  store i64 %b_variable_load28, i64* %end, align 4
  %struct_gep29 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, i8* }, { { { i8*, i64, i64 }*, i64, i64 }, i8* }* %s, i32 0, i32 0
  %parser_variable_load30 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep31 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load30, i32 0, i32 0
  %struct_gep_deref32 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep31, align 8
  %start_variable_load = load i64, i64* %start, align 4
  %end_variable_load = load i64, i64* %end, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 19538, end: 19551, rendered-as: \22lexstring#new\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @"lexstring#new"({ i8*, i64, i64 }* %struct_gep_deref32, i64 %start_variable_load, i64 %end_variable_load)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 19538, end: 19551, rendered-as: \22lexstring#new\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space33, align 8
  %b_variable_load34 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space33, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load34, { { i8*, i64, i64 }*, i64, i64 }* %struct_gep29, align 8
  %struct_gep35 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, i8* }, { { { i8*, i64, i64 }*, i64, i64 }, i8* }* %s, i32 0, i32 1
  %struct_gep36 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %str, i32 0, i32 2
  %b_variable_load37 = load i8*, i8** %struct_gep36, align 8
  store i8* %b_variable_load37, i8** %struct_gep35, align 8
  %s_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, i8* }, { { { i8*, i64, i64 }*, i64, i64 }, i8* }* %s, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 }, i8* } %s_variable_load

if_then_block:                                    ; preds = %while_loop_body_basic_block
  %next_char_variable_load = load i8, i8* %next_char, align 1
  call void @append.68({ i64, i64, i8* }* %str, i8 %next_char_variable_load)
  br label %if_cont_block

if_else_block:                                    ; preds = %while_loop_body_basic_block
  %next_char_variable_load13 = load i8, i8* %next_char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 19261, end: 19263, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %next_char_variable_load13, i8 92)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 19261, end: 19263, rendered-as: \22==\22 } })_call", label %if_then_block14, label %if_else_block15

if_cont_block:                                    ; preds = %if_cont_block16, %if_then_block
  br label %while_loop_cond_check_basic_block

if_then_block14:                                  ; preds = %if_else_block
  store i1 true, i1* %macro_arg_space17, align 1
  %b_variable_load18 = load i1, i1* %macro_arg_space17, align 1
  store i1 %b_variable_load18, i1* %escaped, align 1
  br label %if_cont_block16

if_else_block15:                                  ; preds = %if_else_block
  %next_char_variable_load19 = load i8, i8* %next_char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 19335, end: 19337, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %next_char_variable_load19, i8 34)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 19335, end: 19337, rendered-as: \22==\22 } })_call", label %if_then_block20, label %if_else_block21

if_cont_block16:                                  ; preds = %if_cont_block22, %if_then_block14
  br label %if_cont_block

if_then_block20:                                  ; preds = %if_else_block15
  br label %while_loop_cont_basic_block
  br label %if_cont_block22

if_else_block21:                                  ; preds = %if_else_block15
  %next_char_variable_load23 = load i8, i8* %next_char, align 1
  call void @append.68({ i64, i64, i8* }* %str, i8 %next_char_variable_load23)
  br label %if_cont_block22

if_cont_block22:                                  ; preds = %if_else_block21, %if_then_block20
  br label %if_cont_block16
}

define { i64, i64, i8* } @"variablearray#new.67"() {
entry_block:
  %macro_arg_space5 = alloca i64, align 8
  %macro_arg_space2 = alloca i64, align 8
  %macro_arg_space = alloca i8*, align 8
  %va = alloca { i64, i64, i8* }, align 8
  %struct_gep = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %va, i32 0, i32 2
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11053, end: 11054, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i64), i64 64)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11035, end: 11041, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11053, end: 11054, rendered-as: \22*\22 } })_call")
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11035, end: 11041, rendered-as: \22malloc\22 } })_call", i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %struct_gep, align 8
  %struct_gep1 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %va, i32 0, i32 0
  store i64 0, i64* %macro_arg_space2, align 4
  %b_variable_load3 = load i64, i64* %macro_arg_space2, align 4
  store i64 %b_variable_load3, i64* %struct_gep1, align 4
  %struct_gep4 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %va, i32 0, i32 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11117, end: 11118, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i64), i64 64)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11117, end: 11118, rendered-as: \22*\22 } })_call", i64* %macro_arg_space5, align 4
  %b_variable_load6 = load i64, i64* %macro_arg_space5, align 4
  store i64 %b_variable_load6, i64* %struct_gep4, align 4
  %va_variable_load = load { i64, i64, i8* }, { i64, i64, i8* }* %va, align 8
  ret { i64, i64, i8* } %va_variable_load
}

define void @append.68({ i64, i64, i8* }* %0, i8 %1) {
entry_block:
  %macro_arg_space26 = alloca i8*, align 8
  %macro_arg_space15 = alloca i64, align 8
  %macro_arg_space11 = alloca i64, align 8
  %macro_arg_space1 = alloca i64, align 8
  %macro_arg_space = alloca i64, align 8
  %val = alloca i8, align 1
  %va = alloca { i64, i64, i8* }*, align 8
  store { i64, i64, i8* }* %0, { i64, i64, i8* }** %va, align 8
  store i8 %1, i8* %val, align 1
  %va_variable_load = load { i64, i64, i8* }*, { i64, i64, i8* }** %va, align 8
  %struct_gep = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %va_variable_load, i32 0, i32 0
  store i64 1, i64* %macro_arg_space, align 4
  %a_variable_load = load i64, i64* %struct_gep, align 4
  %b_variable_load = load i64, i64* %macro_arg_space, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 %b_variable_load)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call", i64* %macro_arg_space1, align 4
  %b_variable_load2 = load i64, i64* %macro_arg_space1, align 4
  store i64 %b_variable_load2, i64* %struct_gep, align 4
  %a_variable_load3 = load i64, i64* %struct_gep, align 4
  %va_variable_load4 = load { i64, i64, i8* }*, { i64, i64, i8* }** %va, align 8
  %struct_gep5 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %va_variable_load4, i32 0, i32 0
  %struct_gep_deref = load i64, i64* %struct_gep5, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11480, end: 11481, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 %struct_gep_deref, i64 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i64))
  %va_variable_load6 = load { i64, i64, i8* }*, { i64, i64, i8* }** %va, align 8
  %struct_gep7 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %va_variable_load6, i32 0, i32 1
  %struct_gep_deref8 = load i64, i64* %struct_gep7, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11494, end: 11495, rendered-as: \22>\22 } })_call" = call i1 @">"(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11480, end: 11481, rendered-as: \22*\22 } })_call", i64 %struct_gep_deref8)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11494, end: 11495, rendered-as: \22>\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  %va_variable_load9 = load { i64, i64, i8* }*, { i64, i64, i8* }** %va, align 8
  %struct_gep10 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %va_variable_load9, i32 0, i32 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11545, end: 11546, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i64), i64 64)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11545, end: 11546, rendered-as: \22*\22 } })_call", i64* %macro_arg_space11, align 4
  %a_variable_load12 = load i64, i64* %struct_gep10, align 4
  %b_variable_load13 = load i64, i64* %macro_arg_space11, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call14" = call i64 @"+"(i64 %a_variable_load12, i64 %b_variable_load13)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call14", i64* %macro_arg_space15, align 4
  %b_variable_load16 = load i64, i64* %macro_arg_space15, align 4
  store i64 %b_variable_load16, i64* %struct_gep10, align 4
  %a_variable_load17 = load i64, i64* %struct_gep10, align 4
  %va_variable_load18 = load { i64, i64, i8* }*, { i64, i64, i8* }** %va, align 8
  %struct_gep19 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %va_variable_load18, i32 0, i32 2
  %va_variable_load20 = load { i64, i64, i8* }*, { i64, i64, i8* }** %va, align 8
  %struct_gep21 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %va_variable_load20, i32 0, i32 2
  %struct_gep_deref22 = load i8*, i8** %struct_gep21, align 8
  %va_variable_load23 = load { i64, i64, i8* }*, { i64, i64, i8* }** %va, align 8
  %struct_gep24 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %va_variable_load23, i32 0, i32 1
  %struct_gep_deref25 = load i64, i64* %struct_gep24, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11571, end: 11578, rendered-as: \22realloc\22 } })_call" = call i8* @realloc(i8* %struct_gep_deref22, i64 %struct_gep_deref25)
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11571, end: 11578, rendered-as: \22realloc\22 } })_call", i8** %macro_arg_space26, align 8
  %b_variable_load27 = load i8*, i8** %macro_arg_space26, align 8
  store i8* %b_variable_load27, i8** %struct_gep19, align 8
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %va_variable_load28 = load { i64, i64, i8* }*, { i64, i64, i8* }** %va, align 8
  %va_variable_load29 = load { i64, i64, i8* }*, { i64, i64, i8* }** %va, align 8
  %struct_gep30 = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %va_variable_load29, i32 0, i32 0
  %struct_gep_deref31 = load i64, i64* %struct_gep30, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11690, end: 11691, rendered-as: \22-\22 } })_call" = call i64 @-(i64 %struct_gep_deref31, i64 1)
  %val_variable_load = load i8, i8* %val, align 1
  call void @set.69({ i64, i64, i8* }* %va_variable_load28, i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11690, end: 11691, rendered-as: \22-\22 } })_call", i8 %val_variable_load)
  ret void
}

define void @set.69({ i64, i64, i8* }* %0, i64 %1, i8 %2) {
entry_block:
  %val = alloca i8, align 1
  %index = alloca i64, align 8
  %va = alloca { i64, i64, i8* }*, align 8
  store { i64, i64, i8* }* %0, { i64, i64, i8* }** %va, align 8
  store i64 %1, i64* %index, align 4
  store i8 %2, i8* %val, align 1
  %va_variable_load = load { i64, i64, i8* }*, { i64, i64, i8* }** %va, align 8
  %index_variable_load = load i64, i64* %index, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11339, end: 11342, rendered-as: \22get\22 } })_call" = call i8* @get.70({ i64, i64, i8* }* %va_variable_load, i64 %index_variable_load)
  call void @memcpy(i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11339, end: 11342, rendered-as: \22get\22 } })_call", i8* %val, i64 ptrtoint (i8* getelementptr (i8, i8* null, i32 1) to i64))
  ret void
}

define i8* @get.70({ i64, i64, i8* }* %0, i64 %1) {
entry_block:
  %data = alloca i8*, align 8
  %index = alloca i64, align 8
  %va = alloca { i64, i64, i8* }*, align 8
  store { i64, i64, i8* }* %0, { i64, i64, i8* }** %va, align 8
  store i64 %1, i64* %index, align 4
  %va_variable_load = load { i64, i64, i8* }*, { i64, i64, i8* }** %va, align 8
  %struct_gep = getelementptr inbounds { i64, i64, i8* }, { i64, i64, i8* }* %va_variable_load, i32 0, i32 2
  %b_variable_load = load i8*, i8** %struct_gep, align 8
  store i8* %b_variable_load, i8** %data, align 8
  %data_variable_load = load i8*, i8** %data, align 8
  %index_variable_load = load i64, i64* %index, align 4
  %asm_gep = getelementptr inbounds i8, i8* %data_variable_load, i64 %index_variable_load
  ret i8* %asm_gep
}

define { { { i8*, i64, i64 }*, i64, i64 }, i8* }* @copy.71({ { { i8*, i64, i64 }*, i64, i64 }, i8* } %0) {
entry_block:
  %macro_arg_space = alloca { { { i8*, i64, i64 }*, i64, i64 }, i8* }*, align 8
  %data = alloca { { { i8*, i64, i64 }*, i64, i64 }, i8* }*, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, i8* }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, i8* } %0, { { { i8*, i64, i64 }*, i64, i64 }, i8* }* %val, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 19691, end: 19697, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 }, i8* }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 }, i8* }, { { { i8*, i64, i64 }*, i64, i64 }, i8* }* null, i32 1) to i64))
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 19691, end: 19697, rendered-as: \22malloc\22 } })_call" to { { { i8*, i64, i64 }*, i64, i64 }, i8* }*
  store { { { i8*, i64, i64 }*, i64, i64 }, i8* }* %bitcast, { { { i8*, i64, i64 }*, i64, i64 }, i8* }** %macro_arg_space, align 8
  %b_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, i8* }*, { { { i8*, i64, i64 }*, i64, i64 }, i8* }** %macro_arg_space, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, i8* }* %b_variable_load, { { { i8*, i64, i64 }*, i64, i64 }, i8* }** %data, align 8
  %data_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, i8* }*, { { { i8*, i64, i64 }*, i64, i64 }, i8* }** %data, align 8
  %bitcast1 = bitcast { { { i8*, i64, i64 }*, i64, i64 }, i8* }* %data_variable_load to i8*
  %bitcast2 = bitcast { { { i8*, i64, i64 }*, i64, i64 }, i8* }* %val to i8*
  call void @memcpy(i8* %bitcast1, i8* %bitcast2, i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 }, i8* }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 }, i8* }, { { { i8*, i64, i64 }*, i64, i64 }, i8* }* null, i32 1) to i64))
  %data_variable_load3 = load { { { i8*, i64, i64 }*, i64, i64 }, i8* }*, { { { i8*, i64, i64 }*, i64, i64 }, i8* }** %data, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 }, i8* }* %data_variable_load3
}

define { i8*, i64 } @asExpr.72({ { { i8*, i64, i64 }*, i64, i64 }, i8* } %0) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %expr = alloca { i8*, i64 }, align 8
  %id = alloca { { { i8*, i64, i64 }*, i64, i64 }, i8* }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, i8* } %0, { { { i8*, i64, i64 }*, i64, i64 }, i8* }* %id, align 8
  %struct_gep = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 1
  store i64 4, i64* %struct_gep, align 4
  %struct_gep1 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 0
  %id_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, i8* }, { { { i8*, i64, i64 }*, i64, i64 }, i8* }* %id, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 19939, end: 19943, rendered-as: \22copy\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, i8* }* @copy.71({ { { i8*, i64, i64 }*, i64, i64 }, i8* } %id_variable_load)
  %bitcast = bitcast { { { i8*, i64, i64 }*, i64, i64 }, i8* }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 19939, end: 19943, rendered-as: \22copy\22 } })_call" to i8*
  store i8* %bitcast, i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %struct_gep1, align 8
  %expr_variable_load = load { i8*, i64 }, { i8*, i64 }* %expr, align 8
  ret { i8*, i64 } %expr_variable_load
}

declare void @debugIfExpr.73({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }*, i64)

define { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } } @parseIfExpr({ { i8*, i64, i64 }* }* %0) {
entry_block:
  %macro_arg_space42 = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %i = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, align 8
  %end = alloca i64, align 8
  %macro_arg_space30 = alloca i1, align 1
  %macro_arg_space28 = alloca { i8*, i64 }, align 8
  %has_else = alloca i1, align 1
  %macro_arg_space22 = alloca i8*, align 8
  %next = alloca i8*, align 8
  %macro_arg_space20 = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %n_id = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %macro_arg_space18 = alloca { i8*, i64, i64 }*, align 8
  %peeked = alloca { i8*, i64, i64 }*, align 8
  %macro_arg_space16 = alloca { i8*, i64, i64 }, align 8
  %peek_ = alloca { i8*, i64, i64 }, align 8
  %else = alloca { i8*, i64 }, align 8
  %macro_arg_space8 = alloca { i8*, i64 }, align 8
  %then = alloca { i8*, i64 }, align 8
  %macro_arg_space = alloca { i8*, i64 }, align 8
  %cond = alloca { i8*, i64 }, align 8
  %start = alloca i64, align 8
  %parser = alloca { { i8*, i64, i64 }* }*, align 8
  store { { i8*, i64, i64 }* }* %0, { { i8*, i64, i64 }* }** %parser, align 8
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load, i32 0, i32 0
  %struct_gep_deref = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep, align 8
  %struct_gep1 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %struct_gep_deref, i32 0, i32 1
  %b_variable_load = load i64, i64* %struct_gep1, align 4
  store i64 %b_variable_load, i64* %start, align 4
  %parser_variable_load2 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep3 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load2, i32 0, i32 0
  %struct_gep_deref4 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep3, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20685, end: 20692, rendered-as: \22require\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @require.29({ i8*, i64, i64 }* %struct_gep_deref4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @global_str.77, i32 0, i32 0))
  %parser_variable_load5 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20722, end: 20731, rendered-as: \22parseExpr\22 } })_call" = call { i8*, i64 } @parseExpr({ { i8*, i64, i64 }* }* %parser_variable_load5)
  store { i8*, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20722, end: 20731, rendered-as: \22parseExpr\22 } })_call", { i8*, i64 }* %macro_arg_space, align 8
  %b_variable_load6 = load { i8*, i64 }, { i8*, i64 }* %macro_arg_space, align 8
  store { i8*, i64 } %b_variable_load6, { i8*, i64 }* %cond, align 8
  %parser_variable_load7 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20758, end: 20767, rendered-as: \22parseExpr\22 } })_call" = call { i8*, i64 } @parseExpr({ { i8*, i64, i64 }* }* %parser_variable_load7)
  store { i8*, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20758, end: 20767, rendered-as: \22parseExpr\22 } })_call", { i8*, i64 }* %macro_arg_space8, align 8
  %b_variable_load9 = load { i8*, i64 }, { i8*, i64 }* %macro_arg_space8, align 8
  store { i8*, i64 } %b_variable_load9, { i8*, i64 }* %then, align 8
  %parser_variable_load10 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep11 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load10, i32 0, i32 0
  %struct_gep_deref12 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep11, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20794, end: 20808, rendered-as: \22takeWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %struct_gep_deref12)
  %parser_variable_load13 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep14 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load13, i32 0, i32 0
  %struct_gep_deref15 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep14, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20861, end: 20865, rendered-as: \22peek\22 } })_call" = call { i8*, i64, i64 } @peek({ i8*, i64, i64 }* %struct_gep_deref15)
  store { i8*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20861, end: 20865, rendered-as: \22peek\22 } })_call", { i8*, i64, i64 }* %macro_arg_space16, align 8
  %b_variable_load17 = load { i8*, i64, i64 }, { i8*, i64, i64 }* %macro_arg_space16, align 8
  store { i8*, i64, i64 } %b_variable_load17, { i8*, i64, i64 }* %peek_, align 8
  store { i8*, i64, i64 }* %peek_, { i8*, i64, i64 }** %macro_arg_space18, align 8
  %b_variable_load19 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %macro_arg_space18, align 8
  store { i8*, i64, i64 }* %b_variable_load19, { i8*, i64, i64 }** %peeked, align 8
  %peeked_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %peeked, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20927, end: 20941, rendered-as: \22takeIdentifier\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeIdentifier({ i8*, i64, i64 }* %peeked_variable_load)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20927, end: 20941, rendered-as: \22takeIdentifier\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space20, align 8
  %b_variable_load21 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space20, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load21, { { i8*, i64, i64 }*, i64, i64 }* %n_id, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20969, end: 20975, rendered-as: \22render\22 } })_call" = call i8* @render({ { i8*, i64, i64 }*, i64, i64 }* %n_id)
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20969, end: 20975, rendered-as: \22render\22 } })_call", i8** %macro_arg_space22, align 8
  %b_variable_load23 = load i8*, i8** %macro_arg_space22, align 8
  store i8* %b_variable_load23, i8** %next, align 8
  %next_variable_load = load i8*, i8** %next, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21008, end: 21010, rendered-as: \22==\22 } })_call" = call i1 @"==.19"(i8* %next_variable_load, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @global_str.78, i32 0, i32 0))
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21008, end: 21010, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_else_block

if_then_block:                                    ; preds = %entry_block
  %parser_variable_load24 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep25 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load24, i32 0, i32 0
  %struct_gep_deref26 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep25, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21041, end: 21055, rendered-as: \22takeIdentifier\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeIdentifier({ i8*, i64, i64 }* %struct_gep_deref26)
  %parser_variable_load27 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21081, end: 21090, rendered-as: \22parseExpr\22 } })_call" = call { i8*, i64 } @parseExpr({ { i8*, i64, i64 }* }* %parser_variable_load27)
  store { i8*, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21081, end: 21090, rendered-as: \22parseExpr\22 } })_call", { i8*, i64 }* %macro_arg_space28, align 8
  %b_variable_load29 = load { i8*, i64 }, { i8*, i64 }* %macro_arg_space28, align 8
  store { i8*, i64 } %b_variable_load29, { i8*, i64 }* %else, align 8
  br label %if_cont_block

if_else_block:                                    ; preds = %entry_block
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_else_block, %if_then_block
  %if_phi = phi i1 [ true, %if_then_block ], [ false, %if_else_block ]
  store i1 %if_phi, i1* %macro_arg_space30, align 1
  %b_variable_load31 = load i1, i1* %macro_arg_space30, align 1
  store i1 %b_variable_load31, i1* %has_else, align 1
  %next_variable_load32 = load i8*, i8** %next, align 8
  call void @free(i8* %next_variable_load32)
  %parser_variable_load33 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep34 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load33, i32 0, i32 0
  %struct_gep_deref35 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep34, align 8
  %struct_gep36 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %struct_gep_deref35, i32 0, i32 1
  %b_variable_load37 = load i64, i64* %struct_gep36, align 4
  store i64 %b_variable_load37, i64* %end, align 4
  %struct_gep38 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %i, i32 0, i32 0
  %parser_variable_load39 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep40 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load39, i32 0, i32 0
  %struct_gep_deref41 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep40, align 8
  %start_variable_load = load i64, i64* %start, align 4
  %end_variable_load = load i64, i64* %end, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21210, end: 21223, rendered-as: \22lexstring#new\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @"lexstring#new"({ i8*, i64, i64 }* %struct_gep_deref41, i64 %start_variable_load, i64 %end_variable_load)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21210, end: 21223, rendered-as: \22lexstring#new\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space42, align 8
  %b_variable_load43 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space42, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load43, { { i8*, i64, i64 }*, i64, i64 }* %struct_gep38, align 8
  %struct_gep44 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %i, i32 0, i32 1
  %b_variable_load45 = load { i8*, i64 }, { i8*, i64 }* %cond, align 8
  store { i8*, i64 } %b_variable_load45, { i8*, i64 }* %struct_gep44, align 8
  %struct_gep46 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %i, i32 0, i32 2
  %b_variable_load47 = load { i8*, i64 }, { i8*, i64 }* %then, align 8
  store { i8*, i64 } %b_variable_load47, { i8*, i64 }* %struct_gep46, align 8
  %struct_gep48 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %i, i32 0, i32 4
  %b_variable_load49 = load { i8*, i64 }, { i8*, i64 }* %else, align 8
  store { i8*, i64 } %b_variable_load49, { i8*, i64 }* %struct_gep48, align 8
  %struct_gep50 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %i, i32 0, i32 3
  %b_variable_load51 = load i1, i1* %has_else, align 1
  store i1 %b_variable_load51, i1* %struct_gep50, align 1
  %i_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %i, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } } %i_variable_load
}

define { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* @copy.79({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } } %0) {
entry_block:
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } } %0, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %val, align 8
  %val_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %val, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21395, end: 21403, rendered-as: \22flatCopy\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* @flatCopy({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } } %val_variable_load)
  ret { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21395, end: 21403, rendered-as: \22flatCopy\22 } })_call"
}

define { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* @flatCopy({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } } %0) {
entry_block:
  %macro_arg_space = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }*, align 8
  %data = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }*, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } } %0, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %val, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20020, end: 20026, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* null, i32 1) to i64))
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20020, end: 20026, rendered-as: \22malloc\22 } })_call" to { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }*
  store { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %bitcast, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }** %macro_arg_space, align 8
  %b_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }** %macro_arg_space, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %b_variable_load, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }** %data, align 8
  %data_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }** %data, align 8
  %bitcast1 = bitcast { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %data_variable_load to i8*
  %bitcast2 = bitcast { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %val to i8*
  call void @memcpy(i8* %bitcast1, i8* %bitcast2, i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* null, i32 1) to i64))
  %data_variable_load3 = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }** %data, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %data_variable_load3
}

define { i8*, i64 } @asExpr.80({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } } %0) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %expr = alloca { i8*, i64 }, align 8
  %id = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } } %0, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %id, align 8
  %struct_gep = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 1
  store i64 5, i64* %struct_gep, align 4
  %struct_gep1 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 0
  %id_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %id, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21540, end: 21544, rendered-as: \22copy\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* @copy.79({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } } %id_variable_load)
  %bitcast = bitcast { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 }, i1, { i8*, i64 } }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21540, end: 21544, rendered-as: \22copy\22 } })_call" to i8*
  store i8* %bitcast, i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %struct_gep1, align 8
  %expr_variable_load = load { i8*, i64 }, { i8*, i64 }* %expr, align 8
  ret { i8*, i64 } %expr_variable_load
}

declare void @debugWhileExpr.81({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }*, i64)

define { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } } @parseWhileExpr({ { i8*, i64, i64 }* }* %0) {
entry_block:
  %macro_arg_space19 = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %w = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }, align 8
  %end = alloca i64, align 8
  %macro_arg_space8 = alloca { i8*, i64 }, align 8
  %then = alloca { i8*, i64 }, align 8
  %macro_arg_space = alloca { i8*, i64 }, align 8
  %cond = alloca { i8*, i64 }, align 8
  %start = alloca i64, align 8
  %parser = alloca { { i8*, i64, i64 }* }*, align 8
  store { { i8*, i64, i64 }* }* %0, { { i8*, i64, i64 }* }** %parser, align 8
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load, i32 0, i32 0
  %struct_gep_deref = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep, align 8
  %struct_gep1 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %struct_gep_deref, i32 0, i32 1
  %b_variable_load = load i64, i64* %struct_gep1, align 4
  store i64 %b_variable_load, i64* %start, align 4
  %parser_variable_load2 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep3 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load2, i32 0, i32 0
  %struct_gep_deref4 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep3, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21944, end: 21951, rendered-as: \22require\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @require.29({ i8*, i64, i64 }* %struct_gep_deref4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @global_str.84, i32 0, i32 0))
  %parser_variable_load5 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21984, end: 21993, rendered-as: \22parseExpr\22 } })_call" = call { i8*, i64 } @parseExpr({ { i8*, i64, i64 }* }* %parser_variable_load5)
  store { i8*, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 21984, end: 21993, rendered-as: \22parseExpr\22 } })_call", { i8*, i64 }* %macro_arg_space, align 8
  %b_variable_load6 = load { i8*, i64 }, { i8*, i64 }* %macro_arg_space, align 8
  store { i8*, i64 } %b_variable_load6, { i8*, i64 }* %cond, align 8
  %parser_variable_load7 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22020, end: 22029, rendered-as: \22parseExpr\22 } })_call" = call { i8*, i64 } @parseExpr({ { i8*, i64, i64 }* }* %parser_variable_load7)
  store { i8*, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22020, end: 22029, rendered-as: \22parseExpr\22 } })_call", { i8*, i64 }* %macro_arg_space8, align 8
  %b_variable_load9 = load { i8*, i64 }, { i8*, i64 }* %macro_arg_space8, align 8
  store { i8*, i64 } %b_variable_load9, { i8*, i64 }* %then, align 8
  %parser_variable_load10 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep11 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load10, i32 0, i32 0
  %struct_gep_deref12 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep11, align 8
  %struct_gep13 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %struct_gep_deref12, i32 0, i32 1
  %b_variable_load14 = load i64, i64* %struct_gep13, align 4
  store i64 %b_variable_load14, i64* %end, align 4
  %struct_gep15 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %w, i32 0, i32 0
  %parser_variable_load16 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep17 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load16, i32 0, i32 0
  %struct_gep_deref18 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep17, align 8
  %start_variable_load = load i64, i64* %start, align 4
  %end_variable_load = load i64, i64* %end, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22111, end: 22124, rendered-as: \22lexstring#new\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @"lexstring#new"({ i8*, i64, i64 }* %struct_gep_deref18, i64 %start_variable_load, i64 %end_variable_load)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22111, end: 22124, rendered-as: \22lexstring#new\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space19, align 8
  %b_variable_load20 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space19, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load20, { { i8*, i64, i64 }*, i64, i64 }* %struct_gep15, align 8
  %struct_gep21 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %w, i32 0, i32 1
  %b_variable_load22 = load { i8*, i64 }, { i8*, i64 }* %cond, align 8
  store { i8*, i64 } %b_variable_load22, { i8*, i64 }* %struct_gep21, align 8
  %struct_gep23 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %w, i32 0, i32 2
  %b_variable_load24 = load { i8*, i64 }, { i8*, i64 }* %then, align 8
  store { i8*, i64 } %b_variable_load24, { i8*, i64 }* %struct_gep23, align 8
  %w_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %w, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } } %w_variable_load
}

define { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* @copy.85({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } } %0) {
entry_block:
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } } %0, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %val, align 8
  %val_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %val, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22249, end: 22257, rendered-as: \22flatCopy\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* @flatCopy.86({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } } %val_variable_load)
  ret { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22249, end: 22257, rendered-as: \22flatCopy\22 } })_call"
}

define { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* @flatCopy.86({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } } %0) {
entry_block:
  %macro_arg_space = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }*, align 8
  %data = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }*, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } } %0, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %val, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20020, end: 20026, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* null, i32 1) to i64))
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 20020, end: 20026, rendered-as: \22malloc\22 } })_call" to { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }*
  store { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %bitcast, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }** %macro_arg_space, align 8
  %b_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }** %macro_arg_space, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %b_variable_load, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }** %data, align 8
  %data_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }** %data, align 8
  %bitcast1 = bitcast { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %data_variable_load to i8*
  %bitcast2 = bitcast { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %val to i8*
  call void @memcpy(i8* %bitcast1, i8* %bitcast2, i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* null, i32 1) to i64))
  %data_variable_load3 = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }** %data, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %data_variable_load3
}

define { i8*, i64 } @asExpr.87({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } } %0) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %expr = alloca { i8*, i64 }, align 8
  %id = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } } %0, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %id, align 8
  %struct_gep = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 1
  store i64 6, i64* %struct_gep, align 4
  %struct_gep1 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 0
  %id_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }, { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %id, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22396, end: 22400, rendered-as: \22copy\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* @copy.85({ { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } } %id_variable_load)
  %bitcast = bitcast { { { i8*, i64, i64 }*, i64, i64 }, { i8*, i64 }, { i8*, i64 } }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 22396, end: 22400, rendered-as: \22copy\22 } })_call" to i8*
  store i8* %bitcast, i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %struct_gep1, align 8
  %expr_variable_load = load { i8*, i64 }, { i8*, i64 }* %expr, align 8
  ret { i8*, i64 } %expr_variable_load
}

declare { i8*, i64 } @parseExpr.88({ { i8*, i64, i64 }* }*)

define i64 @hash(i64 %0) {
entry_block:
  %h = alloca i64, align 8
  store i64 %0, i64* %h, align 4
  %h_variable_load = load i64, i64* %h, align 4
  ret i64 %h_variable_load
}

define i64 @hash.94(i8* %0) {
entry_block:
  %macro_arg_space23 = alloca i64, align 8
  %macro_arg_space20 = alloca i64, align 8
  %macro_arg_space16 = alloca i64, align 8
  %macro_arg_space13 = alloca i64, align 8
  %macro_arg_space11 = alloca i64, align 8
  %macro_arg_space8 = alloca i64, align 8
  %p = alloca i64, align 8
  %macro_arg_space6 = alloca i8, align 1
  %q = alloca i8, align 1
  %macro_arg_space1 = alloca i64, align 8
  %total = alloca i64, align 8
  %macro_arg_space = alloca i64, align 8
  %i = alloca i64, align 8
  %h = alloca i8*, align 8
  store i8* %0, i8** %h, align 8
  store i64 0, i64* %macro_arg_space, align 4
  %b_variable_load = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load, i64* %i, align 4
  store i64 0, i64* %macro_arg_space1, align 4
  %b_variable_load2 = load i64, i64* %macro_arg_space1, align 4
  store i64 %b_variable_load2, i64* %total, align 4
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %while_loop_body_basic_block, %entry_block
  %h_variable_load = load i8*, i8** %h, align 8
  %i_variable_load = load i64, i64* %i, align 4
  %"Brackets(LexString { lexer: \22...\22, start: 27893, end: 27894, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 27895, end: 27896, rendered-as: \22]\22 })_call" = call i8* @"brackets-[-]"(i8* %h_variable_load, i64 %i_variable_load)
  %deref_load = load i8, i8* %"Brackets(LexString { lexer: \22...\22, start: 27893, end: 27894, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 27895, end: 27896, rendered-as: \22]\22 })_call", align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 27899, end: 27901, rendered-as: \22!=\22 } })_call" = call i1 @"!=.2"(i8 %deref_load, i8 0)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 27899, end: 27901, rendered-as: \22!=\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %h_variable_load3 = load i8*, i8** %h, align 8
  %i_variable_load4 = load i64, i64* %i, align 4
  %"Brackets(LexString { lexer: \22...\22, start: 27922, end: 27923, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 27924, end: 27925, rendered-as: \22]\22 })_call" = call i8* @"brackets-[-]"(i8* %h_variable_load3, i64 %i_variable_load4)
  %deref_load5 = load i8, i8* %"Brackets(LexString { lexer: \22...\22, start: 27922, end: 27923, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 27924, end: 27925, rendered-as: \22]\22 })_call", align 1
  store i8 %deref_load5, i8* %macro_arg_space6, align 1
  %b_variable_load7 = load i8, i8* %macro_arg_space6, align 1
  store i8 %b_variable_load7, i8* %q, align 1
  %q_variable_load = load i8, i8* %q, align 1
  %asm_int_zero_ext = zext i8 %q_variable_load to i64
  store i64 %asm_int_zero_ext, i64* %macro_arg_space8, align 4
  %b_variable_load9 = load i64, i64* %macro_arg_space8, align 4
  store i64 %b_variable_load9, i64* %p, align 4
  %i_variable_load10 = load i64, i64* %i, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 28053, end: 28054, rendered-as: \22^\22 } })_call" = call i64 @"^"(i64 53, i64 %i_variable_load10)
  %p_variable_load = load i64, i64* %p, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 28057, end: 28058, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 28053, end: 28054, rendered-as: \22^\22 } })_call", i64 %p_variable_load)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 28057, end: 28058, rendered-as: \22*\22 } })_call", i64* %macro_arg_space11, align 4
  %a_variable_load = load i64, i64* %total, align 4
  %b_variable_load12 = load i64, i64* %macro_arg_space11, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 %b_variable_load12)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call", i64* %macro_arg_space13, align 4
  %b_variable_load14 = load i64, i64* %macro_arg_space13, align 4
  store i64 %b_variable_load14, i64* %total, align 4
  %a_variable_load15 = load i64, i64* %total, align 4
  store i64 1, i64* %macro_arg_space16, align 4
  %a_variable_load17 = load i64, i64* %i, align 4
  %b_variable_load18 = load i64, i64* %macro_arg_space16, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call19" = call i64 @"+"(i64 %a_variable_load17, i64 %b_variable_load18)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2422, end: 2423, rendered-as: \22+\22 } })_call19", i64* %macro_arg_space20, align 4
  %b_variable_load21 = load i64, i64* %macro_arg_space20, align 4
  store i64 %b_variable_load21, i64* %i, align 4
  %a_variable_load22 = load i64, i64* %i, align 4
  br label %while_loop_cond_check_basic_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %total_variable_load = load i64, i64* %total, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 28096, end: 28097, rendered-as: \22%\22 } })_call" = call i64 @"%"(i64 %total_variable_load, i64 1000000009)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 28096, end: 28097, rendered-as: \22%\22 } })_call", i64* %macro_arg_space23, align 4
  %b_variable_load24 = load i64, i64* %macro_arg_space23, align 4
  store i64 %b_variable_load24, i64* %total, align 4
  %total_variable_load25 = load i64, i64* %total, align 4
  ret i64 %total_variable_load25
}

define i64 @main() {
entry_block:
  %macro_arg_space6 = alloca { i8*, i64 }, align 8
  %e = alloca { i8*, i64 }, align 8
  %macro_arg_space4 = alloca { { i8*, i64, i64 }* }*, align 8
  %deref_space3 = alloca { { i8*, i64, i64 }* }, align 8
  %parser = alloca { { i8*, i64, i64 }* }*, align 8
  %macro_arg_space1 = alloca { i8*, i64, i64 }*, align 8
  %deref_space = alloca { i8*, i64, i64 }, align 8
  %lexer = alloca { i8*, i64, i64 }*, align 8
  %macro_arg_space = alloca i8*, align 8
  %code = alloca i8*, align 8
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @global_str.95, i32 0, i32 0), i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %code, align 8
  %code_variable_load = load i8*, i8** %code, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 28309, end: 28318, rendered-as: \22lexer#new\22 } })_call" = call { i8*, i64, i64 } @"lexer#new"(i8* %code_variable_load)
  store { i8*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 28309, end: 28318, rendered-as: \22lexer#new\22 } })_call", { i8*, i64, i64 }* %deref_space, align 8
  store { i8*, i64, i64 }* %deref_space, { i8*, i64, i64 }** %macro_arg_space1, align 8
  %b_variable_load2 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %macro_arg_space1, align 8
  store { i8*, i64, i64 }* %b_variable_load2, { i8*, i64, i64 }** %lexer, align 8
  %lexer_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 28349, end: 28359, rendered-as: \22parser#new\22 } })_call" = call { { i8*, i64, i64 }* } @"parser#new"({ i8*, i64, i64 }* %lexer_variable_load)
  store { { i8*, i64, i64 }* } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 28349, end: 28359, rendered-as: \22parser#new\22 } })_call", { { i8*, i64, i64 }* }* %deref_space3, align 8
  store { { i8*, i64, i64 }* }* %deref_space3, { { i8*, i64, i64 }* }** %macro_arg_space4, align 8
  %b_variable_load5 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %macro_arg_space4, align 8
  store { { i8*, i64, i64 }* }* %b_variable_load5, { { i8*, i64, i64 }* }** %parser, align 8
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 28389, end: 28398, rendered-as: \22parseExpr\22 } })_call" = call { i8*, i64 } @parseExpr({ { i8*, i64, i64 }* }* %parser_variable_load)
  store { i8*, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 28389, end: 28398, rendered-as: \22parseExpr\22 } })_call", { i8*, i64 }* %macro_arg_space6, align 8
  %b_variable_load7 = load { i8*, i64 }, { i8*, i64 }* %macro_arg_space6, align 8
  store { i8*, i64 } %b_variable_load7, { i8*, i64 }* %e, align 8
  call void @debugExpr({ i8*, i64 }* %e, i64 0)
  call void @exit(i64 0)
  ret i64 0
}
