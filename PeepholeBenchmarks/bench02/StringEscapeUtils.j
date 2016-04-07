.class public StringEscapeUtils

.super java/lang/Object

.method public <init>()V
  .limit locals 1
  .limit stack 1
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

.method public escape(Ljava/lang/String;)Ljava/lang/String;
  .limit locals 3
  .limit stack 4
  aload_0
  aload_1
  ldc "::"
  ldc ":"
  invokevirtual StringEscapeUtils/replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  astore_2
  aload_0
  aload_2
  ldc ":)"
  ldc "\n"
  invokevirtual StringEscapeUtils/replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  astore_2
  aload_0
  aload_2
  ldc ":o"
  ldc "\0007"
  invokevirtual StringEscapeUtils/replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  astore_2
  aload_0
  aload_2
  ldc ":>"
  ldc "\t"
  invokevirtual StringEscapeUtils/replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  astore_2
  aload_2
  areturn
.end method

.method public replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .limit locals 8
  .limit stack 5
  aload_1
  aload_2
  iconst_0
  invokevirtual java/lang/String/indexOf(Ljava/lang/String;I)I
  istore 5
  iload 5
  iconst_0
  if_icmplt stop_0
  aload_1
  iconst_0
  iload 5
  invokevirtual java/lang/String/substring(II)Ljava/lang/String;
  astore 6
  aload_1
  iload 5
  aload_2
  invokevirtual java/lang/String/length()I
  iadd
  aload_1
  invokevirtual java/lang/String/length()I
  invokevirtual java/lang/String/substring(II)Ljava/lang/String;
  astore 7
  aload 6
  dup
  ifnull null_5
  goto stop_6
  null_5:
  pop
  ldc "null"
  stop_6:
  aload_3
  dup
  ifnull null_7
  goto stop_8
  null_7:
  pop
  ldc "null"
  stop_8:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_3
  goto stop_4
  null_3:
  pop
  ldc "null"
  stop_4:
  aload_0
  aload 7
  aload_2
  aload_3
  invokevirtual StringEscapeUtils/replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_9
  goto stop_10
  null_9:
  pop
  ldc "null"
  stop_10:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  areturn
  stop_0:
  aload_1
  areturn
.end method

