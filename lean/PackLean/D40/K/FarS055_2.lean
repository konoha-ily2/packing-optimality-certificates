-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey055

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192A_30 : List Tok := [(.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), .split, (.D 4), (.A 32909), .split, (.D 2), .split, (.D 10), .split, .split, (.D 10), (.A 32909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), .split, (.D 8), (.A 32909), (.D 8), .split, (.D 2), .split, .split, .split, (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s192A_30 : wsegOk P 0 nb192 kN192 k192A_30 t192A_30 k192A_31 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192A_31 : List Tok := [(.A 32909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s192A_31 : wsegOk P 0 nb192 kN192 k192A_31 t192A_31 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192B_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 500), .split, (.A 178), (.A 436), .split, (.A 198), .split, (.A 114), .split, .split, (.A 438), .split, .split, (.A 182), (.A 118), (.A 436), .split, (.A 198), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s192B_0 : wsegOk P 1 nb192 kN192 (rRoots P.den) t192B_0 k192B_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192B_1 : List Tok := [.split, (.A 182), .split, (.A 246), (.A 118), .split, .split, .split, (.A 452), (.D 4), .split, (.A 436), (.A 949), .split, .split, (.A 454), (.A 398), .split, .split, (.A 388), .split, .split, (.A 454), (.A 389), .split, .split, .split, (.A 902), (.A 900), .split, (.A 134), .split, .split, .split, (.A 902), .split, .split, (.A 948), .split, .split, (.A 180), (.A 900), (.A 948)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s192B_1 : wsegOk P 1 nb192 kN192 k192B_1 t192B_1 k192B_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192B_2 : List Tok := [(.A 900), .split, (.A 134), .split, (.A 132), (.A 909), (.A 909), (.A 909), (.A 909), .split, .split, .split, .split, .split, (.D 6), .split, .split, (.D 6), (.A 176), (.D 6), (.A 436), .split, (.D 6), .split, (.D 6), (.A 876), .split, .split, .split, .split, (.A 114), (.A 882), (.A 114), .split, (.A 884), .split, .split, (.A 114)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s192B_2 : wsegOk P 1 nb192 kN192 k192B_2 t192B_2 k192B_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192B_3 : List Tok := [.split, (.A 884), .split, (.A 112), (.A 892), (.A 876), (.A 876), .split, .split, (.A 948), (.A 932), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, (.A 172), (.A 909), (.A 940), (.A 909), (.A 940), (.A 909), (.A 940), (.A 909), (.A 876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s192B_3 : wsegOk P 1 nb192 kN192 k192B_3 t192B_3 k192B_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192B_4 : List Tok := [(.A 909), .split, (.A 876), (.A 844), .split, .split, .split, .split, (.A 198), .split, (.A 114), (.A 226), .split, .split, (.D 5), (.A 230), .split, (.A 241), (.A 225), .split, .split, .split, (.A 454), .split, .split, (.D 8), .split, (.A 462), (.D 8), (.D 8), .split, (.A 197), .split, (.A 909), (.A 141), .split, .split, .split, (.A 198), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s192B_4 : wsegOk P 1 nb192 kN192 k192B_4 t192B_4 k192B_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192B_5 : List Tok := [(.D 8), .split, (.A 225), (.A 129), .split, .split, .split, .split, (.A 114), .split, .split, .split, (.A 114), (.A 97), (.A 876), (.A 97), .split, (.A 878), (.A 876), .split, .split, .split, .split, .split, (.D 9), (.A 113), (.D 9), (.D 9), .split, .split, (.A 225), .split, .split, (.A 97), (.D 9), (.A 225), (.A 32993), .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s192B_5 : wsegOk P 1 nb192 kN192 k192B_5 t192B_5 k192B_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192B_6 : List Tok := [.split, .split, (.A 608), (.D 9), (.D 9), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 173), (.A 877), (.A 237), (.A 909), (.A 877), (.A 237), (.A 909), .split, (.A 876), (.A 941), .split, (.A 225), (.A 109), (.A 909), .split, .split, (.A 876), .split, .split, (.A 876), .split, (.A 876), (.D 3), (.A 32876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s192B_6 : wsegOk P 1 nb192 kN192 k192B_6 t192B_6 k192B_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192B_7 : List Tok := [.split, (.A 845), (.D 3), .split, .split, (.A 225), (.A 161), .split, .split, .split, (.A 236), (.D 3), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 10), .split, (.D 10), .split, (.A 32948), (.D 10), (.D 0), .split, .split, (.D 6), .split, (.A 436), (.D 6), (.D 0), .split, .split, .split, .split, (.D 4), (.A 436), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s192B_7 : wsegOk P 1 nb192 kN192 k192B_7 t192B_7 k192B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192B_8 : List Tok := [(.D 0), .split, .split, .split, (.A 436), (.D 7), (.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), (.A 737), .split, (.D 0), .split, (.D 8), .split, (.A 225), (.D 8), .split, .split, (.D 0), .split, (.A 737), (.D 9), .split, (.D 0), .split, .split, (.A 225), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s192B_8 : wsegOk P 1 nb192 kN192 k192B_8 t192B_8 k192B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192B_9 : List Tok := [.split, (.D 8), (.A 454), (.D 1), .split, .split, (.D 5), .split, .split, (.A 32966), (.D 5), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s192B_9 : wsegOk P 1 nb192 kN192 k192B_9 t192B_9 k192B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192B_10 : List Tok := [.split, (.D 1), .split, (.D 10), .split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), (.A 876), (.D 9), .split, (.D 1), .split, (.A 620), (.D 3), .split, .split, .split, .split, .split, (.D 9), (.A 882), (.D 2), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), (.A 114)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s192B_10 : wsegOk P 1 nb192 kN192 k192B_10 t192B_10 k192B_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192B_11 : List Tok := [(.D 6), (.D 2), .split, .split, (.A 114), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2), .split, .split, .split, (.D 3), (.A 32909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s192B_11 : wsegOk P 1 nb192 kN192 k192B_11 t192B_11 k192B_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192B_12 : List Tok := [(.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s192B_12 : wsegOk P 1 nb192 kN192 k192B_12 t192B_12 [] = true := by
  decide +kernel

end PackLean.D40.Tet
