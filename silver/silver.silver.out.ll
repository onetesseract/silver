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
@global_str.30 = private unnamed_addr constant [11 x i8] c"Expected `\00", align 1
@global_str.31 = private unnamed_addr constant [12 x i8] c"` but got `\00", align 1
@global_str.32 = private unnamed_addr constant [3 x i8] c"`\0A\00", align 1
@global_str.33 = private unnamed_addr constant [18 x i8] c"invalid character\00", align 1
@global_str.34 = private unnamed_addr constant [16 x i8] c"ExprType#Number\00", align 1
@global_str.35 = private unnamed_addr constant [20 x i8] c"ExprType#Identifier\00", align 1
@global_str.36 = private unnamed_addr constant [15 x i8] c"ExprType#Block\00", align 1
@global_str.37 = private unnamed_addr constant [30 x i8] c"Debug expr not implmented yet\00", align 1
@global_str.38 = private unnamed_addr constant [16 x i8] c"Parsing number\0A\00", align 1
@global_str.39 = private unnamed_addr constant [16 x i8] c"Expected number\00", align 1
@global_str.42 = private unnamed_addr constant [25 x i8] c"Parsing identifier expr\0A\00", align 1
@global_str.43 = private unnamed_addr constant [26 x i8] c"Expected valid identifier\00", align 1
@global_str.47 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@global_str.48 = private unnamed_addr constant [9 x i8] c"Block: {\00", align 1
@global_str.49 = private unnamed_addr constant [19 x i8] c"using last value: \00", align 1
@global_str.50 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@global_str.51 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@global_str.52 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@global_str.53 = private unnamed_addr constant [20 x i8] c"Parsing block expr\0A\00", align 1
@global_str.55 = private unnamed_addr constant [12 x i8] c"Broke loop\0A\00", align 1
@global_str.56 = private unnamed_addr constant [6 x i8] c"got: \00", align 1
@global_str.60 = private unnamed_addr constant [13 x i8] c"Parsing expr\00", align 1
@global_str.61 = private unnamed_addr constant [15 x i8] c"Peeked char: `\00", align 1
@global_str.62 = private unnamed_addr constant [3 x i8] c"`\0A\00", align 1
@global_str.63 = private unnamed_addr constant [16 x i8] c"Cannot parse: `\00", align 1
@global_str.64 = private unnamed_addr constant [3 x i8] c"`\0A\00", align 1
@global_str.70 = private unnamed_addr constant [5 x i8] c"yay\0A\00", align 1
@global_str.71 = private unnamed_addr constant [5 x i8] c"noo\0A\00", align 1
@global_str.72 = private unnamed_addr constant [16 x i8] c"correct length\0A\00", align 1
@global_str.73 = private unnamed_addr constant [7 x i8] c"{test}\00", align 1

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

define void @assert(i1 %0, i8* %1) {
entry_block:
  %message = alloca i8*, align 8
  %val = alloca i1, align 1
  store i1 %0, i1* %val, align 1
  store i8* %1, i8** %message, align 8
  %val_variable_load = load i1, i1* %val, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2470, end: 2471, rendered-as: \22!\22 } })_call" = call i1 @"!"(i1 %val_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2470, end: 2471, rendered-as: \22!\22 } })_call", label %if_then_block, label %if_cont_block

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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3253, end: 3259, rendered-as: \22strcmp\22 } })_call" = call i64 @strcmp(i8* %a_variable_load, i8* %b_variable_load)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3266, end: 3268, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3253, end: 3259, rendered-as: \22strcmp\22 } })_call", i64 0)
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3266, end: 3268, rendered-as: \22==\22 } })_call"
}

define i1 @"!=.20"(i8* %0, i8* %1) {
entry_block:
  %b = alloca i8*, align 8
  %a = alloca i8*, align 8
  store i8* %0, i8** %a, align 8
  store i8* %1, i8** %b, align 8
  %a_variable_load = load i8*, i8** %a, align 8
  %b_variable_load = load i8*, i8** %b, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3317, end: 3323, rendered-as: \22strcmp\22 } })_call" = call i64 @strcmp(i8* %a_variable_load, i8* %b_variable_load)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3330, end: 3332, rendered-as: \22!=\22 } })_call" = call i1 @"!="(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3317, end: 3323, rendered-as: \22strcmp\22 } })_call", i64 0)
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3330, end: 3332, rendered-as: \22!=\22 } })_call"
}

define i8* @copy(i8* %0) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %dupl = alloca i8*, align 8
  %str = alloca i8*, align 8
  store i8* %0, i8** %str, align 8
  %str_variable_load = load i8*, i8** %str, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3406, end: 3412, rendered-as: \22strlen\22 } })_call" = call i64 @strlen(i8* %str_variable_load)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3415, end: 3416, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3406, end: 3412, rendered-as: \22strlen\22 } })_call", i64 1)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3395, end: 3401, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3415, end: 3416, rendered-as: \22+\22 } })_call")
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3395, end: 3401, rendered-as: \22malloc\22 } })_call", i8** %macro_arg_space, align 8
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3788, end: 3794, rendered-as: \22strlen\22 } })_call" = call i64 @strlen(i8* %str_variable_load)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3788, end: 3794, rendered-as: \22strlen\22 } })_call", i64* %macro_arg_space, align 4
  %b_variable_load = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load, i64* %length, align 4
  store i64 0, i64* %macro_arg_space1, align 4
  %b_variable_load2 = load i64, i64* %macro_arg_space1, align 4
  store i64 %b_variable_load2, i64* %index, align 4
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %if_cont_block, %entry_block
  %index_variable_load = load i64, i64* %index, align 4
  %length_variable_load = load i64, i64* %length, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3834, end: 3836, rendered-as: \22!=\22 } })_call" = call i1 @"!="(i64 %index_variable_load, i64 %length_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3834, end: 3836, rendered-as: \22!=\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %str_variable_load3 = load i8*, i8** %str, align 8
  %index_variable_load4 = load i64, i64* %index, align 4
  %"Brackets(LexString { lexer: \22...\22, start: 3862, end: 3863, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 3868, end: 3869, rendered-as: \22]\22 })_call" = call i8* @"brackets-[-]"(i8* %str_variable_load3, i64 %index_variable_load4)
  %deref_load = load i8, i8* %"Brackets(LexString { lexer: \22...\22, start: 3862, end: 3863, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 3868, end: 3869, rendered-as: \22]\22 })_call", align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3871, end: 3873, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %deref_load, i8 %char_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3871, end: 3873, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  ret i1 false

if_then_block:                                    ; preds = %while_loop_body_basic_block
  ret i1 true
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %while_loop_body_basic_block
  %a_variable_load = load i64, i64* %index, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call", i64* %macro_arg_space5, align 4
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3995, end: 3997, rendered-as: \22>=\22 } })_call" = call i1 @">=.6"(i8 %char_variable_load, i8 48)
  %char_variable_load1 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4012, end: 4014, rendered-as: \22<=\22 } })_call" = call i1 @"<=.5"(i8 %char_variable_load1, i8 57)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4003, end: 4005, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3995, end: 3997, rendered-as: \22>=\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4012, end: 4014, rendered-as: \22<=\22 } })_call")
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4003, end: 4005, rendered-as: \22&&\22 } })_call"
}

define i1 @isAlpha(i8 %0) {
entry_block:
  %char = alloca i8, align 1
  store i8 %0, i8* %char, align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4061, end: 4063, rendered-as: \22>=\22 } })_call" = call i1 @">=.6"(i8 %char_variable_load, i8 65)
  %char_variable_load1 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4078, end: 4080, rendered-as: \22<=\22 } })_call" = call i1 @"<=.5"(i8 %char_variable_load1, i8 90)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4069, end: 4071, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4061, end: 4063, rendered-as: \22>=\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4078, end: 4080, rendered-as: \22<=\22 } })_call")
  %char_variable_load2 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4095, end: 4097, rendered-as: \22>=\22 } })_call" = call i1 @">=.6"(i8 %char_variable_load2, i8 97)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4086, end: 4088, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4069, end: 4071, rendered-as: \22&&\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4095, end: 4097, rendered-as: \22>=\22 } })_call")
  %char_variable_load3 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4112, end: 4114, rendered-as: \22<=\22 } })_call" = call i1 @"<=.5"(i8 %char_variable_load3, i8 122)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4103, end: 4105, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4086, end: 4088, rendered-as: \22||\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4112, end: 4114, rendered-as: \22<=\22 } })_call")
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4103, end: 4105, rendered-as: \22&&\22 } })_call"
}

define i1 @isAlphanumeric(i8 %0) {
entry_block:
  %char = alloca i8, align 1
  store i8 %0, i8* %char, align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4167, end: 4176, rendered-as: \22isNumeric\22 } })_call" = call i1 @isNumeric(i8 %char_variable_load)
  %char_variable_load1 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4187, end: 4194, rendered-as: \22isAlpha\22 } })_call" = call i1 @isAlpha(i8 %char_variable_load1)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4179, end: 4181, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4167, end: 4176, rendered-as: \22isNumeric\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4187, end: 4194, rendered-as: \22isAlpha\22 } })_call")
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4179, end: 4181, rendered-as: \22||\22 } })_call"
}

