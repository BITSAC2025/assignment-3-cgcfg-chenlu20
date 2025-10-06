; ModuleID = 'branch.c'
source_filename = "branch.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx15.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @bar(i32 noundef %0) #0 !dbg !9 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !14, metadata !DIExpression()), !dbg !15
  %3 = load i32, ptr %2, align 4, !dbg !16
  ret i32 %3, !dbg !17
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main() #0 !dbg !18 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !21, metadata !DIExpression()), !dbg !22
  %5 = call i32 @source(), !dbg !23
  store i32 %5, ptr %2, align 4, !dbg !22
  %6 = load i32, ptr %2, align 4, !dbg !24
  %7 = icmp sgt i32 %6, 0, !dbg !26
  br i1 %7, label %8, label %12, !dbg !27

8:                                                ; preds = %0
  call void @llvm.dbg.declare(metadata ptr %3, metadata !28, metadata !DIExpression()), !dbg !30
  %9 = load i32, ptr %2, align 4, !dbg !31
  %10 = call i32 @bar(i32 noundef %9), !dbg !32
  store i32 %10, ptr %3, align 4, !dbg !30
  %11 = load i32, ptr %3, align 4, !dbg !33
  call void @sink(i32 noundef %11), !dbg !34
  br label %16, !dbg !35

12:                                               ; preds = %0
  call void @llvm.dbg.declare(metadata ptr %4, metadata !36, metadata !DIExpression()), !dbg !38
  %13 = load i32, ptr %2, align 4, !dbg !39
  %14 = call i32 @bar(i32 noundef %13), !dbg !40
  store i32 %14, ptr %4, align 4, !dbg !38
  %15 = load i32, ptr %4, align 4, !dbg !41
  call void @sink(i32 noundef %15), !dbg !42
  br label %16

16:                                               ; preds = %12, %8
  ret i32 0, !dbg !43
}

declare i32 @source(...) #2

declare void @sink(i32 noundef) #2

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Homebrew clang version 16.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!1 = !DIFile(filename: "branch.c", directory: "/Users/hululu/Desktop/assignment-3-cgcfg-chenlu20/Assignment-3-CGCFG/Test-Cases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 1}
!8 = !{!"Homebrew clang version 16.0.6"}
!9 = distinct !DISubprogram(name: "bar", scope: !1, file: !1, line: 4, type: !10, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{}
!14 = !DILocalVariable(name: "s", arg: 1, scope: !9, file: !1, line: 4, type: !12)
!15 = !DILocation(line: 4, column: 13, scope: !9)
!16 = !DILocation(line: 5, column: 10, scope: !9)
!17 = !DILocation(line: 5, column: 3, scope: !9)
!18 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 8, type: !19, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!19 = !DISubroutineType(types: !20)
!20 = !{!12}
!21 = !DILocalVariable(name: "a", scope: !18, file: !1, line: 9, type: !12)
!22 = !DILocation(line: 9, column: 7, scope: !18)
!23 = !DILocation(line: 9, column: 11, scope: !18)
!24 = !DILocation(line: 10, column: 7, scope: !25)
!25 = distinct !DILexicalBlock(scope: !18, file: !1, line: 10, column: 7)
!26 = !DILocation(line: 10, column: 9, scope: !25)
!27 = !DILocation(line: 10, column: 7, scope: !18)
!28 = !DILocalVariable(name: "p", scope: !29, file: !1, line: 11, type: !12)
!29 = distinct !DILexicalBlock(scope: !25, file: !1, line: 10, column: 13)
!30 = !DILocation(line: 11, column: 9, scope: !29)
!31 = !DILocation(line: 11, column: 17, scope: !29)
!32 = !DILocation(line: 11, column: 13, scope: !29)
!33 = !DILocation(line: 12, column: 10, scope: !29)
!34 = !DILocation(line: 12, column: 5, scope: !29)
!35 = !DILocation(line: 13, column: 3, scope: !29)
!36 = !DILocalVariable(name: "q", scope: !37, file: !1, line: 14, type: !12)
!37 = distinct !DILexicalBlock(scope: !25, file: !1, line: 13, column: 8)
!38 = !DILocation(line: 14, column: 9, scope: !37)
!39 = !DILocation(line: 14, column: 17, scope: !37)
!40 = !DILocation(line: 14, column: 13, scope: !37)
!41 = !DILocation(line: 15, column: 10, scope: !37)
!42 = !DILocation(line: 15, column: 5, scope: !37)
!43 = !DILocation(line: 17, column: 3, scope: !18)
