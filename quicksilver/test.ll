; ModuleID = 'file_kek'
source_filename = "file_kek"

@const_str_storage = hidden constant [14 x i8] c"not impl kekw\00"
@const_str_storage.1 = hidden constant [3 x i8] c"ee\00"

declare void @"PtrI//printf"(i8*)

define void @"PtrStruct(PtrI)PtrStruct(PtrI)//="({ i8* }* %self, { i8* }* %other) {
entry:
  call void @"PtrI//printf"(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @const_str_storage, i64 0, i64 0))
  ret void
}

define i64 @"IPtrPtrI//main"(i64 %argc, i8** %argv) {
entry:
  call void @"PtrI//printf"(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @const_str_storage.1, i64 0, i64 0))
  ret i64 0
}