define i1 @isWhitespace(i8 %0) {
entry_block:
  %char = alloca i8, align 1
  store i8 %0, i8* %char, align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4244, end: 4252, rendered-as: \22contains\22 } })_call" = call i1 @contains(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @global_str.21, i32 0, i32 0), i8 %char_variable_load)
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4244, end: 4252, rendered-as: \22contains\22 } })_call"
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4328, end: 4330, rendered-as: \22!=\22 } })_call" = call i1 @"!="(i64 %repeat_variable_load, i64 0)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4328, end: 4330, rendered-as: \22!=\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  call void @putchar(i8 32)
  %a_variable_load = load i64, i64* %repeat, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2243, end: 2244, rendered-as: \22-\22 } })_call" = call i64 @-(i64 %a_variable_load, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2243, end: 2244, rendered-as: \22-\22 } })_call", i64* %macro_arg_space, align 4
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4780, end: 4786, rendered-as: \22strlen\22 } })_call" = call i64 @strlen(i8* %struct_gep_deref)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4780, end: 4786, rendered-as: \22strlen\22 } })_call", i64* %macro_arg_space5, align 4
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5031, end: 5033, rendered-as: \22>=\22 } })_call" = call i1 @">="(i64 %struct_gep_deref, i64 %struct_gep_deref3)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5031, end: 5033, rendered-as: \22>=\22 } })_call", label %if_then_block, label %if_cont_block

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
  %"Brackets(LexString { lexer: \22...\22, start: 5103, end: 5104, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 5115, end: 5116, rendered-as: \22]\22 })_call" = call i8* @"brackets-[-]"(i8* %struct_gep_deref6, i64 %struct_gep_deref9)
  %deref_load = load i8, i8* %"Brackets(LexString { lexer: \22...\22, start: 5103, end: 5104, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 5115, end: 5116, rendered-as: \22]\22 })_call", align 1
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5178, end: 5186, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load)
  store i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5178, end: 5186, rendered-as: \22peekChar\22 } })_call", i8* %macro_arg_space, align 1
  %b_variable_load = load i8, i8* %macro_arg_space, align 1
  store i8 %b_variable_load, i8* %a, align 1
  %lexer_variable_load1 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load1, i32 0, i32 1
  %lexer_variable_load2 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep3 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load2, i32 0, i32 1
  %struct_gep_deref = load i64, i64* %struct_gep3, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5220, end: 5221, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %struct_gep_deref, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5220, end: 5221, rendered-as: \22+\22 } })_call", i64* %macro_arg_space4, align 4
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5282, end: 5284, rendered-as: \22>=\22 } })_call" = call i1 @">="(i64 %struct_gep_deref, i64 %struct_gep_deref3)
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5282, end: 5284, rendered-as: \22>=\22 } })_call"
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5482, end: 5483, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %struct_gep_deref, i64 %struct_gep_deref2)
  %struct_gep3 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %b, i32 0, i32 1
  %struct_gep_deref4 = load i64, i64* %struct_gep3, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5494, end: 5496, rendered-as: \22!=\22 } })_call" = call i1 @"!="(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5482, end: 5483, rendered-as: \22+\22 } })_call", i64 %struct_gep_deref4)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5494, end: 5496, rendered-as: \22!=\22 } })_call", label %if_then_block, label %if_cont_block

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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5777, end: 5778, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %struct_gep_deref9, i64 %struct_gep_deref11)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5777, end: 5778, rendered-as: \22+\22 } })_call", i64* %macro_arg_space, align 4
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6035, end: 6036, rendered-as: \22-\22 } })_call" = call i64 @-(i64 %end_variable_load, i64 %start_variable_load)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6035, end: 6036, rendered-as: \22-\22 } })_call", i64* %macro_arg_space, align 4
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6238, end: 6239, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %struct_gep_deref, i64 1)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6217, end: 6223, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6238, end: 6239, rendered-as: \22+\22 } })_call")
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6217, end: 6223, rendered-as: \22malloc\22 } })_call", i8** %macro_arg_space, align 8
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
  %"Brackets(LexString { lexer: \22...\22, start: 6285, end: 6286, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 6302, end: 6303, rendered-as: \22]\22 })_call" = call i8* @"brackets-[-]"(i8* %struct_gep_deref5, i64 %struct_gep_deref8)
  %lexstring_variable_load9 = load { { i8*, i64, i64 }*, i64, i64 }*, { { i8*, i64, i64 }*, i64, i64 }** %lexstring, align 8
  %struct_gep10 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %lexstring_variable_load9, i32 0, i32 2
  %struct_gep_deref11 = load i64, i64* %struct_gep10, align 4
  call void @strncpy(i8* %str_variable_load, i8* %"Brackets(LexString { lexer: \22...\22, start: 6285, end: 6286, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 6302, end: 6303, rendered-as: \22]\22 })_call", i64 %struct_gep_deref11)
  %str_variable_load12 = load i8*, i8** %str, align 8
  %lexstring_variable_load13 = load { { i8*, i64, i64 }*, i64, i64 }*, { { i8*, i64, i64 }*, i64, i64 }** %lexstring, align 8
  %struct_gep14 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %lexstring_variable_load13, i32 0, i32 2
  %struct_gep_deref15 = load i64, i64* %struct_gep14, align 4
  %"Brackets(LexString { lexer: \22...\22, start: 6328, end: 6329, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 6342, end: 6343, rendered-as: \22]\22 })_call" = call i8* @"brackets-[-]"(i8* %str_variable_load12, i64 %struct_gep_deref15)
  store i8* %"Brackets(LexString { lexer: \22...\22, start: 6328, end: 6329, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 6342, end: 6343, rendered-as: \22]\22 })_call", i8** %macro_arg_space16, align 8
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6444, end: 6450, rendered-as: \22render\22 } })_call" = call i8* @render({ { i8*, i64, i64 }*, i64, i64 }* %val_variable_load)
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6444, end: 6450, rendered-as: \22render\22 } })_call", i8** %macro_arg_space, align 8
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6802, end: 6810, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load8)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6813, end: 6822, rendered-as: \22isNumeric\22 } })_call" = call i1 @isNumeric(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6802, end: 6810, rendered-as: \22peekChar\22 } })_call")
  %lexer_variable_load9 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6836, end: 6844, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load9)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6847, end: 6849, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6836, end: 6844, rendered-as: \22peekChar\22 } })_call", i8 46)
  %first_dot_variable_load = load i1, i1* %first_dot, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6855, end: 6857, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6847, end: 6849, rendered-as: \22==\22 } })_call", i1 %first_dot_variable_load)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6825, end: 6827, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6813, end: 6822, rendered-as: \22isNumeric\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6855, end: 6857, rendered-as: \22&&\22 } })_call")
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6825, end: 6827, rendered-as: \22||\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %struct_gep10 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load = load i64, i64* %struct_gep10, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call", i64* %macro_arg_space11, align 4
  %b_variable_load12 = load i64, i64* %macro_arg_space11, align 4
  store i64 %b_variable_load12, i64* %struct_gep10, align 4
  %a_variable_load13 = load i64, i64* %struct_gep10, align 4
  %lexer_variable_load14 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6913, end: 6921, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load14)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6924, end: 6926, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6913, end: 6921, rendered-as: \22takeChar\22 } })_call", i8 46)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6924, end: 6926, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7031, end: 7038, rendered-as: \22isAlpha\22 } })_call" = call i1 @isAlpha(i8 %char_variable_load)
  %char_variable_load1 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7050, end: 7059, rendered-as: \22isNumeric\22 } })_call" = call i1 @isNumeric(i8 %char_variable_load1)
  %first_variable_load = load i1, i1* %first, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7065, end: 7066, rendered-as: \22!\22 } })_call" = call i1 @"!"(i1 %first_variable_load)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7062, end: 7064, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7050, end: 7059, rendered-as: \22isNumeric\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7065, end: 7066, rendered-as: \22!\22 } })_call")
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7041, end: 7043, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7031, end: 7038, rendered-as: \22isAlpha\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7062, end: 7064, rendered-as: \22&&\22 } })_call")
  %char_variable_load2 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7082, end: 7084, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %char_variable_load2, i8 95)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7073, end: 7075, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7041, end: 7043, rendered-as: \22||\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7082, end: 7084, rendered-as: \22==\22 } })_call")
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7073, end: 7075, rendered-as: \22||\22 } })_call"
}

define i1 @isSpecialId(i8 %0) {
entry_block:
  %char = alloca i8, align 1
  store i8 %0, i8* %char, align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7145, end: 7153, rendered-as: \22contains\22 } })_call" = call i1 @contains(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @global_str.24, i32 0, i32 0), i8 %char_variable_load)
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7145, end: 7153, rendered-as: \22contains\22 } })_call"
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7364, end: 7372, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load8)
  %first_variable_load = load i1, i1* %first, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7375, end: 7391, rendered-as: \22isConventionalId\22 } })_call" = call i1 @isConventionalId(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7364, end: 7372, rendered-as: \22peekChar\22 } })_call", i1 %first_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7375, end: 7391, rendered-as: \22isConventionalId\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %struct_gep9 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load = load i64, i64* %struct_gep9, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call", i64* %macro_arg_space10, align 4
  %b_variable_load11 = load i64, i64* %macro_arg_space10, align 4
  store i64 %b_variable_load11, i64* %struct_gep9, align 4
  %a_variable_load12 = load i64, i64* %struct_gep9, align 4
  %first_variable_load13 = load i1, i1* %first, align 1
  br i1 %first_variable_load13, label %if_then_block, label %if_cont_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %struct_gep17 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %struct_gep_deref = load i64, i64* %struct_gep17, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7516, end: 7518, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref, i64 0)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7516, end: 7518, rendered-as: \22==\22 } })_call", label %if_then_block18, label %if_cont_block19

if_then_block:                                    ; preds = %while_loop_body_basic_block
  store i1 false, i1* %macro_arg_space14, align 1
  %b_variable_load15 = load i1, i1* %macro_arg_space14, align 1
  store i1 %b_variable_load15, i1* %first, align 1
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %while_loop_body_basic_block
  %lexer_variable_load16 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7477, end: 7485, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load16)
  br label %while_loop_cond_check_basic_block

if_then_block18:                                  ; preds = %while_loop_cont_basic_block
  br label %while_loop_cond_check_basic_block20

if_cont_block19:                                  ; preds = %while_loop_cont_basic_block22, %while_loop_cont_basic_block
  %string_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  ret { { i8*, i64, i64 }*, i64, i64 } %string_variable_load

while_loop_cond_check_basic_block20:              ; preds = %while_loop_body_basic_block21, %if_then_block18
  %lexer_variable_load23 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7543, end: 7551, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load23)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7554, end: 7565, rendered-as: \22isSpecialId\22 } })_call" = call i1 @isSpecialId(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7543, end: 7551, rendered-as: \22peekChar\22 } })_call")
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7554, end: 7565, rendered-as: \22isSpecialId\22 } })_call", label %while_loop_body_basic_block21, label %while_loop_cont_basic_block22

