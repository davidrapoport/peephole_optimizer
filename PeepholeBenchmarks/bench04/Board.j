.class public Board

.super java/lang/Object

.field protected columns Ljava/util/Vector;
.field protected width I
.field protected height I
.field protected SPACE Ljava/lang/Character;

.method public <init>(II)V
  .limit locals 6
  .limit stack 4
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  aload_0
  new java/lang/Character
  dup
  ldc 32
  invokenonvirtual java/lang/Character/<init>(C)V
  putfield Board/SPACE Ljava/lang/Character;
  aload_0
  iload_1
  putfield Board/width I
  aload_0
  iload_2
  putfield Board/height I
  new java/util/Vector
  dup
  aload_0
  getfield Board/width I
  invokenonvirtual java/util/Vector/<init>(I)V
  dup
  aload_0
  swap
  putfield Board/columns Ljava/util/Vector;
  pop
  iconst_0
  istore_3
  start_0:
  iload_3
  aload_0
  getfield Board/width I
  if_icmpge stop_1
  new java/util/Vector
  dup
  aload_0
  getfield Board/height I
  invokenonvirtual java/util/Vector/<init>(I)V
  astore 5
  iconst_0
  istore 4
  start_4:
  iload 4
  aload_0
  getfield Board/height I
  if_icmpge stop_5
  aload 5
  aload_0
  getfield Board/SPACE Ljava/lang/Character;
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  iinc 4 1
  goto start_4
  stop_5:
  aload_0
  getfield Board/columns Ljava/util/Vector;
  aload 5
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  iinc 3 1
  goto start_0
  stop_1:
  return
.end method

.method public getWidth()I
  .limit locals 1
  .limit stack 1
  aload_0
  getfield Board/width I
  ireturn
.end method

.method public getHeight()I
  .limit locals 1
  .limit stack 1
  aload_0
  getfield Board/height I
  ireturn
.end method

.method public get(II)Ljava/lang/Character;
  .limit locals 4
  .limit stack 2
  aload_0
  getfield Board/columns Ljava/util/Vector;
  iload_1
  invokevirtual java/util/Vector/elementAt(I)Ljava/lang/Object;
  checkcast java/util/Vector
  astore_3
  aload_3
  iload_2
  invokevirtual java/util/Vector/elementAt(I)Ljava/lang/Object;
  checkcast java/lang/Character
  areturn
.end method

.method public full()Z
  .limit locals 3
  .limit stack 3
  iconst_0
  istore_1
  start_0:
  iload_1
  aload_0
  getfield Board/height I
  if_icmpge stop_1
  iconst_0
  istore_2
  start_4:
  iload_2
  aload_0
  getfield Board/width I
  if_icmpge stop_5
  aload_0
  iload_2
  iload_1
  invokevirtual Board/get(II)Ljava/lang/Character;
  aload_0
  getfield Board/SPACE Ljava/lang/Character;
  if_acmpne stop_8
  iconst_0
  ireturn
  stop_8:
  iinc 2 1
  goto start_4
  stop_5:
  iinc 1 1
  goto start_0
  stop_1:
  iconst_1
  ireturn
.end method

.method public inRange(II)Z
  .limit locals 3
  .limit stack 2
  iconst_0
  iload_1
  if_icmple true_3
  iconst_0
  goto stop_4
  true_3:
  iconst_1
  stop_4:
  dup
  ifeq false_2
  pop
  iload_1
  aload_0
  getfield Board/width I
  if_icmplt true_5
  iconst_0
  goto stop_6
  true_5:
  iconst_1
  stop_6:
  false_2:
  dup
  ifeq false_1
  pop
  iconst_0
  iload_2
  if_icmple true_7
  iconst_0
  goto stop_8
  true_7:
  iconst_1
  stop_8:
  false_1:
  dup
  ifeq false_0
  pop
  iload_2
  aload_0
  getfield Board/height I
  if_icmplt true_9
  iconst_0
  goto stop_10
  true_9:
  iconst_1
  stop_10:
  false_0:
  ireturn
.end method

.method public set(IILjava/lang/Character;)V
  .limit locals 4
  .limit stack 3
  aload_0
  iload_1
  iload_2
  invokevirtual Board/inRange(II)Z
  ifeq stop_0
  aload_0
  getfield Board/columns Ljava/util/Vector;
  iload_1
  invokevirtual java/util/Vector/elementAt(I)Ljava/lang/Object;
  checkcast java/util/Vector
  aload_3
  iload_2
  invokevirtual java/util/Vector/setElementAt(Ljava/lang/Object;I)V
  stop_0:
  return
