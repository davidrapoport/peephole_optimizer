.class public CustomPoint

.super java/lang/Object

.field protected x I
.field protected y I

.method public <init>()V
  .limit locals 1
  .limit stack 2
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  aload_0
  iconst_0
  putfield CustomPoint/x I
  aload_0
  iconst_0
  putfield CustomPoint/y I
  return
.end method

.method public <init>(II)V
  .limit locals 3
  .limit stack 2
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  aload_0
  iload_1
  putfield CustomPoint/x I
  aload_0
  iload_2
  putfield CustomPoint/y I
  return
.end method

.method public getX()I
  .limit locals 1
  .limit stack 1
  aload_0
  getfield CustomPoint/x I
  ireturn
.end method

.method public getY()I
  .limit locals 1
  .limit stack 1
  aload_0
  getfield CustomPoint/y I
  ireturn
.end method

