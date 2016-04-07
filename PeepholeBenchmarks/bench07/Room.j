.class public Room

.super java/lang/Object

.field protected description Ljava/lang/String;
.field protected north LRoom;
.field protected south LRoom;
.field protected west LRoom;
.field protected east LRoom;
.field protected action LRoomAction;
.field protected io Ljoos/lib/JoosIO;

.method public <init>(LRoom;Ljava/lang/String;I)V
  .limit locals 6
  .limit stack 5
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  aload_0
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  putfield Room/io Ljoos/lib/JoosIO;
  iload_3
  iconst_1
  isub
  istore 5
  aconst_null
  dup
  aload_0
  swap
  putfield Room/north LRoom;
  pop
  aconst_null
  dup
  aload_0
  swap
  putfield Room/south LRoom;
  pop
  aconst_null
  dup
  aload_0
  swap
  putfield Room/west LRoom;
  pop
  aconst_null
  dup
  aload_0
  swap
  putfield Room/east LRoom;
  pop
  iload_3
  iconst_0
  if_icmple stop_0
  aload_2
  ldc "south"
  invokevirtual java/lang/String/equals(Ljava/lang/Object;)Z
  ifeq else_3
  aload_0
  aload_1
  putfield Room/north LRoom;
  goto stop_4
  else_3:
  aload_0
  ldc 10
  invokevirtual Room/randomRange(I)I
  iload_3
  if_icmpge stop_5
  new Room
  dup
  aload_0
  ldc "north"
  iload 5
  invokenonvirtual Room/<init>(LRoom;Ljava/lang/String;I)V
  dup
  aload_0
  swap
  putfield Room/north LRoom;
  pop
  stop_5:
  stop_4:
  aload_2
  ldc "north"
  invokevirtual java/lang/String/equals(Ljava/lang/Object;)Z
  ifeq else_8
  aload_0
  aload_1
  putfield Room/south LRoom;
  goto stop_9
  else_8:
  aload_0
  ldc 10
  invokevirtual Room/randomRange(I)I
  iload_3
  if_icmpge stop_10
  new Room
  dup
  aload_0
  ldc "south"
  iload 5
  invokenonvirtual Room/<init>(LRoom;Ljava/lang/String;I)V
  dup
  aload_0
  swap
  putfield Room/south LRoom;
  pop
  stop_10:
  stop_9:
  aload_2
  ldc "west"
  invokevirtual java/lang/String/equals(Ljava/lang/Object;)Z
  ifeq else_13
  aload_0
  aload_1
  putfield Room/east LRoom;
  goto stop_14
  else_13:
  aload_0
  ldc 10
  invokevirtual Room/randomRange(I)I
  iload_3
  if_icmpge stop_15
  new Room
  dup
  aload_0
  ldc "east"
  iload 5
  invokenonvirtual Room/<init>(LRoom;Ljava/lang/String;I)V
  dup
  aload_0
  swap
  putfield Room/east LRoom;
  pop
  stop_15:
  stop_14:
  aload_2
  ldc "east"
  invokevirtual java/lang/String/equals(Ljava/lang/Object;)Z
  ifeq else_18
  aload_0
  aload_1
  putfield Room/west LRoom;
  goto stop_19
  else_18:
  aload_0
  ldc 10
  invokevirtual Room/randomRange(I)I
  iload_3
  if_icmpge stop_20
  new Room
  dup
  aload_0
  ldc "west"
  iload 5
  invokenonvirtual Room/<init>(LRoom;Ljava/lang/String;I)V
  dup
  aload_0
  swap
  putfield Room/west LRoom;
  pop
  stop_20:
  stop_19:
  stop_0:
  aload_0
  ldc 100
  invokevirtual Room/randomRange(I)I
  istore 4
  iload 4
  iconst_5
  if_icmpge else_23
  aload_0
  new GrueRoomAction
  dup
  invokenonvirtual GrueRoomAction/<init>()V
  putfield Room/action LRoomAction;
  iconst_0
  istore 4
  goto stop_24
  else_23:
  iload 4
  ldc 15
  if_icmpge else_27
  aload_0
  new TreasureRoomAction
  dup
  invokenonvirtual TreasureRoomAction/<init>()V
  putfield Room/action LRoomAction;
  iconst_1
  istore 4
  goto stop_28
  else_27:
  iload 4
  ldc 23
  if_icmpge else_31
  aload_0
  new FactorialRoomAction
  dup
  invokenonvirtual FactorialRoomAction/<init>()V
  putfield Room/action LRoomAction;
  iconst_2
  istore 4
  goto stop_32
  else_31:
  iload 4
  ldc 31
  if_icmpge else_35
  aload_0
  new BFRoomAction
  dup
  invokenonvirtual BFRoomAction/<init>()V
  putfield Room/action LRoomAction;
  iconst_3
  istore 4
  goto stop_36
  else_35:
  iload 4
  ldc 40
  if_icmpge else_39
  aload_0
  new JokeRoomAction
  dup
  invokenonvirtual JokeRoomAction/<init>()V
  putfield Room/action LRoomAction;
  iconst_4
  istore 4
  goto stop_40
  else_39:
  iload 4
  ldc 50
  if_icmpge else_43
  aload_0
  new FeastRoomAction
  dup
  invokenonvirtual FeastRoomAction/<init>()V
  putfield Room/action LRoomAction;
  iconst_5
  istore 4
  goto stop_44
  else_43:
  iload 4
  ldc 62
  if_icmpge else_47
  aload_0
  new CoinRoomAction
  dup
  invokenonvirtual CoinRoomAction/<init>()V
  putfield Room/action LRoomAction;
  ldc 6
  istore 4
  goto stop_48
  else_47:
  iload 4
  ldc 72
  if_icmpge else_51
  aload_0
  new ExitRoomAction
  dup
  invokenonvirtual ExitRoomAction/<init>()V
  putfield Room/action LRoomAction;
  ldc 7
  istore 4
  goto stop_52
  else_51:
  iload 4
  ldc 85
  if_icmpge else_55
  aload_0
  new HuntRoomAction
  dup
  invokenonvirtual HuntRoomAction/<init>()V
  putfield Room/action LRoomAction;
  ldc 8
  istore 4
  goto stop_56
  else_55:
  aload_0
  new EmptyRoomAction
  dup
  invokenonvirtual EmptyRoomAction/<init>()V
  putfield Room/action LRoomAction;
  aload_0
  iconst_4
  invokevirtual Room/randomRange(I)I
  ldc 9
  iadd
  istore 4
  stop_56:
  stop_52:
  stop_48:
  stop_44:
  stop_40:
  stop_36:
  stop_32:
  stop_28:
  stop_24:
  aload_0
  iload 4
  invokevirtual Room/generateDescription(I)Ljava/lang/String;
  dup
  aload_0
  swap
  putfield Room/description Ljava/lang/String;
  pop
  return
