; ModuleID = 'huffman.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:64:128-a0:0:64-n32"
target triple = "armv7-none-linux-gnueabi"

define void @BZ2_hbMakeCodeLengths(i8* nocapture %len, i32* nocapture %freq, i32 %alphaSize, i32 %maxLen) nounwind {
entry:
  %heap = alloca [260 x i32], align 4
  %weight = alloca [516 x i32], align 4
  %parent = alloca [516 x i32], align 4
  call void @llvm.dbg.value(metadata !{i8* %len}, i64 0, metadata !39), !dbg !76
  call void @llvm.dbg.value(metadata !{i32* %freq}, i64 0, metadata !40), !dbg !77
  call void @llvm.dbg.value(metadata !{i32 %alphaSize}, i64 0, metadata !41), !dbg !78
  call void @llvm.dbg.value(metadata !{i32 %maxLen}, i64 0, metadata !42), !dbg !79
  call void @llvm.dbg.declare(metadata !{[260 x i32]* %heap}, metadata !53), !dbg !80
  call void @llvm.dbg.declare(metadata !{[516 x i32]* %weight}, metadata !57), !dbg !81
  call void @llvm.dbg.declare(metadata !{[516 x i32]* %parent}, metadata !61), !dbg !82
  call void @llvm.dbg.value(metadata !83, i64 0, metadata !48), !dbg !84
  %0 = icmp sgt i32 %alphaSize, 0, !dbg !84
  br i1 %0, label %bb, label %bb5.preheader, !dbg !84

bb:                                               ; preds = %entry, %bb
  %i.071 = phi i32 [ %tmp107, %bb ], [ 0, %entry ]
  %scevgep106 = getelementptr i32* %freq, i32 %i.071
  %tmp107 = add i32 %i.071, 1
  %scevgep108 = getelementptr [516 x i32]* %weight, i32 0, i32 %tmp107
  %1 = load i32* %scevgep106, align 4, !dbg !85
  %2 = shl i32 %1, 8, !dbg !85
  %3 = icmp eq i32 %1, 0, !dbg !85
  %.56 = select i1 %3, i32 256, i32 %2
  store i32 %.56, i32* %scevgep108, align 4, !dbg !85
  %exitcond105 = icmp eq i32 %tmp107, %alphaSize
  br i1 %exitcond105, label %bb5.preheader, label %bb, !dbg !84

bb5.preheader:                                    ; preds = %bb, %entry
  %4 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 0, !dbg !86
  %5 = getelementptr inbounds [516 x i32]* %weight, i32 0, i32 0, !dbg !87
  %6 = getelementptr inbounds [516 x i32]* %parent, i32 0, i32 0, !dbg !88
  %7 = icmp slt i32 %alphaSize, 1, !dbg !89
  %8 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 1, !dbg !90
  %tmp = add i32 %alphaSize, -1
  %tmp81 = add i32 %alphaSize, 1
  br label %bb5

bb5:                                              ; preds = %bb52, %bb5.preheader
  store i32 0, i32* %4, align 4, !dbg !86
  store i32 0, i32* %5, align 4, !dbg !87
  store i32 -2, i32* %6, align 4, !dbg !88
  br i1 %7, label %return, label %bb6, !dbg !89

bb6:                                              ; preds = %bb5, %bb9
  %nHeap.058 = phi i32 [ %i.157, %bb9 ], [ 0, %bb5 ]
  %i.157 = add i32 %nHeap.058, 1
  %scevgep = getelementptr [260 x i32]* %heap, i32 0, i32 %i.157
  %scevgep74 = getelementptr [516 x i32]* %parent, i32 0, i32 %i.157
  %scevgep75 = getelementptr [516 x i32]* %weight, i32 0, i32 %i.157
  store i32 -1, i32* %scevgep74, align 4, !dbg !91
  store i32 %i.157, i32* %scevgep, align 4, !dbg !92
  %9 = load i32* %scevgep75, align 4, !dbg !93
  %10 = ashr i32 %i.157, 1, !dbg !93
  %11 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 %10, !dbg !93
  %12 = load i32* %11, align 4, !dbg !93
  %13 = getelementptr inbounds [516 x i32]* %weight, i32 0, i32 %12, !dbg !93
  %14 = load i32* %13, align 4, !dbg !93
  %15 = icmp slt i32 %9, %14, !dbg !93
  br i1 %15, label %bb7, label %bb9, !dbg !93

bb7:                                              ; preds = %bb6, %bb7
  %16 = phi i32* [ %25, %bb7 ], [ %scevgep, %bb6 ]
  %17 = phi i32 [ %21, %bb7 ], [ %12, %bb6 ]
  %18 = phi i32 [ %19, %bb7 ], [ %10, %bb6 ]
  store i32 %17, i32* %16, align 4, !dbg !93
  %19 = ashr i32 %18, 1, !dbg !93
  %20 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 %19, !dbg !93
  %21 = load i32* %20, align 4, !dbg !93
  %22 = getelementptr inbounds [516 x i32]* %weight, i32 0, i32 %21, !dbg !93
  %23 = load i32* %22, align 4, !dbg !93
  %24 = icmp slt i32 %9, %23, !dbg !93
  %25 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 %18, !dbg !93
  br i1 %24, label %bb7, label %bb9, !dbg !93

bb9:                                              ; preds = %bb7, %bb6
  %.lcssa = phi i32* [ %scevgep, %bb6 ], [ %25, %bb7 ]
  store i32 %i.157, i32* %.lcssa, align 4, !dbg !93
  %exitcond = icmp eq i32 %i.157, %alphaSize
  br i1 %exitcond, label %bb11, label %bb6, !dbg !89

bb11:                                             ; preds = %bb9
  %26 = icmp sgt i32 %alphaSize, 259, !dbg !94
  br i1 %26, label %bb39.preheader.thread, label %bb39.preheader, !dbg !94

bb39.preheader.thread:                            ; preds = %bb11
  call void @BZ2_bz__AssertH__fail(i32 2001) nounwind, !dbg !94
  br label %bb13.lr.ph

bb39.preheader:                                   ; preds = %bb11
  %27 = icmp sgt i32 %alphaSize, 1, !dbg !95
  br i1 %27, label %bb13.lr.ph, label %bb40, !dbg !95

bb13.lr.ph:                                       ; preds = %bb39.preheader.thread, %bb39.preheader
  %tmp79 = add i32 %alphaSize, -1
  %tmp90 = add i32 %alphaSize, -2
  br label %bb13

bb13:                                             ; preds = %bb38, %bb13.lr.ph
  %indvar = phi i32 [ 0, %bb13.lr.ph ], [ %indvar.next, %bb38 ]
  %tmp82 = add i32 %tmp81, %indvar
  %scevgep83 = getelementptr [516 x i32]* %parent, i32 0, i32 %tmp82
  %scevgep84 = getelementptr [516 x i32]* %weight, i32 0, i32 %tmp82
  %tmp86 = sub i32 %alphaSize, %indvar
  %scevgep87 = getelementptr [260 x i32]* %heap, i32 0, i32 %tmp86
  %tmp88 = sub i32 %tmp79, %indvar
  %scevgep89 = getelementptr [260 x i32]* %heap, i32 0, i32 %tmp88
  %tmp91 = sub i32 %tmp90, %indvar
  %28 = load i32* %8, align 4, !dbg !90
  %29 = load i32* %scevgep87, align 4, !dbg !90
  store i32 %29, i32* %8, align 4, !dbg !90
  %30 = getelementptr inbounds [516 x i32]* %weight, i32 0, i32 %29, !dbg !96
  br label %bb16, !dbg !90

bb16:                                             ; preds = %bb21, %bb13
  %zz14.0 = phi i32 [ 1, %bb13 ], [ %yy.0, %bb21 ]
  %31 = shl i32 %zz14.0, 1, !dbg !96
  %32 = icmp sgt i32 %31, %tmp88, !dbg !96
  br i1 %32, label %bb22, label %bb17, !dbg !96

bb17:                                             ; preds = %bb16
  %33 = icmp slt i32 %31, %tmp88, !dbg !96
  br i1 %33, label %bb18, label %bb20, !dbg !96

bb18:                                             ; preds = %bb17
  %34 = or i32 %31, 1
  %35 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 %34, !dbg !96
  %36 = load i32* %35, align 4, !dbg !96
  %37 = getelementptr inbounds [516 x i32]* %weight, i32 0, i32 %36, !dbg !96
  %38 = load i32* %37, align 4, !dbg !96
  %39 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 %31, !dbg !96
  %40 = load i32* %39, align 4, !dbg !96
  %41 = getelementptr inbounds [516 x i32]* %weight, i32 0, i32 %40, !dbg !96
  %42 = load i32* %41, align 4, !dbg !96
  %43 = icmp slt i32 %38, %42, !dbg !96
  %. = select i1 %43, i32 %34, i32 %31
  br label %bb20

bb20:                                             ; preds = %bb17, %bb18
  %yy.0 = phi i32 [ %., %bb18 ], [ %31, %bb17 ]
  %44 = load i32* %30, align 4, !dbg !96
  %45 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 %yy.0, !dbg !96
  %46 = load i32* %45, align 4, !dbg !96
  %47 = getelementptr inbounds [516 x i32]* %weight, i32 0, i32 %46, !dbg !96
  %48 = load i32* %47, align 4, !dbg !96
  %49 = icmp slt i32 %44, %48, !dbg !96
  br i1 %49, label %bb22, label %bb21, !dbg !96

bb21:                                             ; preds = %bb20
  %50 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 %zz14.0, !dbg !96
  store i32 %46, i32* %50, align 4, !dbg !96
  br label %bb16, !dbg !96

bb22:                                             ; preds = %bb20, %bb16
  %51 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 %zz14.0, !dbg !96
  store i32 %29, i32* %51, align 4, !dbg !96
  %52 = load i32* %8, align 4, !dbg !97
  %53 = load i32* %scevgep89, align 4, !dbg !97
  store i32 %53, i32* %8, align 4, !dbg !97
  %54 = getelementptr inbounds [516 x i32]* %weight, i32 0, i32 %53, !dbg !98
  br label %bb26, !dbg !97

bb26:                                             ; preds = %bb31, %bb22
  %zz23.0 = phi i32 [ 1, %bb22 ], [ %yy24.0, %bb31 ]
  %55 = shl i32 %zz23.0, 1, !dbg !98
  %56 = icmp sgt i32 %55, %tmp91, !dbg !98
  br i1 %56, label %bb32, label %bb27, !dbg !98

bb27:                                             ; preds = %bb26
  %57 = icmp slt i32 %55, %tmp91, !dbg !98
  br i1 %57, label %bb28, label %bb30, !dbg !98

bb28:                                             ; preds = %bb27
  %58 = or i32 %55, 1
  %59 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 %58, !dbg !98
  %60 = load i32* %59, align 4, !dbg !98
  %61 = getelementptr inbounds [516 x i32]* %weight, i32 0, i32 %60, !dbg !98
  %62 = load i32* %61, align 4, !dbg !98
  %63 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 %55, !dbg !98
  %64 = load i32* %63, align 4, !dbg !98
  %65 = getelementptr inbounds [516 x i32]* %weight, i32 0, i32 %64, !dbg !98
  %66 = load i32* %65, align 4, !dbg !98
  %67 = icmp slt i32 %62, %66, !dbg !98
  %.55 = select i1 %67, i32 %58, i32 %55
  br label %bb30

bb30:                                             ; preds = %bb27, %bb28
  %yy24.0 = phi i32 [ %.55, %bb28 ], [ %55, %bb27 ]
  %68 = load i32* %54, align 4, !dbg !98
  %69 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 %yy24.0, !dbg !98
  %70 = load i32* %69, align 4, !dbg !98
  %71 = getelementptr inbounds [516 x i32]* %weight, i32 0, i32 %70, !dbg !98
  %72 = load i32* %71, align 4, !dbg !98
  %73 = icmp slt i32 %68, %72, !dbg !98
  br i1 %73, label %bb32, label %bb31, !dbg !98

bb31:                                             ; preds = %bb30
  %74 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 %zz23.0, !dbg !98
  store i32 %70, i32* %74, align 4, !dbg !98
  br label %bb26, !dbg !98

bb32:                                             ; preds = %bb30, %bb26
  %75 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 %zz23.0, !dbg !98
  store i32 %53, i32* %75, align 4, !dbg !98
  %76 = getelementptr inbounds [516 x i32]* %parent, i32 0, i32 %52, !dbg !99
  store i32 %tmp82, i32* %76, align 4, !dbg !99
  %77 = getelementptr inbounds [516 x i32]* %parent, i32 0, i32 %28, !dbg !99
  store i32 %tmp82, i32* %77, align 4, !dbg !99
  %78 = getelementptr inbounds [516 x i32]* %weight, i32 0, i32 %28, !dbg !100
  %79 = load i32* %78, align 4, !dbg !100
  %80 = and i32 %79, -256, !dbg !100
  %81 = getelementptr inbounds [516 x i32]* %weight, i32 0, i32 %52, !dbg !100
  %82 = load i32* %81, align 4, !dbg !100
  %83 = and i32 %82, -256, !dbg !100
  %84 = add i32 %83, %80, !dbg !100
  %85 = and i32 %82, 255, !dbg !100
  %86 = and i32 %79, 255, !dbg !100
  %87 = icmp uge i32 %85, %86
  %max = select i1 %87, i32 %85, i32 %86, !dbg !100
  %88 = add nsw i32 %max, 1, !dbg !100
  %89 = or i32 %88, %84, !dbg !100
  store i32 %89, i32* %scevgep84, align 4, !dbg !100
  store i32 -1, i32* %scevgep83, align 4, !dbg !101
  store i32 %tmp82, i32* %scevgep89, align 4, !dbg !102
  %90 = ashr i32 %tmp88, 1, !dbg !103
  %91 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 %90, !dbg !103
  %92 = load i32* %91, align 4, !dbg !103
  %93 = getelementptr inbounds [516 x i32]* %weight, i32 0, i32 %92, !dbg !103
  %94 = load i32* %93, align 4, !dbg !103
  %95 = icmp slt i32 %89, %94, !dbg !103
  br i1 %95, label %bb36, label %bb38, !dbg !103

bb36:                                             ; preds = %bb32, %bb36
  %96 = phi i32* [ %105, %bb36 ], [ %scevgep89, %bb32 ]
  %97 = phi i32 [ %101, %bb36 ], [ %92, %bb32 ]
  %98 = phi i32 [ %99, %bb36 ], [ %90, %bb32 ]
  store i32 %97, i32* %96, align 4, !dbg !103
  %99 = ashr i32 %98, 1, !dbg !103
  %100 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 %99, !dbg !103
  %101 = load i32* %100, align 4, !dbg !103
  %102 = getelementptr inbounds [516 x i32]* %weight, i32 0, i32 %101, !dbg !103
  %103 = load i32* %102, align 4, !dbg !103
  %104 = icmp slt i32 %89, %103, !dbg !103
  %105 = getelementptr inbounds [260 x i32]* %heap, i32 0, i32 %98, !dbg !103
  br i1 %104, label %bb36, label %bb38, !dbg !103

bb38:                                             ; preds = %bb36, %bb32
  %.lcssa60 = phi i32* [ %scevgep89, %bb32 ], [ %105, %bb36 ]
  store i32 %tmp82, i32* %.lcssa60, align 4, !dbg !103
  %indvar.next = add i32 %indvar, 1
  %exitcond80 = icmp eq i32 %indvar.next, %tmp79
  br i1 %exitcond80, label %bb39.bb40_crit_edge, label %bb13, !dbg !95

bb39.bb40_crit_edge:                              ; preds = %bb38
  %tmp78 = add i32 %tmp, %alphaSize
  br label %bb40

bb40:                                             ; preds = %bb39.bb40_crit_edge, %bb39.preheader
  %nNodes.0.lcssa = phi i32 [ %tmp78, %bb39.bb40_crit_edge ], [ %alphaSize, %bb39.preheader ]
  %106 = icmp sgt i32 %nNodes.0.lcssa, 515, !dbg !104
  br i1 %106, label %bb41, label %bb49.preheader, !dbg !104

bb41:                                             ; preds = %bb40
  call void @BZ2_bz__AssertH__fail(i32 2002) nounwind, !dbg !104
  br label %bb49.preheader, !dbg !104

bb49.preheader:                                   ; preds = %bb41, %bb40
  br i1 %7, label %return, label %bb45.preheader, !dbg !105

bb44:                                             ; preds = %bb45.preheader, %bb44
  %107 = phi i32 [ %110, %bb44 ], [ %114, %bb45.preheader ]
  %j.065 = phi i32 [ %108, %bb44 ], [ 0, %bb45.preheader ]
  %108 = add nsw i32 %j.065, 1, !dbg !106
  %109 = getelementptr inbounds [516 x i32]* %parent, i32 0, i32 %107, !dbg !106
  %110 = load i32* %109, align 4, !dbg !106
  %111 = icmp sgt i32 %110, -1
  br i1 %111, label %bb44, label %bb46, !dbg !106

bb46:                                             ; preds = %bb44, %bb45.preheader
  %j.0.lcssa = phi i32 [ 0, %bb45.preheader ], [ %108, %bb44 ]
  %112 = trunc i32 %j.0.lcssa to i8, !dbg !107
  store i8 %112, i8* %scevgep97, align 1, !dbg !107
  %113 = icmp sgt i32 %j.0.lcssa, %maxLen, !dbg !108
  %tooLong.0 = select i1 %113, i8 1, i8 %tooLong.167
  %exitcond96 = icmp eq i32 %tmp98, %alphaSize
  br i1 %exitcond96, label %bb50, label %bb45.preheader, !dbg !105

bb45.preheader:                                   ; preds = %bb49.preheader, %bb46
  %indvar94 = phi i32 [ %tmp98, %bb46 ], [ 0, %bb49.preheader ]
  %tooLong.167 = phi i8 [ %tooLong.0, %bb46 ], [ 0, %bb49.preheader ]
  %scevgep97 = getelementptr i8* %len, i32 %indvar94
  %tmp98 = add i32 %indvar94, 1
  %scevgep99 = getelementptr [516 x i32]* %parent, i32 0, i32 %tmp98
  %114 = load i32* %scevgep99, align 4, !dbg !106
  %115 = icmp sgt i32 %114, -1
  br i1 %115, label %bb44, label %bb46, !dbg !106

bb50:                                             ; preds = %bb46
  %phitmp = icmp eq i8 %tooLong.0, 0
  br i1 %phitmp, label %return, label %bb53.preheader, !dbg !109

bb53.preheader:                                   ; preds = %bb50
  br i1 %7, label %return.critedge, label %bb52, !dbg !110

bb52:                                             ; preds = %bb53.preheader, %bb52
  %indvar100 = phi i32 [ %tmp103, %bb52 ], [ 0, %bb53.preheader ]
  %tmp103 = add i32 %indvar100, 1
  %scevgep104 = getelementptr [516 x i32]* %weight, i32 0, i32 %tmp103
  %116 = load i32* %scevgep104, align 4, !dbg !111
  %117 = ashr i32 %116, 8, !dbg !111
  %118 = sdiv i32 %117, 2, !dbg !112
  %119 = shl i32 %118, 8
  %120 = add i32 %119, 256
  store i32 %120, i32* %scevgep104, align 4, !dbg !113
  %exitcond102 = icmp eq i32 %tmp103, %alphaSize
  br i1 %exitcond102, label %bb5, label %bb52, !dbg !110

return.critedge:                                  ; preds = %bb53.preheader
  store i32 0, i32* %4, align 4, !dbg !86
  store i32 0, i32* %5, align 4, !dbg !87
  store i32 -2, i32* %6, align 4, !dbg !88
  ret void, !dbg !114

return:                                           ; preds = %bb5, %bb49.preheader, %bb50
  call void @llvm.dbg.value(metadata !{i32 %alphaSize}, i64 0, metadata !43), !dbg !115
  call void @llvm.dbg.value(metadata !83, i64 0, metadata !45), !dbg !116
  call void @llvm.dbg.value(metadata !117, i64 0, metadata !48), !dbg !89
  ret void, !dbg !114
}

