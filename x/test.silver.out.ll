; ModuleID = './test.silver'
source_filename = "./test.silver"

@global_str = private unnamed_addr constant [10 x i8] c"Problem: \00", align 1
@global_str.2 = private unnamed_addr constant [16 x i8] c"Suffix called: \00", align 1
@global_str.3 = private unnamed_addr constant [3 x i8] c"C!\00", align 1
@global_str.4 = private unnamed_addr constant [6 x i8] c"eefee\00", align 1
@global_str.5 = private unnamed_addr constant [4 x i8] c"aaa\00", align 1
@global_str.6 = private unnamed_addr constant [3 x i8] c"aa\00", align 1

define void @"="(i8** %0, i8* %1) {
entry_block:
  %b = alloca i8*, align 8
  %a = alloca i8**, align 8
  store i8** %0, i8*** %a, align 8
  store i8* %1, i8** %b, align 8
  %a_variable_load = load i8**, i8*** %a, align 8
  %b_variable_load = load i8*, i8** %b, align 8
  store i8* %b_variable_load, i8** %a_variable_load, align 8
  ret void
}

define void @"=.1"(i8* %0, i8 %1) {
entry_block:
  %b = alloca i8, align 1
  %a = alloca i8*, align 8
  store i8* %0, i8** %a, align 8
  store i8 %1, i8* %b, align 1
  %a_variable_load = load i8*, i8** %a, align 8
  %b_variable_load = load i8, i8* %b, align 1
  store i8 %b_variable_load, i8* %a_variable_load, align 1
  ret void
}

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

declare void @printf(i8*)

declare void @putchar(i8)

declare void @exit(i64)

define void @"brackets-[[-]]"(i8* %0, i8* %1) {
entry_block:
  %other = alloca i8*, align 8
  %string = alloca i8*, align 8
  store i8* %0, i8** %string, align 8
  store i8* %1, i8** %other, align 8
  %string_variable_load = load i8*, i8** %string, align 8
  call void @printf(i8* %string_variable_load)
  %other_variable_load = load i8*, i8** %other, align 8
  call void @printf(i8* %other_variable_load)
  ret void
}

define i8* @"brackets-[-]"(i8* %0, i64 %1) {
entry_block:
  %index = alloca i64, align 8
  %string = alloca i8*, align 8
  store i8* %0, i8** %string, align 8
  store i64 %1, i64* %index, align 4
  %string_variable_load = load i8*, i8** %string, align 8
  %index_variable_load = load i64, i64* %index, align 4
  %asm_gep = getelementptr i8, i8* %string_variable_load, i64 %index_variable_load
  ret i8* %asm_gep
}

define void @throw(i8* %0) {
entry_block:
  %err = alloca i8*, align 8
  store i8* %0, i8** %err, align 8
  call void @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @global_str, i32 0, i32 0))
  %err_variable_load = load i8*, i8** %err, align 8
  call void @printf(i8* %err_variable_load)
  call void @exit(i64 1)
  ret void
}

define void @test_suffix(i8* %0) {
entry_block:
  %something = alloca i8*, align 8
  store i8* %0, i8** %something, align 8
  call void @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @global_str.2, i32 0, i32 0))
  %something_variable_load = load i8*, i8** %something, align 8
  call void @printf(i8* %something_variable_load)
  ret void
}

define i64 @test_enum(i64 %0) {
entry_block:
  %enum = alloca i64, align 8
  store i64 %0, i64* %enum, align 4
  %enum_variable_load = load i64, i64* %enum, align 4
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 662, end: 664, rendered-as: \22==\22 } })_call" = call i1 @"=="(i64 %enum_variable_load, i64 2)
  br i1 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 662, end: 664, rendered-as: \22==\22 } })_call", label %if_then_block, label %if_cont_block

if_then_block:                                    ; preds = %entry_block
  call void @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @global_str.3, i32 0, i32 0))
  br label %if_cont_block

if_cont_block:                                    ; preds = %if_then_block, %entry_block
  ret i64 1
}

define i64 @main() {
entry_block:
  %str = alloca i8*, align 8
  call void @"="(i8** %str, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @global_str.4, i32 0, i32 0))
  %str_variable_load = load i8*, i8** %str, align 8
  call void @"brackets-[[-]]"(i8* %str_variable_load, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @global_str.5, i32 0, i32 0))
  %str_variable_load1 = load i8*, i8** %str, align 8
  %"Brackets(LexString { lexer: \22...\22, start: 896, end: 897, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 898, end: 899, rendered-as: \22]\22 })_call" = call i8* @"brackets-[-]"(i8* %str_variable_load1, i64 2)
  %deref_load = load i8, i8* %"Brackets(LexString { lexer: \22...\22, start: 896, end: 897, rendered-as: \22[\22 }, LexString { lexer: \22...\22, start: 898, end: 899, rendered-as: \22]\22 })_call", align 1
  call void @putchar(i8 %deref_load)
  call void @test_suffix(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @global_str.6, i32 0, i32 0))
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 1040, end: 1049, rendered-as: \22test_enum\22 } })_call" = call i64 @test_enum(i64 2)
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 1030, end: 1039, rendered-as: \22test_enum\22 } })_call" = call i64 @test_enum(i64 %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 1040, end: 1049, rendered-as: \22test_enum\22 } })_call")
  ret i64 0
}
