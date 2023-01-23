; ModuleID = 'test.silver'
source_filename = "test.silver"

@global_str = private unnamed_addr constant [3 x i8] c"hi\00", align 1
@global_str.12 = private unnamed_addr constant [4 x i8] c"run\00", align 1

declare i8* @malloc(i64)

declare i8* @realloc(i8*, i64)

declare i64 @strlen(i8*)

declare void @free(i8*)

declare void @strcpy(i8*, i8*)

declare void @strncpy(i8*, i8*, i64)

declare void @memcpy(i8*, i8*, i64)

declare i64 @strcmp(i8*, i8*)

declare void @printf(i8*)

declare void @putchar(i64)

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

define void @main() {
entry_block:
  %macro_arg_space1 = alloca i8**, align 8
  %s = alloca i8**, align 8
  %macro_arg_space = alloca { i64, i64, i8** }, align 8
  %va = alloca { i64, i64, i8** }, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3373, end: 3390, rendered-as: \22variablearray#new\22 } })_call" = call { i64, i64, i8** } @"variablearray#new"()
  store { i64, i64, i8** } %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3373, end: 3390, rendered-as: \22variablearray#new\22 } })_call", { i64, i64, i8** }* %macro_arg_space, align 8
  %b_variable_load = load { i64, i64, i8** }, { i64, i64, i8** }* %macro_arg_space, align 8
  store { i64, i64, i8** } %b_variable_load, { i64, i64, i8** }* %va, align 8
  call void @append({ i64, i64, i8** }* %va, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @global_str, i32 0, i32 0))
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3465, end: 3468, rendered-as: \22get\22 } })_call" = call i8** @get.11({ i64, i64, i8** }* %va, i64 0)
  store i8** %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3465, end: 3468, rendered-as: \22get\22 } })_call", i8*** %macro_arg_space1, align 8
  %b_variable_load2 = load i8**, i8*** %macro_arg_space1, align 8
  store i8** %b_variable_load2, i8*** %s, align 8
  %s_variable_load = load i8**, i8*** %s, align 8
  %deref_load = load i8*, i8** %s_variable_load, align 8
  call void @printf(i8* %deref_load)
  call void @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @global_str.12, i32 0, i32 0))
  ret void
}

define { i64, i64, i8** } @"variablearray#new"() {
entry_block:
  %macro_arg_space5 = alloca i64, align 8
  %macro_arg_space2 = alloca i64, align 8
  %macro_arg_space = alloca i8**, align 8
  %va = alloca { i64, i64, i8** }, align 8
  %struct_gep = getelementptr inbounds { i64, i64, i8** }, { i64, i64, i8** }* %va, i32 0, i32 2
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2570, end: 2571, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint (i8** getelementptr (i8*, i8** null, i32 1) to i64), i64 64)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2552, end: 2558, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2570, end: 2571, rendered-as: \22*\22 } })_call")
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2552, end: 2558, rendered-as: \22malloc\22 } })_call" to i8**
  store i8** %bitcast, i8*** %macro_arg_space, align 8
  %b_variable_load = load i8**, i8*** %macro_arg_space, align 8
  store i8** %b_variable_load, i8*** %struct_gep, align 8
  %struct_gep1 = getelementptr inbounds { i64, i64, i8** }, { i64, i64, i8** }* %va, i32 0, i32 0
  store i64 0, i64* %macro_arg_space2, align 4
  %b_variable_load3 = load i64, i64* %macro_arg_space2, align 4
  store i64 %b_variable_load3, i64* %struct_gep1, align 4
  %struct_gep4 = getelementptr inbounds { i64, i64, i8** }, { i64, i64, i8** }* %va, i32 0, i32 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2634, end: 2635, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint (i8** getelementptr (i8*, i8** null, i32 1) to i64), i64 64)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2634, end: 2635, rendered-as: \22*\22 } })_call", i64* %macro_arg_space5, align 4
  %b_variable_load6 = load i64, i64* %macro_arg_space5, align 4
  store i64 %b_variable_load6, i64* %struct_gep4, align 4
  %va_variable_load = load { i64, i64, i8** }, { i64, i64, i8** }* %va, align 8
  ret { i64, i64, i8** } %va_variable_load
}