define void @BZ2_hbAssignCodes(i32* nocapture %code, i8* nocapture %length, i32 %minLen, i32 %maxLen, i32 %alphaSize) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32* %code}, i64 0, metadata !18), !dbg !118
  tail call void @llvm.dbg.value(metadata !{i8* %length}, i64 0, metadata !19), !dbg !119
  tail call void @llvm.dbg.value(metadata !{i32 %minLen}, i64 0, metadata !20), !dbg !120
  tail call void @llvm.dbg.value(metadata !{i32 %maxLen}, i64 0, metadata !21), !dbg !121
  tail call void @llvm.dbg.value(metadata !{i32 %alphaSize}, i64 0, metadata !22), !dbg !122
  tail call void @llvm.dbg.value(metadata !83, i64 0, metadata !25), !dbg !123
  tail call void @llvm.dbg.value(metadata !{i32 %minLen}, i64 0, metadata !23), !dbg !124
  %0 = icmp sgt i32 %minLen, %maxLen, !dbg !124
  br i1 %0, label %return, label %bb4.preheader.lr.ph, !dbg !124

bb4.preheader.lr.ph:                              ; preds = %entry
  %1 = icmp sgt i32 %alphaSize, 0, !dbg !125
  %tmp = add i32 %minLen, 1
  br label %bb4.preheader

