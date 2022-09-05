; ModuleID = 'array.silver'
source_filename = "array.silver"

@global_str = private unnamed_addr constant [19 x i8] c"Assertion failed: \00", align 1
@global_str.12 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@global_str.13 = private unnamed_addr constant [22 x i8] c"Assertion succeeded: \00", align 1
@global_str.14 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@global_str.15 = private unnamed_addr constant [19 x i8] c"Assertion failed: \00", align 1
@global_str.16 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@global_str.17 = private unnamed_addr constant [8 x i8] c"Panic!\0A\00", align 1
@global_str.19 = private unnamed_addr constant [8 x i8] c"Panic!\0A\00", align 1
@global_str.20 = private unnamed_addr constant [17 x i8] c"Could not malloc\00", align 1
@global_str.21 = private unnamed_addr constant [18 x i8] c"Could not realloc\00", align 1
@global_str.23 = private unnamed_addr constant [12 x i8] c"made array\0A\00", align 1
@global_str.24 = private unnamed_addr constant [11 x i8] c"got array\0A\00", align 1
@global_str.25 = private unnamed_addr constant [5 x i8] c"here\00", align 1

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

define i1 @"==.11"(i8* %0, i8* %1) {
entry_block:
  %macro_arg_space3 = alloca i64, align 8
  %b_ = alloca i64, align 8
  %macro_arg_space = alloca i64, align 8
  %a_ = alloca i64, align 8
  %b = alloca i8*, align 8
  %a = alloca i8*, align 8
  store i8* %0, i8** %a, align 8
  store i8* %1, i8** %b, align 8
  %a_variable_load = load i8*, i8** %a, align 8
  %ptr_to_int = ptrtoint i8* %a_variable_load to i64
  store i64 %ptr_to_int, i64* %macro_arg_space, align 4
  %b_variable_load = load i64, i64* %macro_arg_space, align 4
  store i64 %b_variable_load, i64* %a_, align 4
  %b_variable_load1 = load i8*, i8** %b, align 8
  %ptr_to_int2 = ptrtoint i8* %b_variable_load1 to i64
  store i64 %ptr_to_int2, i64* %macro_arg_space3, align 4
  %b_variable_load4 = load i64, i64* %macro_arg_space3, align 4
  store i64 %b_variable_load4, i64* %b_, align 4
  %a__variable_load = load i64, i64* %a_, align 4
  %b__variable_load = load i64, i64* %b_, align 4
  %asm_int_cmp_eq = icmp eq i64 %a__variable_load, %b__variable_load
  ret i1 %asm_int_cmp_eq
}

define void @assert(i1 %0, i8* %1) {
entry_block:
  %message = alloca i8*, align 8
  %val = alloca i1, align 1
  store i1 %0, i1* %val, align 1
  store i8* %1, i8** %message, align 8
  %val_variable_load = load i1, i1* %val, align 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2618, end: 2619, rendered-as: \22!\22 } })_call" = call i1 @"!"(i1 %val_variable_load)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2618, end: 2619, rendered-as: \22!\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @global_str, i32 0, i32 0))
  %message_variable_load = load i8*, i8** %message, align 8
  call void @printf(i8* %message_variable_load)
  call void @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @global_str.12, i32 0, i32 0))
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
  call void @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @global_str.13, i32 0, i32 0))
  %message_variable_load = load i8*, i8** %message, align 8
  call void @printf(i8* %message_variable_load)
  call void @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @global_str.14, i32 0, i32 0))
  br label %if_cont_block

if_else_block:                                    ; preds = %entry_block
  call void @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @global_str.15, i32 0, i32 0))
  %message_variable_load1 = load i8*, i8** %message, align 8
  call void @printf(i8* %message_variable_load1)
  call void @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @global_str.16, i32 0, i32 0))
  call void @exit(i64 1)
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_else_block, %if_then_block
  ret void
}

define void @panic(i8* %0) {
entry_block:
  %message = alloca i8*, align 8
  store i8* %0, i8** %message, align 8
  call void @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_str.17, i32 0, i32 0))
  %message_variable_load = load i8*, i8** %message, align 8
  call void @printf(i8* %message_variable_load)
  call void @exit(i64 1)
  ret void
}

define void @panic.18() {
entry_block:
  call void @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @global_str.19, i32 0, i32 0))
  call void @exit(i64 1)
  ret void
}

define i8* @new(i64 %0) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %data = alloca i8*, align 8
  %bytes = alloca i64, align 8
  store i64 %0, i64* %bytes, align 4
  %bytes_variable_load = load i64, i64* %bytes, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3204, end: 3210, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 %bytes_variable_load)
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3204, end: 3210, rendered-as: \22malloc\22 } })_call", i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %data, align 8
  %data_variable_load = load i8*, i8** %data, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3231, end: 3233, rendered-as: \22==\22 } })_call" = call i1 @"==.11"(i8* %data_variable_load, i8* null)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3231, end: 3233, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @panic(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @global_str.20, i32 0, i32 0))
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %data_variable_load1 = load i8*, i8** %data, align 8
  ret i8* %data_variable_load1
}