while_loop_body_basic_block21:                    ; preds = %while_loop_cond_check_basic_block20
  %struct_gep24 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load25 = load i64, i64* %struct_gep24, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call26" = call i64 @"+"(i64 %a_variable_load25, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call26", i64* %macro_arg_space27, align 4
  %b_variable_load28 = load i64, i64* %macro_arg_space27, align 4
  store i64 %b_variable_load28, i64* %struct_gep24, align 4
  %a_variable_load29 = load i64, i64* %struct_gep24, align 4
  %lexer_variable_load30 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7617, end: 7625, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load30)
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7845, end: 7853, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load6)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7856, end: 7868, rendered-as: \22isWhitespace\22 } })_call" = call i1 @isWhitespace(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7845, end: 7853, rendered-as: \22peekChar\22 } })_call")
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7856, end: 7868, rendered-as: \22isWhitespace\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %struct_gep7 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load = load i64, i64* %struct_gep7, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call", i64* %macro_arg_space8, align 4
  %b_variable_load9 = load i64, i64* %macro_arg_space8, align 4
  store i64 %b_variable_load9, i64* %struct_gep7, align 4
  %a_variable_load10 = load i64, i64* %struct_gep7, align 4
  %lexer_variable_load11 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7912, end: 7920, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load11)
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8115, end: 8123, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load6)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8126, end: 8128, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8115, end: 8123, rendered-as: \22peekChar\22 } })_call", i8 47)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8126, end: 8128, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  %lexer_variable_load7 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8166, end: 8170, rendered-as: \22peek\22 } })_call" = call { i8*, i64, i64 } @peek({ i8*, i64, i64 }* %lexer_variable_load7)
  store { i8*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8166, end: 8170, rendered-as: \22peek\22 } })_call", { i8*, i64, i64 }* %macro_arg_space8, align 8
  %b_variable_load9 = load { i8*, i64, i64 }, { i8*, i64, i64 }* %macro_arg_space8, align 8
  store { i8*, i64, i64 } %b_variable_load9, { i8*, i64, i64 }* %peeked_, align 8
  store { i8*, i64, i64 }* %peeked_, { i8*, i64, i64 }** %macro_arg_space10, align 8
  %b_variable_load11 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %macro_arg_space10, align 8
  store { i8*, i64, i64 }* %b_variable_load11, { i8*, i64, i64 }** %peeked, align 8
  %peeked_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %peeked, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8224, end: 8232, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %peeked_variable_load)
  %peeked_variable_load12 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %peeked, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8259, end: 8267, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %peeked_variable_load12)
  store i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8259, end: 8267, rendered-as: \22peekChar\22 } })_call", i8* %macro_arg_space13, align 1
  %b_variable_load14 = load i8, i8* %macro_arg_space13, align 1
  store i8 %b_variable_load14, i8* %c, align 1
  %c_variable_load = load i8, i8* %c, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8284, end: 8286, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %c_variable_load, i8 47)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8284, end: 8286, rendered-as: \22==\22 } })_call", label %if_then_block15, label %if_else_block

if_cont_block:                                    ; preds = %if_cont_block16, %entry_block
  %string_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  ret { { i8*, i64, i64 }*, i64, i64 } %string_variable_load

if_then_block15:                                  ; preds = %if_then_block
  %lexer_variable_load17 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8311, end: 8319, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load17)
  %lexer_variable_load18 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8341, end: 8349, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load18)
  %struct_gep19 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  store i64 2, i64* %macro_arg_space20, align 4
  %a_variable_load = load i64, i64* %struct_gep19, align 4
  %b_variable_load21 = load i64, i64* %macro_arg_space20, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 %b_variable_load21)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call", i64* %macro_arg_space22, align 4
  %b_variable_load23 = load i64, i64* %macro_arg_space22, align 4
  store i64 %b_variable_load23, i64* %struct_gep19, align 4
  %a_variable_load24 = load i64, i64* %struct_gep19, align 4
  br label %while_loop_cond_check_basic_block

if_else_block:                                    ; preds = %if_then_block
  %c_variable_load31 = load i8, i8* %c, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8500, end: 8502, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %c_variable_load31, i8 42)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8500, end: 8502, rendered-as: \22==\22 } })_call", label %if_then_block32, label %if_cont_block33

if_cont_block16:                                  ; preds = %if_cont_block33, %while_loop_cont_basic_block
  br label %if_cont_block

while_loop_cond_check_basic_block:                ; preds = %while_loop_body_basic_block, %if_then_block15
  %lexer_variable_load25 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8411, end: 8419, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load25)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8422, end: 8424, rendered-as: \22!=\22 } })_call" = call i1 @"!=.2"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8411, end: 8419, rendered-as: \22takeChar\22 } })_call", i8 10)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8422, end: 8424, rendered-as: \22!=\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %struct_gep26 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load27 = load i64, i64* %struct_gep26, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load27, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call", i64* %macro_arg_space28, align 4
  %b_variable_load29 = load i64, i64* %macro_arg_space28, align 4
  store i64 %b_variable_load29, i64* %struct_gep26, align 4
  %a_variable_load30 = load i64, i64* %struct_gep26, align 4
  br label %while_loop_cond_check_basic_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  br label %if_cont_block16

if_then_block32:                                  ; preds = %if_else_block
  %lexer_variable_load34 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8527, end: 8535, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load34)
  %lexer_variable_load35 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8557, end: 8565, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load35)
  %struct_gep36 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  store i64 2, i64* %macro_arg_space37, align 4
  %a_variable_load38 = load i64, i64* %struct_gep36, align 4
  %b_variable_load39 = load i64, i64* %macro_arg_space37, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call40" = call i64 @"+"(i64 %a_variable_load38, i64 %b_variable_load39)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call40", i64* %macro_arg_space41, align 4
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8653, end: 8661, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load47)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8664, end: 8666, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8653, end: 8661, rendered-as: \22takeChar\22 } })_call", i8 42)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8664, end: 8666, rendered-as: \22==\22 } })_call", label %if_then_block48, label %if_cont_block49

while_loop_cont_basic_block46:                    ; preds = %if_then_block51, %while_loop_cond_check_basic_block44
  br label %if_cont_block33

if_then_block48:                                  ; preds = %while_loop_body_basic_block45
  %lexer_variable_load50 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8702, end: 8710, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load50)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8713, end: 8715, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8702, end: 8710, rendered-as: \22peekChar\22 } })_call", i8 47)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8713, end: 8715, rendered-as: \22==\22 } })_call", label %if_then_block51, label %if_cont_block52

if_cont_block49:                                  ; preds = %if_cont_block52, %while_loop_body_basic_block45
  %struct_gep62 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load63 = load i64, i64* %struct_gep62, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call64" = call i64 @"+"(i64 %a_variable_load63, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call64", i64* %macro_arg_space65, align 4
  %b_variable_load66 = load i64, i64* %macro_arg_space65, align 4
  store i64 %b_variable_load66, i64* %struct_gep62, align 4
  %a_variable_load67 = load i64, i64* %struct_gep62, align 4
  br label %while_loop_cond_check_basic_block44

if_then_block51:                                  ; preds = %if_then_block48
  %lexer_variable_load53 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8756, end: 8764, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load53)
  %struct_gep54 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  store i64 2, i64* %macro_arg_space55, align 4
  %a_variable_load56 = load i64, i64* %struct_gep54, align 4
  %b_variable_load57 = load i64, i64* %macro_arg_space55, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call58" = call i64 @"+"(i64 %a_variable_load56, i64 %b_variable_load57)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call58", i64* %macro_arg_space59, align 4
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9056, end: 9074, rendered-as: \22takeOnlyWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeOnlyWhitespace({ i8*, i64, i64 }* %lexer_variable_load)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9056, end: 9074, rendered-as: \22takeOnlyWhitespace\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  %b_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %while_loop_body_basic_block, %entry_block
  %lexer_variable_load1 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9094, end: 9102, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load1)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9105, end: 9107, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9094, end: 9102, rendered-as: \22peekChar\22 } })_call", i8 47)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9105, end: 9107, rendered-as: \22==\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %lexer_variable_load2 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9138, end: 9149, rendered-as: \22takeComment\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeComment({ i8*, i64, i64 }* %lexer_variable_load2)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9138, end: 9149, rendered-as: \22takeComment\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space3, align 8
  %a_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  %b_variable_load4 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space3, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @"+.22"({ { i8*, i64, i64 }*, i64, i64 } %a_variable_load, { { i8*, i64, i64 }*, i64, i64 } %b_variable_load4)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space5, align 8
  %b_variable_load6 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space5, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load6, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  %a_variable_load7 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  %lexer_variable_load8 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9177, end: 9195, rendered-as: \22takeOnlyWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeOnlyWhitespace({ i8*, i64, i64 }* %lexer_variable_load8)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9177, end: 9195, rendered-as: \22takeOnlyWhitespace\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space9, align 8
  %a_variable_load10 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  %b_variable_load11 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space9, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call12" = call { { i8*, i64, i64 }*, i64, i64 } @"+.22"({ { i8*, i64, i64 }*, i64, i64 } %a_variable_load10, { { i8*, i64, i64 }*, i64, i64 } %b_variable_load11)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call12", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space13, align 8
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9299, end: 9313, rendered-as: \22takeWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %lexer_variable_load)
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9448, end: 9456, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load7)
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9459, end: 9461, rendered-as: \22!=\22 } })_call" = call i1 @"!=.2"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9448, end: 9456, rendered-as: \22takeChar\22 } })_call", i8 %char_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9459, end: 9461, rendered-as: \22!=\22 } })_call", label %if_then_block, label %if_cont_block

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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9734, end: 9748, rendered-as: \22takeWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %lexer_variable_load)
  %lexer_variable_load1 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9787, end: 9801, rendered-as: \22takeIdentifier\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeIdentifier({ i8*, i64, i64 }* %lexer_variable_load1)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9787, end: 9801, rendered-as: \22takeIdentifier\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  %b_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9823, end: 9829, rendered-as: \22render\22 } })_call" = call i8* @render({ { i8*, i64, i64 }*, i64, i64 }* %string)
  %str_variable_load = load i8*, i8** %str, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9832, end: 9834, rendered-as: \22!=\22 } })_call" = call i1 @"!=.20"(i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9823, end: 9829, rendered-as: \22render\22 } })_call", i8* %str_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9832, end: 9834, rendered-as: \22!=\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @global_str.30, i32 0, i32 0))
  %str_variable_load2 = load i8*, i8** %str, align 8
  call void @printf(i8* %str_variable_load2)
  call void @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @global_str.31, i32 0, i32 0))
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9948, end: 9954, rendered-as: \22render\22 } })_call" = call i8* @render({ { i8*, i64, i64 }*, i64, i64 }* %string)
  call void @printf(i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 9948, end: 9954, rendered-as: \22render\22 } })_call")
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11700, end: 11702, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %deref_load, i64 1)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11700, end: 11702, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_else_block

