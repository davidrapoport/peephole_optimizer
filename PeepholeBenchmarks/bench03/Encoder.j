.class public Encoder

.super java/lang/Object

.field protected con LConversion;
.field protected uti Llib/JoosBitwise;

.method public <init>()V
  .limit locals 1
  .limit stack 3
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  new Conversion
  dup
  invokenonvirtual Conversion/<init>()V
  dup
  aload_0
  swap
  putfield Encoder/con LConversion;
  pop
  new lib/JoosBitwise
  dup
  invokenonvirtual lib/JoosBitwise/<init>()V
  dup
  aload_0
  swap
  putfield Encoder/uti Llib/JoosBitwise;
  pop
  return
.end method

.method public base64_encode(Ljava/lang/String;)Ljava/lang/String;
  .limit locals 7
  .limit stack 8
  ldc ""
  dup
  astore 6
  pop
  iconst_0
  dup
  istore_2
  pop
  aload_1
  invokevirtual java/lang/String/length()I
  dup
  istore_3
  pop
  iload_3
  iconst_3
  irem
  dup
  istore 4
  pop
  iconst_0
  dup
  istore 5
  pop
  start_0:
  iload 5
  iload_3
  if_icmplt true_2
  iconst_0
  goto stop_3
  true_2:
  iconst_1
  stop_3:
  ifeq stop_1
  iconst_0
  dup
  istore_2
  pop
  iload_3
  iload 5
  isub
  iload 4
  if_icmpeq true_6
  iconst_0
  goto stop_7
  true_6:
  iconst_1
  stop_7:
  ifeq else_4
  iload 4
  iconst_2
  if_icmpeq true_9
  iconst_0
  goto stop_10
  true_9:
  iconst_1
  stop_10:
  ifeq stop_8
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  iload_2
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  aload_1
  iload 5
  iconst_1
  iadd
  invokevirtual java/lang/String/charAt(I)C
  ldc 8
  invokevirtual lib/JoosBitwise/shl(II)I
  invokevirtual lib/JoosBitwise/or(II)I
  dup
  istore_2
  pop
  stop_8:
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  iload_2
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  aload_1
  iload 5
  invokevirtual java/lang/String/charAt(I)C
  ldc 16
  invokevirtual lib/JoosBitwise/shl(II)I
  invokevirtual lib/JoosBitwise/or(II)I
  dup
  istore_2
  pop
  aload 6
  dup
  ifnull null_11
  goto stop_12
  null_11:
  pop
  ldc "null"
  stop_12:
  new java/lang/Character
  dup
  aload_0
  getfield Encoder/con LConversion;
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  iload_2
  ldc 18
  invokevirtual lib/JoosBitwise/shr(II)I
  ldc 63
  invokevirtual lib/JoosBitwise/and(II)I
  invokevirtual Conversion/get64(I)C
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  astore 6
  pop
  aload 6
  dup
  ifnull null_15
  goto stop_16
  null_15:
  pop
  ldc "null"
  stop_16:
  new java/lang/Character
  dup
  aload_0
  getfield Encoder/con LConversion;
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  iload_2
  ldc 12
  invokevirtual lib/JoosBitwise/shr(II)I
  ldc 63
  invokevirtual lib/JoosBitwise/and(II)I
  invokevirtual Conversion/get64(I)C
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  astore 6
  pop
  iload 4
  iconst_2
  if_icmpeq true_21
  iconst_0
  goto stop_22
  true_21:
  iconst_1
  stop_22:
  ifeq else_19
  aload 6
  dup
  ifnull null_23
  goto stop_24
  null_23:
  pop
  ldc "null"
  stop_24:
  new java/lang/Character
  dup
  aload_0
  getfield Encoder/con LConversion;
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  iload_2
  ldc 6
  invokevirtual lib/JoosBitwise/shr(II)I
  ldc 63
  invokevirtual lib/JoosBitwise/and(II)I
  invokevirtual Conversion/get64(I)C
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  astore 6
  pop
  goto stop_20
  else_19:
  aload 6
  dup
  ifnull null_27
  goto stop_28
  null_27:
  pop
  ldc "null"
  stop_28:
  new java/lang/Character
  dup
  ldc 61
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  astore 6
  pop
  stop_20:
  aload 6
  dup
  ifnull null_31
  goto stop_32
  null_31:
  pop
  ldc "null"
  stop_32:
  new java/lang/Character
  dup
  ldc 61
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  astore 6
  pop
  iload 5
  iload 4
  iadd
  dup
  istore 5
  pop
  goto stop_5
  else_4:
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  iload_2
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  aload_1
  iload 5
  invokevirtual java/lang/String/charAt(I)C
  ldc 16
  invokevirtual lib/JoosBitwise/shl(II)I
  invokevirtual lib/JoosBitwise/or(II)I
  dup
  istore_2
  pop
  iload 5
  iconst_1
  iadd
  dup
  istore 5
  pop
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  iload_2
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  aload_1
  iload 5
  invokevirtual java/lang/String/charAt(I)C
  ldc 8
  invokevirtual lib/JoosBitwise/shl(II)I
  invokevirtual lib/JoosBitwise/or(II)I
  dup
  istore_2
  pop
  iload 5
  iconst_1
  iadd
  dup
  istore 5
  pop
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  iload_2
  aload_1
  iload 5
  invokevirtual java/lang/String/charAt(I)C
  invokevirtual lib/JoosBitwise/or(II)I
  dup
  istore_2
  pop
  iload 5
  iconst_1
  iadd
  dup
  istore 5
  pop
  aload 6
  dup
  ifnull null_35
  goto stop_36
  null_35:
  pop
  ldc "null"
  stop_36:
  new java/lang/Character
  dup
  aload_0
  getfield Encoder/con LConversion;
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  iload_2
  ldc 18
  invokevirtual lib/JoosBitwise/shr(II)I
  ldc 63
  invokevirtual lib/JoosBitwise/and(II)I
  invokevirtual Conversion/get64(I)C
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  astore 6
  pop
  aload 6
  dup
  ifnull null_39
  goto stop_40
  null_39:
  pop
  ldc "null"
  stop_40:
  new java/lang/Character
  dup
  aload_0
  getfield Encoder/con LConversion;
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  iload_2
  ldc 12
  invokevirtual lib/JoosBitwise/shr(II)I
  ldc 63
  invokevirtual lib/JoosBitwise/and(II)I
  invokevirtual Conversion/get64(I)C
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  astore 6
  pop
  aload 6
  dup
  ifnull null_43
  goto stop_44
  null_43:
  pop
  ldc "null"
  stop_44:
  new java/lang/Character
  dup
  aload_0
  getfield Encoder/con LConversion;
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  iload_2
  ldc 6
  invokevirtual lib/JoosBitwise/shr(II)I
  ldc 63
  invokevirtual lib/JoosBitwise/and(II)I
  invokevirtual Conversion/get64(I)C
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  astore 6
  pop
  aload 6
  dup
  ifnull null_47
  goto stop_48
  null_47:
  pop
  ldc "null"
  stop_48:
  new java/lang/Character
  dup
  aload_0
  getfield Encoder/con LConversion;
  aload_0
  getfield Encoder/uti Llib/JoosBitwise;
  iload_2
  ldc 63
  invokevirtual lib/JoosBitwise/and(II)I
  invokevirtual Conversion/get64(I)C
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  astore 6
  pop
  stop_5:
  goto start_0
  stop_1:
  aload 6
  areturn
  nop
.end method

