-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey010

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t028B_7 : List Tok := [(.D 1), .split, .split, (.D 5), .split, (.A 454), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10), .split, (.A 876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s028B_7 : wsegOk P 1 nb028 kN028 k028B_7 t028B_7 k028B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t028B_8 : List Tok := [(.D 10), .split, .split, (.D 1), .split, .split, (.D 9), (.A 876), (.D 9), .split, (.D 1), .split, .split, (.A 876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), (.A 114), (.D 2), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), (.A 114), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s028B_8 : wsegOk P 1 nb028 kN028 k028B_8 t028B_8 k028B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t028B_9 : List Tok := [(.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2), .split, .split, (.A 909), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s028B_9 : wsegOk P 1 nb028 kN028 k028B_9 t028B_9 k028B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t028B_10 : List Tok := [(.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s028B_10 : wsegOk P 1 nb028 kN028 k028B_10 t028B_10 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t029A_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22772), .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22706), .split, (.A 32948), .split, .split, (.A 180), .split, (.A 32948), (.A 180), (.A 180), .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s029A_0 : wsegOk P 0 nb029 kN029 (rRoots P.den) t029A_0 k029A_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t029A_1 : List Tok := [(.A 22598), .split, .split, (.A 32966), .split, (.A 198), (.A 198), (.A 198), .split, .split, .split, (.A 114), (.A 114), (.A 114), .split, .split, .split, .split, .split, .split, (.D 7), (.A 246), (.A 182), .split, (.A 246), .split, (.A 32886), .split, (.A 182), (.A 246), .split, .split, .split, .split, (.A 32950), (.A 33014), .split, (.A 32950), .split, (.A 32966), (.A 32950)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s029A_1 : wsegOk P 0 nb029 kN029 k029A_1 t029A_1 k029A_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t029A_2 : List Tok := [(.A 180), .split, (.A 198), (.A 182), .split, .split, (.A 182), .split, (.A 118), (.A 118), (.A 180), .split, .split, .split, .split, (.A 246), (.A 118), (.A 246), (.A 198), .split, (.A 114), .split, .split, .split, .split, (.A 182), .split, (.A 246), (.A 118), (.A 182), .split, (.A 118), (.A 180), .split, (.A 246), .split, (.A 114)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s029A_2 : wsegOk P 0 nb029 kN029 k029A_2 t029A_2 k029A_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t029A_3 : List Tok := [.split, .split, (.A 182), .split, (.A 118), (.A 180), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), (.A 246), .split, .split, .split, .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), (.A 32964), (.D 4), (.D 4), (.D 4), .split, .split, (.A 32948)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s029A_3 : wsegOk P 0 nb029 kN029 k029A_3 t029A_3 k029A_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t029A_4 : List Tok := [.split, .split, .split, (.A 32948), .split, .split, (.A 32948), .split, (.D 4), (.A 32900), (.A 32948), (.A 436), (.A 22964), (.A 437), .split, .split, .split, .split, (.A 32966), .split, .split, .split, (.A 32966), .split, (.A 32966), .split, (.D 4), (.A 32966), (.A 32966), .split, (.D 4), .split, (.D 4), .split, (.A 454), (.D 4), .split, (.A 32966), .split, (.A 32966)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s029A_4 : wsegOk P 0 nb029 kN029 k029A_4 t029A_4 k029A_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t029A_5 : List Tok := [(.A 454), .split, (.D 4), .split, (.D 4), .split, (.A 398), (.D 4), .split, .split, .split, .split, .split, .split, .split, (.A 22662), .split, (.A 32900), (.A 32902), .split, (.A 180), (.A 32900), (.A 22662), .split, (.A 388), .split, (.A 29062), .split, .split, (.A 388), .split, (.A 32902), .split, (.A 132), (.A 32901), (.A 32901), .split, (.A 180), .split, .split, (.A 388)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s029A_5 : wsegOk P 0 nb029 kN029 k029A_5 t029A_5 k029A_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t029A_6 : List Tok := [.split, (.A 180), (.A 388), (.A 133), .split, .split, .split, .split, (.A 32966), .split, .split, (.A 134), (.A 198), (.A 22662), .split, (.A 32966), .split, (.A 198), .split, .split, .split, (.A 32966), .split, .split, (.A 32966), .split, (.A 32966), (.A 32902), (.A 198), (.A 134), (.A 198), .split, .split, (.A 29062), .split, .split, .split, (.A 32902), (.A 133), .split, (.A 32902)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s029A_6 : wsegOk P 0 nb029 kN029 k029A_6 t029A_6 k029A_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t029A_7 : List Tok := [(.A 133), (.A 32901), .split, .split, .split, .split, (.A 32966), .split, (.A 32966), (.A 32902), .split, (.A 32966), .split, (.A 32966), .split, .split, (.A 32966), .split, (.A 32966), (.A 32901), .split, (.A 32966), (.A 32965), .split, (.A 389), .split, (.A 454), (.A 32901), .split, .split, .split, .split, (.A 28806), (.A 32901), (.A 133), .split, .split, .split, .split, (.A 32966), .split, (.A 198)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s029A_7 : wsegOk P 0 nb029 kN029 k029A_7 t029A_7 k029A_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t029A_8 : List Tok := [.split, (.A 32901), .split, (.A 32965), (.A 32901), .split, (.A 32966), (.A 32965), (.A 32901), (.A 133), (.A 22925), .split, .split, (.A 132), .split, .split, .split, (.A 134), (.A 198), (.A 133), .split, .split, (.A 132), (.A 133), (.A 141), (.A 141), .split, .split, (.A 397), (.A 397), (.A 22925), .split, .split, .split, .split, .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s029A_8 : wsegOk P 0 nb029 kN029 k029A_8 t029A_8 k029A_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t029A_9 : List Tok := [.split, .split, (.D 6), .split, (.D 6), .split, .split, (.D 6), .split, (.D 6), .split, (.A 114), (.D 6), (.D 6), (.D 6), .split, (.A 32948), .split, .split, .split, (.A 32948), .split, (.A 32948), .split, .split, (.D 6), .split, .split, (.D 6), (.A 32948), (.D 6), (.A 32948), (.A 32948), .split, .split, (.D 6), (.A 23412), (.A 948)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s029A_9 : wsegOk P 0 nb029 kN029 k029A_9 t029A_9 k029A_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t029A_10 : List Tok := [.split, (.D 6), .split, (.D 6), .split, .split, (.D 6), .split, (.D 6), (.A 868), (.D 6), .split, .split, .split, .split, .split, (.A 32882), .split, .split, (.A 32882), .split, (.D 6), .split, (.D 6), (.A 32882), (.A 32882), (.A 882), (.A 23410), .split, .split, .split, .split, (.A 28788), (.A 112), .split, (.A 32948), .split, (.A 180), .split, (.A 116), .split, (.A 180)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s029A_10 : wsegOk P 0 nb029 kN029 k029A_10 t029A_10 k029A_11 = true := by
  decide +kernel

end PackLean.D40.Tet