if_then_block:                                    ; preds = %entry_block
  call void @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @global_str.34, i32 0, i32 0))
  br label %if_cont_block

if_else_block:                                    ; preds = %entry_block
  %val_variable_load1 = load i64*, i64** %val, align 8
  %deref_load2 = load i64, i64* %val_variable_load1, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11775, end: 11777, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %deref_load2, i64 2)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11775, end: 11777, rendered-as: \22==\22 } })_call", label %if_then_block3, label %if_else_block4

if_cont_block:                                    ; preds = %if_cont_block5, %if_then_block
  ret void

if_then_block3:                                   ; preds = %if_else_block
  call void @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @global_str.35, i32 0, i32 0))
  br label %if_cont_block5

if_else_block4:                                   ; preds = %if_else_block
  %val_variable_load6 = load i64*, i64** %val, align 8
  %deref_load7 = load i64, i64* %val_variable_load6, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11858, end: 11860, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %deref_load7, i64 3)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11858, end: 11860, rendered-as: \22==\22 } })_call", label %if_then_block8, label %if_else_block9

if_cont_block5:                                   ; preds = %if_cont_block10, %if_then_block3
  br label %if_cont_block

if_then_block8:                                   ; preds = %if_else_block4
  call void @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @global_str.36, i32 0, i32 0))
  br label %if_cont_block10

if_else_block9:                                   ; preds = %if_else_block4
  call void @panic(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @global_str.37, i32 0, i32 0))
  br label %if_cont_block10

if_cont_block10:                                  ; preds = %if_else_block9, %if_then_block8
  br label %if_cont_block5
}

define { i8*, i64 } @parseExpr({ { i8*, i64, i64 }* }* %0) {
entry_block:
  %expr = alloca { i8*, i64 }, align 8
  %macro_arg_space = alloca i8, align 1
  %next_char = alloca i8, align 1
  %parser = alloca { { i8*, i64, i64 }* }*, align 8
  store { { i8*, i64, i64 }* }* %0, { { i8*, i64, i64 }* }** %parser, align 8
  call void @debugPrint(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @global_str.60, i32 0, i32 0))
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load, i32 0, i32 0
  %struct_gep_deref = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16380, end: 16394, rendered-as: \22takeWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %struct_gep_deref)
  %parser_variable_load1 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep2 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load1, i32 0, i32 0
  %struct_gep_deref3 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep2, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16432, end: 16440, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %struct_gep_deref3)
  store i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16432, end: 16440, rendered-as: \22peekChar\22 } })_call", i8* %macro_arg_space, align 1
  %b_variable_load = load i8, i8* %macro_arg_space, align 1
  store i8 %b_variable_load, i8* %next_char, align 1
  call void @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @global_str.61, i32 0, i32 0))
  %next_char_variable_load = load i8, i8* %next_char, align 1
  call void @putchar(i8 %next_char_variable_load)
  call void @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @global_str.62, i32 0, i32 0))
  %next_char_variable_load4 = load i8, i8* %next_char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16534, end: 16543, rendered-as: \22isNumeric\22 } })_call" = call i1 @isNumeric(i8 %next_char_variable_load4)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16534, end: 16543, rendered-as: \22isNumeric\22 } })_call", label %if_then_block, label %if_else_block

if_then_block:                                    ; preds = %entry_block
  %parser_variable_load5 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16563, end: 16578, rendered-as: \22parseNumberExpr\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, i64 } @parseNumberExpr({ { i8*, i64, i64 }* }* %parser_variable_load5)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16581, end: 16587, rendered-as: \22asExpr\22 } })_call" = call { i8*, i64 } @asExpr({ { { i8*, i64, i64 }*, i64, i64 }, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16563, end: 16578, rendered-as: \22parseNumberExpr\22 } })_call")
  br label %if_cont_block

if_else_block:                                    ; preds = %entry_block
  %next_char_variable_load6 = load i8, i8* %next_char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16615, end: 16631, rendered-as: \22isConventionalId\22 } })_call" = call i1 @isConventionalId(i8 %next_char_variable_load6, i1 true)
  %next_char_variable_load7 = load i8, i8* %next_char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16651, end: 16662, rendered-as: \22isSpecialId\22 } })_call" = call i1 @isSpecialId(i8 %next_char_variable_load7)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16638, end: 16640, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16615, end: 16631, rendered-as: \22isConventionalId\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16651, end: 16662, rendered-as: \22isSpecialId\22 } })_call")
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16638, end: 16640, rendered-as: \22||\22 } })_call", label %if_then_block8, label %if_else_block9

if_cont_block:                                    ; preds = %if_cont_block10, %if_then_block
  %if_phi19 = phi { i8*, i64 } [ %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16581, end: 16587, rendered-as: \22asExpr\22 } })_call", %if_then_block ], [ %if_phi18, %if_cont_block10 ]
  ret { i8*, i64 } %if_phi19

if_then_block8:                                   ; preds = %if_else_block
  %parser_variable_load11 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16683, end: 16702, rendered-as: \22parseIdentifierExpr\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 } } @parseIdentifierExpr({ { i8*, i64, i64 }* }* %parser_variable_load11)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16705, end: 16711, rendered-as: \22asExpr\22 } })_call" = call { i8*, i64 } @asExpr.45({ { { i8*, i64, i64 }*, i64, i64 } } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16683, end: 16702, rendered-as: \22parseIdentifierExpr\22 } })_call")
  br label %if_cont_block10

if_else_block9:                                   ; preds = %if_else_block
  %next_char_variable_load12 = load i8, i8* %next_char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16738, end: 16740, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %next_char_variable_load12, i8 123)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16738, end: 16740, rendered-as: \22==\22 } })_call", label %if_then_block13, label %if_else_block14

if_cont_block10:                                  ; preds = %if_cont_block15, %if_then_block8
  %if_phi18 = phi { i8*, i64 } [ %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16705, end: 16711, rendered-as: \22asExpr\22 } })_call", %if_then_block8 ], [ %if_phi, %if_cont_block15 ]
  br label %if_cont_block

if_then_block13:                                  ; preds = %if_else_block9
  %parser_variable_load16 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16762, end: 16776, rendered-as: \22parseBlockExpr\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } @parseBlockExpr({ { i8*, i64, i64 }* }* %parser_variable_load16)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16779, end: 16785, rendered-as: \22asExpr\22 } })_call" = call { i8*, i64 } @asExpr.58({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16762, end: 16776, rendered-as: \22parseBlockExpr\22 } })_call")
  br label %if_cont_block15

if_else_block14:                                  ; preds = %if_else_block9
  call void @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @global_str.63, i32 0, i32 0))
  %next_char_variable_load17 = load i8, i8* %next_char, align 1
  call void @putchar(i8 %next_char_variable_load17)
  call void @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @global_str.64, i32 0, i32 0))
  call void @panic.17()
  %expr_variable_load = load { i8*, i64 }, { i8*, i64 }* %expr, align 8
  br label %if_cont_block15

if_cont_block15:                                  ; preds = %if_else_block14, %if_then_block13
  %if_phi = phi { i8*, i64 } [ %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16779, end: 16785, rendered-as: \22asExpr\22 } })_call", %if_then_block13 ], [ %expr_variable_load, %if_else_block14 ]
  br label %if_cont_block10
}

define void @debugBlockExpr({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %0, i64 %1) {
entry_block:
  %macro_arg_space21 = alloca i64, align 8
  %macro_arg_space5 = alloca i64, align 8
  %macro_arg_space2 = alloca i64, align 8
  %macro_arg_space = alloca i64, align 8
  %i = alloca i64, align 8
  %indentation = alloca i64, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %0, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %val, align 8
  store i64 %1, i64* %indentation, align 4
  %indentation_variable_load = load i64, i64* %indentation, align 4
  call void @printIndentation(i64 %indentation_variable_load)
  store i64 0, i64* %macro_arg_space, align 4
  %b_variable_load = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load, i64* %i, align 4
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %while_loop_body_basic_block, %entry_block
  %i_variable_load = load i64, i64* %i, align 4
  %val_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %val, align 8
  %struct_gep = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %val_variable_load, i32 0, i32 1
  %struct_gep1 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %struct_gep, i32 0, i32 0
  %struct_gep_deref = load i64, i64* %struct_gep1, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14329, end: 14331, rendered-as: \22!=\22 } })_call" = call i1 @"!="(i64 %i_variable_load, i64 %struct_gep_deref)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14329, end: 14331, rendered-as: \22!=\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  call void @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @global_str.47, i32 0, i32 0))
  %a_variable_load = load i64, i64* %i, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call", i64* %macro_arg_space2, align 4
  %b_variable_load3 = load i64, i64* %macro_arg_space2, align 4
  store i64 %b_variable_load3, i64* %i, align 4
  %a_variable_load4 = load i64, i64* %i, align 4
  br label %while_loop_cond_check_basic_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  call void @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @global_str.48, i32 0, i32 0))
  store i64 0, i64* %macro_arg_space5, align 4
  %b_variable_load6 = load i64, i64* %macro_arg_space5, align 4
  store i64 %b_variable_load6, i64* %i, align 4
  br label %while_loop_cond_check_basic_block7