.end method

.method public place(ILjava/lang/Character;)V
  .limit locals 3
  .limit stack 4
  aload_0
  iload_1
  invokevirtual Board/isValidColumn(I)Z
  ifeq stop_0
  aload_0
  iload_1
  aload_0
  iload_1
  invokevirtual Board/expectedRow(I)I
  aload_2
  invokevirtual Board/set(IILjava/lang/Character;)V
  stop_0:
  return
.end method

.method public clear(II)V
  .limit locals 3
  .limit stack 4
  aload_0
  iload_1
  iload_2
  aload_0
  getfield Board/SPACE Ljava/lang/Character;
  invokevirtual Board/set(IILjava/lang/Character;)V
  return
.end method

.method public normalize()V
  .limit locals 4
  .limit stack 7
  iconst_0
  istore_2
  start_0:
  iload_2
  aload_0
  getfield Board/height I
  if_icmpge stop_1
  iconst_0
  istore_1
  start_4:
  iload_1
  aload_0
  getfield Board/height I
  iconst_1
  isub
  if_icmpge stop_5
  iconst_0
  istore_3
  start_8:
  iload_3
  aload_0
  getfield Board/width I
  if_icmpge stop_9
  aload_0
  iload_3
  iload_1
  invokevirtual Board/get(II)Ljava/lang/Character;
  aload_0
  getfield Board/SPACE Ljava/lang/Character;
  if_acmpeq true_14
  iconst_0
  goto stop_15
  true_14:
  iconst_1
  stop_15:
  dup
  ifeq false_13
  pop
  aload_0
  iload_3
  iload_1
  iconst_1
  iadd
  invokevirtual Board/get(II)Ljava/lang/Character;
  aload_0
  getfield Board/SPACE Ljava/lang/Character;
  if_acmpne true_16
  iconst_0
  goto stop_17
  true_16:
  iconst_1
  stop_17:
  false_13:
  ifeq stop_12
  aload_0
  iload_3
  iload_1
  aload_0
  iload_3
  iload_1
  iconst_1
  iadd
  invokevirtual Board/get(II)Ljava/lang/Character;
  invokevirtual Board/set(IILjava/lang/Character;)V
  aload_0
  iload_3
  iload_1
  iconst_1
  iadd
  aload_0
  getfield Board/SPACE Ljava/lang/Character;
  invokevirtual Board/set(IILjava/lang/Character;)V
  stop_12:
  iinc 3 1
  goto start_8
  stop_9:
  iinc 1 1
  goto start_4
  stop_5:
  iinc 2 1
  goto start_0
  stop_1:
  return
.end method

.method public expectedRow(I)I
  .limit locals 3
  .limit stack 3
  iconst_0
  iload_1
  if_icmple true_4
  iconst_0
  goto stop_5
  true_4:
  iconst_1
  stop_5:
  dup
  ifeq false_3
  pop
  iload_1
  aload_0
  getfield Board/width I
  if_icmplt true_6
  iconst_0
  goto stop_7
  true_6:
  iconst_1
  stop_7:
  false_3:
  ifne stop_0
  aload_0
  getfield Board/height I
  ireturn
  stop_0:
  aload_0
  getfield Board/height I
  iconst_1
  isub
  istore_2
  start_8:
  iload_2
  iconst_0
  if_icmplt stop_9
  aload_0
  iload_1
  iload_2
  invokevirtual Board/get(II)Ljava/lang/Character;
  aload_0
  getfield Board/SPACE Ljava/lang/Character;
  if_acmpeq stop_12
  iload_2
  iconst_1
  iadd
  ireturn
  stop_12:
  iload_2
  iconst_1
  isub
  istore_2
  goto start_8
  stop_9:
  iconst_0
  ireturn
.end method

.method public isValidColumn(I)Z
  .limit locals 2
  .limit stack 2
  iconst_0
  iload_1
  if_icmple true_2
  iconst_0
  goto stop_3
  true_2:
  iconst_1
  stop_3:
  dup
  ifeq false_1
  pop
  iload_1
  aload_0
  getfield Board/width I
  if_icmplt true_4
  iconst_0
  goto stop_5
  true_4:
  iconst_1
  stop_5:
  false_1:
  dup
  ifeq false_0
  pop
  aload_0
  iload_1
  invokevirtual Board/expectedRow(I)I
  aload_0
  getfield Board/height I
  if_icmpne true_6
  iconst_0
  goto stop_7
  true_6:
  iconst_1
  stop_7:
  false_0:
  ireturn
.end method

