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
@global_str.35 = private unnamed_addr constant [16 x i8] c"ExprType#Number\00", align 1
@global_str.37 = private unnamed_addr constant [16 x i8] c"Expected number\00", align 1
@global_str.40 = private unnamed_addr constant [26 x i8] c"Expected valid identifier\00", align 1
@global_str.43 = private unnamed_addr constant [15 x i8] c"Peeked char: `\00", align 1
@global_str.44 = private unnamed_addr constant [3 x i8] c"`\0A\00", align 1
@global_str.45 = private unnamed_addr constant [16 x i8] c"Cannot parse: `\00", align 1
@global_str.46 = private unnamed_addr constant [3 x i8] c"`\0A\00", align 1
@global_str.47 = private unnamed_addr constant [7 x i8] c"begin\0A\00", align 1
@global_str.48 = private unnamed_addr constant [20 x i8] c"178.7492 aa 786 bcd\00", align 1

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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2462, end: 2463, rendered-as: \22!\22 } })_call" = call i1 @"!"(i1 %val_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2462, end: 2463, rendered-as: \22!\22 } })_call", label %if_then_block, label %if_cont_block

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

define i8* @"brackets-[-]"(i8* %0, i64 %1) {
entry_block:
  %index = alloca i64, align 8
  %str = alloca i8*, align 8
  store i8* %0, i8** %str, align 8
  store i64 %1, i64* %index, align 4
  %str_variable_load = load i8*, i8** %str, align 8
  %index_variable_load = load i64, i64* %index, align 4
  %asm_gep = getelementptr i8, i8* %str_variable_load, i64 %index_variable_load
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3104, end: 3110, rendered-as: \22strcmp\22 } })_call" = call i64 @strcmp(i8* %a_variable_load, i8* %b_variable_load)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3117, end: 3119, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3104, end: 3110, rendered-as: \22strcmp\22 } })_call", i64 0)
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3117, end: 3119, rendered-as: \22==\22 } })_call"
}

define i1 @"!=.20"(i8* %0, i8* %1) {
entry_block:
  %b = alloca i8*, align 8
  %a = alloca i8*, align 8
  store i8* %0, i8** %a, align 8
  store i8* %1, i8** %b, align 8
  %a_variable_load = load i8*, i8** %a, align 8
  %b_variable_load = load i8*, i8** %b, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3168, end: 3174, rendered-as: \22strcmp\22 } })_call" = call i64 @strcmp(i8* %a_variable_load, i8* %b_variable_load)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3181, end: 3183, rendered-as: \22!=\22 } })_call" = call i1 @"!="(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3168, end: 3174, rendered-as: \22strcmp\22 } })_call", i64 0)
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3181, end: 3183, rendered-as: \22!=\22 } })_call"
}

define i8* @copy(i8* %0) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %dupl = alloca i8*, align 8
  %str = alloca i8*, align 8
  store i8* %0, i8** %str, align 8
  %str_variable_load = load i8*, i8** %str, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3255, end: 3261, rendered-as: \22strlen\22 } })_call" = call i64 @strlen(i8* %str_variable_load)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3264, end: 3265, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3255, end: 3261, rendered-as: \22strlen\22 } })_call", i64 1)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3244, end: 3250, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3264, end: 3265, rendered-as: \22+\22 } })_call")
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3244, end: 3250, rendered-as: \22malloc\22 } })_call", i8** %macro_arg_space, align 8
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3627, end: 3633, rendered-as: \22strlen\22 } })_call" = call i64 @strlen(i8* %str_variable_load)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3627, end: 3633, rendered-as: \22strlen\22 } })_call", i64* %macro_arg_space, align 4
  %b_variable_load = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load, i64* %length, align 4
  store i64 0, i64* %macro_arg_space1, align 4
  %b_variable_load2 = load i64, i64* %macro_arg_space1, align 4
  store i64 %b_variable_load2, i64* %index, align 4
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %if_cont_block, %entry_block
  %index_variable_load = load i64, i64* %index, align 4
  %length_variable_load = load i64, i64* %length, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3671, end: 3673, rendered-as: \22!=\22 } })_call" = call i1 @"!="(i64 %index_variable_load, i64 %length_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3671, end: 3673, rendered-as: \22!=\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %str_variable_load3 = load i8*, i8** %str, align 8
  %index_variable_load4 = load i64, i64* %index, align 4
  %"Brackets(LexString { lexer: \22...\22, start: 3697, end: 3698, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 3703, end: 3704, rendered-as: \22]\22 })_call" = call i8* @"brackets-[-]"(i8* %str_variable_load3, i64 %index_variable_load4)
  %deref_load = load i8, i8* %"Brackets(LexString { lexer: \22...\22, start: 3697, end: 3698, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 3703, end: 3704, rendered-as: \22]\22 })_call", align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3706, end: 3708, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %deref_load, i8 %char_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3706, end: 3708, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  ret i1 false

if_then_block:                                    ; preds = %while_loop_body_basic_block
  ret i1 true
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %while_loop_body_basic_block
  %a_variable_load = load i64, i64* %index, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2187, end: 2188, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2187, end: 2188, rendered-as: \22+\22 } })_call", i64* %macro_arg_space5, align 4
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3821, end: 3823, rendered-as: \22>=\22 } })_call" = call i1 @">=.6"(i8 %char_variable_load, i8 48)
  %char_variable_load1 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3838, end: 3840, rendered-as: \22<=\22 } })_call" = call i1 @"<=.5"(i8 %char_variable_load1, i8 57)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3829, end: 3831, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3821, end: 3823, rendered-as: \22>=\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3838, end: 3840, rendered-as: \22<=\22 } })_call")
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3829, end: 3831, rendered-as: \22&&\22 } })_call"
}

define i1 @isAlpha(i8 %0) {
entry_block:
  %char = alloca i8, align 1
  store i8 %0, i8* %char, align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3887, end: 3889, rendered-as: \22>=\22 } })_call" = call i1 @">=.6"(i8 %char_variable_load, i8 65)
  %char_variable_load1 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3904, end: 3906, rendered-as: \22<=\22 } })_call" = call i1 @"<=.5"(i8 %char_variable_load1, i8 90)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3895, end: 3897, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3887, end: 3889, rendered-as: \22>=\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3904, end: 3906, rendered-as: \22<=\22 } })_call")
  %char_variable_load2 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3921, end: 3923, rendered-as: \22>=\22 } })_call" = call i1 @">=.6"(i8 %char_variable_load2, i8 97)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3912, end: 3914, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3895, end: 3897, rendered-as: \22&&\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3921, end: 3923, rendered-as: \22>=\22 } })_call")
  %char_variable_load3 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3938, end: 3940, rendered-as: \22<=\22 } })_call" = call i1 @"<=.5"(i8 %char_variable_load3, i8 122)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3929, end: 3931, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3912, end: 3914, rendered-as: \22||\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3938, end: 3940, rendered-as: \22<=\22 } })_call")
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3929, end: 3931, rendered-as: \22&&\22 } })_call"
}

