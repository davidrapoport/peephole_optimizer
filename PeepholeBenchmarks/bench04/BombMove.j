.class public BombMove

.super Move

.method public <init>()V
  .limit locals 1
  .limit stack 1
  aload_0
  invokenonvirtual Move/<init>()V
  return
.end method

.method public apply(IILBoard;Ljava/lang/Character;)V
  .limit locals 7
  .limit stack 3
  iload_1
  iconst_1
  isub
  istore 5
  start_0:
  iload 5
  iload_1
  iconst_1
  iadd
  if_icmpgt stop_1
  iload_2
  iconst_1
  isub
  istore 6
  start_4:
  iload 6
  iload_2
  iconst_1
  iadd
  if_icmpgt stop_5
  aload_3
  iload 5
  iload 6
  invokevirtual Board/clear(II)V
  iinc 6 1
  goto start_4
  stop_5:
  iinc 5 1
  goto start_0
  stop_1:
  return
.end method

.method public toString()Ljava/lang/String;
  .limit locals 1
  .limit stack 1
  ldc "Bomb: eliminates the contents of all surrounding cells."
  areturn
.end method

