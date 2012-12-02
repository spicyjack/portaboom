; ModuleID = 'bzip2recover.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:64:128-a0:0:64-n32"
target triple = "armv7-none-linux-gnueabi"

%0 = type { %struct.anon, [8 x i32] }
%struct.BitStream = type { %struct.__FILE*, i32, i32, i8 }
%struct._Bigint = type { %struct._Bigint*, i32, i32, i32, i32, [1 x i32] }
%struct.__FILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (%struct._reent*, i8*, i8*, i32)*, i32 (%struct._reent*, i8*, i8*, i32)*, i32 (%struct._reent*, i8*, i32, i32)*, i32 (%struct._reent*, i8*)*, %struct.__sbuf, i8*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i32, %struct._reent*, %struct._flock_t, %struct._mbstate_t, i32 }
%struct.__sbuf = type { i8*, i32 }
%struct.__tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct._atexit = type { %struct._atexit*, i32, [32 x void ()*], %struct._on_exit_args }
%struct._flock_t = type { i32, i32, i32, i32, i32 }
%struct._glue = type { %struct._glue*, i32, %struct.__FILE* }
%struct._mbstate_t = type { i32, %union.anon }
%struct._on_exit_args = type { [32 x i8*], [32 x i8*], i32, i32 }
%struct._rand48 = type { [3 x i16], [3 x i16], i16 }
%struct._reent = type { i32, %struct.__FILE*, %struct.__FILE*, %struct.__FILE*, i32, [25 x i8], i32, i8*, i32, void (%struct._reent*)*, %struct._Bigint*, i32, %struct._Bigint*, %struct._Bigint**, i32, i8*, %0, %struct._atexit*, %struct._atexit, void (i32)**, %struct._glue, [3 x %struct.__FILE] }
%struct.anon = type { i32, i8*, [26 x i8], %struct.__tm, i32, i64, %struct._rand48, %struct._mbstate_t, %struct._mbstate_t, %struct._mbstate_t, [8 x i8], [24 x i8], i32, %struct._mbstate_t, %struct._mbstate_t, %struct._mbstate_t, %struct._mbstate_t, %struct._mbstate_t, i32 }
%union.anon = type { i32 }

@bytesOut = unnamed_addr global i64 0
@_impure_ptr = external thread_local unnamed_addr global %struct._reent*
@.str = private unnamed_addr constant [49 x i8] c"%s: `%s' appears to contain more than %d blocks\0A\00", align 4
@progName = common unnamed_addr global [2000 x i8] zeroinitializer
@inFileName = common unnamed_addr global [2000 x i8] zeroinitializer
@.str1 = private unnamed_addr constant [46 x i8] c"%s: and cannot be handled.  To fix, increase\0A\00", align 4
@.str2 = private unnamed_addr constant [61 x i8] c"%s: BZ_MAX_HANDLED_BLOCKS in bzip2recover.c, and recompile.\0A\00", align 4
@.str3 = private unnamed_addr constant [44 x i8] c"%s: malloc failed on request for %d bytes.\0A\00", align 4
@.str4 = private unnamed_addr constant [48 x i8] c"%s: warning: output file(s) may be incomplete.\0A\00", align 4
@.str5 = private unnamed_addr constant [54 x i8] c"%s: I/O error reading `%s', possible reason follows.\0A\00", align 4
@outFileName = common unnamed_addr global [2000 x i8] zeroinitializer
@.str6 = private unnamed_addr constant [62 x i8] c"bzip2recover 1.0.6: extracts blocks from damaged .bz2 files.\0A\00", align 4
@.str7 = private unnamed_addr constant [38 x i8] c"%s: usage is `%s damaged_file_name'.\0A\00", align 4
@.str8 = private unnamed_addr constant [47 x i8] c"\09restrictions on size of recovered file: None\0A\00", align 4
@.str9 = private unnamed_addr constant [65 x i8] c"%s: supplied filename is suspiciously (>= %d chars) long.  Bye!\0A\00", align 4
@.str10 = private unnamed_addr constant [3 x i8] c"rb\00", align 4
@.str11 = private unnamed_addr constant [21 x i8] c"%s: can't read `%s'\0A\00", align 4
@.str12 = private unnamed_addr constant [40 x i8] c"%s: searching for block boundaries ...\0A\00", align 4
@bStart = common unnamed_addr global [50000 x i64] zeroinitializer
@bEnd = common unnamed_addr global [50000 x i64] zeroinitializer
@.str13 = private unnamed_addr constant [47 x i8] c"   block %d runs from %Lu to %Lu (incomplete)\0A\00", align 4
@.str14 = private unnamed_addr constant [34 x i8] c"   block %d runs from %Lu to %Lu\0A\00", align 4
@rbStart = common unnamed_addr global [50000 x i64] zeroinitializer
@rbEnd = common unnamed_addr global [50000 x i64] zeroinitializer
@.str15 = private unnamed_addr constant [50 x i8] c"%s: sorry, I couldn't find any block boundaries.\0A\00", align 4
@.str16 = private unnamed_addr constant [27 x i8] c"%s: splitting into blocks\0A\00", align 4
@.str17 = private unnamed_addr constant [21 x i8] c"%s: can't open `%s'\0A\00", align 4
@.str18 = private unnamed_addr constant [7 x i8] c"rec%5d\00", align 4
@.str19 = private unnamed_addr constant [5 x i8] c".bz2\00", align 4
@.str20 = private unnamed_addr constant [33 x i8] c"   writing block %d to `%s' ...\0A\00", align 4
@.str21 = private unnamed_addr constant [3 x i8] c"wb\00", align 4
@.str22 = private unnamed_addr constant [22 x i8] c"%s: can't write `%s'\0A\00", align 4
@.str23 = private unnamed_addr constant [14 x i8] c"%s: finished\0A\00", align 4
@bytesIn = unnamed_addr global i64 0

declare i32 @fprintf(%struct.__FILE* nocapture, i8* nocapture, ...) nounwind

declare void @exit(i32) noreturn nounwind

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare i32 @strlen(i8* nocapture) nounwind readonly

declare noalias i8* @malloc(i32) nounwind

declare void @perror(i8* nocapture) nounwind

define internal fastcc i32 @bsGetBit(%struct.BitStream* nocapture %bs) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{%struct.BitStream* %bs}, i64 0, metadata !284), !dbg !340
  %0 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 2, !dbg !341
  %1 = load i32* %0, align 4, !dbg !341
  %2 = icmp sgt i32 %1, 0, !dbg !341
  br i1 %2, label %bb, label %bb1, !dbg !341

bb:                                               ; preds = %entry
  %3 = add nsw i32 %1, -1
  store i32 %3, i32* %0, align 4, !dbg !342
  %4 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 1, !dbg !343
  %5 = load i32* %4, align 4, !dbg !343
  %6 = lshr i32 %5, %3
  %7 = and i32 %6, 1, !dbg !343
  ret i32 %7, !dbg !343

bb1:                                              ; preds = %entry
  %8 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 0, !dbg !344
  %9 = load %struct.__FILE** %8, align 4, !dbg !344
  %10 = getelementptr inbounds %struct.__FILE* %9, i32 0, i32 1, !dbg !344
  %11 = load i32* %10, align 4, !dbg !344
  %12 = add nsw i32 %11, -1
  store i32 %12, i32* %10, align 4, !dbg !344
  %13 = icmp slt i32 %12, 0, !dbg !344
  br i1 %13, label %bb4, label %bb4.thread, !dbg !344

bb4.thread:                                       ; preds = %bb1
  %14 = load %struct.__FILE** %8, align 4, !dbg !344
  %15 = getelementptr inbounds %struct.__FILE* %14, i32 0, i32 0, !dbg !344
  %16 = load i8** %15, align 4, !dbg !344
  %17 = load i8* %16, align 1, !dbg !344
  %18 = zext i8 %17 to i32, !dbg !344
  %19 = getelementptr inbounds i8* %16, i32 1, !dbg !344
  store i8* %19, i8** %15, align 4, !dbg !344
  tail call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !285), !dbg !344
  br label %bb8

bb4:                                              ; preds = %bb1
  %20 = load %struct._reent** @_impure_ptr, align 4, !dbg !344
  %21 = load %struct.__FILE** %8, align 4, !dbg !344
  %22 = tail call i32 @__srget_r(%struct._reent* %20, %struct.__FILE* %21) nounwind, !dbg !344
  tail call void @llvm.dbg.value(metadata !{i32 %22}, i64 0, metadata !285), !dbg !344
  %23 = icmp eq i32 %22, -1, !dbg !345
  br i1 %23, label %bb5, label %bb8, !dbg !345

bb5:                                              ; preds = %bb4
  %24 = tail call i32* @__errno() nounwind, !dbg !346
  %25 = load i32* %24, align 4, !dbg !346
  %26 = icmp eq i32 %25, 0, !dbg !346
  br i1 %26, label %bb9, label %bb6, !dbg !346