.end method

.method public randomRange(I)I
  .limit locals 4
  .limit stack 2
  new joos/lib/JoosRandom
  dup
  invokenonvirtual joos/lib/JoosRandom/<init>()V
  astore_3
  aload_3
  invokevirtual joos/lib/JoosRandom/nextInt()I
  iload_1
  irem
  istore_2
  iload_2
  iconst_0
  if_icmplt stop_0
  iload_2
  ireturn
  stop_0:
  iload_2
  ineg
  ireturn
.end method

.method public getDescription()V
  .limit locals 1
  .limit stack 2
  aload_0
  getfield Room/io Ljoos/lib/JoosIO;
  aload_0
  getfield Room/description Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  return
.end method

.method public getNorth()LRoom;
  .limit locals 1
  .limit stack 1
  aload_0
  getfield Room/north LRoom;
  areturn
.end method

.method public getSouth()LRoom;
  .limit locals 1
  .limit stack 1
  aload_0
  getfield Room/south LRoom;
  areturn
.end method

.method public getWest()LRoom;
  .limit locals 1
  .limit stack 1
  aload_0
  getfield Room/west LRoom;
  areturn
.end method

.method public getEast()LRoom;
  .limit locals 1
  .limit stack 1
  aload_0
  getfield Room/east LRoom;
  areturn
.end method

.method public getRoomAction()LRoomAction;
  .limit locals 1
  .limit stack 1
  aload_0
  getfield Room/action LRoomAction;
  areturn
.end method

