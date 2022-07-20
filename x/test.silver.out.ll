; ModuleID = './test.silver'
source_filename = "./test.silver"

@global_str = private unnamed_addr constant [12 x i8] c"hello there\00", align 1

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

define void @assign_helper(i8*** %0, i8** %1) {
entry_block:
  %y = alloca i8**, align 8
  %x = alloca i8***, align 8
  store i8*** %0, i8**** %x, align 8
  store i8** %1, i8*** %y, align 8
  %x_variable_load = load i8***, i8**** %x, align 8
  %y_variable_load = load i8**, i8*** %y, align 8
  store i8** %y_variable_load, i8*** %x_variable_load, align 8
  ret void
}

declare void @printf(i8*)

define void @aaaa({ i8* }* %0) {
entry_block:
  %wra = alloca { i8* }*, align 8
  store { i8* }* %0, { i8* }** %wra, align 8
  %wra_variable_load = load { i8* }*, { i8* }** %wra, align 8
  %struct_gep = getelementptr inbounds { i8* }, { i8* }* %wra_variable_load, i32 0, i32 0
  %struct_gep_deref = load i8*, i8** %struct_gep, align 8
  call void @printf(i8* %struct_gep_deref)
  ret void
}

declare void @putchar(i8)

declare void @exit(i8)

define i8 @main() {
entry_block:
  %a1 = alloca i8**, align 8
  %wra = alloca { i8* }, align 8
  %a = alloca i8**, align 8
  %macro_arg_space = alloca i8*, align 8
  %x = alloca i8*, align 8
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @global_str, i32 0, i32 0), i8** %macro_arg_space, align 8
  call void @assign_helper(i8*** %a, i8** %x)
  %a_variable_load = load i8**, i8*** %a, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %a_variable_load, align 8
  %x_variable_load = load i8*, i8** %x, align 8
  call void @printf(i8* %x_variable_load)
  %struct_gep = getelementptr inbounds { i8* }, { i8* }* %wra, i32 0, i32 0
  call void @assign_helper(i8*** %a1, i8** %struct_gep)
  %a_variable_load2 = load i8**, i8*** %a1, align 8
  %b_variable_load3 = load i8*, i8** %x, align 8
  store i8* %b_variable_load3, i8** %a_variable_load2, align 8
  %struct_gep4 = getelementptr inbounds { i8* }, { i8* }* %wra, i32 0, i32 0
  %struct_gep_deref = load i8*, i8** %struct_gep4, align 8
  call void @printf(i8* %struct_gep_deref)
  call void @exit(i8 16)
  ret i8 16
}