define i1 @isAlphanumeric(i8 %0) {
entry_block:
  %char = alloca i8, align 1
  store i8 %0, i8* %char, align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3993, end: 4002, rendered-as: \22isNumeric\22 } })_call" = call i1 @isNumeric(i8 %char_variable_load)
  %char_variable_load1 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4013, end: 4020, rendered-as: \22isAlpha\22 } })_call" = call i1 @isAlpha(i8 %char_variable_load1)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4005, end: 4007, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3993, end: 4002, rendered-as: \22isNumeric\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4013, end: 4020, rendered-as: \22isAlpha\22 } })_call")
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4005, end: 4007, rendered-as: \22||\22 } })_call"
}

define i1 @isWhitespace(i8 %0) {
entry_block:
  %char = alloca i8, align 1
  store i8 %0, i8* %char, align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4070, end: 4078, rendered-as: \22contains\22 } })_call" = call i1 @contains(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @global_str.21, i32 0, i32 0), i8 %char_variable_load)
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4070, end: 4078, rendered-as: \22contains\22 } })_call"
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4366, end: 4372, rendered-as: \22strlen\22 } })_call" = call i64 @strlen(i8* %struct_gep_deref)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4366, end: 4372, rendered-as: \22strlen\22 } })_call", i64* %macro_arg_space5, align 4
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4610, end: 4612, rendered-as: \22>=\22 } })_call" = call i1 @">="(i64 %struct_gep_deref, i64 %struct_gep_deref3)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4610, end: 4612, rendered-as: \22>=\22 } })_call", label %if_then_block, label %if_cont_block

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
  %"Brackets(LexString { lexer: \22...\22, start: 4677, end: 4678, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 4689, end: 4690, rendered-as: \22]\22 })_call" = call i8* @"brackets-[-]"(i8* %struct_gep_deref6, i64 %struct_gep_deref9)
  %deref_load = load i8, i8* %"Brackets(LexString { lexer: \22...\22, start: 4677, end: 4678, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 4689, end: 4690, rendered-as: \22]\22 })_call", align 1
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4751, end: 4759, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load)
  store i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4751, end: 4759, rendered-as: \22peekChar\22 } })_call", i8* %macro_arg_space, align 1
  %b_variable_load = load i8, i8* %macro_arg_space, align 1
  store i8 %b_variable_load, i8* %a, align 1
  %lexer_variable_load1 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load1, i32 0, i32 1
  %lexer_variable_load2 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %struct_gep3 = getelementptr inbounds { i8*, i64, i64 }, { i8*, i64, i64 }* %lexer_variable_load2, i32 0, i32 1
  %struct_gep_deref = load i64, i64* %struct_gep3, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4792, end: 4793, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %struct_gep_deref, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4792, end: 4793, rendered-as: \22+\22 } })_call", i64* %macro_arg_space4, align 4
  %b_variable_load5 = load i64, i64* %macro_arg_space4, align 4
  store i64 %b_variable_load5, i64* %struct_gep, align 4
  %a_variable_load = load i8, i8* %a, align 1
  ret i8 %a_variable_load
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4980, end: 4981, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %struct_gep_deref, i64 %struct_gep_deref2)
  %struct_gep3 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %b, i32 0, i32 1
  %struct_gep_deref4 = load i64, i64* %struct_gep3, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4992, end: 4994, rendered-as: \22!=\22 } })_call" = call i1 @"!="(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4980, end: 4981, rendered-as: \22+\22 } })_call", i64 %struct_gep_deref4)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4992, end: 4994, rendered-as: \22!=\22 } })_call", label %if_then_block, label %if_cont_block

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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5264, end: 5265, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %struct_gep_deref9, i64 %struct_gep_deref11)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5264, end: 5265, rendered-as: \22+\22 } })_call", i64* %macro_arg_space, align 4
  %b_variable_load12 = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load12, i64* %struct_gep7, align 4
  %struct_gep13 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %result, i32 0, i32 0
  %struct_gep14 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %a, i32 0, i32 0
  %b_variable_load15 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep14, align 8
  store { i8*, i64, i64 }* %b_variable_load15, { i8*, i64, i64 }** %struct_gep13, align 8
  %result_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %result, align 8
  ret { { i8*, i64, i64 }*, i64, i64 } %result_variable_load
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5498, end: 5499, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %struct_gep_deref, i64 1)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5477, end: 5483, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5498, end: 5499, rendered-as: \22+\22 } })_call")
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5477, end: 5483, rendered-as: \22malloc\22 } })_call", i8** %macro_arg_space, align 8
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
  %"Brackets(LexString { lexer: \22...\22, start: 5544, end: 5545, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 5561, end: 5562, rendered-as: \22]\22 })_call" = call i8* @"brackets-[-]"(i8* %struct_gep_deref5, i64 %struct_gep_deref8)
  %lexstring_variable_load9 = load { { i8*, i64, i64 }*, i64, i64 }*, { { i8*, i64, i64 }*, i64, i64 }** %lexstring, align 8
  %struct_gep10 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %lexstring_variable_load9, i32 0, i32 2
  %struct_gep_deref11 = load i64, i64* %struct_gep10, align 4
  call void @strncpy(i8* %str_variable_load, i8* %"Brackets(LexString { lexer: \22...\22, start: 5544, end: 5545, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 5561, end: 5562, rendered-as: \22]\22 })_call", i64 %struct_gep_deref11)
  %str_variable_load12 = load i8*, i8** %str, align 8
  %lexstring_variable_load13 = load { { i8*, i64, i64 }*, i64, i64 }*, { { i8*, i64, i64 }*, i64, i64 }** %lexstring, align 8
  %struct_gep14 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %lexstring_variable_load13, i32 0, i32 2
  %struct_gep_deref15 = load i64, i64* %struct_gep14, align 4
  %"Brackets(LexString { lexer: \22...\22, start: 5586, end: 5587, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 5600, end: 5601, rendered-as: \22]\22 })_call" = call i8* @"brackets-[-]"(i8* %str_variable_load12, i64 %struct_gep_deref15)
  store i8* %"Brackets(LexString { lexer: \22...\22, start: 5586, end: 5587, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 5600, end: 5601, rendered-as: \22]\22 })_call", i8** %macro_arg_space16, align 8
  store i8 0, i8* %macro_arg_space17, align 1
  %a_variable_load = load i8*, i8** %macro_arg_space16, align 8
  %b_variable_load18 = load i8, i8* %macro_arg_space17, align 1
  store i8 %b_variable_load18, i8* %a_variable_load, align 1
  %str_variable_load19 = load i8*, i8** %str, align 8
  ret i8* %str_variable_load19
}

