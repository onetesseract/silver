; ModuleID = './test.silver'
source_filename = "./test.silver"

@global_str = private unnamed_addr constant [5 x i8] c"ello\00", align 1

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

define void @"=.2"(i64** %0, i64* %1) {
entry_block:
  %b = alloca i64*, align 8
  %a = alloca i64**, align 8
  store i64** %0, i64*** %a, align 8
  store i64* %1, i64** %b, align 8
  %a_variable_load = load i64**, i64*** %a, align 8
  %b_variable_load = load i64*, i64** %b, align 8
  store i64* %b_variable_load, i64** %a_variable_load, align 8
  ret void
}

define void @"=.3"(i64* %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64*, align 8
  store i64* %0, i64** %a, align 8
  store i64 %1, i64* %b, align 4
  %a_variable_load = load i64*, i64** %a, align 8
  %b_variable_load = load i64, i64* %b, align 4
  store i64 %b_variable_load, i64* %a_variable_load, align 4
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

declare void @printf(i8*)

declare void @putchar(i8)

define i64 @main() {
entry_block:
  %deref_space = alloca i8*, align 8
  %string = alloca { i8*, i64 }, align 8
  %struct_gep = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %string, i32 0, i32 0
  %struct_gep_deref = load i8*, i8** %struct_gep, align 8
  store i8* %struct_gep_deref, i8** %deref_space, align 8
  call void @"="(i8** %deref_space, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @global_str, i32 0, i32 0))
  %struct_gep1 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %string, i32 0, i32 0
  %struct_gep_deref2 = load i8*, i8** %struct_gep1, align 8
  call void @printf(i8* %struct_gep_deref2)
  ret i64 0
}