.method public print()V
  .limit locals 4
  .limit stack 4
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  astore_1
  iconst_0
  istore_3
  start_0:
  iload_3
  aload_0
  getfield Board/width I
  if_icmpge stop_1
  aload_1
  ldc "|---"
  invokevirtual joos/lib/JoosIO/print(Ljava/lang/String;)V
  iinc 3 1
  goto start_0
  stop_1:
  aload_1
  ldc "|"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_0
  getfield Board/height I
  iconst_1
  isub
  istore_2
  start_4:
  iload_2
  iconst_0
  if_icmplt stop_5
  iconst_0
  istore_3
  start_8:
  iload_3
  aload_0
  getfield Board/width I
  if_icmpge stop_9
  aload_1
  ldc "| "
  invokevirtual joos/lib/JoosIO/print(Ljava/lang/String;)V
  aload_1
  aload_0
  iload_3
  iload_2
  invokevirtual Board/get(II)Ljava/lang/Character;
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/print(Ljava/lang/String;)V
  aload_1
  ldc " "
  invokevirtual joos/lib/JoosIO/print(Ljava/lang/String;)V
  iinc 3 1
  goto start_8
  stop_9:
  aload_1
  ldc "|"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  iconst_0
  istore_3
  start_12:
  iload_3
  aload_0
  getfield Board/width I
  if_icmpge stop_13
  aload_1
  ldc "|---"
  invokevirtual joos/lib/JoosIO/print(Ljava/lang/String;)V
  iinc 3 1
  goto start_12
  stop_13:
  aload_1
  ldc "|"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  iload_2
  iconst_1
  isub
  istore_2
  goto start_4
  stop_5:
  return
.end method

