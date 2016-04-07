.class public AmazingCalculator

.super java/lang/Object

.method public <init>()V
  .limit locals 1
  .limit stack 1
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

.method public factorial(I)I
  .limit locals 2
  .limit stack 4
  iload_1
  iconst_0
  if_icmpne else_0
  iconst_1
  ireturn
  goto stop_1
  else_0:
  iload_1
  aload_0
  iload_1
  iconst_1
  isub
  invokevirtual AmazingCalculator/factorial(I)I
  imul
  ireturn
  stop_1:
.end method

.method public bla()V
  .limit locals 1
  .limit stack 0
  return
.end method

