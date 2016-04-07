.class public Game

.super java/lang/Object

.field protected board LBoard;
.field protected X Ljava/lang/Character;
.field protected O Ljava/lang/Character;
.field protected currentPlayer Ljava/lang/Character;
.field protected moves Ljava/util/Vector;
.field protected playerXMoves Ljava/util/Vector;
.field protected playerOMoves Ljava/util/Vector;
.field protected maxSpecialtyMoves I

.method public <init>(LBoard;)V
  .limit locals 2
  .limit stack 4
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  aload_0
  aload_1
  putfield Game/board LBoard;
  aload_0
  new java/lang/Character
  dup
  ldc 88
  invokenonvirtual java/lang/Character/<init>(C)V
  putfield Game/X Ljava/lang/Character;
  aload_0
  new java/lang/Character
  dup
  ldc 79
  invokenonvirtual java/lang/Character/<init>(C)V
  putfield Game/O Ljava/lang/Character;
  aload_0
  getfield Game/X Ljava/lang/Character;
  dup
  aload_0
  swap
  putfield Game/currentPlayer Ljava/lang/Character;
  pop
  aload_0
  new java/util/Vector
  dup
  invokenonvirtual java/util/Vector/<init>()V
  putfield Game/moves Ljava/util/Vector;
  aload_0
  new java/util/Vector
  dup
  invokenonvirtual java/util/Vector/<init>()V
  putfield Game/playerXMoves Ljava/util/Vector;
  aload_0
  new java/util/Vector
  dup
  invokenonvirtual java/util/Vector/<init>()V
  putfield Game/playerOMoves Ljava/util/Vector;
  aload_0
  iconst_3
  putfield Game/maxSpecialtyMoves I
  return
.end method

.method public fillPlayerMovesNormalMode(Ljava/util/Vector;)V
  .limit locals 2
  .limit stack 3
  aload_1
  new ClassicMove
  dup
  invokenonvirtual ClassicMove/<init>()V
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  aload_1
  new BombMove
  dup
  invokenonvirtual BombMove/<init>()V
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  aload_1
  new KillRowMove
  dup
  invokenonvirtual KillRowMove/<init>()V
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  aload_1
  new FlipBoardMove
  dup
  invokenonvirtual FlipBoardMove/<init>()V
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  return
.end method

.method public fillMoves(Ljava/util/Vector;)V
  .limit locals 2
  .limit stack 3
  aload_1
  new ClassicMove
  dup
  invokenonvirtual ClassicMove/<init>()V
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  aload_1
  new BombMove
  dup
  invokenonvirtual BombMove/<init>()V
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  aload_1
  new DiagBombMove
  dup
  invokenonvirtual DiagBombMove/<init>()V
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  aload_1
  new KillRowMove
  dup
  invokenonvirtual KillRowMove/<init>()V
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  aload_1
  new KillColumnMove
  dup
  invokenonvirtual KillColumnMove/<init>()V
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  aload_1
  new KillRowAndColumnMove
  dup
  invokenonvirtual KillRowAndColumnMove/<init>()V
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  aload_1
  new FlipBoardMove
  dup
  invokenonvirtual FlipBoardMove/<init>()V
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  return
.end method

.method public setSpecialtyMoves(Ljava/util/Vector;)V
  .limit locals 6
  .limit stack 3
  new java/util/Random
  dup
  invokenonvirtual java/util/Random/<init>()V
  astore 4
  new java/util/Vector
  dup
  invokenonvirtual java/util/Vector/<init>()V
  astore 5
  iconst_0
  istore_3
  aload_1
  new ClassicMove
  dup
  invokenonvirtual ClassicMove/<init>()V
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  aload_0
  aload 5
  invokevirtual Game/fillMoves(Ljava/util/Vector;)V
  iconst_0
  istore_2
  start_0:
  iload_2
  aload_0
  getfield Game/maxSpecialtyMoves I
  if_icmpge stop_1
  start_4:
  iload_3
  iconst_0
  if_icmpne stop_5
  aload 4
  aload 5
  invokevirtual java/util/Vector/size()I
  invokevirtual java/util/Random/nextInt(I)I
  istore_3
  goto start_4
  stop_5:
  aload_1
  aload 5
  iload_3
  invokevirtual java/util/Vector/elementAt(I)Ljava/lang/Object;
  invokevirtual java/util/Vector/addElement(Ljava/lang/Object;)V
  aload 5
  iload_3
  invokevirtual java/util/Vector/removeElementAt(I)V
  iconst_0
  istore_3
  iinc 2 1
  goto start_0
  stop_1:
  return
