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
  .limit locals 4
  .limit stack 2
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  astore_1
  new Interpretor
  dup
  invokenonvirtual Interpretor/<init>()V
  astore_2
  aload_1
  invokevirtual joos/lib/JoosIO/readLine()Ljava/lang/String;
  astore_3
  start_0:
  aload_3
  ifnonnull true_2
  iconst_0
  goto stop_3
  true_2:
  iconst_1
  stop_3:
  ifeq stop_1
  aload_2
  aload_3
  invokevirtual Interpretor/interpret(Ljava/lang/String;)V
  aload_1
  invokevirtual joos/lib/JoosIO/readLine()Ljava/lang/String;
  astore_3
  goto start_0
  stop_1:
  return
.end method

