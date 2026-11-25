-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey050

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t169B_11 : List Tok := [(.A 876), .split, (.D 1), .split, (.D 10), .split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), .split, (.D 9), (.A 32876), (.D 9), .split, (.D 1), .split, .split, .split, (.D 3), (.A 32876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), .split, (.A 32882), (.D 9), (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s169B_11 : wsegOk P 1 nb169 kN169 k169B_11 t169B_11 k169B_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t169B_12 : List Tok := [.split, .split, (.D 5), (.A 626), (.D 2), .split, .split, .split, .split, (.D 6), .split, (.A 32882), (.D 6), (.D 6), (.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s169B_12 : wsegOk P 1 nb169 kN169 k169B_12 t169B_12 k169B_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t169B_13 : List Tok := [.split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2), .split, .split, (.A 909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s169B_13 : wsegOk P 1 nb169 kN169 k169B_13 t169B_13 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t170A_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 500), .split, (.A 178), .split, (.A 32948), .split, .split, (.A 180), .split, (.A 32948), .split, .split, (.A 180), (.A 32948), (.A 32948), (.A 180), .split, .split, .split, (.D 7), (.A 70), .split, .split, (.A 32966), .split, (.A 198), .split, .split, (.A 32966)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s170A_0 : wsegOk P 0 nb170 kN170 (rRoots P.den) t170A_0 k170A_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t170A_1 : List Tok := [.split, (.A 198), (.A 32966), (.A 32966), (.A 198), .split, (.A 114), .split, .split, .split, (.A 246), .split, .split, .split, (.A 246), (.A 438), (.A 180), .split, (.A 198), (.A 182), (.A 180), .split, (.A 198), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s170A_1 : wsegOk P 0 nb170 kN170 k170A_1 t170A_1 k170A_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t170A_2 : List Tok := [.split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), (.A 246), .split, .split, .split, (.A 452), (.D 4), .split, (.A 436), (.A 437), .split, .split, (.A 454), (.A 398), .split, .split, .split, .split, (.A 390), (.A 388), .split, .split, (.A 32948), .split, .split, (.A 180), (.A 388), (.A 180), (.A 388), .split, .split, .split, .split, (.A 32966), .split, .split, (.A 390)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s170A_2 : wsegOk P 0 nb170 kN170 k170A_2 t170A_2 k170A_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t170A_3 : List Tok := [(.A 198), (.A 390), (.A 454), (.A 389), .split, .split, (.A 132), .split, (.A 134), .split, .split, (.A 132), (.A 133), (.A 141), .split, (.A 397), (.A 141), (.A 397), .split, .split, .split, .split, .split, (.D 6), .split, .split, (.D 6), (.A 176), (.D 6), .split, (.A 32948), .split, (.A 180), (.A 948), .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s170A_3 : wsegOk P 0 nb170 kN170 k170A_3 t170A_3 k170A_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t170A_4 : List Tok := [.split, (.D 6), (.A 876), .split, .split, (.A 114), .split, .split, .split, (.A 116), (.A 180), (.A 884), .split, .split, (.A 114), .split, (.A 116), (.A 112), (.A 108), .split, (.A 894), (.A 876), .split, .split, (.A 948), .split, (.A 932), (.D 10), .split, .split, .split, .split, .split, .split, (.A 32948), .split, (.A 180), (.A 956), (.A 908), (.A 940)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s170A_4 : wsegOk P 0 nb170 kN170 k170A_4 t170A_4 k170A_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t170A_5 : List Tok := [.split, .split, .split, (.A 188), (.A 172), .split, (.A 909), .split, (.A 141), (.A 909), .split, .split, .split, .split, (.A 876), (.A 940), (.A 32876), .split, .split, (.A 108), .split, .split, (.A 940), (.A 876), (.A 108), (.A 32876), (.A 940), (.A 909), .split, (.A 876), (.A 844), .split, .split, .split, .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 66)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s170A_5 : wsegOk P 0 nb170 kN170 k170A_5 t170A_5 k170A_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t170A_6 : List Tok := [(.D 5), (.A 198), .split, .split, (.A 114), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.A 114), .split, (.A 242), (.A 226), .split, .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 486), (.D 5), .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 241), (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s170A_6 : wsegOk P 0 nb170 kN170 k170A_6 t170A_6 k170A_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t170A_7 : List Tok := [(.D 5), .split, .split, (.A 225), (.A 225), (.A 32993), .split, .split, .split, (.A 454), .split, .split, (.D 8), (.A 397), (.D 8), .split, .split, .split, .split, (.A 198), (.A 453), .split, .split, .split, (.A 197), (.A 205), (.A 193), (.A 141), (.A 193), .split, (.A 397), .split, (.A 397), (.A 141), .split, .split, (.A 485), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s170A_7 : wsegOk P 0 nb170 kN170 k170A_7 t170A_7 k170A_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t170A_8 : List Tok := [.split, (.A 225), .split, .split, (.D 8), (.A 141), (.D 8), .split, .split, .split, .split, .split, (.A 114), .split, (.A 114), (.A 114), .split, .split, (.A 98), (.A 108), (.A 97), .split, .split, (.A 878), (.D 9), .split, (.A 876), (.A 108), .split, .split, .split, .split, .split, (.D 9), .split, (.A 113), (.D 9), (.D 9), (.D 9), .split, .split, (.A 225)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s170A_8 : wsegOk P 0 nb170 kN170 k170A_8 t170A_8 k170A_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t170A_9 : List Tok := [.split, .split, (.A 97), (.D 9), (.A 225), (.A 32993), .split, (.D 9), .split, .split, .split, (.D 9), (.A 224), (.D 9), (.D 9), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 173), (.A 237), (.A 141), .split, (.A 108), (.A 173), (.A 237), (.A 141), .split, (.A 108), .split, .split, (.A 173), .split, (.A 876), (.A 941)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s170A_9 : wsegOk P 0 nb170 kN170 k170A_9 t170A_9 k170A_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t170A_10 : List Tok := [.split, (.A 173), (.A 109), .split, (.A 225), (.A 109), .split, .split, (.A 32909), .split, .split, (.A 32909), (.A 141), (.A 32909), (.A 141), .split, .split, .split, .split, (.A 32876), .split, (.A 32876), .split, (.A 108), (.A 32876), (.A 32876), (.A 108), .split, .split, .split, .split, (.A 845), (.D 3), (.D 3), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s170A_10 : wsegOk P 0 nb170 kN170 k170A_10 t170A_10 k170A_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t170A_11 : List Tok := [.split, .split, (.A 225), (.A 161), .split, .split, .split, (.A 236), (.D 3), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 10), .split, (.D 10), .split, (.A 32948), (.D 10), (.D 0), .split, .split, (.D 6), .split, .split, (.A 32948), (.D 6), (.D 6), (.D 0), .split, .split, .split, .split, (.D 4), (.A 436), (.D 4), (.D 0)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s170A_11 : wsegOk P 0 nb170 kN170 k170A_11 t170A_11 k170A_12 = true := by
  decide +kernel

end PackLean.D40.Tet