.end method

.method public getX()Ljava/lang/Character;
  .limit locals 1
  .limit stack 1
  aload_0
  getfield Game/X Ljava/lang/Character;
  areturn
.end method

.method public getO()Ljava/lang/Character;
  .limit locals 1
  .limit stack 1
  aload_0
  getfield Game/O Ljava/lang/Character;
  areturn
.end method

.method public getCurrentPlayer()Ljava/lang/Character;
  .limit locals 1
  .limit stack 1
  aload_0
  getfield Game/currentPlayer Ljava/lang/Character;
  areturn
.end method

.method public getOtherPlayer()Ljava/lang/Character;
  .limit locals 1
  .limit stack 2
  aload_0
  getfield Game/currentPlayer Ljava/lang/Character;
  aload_0
  getfield Game/X Ljava/lang/Character;
  if_acmpne stop_0
  aload_0
  getfield Game/O Ljava/lang/Character;
  areturn
  stop_0:
  aload_0
  getfield Game/X Ljava/lang/Character;
  areturn
.end method

.method public getOpponent(Ljava/lang/Character;)Ljava/lang/Character;
  .limit locals 2
  .limit stack 2
  aload_1
  aload_0
  getfield Game/X Ljava/lang/Character;
  if_acmpne stop_0
  aload_0
  getfield Game/O Ljava/lang/Character;
  areturn
  stop_0:
  aload_0
  getfield Game/X Ljava/lang/Character;
  areturn
.end method

.method public togglePlayer()V
  .limit locals 1
  .limit stack 3
  aload_0
  getfield Game/currentPlayer Ljava/lang/Character;
  aload_0
  getfield Game/X Ljava/lang/Character;
  if_acmpne else_0
  aload_0
  getfield Game/O Ljava/lang/Character;
  dup
  aload_0
  swap
  putfield Game/currentPlayer Ljava/lang/Character;
  pop
  goto stop_1
  else_0:
  aload_0
  getfield Game/X Ljava/lang/Character;
  dup
  aload_0
  swap
  putfield Game/currentPlayer Ljava/lang/Character;
  pop
  stop_1:
  return
.end method

.method public getCurrPlayerMoves()Ljava/util/Vector;
  .limit locals 1
  .limit stack 2
  aload_0
  invokevirtual Game/getCurrentPlayer()Ljava/lang/Character;
  aload_0
  invokevirtual Game/getX()Ljava/lang/Character;
  if_acmpne stop_0
  aload_0
  getfield Game/playerXMoves Ljava/util/Vector;
  areturn
  stop_0:
  aload_0
  getfield Game/playerOMoves Ljava/util/Vector;
  areturn
.end method

.method public printMenu()V
  .limit locals 5
  .limit stack 4
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  astore_1
  aload_0
  invokevirtual Game/getCurrPlayerMoves()Ljava/util/Vector;
  astore 4
  iconst_0
  istore_2
  start_0:
  iload_2
  aload 4
  invokevirtual java/util/Vector/size()I
  if_icmpge stop_1
  iload_2
  iconst_1
  iadd
  istore_3
  aload_1
  new java/lang/Integer
  dup
  iload_3
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  ldc " - "
  dup
  ifnull null_8
  goto stop_9
  null_8:
  pop
  ldc "null"
  stop_9:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_4
  goto stop_5
  null_4:
  pop
  ldc "null"
  stop_5:
  aload 4
  iload_2
  invokevirtual java/util/Vector/elementAt(I)Ljava/lang/Object;
  invokevirtual java/lang/Object/toString()Ljava/lang/String;
  dup
  ifnull null_10
  goto stop_11
  null_10:
  pop
  ldc "null"
  stop_11:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  iinc 2 1
  goto start_0
  stop_1:
  return
.end method