define void @debug({ { i8*, i64, i64 }*, i64, i64 }* %0) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %str = alloca i8*, align 8
  %val = alloca { { i8*, i64, i64 }*, i64, i64 }*, align 8
  store { { i8*, i64, i64 }*, i64, i64 }* %0, { { i8*, i64, i64 }*, i64, i64 }** %val, align 8
  %val_variable_load = load { { i8*, i64, i64 }*, i64, i64 }*, { { i8*, i64, i64 }*, i64, i64 }** %val, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5673, end: 5679, rendered-as: \22render\22 } })_call" = call i8* @render({ { i8*, i64, i64 }*, i64, i64 }* %val_variable_load)
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5673, end: 5679, rendered-as: \22render\22 } })_call", i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %str, align 8
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5986, end: 5994, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load8)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5997, end: 6006, rendered-as: \22isNumeric\22 } })_call" = call i1 @isNumeric(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5986, end: 5994, rendered-as: \22peekChar\22 } })_call")
  %lexer_variable_load9 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6020, end: 6028, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load9)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6031, end: 6033, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6020, end: 6028, rendered-as: \22peekChar\22 } })_call", i8 46)
  %first_dot_variable_load = load i1, i1* %first_dot, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6039, end: 6041, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6031, end: 6033, rendered-as: \22==\22 } })_call", i1 %first_dot_variable_load)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6009, end: 6011, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 5997, end: 6006, rendered-as: \22isNumeric\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6039, end: 6041, rendered-as: \22&&\22 } })_call")
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6009, end: 6011, rendered-as: \22||\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %struct_gep10 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load = load i64, i64* %struct_gep10, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2187, end: 2188, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2187, end: 2188, rendered-as: \22+\22 } })_call", i64* %macro_arg_space11, align 4
  %b_variable_load12 = load i64, i64* %macro_arg_space11, align 4
  store i64 %b_variable_load12, i64* %struct_gep10, align 4
  %a_variable_load13 = load i64, i64* %struct_gep10, align 4
  %lexer_variable_load14 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6093, end: 6101, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load14)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6104, end: 6106, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6093, end: 6101, rendered-as: \22takeChar\22 } })_call", i8 46)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6104, end: 6106, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6209, end: 6216, rendered-as: \22isAlpha\22 } })_call" = call i1 @isAlpha(i8 %char_variable_load)
  %char_variable_load1 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6228, end: 6237, rendered-as: \22isNumeric\22 } })_call" = call i1 @isNumeric(i8 %char_variable_load1)
  %first_variable_load = load i1, i1* %first, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6243, end: 6244, rendered-as: \22!\22 } })_call" = call i1 @"!"(i1 %first_variable_load)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6240, end: 6242, rendered-as: \22&&\22 } })_call" = call i1 @"&&.9"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6228, end: 6237, rendered-as: \22isNumeric\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6243, end: 6244, rendered-as: \22!\22 } })_call")
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6219, end: 6221, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6209, end: 6216, rendered-as: \22isAlpha\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6240, end: 6242, rendered-as: \22&&\22 } })_call")
  %char_variable_load2 = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6260, end: 6262, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %char_variable_load2, i8 95)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6251, end: 6253, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6219, end: 6221, rendered-as: \22||\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6260, end: 6262, rendered-as: \22==\22 } })_call")
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6251, end: 6253, rendered-as: \22||\22 } })_call"
}

define i1 @isSpecialId(i8 %0) {
entry_block:
  %char = alloca i8, align 1
  store i8 %0, i8* %char, align 1
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6323, end: 6331, rendered-as: \22contains\22 } })_call" = call i1 @contains(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @global_str.24, i32 0, i32 0), i8 %char_variable_load)
  ret i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6323, end: 6331, rendered-as: \22contains\22 } })_call"
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6535, end: 6543, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load8)
  %first_variable_load = load i1, i1* %first, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6546, end: 6562, rendered-as: \22isConventionalId\22 } })_call" = call i1 @isConventionalId(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6535, end: 6543, rendered-as: \22peekChar\22 } })_call", i1 %first_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6546, end: 6562, rendered-as: \22isConventionalId\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %struct_gep9 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load = load i64, i64* %struct_gep9, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2187, end: 2188, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2187, end: 2188, rendered-as: \22+\22 } })_call", i64* %macro_arg_space10, align 4
  %b_variable_load11 = load i64, i64* %macro_arg_space10, align 4
  store i64 %b_variable_load11, i64* %struct_gep9, align 4
  %a_variable_load12 = load i64, i64* %struct_gep9, align 4
  %first_variable_load13 = load i1, i1* %first, align 1
  br i1 %first_variable_load13, label %if_then_block, label %if_cont_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %struct_gep17 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %struct_gep_deref = load i64, i64* %struct_gep17, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6679, end: 6681, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref, i64 0)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6679, end: 6681, rendered-as: \22==\22 } })_call", label %if_then_block18, label %if_cont_block19

if_then_block:                                    ; preds = %while_loop_body_basic_block
  store i1 false, i1* %macro_arg_space14, align 1
  %b_variable_load15 = load i1, i1* %macro_arg_space14, align 1
  store i1 %b_variable_load15, i1* %first, align 1
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %while_loop_body_basic_block
  %lexer_variable_load16 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6642, end: 6650, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load16)
  br label %while_loop_cond_check_basic_block

if_then_block18:                                  ; preds = %while_loop_cont_basic_block
  br label %while_loop_cond_check_basic_block20

if_cont_block19:                                  ; preds = %while_loop_cont_basic_block22, %while_loop_cont_basic_block
  %string_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  ret { { i8*, i64, i64 }*, i64, i64 } %string_variable_load