define i8* @resize(i8* %0, i64 %1) {
entry_block:
  %macro_arg_space = alloca i8*, align 8
  %new_data = alloca i8*, align 8
  %bytes = alloca i64, align 8
  %data = alloca i8*, align 8
  store i8* %0, i8** %data, align 8
  store i64 %1, i64* %bytes, align 4
  %data_variable_load = load i8*, i8** %data, align 8
  %bytes_variable_load = load i64, i64* %bytes, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3367, end: 3374, rendered-as: \22realloc\22 } })_call" = call i8* @realloc(i8* %data_variable_load, i64 %bytes_variable_load)
  store i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3367, end: 3374, rendered-as: \22realloc\22 } })_call", i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %new_data, align 8
  %new_data_variable_load = load i8*, i8** %new_data, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3405, end: 3407, rendered-as: \22==\22 } })_call" = call i1 @"==.11"(i8* %new_data_variable_load, i8* null)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3405, end: 3407, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @panic(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @global_str.21, i32 0, i32 0))
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %data_variable_load1 = load i8*, i8** %data, align 8
  ret i8* %data_variable_load1
}

define i64 @try_get({ i64, i64, i64* } %0) {
entry_block:
  %va = alloca { i64, i64, i64* }, align 8
  store { i64, i64, i64* } %0, { i64, i64, i64* }* %va, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4467, end: 4470, rendered-as: \22get\22 } })_call" = call i64* @get({ i64, i64, i64* }* %va, i64 0)
  %deref_load = load i64, i64* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4467, end: 4470, rendered-as: \22get\22 } })_call", align 4
  ret i64 %deref_load
}

define i64* @get({ i64, i64, i64* }* %0, i64 %1) {
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
  %asm_gep = getelementptr i64, i64* %data_variable_load, i64 %index_variable_load
  ret i64* %asm_gep
}

define i64* @test() {
entry_block:
  %macro_arg_space = alloca { i64, i64, i64* }, align 8
  %va = alloca { i64, i64, i64* }, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4544, end: 4561, rendered-as: \22variablearray#new\22 } })_call" = call { i64, i64, i64* } @"variablearray#new"()
  store { i64, i64, i64* } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4544, end: 4561, rendered-as: \22variablearray#new\22 } })_call", { i64, i64, i64* }* %macro_arg_space, align 8
  %b_variable_load = load { i64, i64, i64* }, { i64, i64, i64* }* %macro_arg_space, align 8
  store { i64, i64, i64* } %b_variable_load, { i64, i64, i64* }* %va, align 8
  call void @append({ i64, i64, i64* }* %va, i64 66)
  call void @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @global_str.23, i32 0, i32 0))
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4635, end: 4638, rendered-as: \22get\22 } })_call" = call i64* @get({ i64, i64, i64* }* %va, i64 0)
  call void @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @global_str.24, i32 0, i32 0))
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4686, end: 4689, rendered-as: \22get\22 } })_call" = call i64* @get({ i64, i64, i64* }* %va, i64 0)
  ret i64* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4686, end: 4689, rendered-as: \22get\22 } })_call"
}

define { i64, i64, i64* } @"variablearray#new"() {
entry_block:
  %macro_arg_space5 = alloca i64, align 8
  %macro_arg_space2 = alloca i64, align 8
  %macro_arg_space = alloca i64*, align 8
  %va = alloca { i64, i64, i64* }, align 8
  %struct_gep = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va, i32 0, i32 2
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3685, end: 3686, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 64)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3670, end: 3673, rendered-as: \22new\22 } })_call" = call i8* @new(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3685, end: 3686, rendered-as: \22*\22 } })_call")
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3670, end: 3673, rendered-as: \22new\22 } })_call" to i64*
  store i64* %bitcast, i64** %macro_arg_space, align 8
  %b_variable_load = load i64*, i64** %macro_arg_space, align 8
  store i64* %b_variable_load, i64** %struct_gep, align 8
  %struct_gep1 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va, i32 0, i32 0
  store i64 0, i64* %macro_arg_space2, align 4
  %b_variable_load3 = load i64, i64* %macro_arg_space2, align 4
  store i64 %b_variable_load3, i64* %struct_gep1, align 4
  %struct_gep4 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va, i32 0, i32 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3749, end: 3750, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 64)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3749, end: 3750, rendered-as: \22*\22 } })_call", i64* %macro_arg_space5, align 4
  %b_variable_load6 = load i64, i64* %macro_arg_space5, align 4
  store i64 %b_variable_load6, i64* %struct_gep4, align 4
  %va_variable_load = load { i64, i64, i64* }, { i64, i64, i64* }* %va, align 8
  ret { i64, i64, i64* } %va_variable_load
}

