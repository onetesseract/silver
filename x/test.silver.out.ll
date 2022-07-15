; ModuleID = './test.silver'
source_filename = "./test.silver"

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
  %deref_load = load i8*, i8** %s, align 8
  call void @template_fn(i8* %deref_load)
  %deref_load1 = load i8*, i8** %s, align 8
  call void @template_fn(i8* %deref_load1)
  ret i64 0
}

define void @template_fn(i8* %0) {
entry_block:
  %a = alloca i8*, align 8
  store i8* %0, i8** %a, align 8
  ret void
}