while_loop_cond_check_basic_block20:              ; preds = %while_loop_body_basic_block21, %if_then_block18
  %lexer_variable_load23 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6704, end: 6712, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load23)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6715, end: 6726, rendered-as: \22isSpecialId\22 } })_call" = call i1 @isSpecialId(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6704, end: 6712, rendered-as: \22peekChar\22 } })_call")
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6715, end: 6726, rendered-as: \22isSpecialId\22 } })_call", label %while_loop_body_basic_block21, label %while_loop_cont_basic_block22

while_loop_body_basic_block21:                    ; preds = %while_loop_cond_check_basic_block20
  %struct_gep24 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load25 = load i64, i64* %struct_gep24, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2187, end: 2188, rendered-as: \22+\22 } })_call26" = call i64 @"+"(i64 %a_variable_load25, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2187, end: 2188, rendered-as: \22+\22 } })_call26", i64* %macro_arg_space27, align 4
  %b_variable_load28 = load i64, i64* %macro_arg_space27, align 4
  store i64 %b_variable_load28, i64* %struct_gep24, align 4
  %a_variable_load29 = load i64, i64* %struct_gep24, align 4
  %lexer_variable_load30 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6772, end: 6780, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load30)
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6990, end: 6998, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load6)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7001, end: 7013, rendered-as: \22isWhitespace\22 } })_call" = call i1 @isWhitespace(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 6990, end: 6998, rendered-as: \22peekChar\22 } })_call")
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7001, end: 7013, rendered-as: \22isWhitespace\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %struct_gep7 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load = load i64, i64* %struct_gep7, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2187, end: 2188, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2187, end: 2188, rendered-as: \22+\22 } })_call", i64* %macro_arg_space8, align 4
  %b_variable_load9 = load i64, i64* %macro_arg_space8, align 4
  store i64 %b_variable_load9, i64* %struct_gep7, align 4
  %a_variable_load10 = load i64, i64* %struct_gep7, align 4
  %lexer_variable_load11 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7053, end: 7061, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load11)
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7249, end: 7257, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load6)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7260, end: 7262, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7249, end: 7257, rendered-as: \22peekChar\22 } })_call", i8 47)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7260, end: 7262, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  %lexer_variable_load7 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7298, end: 7302, rendered-as: \22peek\22 } })_call" = call { i8*, i64, i64 } @peek({ i8*, i64, i64 }* %lexer_variable_load7)
  store { i8*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7298, end: 7302, rendered-as: \22peek\22 } })_call", { i8*, i64, i64 }* %macro_arg_space8, align 8
  %b_variable_load9 = load { i8*, i64, i64 }, { i8*, i64, i64 }* %macro_arg_space8, align 8
  store { i8*, i64, i64 } %b_variable_load9, { i8*, i64, i64 }* %peeked_, align 8
  store { i8*, i64, i64 }* %peeked_, { i8*, i64, i64 }** %macro_arg_space10, align 8
  %b_variable_load11 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %macro_arg_space10, align 8
  store { i8*, i64, i64 }* %b_variable_load11, { i8*, i64, i64 }** %peeked, align 8
  %peeked_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %peeked, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7352, end: 7360, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %peeked_variable_load)
  %peeked_variable_load12 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %peeked, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7385, end: 7393, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %peeked_variable_load12)
  store i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7385, end: 7393, rendered-as: \22peekChar\22 } })_call", i8* %macro_arg_space13, align 1
  %b_variable_load14 = load i8, i8* %macro_arg_space13, align 1
  store i8 %b_variable_load14, i8* %c, align 1
  %c_variable_load = load i8, i8* %c, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7408, end: 7410, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %c_variable_load, i8 47)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7408, end: 7410, rendered-as: \22==\22 } })_call", label %if_then_block15, label %if_else_block

if_cont_block:                                    ; preds = %if_cont_block16, %entry_block
  %string_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  ret { { i8*, i64, i64 }*, i64, i64 } %string_variable_load

if_then_block15:                                  ; preds = %if_then_block
  %lexer_variable_load17 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7432, end: 7440, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load17)
  %lexer_variable_load18 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7459, end: 7467, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load18)
  %struct_gep19 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  store i64 2, i64* %macro_arg_space20, align 4
  %a_variable_load = load i64, i64* %struct_gep19, align 4
  %b_variable_load21 = load i64, i64* %macro_arg_space20, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2308, end: 2309, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 %b_variable_load21)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2308, end: 2309, rendered-as: \22+\22 } })_call", i64* %macro_arg_space22, align 4
  %b_variable_load23 = load i64, i64* %macro_arg_space22, align 4
  store i64 %b_variable_load23, i64* %struct_gep19, align 4
  %a_variable_load24 = load i64, i64* %struct_gep19, align 4
  br label %while_loop_cond_check_basic_block

if_else_block:                                    ; preds = %if_then_block
  %c_variable_load31 = load i8, i8* %c, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7603, end: 7605, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %c_variable_load31, i8 42)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7603, end: 7605, rendered-as: \22==\22 } })_call", label %if_then_block32, label %if_cont_block33

if_cont_block16:                                  ; preds = %if_cont_block33, %while_loop_cont_basic_block
  br label %if_cont_block

while_loop_cond_check_basic_block:                ; preds = %while_loop_body_basic_block, %if_then_block15
  %lexer_variable_load25 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7523, end: 7531, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load25)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7534, end: 7536, rendered-as: \22!=\22 } })_call" = call i1 @"!=.2"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7523, end: 7531, rendered-as: \22takeChar\22 } })_call", i8 10)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7534, end: 7536, rendered-as: \22!=\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %struct_gep26 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load27 = load i64, i64* %struct_gep26, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2187, end: 2188, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load27, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2187, end: 2188, rendered-as: \22+\22 } })_call", i64* %macro_arg_space28, align 4
  %b_variable_load29 = load i64, i64* %macro_arg_space28, align 4
  store i64 %b_variable_load29, i64* %struct_gep26, align 4
  %a_variable_load30 = load i64, i64* %struct_gep26, align 4
  br label %while_loop_cond_check_basic_block

while_loop_cont_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  br label %if_cont_block16