bb1:                                              ; preds = %bb4.preheader, %bb3
  %i.09 = phi i32 [ %6, %bb3 ], [ 0, %bb4.preheader ]
  %vec.18 = phi i32 [ %vec.0, %bb3 ], [ %vec.211, %bb4.preheader ]
  %scevgep = getelementptr i8* %length, i32 %i.09
  %2 = load i8* %scevgep, align 1, !dbg !126
  %3 = zext i8 %2 to i32, !dbg !126
  %4 = icmp eq i32 %3, %n.010, !dbg !126
  br i1 %4, label %bb2, label %bb3, !dbg !126

bb2:                                              ; preds = %bb1
  %scevgep12 = getelementptr i32* %code, i32 %i.09
  store i32 %vec.18, i32* %scevgep12, align 4, !dbg !126
  %5 = add nsw i32 %vec.18, 1, !dbg !126
  br label %bb3, !dbg !126

bb3:                                              ; preds = %bb2, %bb1
  %vec.0 = phi i32 [ %5, %bb2 ], [ %vec.18, %bb1 ]
  %6 = add nsw i32 %i.09, 1, !dbg !125
  %exitcond = icmp eq i32 %6, %alphaSize
  br i1 %exitcond, label %bb5, label %bb1, !dbg !125

bb5:                                              ; preds = %bb3, %bb4.preheader
  %vec.1.lcssa = phi i32 [ %vec.211, %bb4.preheader ], [ %vec.0, %bb3 ]
  %7 = shl i32 %vec.1.lcssa, 1, !dbg !127
  %8 = icmp sgt i32 %tmp13, %maxLen, !dbg !124
  %indvar.next = add i32 %indvar, 1
  br i1 %8, label %return, label %bb4.preheader, !dbg !124

