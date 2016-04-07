.class public InGenerate

.super java/lang/Object

.field protected rand Ljoos/lib/JoosRandom;

.method public <init>()V
  .limit locals 1
  .limit stack 3
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  aload_0
  new joos/lib/JoosRandom
  dup
  invokenonvirtual joos/lib/JoosRandom/<init>()V
  putfield InGenerate/rand Ljoos/lib/JoosRandom;
  return
.end method

.method public static main([Ljava/lang/String;)V
  .limit locals 5
  .limit stack 2
  new InGenerate
  dup
  invokenonvirtual InGenerate/<init>()V
  astore_3
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  astore 4
  iconst_0
  istore_1
  iconst_0
  istore_2
  aload 4
  ldc "Dave"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  start_0:
  iload_1
  ldc 500
  if_icmpge stop_1
  aload_3
  iconst_4
  invokevirtual InGenerate/randRange(I)I
  istore_2
  iload_2
  iconst_0
  if_icmpne else_4
  aload 4
  ldc "go north"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_5
  else_4:
  iload_2
  iconst_1
  if_icmpne else_8
  aload 4
  ldc "go south"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_9
  else_8:
  iload_2
  iconst_2
  if_icmpne else_12
  aload 4
  ldc "go east"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_13
  else_12:
  iload_2
  iconst_3
  if_icmpne stop_16
  aload 4
  ldc "go west"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_16:
  stop_13:
  stop_9:
  stop_5:
  aload_3
  ldc 100
  invokevirtual InGenerate/randRange(I)I
  ldc 30
  if_icmple stop_19
  aload 4
  ldc "interact"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_19:
  aload_3
  ldc 100
  invokevirtual InGenerate/randRange(I)I
  ldc 70
  if_icmple stop_22
  aload 4
  ldc "show hp"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_22:
  aload_3
  ldc 100
  invokevirtual InGenerate/randRange(I)I
  ldc 70
  if_icmple stop_25
  aload 4
  ldc "show treasure"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_25:
  aload_3
  ldc 100
  invokevirtual InGenerate/randRange(I)I
  ldc 70
  if_icmple stop_28
  aload 4
  ldc "show coin"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_28:
  iinc 1 1
  goto start_0
  stop_1:
  return
.end method

.method public randRange(I)I
  .limit locals 3
  .limit stack 2
  aload_0
  getfield InGenerate/rand Ljoos/lib/JoosRandom;
  invokevirtual joos/lib/JoosRandom/nextInt()I
  istore_2
  iload_2
  iconst_0
  if_icmpge stop_0
  iload_2
  ineg
  istore_2
  stop_0:
  iload_2
  iload_1
  irem
  ireturn
.end method

