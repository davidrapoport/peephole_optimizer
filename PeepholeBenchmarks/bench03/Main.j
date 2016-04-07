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
  astore_1
  new Decoder
  dup
  invokenonvirtual Decoder/<init>()V
  astore_2
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  astore_3
  aload_3
  invokevirtual joos/lib/JoosIO/readLine()Ljava/lang/String;
  astore 4
  start_0:
  aload 4
  ifnull stop_1
  aload_2
  aload 4
  invokevirtual java/lang/String/trim()Ljava/lang/String;
  invokevirtual Decoder/base64_decode(Ljava/lang/String;)Ljava/lang/String;
  astore 6
  aload_3
  aload 6
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_3
  invokevirtual joos/lib/JoosIO/readLine()Ljava/lang/String;
  astore 4
  goto start_0
  stop_1:
  return
.end method