if_then_block32:                                  ; preds = %if_else_block
  %lexer_variable_load34 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7627, end: 7635, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load34)
  %lexer_variable_load35 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7654, end: 7662, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load35)
  %struct_gep36 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  store i64 2, i64* %macro_arg_space37, align 4
  %a_variable_load38 = load i64, i64* %struct_gep36, align 4
  %b_variable_load39 = load i64, i64* %macro_arg_space37, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2308, end: 2309, rendered-as: \22+\22 } })_call40" = call i64 @"+"(i64 %a_variable_load38, i64 %b_variable_load39)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2308, end: 2309, rendered-as: \22+\22 } })_call40", i64* %macro_arg_space41, align 4
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7740, end: 7748, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load47)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7751, end: 7753, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7740, end: 7748, rendered-as: \22takeChar\22 } })_call", i8 42)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7751, end: 7753, rendered-as: \22==\22 } })_call", label %if_then_block48, label %if_cont_block49

while_loop_cont_basic_block46:                    ; preds = %if_then_block51, %while_loop_cond_check_basic_block44
  br label %if_cont_block33

if_then_block48:                                  ; preds = %while_loop_body_basic_block45
  %lexer_variable_load50 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7784, end: 7792, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load50)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7795, end: 7797, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7784, end: 7792, rendered-as: \22peekChar\22 } })_call", i8 47)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7795, end: 7797, rendered-as: \22==\22 } })_call", label %if_then_block51, label %if_cont_block52

if_cont_block49:                                  ; preds = %if_cont_block52, %while_loop_body_basic_block45
  %struct_gep62 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  %a_variable_load63 = load i64, i64* %struct_gep62, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2187, end: 2188, rendered-as: \22+\22 } })_call64" = call i64 @"+"(i64 %a_variable_load63, i64 1)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2187, end: 2188, rendered-as: \22+\22 } })_call64", i64* %macro_arg_space65, align 4
  %b_variable_load66 = load i64, i64* %macro_arg_space65, align 4
  store i64 %b_variable_load66, i64* %struct_gep62, align 4
  %a_variable_load67 = load i64, i64* %struct_gep62, align 4
  br label %while_loop_cond_check_basic_block44

if_then_block51:                                  ; preds = %if_then_block48
  %lexer_variable_load53 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 7831, end: 7839, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load53)
  %struct_gep54 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, i32 0, i32 2
  store i64 2, i64* %macro_arg_space55, align 4
  %a_variable_load56 = load i64, i64* %struct_gep54, align 4
  %b_variable_load57 = load i64, i64* %macro_arg_space55, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2308, end: 2309, rendered-as: \22+\22 } })_call58" = call i64 @"+"(i64 %a_variable_load56, i64 %b_variable_load57)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2308, end: 2309, rendered-as: \22+\22 } })_call58", i64* %macro_arg_space59, align 4
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8096, end: 8114, rendered-as: \22takeOnlyWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeOnlyWhitespace({ i8*, i64, i64 }* %lexer_variable_load)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8096, end: 8114, rendered-as: \22takeOnlyWhitespace\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  %b_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  br label %while_loop_cond_check_basic_block

while_loop_cond_check_basic_block:                ; preds = %while_loop_body_basic_block, %entry_block
  %lexer_variable_load1 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8133, end: 8141, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %lexer_variable_load1)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8144, end: 8146, rendered-as: \22==\22 } })_call" = call i1 @"==.1"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8133, end: 8141, rendered-as: \22peekChar\22 } })_call", i8 47)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8144, end: 8146, rendered-as: \22==\22 } })_call", label %while_loop_body_basic_block, label %while_loop_cont_basic_block

while_loop_body_basic_block:                      ; preds = %while_loop_cond_check_basic_block
  %lexer_variable_load2 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8175, end: 8186, rendered-as: \22takeComment\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeComment({ i8*, i64, i64 }* %lexer_variable_load2)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8175, end: 8186, rendered-as: \22takeComment\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space3, align 8
  %a_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  %b_variable_load4 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space3, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2308, end: 2309, rendered-as: \22+\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @"+.22"({ { i8*, i64, i64 }*, i64, i64 } %a_variable_load, { { i8*, i64, i64 }*, i64, i64 } %b_variable_load4)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2308, end: 2309, rendered-as: \22+\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space5, align 8
  %b_variable_load6 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space5, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load6, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  %a_variable_load7 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  %lexer_variable_load8 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8212, end: 8230, rendered-as: \22takeOnlyWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeOnlyWhitespace({ i8*, i64, i64 }* %lexer_variable_load8)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8212, end: 8230, rendered-as: \22takeOnlyWhitespace\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space9, align 8
  %a_variable_load10 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  %b_variable_load11 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space9, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2308, end: 2309, rendered-as: \22+\22 } })_call12" = call { { i8*, i64, i64 }*, i64, i64 } @"+.22"({ { i8*, i64, i64 }*, i64, i64 } %a_variable_load10, { { i8*, i64, i64 }*, i64, i64 } %b_variable_load11)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2308, end: 2309, rendered-as: \22+\22 } })_call12", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space13, align 8
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8318, end: 8332, rendered-as: \22takeWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %lexer_variable_load)
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8461, end: 8469, rendered-as: \22takeChar\22 } })_call" = call i8 @takeChar({ i8*, i64, i64 }* %lexer_variable_load7)
  %char_variable_load = load i8, i8* %char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8472, end: 8474, rendered-as: \22!=\22 } })_call" = call i1 @"!=.2"(i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8461, end: 8469, rendered-as: \22takeChar\22 } })_call", i8 %char_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8472, end: 8474, rendered-as: \22!=\22 } })_call", label %if_then_block, label %if_cont_block

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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8719, end: 8733, rendered-as: \22takeWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %lexer_variable_load)
  %lexer_variable_load1 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8770, end: 8784, rendered-as: \22takeIdentifier\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeIdentifier({ i8*, i64, i64 }* %lexer_variable_load1)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8770, end: 8784, rendered-as: \22takeIdentifier\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  %b_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load, { { i8*, i64, i64 }*, i64, i64 }* %string, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8805, end: 8811, rendered-as: \22render\22 } })_call" = call i8* @render({ { i8*, i64, i64 }*, i64, i64 }* %string)
  %str_variable_load = load i8*, i8** %str, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8814, end: 8816, rendered-as: \22!=\22 } })_call" = call i1 @"!=.20"(i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8805, end: 8811, rendered-as: \22render\22 } })_call", i8* %str_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8814, end: 8816, rendered-as: \22!=\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @global_str.30, i32 0, i32 0))
  %str_variable_load2 = load i8*, i8** %str, align 8
  call void @printf(i8* %str_variable_load2)
  call void @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @global_str.31, i32 0, i32 0))
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8922, end: 8928, rendered-as: \22render\22 } })_call" = call i8* @render({ { i8*, i64, i64 }*, i64, i64 }* %string)
  call void @printf(i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 8922, end: 8928, rendered-as: \22render\22 } })_call")
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

