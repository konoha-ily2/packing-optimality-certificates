-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey020

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t064B_10 : List Tok := [.split, (.D 1), .split, .split, (.A 876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), .split, (.A 32882), (.D 9), (.D 2), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), (.A 114), (.D 6), (.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s064B_10 : wsegOk P 1 nb064 kN064 k064B_10 t064B_10 k064B_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t064B_11 : List Tok := [(.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2), .split, .split, (.A 909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s064B_11 : wsegOk P 1 nb064 kN064 k064B_11 t064B_11 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t065A_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22772), .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22706), .split, (.A 32948), .split, .split, (.A 180), (.A 180), (.A 180), .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 70)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s065A_0 : wsegOk P 0 nb065 kN065 (rRoots P.den) t065A_0 k065A_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t065A_1 : List Tok := [.split, .split, (.A 32966), (.A 198), (.A 198), .split, .split, .split, (.A 114), .split, (.A 32882), (.A 114), (.A 114), .split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), (.A 246), (.A 182), .split, (.A 246), .split, (.A 32886), .split, (.A 182), .split, (.A 33014), (.A 118), .split, .split, .split, .split, (.A 32950), (.A 33014), (.A 182), (.A 180)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s065A_1 : wsegOk P 0 nb065 kN065 k065A_1 t065A_1 k065A_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t065A_2 : List Tok := [.split, (.A 198), (.A 182), .split, .split, .split, (.A 182), .split, .split, (.A 182), (.A 32886), (.A 180), .split, .split, (.A 32886), .split, (.A 32950), (.A 118), .split, (.A 114), (.A 118), (.A 180), .split, .split, .split, .split, (.A 246), (.A 118), .split, (.A 198), (.A 114), (.A 198), .split, (.A 114), .split, .split, .split, .split, (.A 182), .split, (.A 246)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s065A_2 : wsegOk P 0 nb065 kN065 k065A_2 t065A_2 k065A_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t065A_3 : List Tok := [(.A 118), (.A 182), .split, .split, .split, (.A 182), (.A 118), (.A 118), (.A 180), .split, (.A 246), .split, (.A 114), .split, .split, (.A 182), .split, (.A 118), (.A 180), .split, (.A 246), .split, (.A 114), .split, (.A 182), (.A 246), .split, .split, .split, .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s065A_3 : wsegOk P 0 nb065 kN065 k065A_3 t065A_3 k065A_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t065A_4 : List Tok := [(.A 32964), (.D 4), (.D 4), (.D 4), .split, .split, (.A 32948), .split, .split, .split, (.A 32948), .split, .split, (.A 32948), .split, (.D 4), (.A 32900), (.A 32948), (.A 436), .split, (.A 32948), (.A 22964), .split, (.D 4), .split, (.D 4), (.A 397), .split, .split, .split, .split, (.A 32966), .split, .split, .split, (.A 32966), .split, (.A 32966), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s065A_4 : wsegOk P 0 nb065 kN065 k065A_4 t065A_4 k065A_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t065A_5 : List Tok := [(.A 32966), (.A 32966), .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), (.A 32966), (.D 4), .split, (.A 32966), .split, (.A 32966), .split, .split, (.A 32966), .split, (.A 32966), .split, (.D 4), .split, (.D 4), .split, (.A 32966), (.D 4), (.A 32966), .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s065A_5 : wsegOk P 0 nb065 kN065 k065A_5 t065A_5 k065A_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t065A_6 : List Tok := [.split, (.A 398), (.D 4), (.D 4), .split, .split, .split, .split, .split, .split, .split, (.A 28806), .split, (.A 32900), (.A 32902), (.A 180), (.A 22662), .split, .split, .split, .split, (.D 4), (.A 29062), (.D 4), .split, (.A 32900), (.A 389), .split, (.A 22918), .split, .split, .split, (.A 29062), (.A 32900), .split, (.A 32902), (.A 133), (.A 32901), .split, (.A 180)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s065A_6 : wsegOk P 0 nb065 kN065 k065A_6 t065A_6 k065A_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t065A_7 : List Tok := [.split, .split, (.A 29060), (.A 180), (.A 133), .split, .split, .split, .split, (.A 32966), .split, .split, (.A 134), (.A 198), (.A 134), .split, (.A 32966), .split, (.A 198), .split, .split, (.A 198), (.A 134), (.A 198), .split, .split, (.A 29062), .split, .split, (.A 133), .split, (.A 32902), (.A 133), (.A 32901), .split, .split, .split, .split, (.A 32966), .split, (.A 32966), (.A 32902)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s065A_7 : wsegOk P 0 nb065 kN065 k065A_7 t065A_7 k065A_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t065A_8 : List Tok := [.split, (.A 32966), .split, (.A 32966), .split, .split, (.A 32966), .split, (.A 32966), (.A 32901), .split, (.A 32966), (.A 32965), .split, .split, (.A 32902), (.A 32901), .split, .split, (.A 32966), (.A 32901), (.A 32901), .split, .split, .split, .split, (.A 28806), (.A 32901), (.A 133), .split, .split, .split, .split, (.A 32966), (.A 197), (.A 198), (.A 32901), (.A 133)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s065A_8 : wsegOk P 0 nb065 kN065 k065A_8 t065A_8 k065A_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t065A_9 : List Tok := [.split, .split, .split, (.A 32901), (.A 32909), (.A 32909), .split, .split, .split, (.A 32901), .split, (.A 32901), (.A 32909), (.A 32909), (.A 32909), .split, .split, (.A 132), .split, .split, .split, (.A 134), (.A 198), (.A 133), (.A 133), (.A 141), .split, .split, (.A 397), (.A 22925), .split, .split, (.A 397), (.A 32909), (.A 32909), .split, .split, .split, .split, .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s065A_9 : wsegOk P 0 nb065 kN065 k065A_9 t065A_9 k065A_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t065A_10 : List Tok := [.split, .split, (.D 6), .split, (.D 6), .split, .split, (.D 6), .split, (.D 6), .split, .split, (.D 6), (.A 32944), (.D 6), (.D 6), (.D 6), .split, (.A 32948), .split, .split, .split, (.A 32948), .split, (.A 32948), .split, .split, (.D 6), .split, .split, (.D 6), (.A 32948), (.D 6), (.A 32948), (.A 32948), .split, .split, (.D 6), (.A 23412)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s065A_10 : wsegOk P 0 nb065 kN065 k065A_10 t065A_10 k065A_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t065A_11 : List Tok := [(.A 948), .split, (.D 6), .split, (.D 6), (.A 876), .split, .split, .split, .split, .split, (.A 32882), .split, .split, (.A 32882), .split, (.D 6), .split, (.D 6), (.A 32882), (.A 32882), (.A 882), (.A 23410), .split, .split, .split, .split, .split, .split, (.A 28788), .split, (.A 32948), .split, (.A 180), (.A 32884), .split, .split, (.A 32884), (.A 32880), (.A 32884), .split, .split, (.A 114)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s065A_11 : wsegOk P 0 nb065 kN065 k065A_11 t065A_11 k065A_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t065A_12 : List Tok := [(.A 116), .split, (.A 32880), (.A 116), .split, (.A 32948), .split, .split, .split, (.A 180), (.A 116), (.A 180), .split, .split, (.A 32884), (.A 116), .split, .split, (.A 32948), .split, .split, (.A 32948), .split, (.A 32948), .split, (.A 32884), .split, (.A 32948), .split, (.A 32948), .split, (.A 32884), (.A 32948), (.A 32948), .split, (.A 180), .split, (.A 116)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s065A_12 : wsegOk P 0 nb065 kN065 k065A_12 t065A_12 k065A_13 = true := by
  decide +kernel

end PackLean.D40.Tet
