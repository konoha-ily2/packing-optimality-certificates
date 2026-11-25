-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey058

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t206B_10 : List Tok := [.split, (.D 8), (.A 454), (.D 1), .split, .split, (.D 5), .split, .split, (.A 32966), (.D 5), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s206B_10 : wsegOk P 1 nb206 kN206 k206B_10 t206B_10 k206B_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t206B_11 : List Tok := [.split, (.D 1), .split, (.D 10), .split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), .split, (.D 9), (.A 32876), (.D 9), .split, (.D 1), .split, .split, (.A 620), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), .split, (.A 32882), (.D 9), (.D 2), .split, .split, (.D 5), .split, (.A 114)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s206B_11 : wsegOk P 1 nb206 kN206 k206B_11 t206B_11 k206B_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t206B_12 : List Tok := [(.D 5), (.D 2), .split, .split, .split, .split, (.D 6), .split, (.A 32882), (.D 6), (.D 6), (.D 2), .split, .split, (.A 114), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s206B_12 : wsegOk P 1 nb206 kN206 k206B_12 t206B_12 k206B_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t206B_13 : List Tok := [.split, (.D 8), (.A 32909), (.D 8), .split, (.D 2), .split, .split, (.A 141), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s206B_13 : wsegOk P 1 nb206 kN206 k206B_13 t206B_13 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t207A_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 500), .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 178), .split, (.A 32948), .split, .split, (.A 180), .split, (.A 32948), .split, .split, .split, (.D 7), .split, (.D 7), (.A 32948), (.A 32948), (.A 32948)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s207A_0 : wsegOk P 0 nb207 kN207 (rRoots P.den) t207A_0 k207A_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t207A_1 : List Tok := [.split, (.A 180), (.A 32948), .split, .split, (.A 70), .split, .split, (.A 32966), (.A 198), (.A 198), .split, (.A 114), .split, .split, .split, .split, (.A 182), (.A 118), (.A 182), .split, .split, (.A 182), (.A 118), (.A 180), .split, (.A 198), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s207A_1 : wsegOk P 0 nb207 kN207 k207A_1 t207A_1 k207A_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t207A_2 : List Tok := [.split, (.A 114), .split, (.A 182), .split, (.A 246), (.A 118), .split, .split, .split, .split, (.D 4), .split, (.D 4), (.A 388), (.D 4), .split, (.A 436), .split, (.D 4), .split, (.D 4), (.A 909), .split, .split, (.A 454), (.A 398), .split, .split, .split, .split, .split, (.A 388), .split, .split, (.A 454), (.A 32902), .split, (.A 134), .split, (.A 32900), .split, (.A 32902)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s207A_2 : wsegOk P 0 nb207 kN207 k207A_2 t207A_2 k207A_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t207A_3 : List Tok := [(.A 134), (.A 388), .split, .split, (.A 32948), (.A 180), .split, (.A 900), .split, .split, .split, (.A 32900), .split, .split, .split, (.A 32900), (.A 133), (.A 32901), (.A 901), (.A 32901), (.A 909), .split, .split, .split, .split, (.A 32966), (.A 134), (.A 198), .split, .split, (.A 390), .split, .split, (.A 389), (.A 133), (.A 32901), .split, .split, (.A 198)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s207A_3 : wsegOk P 0 nb207 kN207 k207A_3 t207A_3 k207A_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t207A_4 : List Tok := [(.A 389), (.A 133), .split, .split, (.A 132), .split, (.A 134), .split, .split, (.A 132), .split, (.A 134), .split, (.A 132), (.A 141), (.A 141), (.A 141), .split, .split, .split, (.A 397), (.D 4), (.A 909), .split, .split, (.A 397), (.A 32909), (.A 32909), .split, .split, .split, .split, .split, (.D 6), .split, .split, (.D 6), .split, (.D 6), .split, .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s207A_4 : wsegOk P 0 nb207 kN207 k207A_4 t207A_4 k207A_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t207A_5 : List Tok := [(.A 176), (.D 6), (.D 6), (.A 948), .split, (.D 6), .split, (.D 6), (.A 876), .split, .split, (.A 882), .split, .split, .split, (.A 884), .split, (.A 32948), .split, .split, .split, (.A 948), (.A 116), (.A 948), (.A 884), (.A 884), .split, .split, (.A 114), .split, .split, .split, (.A 116), (.A 180), (.A 892), (.A 112)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s207A_5 : wsegOk P 0 nb207 kN207 k207A_5 t207A_5 k207A_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t207A_6 : List Tok := [(.A 876), (.A 876), .split, .split, (.A 948), .split, (.A 932), (.D 10), .split, .split, .split, (.A 956), .split, .split, .split, .split, .split, .split, (.A 948), (.A 180), (.A 908), (.A 956), .split, .split, .split, (.A 188), (.A 172), (.A 141), .split, .split, .split, .split, .split, .split, .split, (.A 124), (.A 956), (.A 876), (.A 108), .split, (.A 940), (.A 172), (.A 876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s207A_6 : wsegOk P 0 nb207 kN207 k207A_6 t207A_6 k207A_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t207A_7 : List Tok := [(.A 108), .split, (.A 940), (.A 172), (.A 909), .split, (.A 876), (.A 940), (.A 909), .split, (.A 876), .split, (.D 10), .split, .split, (.A 844), (.D 10), (.D 10), .split, .split, .split, .split, .split, .split, (.A 66), (.D 5), (.A 198), .split, .split, (.A 114), (.A 114), .split, .split, (.A 198), (.A 242), (.A 226)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s207A_7 : wsegOk P 0 nb207 kN207 k207A_7 t207A_7 k207A_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t207A_8 : List Tok := [.split, .split, (.D 5), .split, (.A 198), (.D 5), .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 241), (.D 5), (.D 5), (.A 225), .split, .split, .split, (.A 454), .split, .split, (.D 8), .split, .split, .split, (.D 8), (.A 397), (.D 8), (.D 8), (.D 8), .split, .split, .split, .split, (.A 198), (.A 197)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s207A_8 : wsegOk P 0 nb207 kN207 k207A_8 t207A_8 k207A_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t207A_9 : List Tok := [.split, (.A 193), (.A 141), (.A 193), .split, .split, .split, (.A 141), (.A 32909), (.A 32909), .split, (.A 141), (.A 141), .split, .split, (.A 485), (.D 8), .split, (.A 225), .split, .split, (.D 8), (.A 141), (.D 8), .split, .split, .split, .split, .split, (.A 29554), .split, .split, (.A 32882), (.A 114), .split, (.D 9), .split, (.A 882), (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s207A_9 : wsegOk P 0 nb207 kN207 k207A_9 t207A_9 k207A_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t207A_10 : List Tok := [.split, .split, .split, (.A 114), (.A 97), .split, .split, (.A 864), .split, (.A 98), (.A 864), .split, (.A 876), (.A 108), .split, .split, .split, (.A 98), (.A 97), .split, .split, (.A 225), (.A 97), (.A 32993), .split, .split, .split, (.A 98), .split, .split, (.A 866), (.D 9), (.A 32864), .split, (.A 97), (.A 608), (.A 97), .split, .split, (.A 878)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s207A_10 : wsegOk P 0 nb207 kN207 k207A_10 t207A_10 k207A_11 = true := by
  decide +kernel

end PackLean.D40.Tet
