; ModuleID = './array.silver'
source_filename = "./array.silver"

define void @"="(i8** %0, i8* %1) {
entry_block:
  %b = alloca i8*, align 8
  %a = alloca i8**, align 8
  store i8** %0, i8*** %a, align 8
  store i8* %1, i8** %b, align 8
  %store_in_load = load i8**, i8*** %a, align 8
  %2 = load i8*, i8** %b, align 8
  store i8* %2, i8** %store_in_load, align 8
  ret void
}

define void @"=.1"(i8* %0, i8 %1) {
entry_block:
  %b = alloca i8, align 1
  %a = alloca i8*, align 8
  store i8* %0, i8** %a, align 8
  store i8 %1, i8* %b, align 1
  %store_in_load = load i8*, i8** %a, align 8
  %2 = load i8, i8* %b, align 1
  store i8 %2, i8* %store_in_load, align 1
  ret void
}

define void @"=.2"(i64** %0, i64* %1) {
entry_block:
  %b = alloca i64*, align 8
  %a = alloca i64**, align 8
  store i64** %0, i64*** %a, align 8
  store i64* %1, i64** %b, align 8
  %store_in_load = load i64**, i64*** %a, align 8
  %2 = load i64*, i64** %b, align 8
  store i64* %2, i64** %store_in_load, align 8
  ret void
}

define i1 @"=="(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %tmp_load = load i64, i64* %a, align 4
  %tmp_load1 = load i64, i64* %b, align 4
  %asm_int_cmp_eq = icmp eq i64 %tmp_load, %tmp_load1
  ret i1 %asm_int_cmp_eq
}

define i64 @"+"(i64 %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64, align 8
  store i64 %0, i64* %a, align 4
  store i64 %1, i64* %b, align 4
  %tmp_load = load i64, i64* %a, align 4
  %tmp_load1 = load i64, i64* %b, align 4
  %asm_int_add = add i64 %tmp_load, %tmp_load1
  ret i64 %asm_int_add
}

define i8* @get(i8* %0, i64 %1) {
entry_block:
  %index = alloca i64, align 8
  %array = alloca i8*, align 8
  store i8* %0, i8** %array, align 8
  store i64 %1, i64* %index, align 4
  %bitcast = bitcast i8** %array to i64
  %deref_load = load i64, i64* %index, align 4
  %"+_call" = call i64 @"+"(i64 %bitcast, i64 %deref_load)
  %bitcast1 = bitcast i64 %"+_call" to i8*
  ret i8* %bitcast1
}