.method public getWinner()Ljava/lang/Character;
  .limit locals 5
  .limit stack 4
  iconst_0
  istore_1
  start_0:
  iload_1
  aload_0
  getfield Board/height I
  if_icmpge stop_1
  iconst_0
  istore_2
  start_4:
  iload_2
  aload_0
  getfield Board/width I
  iconst_4
  isub
  if_icmpge stop_5
  iconst_0
  istore_3
  iload_2
  iconst_1
  iadd
  istore 4
  start_8:
  iload 4
  iload_2
  iconst_4
  iadd
  if_icmpge stop_9
  aload_0
  iload 4
  iconst_1
  isub
  iload_1
  invokevirtual Board/get(II)Ljava/lang/Character;
  aload_0
  iload 4
  iload_1
  invokevirtual Board/get(II)Ljava/lang/Character;
  if_acmpeq stop_12
  iconst_1
  istore_3
  stop_12:
  iinc 4 1
  goto start_8
  stop_9:
  iload_3
  ifeq true_17
  iconst_0
  goto stop_18
  true_17:
  iconst_1
  stop_18:
  dup
  ifeq false_16
  pop
  aload_0
  iload_2
  iload_1
  invokevirtual Board/get(II)Ljava/lang/Character;
  aload_0
  getfield Board/SPACE Ljava/lang/Character;
  if_acmpne true_19
  iconst_0
  goto stop_20
  true_19:
  iconst_1
  stop_20:
  false_16:
  ifeq stop_15
  aload_0
  iload_2
  iload_1
  invokevirtual Board/get(II)Ljava/lang/Character;
  areturn
  stop_15:
  iinc 2 1
  goto start_4
  stop_5:
  iinc 1 1
  goto start_0
  stop_1:
  iconst_0
  istore_2
  start_21:
  iload_2
  aload_0
  getfield Board/width I
  if_icmpge stop_22
  iconst_0
  istore_1
  start_25:
  iload_1
  aload_0
  getfield Board/height I
  iconst_4
  isub
  if_icmpge stop_26
  iconst_0
  istore_3
  iload_1
  iconst_1
  iadd
  istore 4
  start_29:
  iload 4
  iload_1
  iconst_4
  iadd
  if_icmpge stop_30
  aload_0
  iload_2
  iload 4
  iconst_1
  isub
  invokevirtual Board/get(II)Ljava/lang/Character;
  aload_0
  iload_2
  iload 4
  invokevirtual Board/get(II)Ljava/lang/Character;
  if_acmpeq stop_33
  iconst_1
  istore_3
  stop_33:
  iinc 4 1
  goto start_29
  stop_30:
  iload_3
  ifeq true_38
  iconst_0
  goto stop_39
  true_38:
  iconst_1
  stop_39:
  dup
  ifeq false_37
  pop
  aload_0
  iload_2
  iload_1
  invokevirtual Board/get(II)Ljava/lang/Character;
  aload_0
  getfield Board/SPACE Ljava/lang/Character;
  if_acmpne true_40
  iconst_0
  goto stop_41
  true_40:
  iconst_1
  stop_41:
  false_37:
  ifeq stop_36
  aload_0
  iload_2
  iload_1
  invokevirtual Board/get(II)Ljava/lang/Character;
  areturn
  stop_36:
  iinc 1 1
  goto start_25
  stop_26:
  iinc 2 1
  goto start_21
  stop_22:
  iconst_0
  istore_1
  start_42:
  iload_1
  aload_0
  getfield Board/height I
  iconst_3
  isub
  if_icmpge stop_43
  iconst_0
  istore_2
  start_46:
  iload_2
  aload_0
  getfield Board/height I
  iconst_3
  isub
  if_icmpge stop_47
  iconst_0
  istore_3
  iconst_0
  istore 4
  start_50:
  iload 4
  iconst_4
  if_icmpge stop_51
  aload_0
  iload_2
  iload 4
  iadd
  iload_1
  iload 4
  iadd
  invokevirtual Board/get(II)Ljava/lang/Character;
  aload_0
  iload_2
  iload_1
  invokevirtual Board/get(II)Ljava/lang/Character;
  if_acmpeq stop_54
  iconst_1
  istore_3
  stop_54:
  iinc 4 1
  goto start_50
  stop_51:
  iload_3
  ifeq true_59
  iconst_0
  goto stop_60
  true_59:
  iconst_1
  stop_60:
  dup
  ifeq false_58
  pop
  aload_0
  iload_2
  iload_1
  invokevirtual Board/get(II)Ljava/lang/Character;
  aload_0
  getfield Board/SPACE Ljava/lang/Character;
  if_acmpne true_61
  iconst_0
  goto stop_62
  true_61:
  iconst_1
  stop_62:
  false_58:
  ifeq stop_57
  aload_0
  iload_2
  iload_1
  invokevirtual Board/get(II)Ljava/lang/Character;
  areturn
  stop_57:
  iinc 2 1
  goto start_46
  stop_47:
  iinc 1 1
  goto start_42
  stop_43:
  aload_0
  getfield Board/height I
  iconst_1
  isub
  istore_1
  start_63:
  iload_1
  iconst_3
  if_icmplt stop_64
  iconst_0
  istore_2
  start_67:
  iload_2
  aload_0
  getfield Board/width I
  iconst_4
  isub
  if_icmpge stop_68
  iconst_0
  istore_3
  iconst_0
  istore 4
  start_71:
  iload 4
  iconst_4
  if_icmpge stop_72
  aload_0
  iload_2
  iload 4
  iadd
  iload_1
  iload 4
  isub
  invokevirtual Board/get(II)Ljava/lang/Character;
  aload_0
  iload_2
  iload_1
  invokevirtual Board/get(II)Ljava/lang/Character;
  if_acmpeq stop_75
  iconst_1
  istore_3
  stop_75:
  iinc 4 1
  goto start_71
  stop_72:
  iload_3
  ifeq true_80
  iconst_0
  goto stop_81
  true_80:
  iconst_1
  stop_81:
  dup
  ifeq false_79
  pop
  aload_0
  iload_2
  iload_1
  invokevirtual Board/get(II)Ljava/lang/Character;
  aload_0
  getfield Board/SPACE Ljava/lang/Character;
  if_acmpne true_82
  iconst_0
  goto stop_83
  true_82:
  iconst_1
  stop_83:
  false_79:
  ifeq stop_78
  aload_0
  iload_2
  iload_1
  invokevirtual Board/get(II)Ljava/lang/Character;
  areturn
  stop_78:
  iinc 2 1
  goto start_67
  stop_68:
  iload_1
  iconst_1
  isub
  istore_1
  goto start_63
  stop_64:
  aconst_null
  areturn
.end method

.method public static main([Ljava/lang/String;)V
  .limit locals 3
  .limit stack 6
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  astore_2
  new Board
  dup
  ldc 7
  ldc 7
  invokenonvirtual Board/<init>(II)V
  astore_1
  aload_1
  invokevirtual Board/print()V
  aload_1
  ldc 6
  ldc 6
  new java/lang/Character
  dup
  ldc 88
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual Board/set(IILjava/lang/Character;)V
  aload_1
  ldc 6
  iconst_5
  new java/lang/Character
  dup
  ldc 79
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual Board/set(IILjava/lang/Character;)V
  aload_1
  invokevirtual Board/print()V
  aload_1
  invokevirtual Board/normalize()V
  aload_1
  invokevirtual Board/print()V
  return
.end method

