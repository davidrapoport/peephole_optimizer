.class public Decoder

.super java/lang/Object

.field protected con LConversion;
.field protected uti Llib/JoosBitwise;

.method public <init>()V
  .limit locals 1
  .limit stack 3
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  aload_0
  new Conversion
  dup
  invokenonvirtual Conversion/<init>()V
  putfield Decoder/con LConversion;
  aload_0
  new lib/JoosBitwise
  dup
  invokenonvirtual lib/JoosBitwise/<init>()V
  putfield Decoder/uti Llib/JoosBitwise;
  return
.end method

.method public base64_decode(Ljava/lang/String;)Ljava/lang/String;
  .limit locals 7
  .limit stack 7
  ldc ""
  astore 6
  iconst_0
  istore_2
  iconst_0
  istore 5
  aload_1
  invokevirtual java/lang/String/length()I
  istore_3
  iload_3
  iconst_1
  isub
  istore 4
  start_0:
  aload_1
  iload 4
  invokevirtual java/lang/String/charAt(I)C
  ldc 61
  if_icmpne stop_1
  iinc 5 1
  iload 4
  iconst_1
  isub
  istore 4
  goto start_0
  stop_1:
  iconst_0
  istore 4
  start_4:
  iload 4
  iload_3
  if_icmpge stop_5
  iconst_0
  istore_2
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
  if_icmpne else_15
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
  istore_2
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
  astore 6
  goto stop_16
  else_15:
  iload 5
  iconst_1
  if_icmpne stop_23
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
  istore_2
  iinc 4 1
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
  istore_2
  iinc 4 1
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
  istore_2
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
  astore 6
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
  astore 6
  stop_23:
  stop_16:
  aload 6
  areturn
  goto start_4
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
  istore_2
  iinc 4 1
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
  istore_2
  iinc 4 1
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
  istore_2
  iinc 4 1
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
  istore_2
  iinc 4 1
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
  astore 6
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
  astore 6
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
  astore 6
  stop_9:
  goto start_4
  stop_5:
  aload 6
  areturn
.end method

