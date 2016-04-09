.class public Test

.super java/lang/Object

.field protected aTest LTest;

.method public <init>(II)V
  .limit locals 3
  .limit stack 3
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  iload_2
  istore_1
  aconst_null
  dup
  aload_0
  swap
  putfield Test/aTest LTest;
  pop
  return
.end method

.method public <init>()V
  .limit locals 3
  .limit stack 4
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  iconst_5
  istore_1
  iload_1
  istore_2
  iinc 1 1
  new Test
  dup
  iload_1
  iload_1
  invokenonvirtual Test/<init>(II)V
  dup
  aload_0
  swap
  putfield Test/aTest LTest;
  pop
  return
.end method

