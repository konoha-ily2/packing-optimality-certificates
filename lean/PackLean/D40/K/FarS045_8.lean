-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey045

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145A_22 : List Tok := [.split, .split, (.D 9), .split, (.D 9), (.A 32876), (.D 9), .split, (.D 1), .split, .split, (.A 620), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), .split, (.A 32882), (.D 9), (.D 2), .split, .split, (.D 5), .split, .split, (.A 32882), (.D 5), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), .split, (.A 32882)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s145A_22 : wsegOk P 0 nb145 kN145 k145A_22 t145A_22 k145A_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145A_23 : List Tok := [(.D 6), (.D 6), (.D 2), .split, .split, (.A 114), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), .split, (.D 4), (.A 32909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), .split, (.D 8), (.A 32909), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s145A_23 : wsegOk P 0 nb145 kN145 k145A_23 t145A_23 k145A_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145A_24 : List Tok := [.split, (.D 2), .split, .split, .split, (.D 3), (.A 32909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s145A_24 : wsegOk P 0 nb145 kN145 k145A_24 t145A_24 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145B_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 500), .split, (.A 178), (.A 436), .split, .split, (.A 70), (.A 454), .split, (.A 114), .split, .split, (.A 438), (.A 180), .split, (.A 198), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s145B_0 : wsegOk P 1 nb145 kN145 (rRoots P.den) t145B_0 k145B_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145B_1 : List Tok := [.split, (.A 246), (.A 118), .split, .split, .split, (.A 452), (.D 4), .split, (.A 436), (.A 949), .split, .split, (.A 454), (.A 398), .split, .split, (.A 388), .split, .split, (.A 454), (.A 389), .split, .split, .split, (.A 390), .split, .split, (.A 948), .split, (.A 132), (.A 948), (.A 900), .split, (.A 134), .split, .split, (.A 132), .split, (.A 134), .split, (.A 132)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s145B_1 : wsegOk P 1 nb145 kN145 k145B_1 t145B_1 k145B_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145B_2 : List Tok := [(.A 141), (.A 909), (.A 909), (.A 909), .split, .split, .split, .split, .split, (.D 6), .split, .split, (.D 6), (.A 176), (.D 6), .split, (.A 32948), .split, (.A 436), (.A 948), .split, (.D 6), .split, (.D 6), (.A 876), .split, .split, (.A 114), .split, (.A 884), .split, .split, (.A 114), .split, (.A 884), (.A 112), (.A 876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s145B_2 : wsegOk P 1 nb145 kN145 k145B_2 t145B_2 k145B_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145B_3 : List Tok := [.split, (.A 894), (.A 876), .split, .split, (.A 948), (.A 932), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, .split, .split, .split, (.A 948), (.A 188), (.A 908), (.A 956), .split, (.A 140), .split, .split, (.A 940), (.A 108), (.A 940), (.A 909), (.A 940), (.A 909), (.A 876), (.A 909), .split, (.A 876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s145B_3 : wsegOk P 1 nb145 kN145 k145B_3 t145B_3 k145B_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145B_4 : List Tok := [(.A 844), .split, .split, .split, .split, (.A 198), .split, (.A 114), (.A 226), .split, .split, (.D 5), (.A 230), .split, .split, .split, (.D 5), (.A 114), (.D 5), (.A 225), .split, .split, .split, (.A 454), .split, .split, (.D 8), (.A 397), (.D 8), .split, .split, (.A 197), (.A 193), .split, (.A 909), (.A 141), .split, .split, (.A 485), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s145B_4 : wsegOk P 1 nb145 kN145 k145B_4 t145B_4 k145B_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145B_5 : List Tok := [.split, (.A 225), (.A 129), .split, .split, .split, .split, (.A 114), .split, .split, (.A 98), (.A 876), (.A 97), .split, (.A 878), (.A 876), .split, .split, .split, .split, .split, (.D 9), (.A 113), (.D 9), (.D 9), (.A 225), .split, (.D 9), .split, .split, (.A 96), (.D 9), (.D 9), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 173), (.A 237), (.A 909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s145B_5 : wsegOk P 1 nb145 kN145 k145B_5 t145B_5 k145B_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145B_6 : List Tok := [(.A 877), (.A 237), (.A 909), .split, (.A 876), (.A 941), .split, (.A 225), (.A 109), (.A 909), .split, .split, (.A 876), .split, .split, (.A 876), .split, (.A 876), (.D 3), (.A 32876), .split, (.A 845), (.D 3), .split, .split, (.A 225), (.A 161), .split, (.A 236), (.D 3), .split, .split, .split, .split, .split, (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s145B_6 : wsegOk P 1 nb145 kN145 k145B_6 t145B_6 k145B_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145B_7 : List Tok := [.split, (.D 10), (.A 436), (.D 0), .split, .split, (.D 6), .split, (.A 436), (.D 6), (.D 0), .split, .split, .split, .split, (.D 4), (.A 436), (.D 4), (.D 0), .split, .split, .split, (.A 436), (.D 7), (.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), .split, (.D 5), (.A 32993)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s145B_7 : wsegOk P 1 nb145 kN145 k145B_7 t145B_7 k145B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145B_8 : List Tok := [.split, (.D 0), .split, (.D 8), .split, (.A 225), (.D 8), .split, .split, (.D 0), .split, (.A 737), (.D 9), .split, (.D 0), .split, .split, (.A 225), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8), (.A 454), (.D 1), .split, .split, (.D 5), .split, .split, (.A 32966), (.D 5), (.D 5), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s145B_8 : wsegOk P 1 nb145 kN145 k145B_8 t145B_8 k145B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145B_9 : List Tok := [.split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10), .split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), (.A 876), (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s145B_9 : wsegOk P 1 nb145 kN145 k145B_9 t145B_9 k145B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145B_10 : List Tok := [.split, (.D 1), .split, .split, (.A 620), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), .split, (.A 32882), (.D 9), (.D 2), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), (.A 114), (.D 6), (.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s145B_10 : wsegOk P 1 nb145 kN145 k145B_10 t145B_10 k145B_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145B_11 : List Tok := [(.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2), .split, .split, (.A 909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s145B_11 : wsegOk P 1 nb145 kN145 k145B_11 t145B_11 [] = true := by
  decide +kernel

end PackLean.D40.Tet