while_loop_cond_check_basic_block7:               ; preds = %while_loop_body_basic_block8, %while_loop_cont_basic_block
  %i_variable_load10 = load i64, i64* %i, align 4
  %val_variable_load11 = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %val, align 8
  %struct_gep12 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %val_variable_load11, i32 0, i32 1
  %struct_gep13 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %struct_gep12, i32 0, i32 0
  %struct_gep_deref14 = load i64, i64* %struct_gep13, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14441, end: 14442, rendered-as: \22<\22 } })_call" = call i1 @"<"(i64 %i_variable_load10, i64 %struct_gep_deref14)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14441, end: 14442, rendered-as: \22<\22 } })_call", label %while_loop_body_basic_block8, label %while_loop_cont_basic_block9

while_loop_body_basic_block8:                     ; preds = %while_loop_cond_check_basic_block7
  %val_variable_load15 = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %val, align 8
  %struct_gep16 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %val_variable_load15, i32 0, i32 1
  %i_variable_load17 = load i64, i64* %i, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14498, end: 14501, rendered-as: \22get\22 } })_call" = call { i8*, i64 }* @get({ i64, i64, { i8*, i64 }* }* %struct_gep16, i64 %i_variable_load17)
  %indentation_variable_load18 = load i64, i64* %indentation, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14525, end: 14526, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %indentation_variable_load18, i64 2)
  call void @debugExpr({ i8*, i64 }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14498, end: 14501, rendered-as: \22get\22 } })_call", i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14525, end: 14526, rendered-as: \22+\22 } })_call")
  %a_variable_load19 = load i64, i64* %i, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call20" = call i64 @"+"(i64 %a_variable_load19, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2188, end: 2189, rendered-as: \22+\22 } })_call20", i64* %macro_arg_space21, align 4
  %b_variable_load22 = load i64, i64* %macro_arg_space21, align 4
  store i64 %b_variable_load22, i64* %i, align 4
  %a_variable_load23 = load i64, i64* %i, align 4
  br label %while_loop_cond_check_basic_block7

while_loop_cont_basic_block9:                     ; preds = %while_loop_cond_check_basic_block7
  %indentation_variable_load24 = load i64, i64* %indentation, align 4
  call void @printIndentation(i64 %indentation_variable_load24)
  call void @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @global_str.49, i32 0, i32 0))
  %val_variable_load25 = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %val, align 8
  %struct_gep26 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %val_variable_load25, i32 0, i32 2
  %struct_gep_deref27 = load i1, i1* %struct_gep26, align 1
  br i1 %struct_gep_deref27, label %if_then_block, label %if_else_block

if_then_block:                                    ; preds = %while_loop_cont_basic_block9
  br label %if_cont_block

if_else_block:                                    ; preds = %while_loop_cont_basic_block9
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_else_block, %if_then_block
  %if_phi = phi i8* [ getelementptr inbounds ([5 x i8], [5 x i8]* @global_str.50, i32 0, i32 0), %if_then_block ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @global_str.51, i32 0, i32 0), %if_else_block ]
  call void @printf(i8* %if_phi)
  %indentation_variable_load28 = load i64, i64* %indentation, align 4
  call void @printIndentation(i64 %indentation_variable_load28)
  call void @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @global_str.52, i32 0, i32 0))
  ret void
}

define void @debugIdentifierExpr({ { { i8*, i64, i64 }*, i64, i64 } }* %0, i64 %1) {
entry_block:
  %indentation = alloca i64, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 } }*, align 8
  store { { { i8*, i64, i64 }*, i64, i64 } }* %0, { { { i8*, i64, i64 }*, i64, i64 } }** %val, align 8
  store i64 %1, i64* %indentation, align 4
  %val_variable_load = load { { { i8*, i64, i64 }*, i64, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 } }** %val, align 8
  %struct_gep = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* %val_variable_load, i32 0, i32 0
  %indentation_variable_load = load i64, i64* %indentation, align 4
  call void @debugLexString({ { i8*, i64, i64 }*, i64, i64 }* %struct_gep, i64 %indentation_variable_load)
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12332, end: 12334, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref, i64 3)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12332, end: 12334, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_else_block

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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12442, end: 12444, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref9, i64 2)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12442, end: 12444, rendered-as: \22==\22 } })_call", label %if_then_block10, label %if_cont_block11

if_cont_block:                                    ; preds = %if_cont_block11, %if_then_block
  ret void

if_then_block10:                                  ; preds = %if_else_block
  %val_variable_load12 = load { i8*, i64 }*, { i8*, i64 }** %val, align 8
  %struct_gep13 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %val_variable_load12, i32 0, i32 0
  %struct_gep_deref14 = load i8*, i8** %struct_gep13, align 8
  %bitcast15 = bitcast i8* %struct_gep_deref14 to { { { i8*, i64, i64 }*, i64, i64 } }*
  %indentation_variable_load16 = load i64, i64* %indentation, align 4
  call void @debugIdentifierExpr({ { { i8*, i64, i64 }*, i64, i64 } }* %bitcast15, i64 %indentation_variable_load16)
  br label %if_cont_block11

if_cont_block11:                                  ; preds = %if_then_block10, %if_else_block
  br label %if_cont_block
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

define { { { i8*, i64, i64 }*, i64, i64 }, i64 } @parseNumberExpr({ { i8*, i64, i64 }* }* %0) {
entry_block:
  %expr = alloca { { { i8*, i64, i64 }*, i64, i64 }, i64 }, align 8
  %macro_arg_space = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %number = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %parser = alloca { { i8*, i64, i64 }* }*, align 8
  store { { i8*, i64, i64 }* }* %0, { { i8*, i64, i64 }* }** %parser, align 8
  call void @debugPrint(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @global_str.38, i32 0, i32 0))
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load, i32 0, i32 0
  %struct_gep_deref = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12862, end: 12872, rendered-as: \22takeNumber\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeNumber({ i8*, i64, i64 }* %struct_gep_deref)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12862, end: 12872, rendered-as: \22takeNumber\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  %b_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load, { { i8*, i64, i64 }*, i64, i64 }* %number, align 8
  %struct_gep1 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %number, i32 0, i32 2
  %struct_gep_deref2 = load i64, i64* %struct_gep1, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12895, end: 12897, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref2, i64 0)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12895, end: 12897, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @panic(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @global_str.39, i32 0, i32 0))
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %struct_gep3 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, i64 }, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %expr, i32 0, i32 0
  %b_variable_load4 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %number, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load4, { { i8*, i64, i64 }*, i64, i64 }* %struct_gep3, align 8
  %expr_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, i64 }, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %expr, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 }, i64 } %expr_variable_load
}

define { { { i8*, i64, i64 }*, i64, i64 }, i64 }* @copy.40({ { { i8*, i64, i64 }*, i64, i64 }, i64 } %0) {
entry_block:
  %macro_arg_space = alloca { { { i8*, i64, i64 }*, i64, i64 }, i64 }*, align 8
  %data = alloca { { { i8*, i64, i64 }*, i64, i64 }, i64 }*, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, i64 }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, i64 } %0, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %val, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13096, end: 13102, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 }, i64 }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 }, i64 }, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* null, i32 1) to i64))
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13096, end: 13102, rendered-as: \22malloc\22 } })_call" to { { { i8*, i64, i64 }*, i64, i64 }, i64 }*
  store { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %bitcast, { { { i8*, i64, i64 }*, i64, i64 }, i64 }** %macro_arg_space, align 8
  %b_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, i64 }*, { { { i8*, i64, i64 }*, i64, i64 }, i64 }** %macro_arg_space, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %b_variable_load, { { { i8*, i64, i64 }*, i64, i64 }, i64 }** %data, align 8
  %bitcast1 = bitcast { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %val to i8*
  %data_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, i64 }*, { { { i8*, i64, i64 }*, i64, i64 }, i64 }** %data, align 8
  %bitcast2 = bitcast { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %data_variable_load to i8*
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13378, end: 13382, rendered-as: \22copy\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, i64 }* @copy.40({ { { i8*, i64, i64 }*, i64, i64 }, i64 } %number_variable_load)
  %bitcast = bitcast { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13378, end: 13382, rendered-as: \22copy\22 } })_call" to i8*
  store i8* %bitcast, i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %struct_gep1, align 8
  %expr_variable_load = load { i8*, i64 }, { i8*, i64 }* %expr, align 8
  ret { i8*, i64 } %expr_variable_load
}

declare void @debugIdentifierExpr.41({ { { i8*, i64, i64 }*, i64, i64 } }*, i64)

define { { { i8*, i64, i64 }*, i64, i64 } } @parseIdentifierExpr({ { i8*, i64, i64 }* }* %0) {
entry_block:
  %expr = alloca { { { i8*, i64, i64 }*, i64, i64 } }, align 8
  %macro_arg_space = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %id = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %parser = alloca { { i8*, i64, i64 }* }*, align 8
  store { { i8*, i64, i64 }* }* %0, { { i8*, i64, i64 }* }** %parser, align 8
  call void @debugPrint(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @global_str.42, i32 0, i32 0))
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load, i32 0, i32 0
  %struct_gep_deref = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13676, end: 13690, rendered-as: \22takeIdentifier\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeIdentifier({ i8*, i64, i64 }* %struct_gep_deref)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13676, end: 13690, rendered-as: \22takeIdentifier\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  %b_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load, { { i8*, i64, i64 }*, i64, i64 }* %id, align 8
  %struct_gep1 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %id, i32 0, i32 2
  %struct_gep_deref2 = load i64, i64* %struct_gep1, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13709, end: 13711, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref2, i64 0)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13709, end: 13711, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @panic(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @global_str.43, i32 0, i32 0))
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %struct_gep3 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* %expr, i32 0, i32 0
  %b_variable_load4 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %id, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load4, { { i8*, i64, i64 }*, i64, i64 }* %struct_gep3, align 8
  %expr_variable_load = load { { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* %expr, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 } } %expr_variable_load
}