define void @append({ i64, i64, i8** }* %0, i8* %1) {
entry_block:
  %macro_arg_space27 = alloca i8**, align 8
  %macro_arg_space15 = alloca i64, align 8
  %macro_arg_space11 = alloca i64, align 8
  %macro_arg_space1 = alloca i64, align 8
  %macro_arg_space = alloca i64, align 8
  %val = alloca i8*, align 8
  %va = alloca { i64, i64, i8** }*, align 8
  store { i64, i64, i8** }* %0, { i64, i64, i8** }** %va, align 8
  store i8* %1, i8** %val, align 8
  %va_variable_load = load { i64, i64, i8** }*, { i64, i64, i8** }** %va, align 8
  %struct_gep = getelementptr inbounds { i64, i64, i8** }, { i64, i64, i8** }* %va_variable_load, i32 0, i32 0
  store i64 1, i64* %macro_arg_space, align 4
  %a_variable_load = load i64, i64* %struct_gep, align 4
  %b_variable_load = load i64, i64* %macro_arg_space, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2314, end: 2315, rendered-as: \22+\22 } })_call" = call i64 @"+"(i64 %a_variable_load, i64 %b_variable_load)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2314, end: 2315, rendered-as: \22+\22 } })_call", i64* %macro_arg_space1, align 4
  %b_variable_load2 = load i64, i64* %macro_arg_space1, align 4
  store i64 %b_variable_load2, i64* %struct_gep, align 4
  %a_variable_load3 = load i64, i64* %struct_gep, align 4
  %va_variable_load4 = load { i64, i64, i8** }*, { i64, i64, i8** }** %va, align 8
  %struct_gep5 = getelementptr inbounds { i64, i64, i8** }, { i64, i64, i8** }* %va_variable_load4, i32 0, i32 0
  %struct_gep_deref = load i64, i64* %struct_gep5, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2997, end: 2998, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 %struct_gep_deref, i64 ptrtoint (i8** getelementptr (i8*, i8** null, i32 1) to i64))
  %va_variable_load6 = load { i64, i64, i8** }*, { i64, i64, i8** }** %va, align 8
  %struct_gep7 = getelementptr inbounds { i64, i64, i8** }, { i64, i64, i8** }* %va_variable_load6, i32 0, i32 1
  %struct_gep_deref8 = load i64, i64* %struct_gep7, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3011, end: 3012, rendered-as: \22>\22 } })_call" = call i1 @">"(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2997, end: 2998, rendered-as: \22*\22 } })_call", i64 %struct_gep_deref8)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3011, end: 3012, rendered-as: \22>\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  %va_variable_load9 = load { i64, i64, i8** }*, { i64, i64, i8** }** %va, align 8
  %struct_gep10 = getelementptr inbounds { i64, i64, i8** }, { i64, i64, i8** }* %va_variable_load9, i32 0, i32 1
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3062, end: 3063, rendered-as: \22*\22 } })_call" = call i64 @"*"(i64 ptrtoint (i8** getelementptr (i8*, i8** null, i32 1) to i64), i64 64)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3062, end: 3063, rendered-as: \22*\22 } })_call", i64* %macro_arg_space11, align 4
  %a_variable_load12 = load i64, i64* %struct_gep10, align 4
  %b_variable_load13 = load i64, i64* %macro_arg_space11, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2314, end: 2315, rendered-as: \22+\22 } })_call14" = call i64 @"+"(i64 %a_variable_load12, i64 %b_variable_load13)
  store i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2314, end: 2315, rendered-as: \22+\22 } })_call14", i64* %macro_arg_space15, align 4
  %b_variable_load16 = load i64, i64* %macro_arg_space15, align 4
  store i64 %b_variable_load16, i64* %struct_gep10, align 4
  %a_variable_load17 = load i64, i64* %struct_gep10, align 4
  %va_variable_load18 = load { i64, i64, i8** }*, { i64, i64, i8** }** %va, align 8
  %struct_gep19 = getelementptr inbounds { i64, i64, i8** }, { i64, i64, i8** }* %va_variable_load18, i32 0, i32 2
  %va_variable_load20 = load { i64, i64, i8** }*, { i64, i64, i8** }** %va, align 8
  %struct_gep21 = getelementptr inbounds { i64, i64, i8** }, { i64, i64, i8** }* %va_variable_load20, i32 0, i32 2
  %struct_gep_deref22 = load i8**, i8*** %struct_gep21, align 8
  %bitcast = bitcast i8** %struct_gep_deref22 to i8*
  %va_variable_load23 = load { i64, i64, i8** }*, { i64, i64, i8** }** %va, align 8
  %struct_gep24 = getelementptr inbounds { i64, i64, i8** }, { i64, i64, i8** }* %va_variable_load23, i32 0, i32 1
  %struct_gep_deref25 = load i64, i64* %struct_gep24, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3088, end: 3095, rendered-as: \22realloc\22 } })_call" = call i8* @realloc(i8* %bitcast, i64 %struct_gep_deref25)
  %bitcast26 = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3088, end: 3095, rendered-as: \22realloc\22 } })_call" to i8**
  store i8** %bitcast26, i8*** %macro_arg_space27, align 8
  %b_variable_load28 = load i8**, i8*** %macro_arg_space27, align 8
  store i8** %b_variable_load28, i8*** %struct_gep19, align 8
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  %va_variable_load29 = load { i64, i64, i8** }*, { i64, i64, i8** }** %va, align 8
  %va_variable_load30 = load { i64, i64, i8** }*, { i64, i64, i8** }** %va, align 8
  %struct_gep31 = getelementptr inbounds { i64, i64, i8** }, { i64, i64, i8** }* %va_variable_load30, i32 0, i32 0
  %struct_gep_deref32 = load i64, i64* %struct_gep31, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3207, end: 3208, rendered-as: \22-\22 } })_call" = call i64 @-(i64 %struct_gep_deref32, i64 1)
  %val_variable_load = load i8*, i8** %val, align 8
  call void @set({ i64, i64, i8** }* %va_variable_load29, i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 3207, end: 3208, rendered-as: \22-\22 } })_call", i8* %val_variable_load)
  ret void
}