.method public enterRoom()V
  .limit locals 1
  .limit stack 2
  aload_0
  getfield Room/io Ljoos/lib/JoosIO;
  ldc "=========================================================="
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_0
  invokevirtual Room/getDescription()V
  aload_0
  getfield Room/action LRoomAction;
  invokevirtual RoomAction/describe()V
  aload_0
  getfield Room/io Ljoos/lib/JoosIO;
  ldc "There are exits:"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_0
  invokevirtual Room/getNorth()LRoom;
  aconst_null
  if_acmpeq stop_0
  aload_0
  getfield Room/io Ljoos/lib/JoosIO;
  ldc " -north"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_0:
  aload_0
  invokevirtual Room/getSouth()LRoom;
  aconst_null
  if_acmpeq stop_3
  aload_0
  getfield Room/io Ljoos/lib/JoosIO;
  ldc " -south"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_3:
  aload_0
  invokevirtual Room/getWest()LRoom;
  aconst_null
  if_acmpeq stop_6
  aload_0
  getfield Room/io Ljoos/lib/JoosIO;
  ldc " -west"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_6:
  aload_0
  invokevirtual Room/getEast()LRoom;
  aconst_null
  if_acmpeq stop_9
  aload_0
  getfield Room/io Ljoos/lib/JoosIO;
  ldc " -east"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_9:
  aload_0
  getfield Room/io Ljoos/lib/JoosIO;
  ldc ""
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  return
.end method

.method public generateDescription(I)Ljava/lang/String;
  .limit locals 2
  .limit stack 2
  iload_1
  iconst_0
  if_icmpne else_0
  ldc "It is pitch black. You are likely to be eaten by a grue."
  areturn
  goto stop_1
  else_0:
  iload_1
  iconst_1
  if_icmpne else_4
  ldc "You are in a large hall. Centered in this otherwise empty and silent room is an alabaster pedestal."
  areturn
  goto stop_5
  else_4:
  iload_1
  iconst_2
  if_icmpne else_8
  ldc "You are in a small room. On the east wall, there is a large rusty panel. At the top, two numbered dials spin rapidly, followed by an exclamation point. Below, there are 9 numbered dials spinning."
  areturn
  goto stop_9
  else_8:
  iload_1
  iconst_3
  if_icmpne else_12
  ldc "You are in a dusty padded room. On a simple desk in the middle of the room, a terminal displays '++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.'."
  areturn
  goto stop_13
  else_12:
  iload_1
  iconst_4
  if_icmpne else_16
  ldc "You are in into a delapidated theater. The seats are empty and broken, the banners all ripped to shreds. Yet standing behind a splintered podium at the center of the stage, a lanky, bald man stands patiently."
  areturn
  goto stop_17
  else_16:
  iload_1
  iconst_5
  if_icmpne else_20
  ldc "You are in a large banquet hall. Spread before you on a table long enough to seat a hundred people is a feast of unimaginable bounty, but there is nobody here. As you walk along it, you see your favorite foods nestled in between delicious-looking foods that you cannot even name."
  areturn
  goto stop_21
  else_20:
  iload_1
  ldc 6
  if_icmpne else_24
  ldc "You are in a dark cave through which a small bubbling creek passes. There are a dozen skeletons, all resting alongside this stream. You search them for valuables."
  areturn
  goto stop_25
  else_24:
  iload_1
  ldc 7
  if_icmpne else_28
  ldc "You are in a hall with nothing of note other than a lone stone staircase rising up into the air before you. It does not appear to be supported by anything."
  areturn
  goto stop_29
  else_28:
  iload_1
  ldc 8
  if_icmpne else_32
  ldc "You are in a forest. You hear the leaves rustling in the wind."
  areturn
  goto stop_33
  else_32:
  iload_1
  ldc 9
  if_icmpne else_36
  ldc "You see before you a vast desert. High overhead, vultures are circling above."
  areturn
  goto stop_37
  else_36:
  iload_1
  ldc 10
  if_icmpne else_40
  ldc "You are in a small cottage. It looks like nobody's lived here for a long time, and a thick layer of dust covers everything."
  areturn
  goto stop_41
  else_40:
  iload_1
  ldc 11
  if_icmpne else_44
  ldc "You find yourself in a completely white room with no features other than the exits. You cannot tell whether the white ceiling is nearby or far away, and it's too far away to reach."
  areturn
  goto stop_45
  else_44:
  iload_1
  ldc 12
  if_icmpne else_48
  ldc "You are in a large underground cavern."
  areturn
  goto stop_49
  else_48:
  ldc "You are in a non-descript room. How did you get here?"
  areturn
  stop_49:
  stop_45:
  stop_41:
  stop_37:
  stop_33:
  stop_29:
  stop_25:
  stop_21:
  stop_17:
  stop_13:
  stop_9:
  stop_5:
  stop_1:
.end method