define { { { i8*, i64, i64 }*, i64, i64 } }* @copy.44({ { { i8*, i64, i64 }*, i64, i64 } } %0) {
entry_block:
  %macro_arg_space = alloca { { { i8*, i64, i64 }*, i64, i64 } }*, align 8
  %data = alloca { { { i8*, i64, i64 }*, i64, i64 } }*, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 } }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 } } %0, { { { i8*, i64, i64 }*, i64, i64 } }* %val, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13913, end: 13919, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 } }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* null, i32 1) to i64))
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 13913, end: 13919, rendered-as: \22malloc\22 } })_call" to { { { i8*, i64, i64 }*, i64, i64 } }*
  store { { { i8*, i64, i64 }*, i64, i64 } }* %bitcast, { { { i8*, i64, i64 }*, i64, i64 } }** %macro_arg_space, align 8
  %b_variable_load = load { { { i8*, i64, i64 }*, i64, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 } }** %macro_arg_space, align 8
  store { { { i8*, i64, i64 }*, i64, i64 } }* %b_variable_load, { { { i8*, i64, i64 }*, i64, i64 } }** %data, align 8
  %bitcast1 = bitcast { { { i8*, i64, i64 }*, i64, i64 } }* %val to i8*
  %data_variable_load = load { { { i8*, i64, i64 }*, i64, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 } }** %data, align 8
  %bitcast2 = bitcast { { { i8*, i64, i64 }*, i64, i64 } }* %data_variable_load to i8*
  call void @memcpy(i8* %bitcast1, i8* %bitcast2, i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 } }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* null, i32 1) to i64))
  %data_variable_load3 = load { { { i8*, i64, i64 }*, i64, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 } }** %data, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 } }* %data_variable_load3
}

define { i8*, i64 } @asExpr.45({ { { i8*, i64, i64 }*, i64, i64 } } %0) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %expr = alloca { i8*, i64 }, align 8
  %id = alloca { { { i8*, i64, i64 }*, i64, i64 } }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 } } %0, { { { i8*, i64, i64 }*, i64, i64 } }* %id, align 8
  %struct_gep = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 1
  store i64 2, i64* %struct_gep, align 4
  %struct_gep1 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 0
  %id_variable_load = load { { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* %id, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14177, end: 14181, rendered-as: \22copy\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 } }* @copy.44({ { { i8*, i64, i64 }*, i64, i64 } } %id_variable_load)
  %bitcast = bitcast { { { i8*, i64, i64 }*, i64, i64 } }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14177, end: 14181, rendered-as: \22copy\22 } })_call" to i8*
  store i8* %bitcast, i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %struct_gep1, align 8
  %expr_variable_load = load { i8*, i64 }, { i8*, i64 }* %expr, align 8
  ret { i8*, i64 } %expr_variable_load
}

declare void @debugBlockExpr.46({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, i64)

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
  %macro_arg_space52 = alloca i1, align 1
  %macro_arg_space49 = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %end = alloca i64, align 8
  %macro_arg_space30 = alloca i1, align 1
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
  call void @debugPrint(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @global_str.53, i32 0, i32 0))
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load, i32 0, i32 0
  %struct_gep_deref = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14879, end: 14893, rendered-as: \22takeWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %struct_gep_deref)
  %parser_variable_load1 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep2 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load1, i32 0, i32 0
  %struct_gep_deref3 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep2, align 8
  %struct_gep4 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %struct_gep_deref3, i32 0, i32 1
  %b_variable_load = load i64, i64* %struct_gep4, align 4
  store i64 %b_variable_load, i64* %start, align 4
  %parser_variable_load5 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep6 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load5, i32 0, i32 0
  %struct_gep_deref7 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep6, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 14957, end: 14964, rendered-as: \22require\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @require({ i8*, i64, i64 }* %struct_gep_deref7, i8 123)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15026, end: 15043, rendered-as: \22variablearray#new\22 } })_call" = call { i64, i64, { i8*, i64 }* } @"variablearray#new"()
  store { i64, i64, { i8*, i64 }* } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15026, end: 15043, rendered-as: \22variablearray#new\22 } })_call", { i64, i64, { i8*, i64 }* }* %macro_arg_space, align 8
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15113, end: 15118, rendered-as: \22isEof\22 } })_call" = call i1 @isEof({ i8*, i64, i64 }* %struct_gep_deref13)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15098, end: 15099, rendered-as: \22!\22 } })_call" = call i1 @"!"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15113, end: 15118, rendered-as: \22isEof\22 } })_call")
  %parser_variable_load14 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep15 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load14, i32 0, i32 0
  %struct_gep_deref16 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep15, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15139, end: 15147, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %struct_gep_deref16)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15150, end: 15152, rendered-as: \22!=\22 } })_call" = call i1 @"!=.2"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15139, end: 15147, rendered-as: \22peekChar\22 } })_call", i8 125)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15122, end: 15124, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15098, end: 15099, rendered-as: \22!\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15150, end: 15152, rendered-as: \22!=\22 } })_call")
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15122, end: 15124, rendered-as: \22&&\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %parser_variable_load17 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15197, end: 15206, rendered-as: \22parseExpr\22 } })_call" = call { i8*, i64 } @parseExpr({ { i8*, i64, i64 }* }* %parser_variable_load17)
  store { i8*, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15197, end: 15206, rendered-as: \22parseExpr\22 } })_call", { i8*, i64 }* %macro_arg_space18, align 8
  %b_variable_load19 = load { i8*, i64 }, { i8*, i64 }* %macro_arg_space18, align 8
  store { i8*, i64 } %b_variable_load19, { i8*, i64 }* %internal_expr, align 8
  %struct_gep20 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %internal_expr, i32 0, i32 1
  call void @debugExprType(i64* %struct_gep20, i64 0)
  %internal_expr_variable_load = load { i8*, i64 }, { i8*, i64 }* %internal_expr, align 8
  call void @append({ i64, i64, { i8*, i64 }* }* %exprs, { i8*, i64 } %internal_expr_variable_load)
  %struct_gep21 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %exprs, i32 0, i32 0
  %struct_gep_deref22 = load i64, i64* %struct_gep21, align 4
  call void @printint(i64 %struct_gep_deref22)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15443, end: 15446, rendered-as: \22get\22 } })_call" = call { i8*, i64 }* @get({ i64, i64, { i8*, i64 }* }* %exprs, i64 1)
  %struct_gep23 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15443, end: 15446, rendered-as: \22get\22 } })_call", i32 0, i32 1
  call void @debugExprType(i64* %struct_gep23, i64 0)
  %parser_variable_load24 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep25 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load24, i32 0, i32 0
  %struct_gep_deref26 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep25, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15491, end: 15505, rendered-as: \22takeWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %struct_gep_deref26)
  %parser_variable_load27 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep28 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load27, i32 0, i32 0
  %struct_gep_deref29 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep28, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15533, end: 15541, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %struct_gep_deref29)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15544, end: 15546, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15533, end: 15541, rendered-as: \22peekChar\22 } })_call", i8 125)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15544, end: 15546, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

while_loop_cont_basic_block:                      ; preds = %if_then_block, %while_loop_cond_check_basic_block
  %parser_variable_load35 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep36 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load35, i32 0, i32 0
  %struct_gep_deref37 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep36, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15752, end: 15759, rendered-as: \22require\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @require({ i8*, i64, i64 }* %struct_gep_deref37, i8 125)
  %parser_variable_load38 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep39 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load38, i32 0, i32 0
  %struct_gep_deref40 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep39, align 8
  %struct_gep41 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %struct_gep_deref40, i32 0, i32 1
  %b_variable_load42 = load i64, i64* %struct_gep41, align 4
  store i64 %b_variable_load42, i64* %end, align 4
  %struct_gep43 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %expr, i32 0, i32 1
  %b_variable_load44 = load { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %exprs, align 8
  store { i64, i64, { i8*, i64 }* } %b_variable_load44, { i64, i64, { i8*, i64 }* }* %struct_gep43, align 8
  %struct_gep45 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %expr, i32 0, i32 0
  %parser_variable_load46 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep47 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load46, i32 0, i32 0
  %struct_gep_deref48 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep47, align 8
  %start_variable_load = load i64, i64* %start, align 4
  %end_variable_load = load i64, i64* %end, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15851, end: 15864, rendered-as: \22lexstring#new\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @"lexstring#new"({ i8*, i64, i64 }* %struct_gep_deref48, i64 %start_variable_load, i64 %end_variable_load)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15851, end: 15864, rendered-as: \22lexstring#new\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space49, align 8
  %b_variable_load50 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space49, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load50, { { i8*, i64, i64 }*, i64, i64 }* %struct_gep45, align 8
  %struct_gep51 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %expr, i32 0, i32 2
  %last_semicolon_variable_load = load i1, i1* %last_semicolon, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15919, end: 15920, rendered-as: \22!\22 } })_call" = call i1 @"!"(i1 %last_semicolon_variable_load)
  store i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15919, end: 15920, rendered-as: \22!\22 } })_call", i1* %macro_arg_space52, align 1
  %b_variable_load53 = load i1, i1* %macro_arg_space52, align 1
  store i1 %b_variable_load53, i1* %struct_gep51, align 1
  %expr_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %expr, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } %expr_variable_load

if_then_block:                                    ; preds = %while_loop_body_basic_block
  call void @debugPrint(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @global_str.55, i32 0, i32 0))
  call void @debugPrint(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @global_str.56, i32 0, i32 0))
  store i1 false, i1* %macro_arg_space30, align 1
  %b_variable_load31 = load i1, i1* %macro_arg_space30, align 1
  store i1 %b_variable_load31, i1* %last_semicolon, align 1
  br label %while_loop_cont_basic_block
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %while_loop_body_basic_block
  %parser_variable_load32 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep33 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load32, i32 0, i32 0
  %struct_gep_deref34 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep33, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 15713, end: 15720, rendered-as: \22require\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @require({ i8*, i64, i64 }* %struct_gep_deref34, i8 59)
  br label %while_loop_cond_check_basic_block
}

