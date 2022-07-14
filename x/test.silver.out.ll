; ModuleID = './test.silver'
source_filename = "./test.silver"

@global_str = private unnamed_addr constant [6 x i8] c"aaaaa\00", align 1

declare void @putchar(i64)

declare void @printf(i8*)

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

define i64 @main() {
entry_block:
  %s = alloca i8*, align 8
  call void @"="(i8** %s, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @global_str, i32 0, i32 0))
  %deref_load = load i8*, i8** %s, align 8
  call void @printf(i8* %deref_load)
  ret i64 0
}