define void @debug.34(i64* %0) {
entry_block:
  %val = alloca i64*, align 8
  store i64* %0, i64** %val, align 8
  %val_variable_load = load i64*, i64** %val, align 8
  %deref_load = load i64, i64* %val_variable_load, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10064, end: 10066, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %deref_load, i64 1)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10064, end: 10066, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @global_str.35, i32 0, i32 0))
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  ret void
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

define void @debug.36({ { { i8*, i64, i64 }*, i64, i64 }, i64 }* %0) {
entry_block:
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, i64 }*, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %0, { { { i8*, i64, i64 }*, i64, i64 }, i64 }** %val, align 8
  %val_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, i64 }*, { { { i8*, i64, i64 }*, i64, i64 }, i64 }** %val, align 8
  %struct_gep = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, i64 }, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %val_variable_load, i32 0, i32 0
  call void @debug({ { i8*, i64, i64 }*, i64, i64 }* %struct_gep)
  ret void
}

define { { { i8*, i64, i64 }*, i64, i64 }, i64 } @parseNumberExpr({ { i8*, i64, i64 }* }* %0) {
entry_block:
  %expr = alloca { { { i8*, i64, i64 }*, i64, i64 }, i64 }, align 8
  %macro_arg_space = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %number = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %parser = alloca { { i8*, i64, i64 }* }*, align 8
  store { { i8*, i64, i64 }* }* %0, { { i8*, i64, i64 }* }** %parser, align 8
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load, i32 0, i32 0
  %struct_gep_deref = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10487, end: 10497, rendered-as: \22takeNumber\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeNumber({ i8*, i64, i64 }* %struct_gep_deref)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10487, end: 10497, rendered-as: \22takeNumber\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  %b_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load, { { i8*, i64, i64 }*, i64, i64 }* %number, align 8
  %struct_gep1 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %number, i32 0, i32 2
  %struct_gep_deref2 = load i64, i64* %struct_gep1, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10519, end: 10521, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref2, i64 0)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10519, end: 10521, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @panic(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @global_str.37, i32 0, i32 0))
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %struct_gep3 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 }, i64 }, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %expr, i32 0, i32 0
  %b_variable_load4 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %number, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load4, { { i8*, i64, i64 }*, i64, i64 }* %struct_gep3, align 8
  %expr_variable_load = load { { { i8*, i64, i64 }*, i64, i64 }, i64 }, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %expr, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 }, i64 } %expr_variable_load
}

define { { { i8*, i64, i64 }*, i64, i64 }, i64 }* @copy.38({ { { i8*, i64, i64 }*, i64, i64 }, i64 } %0) {
entry_block:
  %macro_arg_space = alloca { { { i8*, i64, i64 }*, i64, i64 }, i64 }*, align 8
  %data = alloca { { { i8*, i64, i64 }*, i64, i64 }, i64 }*, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 }, i64 }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 }, i64 } %0, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %val, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10712, end: 10718, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 }, i64 }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 }, i64 }, { { { i8*, i64, i64 }*, i64, i64 }, i64 }* null, i32 1) to i64))
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10712, end: 10718, rendered-as: \22malloc\22 } })_call" to { { { i8*, i64, i64 }*, i64, i64 }, i64 }*
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10975, end: 10979, rendered-as: \22copy\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, i64 }* @copy.38({ { { i8*, i64, i64 }*, i64, i64 }, i64 } %number_variable_load)
  %bitcast = bitcast { { { i8*, i64, i64 }*, i64, i64 }, i64 }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 10975, end: 10979, rendered-as: \22copy\22 } })_call" to i8*
  store i8* %bitcast, i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %struct_gep1, align 8
  %expr_variable_load = load { i8*, i64 }, { i8*, i64 }* %expr, align 8
  ret { i8*, i64 } %expr_variable_load
}

define void @debug.39({ { { i8*, i64, i64 }*, i64, i64 } }* %0) {
entry_block:
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 } }*, align 8
  store { { { i8*, i64, i64 }*, i64, i64 } }* %0, { { { i8*, i64, i64 }*, i64, i64 } }** %val, align 8
  %val_variable_load = load { { { i8*, i64, i64 }*, i64, i64 } }*, { { { i8*, i64, i64 }*, i64, i64 } }** %val, align 8
  %struct_gep = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* %val_variable_load, i32 0, i32 0
  call void @debug({ { i8*, i64, i64 }*, i64, i64 }* %struct_gep)
  ret void
}

define { { { i8*, i64, i64 }*, i64, i64 } } @parseIdentifierExpr({ { i8*, i64, i64 }* }* %0) {
entry_block:
  %expr = alloca { { { i8*, i64, i64 }*, i64, i64 } }, align 8
  %macro_arg_space = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %id = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %parser = alloca { { i8*, i64, i64 }* }*, align 8
  store { { i8*, i64, i64 }* }* %0, { { i8*, i64, i64 }* }** %parser, align 8
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load, i32 0, i32 0
  %struct_gep_deref = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11244, end: 11258, rendered-as: \22takeIdentifier\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeIdentifier({ i8*, i64, i64 }* %struct_gep_deref)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11244, end: 11258, rendered-as: \22takeIdentifier\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  %b_variable_load = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %macro_arg_space, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load, { { i8*, i64, i64 }*, i64, i64 }* %id, align 8
  %struct_gep1 = getelementptr inbounds { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %id, i32 0, i32 2
  %struct_gep_deref2 = load i64, i64* %struct_gep1, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11276, end: 11278, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %struct_gep_deref2, i64 0)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11276, end: 11278, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @panic(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @global_str.40, i32 0, i32 0))
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %struct_gep3 = getelementptr inbounds { { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* %expr, i32 0, i32 0
  %b_variable_load4 = load { { i8*, i64, i64 }*, i64, i64 }, { { i8*, i64, i64 }*, i64, i64 }* %id, align 8
  store { { i8*, i64, i64 }*, i64, i64 } %b_variable_load4, { { i8*, i64, i64 }*, i64, i64 }* %struct_gep3, align 8
  %expr_variable_load = load { { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* %expr, align 8
  ret { { { i8*, i64, i64 }*, i64, i64 } } %expr_variable_load
}

define { { { i8*, i64, i64 }*, i64, i64 } }* @copy.41({ { { i8*, i64, i64 }*, i64, i64 } } %0) {
entry_block:
  %macro_arg_space = alloca { { { i8*, i64, i64 }*, i64, i64 } }*, align 8
  %data = alloca { { { i8*, i64, i64 }*, i64, i64 } }*, align 8
  %val = alloca { { { i8*, i64, i64 }*, i64, i64 } }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 } } %0, { { { i8*, i64, i64 }*, i64, i64 } }* %val, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11473, end: 11479, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 ptrtoint ({ { { i8*, i64, i64 }*, i64, i64 } }* getelementptr ({ { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* null, i32 1) to i64))
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11473, end: 11479, rendered-as: \22malloc\22 } })_call" to { { { i8*, i64, i64 }*, i64, i64 } }*
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

