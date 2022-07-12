; ModuleID = './test.silver'
source_filename = "./test.silver"

declare void @putchar(i64)

define void @"="(i64* %0, i64 %1) {
entry_block:
  %b = alloca i64, align 8
  %a = alloca i64*, align 8
  store i64* %0, i64** %a, align 8
  store i64 %1, i64* %b, align 4
  %store_in_load = load i64*, i64** %a, align 8
  %2 = load i64, i64* %b, align 4
  store i64 %2, i64* %store_in_load, align 4
  ret void
}

define void @print(i64* %0) {
entry_block:
  %char = alloca i64*, align 8
  store i64* %0, i64** %char, align 8
  %deref_load = load i64*, i64** %char, align 8
  %deref_load1 = load i64, i64* %deref_load, align 4
  call void @putchar(i64 %deref_load1)
  ret void
}

define i64 @main() {
entry_block:
  %a = alloca i64, align 8
  %K = alloca i64, align 8
  call void @"="(i64* %K, i64 80)
  %deref_load = load i64, i64* %K, align 4
  call void @im_losing_my_mind(i64 %deref_load)
  call void @"="(i64* %a, i64 73)
  call void @print(i64* %a)
  %deref_load1 = load i64, i64* %a, align 4
  call void @putchar(i64 %deref_load1)
  ret i64 0
}

define void @im_losing_my_mind(i64 %0) {
entry_block:
  %somevar = alloca i64, align 8
  store i64 %0, i64* %somevar, align 4
  call void @print(i64* %somevar)
  ret void
}
