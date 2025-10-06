; ModuleID = 'multi-call.c'
source_filename = "multi-call.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx15.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @inc(i32 noundef %0) #0 !dbg !9 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !14, metadata !DIExpression()), !dbg !15
  %3 = load i32, ptr %2, align 4, !dbg !16
  %4 = add nsw i32 %3, 1, !dbg !16
  store i32 %4, ptr %2, align 4, !dbg !16
  ret i32 %3, !dbg !17
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main() #0 !dbg !18 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !21, metadata !DIExpression()), !dbg !22
  %4 = call i32 @inc(i32 noundef 10), !dbg !23
  store i32 %4, ptr %2, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata ptr %3, metadata !24, metadata !DIExpression()), !dbg !25
  %5 = call i32 @inc(i32 noundef 100), !dbg !26
  store i32 %5, ptr %3, align 4, !dbg !25
  ret i32 0, !dbg !27
}

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Homebrew clang version 16.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!1 = !DIFile(filename: "multi-call.c", directory: "/Users/hululu/Desktop/assignment-3-cgcfg-chenlu20/Assignment-3-CGCFG/Test-Cases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 1}
!8 = !{!"Homebrew clang version 16.0.6"}
!9 = distinct !DISubprogram(name: "inc", scope: !1, file: !1, line: 1, type: !10, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{}
!14 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !1, line: 1, type: !12)
!15 = !DILocation(line: 1, column: 13, scope: !9)
!16 = !DILocation(line: 2, column: 10, scope: !9)
!17 = !DILocation(line: 2, column: 2, scope: !9)
!18 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !19, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!19 = !DISubroutineType(types: !20)
!20 = !{!12}
!21 = !DILocalVariable(name: "a", scope: !18, file: !1, line: 6, type: !12)
!22 = !DILocation(line: 6, column: 6, scope: !18)
!23 = !DILocation(line: 6, column: 10, scope: !18)
!24 = !DILocalVariable(name: "b", scope: !18, file: !1, line: 7, type: !12)
!25 = !DILocation(line: 7, column: 6, scope: !18)
!26 = !DILocation(line: 7, column: 10, scope: !18)
!27 = !DILocation(line: 8, column: 2, scope: !18)
