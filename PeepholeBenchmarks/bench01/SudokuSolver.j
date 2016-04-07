.class public abstract SudokuSolver

.super java/lang/Object

.field protected grid Ljava/util/Vector;

.method public <init>()V
  .limit locals 1
  .limit stack 1
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

.method public parse(Ljoos/lib/JoosIO;)V
  .limit locals 8
  .limit stack 4
  aload_0
  new java/util/Vector
  dup
  ldc 9
  invokenonvirtual java/util/Vector/<init>(I)V
  putfield SudokuSolver/grid Ljava/util/Vector;
  iconst_0
  istore_2
  start_0:
  iload_2
  ldc 9
  if_icmpge stop_1
  aload_0
  getfield SudokuSolver/grid Ljava/util/Vector;
  new java/util/Vector
  dup
  ldc 9
  invokenonvirtual java/util/Vector/<init>(I)V
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  iconst_0
  istore_3
  start_4:
  iload_3
  ldc 9
  if_icmpge stop_5
  aload_0
  getfield SudokuSolver/grid Ljava/util/Vector;
  iload_2
  invokevirtual java/util/Vector/elementAt(I)Ljava/lang/Object;
  astore 4
  aload 4
  checkcast java/util/Vector
  astore 5
  aload_1
  invokevirtual joos/lib/JoosIO/readInt()I
  istore 6
  new java/lang/Integer
  dup
  iload 6
  invokenonvirtual java/lang/Integer/<init>(I)V
  astore 7
  aload 5
  aload 7
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  iinc 3 1
  iload_3
  istore_3
  goto start_4
  stop_5:
  iinc 2 1
  iload_2
  istore_2
  goto start_0
  stop_1:
  return
.end method

.method public abstract solve()V
.end method

.method public print(Ljoos/lib/JoosIO;)V
  .limit locals 12
  .limit stack 3
  iconst_0
  istore 4
  iconst_0
  istore_2
  start_0:
  iload_2
  ldc 12
  if_icmpge stop_1
  iconst_0
  istore 5
  iconst_0
  istore_3
  start_4:
  iload_3
  ldc 13
  if_icmpge stop_5
  iload_2
  iconst_0
  if_icmpeq true_12
  iconst_0
  goto stop_13
  true_12:
  iconst_1
  stop_13:
  dup
  ifne true_11
  pop
  iload_2
  iconst_4
  if_icmpeq true_14
  iconst_0
  goto stop_15
  true_14:
  iconst_1
  stop_15:
  true_11:
  dup
  ifne true_10
  pop
  iload_2
  ldc 8
  if_icmpeq true_16
  iconst_0
  goto stop_17
  true_16:
  iconst_1
  stop_17:
  true_10:
  ifeq else_8
  aload_1
  ldc "|"
  invokevirtual joos/lib/JoosIO/print(Ljava/lang/String;)V
  goto stop_9
  else_8:
  iload_3
  iconst_0
  if_icmpeq true_23
  iconst_0
  goto stop_24
  true_23:
  iconst_1
  stop_24:
  dup
  ifne true_22
  pop
  iload_3
  iconst_4
  if_icmpeq true_25
  iconst_0
  goto stop_26
  true_25:
  iconst_1
  stop_26:
  true_22:
  dup
  ifne true_21
  pop
  iload_3
  ldc 8
  if_icmpeq true_27
  iconst_0
  goto stop_28
  true_27:
  iconst_1
  stop_28:
  true_21:
  dup
  ifne true_20
  pop
  iload_3
  ldc 12
  if_icmpeq true_29
  iconst_0
  goto stop_30
  true_29:
  iconst_1
  stop_30:
  true_20:
  ifeq else_18
  aload_1
  ldc "|"
  invokevirtual joos/lib/JoosIO/print(Ljava/lang/String;)V
  goto stop_19
  else_18:
  aload_0
  getfield SudokuSolver/grid Ljava/util/Vector;
  iload 4
  invokevirtual java/util/Vector/elementAt(I)Ljava/lang/Object;
  astore 10
  aload 10
  checkcast java/util/Vector
  astore 11
  aload 11
  iload 5
  invokevirtual java/util/Vector/elementAt(I)Ljava/lang/Object;
  astore 6
  iinc 5 1
  iload 5
  istore 5
  new java/lang/Integer
  dup
  iconst_0
  invokenonvirtual java/lang/Integer/<init>(I)V
  astore 8
  aload 6
  checkcast java/lang/Integer
  astore 7
  aload 7
  aload 8
  if_acmpeq else_31
  aload 7
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  astore 9
  aload_1
  aload 9
  invokevirtual joos/lib/JoosIO/print(Ljava/lang/String;)V
  goto stop_32
  else_31:
  aload_1
  ldc " "
  invokevirtual joos/lib/JoosIO/print(Ljava/lang/String;)V
  stop_32:
  stop_19:
  stop_9:
  iinc 3 1
  iload_3
  istore_3
  goto start_4
  stop_5:
  iload_2
  iconst_0
  if_icmpne true_38
  iconst_0
  goto stop_39
  true_38:
  iconst_1
  stop_39:
  dup
  ifeq false_37
  pop
  iload_2
  iconst_4
  if_icmpne true_40
  iconst_0
  goto stop_41
  true_40:
  iconst_1
  stop_41:
  false_37:
  dup
  ifeq false_36
  pop
  iload_2
  ldc 8
  if_icmpne true_42
  iconst_0
  goto stop_43
  true_42:
  iconst_1
  stop_43:
  false_36:
  ifeq stop_35
  iinc 4 1
  iload 4
  istore 4
  stop_35:
  aload_1
  ldc "\n"
  invokevirtual joos/lib/JoosIO/print(Ljava/lang/String;)V
  iinc 2 1
  iload_2
  istore_2
  goto start_0
  stop_1:
  return
.end method

