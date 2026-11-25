-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey062

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224A_19 : List Tok := [(.D 5), (.D 1), .split, .split, .split, (.A 454), (.D 4), (.D 1), .split, .split, .split, .split, (.A 32966), (.D 7), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), .split, (.D 6), (.A 32876), .split, (.D 1), .split, (.D 10), .split, (.A 620), (.D 10), .split, .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s224A_19 : wsegOk P 0 nb224 kN224 k224A_19 t224A_19 k224A_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224A_20 : List Tok := [.split, .split, (.D 9), (.A 620), (.D 9), .split, (.D 1), .split, .split, (.A 620), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), (.A 882), (.D 2), .split, .split, (.D 5), .split, .split, (.A 32882), (.D 5), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), .split, (.A 32882), (.D 6), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s224A_20 : wsegOk P 0 nb224 kN224 k224A_20 t224A_20 k224A_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224A_21 : List Tok := [(.D 2), .split, .split, (.A 114), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), .split, (.D 8), (.A 32909), (.D 8), .split, (.D 2), .split, .split, (.A 141), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s224A_21 : wsegOk P 0 nb224 kN224 k224A_21 t224A_21 k224A_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224A_22 : List Tok := [(.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s224A_22 : wsegOk P 0 nb224 kN224 k224A_22 t224A_22 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224B_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 500), .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 178), .split, (.A 32948), .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 436), (.A 436), .split, .split, (.A 32948), .split, .split, (.A 180), (.A 32948), (.A 32948)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s224B_0 : wsegOk P 1 nb224 kN224 (rRoots P.den) t224B_0 k224B_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224B_1 : List Tok := [(.A 32948), .split, .split, (.A 70), (.A 198), .split, .split, .split, (.A 114), (.A 114), (.A 114), .split, .split, .split, .split, (.A 182), (.A 118), .split, .split, (.A 438), .split, (.A 32950), .split, (.A 32948), .split, (.A 32950), (.A 32948), .split, (.A 198), (.A 182), .split, .split, .split, (.A 182), .split, .split, (.A 950), (.A 32886), (.A 948), .split, (.A 118)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s224B_1 : wsegOk P 1 nb224 kN224 k224B_1 t224B_1 k224B_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224B_2 : List Tok := [.split, (.A 114), (.A 886), .split, (.A 32948), .split, (.A 182), .split, .split, (.A 948), .split, (.A 950), (.A 948), (.A 948), .split, (.A 198), .split, (.A 114), .split, .split, (.A 182), .split, .split, .split, (.A 182), (.A 886), (.A 118), .split, .split, .split, .split, (.A 948), (.A 182), (.A 948), (.A 948), (.A 180), .split, (.A 246)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s224B_2 : wsegOk P 1 nb224 kN224 k224B_2 t224B_2 k224B_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224B_3 : List Tok := [.split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), (.A 118), .split, .split, .split, .split, (.D 4), .split, (.D 4), (.A 388), (.D 4), .split, .split, (.A 32948), .split, (.A 436), (.A 948), (.A 949), .split, .split, .split, .split, (.A 32966), .split, (.A 454)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s224B_3 : wsegOk P 1 nb224 kN224 k224B_3 t224B_3 k224B_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224B_4 : List Tok := [.split, (.D 4), .split, (.D 4), .split, (.A 454), (.D 4), (.A 454), .split, (.D 4), .split, (.D 4), .split, (.A 398), (.D 4), .split, .split, .split, .split, .split, (.A 388), .split, .split, (.A 454), (.A 32902), .split, (.A 134), (.A 902), .split, .split, (.A 388), (.A 900), .split, (.A 390), .split, .split, (.A 900), .split, (.A 32902), (.A 901)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s224B_4 : wsegOk P 1 nb224 kN224 k224B_4 t224B_4 k224B_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224B_5 : List Tok := [(.A 32901), .split, .split, (.A 32948), .split, .split, .split, (.A 948), .split, .split, (.A 180), (.A 900), (.A 948), (.A 900), (.A 948), (.A 900), .split, .split, .split, .split, (.A 32966), (.A 134), (.A 198), .split, .split, (.A 134), .split, .split, .split, (.A 32902), (.A 901), (.A 133), (.A 32901), .split, .split, (.A 198), (.A 133), (.A 133)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s224B_5 : wsegOk P 1 nb224 kN224 k224B_5 t224B_5 k224B_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224B_6 : List Tok := [.split, .split, .split, (.A 134), .split, .split, (.A 948), .split, .split, (.A 180), (.A 900), (.A 948), (.A 900), .split, (.A 134), .split, .split, (.A 132), .split, (.A 134), .split, (.A 132), (.A 141), (.A 141), .split, (.A 909), (.A 141), .split, (.A 909), .split, .split, .split, (.A 909), (.A 32909), (.A 32909), (.A 32909), .split, .split, .split, .split, .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s224B_6 : wsegOk P 1 nb224 kN224 k224B_6 t224B_6 k224B_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224B_7 : List Tok := [.split, .split, (.D 6), .split, (.D 6), (.A 882), (.D 6), (.A 948), .split, (.D 6), (.A 868), .split, .split, (.A 882), .split, (.A 884), .split, .split, (.A 882), .split, (.A 884), .split, .split, (.A 882), .split, .split, .split, (.A 884), .split, (.A 948), .split, .split, .split, (.A 884), (.A 116), (.A 948), (.A 884), (.A 892), .split, (.A 112)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s224B_7 : wsegOk P 1 nb224 kN224 k224B_7 t224B_7 k224B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224B_8 : List Tok := [(.A 892), (.A 892), (.A 876), (.A 876), .split, .split, (.A 948), .split, (.A 932), (.D 10), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, (.A 140), .split, .split, (.A 940), .split, .split, (.A 876), (.A 940), (.A 876), (.A 940), (.A 909), (.A 940), (.A 909), .split, (.A 876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s224B_8 : wsegOk P 1 nb224 kN224 k224B_8 t224B_8 k224B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224B_9 : List Tok := [(.A 940), (.A 909), .split, (.A 876), .split, (.D 10), .split, .split, .split, (.D 10), .split, (.A 909), (.D 10), (.D 10), (.D 10), .split, .split, .split, .split, (.A 198), .split, (.A 114), (.A 226), .split, .split, (.D 5), (.A 230), .split, .split, .split, (.D 5), .split, (.D 5), .split, (.A 114), (.D 5), (.D 5), (.A 225)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s224B_9 : wsegOk P 1 nb224 kN224 k224B_9 t224B_9 k224B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224B_10 : List Tok := [.split, .split, .split, (.A 198), .split, .split, (.D 8), .split, .split, .split, (.D 8), .split, (.A 206), (.D 8), (.D 8), (.D 8), (.D 8), .split, (.A 197), (.A 141), .split, .split, (.A 229), (.D 8), (.A 225), .split, .split, .split, .split, .split, (.A 882), .split, .split, (.A 32882), (.A 114), (.A 882), .split, .split, .split, (.A 114), .split, .split, .split, (.A 114), .split, (.A 96)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s224B_10 : wsegOk P 1 nb224 kN224 k224B_10 t224B_10 k224B_11 = true := by
  decide +kernel

end PackLean.D40.Tet
