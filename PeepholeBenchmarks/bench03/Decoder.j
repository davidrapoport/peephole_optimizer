.class public Decoder

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
  putfield Decoder/con LConversion;
  pop
  new lib/JoosBitwise
  dup
  invokenonvirtual lib/JoosBitwise/<init>()V
  dup
  aload_0
  swap
  putfield Decoder/uti Llib/JoosBitwise;
  pop
  return
.end method

.method public base64_decode(Ljava/lang/String;)Ljava/lang/String;
  .limit locals 7
  .limit stack 7
  ldc ""
  dup
  astore 6
  pop
  iconst_0
  dup
  istore_2
  pop
  iconst_0
  dup
  istore 5
  pop
  aload_1
  invokevirtual java/lang/String/length()I
  dup
  istore_3
  pop
  iload_3
  iconst_1
  isub
  dup
  istore 4
  pop
  start_0:
  aload_1
  iload 4
  invokevirtual java/lang/String/charAt(I)C
  ldc 61
  if_icmpeq true_2
  iconst_0
  goto stop_3
  true_2:
  iconst_1
  stop_3:
  ifeq stop_1
  iload 5
  iconst_1
  iadd
  dup
  istore 5
  pop
  iload 4
  iconst_1
  isub
  dup
  istore 4
  pop
  goto start_0
  stop_1:
  iconst_0
  dup
  istore 4
  pop
  start_4:
  iload 4
  iload_3
  if_icmplt true_6
  iconst_0
  goto stop_7
  true_6:
  iconst_1
  stop_7:
  ifeq stop_5
  iconst_0
  dup
  istore_2
  pop
  iload_3
  iconst_4
  isub
  iload 4
  if_icmpeq true_11
  iconst_0
  goto stop_12
  true_11:
  iconst_1
  stop_12:
  dup
  ifeq false_10
  pop
  iload 5
  iconst_0
  if_icmpgt true_13
  iconst_0
  goto stop_14
  true_13:
  iconst_1
  stop_14:
  false_10:
  ifeq else_8
  iload 5
  iconst_2
  if_icmpeq true_17
  iconst_0
  goto stop_18
  true_17:
  iconst_1
  stop_18:
  ifeq else_15
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  iload_2
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  aload_0
  getfield Decoder/con LConversion;
  aload_1
  iload 4
  invokevirtual java/lang/String/charAt(I)C
  invokevirtual Conversion/get10(I)C
  ldc 18
  invokevirtual lib/JoosBitwise/shl(II)I
  invokevirtual lib/JoosBitwise/or(II)I
  dup
  istore_2
  pop
  aload 6
  dup
  ifnull null_19
  goto stop_20
  null_19:
  pop
  ldc "null"
  stop_20:
  new java/lang/Character
  dup
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  iload_2
  ldc 16
  invokevirtual lib/JoosBitwise/shr(II)I
  ldc 255
  invokevirtual lib/JoosBitwise/and(II)I
  i2c
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  astore 6
  pop
  goto stop_16
  else_15:
  iload 5
  iconst_1
  if_icmpeq true_24
  iconst_0
  goto stop_25
  true_24:
  iconst_1
  stop_25:
  ifeq stop_23
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  iload_2
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  aload_0
  getfield Decoder/con LConversion;
  aload_1
  iload 4
  invokevirtual java/lang/String/charAt(I)C
  invokevirtual Conversion/get10(I)C
  ldc 18
  invokevirtual lib/JoosBitwise/shl(II)I
  invokevirtual lib/JoosBitwise/or(II)I
  dup
  istore_2
  pop
  iload 4
  iconst_1
  iadd
  dup
  istore 4
  pop
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  iload_2
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  aload_0
  getfield Decoder/con LConversion;
  aload_1
  iload 4
  invokevirtual java/lang/String/charAt(I)C
  invokevirtual Conversion/get10(I)C
  ldc 12
  invokevirtual lib/JoosBitwise/shl(II)I
  invokevirtual lib/JoosBitwise/or(II)I
  dup
  istore_2
  pop
  iload 4
  iconst_1
  iadd
  dup
  istore 4
  pop
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  iload_2
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  aload_0
  getfield Decoder/con LConversion;
  aload_1
  iload 4
  invokevirtual java/lang/String/charAt(I)C
  invokevirtual Conversion/get10(I)C
  ldc 6
  invokevirtual lib/JoosBitwise/shl(II)I
  invokevirtual lib/JoosBitwise/or(II)I
  dup
  istore_2
  pop
  aload 6
  dup
  ifnull null_26
  goto stop_27
  null_26:
  pop
  ldc "null"
  stop_27:
  new java/lang/Character
  dup
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  iload_2
  ldc 16
  invokevirtual lib/JoosBitwise/shr(II)I
  ldc 255
  invokevirtual lib/JoosBitwise/and(II)I
  i2c
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  astore 6
  pop
  aload 6
  dup
  ifnull null_30
  goto stop_31
  null_30:
  pop
  ldc "null"
  stop_31:
  new java/lang/Character
  dup
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  iload_2
  ldc 8
  invokevirtual lib/JoosBitwise/shr(II)I
  ldc 255
  invokevirtual lib/JoosBitwise/and(II)I
  i2c
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  astore 6
  pop
  stop_23:
  stop_16:
  aload 6
  areturn
  goto stop_9
  else_8:
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  iload_2
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  aload_0
  getfield Decoder/con LConversion;
  aload_1
  iload 4
  invokevirtual java/lang/String/charAt(I)C
  invokevirtual Conversion/get10(I)C
  ldc 18
  invokevirtual lib/JoosBitwise/shl(II)I
  invokevirtual lib/JoosBitwise/or(II)I
  dup
  istore_2
  pop
  iload 4
  iconst_1
  iadd
  dup
  istore 4
  pop
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  iload_2
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  aload_0
  getfield Decoder/con LConversion;
  aload_1
  iload 4
  invokevirtual java/lang/String/charAt(I)C
  invokevirtual Conversion/get10(I)C
  ldc 12
  invokevirtual lib/JoosBitwise/shl(II)I
  invokevirtual lib/JoosBitwise/or(II)I
  dup
  istore_2
  pop
  iload 4
  iconst_1
  iadd
  dup
  istore 4
  pop
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  iload_2
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  aload_0
  getfield Decoder/con LConversion;
  aload_1
  iload 4
  invokevirtual java/lang/String/charAt(I)C
  invokevirtual Conversion/get10(I)C
  ldc 6
  invokevirtual lib/JoosBitwise/shl(II)I
  invokevirtual lib/JoosBitwise/or(II)I
  dup
  istore_2
  pop
  iload 4
  iconst_1
  iadd
  dup
  istore 4
  pop
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  iload_2
  aload_0
  getfield Decoder/con LConversion;
  aload_1
  iload 4
  invokevirtual java/lang/String/charAt(I)C
  invokevirtual Conversion/get10(I)C
  invokevirtual lib/JoosBitwise/or(II)I
  dup
  istore_2
  pop
  iload 4
  iconst_1
  iadd
  dup
  istore 4
  pop
  aload 6
  dup
  ifnull null_34
  goto stop_35
  null_34:
  pop
  ldc "null"
  stop_35:
  new java/lang/Character
  dup
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  iload_2
  ldc 16
  invokevirtual lib/JoosBitwise/shr(II)I
  ldc 255
  invokevirtual lib/JoosBitwise/and(II)I
  i2c
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  astore 6
  pop
  aload 6
  dup
  ifnull null_38
  goto stop_39
  null_38:
  pop
  ldc "null"
  stop_39:
  new java/lang/Character
  dup
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  iload_2
  ldc 8
  invokevirtual lib/JoosBitwise/shr(II)I
  ldc 255
  invokevirtual lib/JoosBitwise/and(II)I
  i2c
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  astore 6
  pop
  aload 6
  dup
  ifnull null_42
  goto stop_43
  null_42:
  pop
  ldc "null"
  stop_43:
  new java/lang/Character
  dup
  aload_0
  getfield Decoder/uti Llib/JoosBitwise;
  iload_2
  ldc 255
  invokevirtual lib/JoosBitwise/and(II)I
  i2c
  invokenonvirtual java/lang/Character/<init>(C)V
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  astore 6
  pop
  stop_9:
  goto start_4
  stop_5:
  aload 6
  areturn
  nop
.end method