.method public doMove()V
  .limit locals 6
  .limit stack 4
  aload_0
  invokevirtual Game/getCurrPlayerMoves()Ljava/util/Vector;
  astore_1
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  astore_2
  iconst_0
  istore 4
  iconst_0
  istore 5
  aload_2
  ldc "Player "
  dup
  ifnull null_2
  goto stop_3
  null_2:
  pop
  ldc "null"
  stop_3:
  aload_0
  invokevirtual Game/getCurrentPlayer()Ljava/lang/Character;
  dup
  ifnull null_4
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  goto stop_5
  null_4:
  pop
  ldc "null"
  stop_5:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_0
  goto stop_1
  null_0:
  pop
  ldc "null"
  stop_1:
  ldc "'s turn -> What would you like to do?"
  dup
  ifnull null_6
  goto stop_7
  null_6:
  pop
  ldc "null"
  stop_7:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_0
  invokevirtual Game/printMenu()V
  start_8:
  iload 4
  ifne stop_9
  aload_2
  invokevirtual joos/lib/JoosIO/readInt()I
  istore 5
  iload 5
  iconst_0
  if_icmpgt true_15
  iconst_0
  goto stop_16
  true_15:
  iconst_1
  stop_16:
  dup
  ifeq false_14
  pop
  iload 5
  aload_1
  invokevirtual java/util/Vector/size()I
  if_icmple true_17
  iconst_0
  goto stop_18
  true_17:
  iconst_1
  stop_18:
  false_14:
  ifeq else_12
  iconst_1
  istore 4
  goto start_8
  else_12:
  aload_2
  ldc "Invalid choice, please choose again:"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_0
  invokevirtual Game/printMenu()V
  stop_13:
  goto start_8
  stop_9:
  aload_0
  iload 5
  iconst_1
  isub
  invokevirtual Game/applyMove(I)V
  return
.end method

.method public getColumnChoice()I
  .limit locals 6
  .limit stack 5
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  astore_1
  aload_0
  getfield Game/board LBoard;
  invokevirtual Board/getWidth()I
  istore_3
  iconst_0
  istore 4
  iconst_0
  istore_2
  aload_1
  ldc "Please choose a column between 1 and "
  dup
  ifnull null_0
  goto stop_1
  null_0:
  pop
  ldc "null"
  stop_1:
  new java/lang/Integer
  dup
  iload_3
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  start_4:
  iload 4
  ifne stop_5
  aload_1
  invokevirtual joos/lib/JoosIO/readInt()I
  istore_2
  iload_2
  iconst_0
  if_icmpgt true_12
  iconst_0
  goto stop_13
  true_12:
  iconst_1
  stop_13:
  dup
  ifeq false_11
  pop
  iload_2
  iload_3
  if_icmple true_14
  iconst_0
  goto stop_15
  true_14:
  iconst_1
  stop_15:
  false_11:
  ifne stop_8
  aload_1
  ldc "Invalid column choice, please choose a column number between 1 and "
  dup
  ifnull null_18
  goto stop_19
  null_18:
  pop
  ldc "null"
  stop_19:
  new java/lang/Integer
  dup
  iload_3
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_16
  goto stop_17
  null_16:
  pop
  ldc "null"
  stop_17:
  ldc ":"
  dup
  ifnull null_22
  goto stop_23
  null_22:
  pop
  ldc "null"
  stop_23:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_8:
  aload_0
  getfield Game/board LBoard;
  iload_2
  iconst_1
  isub
  invokevirtual Board/isValidColumn(I)Z
  ifne else_24
  aload_1
  ldc "Error: column is full, please choose again:"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto start_4
  else_24:
  iconst_1
  istore 4
  stop_25:
  goto start_4
  stop_5:
  iload_2
  iconst_1
  isub
  ireturn
.end method

.method public applyMove(I)V
  .limit locals 6
  .limit stack 5
  aload_0
  invokevirtual Game/getColumnChoice()I
  istore_2
  aload_0
  getfield Game/board LBoard;
  iload_2
  invokevirtual Board/expectedRow(I)I
  istore_3
  aload_0
  invokevirtual Game/getCurrPlayerMoves()Ljava/util/Vector;
  astore 4
  aload 4
  iload_1
  invokevirtual java/util/Vector/elementAt(I)Ljava/lang/Object;
  checkcast Move
  astore 5
  aload 5
  iload_2
  iload_3
  aload_0
  getfield Game/board LBoard;
  aload_0
  invokevirtual Game/getCurrentPlayer()Ljava/lang/Character;
  invokevirtual Move/apply(IILBoard;Ljava/lang/Character;)V
  iload_1
  iconst_0
  if_icmpeq stop_0
  aload_0
  invokevirtual Game/getCurrPlayerMoves()Ljava/util/Vector;
  iload_1
  invokevirtual java/util/Vector/removeElementAt(I)V
  stop_0:
  aload_0
  getfield Game/board LBoard;
  invokevirtual Board/normalize()V
  return
.end method

