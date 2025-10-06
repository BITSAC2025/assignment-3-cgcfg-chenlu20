; ModuleID = 'loop.c'
source_filename = "loop.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx15.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main() #0 !dbg !9 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 0, ptr %2, align 4, !dbg !15
  br label %3, !dbg !16

3:                                                ; preds = %6, %0
  %4 = load i32, ptr %2, align 4, !dbg !17
  %5 = icmp slt i32 %4, 100, !dbg !18
  br i1 %5, label %6, label %9, !dbg !16

6:                                                ; preds = %3
  %7 = load i32, ptr %2, align 4, !dbg !19
  %8 = add nsw i32 %7, 1, !dbg !19
  store i32 %8, ptr %2, align 4, !dbg !19
  br label %3, !dbg !16, !llvm.loop !20

9:                                                ; preds = %3
  ret i32 0, !dbg !22
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Homebrew clang version 16.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!1 = !DIFile(filename: "loop.c", directory: "/Users/hululu/Desktop/assignment-3-cgcfg-chenlu20/Assignment-3-CGCFG/Test-Cases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 1}
!8 = !{!"Homebrew clang version 16.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 1, type: !10, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{}
!14 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 2, type: !12)
!15 = !DILocation(line: 2, column: 7, scope: !9)
!16 = !DILocation(line: 3, column: 3, scope: !9)
!17 = !DILocation(line: 3, column: 10, scope: !9)
!18 = !DILocation(line: 3, column: 12, scope: !9)
!19 = !DILocation(line: 4, column: 5, scope: !9)
!20 = distinct !{!20, !16, !19, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = !DILocation(line: 5, column: 3, scope: !9)