bb6:                                              ; preds = %bb5
  %27 = load %struct._reent** @_impure_ptr, align 4, !dbg !347
  %28 = getelementptr inbounds %struct._reent* %27, i32 0, i32 3, !dbg !347
  %29 = load %struct.__FILE** %28, align 4, !dbg !347
  %30 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %29, i8* getelementptr inbounds ([54 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @inFileName, i32 0, i32 0)) nounwind, !dbg !347
  tail call void @perror(i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !349
  %31 = load %struct._reent** @_impure_ptr, align 4, !dbg !350
  %32 = getelementptr inbounds %struct._reent* %31, i32 0, i32 3, !dbg !350
  %33 = load %struct.__FILE** %32, align 4, !dbg !350
  %34 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %33, i8* getelementptr inbounds ([48 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !350
  tail call void @exit(i32 1) noreturn nounwind, !dbg !351
  unreachable, !dbg !351

bb8:                                              ; preds = %bb4.thread, %bb4
  %iftmp.15.011 = phi i32 [ %18, %bb4.thread ], [ %22, %bb4 ]
  store i32 7, i32* %0, align 4, !dbg !352
  %35 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 1, !dbg !353
  store i32 %iftmp.15.011, i32* %35, align 4, !dbg !353
  %36 = lshr i32 %iftmp.15.011, 7
  %37 = and i32 %36, 1, !dbg !354
  ret i32 %37, !dbg !343

bb9:                                              ; preds = %bb5
  ret i32 2, !dbg !343
}

declare i32 @__srget_r(%struct._reent*, %struct.__FILE*)

declare i32* @__errno()

define internal fastcc void @bsPutBit(%struct.BitStream* nocapture %bs, i32 %bit) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{%struct.BitStream* %bs}, i64 0, metadata !288), !dbg !355
  tail call void @llvm.dbg.value(metadata !{i32 %bit}, i64 0, metadata !289), !dbg !355
  %0 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 2, !dbg !356
  %1 = load i32* %0, align 4, !dbg !356
  %2 = icmp eq i32 %1, 8, !dbg !356
  br i1 %2, label %bb, label %bb12, !dbg !356

bb:                                               ; preds = %entry
  %3 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 0, !dbg !357
  %4 = load %struct.__FILE** %3, align 4, !dbg !357
  %5 = getelementptr inbounds %struct.__FILE* %4, i32 0, i32 2, !dbg !357
  %6 = load i32* %5, align 4, !dbg !357
  %7 = add nsw i32 %6, -1
  store i32 %7, i32* %5, align 4, !dbg !357
  %8 = icmp slt i32 %7, 0, !dbg !357
  %9 = load %struct.__FILE** %3, align 4, !dbg !357
  br i1 %8, label %bb1, label %bb8, !dbg !357

bb1:                                              ; preds = %bb
  %10 = getelementptr inbounds %struct.__FILE* %9, i32 0, i32 2, !dbg !357
  %11 = load i32* %10, align 4, !dbg !357
  %12 = getelementptr inbounds %struct.__FILE* %9, i32 0, i32 6, !dbg !357
  %13 = load i32* %12, align 4, !dbg !357
  %14 = icmp slt i32 %11, %13, !dbg !357
  br i1 %14, label %bb6, label %bb2, !dbg !357

bb2:                                              ; preds = %bb1
  %15 = getelementptr inbounds %struct.__FILE* %9, i32 0, i32 0, !dbg !357
  %16 = load i8** %15, align 4, !dbg !357
  %17 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 1, !dbg !357
  %18 = load i32* %17, align 4, !dbg !357
  %19 = trunc i32 %18 to i8, !dbg !357
  store i8 %19, i8* %16, align 1, !dbg !357
  %20 = load %struct.__FILE** %3, align 4, !dbg !357
  %21 = getelementptr inbounds %struct.__FILE* %20, i32 0, i32 0, !dbg !357
  %22 = load i8** %21, align 4, !dbg !357
  %23 = load i8* %22, align 1, !dbg !357
  %24 = icmp eq i8 %23, 10, !dbg !357
  br i1 %24, label %bb4, label %bb3, !dbg !357

bb3:                                              ; preds = %bb2
  %25 = getelementptr inbounds i8* %22, i32 1, !dbg !357
  store i8* %25, i8** %21, align 4, !dbg !357
  br label %bb11, !dbg !357

bb4:                                              ; preds = %bb2
  %26 = load %struct._reent** @_impure_ptr, align 4, !dbg !357
  %27 = tail call i32 @__swbuf_r(%struct._reent* %26, i32 10, %struct.__FILE* %20) nounwind, !dbg !357
  br label %bb9, !dbg !357

bb6:                                              ; preds = %bb1
  %28 = load %struct._reent** @_impure_ptr, align 4, !dbg !357
  %29 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 1, !dbg !357
  %30 = load i32* %29, align 4, !dbg !357
  %31 = and i32 %30, 255
  %32 = tail call i32 @__swbuf_r(%struct._reent* %28, i32 %31, %struct.__FILE* %9) nounwind, !dbg !357
  br label %bb9, !dbg !357

bb8:                                              ; preds = %bb
  %33 = getelementptr inbounds %struct.__FILE* %9, i32 0, i32 0, !dbg !357
  %34 = load i8** %33, align 4, !dbg !357
  %35 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 1, !dbg !357
  %36 = load i32* %35, align 4, !dbg !357
  %37 = trunc i32 %36 to i8, !dbg !357
  store i8 %37, i8* %34, align 1, !dbg !357
  %38 = load %struct.__FILE** %3, align 4, !dbg !357
  %39 = getelementptr inbounds %struct.__FILE* %38, i32 0, i32 0, !dbg !357
  %40 = load i8** %39, align 4, !dbg !357
  %41 = getelementptr inbounds i8* %40, i32 1, !dbg !357
  store i8* %41, i8** %39, align 4, !dbg !357
  br label %bb11, !dbg !357

bb9:                                              ; preds = %bb6, %bb4
  %iftmp.9.0 = phi i32 [ %32, %bb6 ], [ %27, %bb4 ]
  tail call void @llvm.dbg.value(metadata !{i32 %iftmp.9.0}, i64 0, metadata !290), !dbg !357
  %42 = icmp eq i32 %iftmp.9.0, -1, !dbg !358
  br i1 %42, label %bb10, label %bb9.bb11_crit_edge, !dbg !358

bb9.bb11_crit_edge:                               ; preds = %bb9
  %.pre = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 1, !dbg !359
  br label %bb11

bb10:                                             ; preds = %bb9
  %43 = load %struct._reent** @_impure_ptr, align 4, !dbg !360
  %44 = getelementptr inbounds %struct._reent* %43, i32 0, i32 3, !dbg !360
  %45 = load %struct.__FILE** %44, align 4, !dbg !360
  %46 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %45, i8* getelementptr inbounds ([54 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @inFileName, i32 0, i32 0)) nounwind, !dbg !360
  tail call void @perror(i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !362
  %47 = load %struct._reent** @_impure_ptr, align 4, !dbg !363
  %48 = getelementptr inbounds %struct._reent* %47, i32 0, i32 3, !dbg !363
  %49 = load %struct.__FILE** %48, align 4, !dbg !363
  %50 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %49, i8* getelementptr inbounds ([48 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !363
  tail call void @exit(i32 1) noreturn nounwind, !dbg !364
  unreachable, !dbg !364

bb11:                                             ; preds = %bb9.bb11_crit_edge, %bb3, %bb8
  %.pre-phi = phi i32* [ %.pre, %bb9.bb11_crit_edge ], [ %17, %bb3 ], [ %35, %bb8 ]
  %51 = load i64* @bytesOut, align 8, !dbg !365
  %52 = add i64 %51, 1, !dbg !365
  store i64 %52, i64* @bytesOut, align 8, !dbg !365
  store i32 1, i32* %0, align 4, !dbg !366
  %53 = and i32 %bit, 1, !dbg !359
  store i32 %53, i32* %.pre-phi, align 4, !dbg !359
  ret void, !dbg !367

bb12:                                             ; preds = %entry
  %54 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 1, !dbg !368
  %55 = load i32* %54, align 4, !dbg !368
  %56 = shl i32 %55, 1, !dbg !368
  %57 = and i32 %bit, 1, !dbg !368
  %58 = or i32 %56, %57, !dbg !368
  store i32 %58, i32* %54, align 4, !dbg !368
  %59 = add nsw i32 %1, 1, !dbg !369
  store i32 %59, i32* %0, align 4, !dbg !369
  ret void, !dbg !367
}

declare i32 @__swbuf_r(%struct._reent*, i32, %struct.__FILE*)

define internal fastcc void @bsClose(%struct.BitStream* %bs) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{%struct.BitStream* %bs}, i64 0, metadata !317), !dbg !370
  %0 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 3, !dbg !371
  %1 = load i8* %0, align 4, !dbg !371
  %2 = icmp eq i8 %1, 119, !dbg !371
  br i1 %2, label %bb1.preheader, label %entry.bb15_crit_edge, !dbg !371

entry.bb15_crit_edge:                             ; preds = %entry
  %.pre = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 0, !dbg !372
  br label %bb15

bb1.preheader:                                    ; preds = %entry
  %3 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 2, !dbg !373
  %4 = load i32* %3, align 4, !dbg !373
  %5 = icmp slt i32 %4, 8
  br i1 %5, label %bb.lr.ph, label %bb2, !dbg !373

bb.lr.ph:                                         ; preds = %bb1.preheader
  %6 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 1, !dbg !374
  %.promoted22 = load i32* %6, align 4
  %tmp = sub i32 8, %4
  br label %bb

bb:                                               ; preds = %bb, %bb.lr.ph
  %indvar = phi i32 [ 0, %bb.lr.ph ], [ %indvar.next, %bb ]
  %7 = phi i32 [ %.promoted22, %bb.lr.ph ], [ %8, %bb ]
  %8 = shl i32 %7, 1, !dbg !374
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, %tmp
  br i1 %exitcond, label %bb1.bb2_crit_edge, label %bb, !dbg !373

bb1.bb2_crit_edge:                                ; preds = %bb
  store i32 %8, i32* %6, align 4
  store i32 8, i32* %3, align 4
  br label %bb2

bb2:                                              ; preds = %bb1.bb2_crit_edge, %bb1.preheader
  %9 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 0, !dbg !375
  %10 = load %struct.__FILE** %9, align 4, !dbg !375
  %11 = getelementptr inbounds %struct.__FILE* %10, i32 0, i32 2, !dbg !375
  %12 = load i32* %11, align 4, !dbg !375
  %13 = add nsw i32 %12, -1
  store i32 %13, i32* %11, align 4, !dbg !375
  %14 = icmp slt i32 %13, 0, !dbg !375
  %15 = load %struct.__FILE** %9, align 4, !dbg !375
  br i1 %14, label %bb3, label %bb10, !dbg !375

bb3:                                              ; preds = %bb2
  %16 = getelementptr inbounds %struct.__FILE* %15, i32 0, i32 2, !dbg !375
  %17 = load i32* %16, align 4, !dbg !375
  %18 = getelementptr inbounds %struct.__FILE* %15, i32 0, i32 6, !dbg !375
  %19 = load i32* %18, align 4, !dbg !375
  %20 = icmp slt i32 %17, %19, !dbg !375
  br i1 %20, label %bb8, label %bb4, !dbg !375

bb4:                                              ; preds = %bb3
  %21 = getelementptr inbounds %struct.__FILE* %15, i32 0, i32 0, !dbg !375
  %22 = load i8** %21, align 4, !dbg !375
  %23 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 1, !dbg !375
  %24 = load i32* %23, align 4, !dbg !375
  %25 = trunc i32 %24 to i8, !dbg !375
  store i8 %25, i8* %22, align 1, !dbg !375
  %26 = load %struct.__FILE** %9, align 4, !dbg !375
  %27 = getelementptr inbounds %struct.__FILE* %26, i32 0, i32 0, !dbg !375
  %28 = load i8** %27, align 4, !dbg !375
  %29 = load i8* %28, align 1, !dbg !375
  %30 = icmp eq i8 %29, 10, !dbg !375
  br i1 %30, label %bb6, label %bb5, !dbg !375

bb5:                                              ; preds = %bb4
  %31 = getelementptr inbounds i8* %28, i32 1, !dbg !375
  store i8* %31, i8** %27, align 4, !dbg !375
  br label %bb13, !dbg !375

bb6:                                              ; preds = %bb4
  %32 = load %struct._reent** @_impure_ptr, align 4, !dbg !375
  %33 = tail call i32 @__swbuf_r(%struct._reent* %32, i32 10, %struct.__FILE* %26) nounwind, !dbg !375
  br label %bb11, !dbg !375

bb8:                                              ; preds = %bb3
  %34 = load %struct._reent** @_impure_ptr, align 4, !dbg !375
  %35 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 1, !dbg !375
  %36 = load i32* %35, align 4, !dbg !375
  %37 = and i32 %36, 255
  %38 = tail call i32 @__swbuf_r(%struct._reent* %34, i32 %37, %struct.__FILE* %15) nounwind, !dbg !375
  br label %bb11, !dbg !375

bb10:                                             ; preds = %bb2
  %39 = getelementptr inbounds %struct.__FILE* %15, i32 0, i32 0, !dbg !375
  %40 = load i8** %39, align 4, !dbg !375
  %41 = getelementptr inbounds %struct.BitStream* %bs, i32 0, i32 1, !dbg !375
  %42 = load i32* %41, align 4, !dbg !375
  %43 = trunc i32 %42 to i8, !dbg !375
  store i8 %43, i8* %40, align 1, !dbg !375
  %44 = load %struct.__FILE** %9, align 4, !dbg !375
  %45 = getelementptr inbounds %struct.__FILE* %44, i32 0, i32 0, !dbg !375
  %46 = load i8** %45, align 4, !dbg !375
  %47 = getelementptr inbounds i8* %46, i32 1, !dbg !375
  store i8* %47, i8** %45, align 4, !dbg !375
  br label %bb13, !dbg !375

bb11:                                             ; preds = %bb8, %bb6
  %iftmp.17.0 = phi i32 [ %38, %bb8 ], [ %33, %bb6 ]
  tail call void @llvm.dbg.value(metadata !{i32 %iftmp.17.0}, i64 0, metadata !318), !dbg !375
  %48 = icmp eq i32 %iftmp.17.0, -1, !dbg !376
  br i1 %48, label %bb12, label %bb13, !dbg !376

bb12:                                             ; preds = %bb11
  %49 = load %struct._reent** @_impure_ptr, align 4, !dbg !377
  %50 = getelementptr inbounds %struct._reent* %49, i32 0, i32 3, !dbg !377
  %51 = load %struct.__FILE** %50, align 4, !dbg !377
  %52 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %51, i8* getelementptr inbounds ([54 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @inFileName, i32 0, i32 0)) nounwind, !dbg !377
  tail call void @perror(i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !378
  %53 = load %struct._reent** @_impure_ptr, align 4, !dbg !379
  %54 = getelementptr inbounds %struct._reent* %53, i32 0, i32 3, !dbg !379
  %55 = load %struct.__FILE** %54, align 4, !dbg !379
  %56 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %55, i8* getelementptr inbounds ([48 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !379
  tail call void @exit(i32 1) noreturn nounwind, !dbg !380
  unreachable, !dbg !380

bb13:                                             ; preds = %bb5, %bb10, %bb11
  %57 = load i64* @bytesOut, align 8, !dbg !381
  %58 = add i64 %57, 1, !dbg !381
  store i64 %58, i64* @bytesOut, align 8, !dbg !381
  %59 = load %struct.__FILE** %9, align 4, !dbg !382
  %60 = tail call i32 @fflush(%struct.__FILE* %59) nounwind, !dbg !382
  tail call void @llvm.dbg.value(metadata !{i32 %60}, i64 0, metadata !318), !dbg !382
  %61 = icmp eq i32 %60, -1, !dbg !383
  br i1 %61, label %bb14, label %bb15, !dbg !383

bb14:                                             ; preds = %bb13
  %62 = load %struct._reent** @_impure_ptr, align 4, !dbg !384
  %63 = getelementptr inbounds %struct._reent* %62, i32 0, i32 3, !dbg !384
  %64 = load %struct.__FILE** %63, align 4, !dbg !384
  %65 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %64, i8* getelementptr inbounds ([54 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @inFileName, i32 0, i32 0)) nounwind, !dbg !384
  tail call void @perror(i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !385
  %66 = load %struct._reent** @_impure_ptr, align 4, !dbg !386
  %67 = getelementptr inbounds %struct._reent* %66, i32 0, i32 3, !dbg !386
  %68 = load %struct.__FILE** %67, align 4, !dbg !386
  %69 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %68, i8* getelementptr inbounds ([48 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !386
  tail call void @exit(i32 1) noreturn nounwind, !dbg !387
  unreachable, !dbg !387

bb15:                                             ; preds = %entry.bb15_crit_edge, %bb13
  %.pre-phi = phi %struct.__FILE** [ %.pre, %entry.bb15_crit_edge ], [ %9, %bb13 ]
  %70 = load %struct.__FILE** %.pre-phi, align 4, !dbg !372
  %71 = tail call i32 @fclose(%struct.__FILE* %70) nounwind, !dbg !372
  tail call void @llvm.dbg.value(metadata !{i32 %71}, i64 0, metadata !318), !dbg !372
  %72 = icmp eq i32 %71, -1, !dbg !388
  br i1 %72, label %bb16, label %bb19, !dbg !388

bb16:                                             ; preds = %bb15
  %73 = load %struct._reent** @_impure_ptr, align 4, !dbg !389
  %74 = getelementptr inbounds %struct._reent* %73, i32 0, i32 3, !dbg !389
  %75 = load %struct.__FILE** %74, align 4, !dbg !389
  %76 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %75, i8* getelementptr inbounds ([54 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @inFileName, i32 0, i32 0)) nounwind, !dbg !389
  tail call void @perror(i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !391
  %77 = load %struct._reent** @_impure_ptr, align 4, !dbg !392
  %78 = getelementptr inbounds %struct._reent* %77, i32 0, i32 3, !dbg !392
  %79 = load %struct.__FILE** %78, align 4, !dbg !392
  %80 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %79, i8* getelementptr inbounds ([48 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !392
  tail call void @exit(i32 1) noreturn nounwind, !dbg !393
  unreachable, !dbg !393

bb19:                                             ; preds = %bb15
  %81 = bitcast %struct.BitStream* %bs to i8*, !dbg !394
  tail call void @free(i8* %81) nounwind, !dbg !394
  ret void, !dbg !395
}

declare i32 @fflush(%struct.__FILE* nocapture) nounwind

declare i32 @fclose(%struct.__FILE* nocapture) nounwind

declare void @free(i8* nocapture) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !320), !dbg !396
  tail call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !321), !dbg !396
  %0 = load i8** %argv, align 4, !dbg !397
  %1 = tail call i8* @strcpy(i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0), i8* %0) nounwind, !dbg !397
  store i8 0, i8* getelementptr inbounds ([2000 x i8]* @outFileName, i32 0, i32 0), align 1, !dbg !398
  store i8 0, i8* getelementptr inbounds ([2000 x i8]* @inFileName, i32 0, i32 0), align 1, !dbg !398
  %2 = load %struct._reent** @_impure_ptr, align 4, !dbg !399
  %3 = getelementptr inbounds %struct._reent* %2, i32 0, i32 3, !dbg !399
  %4 = load %struct.__FILE** %3, align 4, !dbg !399
  %5 = bitcast %struct.__FILE* %4 to i8*, !dbg !399
  %6 = tail call i32 @fwrite(i8* getelementptr inbounds ([62 x i8]* @.str6, i32 0, i32 0), i32 1, i32 61, i8* %5) nounwind, !dbg !399
  %7 = icmp eq i32 %argc, 2, !dbg !400
  br i1 %7, label %bb1, label %bb, !dbg !400

bb:                                               ; preds = %entry
  %8 = load %struct._reent** @_impure_ptr, align 4, !dbg !401
  %9 = getelementptr inbounds %struct._reent* %8, i32 0, i32 3, !dbg !401
  %10 = load %struct.__FILE** %9, align 4, !dbg !401
  %11 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %10, i8* getelementptr inbounds ([38 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !401
  %12 = load %struct._reent** @_impure_ptr, align 4, !dbg !402
  %13 = getelementptr inbounds %struct._reent* %12, i32 0, i32 3, !dbg !402
  %14 = load %struct.__FILE** %13, align 4, !dbg !402
  %15 = bitcast %struct.__FILE* %14 to i8*, !dbg !402
  %16 = tail call i32 @fwrite(i8* getelementptr inbounds ([47 x i8]* @.str8, i32 0, i32 0), i32 1, i32 46, i8* %15) nounwind, !dbg !402
  tail call void @exit(i32 1) noreturn nounwind, !dbg !403
  unreachable, !dbg !403

bb1:                                              ; preds = %entry
  %17 = getelementptr inbounds i8** %argv, i32 1, !dbg !404
  %18 = load i8** %17, align 4, !dbg !404
  %19 = tail call i32 @strlen(i8* %18) nounwind readonly, !dbg !404
  %20 = icmp ugt i32 %19, 1979, !dbg !404
  br i1 %20, label %bb2, label %bb3, !dbg !404

bb2:                                              ; preds = %bb1
  %21 = load %struct._reent** @_impure_ptr, align 4, !dbg !405
  %22 = getelementptr inbounds %struct._reent* %21, i32 0, i32 3, !dbg !405
  %23 = load %struct.__FILE** %22, align 4, !dbg !405
  %24 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %23, i8* getelementptr inbounds ([65 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0), i32 %19) nounwind, !dbg !405
  tail call void @exit(i32 1) noreturn nounwind, !dbg !406
  unreachable, !dbg !406

bb3:                                              ; preds = %bb1
  %25 = tail call i8* @strcpy(i8* getelementptr inbounds ([2000 x i8]* @inFileName, i32 0, i32 0), i8* %18) nounwind, !dbg !407
  %26 = tail call %struct.__FILE* @fopen(i8* getelementptr inbounds ([2000 x i8]* @inFileName, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str10, i32 0, i32 0)) nounwind, !dbg !408
  tail call void @llvm.dbg.value(metadata !{%struct.__FILE* %26}, i64 0, metadata !322), !dbg !408
  %27 = icmp eq %struct.__FILE* %26, null, !dbg !409
  br i1 %27, label %bb4, label %bb5, !dbg !409

bb4:                                              ; preds = %bb3
  %28 = load %struct._reent** @_impure_ptr, align 4, !dbg !410
  %29 = getelementptr inbounds %struct._reent* %28, i32 0, i32 3, !dbg !410
  %30 = load %struct.__FILE** %29, align 4, !dbg !410
  %31 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %30, i8* getelementptr inbounds ([21 x i8]* @.str11, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @inFileName, i32 0, i32 0)) nounwind, !dbg !410
  tail call void @exit(i32 1) noreturn nounwind, !dbg !411
  unreachable, !dbg !411

bb5:                                              ; preds = %bb3
  tail call void @llvm.dbg.value(metadata !{%struct.__FILE* %26}, i64 0, metadata !278) nounwind, !dbg !412
  %32 = tail call noalias i8* @malloc(i32 16) nounwind, !dbg !414
  tail call void @llvm.dbg.value(metadata !183, i64 0, metadata !279) nounwind, !dbg !414
  %33 = icmp eq i8* %32, null
  br i1 %33, label %bb.i, label %bsOpenReadStream.exit, !dbg !415

bb.i:                                             ; preds = %bb5
  tail call void @llvm.dbg.value(metadata !416, i64 0, metadata !274) nounwind, !dbg !417
  %34 = load %struct._reent** @_impure_ptr, align 4, !dbg !418
  %35 = getelementptr inbounds %struct._reent* %34, i32 0, i32 3, !dbg !418
  %36 = load %struct.__FILE** %35, align 4, !dbg !418
  %37 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %36, i8* getelementptr inbounds ([44 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0), i32 16) nounwind, !dbg !418
  %38 = load %struct._reent** @_impure_ptr, align 4, !dbg !420
  %39 = getelementptr inbounds %struct._reent* %38, i32 0, i32 3, !dbg !420
  %40 = load %struct.__FILE** %39, align 4, !dbg !420
  %41 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %40, i8* getelementptr inbounds ([48 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !420
  tail call void @exit(i32 1) noreturn nounwind, !dbg !421
  unreachable, !dbg !421

bsOpenReadStream.exit:                            ; preds = %bb5
  %42 = bitcast i8* %32 to %struct.BitStream*, !dbg !414
  %43 = bitcast i8* %32 to %struct.__FILE**
  store %struct.__FILE* %26, %struct.__FILE** %43, align 4, !dbg !422
  %44 = getelementptr inbounds i8* %32, i32 4
  %45 = bitcast i8* %44 to i32*
  store i32 0, i32* %45, align 4, !dbg !423
  %46 = getelementptr inbounds i8* %32, i32 8
  %47 = bitcast i8* %46 to i32*
  store i32 0, i32* %47, align 4, !dbg !424
  %48 = getelementptr inbounds i8* %32, i32 12
  store i8 114, i8* %48, align 4, !dbg !425
  tail call void @llvm.dbg.value(metadata !{%struct.BitStream* %42}, i64 0, metadata !325), !dbg !413
  %49 = load %struct._reent** @_impure_ptr, align 4, !dbg !426
  %50 = getelementptr inbounds %struct._reent* %49, i32 0, i32 3, !dbg !426
  %51 = load %struct.__FILE** %50, align 4, !dbg !426
  %52 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %51, i8* getelementptr inbounds ([40 x i8]* @.str12, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !426
  tail call void @llvm.dbg.value(metadata !427, i64 0, metadata !331), !dbg !428
  tail call void @llvm.dbg.value(metadata !429, i64 0, metadata !333), !dbg !430
  tail call void @llvm.dbg.value(metadata !429, i64 0, metadata !332), !dbg !430
  tail call void @llvm.dbg.value(metadata !429, i64 0, metadata !329), !dbg !431
  store i64 0, i64* getelementptr inbounds ([50000 x i64]* @bStart, i32 0, i32 0), align 8, !dbg !432
  tail call void @llvm.dbg.value(metadata !429, i64 0, metadata !330), !dbg !433
  br label %bb6.outer, !dbg !433

bb6.outer:                                        ; preds = %bb27, %bsOpenReadStream.exit
  %buffLo.0.ph = phi i32 [ 0, %bsOpenReadStream.exit ], [ %70, %bb27 ]
  %buffHi.0.ph = phi i32 [ 0, %bsOpenReadStream.exit ], [ %67, %bb27 ]
  %bitsRead.0.ph = phi i64 [ 0, %bsOpenReadStream.exit ], [ %tmp140, %bb27 ]
  %rbCtr.0.ph = phi i32 [ 0, %bsOpenReadStream.exit ], [ %rbCtr.169, %bb27 ]
  %53 = phi i32 [ 0, %bsOpenReadStream.exit ], [ %tmp145, %bb27 ]
  %scevgep143 = getelementptr [50000 x i64]* @bEnd, i32 0, i32 %53
  %scevgep144 = getelementptr [50000 x i64]* @bStart, i32 0, i32 %53
  %tmp145 = add i32 %53, 1
  %scevgep146 = getelementptr [50000 x i64]* @bStart, i32 0, i32 %tmp145
  %tmp139 = add i64 %bitsRead.0.ph, 1
  br label %bb6

bb6:                                              ; preds = %bb6.outer, %bb15
  %indvar136 = phi i64 [ 0, %bb6.outer ], [ %indvar.next137, %bb15 ]
  %buffLo.0 = phi i32 [ %buffLo.0.ph, %bb6.outer ], [ %70, %bb15 ]
  %buffHi.0 = phi i32 [ %buffHi.0.ph, %bb6.outer ], [ %67, %bb15 ]
  %bitsRead.0 = add i64 %bitsRead.0.ph, %indvar136
  %tmp140 = add i64 %tmp139, %indvar136
  %54 = tail call fastcc i32 @bsGetBit(%struct.BitStream* %42) nounwind, !dbg !434
  %55 = icmp eq i32 %54, 2, !dbg !435
  br i1 %55, label %bb7, label %bb12, !dbg !435

bb7:                                              ; preds = %bb6
  tail call void @llvm.dbg.value(metadata !{i32 %54}, i64 0, metadata !327), !dbg !434
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !331), !dbg !436
  %56 = load i64* %scevgep144, align 8, !dbg !437
  %57 = icmp ugt i64 %56, %tmp140, !dbg !437
  %58 = sub i64 %tmp140, %56, !dbg !437
  %59 = icmp ult i64 %58, 40
  %or.cond = or i1 %57, %59
  br i1 %or.cond, label %bb28, label %bb9, !dbg !437

bb9:                                              ; preds = %bb7
  store i64 %bitsRead.0, i64* %scevgep143, align 8, !dbg !438
  %60 = icmp sgt i32 %53, 0, !dbg !439
  br i1 %60, label %bb10, label %bb28, !dbg !439

bb10:                                             ; preds = %bb9
  %61 = load %struct._reent** @_impure_ptr, align 4, !dbg !440
  %62 = getelementptr inbounds %struct._reent* %61, i32 0, i32 3, !dbg !440
  %63 = load %struct.__FILE** %62, align 4, !dbg !440
  %64 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %63, i8* getelementptr inbounds ([47 x i8]* @.str13, i32 0, i32 0), i32 %53, i64 %56, i64 %bitsRead.0) nounwind, !dbg !440
  br label %bb28, !dbg !440

bb12:                                             ; preds = %bb6
  %65 = shl i32 %buffHi.0, 1, !dbg !441
  %66 = lshr i32 %buffLo.0, 31, !dbg !441
  %67 = or i32 %65, %66, !dbg !441
  %68 = shl i32 %buffLo.0, 1, !dbg !442
  %69 = and i32 %54, 1, !dbg !442
  %70 = or i32 %69, %68, !dbg !442
  %71 = and i32 %67, 65535, !dbg !443
  %72 = icmp eq i32 %71, 12609, !dbg !443
  %73 = icmp eq i32 %70, 1495683929, !dbg !443
  %74 = and i1 %72, %73, !dbg !443
  br i1 %74, label %bb19, label %bb15, !dbg !443

bb15:                                             ; preds = %bb12
  %75 = icmp eq i32 %71, 6002, !dbg !443
  %76 = icmp eq i32 %70, 1161318544, !dbg !443
  %77 = and i1 %75, %76, !dbg !443
  %indvar.next137 = add i64 %indvar136, 1
  br i1 %77, label %bb19, label %bb6, !dbg !443

bb19:                                             ; preds = %bb15, %bb12
  %78 = add i64 %bitsRead.0, -48
  %79 = icmp ugt i64 %tmp140, 49, !dbg !444
  %. = select i1 %79, i64 %78, i64 0
  store i64 %., i64* %scevgep143, align 8
  %80 = icmp sgt i32 %53, 0, !dbg !445
  br i1 %80, label %bb23, label %bb27, !dbg !445

bb23:                                             ; preds = %bb19
  %81 = load i64* %scevgep144, align 8, !dbg !445
  %82 = sub i64 %., %81, !dbg !445
  %83 = icmp ugt i64 %82, 129, !dbg !445
  br i1 %83, label %bb24, label %bb25, !dbg !445

bb24:                                             ; preds = %bb23
  %84 = load %struct._reent** @_impure_ptr, align 4, !dbg !446
  %85 = getelementptr inbounds %struct._reent* %84, i32 0, i32 3, !dbg !446
  %86 = load %struct.__FILE** %85, align 4, !dbg !446
  %87 = add nsw i32 %rbCtr.0.ph, 1, !dbg !446
  %88 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %86, i8* getelementptr inbounds ([34 x i8]* @.str14, i32 0, i32 0), i32 %87, i64 %81, i64 %.) nounwind, !dbg !446
  %89 = load i64* %scevgep144, align 8, !dbg !447
  %90 = getelementptr inbounds [50000 x i64]* @rbStart, i32 0, i32 %rbCtr.0.ph, !dbg !447
  store i64 %89, i64* %90, align 8, !dbg !447
  %91 = load i64* %scevgep143, align 8, !dbg !448
  %92 = getelementptr inbounds [50000 x i64]* @rbEnd, i32 0, i32 %rbCtr.0.ph, !dbg !448
  store i64 %91, i64* %92, align 8, !dbg !448
  br label %bb25, !dbg !449

bb25:                                             ; preds = %bb24, %bb23
  %rbCtr.1 = phi i32 [ %87, %bb24 ], [ %rbCtr.0.ph, %bb23 ]
  %93 = icmp sgt i32 %53, 49999, !dbg !450
  br i1 %93, label %bb26, label %bb27, !dbg !450

bb26:                                             ; preds = %bb25
  tail call void @llvm.dbg.value(metadata !{i32 %54}, i64 0, metadata !327), !dbg !434
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !331), !dbg !436
  tail call void @llvm.dbg.value(metadata !{i32 %67}, i64 0, metadata !332), !dbg !441
  tail call void @llvm.dbg.value(metadata !{i32 %70}, i64 0, metadata !333), !dbg !442
  tail call void @llvm.dbg.value(metadata !451, i64 0, metadata !273) nounwind, !dbg !452
  %94 = load %struct._reent** @_impure_ptr, align 4, !dbg !454
  %95 = getelementptr inbounds %struct._reent* %94, i32 0, i32 3, !dbg !454
  %96 = load %struct.__FILE** %95, align 4, !dbg !454
  %97 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %96, i8* getelementptr inbounds ([49 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @inFileName, i32 0, i32 0), i32 50000) nounwind, !dbg !454
  %98 = load %struct._reent** @_impure_ptr, align 4, !dbg !456
  %99 = getelementptr inbounds %struct._reent* %98, i32 0, i32 3, !dbg !456
  %100 = load %struct.__FILE** %99, align 4, !dbg !456
  %101 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %100, i8* getelementptr inbounds ([46 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !456
  %102 = load %struct._reent** @_impure_ptr, align 4, !dbg !457
  %103 = getelementptr inbounds %struct._reent* %102, i32 0, i32 3, !dbg !457
  %104 = load %struct.__FILE** %103, align 4, !dbg !457
  %105 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %104, i8* getelementptr inbounds ([61 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !457
  tail call void @exit(i32 1) noreturn nounwind, !dbg !458
  unreachable, !dbg !458

bb27:                                             ; preds = %bb19, %bb25
  %rbCtr.169 = phi i32 [ %rbCtr.1, %bb25 ], [ %rbCtr.0.ph, %bb19 ]
  store i64 %tmp140, i64* %scevgep146, align 8, !dbg !459
  br label %bb6.outer, !dbg !459

bb28:                                             ; preds = %bb7, %bb10, %bb9
  tail call fastcc void @bsClose(%struct.BitStream* %42) nounwind, !dbg !460
  %106 = icmp slt i32 %rbCtr.0.ph, 1
  %107 = load %struct._reent** @_impure_ptr, align 4, !dbg !461
  %108 = getelementptr inbounds %struct._reent* %107, i32 0, i32 3, !dbg !461
  %109 = load %struct.__FILE** %108, align 4, !dbg !461
  br i1 %106, label %bb29, label %bb30, !dbg !462

bb29:                                             ; preds = %bb28
  %110 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %109, i8* getelementptr inbounds ([50 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !461
  tail call void @exit(i32 1) noreturn nounwind, !dbg !463
  unreachable, !dbg !463

bb30:                                             ; preds = %bb28
  %111 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %109, i8* getelementptr inbounds ([27 x i8]* @.str16, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !464
  %112 = tail call %struct.__FILE* @fopen(i8* getelementptr inbounds ([2000 x i8]* @inFileName, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str10, i32 0, i32 0)) nounwind, !dbg !465
  tail call void @llvm.dbg.value(metadata !{%struct.__FILE* %112}, i64 0, metadata !322), !dbg !465
  %113 = icmp eq %struct.__FILE* %112, null, !dbg !466
  br i1 %113, label %bb31, label %bb32, !dbg !466

bb31:                                             ; preds = %bb30
  %114 = load %struct._reent** @_impure_ptr, align 4, !dbg !467
  %115 = getelementptr inbounds %struct._reent* %114, i32 0, i32 3, !dbg !467
  %116 = load %struct.__FILE** %115, align 4, !dbg !467
  %117 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %116, i8* getelementptr inbounds ([21 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @inFileName, i32 0, i32 0)) nounwind, !dbg !467
  tail call void @exit(i32 1) noreturn nounwind, !dbg !468
  unreachable, !dbg !468

bb32:                                             ; preds = %bb30
  tail call void @llvm.dbg.value(metadata !{%struct.__FILE* %112}, i64 0, metadata !278) nounwind, !dbg !469
  %118 = tail call noalias i8* @malloc(i32 16) nounwind, !dbg !471
  tail call void @llvm.dbg.value(metadata !183, i64 0, metadata !279) nounwind, !dbg !471
  %119 = icmp eq i8* %118, null
  br i1 %119, label %bb.i64, label %bsOpenReadStream.exit65, !dbg !472

bb.i64:                                           ; preds = %bb32
  tail call void @llvm.dbg.value(metadata !416, i64 0, metadata !274) nounwind, !dbg !473
  %120 = load %struct._reent** @_impure_ptr, align 4, !dbg !474
  %121 = getelementptr inbounds %struct._reent* %120, i32 0, i32 3, !dbg !474
  %122 = load %struct.__FILE** %121, align 4, !dbg !474
  %123 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %122, i8* getelementptr inbounds ([44 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0), i32 16) nounwind, !dbg !474
  %124 = load %struct._reent** @_impure_ptr, align 4, !dbg !475
  %125 = getelementptr inbounds %struct._reent* %124, i32 0, i32 3, !dbg !475
  %126 = load %struct.__FILE** %125, align 4, !dbg !475
  %127 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %126, i8* getelementptr inbounds ([48 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !475
  tail call void @exit(i32 1) noreturn nounwind, !dbg !476
  unreachable, !dbg !476

bsOpenReadStream.exit65:                          ; preds = %bb32
  %128 = bitcast i8* %118 to %struct.BitStream*, !dbg !471
  %129 = bitcast i8* %118 to %struct.__FILE**
  store %struct.__FILE* %112, %struct.__FILE** %129, align 4, !dbg !477
  %130 = getelementptr inbounds i8* %118, i32 4
  %131 = bitcast i8* %130 to i32*
  store i32 0, i32* %131, align 4, !dbg !478
  %132 = getelementptr inbounds i8* %118, i32 8
  %133 = bitcast i8* %132 to i32*
  store i32 0, i32* %133, align 4, !dbg !479
  %134 = getelementptr inbounds i8* %118, i32 12
  store i8 114, i8* %134, align 4, !dbg !480
  tail call void @llvm.dbg.value(metadata !{%struct.BitStream* %128}, i64 0, metadata !325), !dbg !470
  tail call void @llvm.dbg.value(metadata !429, i64 0, metadata !334), !dbg !481
  tail call void @llvm.dbg.value(metadata !482, i64 0, metadata !326), !dbg !481
  tail call void @llvm.dbg.value(metadata !427, i64 0, metadata !331), !dbg !483
  tail call void @llvm.dbg.value(metadata !484, i64 0, metadata !324), !dbg !485
  tail call void @llvm.dbg.value(metadata !429, i64 0, metadata !328), !dbg !486
  br label %bb33.outer, !dbg !486

bb33.outer:                                       ; preds = %bb43, %bsOpenReadStream.exit65
  %buffLo.1.ph = phi i32 [ %buffLo.0, %bsOpenReadStream.exit65 ], [ %144, %bb43 ]
  %buffHi.1.ph = phi i32 [ %buffHi.0, %bsOpenReadStream.exit65 ], [ %141, %bb43 ]
  %bitsRead.1.ph = phi i64 [ 0, %bsOpenReadStream.exit65 ], [ %tmp115, %bb43 ]
  %135 = phi i32 [ 0, %bsOpenReadStream.exit65 ], [ %tmp128, %bb43 ]
  %bsWr.0.ph = phi %struct.BitStream* [ null, %bsOpenReadStream.exit65 ], [ %bsWr.0.ph76, %bb43 ]
  %outFile.0.ph = phi %struct.__FILE* [ null, %bsOpenReadStream.exit65 ], [ %outFile.0.ph77, %bb43 ]
  %blockCRC.0.ph = phi i32 [ 0, %bsOpenReadStream.exit65 ], [ %blockCRC.1, %bb43 ]
  %scevgep = getelementptr [50000 x i64]* @rbStart, i32 0, i32 %135
  %scevgep127 = getelementptr [50000 x i64]* @rbEnd, i32 0, i32 %135
  %tmp128 = add i32 %135, 1
  br label %bb33.outer72

bb33.outer72:                                     ; preds = %bb33.outer, %bsOpenWriteStream.exit
  %buffLo.1.ph73 = phi i32 [ %144, %bsOpenWriteStream.exit ], [ %buffLo.1.ph, %bb33.outer ]
  %buffHi.1.ph74 = phi i32 [ %141, %bsOpenWriteStream.exit ], [ %buffHi.1.ph, %bb33.outer ]
  %bitsRead.1.ph75 = phi i64 [ %tmp115, %bsOpenWriteStream.exit ], [ %bitsRead.1.ph, %bb33.outer ]
  %bsWr.0.ph76 = phi %struct.BitStream* [ %211, %bsOpenWriteStream.exit ], [ %bsWr.0.ph, %bb33.outer ]
  %outFile.0.ph77 = phi %struct.__FILE* [ %195, %bsOpenWriteStream.exit ], [ %outFile.0.ph, %bb33.outer ]
  %blockCRC.0.ph78 = phi i32 [ %blockCRC.1, %bsOpenWriteStream.exit ], [ %blockCRC.0.ph, %bb33.outer ]
  %136 = icmp eq %struct.__FILE* %outFile.0.ph77, null, !dbg !487
  %tmp114 = add i64 %bitsRead.1.ph75, 1
  br label %bb33

bb33:                                             ; preds = %bb33.outer72, %bb45
  %indvar112 = phi i64 [ 0, %bb33.outer72 ], [ %indvar.next113, %bb45 ]
  %buffLo.1 = phi i32 [ %buffLo.1.ph73, %bb33.outer72 ], [ %144, %bb45 ]
  %buffHi.1 = phi i32 [ %buffHi.1.ph74, %bb33.outer72 ], [ %141, %bb45 ]
  %blockCRC.0 = phi i32 [ %blockCRC.0.ph78, %bb33.outer72 ], [ %blockCRC.1, %bb45 ]
  %tmp115 = add i64 %tmp114, %indvar112
  %bitsRead.1 = add i64 %bitsRead.1.ph75, %indvar112
  %137 = tail call fastcc i32 @bsGetBit(%struct.BitStream* %128) nounwind, !dbg !488
  %138 = icmp eq i32 %137, 2, !dbg !489
  br i1 %138, label %bb62, label %bb34, !dbg !489

bb34:                                             ; preds = %bb33
  %139 = shl i32 %buffHi.1, 1, !dbg !490
  %140 = lshr i32 %buffLo.1, 31, !dbg !490
  %141 = or i32 %139, %140, !dbg !490
  %142 = shl i32 %buffLo.1, 1, !dbg !491
  %143 = and i32 %137, 1, !dbg !491
  %144 = or i32 %143, %142, !dbg !491
  %145 = load i64* %scevgep, align 8, !dbg !492
  %146 = add i64 %145, 47, !dbg !492
  %147 = icmp eq i64 %146, %bitsRead.1, !dbg !492
  br i1 %147, label %bb35, label %bb36, !dbg !492

bb35:                                             ; preds = %bb34
  %148 = shl i32 %141, 16, !dbg !493
  %149 = lshr i32 %buffLo.1, 15
  %150 = and i32 %149, 65535
  %151 = or i32 %148, %150, !dbg !493
  br label %bb36, !dbg !493

bb36:                                             ; preds = %bb35, %bb34
  %blockCRC.1 = phi i32 [ %151, %bb35 ], [ %blockCRC.0, %bb34 ]
  %152 = icmp ugt i64 %145, %bitsRead.1, !dbg !487
  %or.cond147 = or i1 %136, %152
  br i1 %or.cond147, label %bb40, label %bb38, !dbg !487

bb38:                                             ; preds = %bb36
  %153 = load i64* %scevgep127, align 8, !dbg !487
  %154 = icmp ult i64 %153, %bitsRead.1, !dbg !487
  br i1 %154, label %bb40, label %bb39, !dbg !487

bb39:                                             ; preds = %bb38
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 %137) nounwind, !dbg !494
  br label %bb40, !dbg !494

bb40:                                             ; preds = %bb36, %bb38, %bb39
  %155 = load i64* %scevgep127, align 8, !dbg !495
  %156 = add i64 %155, 1, !dbg !495
  %157 = icmp eq i64 %156, %tmp115, !dbg !495
  br i1 %157, label %bb41, label %bb45, !dbg !495

bb41:                                             ; preds = %bb40
  br i1 %136, label %bb43, label %bb42, !dbg !496

bb42:                                             ; preds = %bb41
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !497
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !497
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !497
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !497
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !497
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !497
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !497
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !497
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !497
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !497
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !497
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !497
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !497
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !497
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !497
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !497
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !499
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !499
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !499
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !499
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !499
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !499
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !499
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !499
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !499
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !499
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !499
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !499
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !499
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !499
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !499
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !499
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !501
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !501
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !501
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !501
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !501
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !501
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !501
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !501
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !501
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !501
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !501
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 1) nounwind, !dbg !501
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !501
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !501
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !501
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 0) nounwind, !dbg !501
  br label %bb.i66

bb.i66:                                           ; preds = %bb.i66, %bb42
  %indvar.i = phi i32 [ 0, %bb42 ], [ %indvar.next.i, %bb.i66 ]
  %i.03.i = sub i32 31, %indvar.i
  %158 = lshr i32 %blockCRC.1, %i.03.i, !dbg !503
  %159 = and i32 %158, 1, !dbg !503
  tail call fastcc void @bsPutBit(%struct.BitStream* %bsWr.0.ph76, i32 %159) nounwind, !dbg !503
  %indvar.next.i = add i32 %indvar.i, 1
  %exitcond = icmp eq i32 %indvar.next.i, 32
  br i1 %exitcond, label %bsPutUInt32.exit, label %bb.i66, !dbg !505

bsPutUInt32.exit:                                 ; preds = %bb.i66
  tail call fastcc void @bsClose(%struct.BitStream* %bsWr.0.ph76) nounwind, !dbg !506
  br label %bb43, !dbg !506

bb43:                                             ; preds = %bb41, %bsPutUInt32.exit
  %160 = icmp slt i32 %135, %rbCtr.0.ph, !dbg !507
  br i1 %160, label %bb33.outer, label %bb62, !dbg !507

bb45:                                             ; preds = %bb40
  %161 = load i64* %scevgep, align 8, !dbg !508
  %162 = icmp eq i64 %161, %tmp115, !dbg !508
  %indvar.next113 = add i64 %indvar112, 1
  br i1 %162, label %bb48.preheader, label %bb33, !dbg !508

bb48.preheader:                                   ; preds = %bb45
  call void @llvm.memset.p0i8.i32(i8* getelementptr inbounds ([2000 x i8]* @outFileName, i32 0, i32 0), i8 0, i32 2000, i32 1, i1 false)
  %163 = tail call i8* @strcpy(i8* getelementptr inbounds ([2000 x i8]* @outFileName, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @inFileName, i32 0, i32 0)) nounwind, !dbg !509
  %164 = tail call i8* @strrchr(i8* getelementptr inbounds ([2000 x i8]* @outFileName, i32 0, i32 0), i32 47) nounwind readonly, !dbg !510
  %165 = icmp eq i8* %164, null, !dbg !511
  br i1 %165, label %bb52, label %bb51, !dbg !511

bb51:                                             ; preds = %bb48.preheader
  %166 = getelementptr inbounds i8* %164, i32 1, !dbg !512
  br label %bb52, !dbg !512

bb52:                                             ; preds = %bb48.preheader, %bb51
  %split.0 = phi i8* [ %166, %bb51 ], [ getelementptr inbounds ([2000 x i8]* @outFileName, i32 0, i32 0), %bb48.preheader ]
  %167 = ptrtoint i8* %split.0 to i32, !dbg !513
  %168 = tail call i32 (i8*, i8*, ...)* @sprintf(i8* %split.0, i8* getelementptr inbounds ([7 x i8]* @.str18, i32 0, i32 0), i32 %tmp128) nounwind, !dbg !514
  br label %bb56, !dbg !515

bb54:                                             ; preds = %bb56
  store i8 48, i8* %p.0, align 1, !dbg !515
  br label %bb55, !dbg !515

bb55:                                             ; preds = %bb56, %bb54
  %indvar.next = add i32 %indvar, 1
  br label %bb56, !dbg !515

bb56:                                             ; preds = %bb55, %bb52
  %indvar = phi i32 [ %indvar.next, %bb55 ], [ 0, %bb52 ]
  %p.0 = getelementptr i8* %split.0, i32 %indvar
  %169 = load i8* %p.0, align 1, !dbg !515
  switch i8 %169, label %bb55 [
    i8 0, label %bb57
    i8 32, label %bb54
  ]

bb57:                                             ; preds = %bb56
  %170 = sub nsw i32 %167, ptrtoint ([2000 x i8]* @outFileName to i32), !dbg !513
  %171 = getelementptr inbounds [2000 x i8]* @inFileName, i32 0, i32 %170
  %172 = tail call i8* @strcat(i8* getelementptr inbounds ([2000 x i8]* @outFileName, i32 0, i32 0), i8* %171) nounwind, !dbg !516
  %173 = tail call i32 @strlen(i8* getelementptr inbounds ([2000 x i8]* @outFileName, i32 0, i32 0)) nounwind readonly, !dbg !517
  %174 = icmp slt i32 %173, 5
  br i1 %174, label %bb58, label %bb1.i, !dbg !519

bb1.i:                                            ; preds = %bb57
  %175 = add nsw i32 %173, -4
  %176 = getelementptr inbounds [2000 x i8]* @outFileName, i32 0, i32 %175
  %177 = load i8* %176, align 1, !dbg !520
  %178 = icmp eq i8 %177, 46, !dbg !520
  br i1 %178, label %bb2.i, label %bb58, !dbg !520

bb2.i:                                            ; preds = %bb1.i
  %179 = add nsw i32 %173, -3
  %180 = getelementptr inbounds [2000 x i8]* @outFileName, i32 0, i32 %179
  %181 = load i8* %180, align 1, !dbg !520
  %182 = icmp eq i8 %181, 98, !dbg !520
  br i1 %182, label %bb3.i, label %bb58, !dbg !520

bb3.i:                                            ; preds = %bb2.i
  %183 = add nsw i32 %173, -2
  %184 = getelementptr inbounds [2000 x i8]* @outFileName, i32 0, i32 %183
  %185 = load i8* %184, align 1, !dbg !520
  %186 = icmp eq i8 %185, 122, !dbg !520
  br i1 %186, label %endsInBz2.exit, label %bb58, !dbg !520

endsInBz2.exit:                                   ; preds = %bb3.i
  %187 = add nsw i32 %173, -1
  %188 = getelementptr inbounds [2000 x i8]* @outFileName, i32 0, i32 %187
  %189 = load i8* %188, align 1, !dbg !520
  %190 = icmp eq i8 %189, 50, !dbg !520
  br i1 %190, label %bb59, label %bb58, !dbg !518

bb58:                                             ; preds = %endsInBz2.exit, %bb57, %bb1.i, %bb2.i, %bb3.i
  %strlen = tail call i32 @strlen(i8* getelementptr inbounds ([2000 x i8]* @outFileName, i32 0, i32 0))
  %endptr = getelementptr [2000 x i8]* @outFileName, i32 0, i32 %strlen
  tail call void @llvm.memcpy.p0i8.p0i8.i32(i8* %endptr, i8* getelementptr inbounds ([5 x i8]* @.str19, i32 0, i32 0), i32 5, i32 1, i1 false)
  br label %bb59, !dbg !518

bb59:                                             ; preds = %endsInBz2.exit, %bb58
  %191 = load %struct._reent** @_impure_ptr, align 4, !dbg !521
  %192 = getelementptr inbounds %struct._reent* %191, i32 0, i32 3, !dbg !521
  %193 = load %struct.__FILE** %192, align 4, !dbg !521
  %194 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %193, i8* getelementptr inbounds ([33 x i8]* @.str20, i32 0, i32 0), i32 %tmp128, i8* getelementptr inbounds ([2000 x i8]* @outFileName, i32 0, i32 0)) nounwind, !dbg !521
  %195 = tail call %struct.__FILE* @fopen(i8* getelementptr inbounds ([2000 x i8]* @outFileName, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str21, i32 0, i32 0)) nounwind, !dbg !522
  %196 = icmp eq %struct.__FILE* %195, null, !dbg !523
  br i1 %196, label %bb60, label %bb61, !dbg !523

bb60:                                             ; preds = %bb59
  tail call void @llvm.dbg.value(metadata !{i32 %137}, i64 0, metadata !327), !dbg !488
  tail call void @llvm.dbg.value(metadata !{i32 %141}, i64 0, metadata !332), !dbg !490
  tail call void @llvm.dbg.value(metadata !{i32 %144}, i64 0, metadata !333), !dbg !491
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !331), !dbg !524
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !339), !dbg !525
  tail call void @llvm.dbg.value(metadata !{i8* %164}, i64 0, metadata !336), !dbg !510
  tail call void @llvm.dbg.value(metadata !{i32 %170}, i64 0, metadata !338), !dbg !513
  tail call void @llvm.dbg.value(metadata !{i8* %split.0}, i64 0, metadata !335), !dbg !515
  tail call void @llvm.dbg.value(metadata !526, i64 0, metadata !275) nounwind, !dbg !527
  tail call void @llvm.dbg.value(metadata !{i32 %173}, i64 0, metadata !276) nounwind, !dbg !517
  tail call void @llvm.dbg.value(metadata !{%struct.__FILE* %195}, i64 0, metadata !324), !dbg !522
  %197 = load %struct._reent** @_impure_ptr, align 4, !dbg !528
  %198 = getelementptr inbounds %struct._reent* %197, i32 0, i32 3, !dbg !528
  %199 = load %struct.__FILE** %198, align 4, !dbg !528
  %200 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %199, i8* getelementptr inbounds ([22 x i8]* @.str22, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @outFileName, i32 0, i32 0)) nounwind, !dbg !528
  tail call void @exit(i32 1) noreturn nounwind, !dbg !529
  unreachable, !dbg !529

bb61:                                             ; preds = %bb59
  %201 = tail call noalias i8* @malloc(i32 16) nounwind, !dbg !530
  %202 = icmp eq i8* %201, null
  br i1 %202, label %bb.i67, label %bsOpenWriteStream.exit, !dbg !532

bb.i67:                                           ; preds = %bb61
  tail call void @llvm.dbg.value(metadata !{i32 %137}, i64 0, metadata !327), !dbg !488
  tail call void @llvm.dbg.value(metadata !{i32 %141}, i64 0, metadata !332), !dbg !490
  tail call void @llvm.dbg.value(metadata !{i32 %144}, i64 0, metadata !333), !dbg !491
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !331), !dbg !524
  tail call void @llvm.dbg.value(metadata !{null}, i64 0, metadata !339), !dbg !525
  tail call void @llvm.dbg.value(metadata !{i8* %164}, i64 0, metadata !336), !dbg !510
  tail call void @llvm.dbg.value(metadata !{i32 %170}, i64 0, metadata !338), !dbg !513
  tail call void @llvm.dbg.value(metadata !{i8* %split.0}, i64 0, metadata !335), !dbg !515
  tail call void @llvm.dbg.value(metadata !526, i64 0, metadata !275) nounwind, !dbg !527
  tail call void @llvm.dbg.value(metadata !{i32 %173}, i64 0, metadata !276) nounwind, !dbg !517
  tail call void @llvm.dbg.value(metadata !{%struct.__FILE* %195}, i64 0, metadata !324), !dbg !522
  tail call void @llvm.dbg.value(metadata !{%struct.__FILE* %195}, i64 0, metadata !281) nounwind, !dbg !533
  tail call void @llvm.dbg.value(metadata !183, i64 0, metadata !282) nounwind, !dbg !530
  tail call void @llvm.dbg.value(metadata !416, i64 0, metadata !274) nounwind, !dbg !534
  %203 = load %struct._reent** @_impure_ptr, align 4, !dbg !535
  %204 = getelementptr inbounds %struct._reent* %203, i32 0, i32 3, !dbg !535
  %205 = load %struct.__FILE** %204, align 4, !dbg !535
  %206 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %205, i8* getelementptr inbounds ([44 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0), i32 16) nounwind, !dbg !535
  %207 = load %struct._reent** @_impure_ptr, align 4, !dbg !536
  %208 = getelementptr inbounds %struct._reent* %207, i32 0, i32 3, !dbg !536
  %209 = load %struct.__FILE** %208, align 4, !dbg !536
  %210 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %209, i8* getelementptr inbounds ([48 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !536
  tail call void @exit(i32 1) noreturn nounwind, !dbg !537
  unreachable, !dbg !537

bsOpenWriteStream.exit:                           ; preds = %bb61
  %211 = bitcast i8* %201 to %struct.BitStream*, !dbg !530
  %212 = bitcast i8* %201 to %struct.__FILE**
  store %struct.__FILE* %195, %struct.__FILE** %212, align 4, !dbg !538
  %213 = getelementptr inbounds i8* %201, i32 4
  %214 = bitcast i8* %213 to i32*
  store i32 0, i32* %214, align 4, !dbg !539
  %215 = getelementptr inbounds i8* %201, i32 8
  %216 = bitcast i8* %215 to i32*
  store i32 0, i32* %216, align 4, !dbg !540
  %217 = getelementptr inbounds i8* %201, i32 12
  store i8 119, i8* %217, align 4, !dbg !541
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !542
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !542
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !542
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !542
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !542
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !542
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !542
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !542
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !544
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !544
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !544
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !544
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !544
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !544
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !544
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !544
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !546
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !546
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !546
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !546
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !546
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !546
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !546
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !546
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !548
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !548
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !548
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !548
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !548
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !548
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !548
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !548
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !550
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !550
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !550
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !550
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !550
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !550
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !550
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !550
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !550
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !550
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !550
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !550
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !550
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !550
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !550
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !550
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !552
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !552
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !552
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !552
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !552
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !552
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !552
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !552
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !552
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !552
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !552
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !552
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !552
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !552
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !552
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !552
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !554
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !554
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !554
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !554
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !554
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !554
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !554
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !554
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !554
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !554
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !554
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !554
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !554
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !554
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 0) nounwind, !dbg !554
  tail call fastcc void @bsPutBit(%struct.BitStream* %211, i32 1) nounwind, !dbg !554
  br label %bb33.outer72, !dbg !555

bb62:                                             ; preds = %bb43, %bb33
  %218 = load %struct._reent** @_impure_ptr, align 4, !dbg !556
  %219 = getelementptr inbounds %struct._reent* %218, i32 0, i32 3, !dbg !556
  %220 = load %struct.__FILE** %219, align 4, !dbg !556
  %221 = tail call i32 (%struct.__FILE*, i8*, ...)* @fprintf(%struct.__FILE* %220, i8* getelementptr inbounds ([14 x i8]* @.str23, i32 0, i32 0), i8* getelementptr inbounds ([2000 x i8]* @progName, i32 0, i32 0)) nounwind, !dbg !556
  ret i32 0, !dbg !557
}

declare i8* @strcpy(i8*, i8* nocapture) nounwind

declare i32 @fwrite(i8* nocapture, i32, i32, i8* nocapture) nounwind

declare noalias %struct.__FILE* @fopen(i8* nocapture, i8* nocapture) nounwind

declare i8* @strrchr(i8*, i32) nounwind readonly

declare i32 @sprintf(i8* nocapture, i8* nocapture, ...) nounwind

declare i8* @strcat(i8*, i8* nocapture) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture, i32, i32, i1) nounwind

declare void @llvm.memset.p0i8.i32(i8* nocapture, i8, i32, i32, i1) nounwind

!llvm.dbg.sp = !{!0, !7, !8, !16, !249, !250, !251, !254, !255, !258, !262, !266, !269}
!llvm.dbg.lv.tooManyBlocks = !{!273}
!llvm.dbg.lv.mallocFail = !{!274}
!llvm.dbg.lv.endsInBz2 = !{!275, !276}
!llvm.dbg.lv.bsOpenReadStream = !{!278, !279}
!llvm.dbg.lv.bsOpenWriteStream = !{!281, !282}
!llvm.dbg.lv.bsGetBit = !{!284, !285}
!llvm.dbg.lv.bsPutBit = !{!288, !289, !290}
!llvm.dbg.gv = !{!293, !295, !296, !300, !301, !302, !306, !307, !308}
!llvm.dbg.lv.bsPutUInt32 = !{!309, !310, !311}
!llvm.dbg.lv.bsPutUChar = !{!313, !314, !315}
!llvm.dbg.lv.bsClose = !{!317, !318}
!llvm.dbg.lv.main = !{!320, !321, !322, !324, !325, !326, !327, !328, !329, !330, !331, !332, !333, !334, !335, !336, !338, !339}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"tooManyBlocks", metadata !"tooManyBlocks", metadata !"", metadata !1, i32 124, metadata !3, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"bzip2recover.c", metadata !"/usr/local/google/scratch/bzip2-nacl/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 1, metadata !"bzip2recover.c", metadata !"/usr/local/google/scratch/bzip2-nacl/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{null, metadata !5}
!5 = metadata !{i32 589846, metadata !1, metadata !"Int32", metadata !1, i32 53, i64 0, i64 0, i64 0, i32 0, metadata !6} ; [ DW_TAG_typedef ]
!6 = metadata !{i32 589860, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!7 = metadata !{i32 589870, i32 0, metadata !1, metadata !"mallocFail", metadata !"mallocFail", metadata !"", metadata !1, i32 112, metadata !3, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!8 = metadata !{i32 589870, i32 0, metadata !1, metadata !"endsInBz2", metadata !"endsInBz2", metadata !"", metadata !1, i32 262, metadata !9, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!9 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null} ; [ DW_TAG_subroutine_type ]
!10 = metadata !{metadata !11, metadata !13}
!11 = metadata !{i32 589846, metadata !1, metadata !"Bool", metadata !1, i32 86, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ]
!12 = metadata !{i32 589860, metadata !1, metadata !"unsigned char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!13 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ]
!14 = metadata !{i32 589846, metadata !1, metadata !"Char", metadata !1, i32 55, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_typedef ]
!15 = metadata !{i32 589860, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!16 = metadata !{i32 589870, i32 0, metadata !1, metadata !"bsOpenReadStream", metadata !"bsOpenReadStream", metadata !"", metadata !1, i32 155, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!17 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null} ; [ DW_TAG_subroutine_type ]
!18 = metadata !{metadata !19, metadata !24}
!19 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_pointer_type ]
!20 = metadata !{i32 589846, metadata !1, metadata !"BitStream", metadata !1, i32 155, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_typedef ]
!21 = metadata !{i32 589843, metadata !1, metadata !"", metadata !1, i32 144, i64 128, i64 32, i64 0, i32 0, null, metadata !22, i32 0, null} ; [ DW_TAG_structure_type ]
!22 = metadata !{metadata !23, metadata !246, metadata !247, metadata !248}
!23 = metadata !{i32 589837, metadata !21, metadata !"handle", metadata !1, i32 145, i64 32, i64 32, i64 0, i32 0, metadata !24} ; [ DW_TAG_member ]
!24 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !25} ; [ DW_TAG_pointer_type ]
!25 = metadata !{i32 589846, metadata !26, metadata !"FILE", metadata !26, i32 59, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ]
!26 = metadata !{i32 589865, metadata !"stdio.h", metadata !"/usr/local/google/dev1/native_client/toolchain/pnacl_linux_x86_64/arm-none-linux-gnueabi/arm-none-linux-gnueabi/include", metadata !2} ; [ DW_TAG_file_type ]
!27 = metadata !{i32 589843, metadata !1, metadata !"__sFILE", metadata !28, i32 169, i64 960, i64 32, i64 0, i32 0, null, metadata !29, i32 0, null} ; [ DW_TAG_structure_type ]
!28 = metadata !{i32 589865, metadata !"reent.h", metadata !"/usr/local/google/dev1/native_client/toolchain/pnacl_linux_x86_64/arm-none-linux-gnueabi/arm-none-linux-gnueabi/include/sys", metadata !2} ; [ DW_TAG_file_type ]
!29 = metadata !{metadata !30, metadata !32, metadata !33, metadata !34, metadata !36, metadata !37, metadata !42, metadata !43, metadata !45, metadata !209, metadata !213, metadata !219, metadata !223, metadata !224, metadata !225, metadata !226, metadata !228, metadata !230, metadata !231, metadata !232, metadata !233, metadata !234, metadata !244, metadata !245}
!30 = metadata !{i32 589837, metadata !27, metadata !"_p", metadata !28, i32 170, i64 32, i64 32, i64 0, i32 0, metadata !31} ; [ DW_TAG_member ]
!31 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ]
!32 = metadata !{i32 589837, metadata !27, metadata !"_r", metadata !28, i32 171, i64 32, i64 32, i64 32, i32 0, metadata !6} ; [ DW_TAG_member ]
!33 = metadata !{i32 589837, metadata !27, metadata !"_w", metadata !28, i32 172, i64 32, i64 32, i64 64, i32 0, metadata !6} ; [ DW_TAG_member ]
!34 = metadata !{i32 589837, metadata !27, metadata !"_flags", metadata !28, i32 173, i64 16, i64 16, i64 96, i32 0, metadata !35} ; [ DW_TAG_member ]
!35 = metadata !{i32 589860, metadata !1, metadata !"short int", metadata !1, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!36 = metadata !{i32 589837, metadata !27, metadata !"_file", metadata !28, i32 174, i64 16, i64 16, i64 112, i32 0, metadata !35} ; [ DW_TAG_member ]
!37 = metadata !{i32 589837, metadata !27, metadata !"_bf", metadata !28, i32 175, i64 64, i64 32, i64 128, i32 0, metadata !38} ; [ DW_TAG_member ]
!38 = metadata !{i32 589843, metadata !1, metadata !"__sbuf", metadata !28, i32 105, i64 64, i64 32, i64 0, i32 0, null, metadata !39, i32 0, null} ; [ DW_TAG_structure_type ]
!39 = metadata !{metadata !40, metadata !41}
!40 = metadata !{i32 589837, metadata !38, metadata !"_base", metadata !28, i32 106, i64 32, i64 32, i64 0, i32 0, metadata !31} ; [ DW_TAG_member ]
!41 = metadata !{i32 589837, metadata !38, metadata !"_size", metadata !28, i32 107, i64 32, i64 32, i64 32, i32 0, metadata !6} ; [ DW_TAG_member ]
!42 = metadata !{i32 589837, metadata !27, metadata !"_lbfsize", metadata !28, i32 176, i64 32, i64 32, i64 192, i32 0, metadata !6} ; [ DW_TAG_member ]
!43 = metadata !{i32 589837, metadata !27, metadata !"_cookie", metadata !28, i32 183, i64 32, i64 32, i64 224, i32 0, metadata !44} ; [ DW_TAG_member ]
!44 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!45 = metadata !{i32 589837, metadata !27, metadata !"_read", metadata !28, i32 185, i64 32, i64 32, i64 256, i32 0, metadata !46} ; [ DW_TAG_member ]
!46 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !47} ; [ DW_TAG_pointer_type ]
!47 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !48, i32 0, null} ; [ DW_TAG_subroutine_type ]
!48 = metadata !{metadata !6, metadata !49, metadata !44, metadata !93, metadata !6}
!49 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !50} ; [ DW_TAG_pointer_type ]
!50 = metadata !{i32 589843, metadata !1, metadata !"_reent", metadata !28, i32 37, i64 8896, i64 64, i64 0, i32 0, null, metadata !51, i32 0, null} ; [ DW_TAG_structure_type ]
!51 = metadata !{metadata !52, metadata !53, metadata !56, metadata !57, metadata !58, metadata !59, metadata !63, metadata !64, metadata !67, metadata !68, metadata !72, metadata !87, metadata !88, metadata !89, metadata !91, metadata !92, metadata !94, metadata !173, metadata !194, metadata !195, metadata !200, metadata !207}
!52 = metadata !{i32 589837, metadata !50, metadata !"_errno", metadata !28, i32 581, i64 32, i64 32, i64 0, i32 0, metadata !6} ; [ DW_TAG_member ]
!53 = metadata !{i32 589837, metadata !50, metadata !"_stdin", metadata !28, i32 586, i64 32, i64 32, i64 32, i32 0, metadata !54} ; [ DW_TAG_member ]
!54 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !55} ; [ DW_TAG_pointer_type ]
!55 = metadata !{i32 589846, metadata !28, metadata !"__FILE", metadata !28, i32 278, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ]
!56 = metadata !{i32 589837, metadata !50, metadata !"_stdout", metadata !28, i32 586, i64 32, i64 32, i64 64, i32 0, metadata !54} ; [ DW_TAG_member ]
!57 = metadata !{i32 589837, metadata !50, metadata !"_stderr", metadata !28, i32 586, i64 32, i64 32, i64 96, i32 0, metadata !54} ; [ DW_TAG_member ]
!58 = metadata !{i32 589837, metadata !50, metadata !"_inc", metadata !28, i32 588, i64 32, i64 32, i64 128, i32 0, metadata !6} ; [ DW_TAG_member ]
!59 = metadata !{i32 589837, metadata !50, metadata !"_emergency", metadata !28, i32 589, i64 200, i64 8, i64 160, i32 0, metadata !60} ; [ DW_TAG_member ]
!60 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 200, i64 8, i64 0, i32 0, metadata !15, metadata !61, i32 0, null} ; [ DW_TAG_array_type ]
!61 = metadata !{metadata !62}
!62 = metadata !{i32 589857, i64 0, i64 24}       ; [ DW_TAG_subrange_type ]
!63 = metadata !{i32 589837, metadata !50, metadata !"_current_category", metadata !28, i32 591, i64 32, i64 32, i64 384, i32 0, metadata !6} ; [ DW_TAG_member ]
!64 = metadata !{i32 589837, metadata !50, metadata !"_current_locale", metadata !28, i32 592, i64 32, i64 32, i64 416, i32 0, metadata !65} ; [ DW_TAG_member ]
!65 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !66} ; [ DW_TAG_pointer_type ]
!66 = metadata !{i32 589862, metadata !1, metadata !"", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !15} ; [ DW_TAG_const_type ]
!67 = metadata !{i32 589837, metadata !50, metadata !"__sdidinit", metadata !28, i32 594, i64 32, i64 32, i64 448, i32 0, metadata !6} ; [ DW_TAG_member ]
!68 = metadata !{i32 589837, metadata !50, metadata !"__cleanup", metadata !28, i32 596, i64 32, i64 32, i64 480, i32 0, metadata !69} ; [ DW_TAG_member ]
!69 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !70} ; [ DW_TAG_pointer_type ]
!70 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !71, i32 0, null} ; [ DW_TAG_subroutine_type ]
!71 = metadata !{null, metadata !49}
!72 = metadata !{i32 589837, metadata !50, metadata !"_result", metadata !28, i32 599, i64 32, i64 32, i64 512, i32 0, metadata !73} ; [ DW_TAG_member ]
!73 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !74} ; [ DW_TAG_pointer_type ]
!74 = metadata !{i32 589843, metadata !1, metadata !"_Bigint", metadata !28, i32 45, i64 192, i64 32, i64 0, i32 0, null, metadata !75, i32 0, null} ; [ DW_TAG_structure_type ]
!75 = metadata !{metadata !76, metadata !77, metadata !78, metadata !79, metadata !80, metadata !81}
!76 = metadata !{i32 589837, metadata !74, metadata !"_next", metadata !28, i32 46, i64 32, i64 32, i64 0, i32 0, metadata !73} ; [ DW_TAG_member ]
!77 = metadata !{i32 589837, metadata !74, metadata !"_k", metadata !28, i32 47, i64 32, i64 32, i64 32, i32 0, metadata !6} ; [ DW_TAG_member ]
!78 = metadata !{i32 589837, metadata !74, metadata !"_maxwds", metadata !28, i32 47, i64 32, i64 32, i64 64, i32 0, metadata !6} ; [ DW_TAG_member ]
!79 = metadata !{i32 589837, metadata !74, metadata !"_sign", metadata !28, i32 47, i64 32, i64 32, i64 96, i32 0, metadata !6} ; [ DW_TAG_member ]
!80 = metadata !{i32 589837, metadata !74, metadata !"_wds", metadata !28, i32 47, i64 32, i64 32, i64 128, i32 0, metadata !6} ; [ DW_TAG_member ]
!81 = metadata !{i32 589837, metadata !74, metadata !"_x", metadata !28, i32 48, i64 32, i64 32, i64 160, i32 0, metadata !82} ; [ DW_TAG_member ]
!82 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !83, metadata !85, i32 0, null} ; [ DW_TAG_array_type ]
!83 = metadata !{i32 589846, metadata !28, metadata !"__ULong", metadata !28, i32 37, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_typedef ]
!84 = metadata !{i32 589860, metadata !1, metadata !"long unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!85 = metadata !{metadata !86}
!86 = metadata !{i32 589857, i64 0, i64 0}        ; [ DW_TAG_subrange_type ]
!87 = metadata !{i32 589837, metadata !50, metadata !"_result_k", metadata !28, i32 600, i64 32, i64 32, i64 544, i32 0, metadata !6} ; [ DW_TAG_member ]
!88 = metadata !{i32 589837, metadata !50, metadata !"_p5s", metadata !28, i32 601, i64 32, i64 32, i64 576, i32 0, metadata !73} ; [ DW_TAG_member ]
!89 = metadata !{i32 589837, metadata !50, metadata !"_freelist", metadata !28, i32 602, i64 32, i64 32, i64 608, i32 0, metadata !90} ; [ DW_TAG_member ]
!90 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !73} ; [ DW_TAG_pointer_type ]
!91 = metadata !{i32 589837, metadata !50, metadata !"_cvtlen", metadata !28, i32 605, i64 32, i64 32, i64 640, i32 0, metadata !6} ; [ DW_TAG_member ]
!92 = metadata !{i32 589837, metadata !50, metadata !"_cvtbuf", metadata !28, i32 606, i64 32, i64 32, i64 672, i32 0, metadata !93} ; [ DW_TAG_member ]
!93 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !15} ; [ DW_TAG_pointer_type ]
!94 = metadata !{i32 589837, metadata !50, metadata !"_new", metadata !28, i32 641, i64 1920, i64 64, i64 704, i32 0, metadata !95} ; [ DW_TAG_member ]
!95 = metadata !{i32 589847, metadata !1, metadata !"", metadata !28, i32 609, i64 1920, i64 64, i64 0, i32 0, null, metadata !96, i32 0, null} ; [ DW_TAG_union_type ]
!96 = metadata !{metadata !97, metadata !164}
!97 = metadata !{i32 589837, metadata !95, metadata !"_reent", metadata !28, i32 631, i64 1664, i64 64, i64 0, i32 0, metadata !98} ; [ DW_TAG_member ]
!98 = metadata !{i32 589843, metadata !1, metadata !"", metadata !28, i32 611, i64 1664, i64 64, i64 0, i32 0, null, metadata !99, i32 0, null} ; [ DW_TAG_structure_type ]
!99 = metadata !{metadata !100, metadata !102, metadata !103, metadata !107, metadata !119, metadata !120, metadata !122, metadata !132, metadata !147, metadata !148, metadata !149, metadata !153, metadata !157, metadata !158, metadata !159, metadata !160, metadata !161, metadata !162, metadata !163}
!100 = metadata !{i32 589837, metadata !98, metadata !"_unused_rand", metadata !28, i32 612, i64 32, i64 32, i64 0, i32 0, metadata !101} ; [ DW_TAG_member ]
!101 = metadata !{i32 589860, metadata !1, metadata !"unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!102 = metadata !{i32 589837, metadata !98, metadata !"_strtok_last", metadata !28, i32 613, i64 32, i64 32, i64 32, i32 0, metadata !93} ; [ DW_TAG_member ]
!103 = metadata !{i32 589837, metadata !98, metadata !"_asctime_buf", metadata !28, i32 614, i64 208, i64 8, i64 64, i32 0, metadata !104} ; [ DW_TAG_member ]
!104 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 208, i64 8, i64 0, i32 0, metadata !15, metadata !105, i32 0, null} ; [ DW_TAG_array_type ]
!105 = metadata !{metadata !106}
!106 = metadata !{i32 589857, i64 0, i64 25}      ; [ DW_TAG_subrange_type ]
!107 = metadata !{i32 589837, metadata !98, metadata !"_localtime_buf", metadata !28, i32 615, i64 288, i64 32, i64 288, i32 0, metadata !108} ; [ DW_TAG_member ]
!108 = metadata !{i32 589843, metadata !1, metadata !"__tm", metadata !28, i32 53, i64 288, i64 32, i64 0, i32 0, null, metadata !109, i32 0, null} ; [ DW_TAG_structure_type ]
!109 = metadata !{metadata !110, metadata !111, metadata !112, metadata !113, metadata !114, metadata !115, metadata !116, metadata !117, metadata !118}
!110 = metadata !{i32 589837, metadata !108, metadata !"__tm_sec", metadata !28, i32 54, i64 32, i64 32, i64 0, i32 0, metadata !6} ; [ DW_TAG_member ]
!111 = metadata !{i32 589837, metadata !108, metadata !"__tm_min", metadata !28, i32 55, i64 32, i64 32, i64 32, i32 0, metadata !6} ; [ DW_TAG_member ]
!112 = metadata !{i32 589837, metadata !108, metadata !"__tm_hour", metadata !28, i32 56, i64 32, i64 32, i64 64, i32 0, metadata !6} ; [ DW_TAG_member ]
!113 = metadata !{i32 589837, metadata !108, metadata !"__tm_mday", metadata !28, i32 57, i64 32, i64 32, i64 96, i32 0, metadata !6} ; [ DW_TAG_member ]
!114 = metadata !{i32 589837, metadata !108, metadata !"__tm_mon", metadata !28, i32 58, i64 32, i64 32, i64 128, i32 0, metadata !6} ; [ DW_TAG_member ]
!115 = metadata !{i32 589837, metadata !108, metadata !"__tm_year", metadata !28, i32 59, i64 32, i64 32, i64 160, i32 0, metadata !6} ; [ DW_TAG_member ]
!116 = metadata !{i32 589837, metadata !108, metadata !"__tm_wday", metadata !28, i32 60, i64 32, i64 32, i64 192, i32 0, metadata !6} ; [ DW_TAG_member ]
!117 = metadata !{i32 589837, metadata !108, metadata !"__tm_yday", metadata !28, i32 61, i64 32, i64 32, i64 224, i32 0, metadata !6} ; [ DW_TAG_member ]
!118 = metadata !{i32 589837, metadata !108, metadata !"__tm_isdst", metadata !28, i32 62, i64 32, i64 32, i64 256, i32 0, metadata !6} ; [ DW_TAG_member ]
!119 = metadata !{i32 589837, metadata !98, metadata !"_gamma_signgam", metadata !28, i32 616, i64 32, i64 32, i64 576, i32 0, metadata !6} ; [ DW_TAG_member ]
!120 = metadata !{i32 589837, metadata !98, metadata !"_rand_next", metadata !28, i32 617, i64 64, i64 64, i64 640, i32 0, metadata !121} ; [ DW_TAG_member ]
!121 = metadata !{i32 589860, metadata !1, metadata !"long long unsigned int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!122 = metadata !{i32 589837, metadata !98, metadata !"_r48", metadata !28, i32 618, i64 112, i64 16, i64 704, i32 0, metadata !123} ; [ DW_TAG_member ]
!123 = metadata !{i32 589843, metadata !1, metadata !"_rand48", metadata !28, i32 305, i64 112, i64 16, i64 0, i32 0, null, metadata !124, i32 0, null} ; [ DW_TAG_structure_type ]
!124 = metadata !{metadata !125, metadata !130, metadata !131}
!125 = metadata !{i32 589837, metadata !123, metadata !"_seed", metadata !28, i32 306, i64 48, i64 16, i64 0, i32 0, metadata !126} ; [ DW_TAG_member ]
!126 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 48, i64 16, i64 0, i32 0, metadata !127, metadata !128, i32 0, null} ; [ DW_TAG_array_type ]
!127 = metadata !{i32 589860, metadata !1, metadata !"short unsigned int", metadata !1, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!128 = metadata !{metadata !129}
!129 = metadata !{i32 589857, i64 0, i64 2}       ; [ DW_TAG_subrange_type ]
!130 = metadata !{i32 589837, metadata !123, metadata !"_mult", metadata !28, i32 307, i64 48, i64 16, i64 48, i32 0, metadata !126} ; [ DW_TAG_member ]
!131 = metadata !{i32 589837, metadata !123, metadata !"_add", metadata !28, i32 308, i64 16, i64 16, i64 96, i32 0, metadata !127} ; [ DW_TAG_member ]
!132 = metadata !{i32 589837, metadata !98, metadata !"_mblen_state", metadata !28, i32 619, i64 64, i64 32, i64 832, i32 0, metadata !133} ; [ DW_TAG_member ]
!133 = metadata !{i32 589846, metadata !134, metadata !"_mbstate_t", metadata !134, i32 79, i64 0, i64 0, i64 0, i32 0, metadata !135} ; [ DW_TAG_typedef ]
!134 = metadata !{i32 589865, metadata !"_types.h", metadata !"/usr/local/google/dev1/native_client/toolchain/pnacl_linux_x86_64/arm-none-linux-gnueabi/arm-none-linux-gnueabi/include/sys", metadata !2} ; [ DW_TAG_file_type ]
!135 = metadata !{i32 589843, metadata !1, metadata !"", metadata !134, i32 68, i64 64, i64 32, i64 0, i32 0, null, metadata !136, i32 0, null} ; [ DW_TAG_structure_type ]
!136 = metadata !{metadata !137, metadata !138}
!137 = metadata !{i32 589837, metadata !135, metadata !"__count", metadata !134, i32 69, i64 32, i64 32, i64 0, i32 0, metadata !6} ; [ DW_TAG_member ]
!138 = metadata !{i32 589837, metadata !135, metadata !"__value", metadata !134, i32 74, i64 32, i64 32, i64 32, i32 0, metadata !139} ; [ DW_TAG_member ]
!139 = metadata !{i32 589847, metadata !1, metadata !"", metadata !134, i32 71, i64 32, i64 32, i64 0, i32 0, null, metadata !140, i32 0, null} ; [ DW_TAG_union_type ]
!140 = metadata !{metadata !141, metadata !143}
!141 = metadata !{i32 589837, metadata !139, metadata !"__wch", metadata !134, i32 72, i64 32, i64 32, i64 0, i32 0, metadata !142} ; [ DW_TAG_member ]
!142 = metadata !{i32 589846, metadata !134, metadata !"wint_t", metadata !134, i32 68, i64 0, i64 0, i64 0, i32 0, metadata !101} ; [ DW_TAG_typedef ]
!143 = metadata !{i32 589837, metadata !139, metadata !"__wchb", metadata !134, i32 73, i64 32, i64 8, i64 0, i32 0, metadata !144} ; [ DW_TAG_member ]
!144 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 8, i64 0, i32 0, metadata !12, metadata !145, i32 0, null} ; [ DW_TAG_array_type ]
!145 = metadata !{metadata !146}
!146 = metadata !{i32 589857, i64 0, i64 3}       ; [ DW_TAG_subrange_type ]
!147 = metadata !{i32 589837, metadata !98, metadata !"_mbtowc_state", metadata !28, i32 620, i64 64, i64 32, i64 896, i32 0, metadata !133} ; [ DW_TAG_member ]
!148 = metadata !{i32 589837, metadata !98, metadata !"_wctomb_state", metadata !28, i32 621, i64 64, i64 32, i64 960, i32 0, metadata !133} ; [ DW_TAG_member ]
!149 = metadata !{i32 589837, metadata !98, metadata !"_l64a_buf", metadata !28, i32 622, i64 64, i64 8, i64 1024, i32 0, metadata !150} ; [ DW_TAG_member ]
!150 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 64, i64 8, i64 0, i32 0, metadata !15, metadata !151, i32 0, null} ; [ DW_TAG_array_type ]
!151 = metadata !{metadata !152}
!152 = metadata !{i32 589857, i64 0, i64 7}       ; [ DW_TAG_subrange_type ]
!153 = metadata !{i32 589837, metadata !98, metadata !"_signal_buf", metadata !28, i32 623, i64 192, i64 8, i64 1088, i32 0, metadata !154} ; [ DW_TAG_member ]
!154 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 192, i64 8, i64 0, i32 0, metadata !15, metadata !155, i32 0, null} ; [ DW_TAG_array_type ]
!155 = metadata !{metadata !156}
!156 = metadata !{i32 589857, i64 0, i64 23}      ; [ DW_TAG_subrange_type ]
!157 = metadata !{i32 589837, metadata !98, metadata !"_getdate_err", metadata !28, i32 624, i64 32, i64 32, i64 1280, i32 0, metadata !6} ; [ DW_TAG_member ]
!158 = metadata !{i32 589837, metadata !98, metadata !"_mbrlen_state", metadata !28, i32 625, i64 64, i64 32, i64 1312, i32 0, metadata !133} ; [ DW_TAG_member ]
!159 = metadata !{i32 589837, metadata !98, metadata !"_mbrtowc_state", metadata !28, i32 626, i64 64, i64 32, i64 1376, i32 0, metadata !133} ; [ DW_TAG_member ]
!160 = metadata !{i32 589837, metadata !98, metadata !"_mbsrtowcs_state", metadata !28, i32 627, i64 64, i64 32, i64 1440, i32 0, metadata !133} ; [ DW_TAG_member ]
!161 = metadata !{i32 589837, metadata !98, metadata !"_wcrtomb_state", metadata !28, i32 628, i64 64, i64 32, i64 1504, i32 0, metadata !133} ; [ DW_TAG_member ]
!162 = metadata !{i32 589837, metadata !98, metadata !"_wcsrtombs_state", metadata !28, i32 629, i64 64, i64 32, i64 1568, i32 0, metadata !133} ; [ DW_TAG_member ]
!163 = metadata !{i32 589837, metadata !98, metadata !"_h_errno", metadata !28, i32 630, i64 32, i64 32, i64 1632, i32 0, metadata !6} ; [ DW_TAG_member ]
!164 = metadata !{i32 589837, metadata !95, metadata !"_unused", metadata !28, i32 640, i64 1920, i64 32, i64 0, i32 0, metadata !165} ; [ DW_TAG_member ]
!165 = metadata !{i32 589843, metadata !1, metadata !"", metadata !28, i32 636, i64 1920, i64 32, i64 0, i32 0, null, metadata !166, i32 0, null} ; [ DW_TAG_structure_type ]
!166 = metadata !{metadata !167, metadata !171}
!167 = metadata !{i32 589837, metadata !165, metadata !"_nextf", metadata !28, i32 638, i64 960, i64 32, i64 0, i32 0, metadata !168} ; [ DW_TAG_member ]
!168 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 960, i64 32, i64 0, i32 0, metadata !31, metadata !169, i32 0, null} ; [ DW_TAG_array_type ]
!169 = metadata !{metadata !170}
!170 = metadata !{i32 589857, i64 0, i64 29}      ; [ DW_TAG_subrange_type ]
!171 = metadata !{i32 589837, metadata !165, metadata !"_nmalloc", metadata !28, i32 639, i64 960, i64 32, i64 960, i32 0, metadata !172} ; [ DW_TAG_member ]
!172 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 960, i64 32, i64 0, i32 0, metadata !101, metadata !169, i32 0, null} ; [ DW_TAG_array_type ]
!173 = metadata !{i32 589837, metadata !50, metadata !"_atexit", metadata !28, i32 644, i64 32, i64 32, i64 2624, i32 0, metadata !174} ; [ DW_TAG_member ]
!174 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !175} ; [ DW_TAG_pointer_type ]
!175 = metadata !{i32 589843, metadata !1, metadata !"_atexit", metadata !28, i32 89, i64 3200, i64 32, i64 0, i32 0, null, metadata !176, i32 0, null} ; [ DW_TAG_structure_type ]
!176 = metadata !{metadata !177, metadata !178, metadata !179, metadata !186}
!177 = metadata !{i32 589837, metadata !175, metadata !"_next", metadata !28, i32 90, i64 32, i64 32, i64 0, i32 0, metadata !174} ; [ DW_TAG_member ]
!178 = metadata !{i32 589837, metadata !175, metadata !"_ind", metadata !28, i32 91, i64 32, i64 32, i64 32, i32 0, metadata !6} ; [ DW_TAG_member ]
!179 = metadata !{i32 589837, metadata !175, metadata !"_fns", metadata !28, i32 93, i64 1024, i64 32, i64 64, i32 0, metadata !180} ; [ DW_TAG_member ]
!180 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 1024, i64 32, i64 0, i32 0, metadata !181, metadata !184, i32 0, null} ; [ DW_TAG_array_type ]
!181 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !182} ; [ DW_TAG_pointer_type ]
!182 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !183, i32 0, null} ; [ DW_TAG_subroutine_type ]
!183 = metadata !{null}
!184 = metadata !{metadata !185}
!185 = metadata !{i32 589857, i64 0, i64 31}      ; [ DW_TAG_subrange_type ]
!186 = metadata !{i32 589837, metadata !175, metadata !"_on_exit_args", metadata !28, i32 94, i64 2112, i64 32, i64 1088, i32 0, metadata !187} ; [ DW_TAG_member ]
!187 = metadata !{i32 589843, metadata !1, metadata !"_on_exit_args", metadata !28, i32 71, i64 2112, i64 32, i64 0, i32 0, null, metadata !188, i32 0, null} ; [ DW_TAG_structure_type ]
!188 = metadata !{metadata !189, metadata !191, metadata !192, metadata !193}
!189 = metadata !{i32 589837, metadata !187, metadata !"_fnargs", metadata !28, i32 72, i64 1024, i64 32, i64 0, i32 0, metadata !190} ; [ DW_TAG_member ]
!190 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 1024, i64 32, i64 0, i32 0, metadata !44, metadata !184, i32 0, null} ; [ DW_TAG_array_type ]
!191 = metadata !{i32 589837, metadata !187, metadata !"_dso_handle", metadata !28, i32 73, i64 1024, i64 32, i64 1024, i32 0, metadata !190} ; [ DW_TAG_member ]
!192 = metadata !{i32 589837, metadata !187, metadata !"_fntypes", metadata !28, i32 75, i64 32, i64 32, i64 2048, i32 0, metadata !83} ; [ DW_TAG_member ]
!193 = metadata !{i32 589837, metadata !187, metadata !"_is_cxa", metadata !28, i32 78, i64 32, i64 32, i64 2080, i32 0, metadata !83} ; [ DW_TAG_member ]
!194 = metadata !{i32 589837, metadata !50, metadata !"_atexit0", metadata !28, i32 645, i64 3200, i64 32, i64 2656, i32 0, metadata !175} ; [ DW_TAG_member ]
!195 = metadata !{i32 589837, metadata !50, metadata !"_sig_func", metadata !28, i32 648, i64 32, i64 32, i64 5856, i32 0, metadata !196} ; [ DW_TAG_member ]
!196 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !197} ; [ DW_TAG_pointer_type ]
!197 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !198} ; [ DW_TAG_pointer_type ]
!198 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !199, i32 0, null} ; [ DW_TAG_subroutine_type ]
!199 = metadata !{null, metadata !6}
!200 = metadata !{i32 589837, metadata !50, metadata !"__sglue", metadata !28, i32 653, i64 96, i64 32, i64 5888, i32 0, metadata !201} ; [ DW_TAG_member ]
!201 = metadata !{i32 589843, metadata !1, metadata !"_glue", metadata !28, i32 278, i64 96, i64 32, i64 0, i32 0, null, metadata !202, i32 0, null} ; [ DW_TAG_structure_type ]
!202 = metadata !{metadata !203, metadata !205, metadata !206}
!203 = metadata !{i32 589837, metadata !201, metadata !"_next", metadata !28, i32 279, i64 32, i64 32, i64 0, i32 0, metadata !204} ; [ DW_TAG_member ]
!204 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !201} ; [ DW_TAG_pointer_type ]
!205 = metadata !{i32 589837, metadata !201, metadata !"_niobs", metadata !28, i32 280, i64 32, i64 32, i64 32, i32 0, metadata !6} ; [ DW_TAG_member ]
!206 = metadata !{i32 589837, metadata !201, metadata !"_iobs", metadata !28, i32 281, i64 32, i64 32, i64 64, i32 0, metadata !54} ; [ DW_TAG_member ]
!207 = metadata !{i32 589837, metadata !50, metadata !"__sf", metadata !28, i32 654, i64 2880, i64 32, i64 5984, i32 0, metadata !208} ; [ DW_TAG_member ]
!208 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 2880, i64 32, i64 0, i32 0, metadata !55, metadata !128, i32 0, null} ; [ DW_TAG_array_type ]
!209 = metadata !{i32 589837, metadata !27, metadata !"_write", metadata !28, i32 187, i64 32, i64 32, i64 288, i32 0, metadata !210} ; [ DW_TAG_member ]
!210 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !211} ; [ DW_TAG_pointer_type ]
!211 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !212, i32 0, null} ; [ DW_TAG_subroutine_type ]
!212 = metadata !{metadata !6, metadata !49, metadata !44, metadata !65, metadata !6}
!213 = metadata !{i32 589837, metadata !27, metadata !"_seek", metadata !28, i32 189, i64 32, i64 32, i64 320, i32 0, metadata !214} ; [ DW_TAG_member ]
!214 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !215} ; [ DW_TAG_pointer_type ]
!215 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !216, i32 0, null} ; [ DW_TAG_subroutine_type ]
!216 = metadata !{metadata !217, metadata !49, metadata !44, metadata !217, metadata !6}
!217 = metadata !{i32 589846, metadata !134, metadata !"_fpos_t", metadata !134, i32 56, i64 0, i64 0, i64 0, i32 0, metadata !218} ; [ DW_TAG_typedef ]
!218 = metadata !{i32 589860, metadata !1, metadata !"long int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!219 = metadata !{i32 589837, metadata !27, metadata !"_close", metadata !28, i32 190, i64 32, i64 32, i64 352, i32 0, metadata !220} ; [ DW_TAG_member ]
!220 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !221} ; [ DW_TAG_pointer_type ]
!221 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !222, i32 0, null} ; [ DW_TAG_subroutine_type ]
!222 = metadata !{metadata !6, metadata !49, metadata !44}
!223 = metadata !{i32 589837, metadata !27, metadata !"_ub", metadata !28, i32 193, i64 64, i64 32, i64 384, i32 0, metadata !38} ; [ DW_TAG_member ]
!224 = metadata !{i32 589837, metadata !27, metadata !"_up", metadata !28, i32 194, i64 32, i64 32, i64 448, i32 0, metadata !31} ; [ DW_TAG_member ]
!225 = metadata !{i32 589837, metadata !27, metadata !"_ur", metadata !28, i32 195, i64 32, i64 32, i64 480, i32 0, metadata !6} ; [ DW_TAG_member ]
!226 = metadata !{i32 589837, metadata !27, metadata !"_ubuf", metadata !28, i32 198, i64 24, i64 8, i64 512, i32 0, metadata !227} ; [ DW_TAG_member ]
!227 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 24, i64 8, i64 0, i32 0, metadata !12, metadata !128, i32 0, null} ; [ DW_TAG_array_type ]
!228 = metadata !{i32 589837, metadata !27, metadata !"_nbuf", metadata !28, i32 199, i64 8, i64 8, i64 536, i32 0, metadata !229} ; [ DW_TAG_member ]
!229 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !12, metadata !85, i32 0, null} ; [ DW_TAG_array_type ]
!230 = metadata !{i32 589837, metadata !27, metadata !"_lb", metadata !28, i32 202, i64 64, i64 32, i64 544, i32 0, metadata !38} ; [ DW_TAG_member ]
!231 = metadata !{i32 589837, metadata !27, metadata !"_blksize", metadata !28, i32 205, i64 32, i64 32, i64 608, i32 0, metadata !6} ; [ DW_TAG_member ]
!232 = metadata !{i32 589837, metadata !27, metadata !"_offset", metadata !28, i32 206, i64 32, i64 32, i64 640, i32 0, metadata !6} ; [ DW_TAG_member ]
!233 = metadata !{i32 589837, metadata !27, metadata !"_data", metadata !28, i32 209, i64 32, i64 32, i64 672, i32 0, metadata !49} ; [ DW_TAG_member ]
!234 = metadata !{i32 589837, metadata !27, metadata !"_lock", metadata !28, i32 213, i64 160, i64 32, i64 704, i32 0, metadata !235} ; [ DW_TAG_member ]
!235 = metadata !{i32 589846, metadata !134, metadata !"_flock_t", metadata !134, i32 84, i64 0, i64 0, i64 0, i32 0, metadata !236} ; [ DW_TAG_typedef ]
!236 = metadata !{i32 589843, metadata !1, metadata !"__local_pthread_mutex_t", metadata !237, i32 11, i64 160, i64 32, i64 0, i32 0, null, metadata !238, i32 0, null} ; [ DW_TAG_structure_type ]
!237 = metadata !{i32 589865, metadata !"lock.h", metadata !"/usr/local/google/dev1/native_client/toolchain/pnacl_linux_x86_64/arm-none-linux-gnueabi/arm-none-linux-gnueabi/include/sys", metadata !2} ; [ DW_TAG_file_type ]
!238 = metadata !{metadata !239, metadata !240, metadata !241, metadata !242, metadata !243}
!239 = metadata !{i32 589837, metadata !236, metadata !"spinlock", metadata !237, i32 12, i64 32, i64 32, i64 0, i32 0, metadata !6} ; [ DW_TAG_member ]
!240 = metadata !{i32 589837, metadata !236, metadata !"mutex_type", metadata !237, i32 13, i64 32, i64 32, i64 32, i32 0, metadata !6} ; [ DW_TAG_member ]
!241 = metadata !{i32 589837, metadata !236, metadata !"owner_thread_id", metadata !237, i32 14, i64 32, i64 32, i64 64, i32 0, metadata !6} ; [ DW_TAG_member ]
!242 = metadata !{i32 589837, metadata !236, metadata !"recursion_counter", metadata !237, i32 15, i64 32, i64 32, i64 96, i32 0, metadata !6} ; [ DW_TAG_member ]
!243 = metadata !{i32 589837, metadata !236, metadata !"mutex_handle", metadata !237, i32 16, i64 32, i64 32, i64 128, i32 0, metadata !6} ; [ DW_TAG_member ]
!244 = metadata !{i32 589837, metadata !27, metadata !"_mbstate", metadata !28, i32 215, i64 64, i64 32, i64 864, i32 0, metadata !133} ; [ DW_TAG_member ]
!245 = metadata !{i32 589837, metadata !27, metadata !"_flags2", metadata !28, i32 216, i64 32, i64 32, i64 928, i32 0, metadata !6} ; [ DW_TAG_member ]
!246 = metadata !{i32 589837, metadata !21, metadata !"buffer", metadata !1, i32 146, i64 32, i64 32, i64 32, i32 0, metadata !5} ; [ DW_TAG_member ]
!247 = metadata !{i32 589837, metadata !21, metadata !"buffLive", metadata !1, i32 147, i64 32, i64 32, i64 64, i32 0, metadata !5} ; [ DW_TAG_member ]
!248 = metadata !{i32 589837, metadata !21, metadata !"mode", metadata !1, i32 148, i64 8, i64 8, i64 96, i32 0, metadata !14} ; [ DW_TAG_member ]
!249 = metadata !{i32 589870, i32 0, metadata !1, metadata !"bsOpenWriteStream", metadata !"bsOpenWriteStream", metadata !"", metadata !1, i32 168, metadata !17, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!250 = metadata !{i32 589870, i32 0, metadata !1, metadata !"readError", metadata !"readError", metadata !"", metadata !1, i32 86, metadata !182, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!251 = metadata !{i32 589870, i32 0, metadata !1, metadata !"bsGetBit", metadata !"bsGetBit", metadata !"", metadata !1, i32 200, metadata !252, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.BitStream*)* @bsGetBit} ; [ DW_TAG_subprogram ]
!252 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !253, i32 0, null} ; [ DW_TAG_subroutine_type ]
!253 = metadata !{metadata !5, metadata !19}
!254 = metadata !{i32 589870, i32 0, metadata !1, metadata !"writeError", metadata !"writeError", metadata !"", metadata !1, i32 99, metadata !182, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!255 = metadata !{i32 589870, i32 0, metadata !1, metadata !"bsPutBit", metadata !"bsPutBit", metadata !"", metadata !1, i32 181, metadata !256, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.BitStream*, i32)* @bsPutBit} ; [ DW_TAG_subprogram ]
!256 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !257, i32 0, null} ; [ DW_TAG_subroutine_type ]
!257 = metadata !{null, metadata !19, metadata !5}
!258 = metadata !{i32 589870, i32 0, metadata !1, metadata !"bsPutUInt32", metadata !"bsPutUInt32", metadata !"", metadata !1, i32 252, metadata !259, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!259 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !260, i32 0, null} ; [ DW_TAG_subroutine_type ]
!260 = metadata !{null, metadata !19, metadata !261}
!261 = metadata !{i32 589846, metadata !1, metadata !"UInt32", metadata !1, i32 52, i64 0, i64 0, i64 0, i32 0, metadata !101} ; [ DW_TAG_typedef ]
!262 = metadata !{i32 589870, i32 0, metadata !1, metadata !"bsPutUChar", metadata !"bsPutUChar", metadata !"", metadata !1, i32 243, metadata !263, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!263 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !264, i32 0, null} ; [ DW_TAG_subroutine_type ]
!264 = metadata !{null, metadata !19, metadata !265}
!265 = metadata !{i32 589846, metadata !1, metadata !"UChar", metadata !1, i32 54, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ]
!266 = metadata !{i32 589870, i32 0, metadata !1, metadata !"bsClose", metadata !"bsClose", metadata !"", metadata !1, i32 219, metadata !267, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.BitStream*)* @bsClose} ; [ DW_TAG_subprogram ]
!267 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !268, i32 0, null} ; [ DW_TAG_subroutine_type ]
!268 = metadata !{null, metadata !19}
!269 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 302, metadata !270, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main} ; [ DW_TAG_subprogram ]
!270 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !271, i32 0, null} ; [ DW_TAG_subroutine_type ]
!271 = metadata !{metadata !5, metadata !5, metadata !272}
!272 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ]
!273 = metadata !{i32 590081, metadata !0, metadata !"max_handled_blocks", metadata !1, i32 123, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!274 = metadata !{i32 590081, metadata !7, metadata !"n", metadata !1, i32 111, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!275 = metadata !{i32 590081, metadata !8, metadata !"name", metadata !1, i32 261, metadata !13, i32 0} ; [ DW_TAG_arg_variable ]
!276 = metadata !{i32 590080, metadata !277, metadata !"n", metadata !1, i32 263, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!277 = metadata !{i32 589835, metadata !8, i32 262, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!278 = metadata !{i32 590081, metadata !16, metadata !"stream", metadata !1, i32 154, metadata !24, i32 0} ; [ DW_TAG_arg_variable ]
!279 = metadata !{i32 590080, metadata !280, metadata !"bs", metadata !1, i32 156, metadata !19, i32 0} ; [ DW_TAG_auto_variable ]
!280 = metadata !{i32 589835, metadata !16, i32 155, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!281 = metadata !{i32 590081, metadata !249, metadata !"stream", metadata !1, i32 167, metadata !24, i32 0} ; [ DW_TAG_arg_variable ]
!282 = metadata !{i32 590080, metadata !283, metadata !"bs", metadata !1, i32 169, metadata !19, i32 0} ; [ DW_TAG_auto_variable ]
!283 = metadata !{i32 589835, metadata !249, i32 168, i32 0, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!284 = metadata !{i32 590081, metadata !251, metadata !"bs", metadata !1, i32 199, metadata !19, i32 0} ; [ DW_TAG_arg_variable ]
!285 = metadata !{i32 590080, metadata !286, metadata !"retVal", metadata !1, i32 205, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!286 = metadata !{i32 589835, metadata !287, i32 200, i32 0, metadata !1, i32 7} ; [ DW_TAG_lexical_block ]
!287 = metadata !{i32 589835, metadata !251, i32 200, i32 0, metadata !1, i32 6} ; [ DW_TAG_lexical_block ]
!288 = metadata !{i32 590081, metadata !255, metadata !"bs", metadata !1, i32 180, metadata !19, i32 0} ; [ DW_TAG_arg_variable ]
!289 = metadata !{i32 590081, metadata !255, metadata !"bit", metadata !1, i32 180, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!290 = metadata !{i32 590080, metadata !291, metadata !"retVal", metadata !1, i32 183, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!291 = metadata !{i32 589835, metadata !292, i32 181, i32 0, metadata !1, i32 10} ; [ DW_TAG_lexical_block ]
!292 = metadata !{i32 589835, metadata !255, i32 181, i32 0, metadata !1, i32 9} ; [ DW_TAG_lexical_block ]
!293 = metadata !{i32 589876, i32 0, metadata !1, metadata !"bytesOut", metadata !"bytesOut", metadata !"", metadata !1, i32 66, metadata !294, i1 false, i1 true, i64* @bytesOut} ; [ DW_TAG_variable ]
!294 = metadata !{i32 589846, metadata !1, metadata !"MaybeUInt64", metadata !1, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !121} ; [ DW_TAG_typedef ]
!295 = metadata !{i32 589876, i32 0, metadata !1, metadata !"bytesIn", metadata !"bytesIn", metadata !"", metadata !1, i32 67, metadata !294, i1 false, i1 true, i64* @bytesIn} ; [ DW_TAG_variable ]
!296 = metadata !{i32 589876, i32 0, metadata !1, metadata !"inFileName", metadata !"inFileName", metadata !"", metadata !1, i32 62, metadata !297, i1 false, i1 true, [2000 x i8]* @inFileName} ; [ DW_TAG_variable ]
!297 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 16000, i64 8, i64 0, i32 0, metadata !14, metadata !298, i32 0, null} ; [ DW_TAG_array_type ]
!298 = metadata !{metadata !299}
!299 = metadata !{i32 589857, i64 0, i64 1999}    ; [ DW_TAG_subrange_type ]
!300 = metadata !{i32 589876, i32 0, metadata !1, metadata !"outFileName", metadata !"outFileName", metadata !"", metadata !1, i32 63, metadata !297, i1 false, i1 true, [2000 x i8]* @outFileName} ; [ DW_TAG_variable ]
!301 = metadata !{i32 589876, i32 0, metadata !1, metadata !"progName", metadata !"progName", metadata !"", metadata !1, i32 64, metadata !297, i1 false, i1 true, [2000 x i8]* @progName} ; [ DW_TAG_variable ]
!302 = metadata !{i32 589876, i32 0, metadata !1, metadata !"bStart", metadata !"bStart", metadata !"", metadata !1, i32 296, metadata !303, i1 false, i1 true, [50000 x i64]* @bStart} ; [ DW_TAG_variable ]
!303 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 3200000, i64 64, i64 0, i32 0, metadata !294, metadata !304, i32 0, null} ; [ DW_TAG_array_type ]
!304 = metadata !{metadata !305}
!305 = metadata !{i32 589857, i64 0, i64 49999}   ; [ DW_TAG_subrange_type ]
!306 = metadata !{i32 589876, i32 0, metadata !1, metadata !"bEnd", metadata !"bEnd", metadata !"", metadata !1, i32 297, metadata !303, i1 false, i1 true, [50000 x i64]* @bEnd} ; [ DW_TAG_variable ]
!307 = metadata !{i32 589876, i32 0, metadata !1, metadata !"rbStart", metadata !"rbStart", metadata !"", metadata !1, i32 298, metadata !303, i1 false, i1 true, [50000 x i64]* @rbStart} ; [ DW_TAG_variable ]
!308 = metadata !{i32 589876, i32 0, metadata !1, metadata !"rbEnd", metadata !"rbEnd", metadata !"", metadata !1, i32 299, metadata !303, i1 false, i1 true, [50000 x i64]* @rbEnd} ; [ DW_TAG_variable ]
!309 = metadata !{i32 590081, metadata !258, metadata !"bs", metadata !1, i32 251, metadata !19, i32 0} ; [ DW_TAG_arg_variable ]
!310 = metadata !{i32 590081, metadata !258, metadata !"c", metadata !1, i32 251, metadata !261, i32 0} ; [ DW_TAG_arg_variable ]
!311 = metadata !{i32 590080, metadata !312, metadata !"i", metadata !1, i32 253, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!312 = metadata !{i32 589835, metadata !258, i32 252, i32 0, metadata !1, i32 11} ; [ DW_TAG_lexical_block ]
!313 = metadata !{i32 590081, metadata !262, metadata !"bs", metadata !1, i32 242, metadata !19, i32 0} ; [ DW_TAG_arg_variable ]
!314 = metadata !{i32 590081, metadata !262, metadata !"c", metadata !1, i32 242, metadata !265, i32 0} ; [ DW_TAG_arg_variable ]
!315 = metadata !{i32 590080, metadata !316, metadata !"i", metadata !1, i32 244, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!316 = metadata !{i32 589835, metadata !262, i32 243, i32 0, metadata !1, i32 12} ; [ DW_TAG_lexical_block ]
!317 = metadata !{i32 590081, metadata !266, metadata !"bs", metadata !1, i32 218, metadata !19, i32 0} ; [ DW_TAG_arg_variable ]
!318 = metadata !{i32 590080, metadata !319, metadata !"retVal", metadata !1, i32 220, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!319 = metadata !{i32 589835, metadata !266, i32 219, i32 0, metadata !1, i32 13} ; [ DW_TAG_lexical_block ]
!320 = metadata !{i32 590081, metadata !269, metadata !"argc", metadata !1, i32 301, metadata !5, i32 0} ; [ DW_TAG_arg_variable ]
!321 = metadata !{i32 590081, metadata !269, metadata !"argv", metadata !1, i32 301, metadata !272, i32 0} ; [ DW_TAG_arg_variable ]
!322 = metadata !{i32 590080, metadata !323, metadata !"inFile", metadata !1, i32 303, metadata !24, i32 0} ; [ DW_TAG_auto_variable ]
!323 = metadata !{i32 589835, metadata !269, i32 302, i32 0, metadata !1, i32 14} ; [ DW_TAG_lexical_block ]
!324 = metadata !{i32 590080, metadata !323, metadata !"outFile", metadata !1, i32 304, metadata !24, i32 0} ; [ DW_TAG_auto_variable ]
!325 = metadata !{i32 590080, metadata !323, metadata !"bsIn", metadata !1, i32 305, metadata !19, i32 0} ; [ DW_TAG_auto_variable ]
!326 = metadata !{i32 590080, metadata !323, metadata !"bsWr", metadata !1, i32 305, metadata !19, i32 0} ; [ DW_TAG_auto_variable ]
!327 = metadata !{i32 590080, metadata !323, metadata !"b", metadata !1, i32 306, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!328 = metadata !{i32 590080, metadata !323, metadata !"wrBlock", metadata !1, i32 306, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!329 = metadata !{i32 590080, metadata !323, metadata !"currBlock", metadata !1, i32 306, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!330 = metadata !{i32 590080, metadata !323, metadata !"rbCtr", metadata !1, i32 306, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!331 = metadata !{i32 590080, metadata !323, metadata !"bitsRead", metadata !1, i32 307, metadata !294, i32 0} ; [ DW_TAG_auto_variable ]
!332 = metadata !{i32 590080, metadata !323, metadata !"buffHi", metadata !1, i32 309, metadata !261, i32 0} ; [ DW_TAG_auto_variable ]
!333 = metadata !{i32 590080, metadata !323, metadata !"buffLo", metadata !1, i32 309, metadata !261, i32 0} ; [ DW_TAG_auto_variable ]
!334 = metadata !{i32 590080, metadata !323, metadata !"blockCRC", metadata !1, i32 309, metadata !261, i32 0} ; [ DW_TAG_auto_variable ]
!335 = metadata !{i32 590080, metadata !323, metadata !"p", metadata !1, i32 310, metadata !13, i32 0} ; [ DW_TAG_auto_variable ]
!336 = metadata !{i32 590080, metadata !337, metadata !"split", metadata !1, i32 467, metadata !13, i32 0} ; [ DW_TAG_auto_variable ]
!337 = metadata !{i32 589835, metadata !323, i32 469, i32 0, metadata !1, i32 15} ; [ DW_TAG_lexical_block ]
!338 = metadata !{i32 590080, metadata !337, metadata !"ofs", metadata !1, i32 468, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!339 = metadata !{i32 590080, metadata !337, metadata !"k", metadata !1, i32 468, metadata !5, i32 0} ; [ DW_TAG_auto_variable ]
!340 = metadata !{i32 199, i32 0, metadata !251, null}
!341 = metadata !{i32 201, i32 0, metadata !287, null}
!342 = metadata !{i32 202, i32 0, metadata !287, null}
!343 = metadata !{i32 203, i32 0, metadata !287, null}
!344 = metadata !{i32 205, i32 0, metadata !286, null}
!345 = metadata !{i32 206, i32 0, metadata !286, null}
!346 = metadata !{i32 207, i32 0, metadata !286, null}
!347 = metadata !{i32 87, i32 0, metadata !348, metadata !346}
!348 = metadata !{i32 589835, metadata !250, i32 86, i32 0, metadata !1, i32 5} ; [ DW_TAG_lexical_block ]
!349 = metadata !{i32 90, i32 0, metadata !348, metadata !346}
!350 = metadata !{i32 91, i32 0, metadata !348, metadata !346}
!351 = metadata !{i32 93, i32 0, metadata !348, metadata !346}
!352 = metadata !{i32 210, i32 0, metadata !286, null}
!353 = metadata !{i32 211, i32 0, metadata !286, null}
!354 = metadata !{i32 212, i32 0, metadata !286, null}
!355 = metadata !{i32 180, i32 0, metadata !255, null}
!356 = metadata !{i32 182, i32 0, metadata !292, null}
!357 = metadata !{i32 183, i32 0, metadata !291, null}
!358 = metadata !{i32 184, i32 0, metadata !291, null}
!359 = metadata !{i32 187, i32 0, metadata !291, null}
!360 = metadata !{i32 100, i32 0, metadata !361, metadata !358}
!361 = metadata !{i32 589835, metadata !254, i32 99, i32 0, metadata !1, i32 8} ; [ DW_TAG_lexical_block ]
!362 = metadata !{i32 103, i32 0, metadata !361, metadata !358}
!363 = metadata !{i32 104, i32 0, metadata !361, metadata !358}
!364 = metadata !{i32 106, i32 0, metadata !361, metadata !358}
!365 = metadata !{i32 185, i32 0, metadata !291, null}
!366 = metadata !{i32 186, i32 0, metadata !291, null}
!367 = metadata !{i32 192, i32 0, metadata !292, null}
!368 = metadata !{i32 189, i32 0, metadata !292, null}
!369 = metadata !{i32 190, i32 0, metadata !292, null}
!370 = metadata !{i32 218, i32 0, metadata !266, null}
!371 = metadata !{i32 222, i32 0, metadata !319, null}
!372 = metadata !{i32 233, i32 0, metadata !319, null}
!373 = metadata !{i32 223, i32 0, metadata !319, null}
!374 = metadata !{i32 225, i32 0, metadata !319, null}
!375 = metadata !{i32 227, i32 0, metadata !319, null}
!376 = metadata !{i32 228, i32 0, metadata !319, null}
!377 = metadata !{i32 100, i32 0, metadata !361, metadata !376}
!378 = metadata !{i32 103, i32 0, metadata !361, metadata !376}
!379 = metadata !{i32 104, i32 0, metadata !361, metadata !376}
!380 = metadata !{i32 106, i32 0, metadata !361, metadata !376}
!381 = metadata !{i32 229, i32 0, metadata !319, null}
!382 = metadata !{i32 230, i32 0, metadata !319, null}
!383 = metadata !{i32 231, i32 0, metadata !319, null}
!384 = metadata !{i32 100, i32 0, metadata !361, metadata !383}
!385 = metadata !{i32 103, i32 0, metadata !361, metadata !383}
!386 = metadata !{i32 104, i32 0, metadata !361, metadata !383}
!387 = metadata !{i32 106, i32 0, metadata !361, metadata !383}
!388 = metadata !{i32 234, i32 0, metadata !319, null}
!389 = metadata !{i32 100, i32 0, metadata !361, metadata !390}
!390 = metadata !{i32 235, i32 0, metadata !319, null}
!391 = metadata !{i32 103, i32 0, metadata !361, metadata !390}
!392 = metadata !{i32 104, i32 0, metadata !361, metadata !390}
!393 = metadata !{i32 106, i32 0, metadata !361, metadata !390}
!394 = metadata !{i32 237, i32 0, metadata !319, null}
!395 = metadata !{i32 238, i32 0, metadata !319, null}
!396 = metadata !{i32 301, i32 0, metadata !269, null}
!397 = metadata !{i32 312, i32 0, metadata !323, null}
!398 = metadata !{i32 313, i32 0, metadata !323, null}
!399 = metadata !{i32 315, i32 0, metadata !323, null}
!400 = metadata !{i32 318, i32 0, metadata !323, null}
!401 = metadata !{i32 319, i32 0, metadata !323, null}
!402 = metadata !{i32 323, i32 0, metadata !323, null}
!403 = metadata !{i32 339, i32 0, metadata !323, null}
!404 = metadata !{i32 342, i32 0, metadata !323, null}
!405 = metadata !{i32 343, i32 0, metadata !323, null}
!406 = metadata !{i32 346, i32 0, metadata !323, null}
!407 = metadata !{i32 349, i32 0, metadata !323, null}
!408 = metadata !{i32 351, i32 0, metadata !323, null}
!409 = metadata !{i32 352, i32 0, metadata !323, null}
!410 = metadata !{i32 353, i32 0, metadata !323, null}
!411 = metadata !{i32 354, i32 0, metadata !323, null}
!412 = metadata !{i32 154, i32 0, metadata !16, metadata !413}
!413 = metadata !{i32 357, i32 0, metadata !323, null}
!414 = metadata !{i32 156, i32 0, metadata !280, metadata !413}
!415 = metadata !{i32 157, i32 0, metadata !280, metadata !413}
!416 = metadata !{i32 16}
!417 = metadata !{i32 111, i32 0, metadata !7, metadata !415}
!418 = metadata !{i32 113, i32 0, metadata !419, metadata !415}
!419 = metadata !{i32 589835, metadata !7, i32 112, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!420 = metadata !{i32 116, i32 0, metadata !419, metadata !415}
!421 = metadata !{i32 118, i32 0, metadata !419, metadata !415}
!422 = metadata !{i32 158, i32 0, metadata !280, metadata !413}
!423 = metadata !{i32 159, i32 0, metadata !280, metadata !413}
!424 = metadata !{i32 160, i32 0, metadata !280, metadata !413}
!425 = metadata !{i32 161, i32 0, metadata !280, metadata !413}
!426 = metadata !{i32 358, i32 0, metadata !323, null}
!427 = metadata !{i64 0}
!428 = metadata !{i32 360, i32 0, metadata !323, null}
!429 = metadata !{i32 0}
!430 = metadata !{i32 361, i32 0, metadata !323, null}
!431 = metadata !{i32 362, i32 0, metadata !323, null}
!432 = metadata !{i32 363, i32 0, metadata !323, null}
!433 = metadata !{i32 365, i32 0, metadata !323, null}
!434 = metadata !{i32 368, i32 0, metadata !323, null}
!435 = metadata !{i32 370, i32 0, metadata !323, null}
!436 = metadata !{i32 369, i32 0, metadata !323, null}
!437 = metadata !{i32 371, i32 0, metadata !323, null}
!438 = metadata !{i32 373, i32 0, metadata !323, null}
!439 = metadata !{i32 374, i32 0, metadata !323, null}
!440 = metadata !{i32 375, i32 0, metadata !323, null}
!441 = metadata !{i32 382, i32 0, metadata !323, null}
!442 = metadata !{i32 383, i32 0, metadata !323, null}
!443 = metadata !{i32 384, i32 0, metadata !323, null}
!444 = metadata !{i32 390, i32 0, metadata !323, null}
!445 = metadata !{i32 395, i32 0, metadata !323, null}
!446 = metadata !{i32 397, i32 0, metadata !323, null}
!447 = metadata !{i32 400, i32 0, metadata !323, null}
!448 = metadata !{i32 401, i32 0, metadata !323, null}
!449 = metadata !{i32 402, i32 0, metadata !323, null}
!450 = metadata !{i32 404, i32 0, metadata !323, null}
!451 = metadata !{i32 50000}
!452 = metadata !{i32 123, i32 0, metadata !0, metadata !453}
!453 = metadata !{i32 405, i32 0, metadata !323, null}
!454 = metadata !{i32 125, i32 0, metadata !455, metadata !453}
!455 = metadata !{i32 589835, metadata !0, i32 124, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!456 = metadata !{i32 128, i32 0, metadata !455, metadata !453}
!457 = metadata !{i32 131, i32 0, metadata !455, metadata !453}
!458 = metadata !{i32 134, i32 0, metadata !455, metadata !453}
!459 = metadata !{i32 408, i32 0, metadata !323, null}
!460 = metadata !{i32 412, i32 0, metadata !323, null}
!461 = metadata !{i32 417, i32 0, metadata !323, null}
!462 = metadata !{i32 416, i32 0, metadata !323, null}
!463 = metadata !{i32 420, i32 0, metadata !323, null}
!464 = metadata !{i32 423, i32 0, metadata !323, null}
!465 = metadata !{i32 425, i32 0, metadata !323, null}
!466 = metadata !{i32 426, i32 0, metadata !323, null}
!467 = metadata !{i32 427, i32 0, metadata !323, null}
!468 = metadata !{i32 428, i32 0, metadata !323, null}
!469 = metadata !{i32 154, i32 0, metadata !16, metadata !470}
!470 = metadata !{i32 430, i32 0, metadata !323, null}
!471 = metadata !{i32 156, i32 0, metadata !280, metadata !470}
!472 = metadata !{i32 157, i32 0, metadata !280, metadata !470}
!473 = metadata !{i32 111, i32 0, metadata !7, metadata !472}
!474 = metadata !{i32 113, i32 0, metadata !419, metadata !472}
!475 = metadata !{i32 116, i32 0, metadata !419, metadata !472}
!476 = metadata !{i32 118, i32 0, metadata !419, metadata !472}
!477 = metadata !{i32 158, i32 0, metadata !280, metadata !470}
!478 = metadata !{i32 159, i32 0, metadata !280, metadata !470}
!479 = metadata !{i32 160, i32 0, metadata !280, metadata !470}
!480 = metadata !{i32 161, i32 0, metadata !280, metadata !470}
!481 = metadata !{i32 433, i32 0, metadata !323, null}
!482 = metadata !{%struct.BitStream* null}
!483 = metadata !{i32 435, i32 0, metadata !323, null}
!484 = metadata !{%struct.__FILE* null}
!485 = metadata !{i32 436, i32 0, metadata !323, null}
!486 = metadata !{i32 437, i32 0, metadata !323, null}
!487 = metadata !{i32 446, i32 0, metadata !323, null}
!488 = metadata !{i32 439, i32 0, metadata !323, null}
!489 = metadata !{i32 440, i32 0, metadata !323, null}
!490 = metadata !{i32 441, i32 0, metadata !323, null}
!491 = metadata !{i32 442, i32 0, metadata !323, null}
!492 = metadata !{i32 443, i32 0, metadata !323, null}
!493 = metadata !{i32 444, i32 0, metadata !323, null}
!494 = metadata !{i32 448, i32 0, metadata !323, null}
!495 = metadata !{i32 453, i32 0, metadata !323, null}
!496 = metadata !{i32 454, i32 0, metadata !323, null}
!497 = metadata !{i32 246, i32 0, metadata !316, metadata !498}
!498 = metadata !{i32 455, i32 0, metadata !323, null}
!499 = metadata !{i32 246, i32 0, metadata !316, metadata !500}
!500 = metadata !{i32 456, i32 0, metadata !323, null}
!501 = metadata !{i32 246, i32 0, metadata !316, metadata !502}
!502 = metadata !{i32 457, i32 0, metadata !323, null}
!503 = metadata !{i32 256, i32 0, metadata !312, metadata !504}
!504 = metadata !{i32 458, i32 0, metadata !323, null}
!505 = metadata !{i32 255, i32 0, metadata !312, metadata !504}
!506 = metadata !{i32 459, i32 0, metadata !323, null}
!507 = metadata !{i32 461, i32 0, metadata !323, null}
!508 = metadata !{i32 464, i32 0, metadata !323, null}
!509 = metadata !{i32 471, i32 0, metadata !337, null}
!510 = metadata !{i32 472, i32 0, metadata !337, null}
!511 = metadata !{i32 473, i32 0, metadata !337, null}
!512 = metadata !{i32 476, i32 0, metadata !337, null}
!513 = metadata !{i32 479, i32 0, metadata !337, null}
!514 = metadata !{i32 480, i32 0, metadata !337, null}
!515 = metadata !{i32 481, i32 0, metadata !337, null}
!516 = metadata !{i32 482, i32 0, metadata !337, null}
!517 = metadata !{i32 263, i32 0, metadata !277, metadata !518}
!518 = metadata !{i32 484, i32 0, metadata !337, null}
!519 = metadata !{i32 264, i32 0, metadata !277, metadata !518}
!520 = metadata !{i32 265, i32 0, metadata !277, metadata !518}
!521 = metadata !{i32 486, i32 0, metadata !337, null}
!522 = metadata !{i32 489, i32 0, metadata !337, null}
!523 = metadata !{i32 490, i32 0, metadata !337, null}
!524 = metadata !{i32 451, i32 0, metadata !323, null}
!525 = metadata !{i32 469, i32 0, metadata !337, null}
!526 = metadata !{i8* getelementptr inbounds ([2000 x i8]* @outFileName, i32 0, i32 0)}
!527 = metadata !{i32 261, i32 0, metadata !8, metadata !518}
!528 = metadata !{i32 491, i32 0, metadata !337, null}
!529 = metadata !{i32 493, i32 0, metadata !337, null}
!530 = metadata !{i32 169, i32 0, metadata !283, metadata !531}
!531 = metadata !{i32 495, i32 0, metadata !337, null}
!532 = metadata !{i32 170, i32 0, metadata !283, metadata !531}
!533 = metadata !{i32 167, i32 0, metadata !249, metadata !531}
!534 = metadata !{i32 111, i32 0, metadata !7, metadata !532}
!535 = metadata !{i32 113, i32 0, metadata !419, metadata !532}
!536 = metadata !{i32 116, i32 0, metadata !419, metadata !532}
!537 = metadata !{i32 118, i32 0, metadata !419, metadata !532}
!538 = metadata !{i32 171, i32 0, metadata !283, metadata !531}
!539 = metadata !{i32 172, i32 0, metadata !283, metadata !531}
!540 = metadata !{i32 173, i32 0, metadata !283, metadata !531}
!541 = metadata !{i32 174, i32 0, metadata !283, metadata !531}
!542 = metadata !{i32 246, i32 0, metadata !316, metadata !543}
!543 = metadata !{i32 496, i32 0, metadata !337, null}
!544 = metadata !{i32 246, i32 0, metadata !316, metadata !545}
!545 = metadata !{i32 497, i32 0, metadata !337, null}
!546 = metadata !{i32 246, i32 0, metadata !316, metadata !547}
!547 = metadata !{i32 498, i32 0, metadata !337, null}
!548 = metadata !{i32 246, i32 0, metadata !316, metadata !549}
!549 = metadata !{i32 499, i32 0, metadata !337, null}
!550 = metadata !{i32 246, i32 0, metadata !316, metadata !551}
!551 = metadata !{i32 500, i32 0, metadata !337, null}
!552 = metadata !{i32 246, i32 0, metadata !316, metadata !553}
!553 = metadata !{i32 501, i32 0, metadata !337, null}
!554 = metadata !{i32 246, i32 0, metadata !316, metadata !555}
!555 = metadata !{i32 502, i32 0, metadata !337, null}
!556 = metadata !{i32 506, i32 0, metadata !323, null}
!557 = metadata !{i32 507, i32 0, metadata !323, null}