define { i8*, i64 } @asExpr.42({ { { i8*, i64, i64 }*, i64, i64 } } %0) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %expr = alloca { i8*, i64 }, align 8
  %id = alloca { { { i8*, i64, i64 }*, i64, i64 } }, align 8
  store { { { i8*, i64, i64 }*, i64, i64 } } %0, { { { i8*, i64, i64 }*, i64, i64 } }* %id, align 8
  %struct_gep = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 1
  store i64 2, i64* %struct_gep, align 4
  %struct_gep1 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %expr, i32 0, i32 0
  %id_variable_load = load { { { i8*, i64, i64 }*, i64, i64 } }, { { { i8*, i64, i64 }*, i64, i64 } }* %id, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11719, end: 11723, rendered-as: \22copy\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 } }* @copy.41({ { { i8*, i64, i64 }*, i64, i64 } } %id_variable_load)
  %bitcast = bitcast { { { i8*, i64, i64 }*, i64, i64 } }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11719, end: 11723, rendered-as: \22copy\22 } })_call" to i8*
  store i8* %bitcast, i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %struct_gep1, align 8
  %expr_variable_load = load { i8*, i64 }, { i8*, i64 }* %expr, align 8
  ret { i8*, i64 } %expr_variable_load
}

define { i8*, i64 } @parseExpr({ { i8*, i64, i64 }* }* %0) {
entry_block:
  %expr = alloca { i8*, i64 }, align 8
  %macro_arg_space = alloca i8, align 1
  %next_char = alloca i8, align 1
  %parser = alloca { { i8*, i64, i64 }* }*, align 8
  store { { i8*, i64, i64 }* }* %0, { { i8*, i64, i64 }* }** %parser, align 8
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load, i32 0, i32 0
  %struct_gep_deref = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11809, end: 11823, rendered-as: \22takeWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %struct_gep_deref)
  %parser_variable_load1 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %struct_gep2 = getelementptr inbounds { { i8*, i64, i64 }* }, { { i8*, i64, i64 }* }* %parser_variable_load1, i32 0, i32 0
  %struct_gep_deref3 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %struct_gep2, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11860, end: 11868, rendered-as: \22peekChar\22 } })_call" = call i8 @peekChar({ i8*, i64, i64 }* %struct_gep_deref3)
  store i8 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11860, end: 11868, rendered-as: \22peekChar\22 } })_call", i8* %macro_arg_space, align 1
  %b_variable_load = load i8, i8* %macro_arg_space, align 1
  store i8 %b_variable_load, i8* %next_char, align 1
  call void @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @global_str.43, i32 0, i32 0))
  %next_char_variable_load = load i8, i8* %next_char, align 1
  call void @putchar(i8 %next_char_variable_load)
  call void @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @global_str.44, i32 0, i32 0))
  %next_char_variable_load4 = load i8, i8* %next_char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11958, end: 11967, rendered-as: \22isNumeric\22 } })_call" = call i1 @isNumeric(i8 %next_char_variable_load4)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11958, end: 11967, rendered-as: \22isNumeric\22 } })_call", label %if_then_block, label %if_else_block

if_then_block:                                    ; preds = %entry_block
  %parser_variable_load5 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11985, end: 12000, rendered-as: \22parseNumberExpr\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, i64 } @parseNumberExpr({ { i8*, i64, i64 }* }* %parser_variable_load5)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12003, end: 12009, rendered-as: \22asExpr\22 } })_call" = call { i8*, i64 } @asExpr({ { { i8*, i64, i64 }*, i64, i64 }, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 11985, end: 12000, rendered-as: \22parseNumberExpr\22 } })_call")
  br label %if_cont_block

if_else_block:                                    ; preds = %entry_block
  %next_char_variable_load6 = load i8, i8* %next_char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12036, end: 12052, rendered-as: \22isConventionalId\22 } })_call" = call i1 @isConventionalId(i8 %next_char_variable_load6, i1 true)
  %next_char_variable_load7 = load i8, i8* %next_char, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12072, end: 12083, rendered-as: \22isSpecialId\22 } })_call" = call i1 @isSpecialId(i8 %next_char_variable_load7)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12059, end: 12061, rendered-as: \22||\22 } })_call" = call i1 @"||.10"(i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12036, end: 12052, rendered-as: \22isConventionalId\22 } })_call", i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12072, end: 12083, rendered-as: \22isSpecialId\22 } })_call")
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12059, end: 12061, rendered-as: \22||\22 } })_call", label %if_then_block8, label %if_else_block9

if_cont_block:                                    ; preds = %if_cont_block10, %if_then_block
  %if_phi13 = phi { i8*, i64 } [ %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12003, end: 12009, rendered-as: \22asExpr\22 } })_call", %if_then_block ], [ %if_phi, %if_cont_block10 ]
  ret { i8*, i64 } %if_phi13

if_then_block8:                                   ; preds = %if_else_block
  %parser_variable_load11 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12102, end: 12121, rendered-as: \22parseIdentifierExpr\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 } } @parseIdentifierExpr({ { i8*, i64, i64 }* }* %parser_variable_load11)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12124, end: 12130, rendered-as: \22asExpr\22 } })_call" = call { i8*, i64 } @asExpr.42({ { { i8*, i64, i64 }*, i64, i64 } } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12102, end: 12121, rendered-as: \22parseIdentifierExpr\22 } })_call")
  br label %if_cont_block10

if_else_block9:                                   ; preds = %if_else_block
  call void @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @global_str.45, i32 0, i32 0))
  %next_char_variable_load12 = load i8, i8* %next_char, align 1
  call void @putchar(i8 %next_char_variable_load12)
  call void @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @global_str.46, i32 0, i32 0))
  call void @panic.17()
  %expr_variable_load = load { i8*, i64 }, { i8*, i64 }* %expr, align 8
  br label %if_cont_block10

