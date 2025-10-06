; ModuleID = 'buffer.c'
source_filename = "buffer.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx15.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define ptr @create_buffer(i32 noundef %0, i32 noundef %1) #0 !dbg !9 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata ptr %5, metadata !19, metadata !DIExpression()), !dbg !20
  %7 = load i32, ptr %3, align 4, !dbg !21
  %8 = sext i32 %7 to i64, !dbg !21
  %9 = mul i64 %8, 4, !dbg !22
  %10 = call ptr @malloc(i64 noundef %9) #4, !dbg !23
  store ptr %10, ptr %5, align 8, !dbg !20
  %11 = load i32, ptr %4, align 4, !dbg !24
  %12 = icmp ne i32 %11, 0, !dbg !24
  br i1 %12, label %13, label %28, !dbg !26

13:                                               ; preds = %2
  call void @llvm.dbg.declare(metadata ptr %6, metadata !27, metadata !DIExpression()), !dbg !30
  store i32 0, ptr %6, align 4, !dbg !30
  br label %14, !dbg !31

14:                                               ; preds = %24, %13
  %15 = load i32, ptr %6, align 4, !dbg !32
  %16 = load i32, ptr %3, align 4, !dbg !34
  %17 = icmp slt i32 %15, %16, !dbg !35
  br i1 %17, label %18, label %27, !dbg !36

18:                                               ; preds = %14
  %19 = load i32, ptr %6, align 4, !dbg !37
  %20 = load ptr, ptr %5, align 8, !dbg !39
  %21 = load i32, ptr %6, align 4, !dbg !40
  %22 = sext i32 %21 to i64, !dbg !39
  %23 = getelementptr inbounds i32, ptr %20, i64 %22, !dbg !39
  store i32 %19, ptr %23, align 4, !dbg !41
  br label %24, !dbg !42

24:                                               ; preds = %18
  %25 = load i32, ptr %6, align 4, !dbg !43
  %26 = add nsw i32 %25, 1, !dbg !43
  store i32 %26, ptr %6, align 4, !dbg !43
  br label %14, !dbg !44, !llvm.loop !45

27:                                               ; preds = %14
  br label %28, !dbg !48

28:                                               ; preds = %27, %2
  %29 = load ptr, ptr %5, align 8, !dbg !49
  ret ptr %29, !dbg !50
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @main() #0 !dbg !51 {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  call void @llvm.dbg.declare(metadata ptr %1, metadata !54, metadata !DIExpression()), !dbg !55
  %3 = call ptr @create_buffer(i32 noundef 10, i32 noundef 1), !dbg !56
  store ptr %3, ptr %1, align 8, !dbg !55
  call void @llvm.dbg.declare(metadata ptr %2, metadata !57, metadata !DIExpression()), !dbg !58
  %4 = call ptr @create_buffer(i32 noundef 10, i32 noundef 0), !dbg !59
  store ptr %4, ptr %2, align 8, !dbg !58
  %5 = load ptr, ptr %1, align 8, !dbg !60
  call void @free(ptr noundef %5), !dbg !61
  %6 = load ptr, ptr %2, align 8, !dbg !62
  call void @free(ptr noundef %6), !dbg !63
  ret void, !dbg !64
}

declare void @free(ptr noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+crypto,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+sm4,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { allocsize(0) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Homebrew clang version 16.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!1 = !DIFile(filename: "buffer.c", directory: "/Users/hululu/Desktop/assignment-3-cgcfg-chenlu20/Assignment-3-CGCFG/Test-Cases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 1}
!8 = !{!"Homebrew clang version 16.0.6"}
!9 = distinct !DISubprogram(name: "create_buffer", scope: !1, file: !1, line: 3, type: !10, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !13, !13}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "size", arg: 1, scope: !9, file: !1, line: 3, type: !13)
!16 = !DILocation(line: 3, column: 24, scope: !9)
!17 = !DILocalVariable(name: "initialize", arg: 2, scope: !9, file: !1, line: 3, type: !13)
!18 = !DILocation(line: 3, column: 34, scope: !9)
!19 = !DILocalVariable(name: "buf", scope: !9, file: !1, line: 4, type: !12)
!20 = !DILocation(line: 4, column: 10, scope: !9)
!21 = !DILocation(line: 4, column: 23, scope: !9)
!22 = !DILocation(line: 4, column: 28, scope: !9)
!23 = !DILocation(line: 4, column: 16, scope: !9)
!24 = !DILocation(line: 5, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !9, file: !1, line: 5, column: 9)
!26 = !DILocation(line: 5, column: 9, scope: !9)
!27 = !DILocalVariable(name: "i", scope: !28, file: !1, line: 6, type: !13)
!28 = distinct !DILexicalBlock(scope: !29, file: !1, line: 6, column: 9)
!29 = distinct !DILexicalBlock(scope: !25, file: !1, line: 5, column: 21)
!30 = !DILocation(line: 6, column: 18, scope: !28)
!31 = !DILocation(line: 6, column: 14, scope: !28)
!32 = !DILocation(line: 6, column: 25, scope: !33)
!33 = distinct !DILexicalBlock(scope: !28, file: !1, line: 6, column: 9)
!34 = !DILocation(line: 6, column: 29, scope: !33)
!35 = !DILocation(line: 6, column: 27, scope: !33)
!36 = !DILocation(line: 6, column: 9, scope: !28)
!37 = !DILocation(line: 7, column: 22, scope: !38)
!38 = distinct !DILexicalBlock(scope: !33, file: !1, line: 6, column: 40)
!39 = !DILocation(line: 7, column: 13, scope: !38)
!40 = !DILocation(line: 7, column: 17, scope: !38)
!41 = !DILocation(line: 7, column: 20, scope: !38)
!42 = !DILocation(line: 8, column: 9, scope: !38)
!43 = !DILocation(line: 6, column: 36, scope: !33)
!44 = !DILocation(line: 6, column: 9, scope: !33)
!45 = distinct !{!45, !36, !46, !47}
!46 = !DILocation(line: 8, column: 9, scope: !28)
!47 = !{!"llvm.loop.mustprogress"}
!48 = !DILocation(line: 9, column: 5, scope: !29)
!49 = !DILocation(line: 10, column: 12, scope: !9)
!50 = !DILocation(line: 10, column: 5, scope: !9)
!51 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 13, type: !52, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!52 = !DISubroutineType(types: !53)
!53 = !{null}
!54 = !DILocalVariable(name: "buf1", scope: !51, file: !1, line: 14, type: !12)
!55 = !DILocation(line: 14, column: 10, scope: !51)
!56 = !DILocation(line: 14, column: 17, scope: !51)
!57 = !DILocalVariable(name: "buf2", scope: !51, file: !1, line: 15, type: !12)
!58 = !DILocation(line: 15, column: 10, scope: !51)
!59 = !DILocation(line: 15, column: 17, scope: !51)
!60 = !DILocation(line: 17, column: 7, scope: !51)
!61 = !DILocation(line: 17, column: 2, scope: !51)
!62 = !DILocation(line: 18, column: 7, scope: !51)
!63 = !DILocation(line: 18, column: 2, scope: !51)
!64 = !DILocation(line: 19, column: 1, scope: !51)