bb4.preheader:                                    ; preds = %bb4.preheader.lr.ph, %bb5
  %indvar = phi i32 [ 0, %bb4.preheader.lr.ph ], [ %indvar.next, %bb5 ]
  %vec.211 = phi i32 [ 0, %bb4.preheader.lr.ph ], [ %7, %bb5 ]
  %n.010 = add i32 %indvar, %minLen
  %tmp13 = add i32 %tmp, %indvar
  br i1 %1, label %bb1, label %bb5, !dbg !125

return:                                           ; preds = %bb5, %entry
  ret void, !dbg !128
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define void @BZ2_hbCreateDecodeTables(i32* nocapture %limit, i32* nocapture %base, i32* nocapture %perm, i8* nocapture %length, i32 %minLen, i32 %maxLen, i32 %alphaSize) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32* %limit}, i64 0, metadata !27), !dbg !129
  tail call void @llvm.dbg.value(metadata !{i32* %base}, i64 0, metadata !28), !dbg !130
  tail call void @llvm.dbg.value(metadata !{i32* %perm}, i64 0, metadata !29), !dbg !131
  tail call void @llvm.dbg.value(metadata !{i8* %length}, i64 0, metadata !30), !dbg !132
  tail call void @llvm.dbg.value(metadata !{i32 %minLen}, i64 0, metadata !31), !dbg !133
  tail call void @llvm.dbg.value(metadata !{i32 %maxLen}, i64 0, metadata !32), !dbg !134
  tail call void @llvm.dbg.value(metadata !{i32 %alphaSize}, i64 0, metadata !33), !dbg !135
  tail call void @llvm.dbg.value(metadata !83, i64 0, metadata !34), !dbg !136
  tail call void @llvm.dbg.value(metadata !{i32 %minLen}, i64 0, metadata !36), !dbg !137
  %limit53 = bitcast i32* %limit to i8*
  %base63 = bitcast i32* %base to i8*
  %0 = icmp sgt i32 %minLen, %maxLen, !dbg !137
  %.pre72 = icmp sgt i32 %alphaSize, 0, !dbg !138
  br i1 %0, label %entry.bb9.preheader_crit_edge, label %bb4.preheader.lr.ph, !dbg !137

