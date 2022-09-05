; ModuleID = 'linked.c'
source_filename = "linked.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.linked_list_item = type { %struct.linked_list_item*, i8* }

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local void @some() #0 {
  %1 = alloca %struct.linked_list_item, align 8
  %2 = getelementptr inbounds %struct.linked_list_item, %struct.linked_list_item* %1, i32 0, i32 0
  store %struct.linked_list_item* %1, %struct.linked_list_item** %2, align 8
  %3 = bitcast %struct.linked_list_item* %1 to { %struct.linked_list_item*, i8* }*
  %4 = getelementptr inbounds { %struct.linked_list_item*, i8* }, { %struct.linked_list_item*, i8* }* %3, i32 0, i32 0
  %5 = load %struct.linked_list_item*, %struct.linked_list_item** %4, align 8
  %6 = getelementptr inbounds { %struct.linked_list_item*, i8* }, { %struct.linked_list_item*, i8* }* %3, i32 0, i32 1
  %7 = load i8*, i8** %6, align 8
  call void @somefun(%struct.linked_list_item* %5, i8* %7)
  ret void
}

declare void @somefun(%struct.linked_list_item*, i8*) #1

attributes #0 = { noinline nounwind optnone sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 13.0.1"}
