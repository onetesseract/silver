; ModuleID = 'file_kek'
source_filename = "file_kek"

@const_str_storage = hidden constant [10 x i8] c"\0Apanic!: \00"
@const_str_storage.2 = hidden constant [9 x i8] c"not impl\00"
@const_str_storage.3 = hidden constant [5 x i8] c"meep\00"

declare void @printf(i8*)

declare void @exit(i64)

define void @panic(i8* %msg) {
entry:
  call void @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @const_str_storage, i64 0, i64 0))
  call void @printf(i8* noundef nonnull dereferenceable(1) %msg)
  ret void
}

define void @print({ i8* } %self) {
entry:
  %0 = extractvalue { i8* } %self, 0
  call void @printf(i8* noundef nonnull dereferenceable(1) %0)
  ret void
}

define void @print.1({ i64, i8* } %self) {
entry:
  %self.elt = extractvalue { i64, i8* } %self, 0
  %tmp_int_eq_cmp = icmp eq i64 %self.elt, 0
  br i1 %tmp_int_eq_cmp, label %if_bb, label %else_bb

if_bb:                                            ; preds = %entry
  %self.elt5 = extractvalue { i64, i8* } %self, 1
  %0 = bitcast i8* %self.elt5 to i8**
  %tmp_deref_load.unpack = load i8*, i8** %0, align 8
  %tmp_deref_load7 = insertvalue { i8* } undef, i8* %tmp_deref_load.unpack, 0
  call void @print({ i8* } %tmp_deref_load7)
  br label %ifcond_bb

ifcond_bb:                                        ; preds = %if_bb, %else_bb
  ret void

else_bb:                                          ; preds = %entry
  call void @panic(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @const_str_storage.2, i64 0, i64 0))
  br label %ifcond_bb
}

define void @main(i64 %argc, i8** %argv) {
entry:
  %tmp_reference_variable_storage = alloca { i8* }, align 8
  %0 = getelementptr inbounds { i8* }, { i8* }* %tmp_reference_variable_storage, i64 0, i32 0
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @const_str_storage.3, i64 0, i64 0), i8** %0, align 8
  %tmp_variable_load5.unpack10.cast = bitcast { i8* }* %tmp_reference_variable_storage to i8*
  %tmp_variable_load511 = insertvalue { i64, i8* } { i64 0, i8* undef }, i8* %tmp_variable_load5.unpack10.cast, 1
  call void @print.1({ i64, i8* } %tmp_variable_load511)
  %tmp_variable_load714 = insertvalue { i64, i8* } { i64 1, i8* undef }, i8* %tmp_variable_load5.unpack10.cast, 1
  call void @print.1({ i64, i8* } %tmp_variable_load714)
  ret void
}