entry.bb9.preheader_crit_edge:                    ; preds = %entry
  call void @llvm.memset.p0i8.i32(i8* %base63, i8 0, i32 92, i32 4, i1 false)
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !36), !dbg !139
  br i1 %.pre72, label %bb11, label %bb14, !dbg !138

bb4.preheader.lr.ph:                              ; preds = %entry
  %tmp69 = add i32 %minLen, 1
  br label %bb4.preheader

bb1:                                              ; preds = %bb4.preheader, %bb3
  %1 = phi i32 [ %7, %bb3 ], [ 0, %bb4.preheader ]
  %pp.135 = phi i32 [ %pp.0, %bb3 ], [ %pp.237, %bb4.preheader ]
  %scevgep65 = getelementptr i8* %length, i32 %1
  %2 = load i8* %scevgep65, align 1, !dbg !140
  %3 = zext i8 %2 to i32, !dbg !140
  %4 = icmp eq i32 %3, %i.038, !dbg !140
  br i1 %4, label %bb2, label %bb3, !dbg !140

bb2:                                              ; preds = %bb1
  %5 = getelementptr inbounds i32* %perm, i32 %pp.135, !dbg !140
  store i32 %1, i32* %5, align 4, !dbg !140
  %6 = add nsw i32 %pp.135, 1, !dbg !140
  br label %bb3, !dbg !140

bb3:                                              ; preds = %bb2, %bb1
  %pp.0 = phi i32 [ %6, %bb2 ], [ %pp.135, %bb1 ]
  %7 = add nsw i32 %1, 1, !dbg !141
  %exitcond64 = icmp eq i32 %7, %alphaSize
  br i1 %exitcond64, label %bb5, label %bb1, !dbg !141

bb5:                                              ; preds = %bb3, %bb4.preheader
  %pp.1.lcssa = phi i32 [ %pp.237, %bb4.preheader ], [ %pp.0, %bb3 ]
  %8 = icmp sgt i32 %tmp70, %maxLen, !dbg !137
  %indvar.next67 = add i32 %indvar66, 1
  br i1 %8, label %bb9.preheader, label %bb4.preheader, !dbg !137

bb4.preheader:                                    ; preds = %bb4.preheader.lr.ph, %bb5
  %indvar66 = phi i32 [ 0, %bb4.preheader.lr.ph ], [ %indvar.next67, %bb5 ]
  %pp.237 = phi i32 [ 0, %bb4.preheader.lr.ph ], [ %pp.1.lcssa, %bb5 ]
  %i.038 = add i32 %indvar66, %minLen
  %tmp70 = add i32 %tmp69, %indvar66
  br i1 %.pre72, label %bb1, label %bb5, !dbg !141

bb9.preheader:                                    ; preds = %bb5
  call void @llvm.memset.p0i8.i32(i8* %base63, i8 0, i32 92, i32 4, i1 false)
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !36), !dbg !139
  br i1 %.pre72, label %bb11, label %bb14, !dbg !138

bb11:                                             ; preds = %bb9.preheader, %entry.bb9.preheader_crit_edge, %bb11
  %i.233 = phi i32 [ %15, %bb11 ], [ 0, %entry.bb9.preheader_crit_edge ], [ 0, %bb9.preheader ]
  %scevgep60 = getelementptr i8* %length, i32 %i.233
  %9 = load i8* %scevgep60, align 1, !dbg !138
  %10 = zext i8 %9 to i32, !dbg !138
  %11 = add nsw i32 %10, 1, !dbg !138
  %12 = getelementptr inbounds i32* %base, i32 %11, !dbg !138
  %13 = load i32* %12, align 4, !dbg !138
  %14 = add nsw i32 %13, 1, !dbg !138
  store i32 %14, i32* %12, align 4, !dbg !138
  %15 = add nsw i32 %i.233, 1, !dbg !138
  %exitcond59 = icmp eq i32 %15, %alphaSize
  br i1 %exitcond59, label %bb12.bb15.preheader_crit_edge, label %bb11, !dbg !138

bb12.bb15.preheader_crit_edge:                    ; preds = %bb11
  tail call void @llvm.dbg.value(metadata !{i32 %15}, i64 0, metadata !36), !dbg !138
  %.pre.pre = load i32* %base, align 4
  br label %bb14

bb14:                                             ; preds = %bb9.preheader, %bb12.bb15.preheader_crit_edge, %entry.bb9.preheader_crit_edge, %bb14.bb14_crit_edge
  %16 = phi i32 [ %18, %bb14.bb14_crit_edge ], [ %.pre.pre, %bb12.bb15.preheader_crit_edge ], [ 0, %bb9.preheader ], [ 0, %entry.bb9.preheader_crit_edge ]
  %indvar54 = phi i32 [ %phitmp, %bb14.bb14_crit_edge ], [ 1, %entry.bb9.preheader_crit_edge ], [ 1, %bb12.bb15.preheader_crit_edge ], [ 1, %bb9.preheader ]
  %scevgep57 = getelementptr i32* %base, i32 %indvar54
  %17 = load i32* %scevgep57, align 4, !dbg !142
  %18 = add nsw i32 %16, %17, !dbg !142
  store i32 %18, i32* %scevgep57, align 4, !dbg !142
  %exitcond = icmp eq i32 %indvar54, 22
  br i1 %exitcond, label %bb18.preheader, label %bb14.bb14_crit_edge, !dbg !142