define void @append({ i64, i64, i64* }* %0, i64 %1) {
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2314, end: 2315, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 %b_variable_load)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2314, end: 2315, rendered-as: \22+\22 } })_call", i64* %macro_arg_space1, align 4
  %b_variable_load2 = load i64, i64* %macro_arg_space1, align 4
  store i64 %b_variable_load2, i64* %struct_gep, align 4
  %a_variable_load3 = load i64, i64* %struct_gep, align 4
  %va_variable_load4 = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %struct_gep5 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va_variable_load4, i32 0, i32 0
  %struct_gep_deref = load i64, i64* %struct_gep5, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4112, end: 4113, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 %struct_gep_deref, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64))
  %va_variable_load6 = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %struct_gep7 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va_variable_load6, i32 0, i32 1
  %struct_gep_deref8 = load i64, i64* %struct_gep7, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4126, end: 4127, rendered-as: \22>\22 } })_call" = call i1 @">"(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4112, end: 4113, rendered-as: \22*\22 } })_call", i64 %struct_gep_deref8)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4126, end: 4127, rendered-as: \22>\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  %va_variable_load9 = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %struct_gep10 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va_variable_load9, i32 0, i32 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4177, end: 4178, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 64)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4177, end: 4178, rendered-as: \22*\22 } })_call", i64* %macro_arg_space11, align 4
  %a_variable_load12 = load i64, i64* %struct_gep10, align 4
  %b_variable_load13 = load i64, i64* %macro_arg_space11, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2314, end: 2315, rendered-as: \22+\22 } })_call14" = call i64 @"+"(i64 %a_variable_load12, i64 %b_variable_load13)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2314, end: 2315, rendered-as: \22+\22 } })_call14", i64* %macro_arg_space15, align 4
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
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4203, end: 4210, rendered-as: \22realloc\22 } })_call" = call i8* @realloc(i8* %bitcast, i64 %struct_gep_deref25)
  %bitcast26 = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4203, end: 4210, rendered-as: \22realloc\22 } })_call" to i64*
  store i64* %bitcast26, i64** %macro_arg_space27, align 8
  %b_variable_load28 = load i64*, i64** %macro_arg_space27, align 8
  store i64* %b_variable_load28, i64** %struct_gep19, align 8
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %va_variable_load29 = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %va_variable_load30 = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %struct_gep31 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %va_variable_load30, i32 0, i32 0
  %struct_gep_deref32 = load i64, i64* %struct_gep31, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4322, end: 4323, rendered-as: \22-\22 } })_call" = call i64 @-(i64 %struct_gep_deref32, i64 1)
  %val_variable_load = load i64, i64* %val, align 4
  call void @set({ i64, i64, i64* }* %va_variable_load29, i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4322, end: 4323, rendered-as: \22-\22 } })_call", i64 %val_variable_load)
  ret void
}

define void @set({ i64, i64, i64* }* %0, i64 %1, i64 %2) {
entry_block:
  %val = alloca i64, align 8
  %index = alloca i64, align 8
  %va = alloca { i64, i64, i64* }*, align 8
  store { i64, i64, i64* }* %0, { i64, i64, i64* }** %va, align 8
  store i64 %1, i64* %index, align 4
  store i64 %2, i64* %val, align 4
  %bitcast = bitcast i64* %val to i8*
  %va_variable_load = load { i64, i64, i64* }*, { i64, i64, i64* }** %va, align 8
  %index_variable_load = load i64, i64* %index, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3986, end: 3989, rendered-as: \22get\22 } })_call" = call i64* @get.22({ i64, i64, i64* }* %va_variable_load, i64 %index_variable_load)
  %bitcast1 = bitcast i64* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3986, end: 3989, rendered-as: \22get\22 } })_call" to i8*
  call void @memcpy(i8* %bitcast, i8* %bitcast1, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64))
  ret void
}

define i64* @get.22({ i64, i64, i64* }* %0, i64 %1) {
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
  %asm_gep = getelementptr i64, i64* %data_variable_load, i64 %index_variable_load
  ret i64* %asm_gep
}

define { i64, i64, i64* } @test2() {
entry_block:
  %macro_arg_space = alloca { i64, i64, i64* }, align 8
  %va = alloca { i64, i64, i64* }, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4779, end: 4796, rendered-as: \22variablearray#new\22 } })_call" = call { i64, i64, i64* } @"variablearray#new"()
  store { i64, i64, i64* } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 4779, end: 4796, rendered-as: \22variablearray#new\22 } })_call", { i64, i64, i64* }* %macro_arg_space, align 8
  %b_variable_load = load { i64, i64, i64* }, { i64, i64, i64* }* %macro_arg_space, align 8
  store { i64, i64, i64* } %b_variable_load, { i64, i64, i64* }* %va, align 8
  call void @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @global_str.25, i32 0, i32 0))
  call void @append({ i64, i64, i64* }* %va, i64 88)
  %va_variable_load = load { i64, i64, i64* }, { i64, i64, i64* }* %va, align 8
  ret { i64, i64, i64* } %va_variable_load
}