if_cont_block10:                                  ; preds = %if_else_block9, %if_then_block8
  %if_phi = phi { i8*, i64 } [ %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12124, end: 12130, rendered-as: \22asExpr\22 } })_call", %if_then_block8 ], [ %expr_variable_load, %if_else_block9 ]
  br label %if_cont_block
}

define i64 @main() {
entry_block:
  %macro_arg_space14 = alloca { { i8*, i64, i64 }* }*, align 8
  %deref_space13 = alloca { { i8*, i64, i64 }* }, align 8
  %parser = alloca { { i8*, i64, i64 }* }*, align 8
  %macro_arg_space9 = alloca { { i8*, i64, i64 }*, i64, i64 }*, align 8
  %deref_space8 = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %macro_arg_space4 = alloca { { i8*, i64, i64 }*, i64, i64 }*, align 8
  %deref_space3 = alloca { { i8*, i64, i64 }*, i64, i64 }, align 8
  %string = alloca { { i8*, i64, i64 }*, i64, i64 }*, align 8
  %macro_arg_space1 = alloca { i8*, i64, i64 }*, align 8
  %deref_space = alloca { i8*, i64, i64 }, align 8
  %lexer = alloca { i8*, i64, i64 }*, align 8
  %macro_arg_space = alloca i8*, align 8
  %code = alloca i8*, align 8
  call void @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @global_str.47, i32 0, i32 0))
  store i8* getelementptr inbounds ([20 x i8], [20 x i8]* @global_str.48, i32 0, i32 0), i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %code, align 8
  %code_variable_load = load i8*, i8** %code, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12404, end: 12413, rendered-as: \22lexer#new\22 } })_call" = call { i8*, i64, i64 } @"lexer#new"(i8* %code_variable_load)
  store { i8*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12404, end: 12413, rendered-as: \22lexer#new\22 } })_call", { i8*, i64, i64 }* %deref_space, align 8
  store { i8*, i64, i64 }* %deref_space, { i8*, i64, i64 }** %macro_arg_space1, align 8
  %b_variable_load2 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %macro_arg_space1, align 8
  store { i8*, i64, i64 }* %b_variable_load2, { i8*, i64, i64 }** %lexer, align 8
  %lexer_variable_load = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12599, end: 12609, rendered-as: \22takeNumber\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeNumber({ i8*, i64, i64 }* %lexer_variable_load)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12599, end: 12609, rendered-as: \22takeNumber\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %deref_space3, align 8
  store { { i8*, i64, i64 }*, i64, i64 }* %deref_space3, { { i8*, i64, i64 }*, i64, i64 }** %macro_arg_space4, align 8
  %b_variable_load5 = load { { i8*, i64, i64 }*, i64, i64 }*, { { i8*, i64, i64 }*, i64, i64 }** %macro_arg_space4, align 8
  store { { i8*, i64, i64 }*, i64, i64 }* %b_variable_load5, { { i8*, i64, i64 }*, i64, i64 }** %string, align 8
  %string_variable_load = load { { i8*, i64, i64 }*, i64, i64 }*, { { i8*, i64, i64 }*, i64, i64 }** %string, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12631, end: 12637, rendered-as: \22render\22 } })_call" = call i8* @render({ { i8*, i64, i64 }*, i64, i64 }* %string_variable_load)
  call void @printf(i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12631, end: 12637, rendered-as: \22render\22 } })_call")
  call void @putchar(i8 10)
  %lexer_variable_load6 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12671, end: 12685, rendered-as: \22takeWhitespace\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeWhitespace({ i8*, i64, i64 }* %lexer_variable_load6)
  %lexer_variable_load7 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12712, end: 12726, rendered-as: \22takeIdentifier\22 } })_call" = call { { i8*, i64, i64 }*, i64, i64 } @takeIdentifier({ i8*, i64, i64 }* %lexer_variable_load7)
  store { { i8*, i64, i64 }*, i64, i64 } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12712, end: 12726, rendered-as: \22takeIdentifier\22 } })_call", { { i8*, i64, i64 }*, i64, i64 }* %deref_space8, align 8
  store { { i8*, i64, i64 }*, i64, i64 }* %deref_space8, { { i8*, i64, i64 }*, i64, i64 }** %macro_arg_space9, align 8
  %b_variable_load10 = load { { i8*, i64, i64 }*, i64, i64 }*, { { i8*, i64, i64 }*, i64, i64 }** %macro_arg_space9, align 8
  store { { i8*, i64, i64 }*, i64, i64 }* %b_variable_load10, { { i8*, i64, i64 }*, i64, i64 }** %string, align 8
  %string_variable_load11 = load { { i8*, i64, i64 }*, i64, i64 }*, { { i8*, i64, i64 }*, i64, i64 }** %string, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12748, end: 12754, rendered-as: \22render\22 } })_call" = call i8* @render({ { i8*, i64, i64 }*, i64, i64 }* %string_variable_load11)
  call void @printf(i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12748, end: 12754, rendered-as: \22render\22 } })_call")
  call void @putchar(i8 10)
  %lexer_variable_load12 = load { i8*, i64, i64 }*, { i8*, i64, i64 }** %lexer, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12800, end: 12810, rendered-as: \22parser#new\22 } })_call" = call { { i8*, i64, i64 }* } @"parser#new"({ i8*, i64, i64 }* %lexer_variable_load12)
  store { { i8*, i64, i64 }* } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12800, end: 12810, rendered-as: \22parser#new\22 } })_call", { { i8*, i64, i64 }* }* %deref_space13, align 8
  store { { i8*, i64, i64 }* }* %deref_space13, { { i8*, i64, i64 }* }** %macro_arg_space14, align 8
  %b_variable_load15 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %macro_arg_space14, align 8
  store { { i8*, i64, i64 }* }* %b_variable_load15, { { i8*, i64, i64 }* }** %parser, align 8
  %parser_variable_load = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12830, end: 12845, rendered-as: \22parseNumberExpr\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, i64 } @parseNumberExpr({ { i8*, i64, i64 }* }* %parser_variable_load)
  %parser_variable_load16 = load { { i8*, i64, i64 }* }*, { { i8*, i64, i64 }* }** %parser, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 12859, end: 12874, rendered-as: \22parseNumberExpr\22 } })_call" = call { { { i8*, i64, i64 }*, i64, i64 }, i64 } @parseNumberExpr({ { i8*, i64, i64 }* }* %parser_variable_load16)
  call void @exit(i64 0)
  ret i64 0
}