bb14.bb14_crit_edge:                              ; preds = %bb14
  %phitmp = add i32 %indvar54, 1
  br label %bb14

bb18.preheader:                                   ; preds = %bb14
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !36), !dbg !142
  call void @llvm.memset.p0i8.i32(i8* %limit53, i8 0, i32 92, i32 4, i1 false)
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !36), !dbg !143
  %i.626.pre = add i32 %minLen, 1
  br i1 %0, label %bb24.preheader, label %bb20, !dbg !144

bb20:                                             ; preds = %bb18.preheader, %bb20
  %indvar44 = phi i32 [ %indvar.next45, %bb20 ], [ 0, %bb18.preheader ]
  %vec.030 = phi i32 [ %24, %bb20 ], [ 0, %bb18.preheader ]
  %tmp46 = add i32 %indvar44, %minLen
  %scevgep47 = getelementptr i32* %base, i32 %tmp46
  %scevgep48 = getelementptr i32* %limit, i32 %tmp46
  %tmp50 = add i32 %i.626.pre, %indvar44
  %scevgep51 = getelementptr i32* %base, i32 %tmp50
  %19 = load i32* %scevgep51, align 4, !dbg !145
  %20 = load i32* %scevgep47, align 4, !dbg !145
  %21 = sub nsw i32 %19, %20, !dbg !145
  %22 = add nsw i32 %21, %vec.030, !dbg !145
  %23 = add nsw i32 %22, -1
  store i32 %23, i32* %scevgep48, align 4, !dbg !146
  %24 = shl i32 %22, 1, !dbg !147
  %25 = icmp sgt i32 %tmp50, %maxLen, !dbg !144
  %indvar.next45 = add i32 %indvar44, 1
  br i1 %25, label %bb24.preheader, label %bb20, !dbg !144

bb24.preheader:                                   ; preds = %bb18.preheader, %bb20
  %i.626.pre-phi = phi i32 [ %i.626.pre, %bb20 ], [ %i.626.pre, %bb18.preheader ]
  %26 = icmp sgt i32 %i.626.pre-phi, %maxLen, !dbg !148
  br i1 %26, label %return, label %bb23.lr.ph, !dbg !148

bb23.lr.ph:                                       ; preds = %bb24.preheader
  %tmp = add i32 %minLen, 2
  br label %bb23

bb23:                                             ; preds = %bb23.lr.ph, %bb23
  %indvar = phi i32 [ 0, %bb23.lr.ph ], [ %indvar.next, %bb23 ]
  %i.6 = add i32 %tmp, %indvar
  %tmp40 = add i32 %indvar, %minLen
  %scevgep = getelementptr i32* %limit, i32 %tmp40
  %tmp42 = add i32 %i.626.pre-phi, %indvar
  %scevgep43 = getelementptr i32* %base, i32 %tmp42
  %27 = load i32* %scevgep, align 4, !dbg !149
  %28 = shl i32 %27, 1
  %29 = load i32* %scevgep43, align 4, !dbg !149
  %30 = sub i32 2, %29
  %31 = add i32 %30, %28
  store i32 %31, i32* %scevgep43, align 4, !dbg !149
  %32 = icmp sgt i32 %i.6, %maxLen, !dbg !148
  %indvar.next = add i32 %indvar, 1
  br i1 %32, label %return, label %bb23, !dbg !148

return:                                           ; preds = %bb23, %bb24.preheader
  ret void, !dbg !150
}

declare void @BZ2_bz__AssertH__fail(i32)

declare void @llvm.memset.p0i8.i32(i8* nocapture, i8, i32, i32, i1) nounwind