.method public printGameModeMenu()V
  .limit locals 2
  .limit stack 2
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  astore_1
  aload_1
  ldc "1 - with fixed specialty moves\n2 - with random specialty moves"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  return
.end method

.method public initGameMode()V
  .limit locals 4
  .limit stack 2
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  astore_1
  iconst_0
  istore_3
  iconst_0
  istore_2
  aload_1
  ldc "\nThank you for playing BATTLE CONNECT FOUR!\n"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_1
  ldc "Before starting, please choose a game mode:"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_0
  invokevirtual Game/printGameModeMenu()V
  start_0:
  iload_3
  ifne stop_1
  aload_1
  invokevirtual joos/lib/JoosIO/readInt()I
  istore_2
  iload_2
  iconst_1
  if_icmpeq true_7
  iconst_0
  goto stop_8
  true_7:
  iconst_1
  stop_8:
  dup
  ifne true_6
  pop
  iload_2
  iconst_2
  if_icmpeq true_9
  iconst_0
  goto stop_10
  true_9:
  iconst_1
  stop_10:
  true_6:
  ifeq else_4
  iconst_1
  istore_3
  goto start_0
  else_4:
  aload_1
  ldc "Invalid choice, please choose again:"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_0
  invokevirtual Game/printGameModeMenu()V
  stop_5:
  goto start_0
  stop_1:
  aload_0
  aload_0
  getfield Game/moves Ljava/util/Vector;
  invokevirtual Game/fillMoves(Ljava/util/Vector;)V
  iload_2
  iconst_1
  if_icmpne else_11
  aload_0
  aload_0
  getfield Game/playerXMoves Ljava/util/Vector;
  invokevirtual Game/fillPlayerMovesNormalMode(Ljava/util/Vector;)V
  aload_0
  aload_0
  getfield Game/playerOMoves Ljava/util/Vector;
  invokevirtual Game/fillPlayerMovesNormalMode(Ljava/util/Vector;)V
  goto stop_12
  else_11:
  aload_0
  aload_0
  getfield Game/playerXMoves Ljava/util/Vector;
  invokevirtual Game/setSpecialtyMoves(Ljava/util/Vector;)V
  aload_0
  aload_0
  getfield Game/playerOMoves Ljava/util/Vector;
  invokevirtual Game/setSpecialtyMoves(Ljava/util/Vector;)V
  stop_12:
  return
.end method

.method public play()Ljava/lang/Character;
  .limit locals 3
  .limit stack 2
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  astore_1
  aconst_null
  astore_2
  aload_0
  invokevirtual Game/initGameMode()V
  start_0:
  aload_2
  ifnull true_3
  iconst_0
  goto stop_4
  true_3:
  iconst_1
  stop_4:
  dup
  ifeq false_2
  pop
  aload_0
  getfield Game/board LBoard;
  invokevirtual Board/full()Z
  ifeq true_5
  iconst_0
  goto stop_6
  true_5:
  iconst_1
  stop_6:
  false_2:
  ifeq stop_1
  aload_0
  getfield Game/board LBoard;
  invokevirtual Board/print()V
  aload_0
  invokevirtual Game/doMove()V
  aload_0
  getfield Game/board LBoard;
  invokevirtual Board/getWinner()Ljava/lang/Character;
  astore_2
  aload_0
  invokevirtual Game/togglePlayer()V
  goto start_0
  stop_1:
  aload_1
  ldc "GAME OVER!!!"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_0
  getfield Game/board LBoard;
  invokevirtual Board/print()V
  aload_2
  areturn
.end method

.method public static main([Ljava/lang/String;)V
  .limit locals 4
  .limit stack 6
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  astore_1
  new Game
  dup
  new Board
  dup
  ldc 7
  ldc 7
  invokenonvirtual Board/<init>(II)V
  invokenonvirtual Game/<init>(LBoard;)V
  astore_2
  aload_2
  invokevirtual Game/play()Ljava/lang/Character;
  astore_3
  aload_3
  ifnonnull else_0
  aload_1
  ldc "Stalemate!"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_1
  else_0:
  aload_1
  ldc "Winner: "
  dup
  ifnull null_4
  goto stop_5
  null_4:
  pop
  ldc "null"
  stop_5:
  aload_3
  invokevirtual java/lang/Character/toString()Ljava/lang/String;
  dup
  ifnull null_6
  goto stop_7
  null_6:
  pop
  ldc "null"
  stop_7:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_1:
  return
.end method

