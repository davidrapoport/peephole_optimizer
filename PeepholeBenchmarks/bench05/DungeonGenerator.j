.class public DungeonGenerator

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
  .limit stack 3
  new DungeonInfos
  dup
  invokenonvirtual DungeonInfos/<init>()V
  astore_1
  aload_1
  invokevirtual DungeonInfos/initializeFromStdIn()V
  new Dungeon
  dup
  aload_1
  invokenonvirtual Dungeon/<init>(LDungeonInfos;)V
  astore_2
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  astore_3
  aload_2
  invokevirtual Dungeon/draw()V
  return
.end method

