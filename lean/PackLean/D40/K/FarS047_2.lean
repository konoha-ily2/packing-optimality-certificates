-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey047

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152B_12 : List Tok := [.split, (.D 6), .split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10), .split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), .split, (.D 9), (.A 32876), (.D 9), .split, (.D 1), .split, .split, (.A 620), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), .split, (.A 32882), (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152B_12 : wsegOk P 1 nb152 kN152 k152B_12 t152B_12 k152B_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152B_13 : List Tok := [(.D 2), .split, .split, (.D 5), .split, .split, (.A 32882), (.D 5), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), .split, (.A 32882), (.D 6), (.D 6), (.D 2), .split, .split, (.A 114), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152B_13 : wsegOk P 1 nb152 kN152 k152B_13 t152B_13 k152B_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152B_14 : List Tok := [.split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), .split, (.D 8), (.A 32909), (.D 8), .split, (.D 2), .split, .split, .split, (.D 3), (.A 32909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152B_14 : wsegOk P 1 nb152 kN152 k152B_14 t152B_14 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t153A_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22772), .split, (.A 178), .split, (.A 32948), .split, .split, (.A 180), .split, (.A 32948), (.A 180), (.A 180), .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 70), .split, .split, (.A 32966), .split, (.A 198), (.A 198)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s153A_0 : wsegOk P 0 nb153 kN153 (rRoots P.den) t153A_0 k153A_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t153A_1 : List Tok := [(.A 198), .split, (.A 114), .split, .split, .split, .split, (.A 182), .split, (.A 246), .split, (.A 32886), (.A 246), .split, .split, .split, (.A 246), .split, (.A 32950), .split, (.A 32966), (.A 32950), (.A 180), .split, (.A 198), (.A 182), .split, .split, (.A 182), (.A 118), (.A 180), .split, .split, (.A 246), (.A 198), .split, (.A 114), .split, (.A 182)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s153A_1 : wsegOk P 0 nb153 kN153 k153A_1 t153A_1 k153A_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t153A_2 : List Tok := [.split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), (.A 246), .split, .split, .split, .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 452), (.D 4), (.D 4), .split, (.A 436), (.A 437), .split, .split, .split, .split, (.A 32966)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s153A_2 : wsegOk P 0 nb153 kN153 k153A_2 t153A_2 k153A_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t153A_3 : List Tok := [.split, (.A 454), (.A 454), (.A 454), (.A 398), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 32902), (.A 32900), (.A 32948), (.A 32902), (.A 388), .split, (.A 180), (.A 32900), .split, .split, .split, .split, (.A 32966), (.A 32902), (.A 32966), (.A 32902), (.A 134), (.A 388), .split, .split, (.A 32948), (.A 180), .split, (.A 388)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s153A_3 : wsegOk P 0 nb153 kN153 k153A_3 t153A_3 k153A_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t153A_4 : List Tok := [.split, (.A 389), .split, (.A 132), (.A 397), .split, .split, .split, .split, (.A 32966), (.A 134), .split, (.A 32966), .split, (.A 198), .split, .split, (.A 198), (.A 134), (.A 198), .split, (.A 389), .split, (.A 454), .split, .split, (.A 389), .split, (.A 453), (.A 133), (.A 397), .split, .split, (.A 132), .split, (.A 134), (.A 133), (.A 141)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s153A_4 : wsegOk P 0 nb153 kN153 k153A_4 t153A_4 k153A_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t153A_5 : List Tok := [(.A 397), .split, .split, .split, .split, .split, (.D 6), .split, .split, (.D 6), .split, (.D 6), .split, (.A 114), (.D 6), (.D 6), .split, (.A 32948), .split, (.A 180), (.A 948), .split, (.D 6), .split, (.D 6), (.A 876), .split, .split, .split, .split, (.A 114), (.A 882), (.A 114), .split, .split, .split, (.A 116), (.A 180), .split, (.A 884), .split, (.A 29556)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s153A_5 : wsegOk P 0 nb153 kN153 k153A_5 t153A_5 k153A_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t153A_6 : List Tok := [.split, .split, (.A 124), .split, (.A 892), (.A 124), (.A 876), .split, .split, (.A 114), .split, .split, .split, (.A 116), (.A 180), (.A 124), (.A 112), (.A 108), .split, (.A 894), (.A 876), .split, .split, (.A 948), .split, (.A 932), (.D 10), .split, .split, .split, .split, .split, (.A 180), .split, (.A 956), .split, .split, (.A 140), (.A 909), (.A 908)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s153A_6 : wsegOk P 0 nb153 kN153 k153A_6 t153A_6 k153A_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t153A_7 : List Tok := [.split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, (.A 188), (.A 956), (.A 876), (.A 956), (.A 876), (.A 940), .split, .split, .split, (.A 188), .split, .split, .split, (.A 188), (.A 172), (.A 141), (.A 172), .split, (.A 141), (.A 141), .split, .split, .split, .split, .split, .split, (.A 172), (.A 876), (.A 108), (.A 172), (.A 32876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s153A_7 : wsegOk P 0 nb153 kN153 k153A_7 t153A_7 k153A_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t153A_8 : List Tok := [.split, .split, (.A 108), .split, .split, (.A 172), (.A 108), (.A 108), (.A 32876), .split, .split, .split, (.A 940), (.A 32908), (.A 940), .split, .split, (.A 172), (.A 141), .split, .split, .split, .split, (.A 32876), (.A 32940), (.A 32876), .split, .split, (.A 32876), .split, (.A 32940), (.A 108), (.A 32876), .split, (.A 940), .split, .split, (.A 32940), (.A 32909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s153A_8 : wsegOk P 0 nb153 kN153 k153A_8 t153A_8 k153A_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t153A_9 : List Tok := [.split, (.A 32876), (.A 32940), (.A 909), .split, .split, (.A 876), (.A 23404), .split, (.D 10), .split, .split, .split, (.D 10), .split, .split, (.A 844), (.D 10), (.D 10), (.D 10), (.D 10), .split, .split, .split, .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, (.A 66), (.D 5), (.D 5), .split, (.A 198), .split, (.A 32966), .split, .split, (.A 198)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s153A_9 : wsegOk P 0 nb153 kN153 k153A_9 t153A_9 k153A_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t153A_10 : List Tok := [(.D 5), (.A 198), .split, .split, (.A 114), .split, .split, (.D 5), .split, .split, (.D 5), (.A 114), (.D 5), .split, (.A 32882), .split, (.A 32882), .split, .split, (.D 5), .split, (.A 32882), (.D 5), (.A 32882), .split, .split, (.A 198), .split, (.A 114), .split, (.A 242), (.A 226), .split, .split, (.A 226), (.A 194), .split, .split, (.A 242)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s153A_10 : wsegOk P 0 nb153 kN153 k153A_10 t153A_10 k153A_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t153A_11 : List Tok := [(.A 226), (.A 225), .split, .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 230), (.D 5), (.D 5), .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 33009), (.D 5), (.D 5), (.D 5), .split, .split, .split, (.A 737)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s153A_11 : wsegOk P 0 nb153 kN153 k153A_11 t153A_11 k153A_12 = true := by
  decide +kernel

end PackLean.D40.Tet