!llvm.dbg.sp = !{!0, !12, !15}
!llvm.dbg.lv.BZ2_hbAssignCodes = !{!18, !19, !20, !21, !22, !23, !25, !26}
!llvm.dbg.lv.BZ2_hbCreateDecodeTables = !{!27, !28, !29, !30, !31, !32, !33, !34, !36, !37, !38}
!llvm.dbg.lv.BZ2_hbMakeCodeLengths = !{!39, !40, !41, !42, !43, !45, !46, !47, !48, !49, !50, !51, !53, !57, !61, !62, !64, !65, !67, !68, !69, !71, !72, !73, !75}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"BZ2_hbAssignCodes", metadata !"BZ2_hbAssignCodes", metadata !"BZ2_hbAssignCodes", metadata !1, i32 157, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, i8*, i32, i32, i32)* @BZ2_hbAssignCodes} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"huffman.c", metadata !"/usr/local/google/scratch/bzip2-nacl/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 1, metadata !"huffman.c", metadata !"/usr/local/google/scratch/bzip2-nacl/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{null, metadata !5, metadata !9, metadata !6, metadata !6, metadata !6}
!5 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !6} ; [ DW_TAG_pointer_type ]
!6 = metadata !{i32 589846, metadata !7, metadata !"Int32", metadata !7, i32 45, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ]
!7 = metadata !{i32 589865, metadata !"bzlib_private.h", metadata !"/usr/local/google/scratch/bzip2-nacl/", metadata !2} ; [ DW_TAG_file_type ]
!8 = metadata !{i32 589860, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!9 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 589846, metadata !7, metadata !"UChar", metadata !7, i32 44, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!11 = metadata !{i32 589860, metadata !1, metadata !"unsigned char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!12 = metadata !{i32 589870, i32 0, metadata !1, metadata !"BZ2_hbCreateDecodeTables", metadata !"BZ2_hbCreateDecodeTables", metadata !"BZ2_hbCreateDecodeTables", metadata !1, i32 177, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, i32*, i32*, i8*, i32, i32, i32)* @BZ2_hbCreateDecodeTables} ; [ DW_TAG_subprogram ]
!13 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, null} ; [ DW_TAG_subroutine_type ]
!14 = metadata !{null, metadata !5, metadata !5, metadata !5, metadata !9, metadata !6, metadata !6, metadata !6}
!15 = metadata !{i32 589870, i32 0, metadata !1, metadata !"BZ2_hbMakeCodeLengths", metadata !"BZ2_hbMakeCodeLengths", metadata !"BZ2_hbMakeCodeLengths", metadata !1, i32 67, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i8*, i32*, i32, i32)* @BZ2_hbMakeCodeLengths} ; [ DW_TAG_subprogram ]
!16 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null} ; [ DW_TAG_subroutine_type ]
!17 = metadata !{null, metadata !9, metadata !5, metadata !6, metadata !6}
!18 = metadata !{i32 590081, metadata !0, metadata !"code", metadata !1, i32 152, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!19 = metadata !{i32 590081, metadata !0, metadata !"length", metadata !1, i32 153, metadata !9, i32 0} ; [ DW_TAG_arg_variable ]
!20 = metadata !{i32 590081, metadata !0, metadata !"minLen", metadata !1, i32 154, metadata !6, i32 0} ; [ DW_TAG_arg_variable ]
!21 = metadata !{i32 590081, metadata !0, metadata !"maxLen", metadata !1, i32 155, metadata !6, i32 0} ; [ DW_TAG_arg_variable ]
!22 = metadata !{i32 590081, metadata !0, metadata !"alphaSize", metadata !1, i32 156, metadata !6, i32 0} ; [ DW_TAG_arg_variable ]
!23 = metadata !{i32 590080, metadata !24, metadata !"n", metadata !1, i32 158, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!24 = metadata !{i32 589835, metadata !0, i32 157, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!25 = metadata !{i32 590080, metadata !24, metadata !"vec", metadata !1, i32 158, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!26 = metadata !{i32 590080, metadata !24, metadata !"i", metadata !1, i32 158, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!27 = metadata !{i32 590081, metadata !12, metadata !"limit", metadata !1, i32 170, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!28 = metadata !{i32 590081, metadata !12, metadata !"base", metadata !1, i32 171, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!29 = metadata !{i32 590081, metadata !12, metadata !"perm", metadata !1, i32 172, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!30 = metadata !{i32 590081, metadata !12, metadata !"length", metadata !1, i32 173, metadata !9, i32 0} ; [ DW_TAG_arg_variable ]
!31 = metadata !{i32 590081, metadata !12, metadata !"minLen", metadata !1, i32 174, metadata !6, i32 0} ; [ DW_TAG_arg_variable ]
!32 = metadata !{i32 590081, metadata !12, metadata !"maxLen", metadata !1, i32 175, metadata !6, i32 0} ; [ DW_TAG_arg_variable ]
!33 = metadata !{i32 590081, metadata !12, metadata !"alphaSize", metadata !1, i32 176, metadata !6, i32 0} ; [ DW_TAG_arg_variable ]
!34 = metadata !{i32 590080, metadata !35, metadata !"pp", metadata !1, i32 178, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!35 = metadata !{i32 589835, metadata !12, i32 177, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!36 = metadata !{i32 590080, metadata !35, metadata !"i", metadata !1, i32 178, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!37 = metadata !{i32 590080, metadata !35, metadata !"j", metadata !1, i32 178, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!38 = metadata !{i32 590080, metadata !35, metadata !"vec", metadata !1, i32 178, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!39 = metadata !{i32 590081, metadata !15, metadata !"len", metadata !1, i32 63, metadata !9, i32 0} ; [ DW_TAG_arg_variable ]
!40 = metadata !{i32 590081, metadata !15, metadata !"freq", metadata !1, i32 64, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!41 = metadata !{i32 590081, metadata !15, metadata !"alphaSize", metadata !1, i32 65, metadata !6, i32 0} ; [ DW_TAG_arg_variable ]
!42 = metadata !{i32 590081, metadata !15, metadata !"maxLen", metadata !1, i32 66, metadata !6, i32 0} ; [ DW_TAG_arg_variable ]
!43 = metadata !{i32 590080, metadata !44, metadata !"nNodes", metadata !1, i32 72, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!44 = metadata !{i32 589835, metadata !15, i32 67, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!45 = metadata !{i32 590080, metadata !44, metadata !"nHeap", metadata !1, i32 72, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!46 = metadata !{i32 590080, metadata !44, metadata !"n1", metadata !1, i32 72, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!47 = metadata !{i32 590080, metadata !44, metadata !"n2", metadata !1, i32 72, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!48 = metadata !{i32 590080, metadata !44, metadata !"i", metadata !1, i32 72, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!49 = metadata !{i32 590080, metadata !44, metadata !"j", metadata !1, i32 72, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!50 = metadata !{i32 590080, metadata !44, metadata !"k", metadata !1, i32 72, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!51 = metadata !{i32 590080, metadata !44, metadata !"tooLong", metadata !1, i32 73, metadata !52, i32 0} ; [ DW_TAG_auto_variable ]
!52 = metadata !{i32 589846, metadata !7, metadata !"Bool", metadata !7, i32 43, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!53 = metadata !{i32 590080, metadata !44, metadata !"heap", metadata !1, i32 75, metadata !54, i32 0} ; [ DW_TAG_auto_variable ]
!54 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 8320, i64 32, i64 0, i32 0, metadata !6, metadata !55, i32 0, null} ; [ DW_TAG_array_type ]
!55 = metadata !{metadata !56}
!56 = metadata !{i32 589857, i64 0, i64 259}      ; [ DW_TAG_subrange_type ]
!57 = metadata !{i32 590080, metadata !44, metadata !"weight", metadata !1, i32 76, metadata !58, i32 0} ; [ DW_TAG_auto_variable ]
!58 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 16512, i64 32, i64 0, i32 0, metadata !6, metadata !59, i32 0, null} ; [ DW_TAG_array_type ]
!59 = metadata !{metadata !60}
!60 = metadata !{i32 589857, i64 0, i64 515}      ; [ DW_TAG_subrange_type ]
!61 = metadata !{i32 590080, metadata !44, metadata !"parent", metadata !1, i32 77, metadata !58, i32 0} ; [ DW_TAG_auto_variable ]
!62 = metadata !{i32 590080, metadata !63, metadata !"zz", metadata !1, i32 95, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!63 = metadata !{i32 589835, metadata !44, i32 95, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!64 = metadata !{i32 590080, metadata !63, metadata !"tmp", metadata !1, i32 95, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!65 = metadata !{i32 590080, metadata !66, metadata !"zz", metadata !1, i32 101, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!66 = metadata !{i32 589835, metadata !44, i32 101, i32 0, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!67 = metadata !{i32 590080, metadata !66, metadata !"yy", metadata !1, i32 101, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!68 = metadata !{i32 590080, metadata !66, metadata !"tmp", metadata !1, i32 101, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!69 = metadata !{i32 590080, metadata !70, metadata !"zz", metadata !1, i32 102, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!70 = metadata !{i32 589835, metadata !44, i32 102, i32 0, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
!71 = metadata !{i32 590080, metadata !70, metadata !"yy", metadata !1, i32 102, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!72 = metadata !{i32 590080, metadata !70, metadata !"tmp", metadata !1, i32 102, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!73 = metadata !{i32 590080, metadata !74, metadata !"zz", metadata !1, i32 109, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!74 = metadata !{i32 589835, metadata !44, i32 109, i32 0, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!75 = metadata !{i32 590080, metadata !74, metadata !"tmp", metadata !1, i32 109, metadata !6, i32 0} ; [ DW_TAG_auto_variable ]
!76 = metadata !{i32 63, i32 0, metadata !15, null}
!77 = metadata !{i32 64, i32 0, metadata !15, null}
!78 = metadata !{i32 65, i32 0, metadata !15, null}
!79 = metadata !{i32 66, i32 0, metadata !15, null}
!80 = metadata !{i32 75, i32 0, metadata !44, null}
!81 = metadata !{i32 76, i32 0, metadata !44, null}
!82 = metadata !{i32 77, i32 0, metadata !44, null}
!83 = metadata !{i32 0}
!84 = metadata !{i32 79, i32 0, metadata !44, null}
!85 = metadata !{i32 80, i32 0, metadata !44, null}
!86 = metadata !{i32 87, i32 0, metadata !44, null}
!87 = metadata !{i32 88, i32 0, metadata !44, null}
!88 = metadata !{i32 89, i32 0, metadata !44, null}
!89 = metadata !{i32 91, i32 0, metadata !44, null}
!90 = metadata !{i32 101, i32 0, metadata !44, null}
!91 = metadata !{i32 92, i32 0, metadata !44, null}
!92 = metadata !{i32 94, i32 0, metadata !44, null}
!93 = metadata !{i32 95, i32 0, metadata !63, null}
!94 = metadata !{i32 98, i32 0, metadata !44, null}
!95 = metadata !{i32 100, i32 0, metadata !44, null}
!96 = metadata !{i32 101, i32 0, metadata !66, null}
!97 = metadata !{i32 102, i32 0, metadata !44, null}
!98 = metadata !{i32 102, i32 0, metadata !70, null}
!99 = metadata !{i32 104, i32 0, metadata !44, null}
!100 = metadata !{i32 105, i32 0, metadata !44, null}
!101 = metadata !{i32 106, i32 0, metadata !44, null}
!102 = metadata !{i32 108, i32 0, metadata !44, null}
!103 = metadata !{i32 109, i32 0, metadata !74, null}
!104 = metadata !{i32 112, i32 0, metadata !44, null}
!105 = metadata !{i32 115, i32 0, metadata !44, null}
!106 = metadata !{i32 118, i32 0, metadata !44, null}
!107 = metadata !{i32 119, i32 0, metadata !44, null}
!108 = metadata !{i32 120, i32 0, metadata !44, null}
!109 = metadata !{i32 123, i32 0, metadata !44, null}
!110 = metadata !{i32 142, i32 0, metadata !44, null}
!111 = metadata !{i32 143, i32 0, metadata !44, null}
!112 = metadata !{i32 144, i32 0, metadata !44, null}
!113 = metadata !{i32 145, i32 0, metadata !44, null}
!114 = metadata !{i32 148, i32 0, metadata !44, null}
!115 = metadata !{i32 84, i32 0, metadata !44, null}
!116 = metadata !{i32 85, i32 0, metadata !44, null}
!117 = metadata !{i32 1}
!118 = metadata !{i32 152, i32 0, metadata !0, null}
!119 = metadata !{i32 153, i32 0, metadata !0, null}
!120 = metadata !{i32 154, i32 0, metadata !0, null}
!121 = metadata !{i32 155, i32 0, metadata !0, null}
!122 = metadata !{i32 156, i32 0, metadata !0, null}
!123 = metadata !{i32 160, i32 0, metadata !24, null}
!124 = metadata !{i32 161, i32 0, metadata !24, null}
!125 = metadata !{i32 162, i32 0, metadata !24, null}
!126 = metadata !{i32 163, i32 0, metadata !24, null}
!127 = metadata !{i32 164, i32 0, metadata !24, null}
!128 = metadata !{i32 166, i32 0, metadata !24, null}
!129 = metadata !{i32 170, i32 0, metadata !12, null}
!130 = metadata !{i32 171, i32 0, metadata !12, null}
!131 = metadata !{i32 172, i32 0, metadata !12, null}
!132 = metadata !{i32 173, i32 0, metadata !12, null}
!133 = metadata !{i32 174, i32 0, metadata !12, null}
!134 = metadata !{i32 175, i32 0, metadata !12, null}
!135 = metadata !{i32 176, i32 0, metadata !12, null}
!136 = metadata !{i32 180, i32 0, metadata !35, null}
!137 = metadata !{i32 181, i32 0, metadata !35, null}
!138 = metadata !{i32 186, i32 0, metadata !35, null}
!139 = metadata !{i32 185, i32 0, metadata !35, null}
!140 = metadata !{i32 183, i32 0, metadata !35, null}
!141 = metadata !{i32 182, i32 0, metadata !35, null}
!142 = metadata !{i32 188, i32 0, metadata !35, null}
!143 = metadata !{i32 190, i32 0, metadata !35, null}
!144 = metadata !{i32 193, i32 0, metadata !35, null}
!145 = metadata !{i32 194, i32 0, metadata !35, null}
!146 = metadata !{i32 195, i32 0, metadata !35, null}
!147 = metadata !{i32 196, i32 0, metadata !35, null}
!148 = metadata !{i32 198, i32 0, metadata !35, null}
!149 = metadata !{i32 199, i32 0, metadata !35, null}
!150 = metadata !{i32 200, i32 0, metadata !35, null}
