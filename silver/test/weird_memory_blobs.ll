; ModuleID = 'weird_memory_blobs.silver'
source_filename = "weird_memory_blobs.silver"

@global_str = private unnamed_addr constant [5 x i8] c"ello\00", align 1

declare void @printf(i8*)

declare void @memcpy(i8*, i8*, i64)

declare i8* @malloc(i64)

define { i8* }* @copy({ i8* } %0) {
entry_block:
  %macro_arg_space = alloca { i8* }*, align 8
  %new = alloca { i8* }*, align 8
  %t = alloca { i8* }, align 8
  store { i8* } %0, { i8* }* %t, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 244, end: 250, rendered-as: \22malloc\22 } })_call" = call i8* @malloc(i64 ptrtoint ({ i8* }* getelementptr ({ i8* }, { i8* }* null, i32 1) to i64))
  %bitcast = bitcast i8* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 244, end: 250, rendered-as: \22malloc\22 } })_call" to { i8* }*
  store { i8* }* %bitcast, { i8* }** %macro_arg_space, align 8
  %b_variable_load = load { i8* }*, { i8* }** %macro_arg_space, align 8
  store { i8* }* %b_variable_load, { i8* }** %new, align 8
  %new_variable_load = load { i8* }*, { i8* }** %new, align 8
  %bitcast1 = bitcast { i8* }* %new_variable_load to i8*
  %bitcast2 = bitcast { i8* }* %t to i8*
  call void @memcpy(i8* %bitcast1, i8* %bitcast2, i64 ptrtoint ({ i8* }* getelementptr ({ i8* }, { i8* }* null, i32 1) to i64))
  %new_variable_load3 = load { i8* }*, { i8* }** %new, align 8
  ret { i8* }* %new_variable_load3
}

define void @main() {
entry_block:
  %macro_arg_space2 = alloca { i8* }*, align 8
  %b = alloca { i8* }*, align 8
  %macro_arg_space = alloca i8*, align 8
  %a = alloca { i8* }, align 8
  %struct_gep = getelementptr inbounds { i8* }, { i8* }* %a, i32 0, i32 0
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @global_str, i32 0, i32 0), i8** %macro_arg_space, align 8
  %b_variable_load = load i8*, i8** %macro_arg_space, align 8
  store i8* %b_variable_load, i8** %struct_gep, align 8
  %struct_gep1 = getelementptr inbounds { i8* }, { i8* }* %a, i32 0, i32 0
  %struct_gep_deref = load i8*, i8** %struct_gep1, align 8
  call void @printf(i8* %struct_gep_deref)
  %a_variable_load = load { i8* }, { i8* }* %a, align 8
  %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 439, end: 443, rendered-as: \22copy\22 } })_call" = call { i8* }* @copy({ i8* } %a_variable_load)
  store { i8* }* %"Named(VariableExpr { name: LexString { lexer: \22...\22, start: 439, end: 443, rendered-as: \22copy\22 } })_call", { i8* }** %macro_arg_space2, align 8
  %b_variable_load3 = load { i8* }*, { i8* }** %macro_arg_space2, align 8
  store { i8* }* %b_variable_load3, { i8* }** %b, align 8
  %b_variable_load4 = load { i8* }*, { i8* }** %b, align 8
  %struct_gep5 = getelementptr inbounds { i8* }, { i8* }* %b_variable_load4, i32 0, i32 0
  %struct_gep_deref6 = load i8*, i8** %struct_gep5, align 8
  call void @printf(i8* %struct_gep_deref6)
  ret void
}