define { i64, i64, { i8*, i64 }* } @"variablearray#new"() {
entry_block:
  %macro_arg_space5 = alloca i64, align 8
  %macro_arg_space2 = alloca i64, align 8
  %macro_arg_space = alloca { i8*, i64 }*, align 8
  %va = alloca { i64, i64, { i8*, i64 }* }, align 8
  %struct_gep = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va, i32 0, i32 2
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10259, end: 10260, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint ({ i8*, i64 }* getelementptr ({ i8*, i64 }, { i8*, i64 }* null, i32 1) to i64), i64 64)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10241, end: 10247, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10259, end: 10260, rendered-as: \22*\22 } })_call")
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10241, end: 10247, rendered-as: \22malloc\22 } })_call" to { i8*, i64 }*
  store { i8*, i64 }* %bitcast, { i8*, i64 }** %macro_arg_space, align 8
  %b_variable_load = load { i8*, i64 }*, { i8*, i64 }** %macro_arg_space, align 8
  store { i8*, i64 }* %b_variable_load, { i8*, i64 }** %struct_gep, align 8
  %struct_gep1 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va, i32 0, i32 0
  store i64 0, i64* %macro_arg_space2, align 4
  %b_variable_load3 = load i64, i64* %macro_arg_space2, align 4
  store i64 %b_variable_load3, i64* %struct_gep1, align 4
  %struct_gep4 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va, i32 0, i32 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10323, end: 10324, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint ({ i8*, i64 }* getelementptr ({ i8*, i64 }, { i8*, i64 }* null, i32 1) to i64), i64 64)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10323, end: 10324, rendered-as: \22*\22 } })_call", i64* %macro_arg_space5, align 4
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 %b_variable_load)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call", i64* %macro_arg_space1, align 4
  %b_variable_load2 = load i64, i64* %macro_arg_space1, align 4
  store i64 %b_variable_load2, i64* %struct_gep, align 4
  %a_variable_load3 = load i64, i64* %struct_gep, align 4
  %va_variable_load4 = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %struct_gep5 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va_variable_load4, i32 0, i32 0
  %struct_gep_deref = load i64, i64* %struct_gep5, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10686, end: 10687, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 %struct_gep_deref, i64 ptrtoint ({ i8*, i64 }* getelementptr ({ i8*, i64 }, { i8*, i64 }* null, i32 1) to i64))
  %va_variable_load6 = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %struct_gep7 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va_variable_load6, i32 0, i32 1
  %struct_gep_deref8 = load i64, i64* %struct_gep7, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10700, end: 10701, rendered-as: \22>\22 } })_call" = call i1 @">"(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10686, end: 10687, rendered-as: \22*\22 } })_call", i64 %struct_gep_deref8)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10700, end: 10701, rendered-as: \22>\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  %va_variable_load9 = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %struct_gep10 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va_variable_load9, i32 0, i32 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10751, end: 10752, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint ({ i8*, i64 }* getelementptr ({ i8*, i64 }, { i8*, i64 }* null, i32 1) to i64), i64 64)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10751, end: 10752, rendered-as: \22*\22 } })_call", i64* %macro_arg_space11, align 4
  %a_variable_load12 = load i64, i64* %struct_gep10, align 4
  %b_variable_load13 = load i64, i64* %macro_arg_space11, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call14" = call i64 @"+"(i64 %a_variable_load12, i64 %b_variable_load13)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call14", i64* %macro_arg_space15, align 4
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10777, end: 10784, rendered-as: \22realloc\22 } })_call" = call i8* @realloc(i8* %bitcast, i64 %struct_gep_deref25)
  %bitcast26 = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10777, end: 10784, rendered-as: \22realloc\22 } })_call" to { i8*, i64 }*
  store { i8*, i64 }* %bitcast26, { i8*, i64 }** %macro_arg_space27, align 8
  %b_variable_load28 = load { i8*, i64 }*, { i8*, i64 }** %macro_arg_space27, align 8
  store { i8*, i64 }* %b_variable_load28, { i8*, i64 }** %struct_gep19, align 8
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %va_variable_load29 = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %va_variable_load30 = load { i64, i64, { i8*, i64 }* }*, { i64, i64, { i8*, i64 }* }** %va, align 8
  %struct_gep31 = getelementptr inbounds { i64, i64, { i8*, i64 }* }, { i64, i64, { i8*, i64 }* }* %va_variable_load30, i32 0, i32 0
  %struct_gep_deref32 = load i64, i64* %struct_gep31, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10896, end: 10897, rendered-as: \22-\22 } })_call" = call i64 @-(i64 %struct_gep_deref32, i64 1)
  %val_variable_load = load { i8*, i64 }, { i8*, i64 }* %val, align 8
  call void @set({ i64, i64, { i8*, i64 }* }* %va_variable_load29, i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10896, end: 10897, rendered-as: \22-\22 } })_call", { i8*, i64 } %val_variable_load)
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10545, end: 10548, rendered-as: \22get\22 } })_call" = call { i8*, i64 }* @get.54({ i64, i64, { i8*, i64 }* }* %va_variable_load, i64 %index_variable_load)
  %bitcast = bitcast { i8*, i64 }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10545, end: 10548, rendered-as: \22get\22 } })_call" to i8*
  %bitcast1 = bitcast { i8*, i64 }* %val to i8*
  call void @memcpy(i8* %bitcast, i8* %bitcast1, i64 ptrtoint ({ i8*, i64 }* getelementptr ({ i8*, i64 }, { i8*, i64 }* null, i32 1) to i64))
  ret void
}

define { i8*, i64 }* @get.54({ i64, i64, { i8*, i64 }* }* %0, i64 %1) {
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

define { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* @copy.57({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } %0) {
entry_block:
  %macro_arg_space = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, align 8
  %data = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } %0, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %val, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16018, end: 16024, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* null, i32 1) to i64))
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16018, end: 16024, rendered-as: \22malloc\22 } })_call" to { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*
  store { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %bitcast, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %macro_arg_space, align 8
  %b_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %macro_arg_space, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %b_variable_load, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %data, align 8
  %bitcast1 = bitcast { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %val to i8*
  %data_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %data, align 8
  %bitcast2 = bitcast { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %data_variable_load to i8*
  call void @memcpy(i8* %bitcast1, i8* %bitcast2, i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* null, i32 1) to i64))
  %data_variable_load3 = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }*, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }** %data, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %data_variable_load3
}

define { i8*, i64 } @asExpr.58({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } %0) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %expr = alloca { i8*, i64 }, align 8
  %id = alloca { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } %0, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %id, align 8
  %struct_gep = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 1
  store i64 3, i64* %struct_gep, align 4
  %struct_gep1 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 0
  %id_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }, { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %id, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16257, end: 16261, rendered-as: \22copy\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* @copy.57({ { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 } %id_variable_load)
  %bitcast = bitcast { { { i8*, i64, i64 }*, i64, i64 }, { i64, i64, { i8*, i64 }* }, i1 }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 16257, end: 16261, rendered-as: \22copy\22 } })_call" to i8*
  store i8* %bitcast, i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %struct_gep1, align 8
  %expr_variable_load = load { i8*, i64 }, { i8*, i64 }* %expr, align 8
  ret { i8*, i64 } %expr_variable_load
}

declare { i8*, i64 } @parseExpr.59({ { i8*, i64, i64 }* }*)

define i64 @main() {
entry_block:
  %macro_arg_space13 = alloca { i8*, i64 }, align 8
  %expr = alloca { i8*, i64 }, align 8
  %macro_arg_space11 = alloca { { i8*, i64, i64 }* }*, align 8
  %deref_space10 = alloca { { i8*, i64, i64 }* }, align 8
  %parser = alloca { { i8*, i64, i64 }* }*, align 8
  %macro_arg_space8 = alloca { i8*, i64, i64 }*, align 8
  %deref_space = alloca { i8*, i64, i64 }, align 8
  %lexer = alloca { i8*, i64, i64 }*, align 8
  %macro_arg_space6 = alloca i8*, align 8
  %source = alloca i8*, align 8
  %macro_arg_space = alloca { i64, i64, i64* }, align 8
  %va = alloca { i64, i64, i64* }, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17877, end: 17894, rendered-as: \22variablearray#new\22 } })_call" = call { i64, i64, i64* } @"variablearray#new.65"()
  store { i64, i64, i64* } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17877, end: 17894, rendered-as: \22variablearray#new\22 } })_call", { i64, i64, i64* }* %macro_arg_space, align 8
  %b_variable_load = load { i64, i64, i64* }, { i64, i64, i64* }* %macro_arg_space, align 8
  store { i64, i64, i64* } %b_variable_load, { i64, i64, i64* }* %va, align 8
  call void @append.66({ i64, i64, i64* }* %va, i64 7)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17946, end: 17949, rendered-as: \22get\22 } })_call" = call i64* @get.69({ i64, i64, i64* }* %va, i64 0)
  %deref_load = load i64, i64* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17946, end: 17949, rendered-as: \22get\22 } })_call", align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17959, end: 17961, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %deref_load, i64 7)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 17959, end: 17961, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @global_str.70, i32 0, i32 0))
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18013, end: 18016, rendered-as: \22get\22 } })_call" = call i64* @get.69({ i64, i64, i64* }* %va, i64 0)
  %deref_load1 = load i64, i64* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18013, end: 18016, rendered-as: \22get\22 } })_call", align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18026, end: 18028, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %deref_load1, i64 0)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18026, end: 18028, rendered-as: \22==\22 } })_call", label %if_then_block2, label %if_cont_block3

if_then_block2:                                   ; preds = %if_cont_block
  call void @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @global_str.71, i32 0, i32 0))
  br label %if_cont_block3

if_cont_block3:                                   ; preds = %if_then_block2, %if_cont_block
  %struct_gep = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va, i32 0, i32 0
  %struct_gep_deref = load i64, i64* %struct_gep, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18083, end: 18085, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref, i64 1)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18083, end: 18085, rendered-as: \22==\22 } })_call", label %if_then_block4, label %if_cont_block5

if_then_block4:                                   ; preds = %if_cont_block3
  call void @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @global_str.72, i32 0, i32 0))
  br label %if_cont_block5