define void @set({ i64, i64, i8** }* %0, i64 %1, i8* %2) {
entry_block:
  %val = alloca i8*, align 8
  %index = alloca i64, align 8
  %va = alloca { i64, i64, i8** }*, align 8
  store { i64, i64, i8** }* %0, { i64, i64, i8** }** %va, align 8
  store i64 %1, i64* %index, align 4
  store i8* %2, i8** %val, align 8
  %va_variable_load = load { i64, i64, i8** }*, { i64, i64, i8** }** %va, align 8
  %index_variable_load = load i64, i64* %index, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2856, end: 2859, rendered-as: \22get\22 } })_call" = call i8** @get({ i64, i64, i8** }* %va_variable_load, i64 %index_variable_load)
  %bitcast = bitcast i8** %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 2856, end: 2859, rendered-as: \22get\22 } })_call" to i8*
  %bitcast1 = bitcast i8** %val to i8*
  call void @memcpy(i8* %bitcast, i8* %bitcast1, i64 ptrtoint (i8** getelementptr (i8*, i8** null, i32 1) to i64))
  ret void
}

define i8** @get({ i64, i64, i8** }* %0, i64 %1) {
entry_block:
  %data = alloca i8**, align 8
  %index = alloca i64, align 8
  %va = alloca { i64, i64, i8** }*, align 8
  store { i64, i64, i8** }* %0, { i64, i64, i8** }** %va, align 8
  store i64 %1, i64* %index, align 4
  %va_variable_load = load { i64, i64, i8** }*, { i64, i64, i8** }** %va, align 8
  %struct_gep = getelementptr inbounds { i64, i64, i8** }, { i64, i64, i8** }* %va_variable_load, i32 0, i32 2
  %b_variable_load = load i8**, i8*** %struct_gep, align 8
  store i8** %b_variable_load, i8*** %data, align 8
  %data_variable_load = load i8**, i8*** %data, align 8
  %index_variable_load = load i64, i64* %index, align 4
  %asm_gep = getelementptr inbounds i8*, i8** %data_variable_load, i64 %index_variable_load
  ret i8** %asm_gep
}

define i8** @get.11({ i64, i64, i8** }* %0, i64 %1) {
entry_block:
  %data = alloca i8**, align 8
  %index = alloca i64, align 8
  %va = alloca { i64, i64, i8** }*, align 8
  store { i64, i64, i8** }* %0, { i64, i64, i8** }** %va, align 8
  store i64 %1, i64* %index, align 4
  %va_variable_load = load { i64, i64, i8** }*, { i64, i64, i8** }** %va, align 8
  %struct_gep = getelementptr inbounds { i64, i64, i8** }, { i64, i64, i8** }* %va_variable_load, i32 0, i32 2
  %b_variable_load = load i8**, i8*** %struct_gep, align 8
  store i8** %b_variable_load, i8*** %data, align 8
  %data_variable_load = load i8**, i8*** %data, align 8
  %index_variable_load = load i64, i64* %index, align 4
  %asm_gep = getelementptr inbounds i8*, i8** %data_variable_load, i64 %index_variable_load
  ret i8** %asm_gep
}
