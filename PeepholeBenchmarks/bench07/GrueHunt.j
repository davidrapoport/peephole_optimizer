.class public GrueHunt

.super java/lang/Object

.method public <init>()V
  .limit locals 1
  .limit stack 1
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

.method public testLoop(Ljoos/lib/JoosIO;Z)Ljava/lang/String;
  .limit locals 4
  .limit stack 1
  aconst_null
  astore_3
  iload_2
  ifne stop_0
  aload_1
  invokevirtual joos/lib/JoosIO/readLine()Ljava/lang/String;
  astore_3
  stop_0:
  aload_3
  areturn
.end method

.method public static main([Ljava/lang/String;)V
  .limit locals 16
  .limit stack 5
  new GrueHunt
  dup
  invokenonvirtual GrueHunt/<init>()V
  astore 14
  iconst_0
  istore 8
  ldc "╔═╝┏━┓╻ ╻┏━╸ ║ ║╻ ╻┏┓╻╺┳╸\n║ ║┣┳┛┃ ┃┣╸  ╔═║┃ ┃┃┗┫ ┃ \n══╝╹┗╸┗━┛┗━╸ ╝ ╝┗━┛╹ ╹ ╹ "
  astore 11
  ldc 20
  istore 13
  ldc 100
  istore 7
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  astore_1
  ldc 11
  istore 6
  new Room
  dup
  aconst_null
  ldc "null"
  iload 6
  invokenonvirtual Room/<init>(LRoom;Ljava/lang/String;I)V
  astore 12
  iconst_0
  istore_2
  iconst_0
  istore_3
  ldc 10
  istore 4
  aload_1
  ldc "\n"
  dup
  ifnull null_0
  goto stop_1
  null_0:
  pop
  ldc "null"
  stop_1:
  aload 11
  dup
  ifnull null_2
  goto stop_3
  null_2:
  pop
  ldc "null"
  stop_3:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_1
  ldc "\n"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_1
  ldc "Welcome to GrueHunt! Please don't feed the grues."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_1
  ldc "What is your name?"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_1
  invokevirtual joos/lib/JoosIO/readLine()Ljava/lang/String;
  astore 9
  aload 9
  ifnull true_6
  iconst_0
  goto stop_7
  true_6:
  iconst_1
  stop_7:
  dup
  ifne true_5
  pop
  aload 9
  ldc ""
  invokevirtual java/lang/String/equals(Ljava/lang/Object;)Z
  true_5:
  ifeq stop_4
  ldc "Dave"
  astore 9
  stop_4:
  aload 12
  invokevirtual Room/enterRoom()V
  start_8:
  aload 14
  aload_1
  iload 8
  invokevirtual GrueHunt/testLoop(Ljoos/lib/JoosIO;Z)Ljava/lang/String;
  dup
  astore 10
  aconst_null
  if_acmpeq stop_9
  aload_1
  ldc ""
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload 10
  ldc "give up"
  iconst_0
  invokevirtual java/lang/String/indexOf(Ljava/lang/String;I)I
  iconst_0
  if_icmplt else_12
  aload_1
  ldc "You have given up, "
  dup
  ifnull null_18
  goto stop_19
  null_18:
  pop
  ldc "null"
  stop_19:
  aload 9
  dup
  ifnull null_20
  goto stop_21
  null_20:
  pop
  ldc "null"
  stop_21:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_16
  goto stop_17
  null_16:
  pop
  ldc "null"
  stop_17:
  ldc "."
  dup
  ifnull null_22
  goto stop_23
  null_22:
  pop
  ldc "null"
  stop_23:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_1
  ldc "You spend the rest of your days wandering this bizarre world. Better luck next time!"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  iconst_1
  istore 8
  goto stop_13
  else_12:
  aload 10
  ldc "north"
  iconst_0
  invokevirtual java/lang/String/indexOf(Ljava/lang/String;I)I
  iconst_0
  if_icmplt else_24
  aload 12
  invokevirtual Room/getNorth()LRoom;
  astore 15
  aload 15
  ifnonnull else_28
  aload_1
  ldc "There is no exit that way."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_25
  else_28:
  aload 15
  astore 12
  aload_1
  ldc "You go north."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_29:
  goto stop_25
  else_24:
  aload 10
  ldc "south"
  iconst_0
  invokevirtual java/lang/String/indexOf(Ljava/lang/String;I)I
  iconst_0
  if_icmplt else_32
  aload 12
  invokevirtual Room/getSouth()LRoom;
  astore 15
  aload 15
  ifnonnull else_36
  aload_1
  ldc "There is no exit that way."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_33
  else_36:
  aload 15
  astore 12
  aload_1
  ldc "You go south."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_37:
  goto stop_33
  else_32:
  aload 10
  ldc "west"
  iconst_0
  invokevirtual java/lang/String/indexOf(Ljava/lang/String;I)I
  iconst_0
  if_icmplt else_40
  aload 12
  invokevirtual Room/getWest()LRoom;
  astore 15
  aload 15
  ifnonnull else_44
  aload_1
  ldc "There is no exit that way."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_41
  else_44:
  aload 15
  astore 12
  aload_1
  ldc "You go west."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_45:
  goto stop_41
  else_40:
  aload 10
  ldc "east"
  iconst_0
  invokevirtual java/lang/String/indexOf(Ljava/lang/String;I)I
  iconst_0
  if_icmplt else_48
  aload 12
  invokevirtual Room/getEast()LRoom;
  astore 15
  aload 15
  ifnonnull else_52
  aload_1
  ldc "There is no exit that way."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_49
  else_52:
  aload 15
  astore 12
  aload_1
  ldc "You go east."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_53:
  goto stop_49
  else_48:
  aload 12
  invokevirtual Room/getRoomAction()LRoomAction;
  aload 10
  invokevirtual RoomAction/performAction(Ljava/lang/String;)I
  istore 5
  iload 5
  iconst_0
  if_icmpne else_56
  goto stop_57
  else_56:
  iload 5
  iconst_1
  if_icmpne else_60
  iconst_0
  istore 4
  goto stop_61
  else_60:
  iload 5
  iconst_2
  if_icmpne else_64
  aload_1
  aload 9
  dup
  ifnull null_68
  goto stop_69
  null_68:
  pop
  ldc "null"
  stop_69:
  ldc ".\n"
  dup
  ifnull null_70
  goto stop_71
  null_70:
  pop
  ldc "null"
  stop_71:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/print(Ljava/lang/String;)V
  goto stop_65
  else_64:
  iload 5
  iconst_3
  if_icmpne else_72
  iinc 3 1
  iload_3
  istore_3
  aload_1
  ldc "You have "
  dup
  ifnull null_78
  goto stop_79
  null_78:
  pop
  ldc "null"
  stop_79:
  new java/lang/Integer
  dup
  iload_3
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_76
  goto stop_77
  null_76:
  pop
  ldc "null"
  stop_77:
  ldc " treasure(s)."
  dup
  ifnull null_82
  goto stop_83
  null_82:
  pop
  ldc "null"
  stop_83:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_73
  else_72:
  iload 5
  iconst_4
  if_icmpne else_84
  aload_1
  ldc "You have "
  dup
  ifnull null_90
  goto stop_91
  null_90:
  pop
  ldc "null"
  stop_91:
  new java/lang/Integer
  dup
  iload_3
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_88
  goto stop_89
  null_88:
  pop
  ldc "null"
  stop_89:
  ldc " treasure(s)."
  dup
  ifnull null_94
  goto stop_95
  null_94:
  pop
  ldc "null"
  stop_95:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_85
  else_84:
  iload 5
  iconst_5
  if_icmpne else_96
  iinc 2 1
  iload_2
  istore_2
  aload_1
  ldc "You have "
  dup
  ifnull null_102
  goto stop_103
  null_102:
  pop
  ldc "null"
  stop_103:
  new java/lang/Integer
  dup
  iload_2
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_100
  goto stop_101
  null_100:
  pop
  ldc "null"
  stop_101:
  ldc " coin(s)."
  dup
  ifnull null_106
  goto stop_107
  null_106:
  pop
  ldc "null"
  stop_107:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_97
  else_96:
  iload 5
  ldc 6
  if_icmpne else_108
  aload_1
  ldc "You have "
  dup
  ifnull null_114
  goto stop_115
  null_114:
  pop
  ldc "null"
  stop_115:
  new java/lang/Integer
  dup
  iload_2
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_112
  goto stop_113
  null_112:
  pop
  ldc "null"
  stop_113:
  ldc " coin(s)."
  dup
  ifnull null_118
  goto stop_119
  null_118:
  pop
  ldc "null"
  stop_119:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_109
  else_108:
  iload 5
  ldc 7
  if_icmpne else_120
  iinc 4 1
  iload 4
  istore 4
  goto stop_121
  else_120:
  iload 5
  ldc 8
  if_icmpne else_124
  iinc 4 2
  iload 4
  istore 4
  goto stop_125
  else_124:
  iload 5
  ldc 9
  if_icmpne else_128
  iload 4
  iconst_1
  isub
  istore 4
  goto stop_129
  else_128:
  iload 5
  ldc 10
  if_icmpne else_132
  iload 4
  iconst_2
  isub
  istore 4
  goto stop_133
  else_132:
  iload 5
  ldc 11
  if_icmpne else_136
  aload_1
  ldc "You have "
  dup
  ifnull null_142
  goto stop_143
  null_142:
  pop
  ldc "null"
  stop_143:
  new java/lang/Integer
  dup
  iload 4
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_140
  goto stop_141
  null_140:
  pop
  ldc "null"
  stop_141:
  ldc " hit points remaining."
  dup
  ifnull null_146
  goto stop_147
  null_146:
  pop
  ldc "null"
  stop_147:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_137
  else_136:
  iload 5
  ldc 12
  if_icmpne stop_148
  aload 12
  ldc 100
  invokevirtual Room/randomRange(I)I
  istore 7
  iload 7
  iload 13
  if_icmpge else_151
  aload_1
  ldc "You've escaped this bizarre world! You are now free."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_152
  else_151:
  iload 6
  iconst_1
  isub
  istore 6
  iload 6
  iconst_5
  if_icmpne stop_155
  ldc 11
  istore 6
  stop_155:
  new Room
  dup
  aconst_null
  ldc "null"
  iload 6
  invokenonvirtual Room/<init>(LRoom;Ljava/lang/String;I)V
  astore 12
  aload_1
  ldc "You suddenly notice the new place you find yourself."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_152:
  stop_148:
  stop_137:
  stop_133:
  stop_129:
  stop_125:
  stop_121:
  stop_109:
  stop_97:
  stop_85:
  stop_73:
  stop_65:
  stop_61:
  stop_57:
  iload 4
  ldc 15
  if_icmple stop_158
  ldc 15
  istore 4
  stop_158:
  iload 4
  iconst_1
  if_icmpge stop_161
  aload_1
  ldc "\n\n"
  dup
  ifnull null_166
  goto stop_167
  null_166:
  pop
  ldc "null"
  stop_167:
  aload 9
  dup
  ifnull null_168
  goto stop_169
  null_168:
  pop
  ldc "null"
  stop_169:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_164
  goto stop_165
  null_164:
  pop
  ldc "null"
  stop_165:
  ldc " died."
  dup
  ifnull null_170
  goto stop_171
  null_170:
  pop
  ldc "null"
  stop_171:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  iconst_0
  istore 4
  iconst_1
  istore 8
  stop_161:
  iload 7
  iload 13
  if_icmpge stop_172
  iconst_1
  istore 8
  stop_172:
  stop_49:
  stop_41:
  stop_33:
  stop_25:
  stop_13:
  iload 8
  ifne stop_175
  aload_1
  ldc ""
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload 12
  invokevirtual Room/enterRoom()V
  stop_175:
  goto start_8
  stop_9:
  aload_1
  aload 9
  dup
  ifnull null_186
  goto stop_187
  null_186:
  pop
  ldc "null"
  stop_187:
  ldc " has accumulated "
  dup
  ifnull null_188
  goto stop_189
  null_188:
  pop
  ldc "null"
  stop_189:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_184
  goto stop_185
  null_184:
  pop
  ldc "null"
  stop_185:
  new java/lang/Integer
  dup
  iload_3
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_182
  goto stop_183
  null_182:
  pop
  ldc "null"
  stop_183:
  ldc " treasure(s) and "
  dup
  ifnull null_192
  goto stop_193
  null_192:
  pop
  ldc "null"
  stop_193:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_180
  goto stop_181
  null_180:
  pop
  ldc "null"
  stop_181:
  new java/lang/Integer
  dup
  iload_2
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_178
  goto stop_179
  null_178:
  pop
  ldc "null"
  stop_179:
  ldc " coin(s)."
  dup
  ifnull null_196
  goto stop_197
  null_196:
  pop
  ldc "null"
  stop_197:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_1
  aload 9
  dup
  ifnull null_202
  goto stop_203
  null_202:
  pop
  ldc "null"
  stop_203:
  ldc " has "
  dup
  ifnull null_204
  goto stop_205
  null_204:
  pop
  ldc "null"
  stop_205:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_200
  goto stop_201
  null_200:
  pop
  ldc "null"
  stop_201:
  new java/lang/Integer
  dup
  iload 4
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnull null_198
  goto stop_199
  null_198:
  pop
  ldc "null"
  stop_199:
  ldc " hit points remaining."
  dup
  ifnull null_208
  goto stop_209
  null_208:
  pop
  ldc "null"
  stop_209:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_1
  ldc "Thank you for playing\n"
  dup
  ifnull null_210
  goto stop_211
  null_210:
  pop
  ldc "null"
  stop_211:
  aload 11
  dup
  ifnull null_212
  goto stop_213
  null_212:
  pop
  ldc "null"
  stop_213:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  return
.end method

