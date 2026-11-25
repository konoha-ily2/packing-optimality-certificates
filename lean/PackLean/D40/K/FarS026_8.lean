-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey026

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t082B_10 : List Tok := [.split, .split, .split, .split, .split, (.D 9), (.A 882), (.D 2), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), (.A 114), (.D 6), (.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s082B_10 : wsegOk P 1 nb082 kN082 k082B_10 t082B_10 k082B_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t082B_11 : List Tok := [.split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2), .split, .split, (.A 909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s082B_11 : wsegOk P 1 nb082 kN082 k082B_11 t082B_11 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t083A_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22772), .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22706), .split, (.A 32948), .split, .split, (.A 180), .split, (.A 32948), (.A 180), (.A 180), .split, .split, .split, (.D 7), .split, (.D 7), (.A 114)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s083A_0 : wsegOk P 0 nb083 kN083 (rRoots P.den) t083A_0 k083A_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t083A_1 : List Tok := [.split, .split, (.A 32966), .split, (.A 198), (.A 198), (.A 198), .split, .split, .split, (.A 114), .split, (.A 32882), (.A 114), (.A 114), .split, .split, .split, .split, .split, .split, (.D 7), (.A 246), (.A 182), .split, (.A 246), .split, (.A 32886), .split, (.A 182), (.A 246), .split, .split, .split, .split, (.A 32950), (.A 33014), (.A 182), (.A 180), .split, (.A 198)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s083A_1 : wsegOk P 0 nb083 kN083 k083A_1 t083A_1 k083A_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t083A_2 : List Tok := [(.A 182), .split, .split, .split, (.A 182), .split, .split, (.A 182), (.A 32886), (.A 180), .split, .split, (.A 32886), .split, (.A 32950), (.A 118), .split, (.A 114), (.A 118), (.A 180), .split, .split, .split, .split, (.A 246), (.A 118), (.A 246), (.A 198), .split, (.A 114), .split, .split, .split, .split, (.A 182), .split, (.A 246), (.A 118), (.A 182)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s083A_2 : wsegOk P 0 nb083 kN083 k083A_2 t083A_2 k083A_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t083A_3 : List Tok := [.split, .split, .split, (.A 182), (.A 118), (.A 118), (.A 180), .split, (.A 246), .split, (.A 114), .split, .split, (.A 182), .split, (.A 118), (.A 180), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), (.A 118), .split, .split, .split, .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), (.A 32964)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s083A_3 : wsegOk P 0 nb083 kN083 k083A_3 t083A_3 k083A_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t083A_4 : List Tok := [(.D 4), (.D 4), (.D 4), .split, .split, (.A 32948), .split, .split, .split, (.A 32948), .split, .split, (.A 32948), .split, (.D 4), (.A 32900), (.A 32948), (.A 436), .split, (.A 32948), (.A 22964), .split, (.D 4), .split, (.D 4), .split, (.A 437), (.D 4), .split, .split, .split, .split, (.A 32966), .split, .split, .split, (.A 32966), .split, (.A 32966), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s083A_4 : wsegOk P 0 nb083 kN083 k083A_4 t083A_4 k083A_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t083A_5 : List Tok := [(.A 32966), (.A 32966), .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), (.A 32966), (.D 4), .split, (.A 32966), .split, (.A 32966), .split, .split, (.A 32966), .split, (.A 32966), .split, (.D 4), (.A 454), (.A 32966), .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 397), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s083A_5 : wsegOk P 0 nb083 kN083 k083A_5 t083A_5 k083A_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t083A_6 : List Tok := [.split, .split, .split, .split, .split, .split, .split, (.A 22662), .split, (.A 32900), (.A 32902), .split, (.A 180), (.A 32900), .split, .split, .split, .split, (.A 32966), (.A 32902), (.A 32966), (.A 32902), (.A 134), .split, .split, .split, .split, (.D 4), (.A 390), (.D 4), (.A 388), .split, (.A 22918), .split, .split, .split, (.A 29062), (.A 32900), .split, (.A 32902), (.A 133), (.A 32901)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s083A_6 : wsegOk P 0 nb083 kN083 k083A_6 t083A_6 k083A_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t083A_7 : List Tok := [.split, (.A 180), .split, .split, (.A 29060), (.A 180), (.A 133), .split, .split, .split, .split, (.A 32966), (.A 134), .split, (.A 32966), .split, (.A 198), .split, .split, (.A 198), (.A 134), (.A 198), .split, .split, (.A 29062), .split, .split, .split, (.A 32902), (.A 133), .split, (.A 32902), (.A 133), (.A 32901), .split, .split, .split, .split, (.A 32966), .split, (.A 32966), (.A 32902)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s083A_7 : wsegOk P 0 nb083 kN083 k083A_7 t083A_7 k083A_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t083A_8 : List Tok := [.split, (.A 32966), .split, (.A 32966), .split, .split, (.A 32966), .split, (.A 32966), (.A 32901), .split, (.A 32966), (.A 32965), .split, .split, (.A 32902), (.A 32901), .split, .split, (.A 32966), (.A 32901), (.A 32901), .split, .split, .split, .split, (.A 134), (.A 32901), (.A 133), .split, .split, .split, .split, (.A 32966), (.A 197), (.A 198), (.A 32901), (.A 133)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s083A_8 : wsegOk P 0 nb083 kN083 k083A_8 t083A_8 k083A_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t083A_9 : List Tok := [.split, (.A 141), .split, (.A 141), (.A 32909), .split, .split, (.A 132), .split, .split, .split, (.A 134), (.A 198), (.A 133), (.A 133), (.A 141), .split, .split, (.A 397), .split, (.A 22925), (.A 32909), .split, (.A 397), (.A 32909), .split, .split, .split, .split, .split, (.D 6), .split, .split, (.D 6), .split, (.D 6), .split, .split, (.D 6), .split, (.D 6), .split, .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s083A_9 : wsegOk P 0 nb083 kN083 k083A_9 t083A_9 k083A_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t083A_10 : List Tok := [(.A 32944), (.D 6), (.D 6), (.D 6), .split, (.A 32948), .split, .split, .split, (.A 32948), .split, (.A 32948), .split, .split, (.D 6), .split, .split, (.D 6), (.A 32948), (.D 6), (.A 32948), (.A 32948), (.A 948), .split, (.D 6), .split, (.D 6), (.A 876), .split, .split, .split, .split, .split, (.A 32882), .split, .split, (.A 32882), .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s083A_10 : wsegOk P 0 nb083 kN083 k083A_10 t083A_10 k083A_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t083A_11 : List Tok := [.split, (.D 6), (.A 32882), (.A 32882), (.A 882), (.A 23410), .split, .split, .split, .split, (.A 22644), .split, .split, (.A 114), (.A 116), (.A 112), .split, (.A 32948), .split, .split, .split, (.A 180), (.A 116), (.A 180), .split, .split, (.A 32884), (.A 116), .split, .split, (.A 32948), .split, .split, (.A 32948), .split, (.A 32948), .split, (.A 32884), (.A 180)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s083A_11 : wsegOk P 0 nb083 kN083 k083A_11 t083A_11 k083A_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t083A_12 : List Tok := [(.A 32948), .split, (.A 180), .split, (.A 116), (.A 180), .split, (.A 884), .split, .split, .split, (.A 32884), (.A 948), (.A 884), .split, .split, (.A 892), .split, .split, .split, .split, (.A 948), .split, (.A 884), (.A 32892), (.A 948), (.A 32892), .split, .split, .split, .split, (.A 124), (.A 32892), (.A 124), .split, .split, .split, .split, .split, (.A 188), (.A 892), (.A 124)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s083A_12 : wsegOk P 0 nb083 kN083 k083A_12 t083A_12 k083A_13 = true := by
  decide +kernel

end PackLean.D40.Tet
