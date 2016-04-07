.class public Main

.super java/lang/Object

.field protected generator LComplementsGenerator;
.field protected calc LAmazingCalculator;
.field protected r Ljoos/lib/JoosRandom;

.method public <init>()V
  .limit locals 1
  .limit stack 1
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

.method public static main([Ljava/lang/String;)V
  .limit locals 19
  .limit stack 6
  new joos/lib/JoosRandom
  dup
  iconst_1
  invokenonvirtual joos/lib/JoosRandom/<init>(I)V
  astore 15
  new ComplementsGenerator
  dup
  invokenonvirtual ComplementsGenerator/<init>()V
  astore 16
  new AmazingCalculator
  dup
  invokenonvirtual AmazingCalculator/<init>()V
  astore 17
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  astore 11
  aload 11
  ldc "Please enter your input.\n"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload 11
  invokevirtual joos/lib/JoosIO/readLine()Ljava/lang/String;
  astore 12
  new java/util/StringTokenizer
  dup
  aload 12
  invokenonvirtual java/util/StringTokenizer/<init>(Ljava/lang/String;)V
  astore 13
  aload 13
  ldc ","
  invokevirtual java/util/StringTokenizer/nextToken(Ljava/lang/String;)Ljava/lang/String;
  astore 14
  aload 14
  ldc "random"
  invokevirtual java/lang/String/equals(Ljava/lang/Object;)Z
  ifne else_0
  aload 14
  astore 4
  aload 13
  ldc ","
  invokevirtual java/util/StringTokenizer/nextToken(Ljava/lang/String;)Ljava/lang/String;
  astore 5
  aload 13
  ldc ","
  invokevirtual java/util/StringTokenizer/nextToken(Ljava/lang/String;)Ljava/lang/String;
  astore 6
  aload 13
  ldc ","
  invokevirtual java/util/StringTokenizer/nextToken(Ljava/lang/String;)Ljava/lang/String;
  astore 18
  goto stop_1
  else_0:
  aload 16
  invokevirtual ComplementsGenerator/generateAdjective()Ljava/lang/String;
  astore 4
  aload 16
  invokevirtual ComplementsGenerator/generateNoun()Ljava/lang/String;
  astore 5
  aload 16
  invokevirtual ComplementsGenerator/generateVerb()Ljava/lang/String;
  astore 6
  aload 13
  ldc ","
  invokevirtual java/util/StringTokenizer/nextToken(Ljava/lang/String;)Ljava/lang/String;
  astore 18
  stop_1:
  new java/lang/Integer
  dup
  aload 18
  invokenonvirtual java/lang/Integer/<init>(Ljava/lang/String;)V
  invokevirtual java/lang/Integer/intValue()I
  istore 9
  aload 16
  aload 4
  aload 6
  aload 5
  invokevirtual ComplementsGenerator/generateComment(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  astore 7
  iconst_2
  istore_1
  aload 15
  invokevirtual joos/lib/JoosRandom/nextInt()I
  iload_1
  irem
  istore 10
  iload 10
  iconst_0
  if_icmpne else_4
  new GirlFriend
  dup
  invokenonvirtual GirlFriend/<init>()V
  astore_3
  ldc "girl-friend"
  astore_2
  goto stop_5
  else_4:
  new FemaleBoss
  dup
  invokenonvirtual FemaleBoss/<init>()V
  astore_3
  ldc "boss"
  astore_2
  stop_5:
  aload_3
  aload 16
  invokevirtual ComplementsGenerator/getComplementNumber()I
  invokevirtual Woman/setComplementNumber(I)V
  aload_3
  aload 7
  aload 4
  aload 5
  aload 6
  invokevirtual Woman/react(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  astore 8
  aload 11
  ldc "You have just told your "
  dup
  ifnull null_26
  goto stop_27
  null_26:
  pop
  ldc "null"
  stop_27:
  aload_2
  dup
  ifnull null_28
  goto stop_29
  null_28:
  pop
  ldc "null"
  stop_29:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_24
  goto stop_25
  null_24:
  pop
  ldc "null"
  stop_25:
  ldc ":\n\n"
  dup
  ifnull null_30
  goto stop_31
  null_30:
  pop
  ldc "null"
  stop_31:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_22
  goto stop_23
  null_22:
  pop
  ldc "null"
  stop_23:
  aload 7
  dup
  ifnull null_32
  goto stop_33
  null_32:
  pop
  ldc "null"
  stop_33:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_20
  goto stop_21
  null_20:
  pop
  ldc "null"
  stop_21:
  ldc "\n\nher response is: "
  dup
  ifnull null_34
  goto stop_35
  null_34:
  pop
  ldc "null"
  stop_35:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_18
  goto stop_19
  null_18:
  pop
  ldc "null"
  stop_19:
  aload 8
  dup
  ifnull null_36
  goto stop_37
  null_36:
  pop
  ldc "null"
  stop_37:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_16
  goto stop_17
  null_16:
  pop
  ldc "null"
  stop_17:
  ldc "\n\n"
  dup
  ifnull null_38
  goto stop_39
  null_38:
  pop
  ldc "null"
  stop_39:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_14
  goto stop_15
  null_14:
  pop
  ldc "null"
  stop_15:
  ldc "(also, the factorial of "
  dup
  ifnull null_40
  goto stop_41
  null_40:
  pop
  ldc "null"
  stop_41:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_12
  goto stop_13
  null_12:
  pop
  ldc "null"
  stop_13:
  ldc "the number you have entered is "
  dup
  ifnull null_42
  goto stop_43
  null_42:
  pop
  ldc "null"
  stop_43:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_10
  goto stop_11
  null_10:
  pop
  ldc "null"
  stop_11:
  new java/lang/Integer
  dup
  aload 17
  iload 9
  invokevirtual AmazingCalculator/factorial(I)I
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_8
  goto stop_9
  null_8:
  pop
  ldc "null"
  stop_9:
  ldc ")\n"
  dup
  ifnull null_46
  goto stop_47
  null_46:
  pop
  ldc "null"
  stop_47:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  return
.end method