if_cont_block5:                                   ; preds = %if_then_block4, %if_cont_block3
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @global_str.73, i32 0, i32 0), i8** %macro_arg_space6, align 8
  %b_variable_load7 = load i8*, i8** %macro_arg_space6, align 8
  store i8* %b_variable_load7, i8** %source, align 8
  %source_variable_load = load i8*, i8** %source, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18184, end: 18193, rendered-as: \22lexer#new\22 } })_call" = call { i8*, i64, i64 } @"lexer#new"(i8* %source_variable_load)
  store { i8*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18184, end: 18193, rendered-as: \22lexer#new\22 } })_call", { i8*, i64, i64 }* %deref_space, align 8
  store { i8*, i64, i64 }* %deref_space, { i8*, i64, i64 }** %macro_arg_space8, align 8
  %b_variable_load9 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %macro_arg_space8, align 8
  store { i8*, i64, i64 }* %b_variable_load9, { i8*, i64, i64 }** %lexer, align 8
  %lexer_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18226, end: 18236, rendered-as: \22parser#new\22 } })_call" = call { { i8*, i64, i64 }* } @"parser#new"({ i8*, i64, i64 }* %lexer_variable_load)
  store { { i8*, i64, i64 }* } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18226, end: 18236, rendered-as: \22parser#new\22 } })_call", { { i8*, i64, i64 }* }* %deref_space10, align 8
  store { { i8*, i64, i64 }* }* %deref_space10, { { i8*, i64, i64 }* }** %macro_arg_space11, align 8
  %b_variable_load12 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %macro_arg_space11, align 8
  store { { i8*, i64, i64 }* }* %b_variable_load12, { { i8*, i64, i64 }* }** %parser, align 8
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18270, end: 18279, rendered-as: \22parseExpr\22 } })_call" = call { i8*, i64 } @parseExpr({ { i8*, i64, i64 }* }* %parser_variable_load)
  store { i8*, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 18270, end: 18279, rendered-as: \22parseExpr\22 } })_call", { i8*, i64 }* %macro_arg_space13, align 8
  %b_variable_load14 = load { i8*, i64 }, { i8*, i64 }* %macro_arg_space13, align 8
  store { i8*, i64 } %b_variable_load14, { i8*, i64 }* %expr, align 8
  call void @debugExpr({ i8*, i64 }* %expr, i64 0)
  call void @exit(i64 0)
  ret i64 0
}

define { i64, i64, i64* } @"variablearray#new.65"() {
entry_block:
  %macro_arg_space5 = alloca i64, align 8
  %macro_arg_space2 = alloca i64, align 8
  %macro_arg_space = alloca i64*, align 8
  %va = alloca { i64, i64, i64* }, align 8
  %struct_gep = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va, i32 0, i32 2
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10259, end: 10260, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 64)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10241, end: 10247, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10259, end: 10260, rendered-as: \22*\22 } })_call")
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10241, end: 10247, rendered-as: \22malloc\22 } })_call" to i64*
  store i64* %bitcast, i64** %macro_arg_space, align 8
  %b_variable_load = load i64*, i64** %macro_arg_space, align 8
  store i64* %b_variable_load, i64** %struct_gep, align 8
  %struct_gep1 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va, i32 0, i32 0
  store i64 0, i64* %macro_arg_space2, align 4
  %b_variable_load3 = load i64, i64* %macro_arg_space2, align 4
  store i64 %b_variable_load3, i64* %struct_gep1, align 4
  %struct_gep4 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va, i32 0, i32 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10323, end: 10324, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 64)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10323, end: 10324, rendered-as: \22*\22 } })_call", i64* %macro_arg_space5, align 4
  %b_variable_load6 = load i64, i64* %macro_arg_space5, align 4
  store i64 %b_variable_load6, i64* %struct_gep4, align 4
  %va_variable_load = load { i64, i64, i64* }, { i64, i64, i64* }* %va, align 8
  ret { i64, i64, i64* } %va_variable_load
}

define void @append.66({ i64, i64, i64* }* %0, i64 %1) {
entry_block:
  %macro_arg_space27 = alloca i64*, align 8
  %macro_arg_space15 = alloca i64, align 8
  %macro_arg_space11 = alloca i64, align 8
  %macro_arg_space1 = alloca i64, align 8
  %macro_arg_space = alloca i64, align 8
  %val = alloca i64, align 8
  %va = alloca { i64, i64, i64* }*, align 8
  store { i64, i64, i64* }* %0, { i64, i64, i64* }** %va, align 8
  store i64 %1, i64* %val, align 4
  %va_variable_load = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %struct_gep = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va_variable_load, i32 0, i32 0
  store i64 1, i64* %macro_arg_space, align 4
  %a_variable_load = load i64, i64* %struct_gep, align 4
  %b_variable_load = load i64, i64* %macro_arg_space, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 %b_variable_load)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call", i64* %macro_arg_space1, align 4
  %b_variable_load2 = load i64, i64* %macro_arg_space1, align 4
  store i64 %b_variable_load2, i64* %struct_gep, align 4
  %a_variable_load3 = load i64, i64* %struct_gep, align 4
  %va_variable_load4 = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %struct_gep5 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va_variable_load4, i32 0, i32 0
  %struct_gep_deref = load i64, i64* %struct_gep5, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10686, end: 10687, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 %struct_gep_deref, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64))
  %va_variable_load6 = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %struct_gep7 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va_variable_load6, i32 0, i32 1
  %struct_gep_deref8 = load i64, i64* %struct_gep7, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10700, end: 10701, rendered-as: \22>\22 } })_call" = call i1 @">"(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10686, end: 10687, rendered-as: \22*\22 } })_call", i64 %struct_gep_deref8)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10700, end: 10701, rendered-as: \22>\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  %va_variable_load9 = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %struct_gep10 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va_variable_load9, i32 0, i32 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10751, end: 10752, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 64)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10751, end: 10752, rendered-as: \22*\22 } })_call", i64* %macro_arg_space11, align 4
  %a_variable_load12 = load i64, i64* %struct_gep10, align 4
  %b_variable_load13 = load i64, i64* %macro_arg_space11, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call14" = call i64 @"+"(i64 %a_variable_load12, i64 %b_variable_load13)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2313, end: 2314, rendered-as: \22+\22 } })_call14", i64* %macro_arg_space15, align 4
  %b_variable_load16 = load i64, i64* %macro_arg_space15, align 4
  store i64 %b_variable_load16, i64* %struct_gep10, align 4
  %a_variable_load17 = load i64, i64* %struct_gep10, align 4
  %va_variable_load18 = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %struct_gep19 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va_variable_load18, i32 0, i32 2
  %va_variable_load20 = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %struct_gep21 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va_variable_load20, i32 0, i32 2
  %struct_gep_deref22 = load i64*, i64** %struct_gep21, align 8
  %bitcast = bitcast i64* %struct_gep_deref22 to i8*
  %va_variable_load23 = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %struct_gep24 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va_variable_load23, i32 0, i32 1
  %struct_gep_deref25 = load i64, i64* %struct_gep24, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10777, end: 10784, rendered-as: \22realloc\22 } })_call" = call i8* @realloc(i8* %bitcast, i64 %struct_gep_deref25)
  %bitcast26 = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10777, end: 10784, rendered-as: \22realloc\22 } })_call" to i64*
  store i64* %bitcast26, i64** %macro_arg_space27, align 8
  %b_variable_load28 = load i64*, i64** %macro_arg_space27, align 8
  store i64* %b_variable_load28, i64** %struct_gep19, align 8
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %va_variable_load29 = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %va_variable_load30 = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %struct_gep31 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va_variable_load30, i32 0, i32 0
  %struct_gep_deref32 = load i64, i64* %struct_gep31, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10896, end: 10897, rendered-as: \22-\22 } })_call" = call i64 @-(i64 %struct_gep_deref32, i64 1)
  %val_variable_load = load i64, i64* %val, align 4
  call void @set.67({ i64, i64, i64* }* %va_variable_load29, i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10896, end: 10897, rendered-as: \22-\22 } })_call", i64 %val_variable_load)
  ret void
}

define void @set.67({ i64, i64, i64* }* %0, i64 %1, i64 %2) {
entry_block:
  %val = alloca i64, align 8
  %index = alloca i64, align 8
  %va = alloca { i64, i64, i64* }*, align 8
  store { i64, i64, i64* }* %0, { i64, i64, i64* }** %va, align 8
  store i64 %1, i64* %index, align 4
  store i64 %2, i64* %val, align 4
  %va_variable_load = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %index_variable_load = load i64, i64* %index, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10545, end: 10548, rendered-as: \22get\22 } })_call" = call i64* @get.68({ i64, i64, i64* }* %va_variable_load, i64 %index_variable_load)
  %bitcast = bitcast i64* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10545, end: 10548, rendered-as: \22get\22 } })_call" to i8*
  %bitcast1 = bitcast i64* %val to i8*
  call void @memcpy(i8* %bitcast, i8* %bitcast1, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64))
  ret void
}

define i64* @get.68({ i64, i64, i64* }* %0, i64 %1) {
entry_block:
  %data = alloca i64*, align 8
  %index = alloca i64, align 8
  %va = alloca { i64, i64, i64* }*, align 8
  store { i64, i64, i64* }* %0, { i64, i64, i64* }** %va, align 8
  store i64 %1, i64* %index, align 4
  %va_variable_load = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %struct_gep = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va_variable_load, i32 0, i32 2
  %b_variable_load = load i64*, i64** %struct_gep, align 8
  store i64* %b_variable_load, i64** %data, align 8
  %data_variable_load = load i64*, i64** %data, align 8
  %index_variable_load = load i64, i64* %index, align 4
  %asm_gep = getelementptr inbounds i64, i64* %data_variable_load, i64 %index_variable_load
  ret i64* %asm_gep
}

define i64* @get.69({ i64, i64, i64* }* %0, i64 %1) {
entry_block:
  %data = alloca i64*, align 8
  %index = alloca i64, align 8
  %va = alloca { i64, i64, i64* }*, align 8
  store { i64, i64, i64* }* %0, { i64, i64, i64* }** %va, align 8
  store i64 %1, i64* %index, align 4
  %va_variable_load = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %struct_gep = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va_variable_load, i32 0, i32 2
  %b_variable_load = load i64*, i64** %struct_gep, align 8
  store i64* %b_variable_load, i64** %data, align 8
  %data_variable_load = load i64*, i64** %data, align 8
  %index_variable_load = load i64, i64* %index, align 4
  %asm_gep = getelementptr inbounds i64, i64* %data_variable_load, i64 %index_variable_load
  ret i64* %asm_gep
}
