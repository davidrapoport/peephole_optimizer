.class public Main

.super java/lang/Object

.method public <init>()V
  .limit locals 1
  .limit stack 1
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

.method public static main([Ljava/lang/String;)V
  .limit locals 7
  .limit stack 2
  new Encoder
  dup
  invokenonvirtual Encoder/<init>()V
  dup
  astore_1
  pop
  new Decoder
  dup
  invokenonvirtual Decoder/<init>()V
  dup
  astore_2
  pop
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  dup
  astore_3
  pop
  aload_3
  invokevirtual joos/lib/JoosIO/readLine()Ljava/lang/String;
  dup
  astore 4
  pop
  start_0:
  aload 4
  aconst_null
  if_acmpne true_2
  iconst_0
  goto stop_3
  true_2:
  iconst_1
  stop_3:
  ifeq stop_1
  aload_2
  aload 4
  invokevirtual java/lang/String/trim()Ljava/lang/String;
  invokevirtual Decoder/base64_decode(Ljava/lang/String;)Ljava/lang/String;
  dup
  astore 6
  pop
  aload_3
  aload 6
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_3
  invokevirtual joos/lib/JoosIO/readLine()Ljava/lang/String;
  dup
  astore 4
  pop
  goto start_0
  stop_1:
  return
.end method

