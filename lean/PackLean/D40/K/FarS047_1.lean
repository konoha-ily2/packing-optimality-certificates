-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey047

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152A_15 : List Tok := [.split, .split, (.D 1), .split, .split, (.D 9), .split, (.D 9), (.A 32876), (.D 9), .split, (.D 1), .split, .split, (.A 620), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), .split, (.A 32882), (.D 9), (.D 2), .split, .split, (.D 5), .split, .split, (.A 32882), (.D 5), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152A_15 : wsegOk P 0 nb152 kN152 k152A_15 t152A_15 k152A_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152A_16 : List Tok := [.split, (.A 32882), (.D 6), (.D 6), (.D 2), .split, .split, (.A 114), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), .split, (.D 8), (.A 32909), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152A_16 : wsegOk P 0 nb152 kN152 k152A_16 t152A_16 k152A_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152A_17 : List Tok := [.split, (.D 2), .split, .split, (.A 141), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152A_17 : wsegOk P 0 nb152 kN152 k152A_17 t152A_17 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152B_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 500), .split, (.A 178), .split, (.A 32948), .split, .split, (.A 180), (.A 436), .split, (.A 180), (.A 32948), .split, .split, (.A 70), .split, .split, (.A 32966), .split, (.A 198), (.A 454), (.A 198), .split, (.A 114), .split, .split, .split, .split, (.A 182), (.A 118), .split, (.A 438)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152B_0 : wsegOk P 1 nb152 kN152 (rRoots P.den) t152B_0 k152B_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152B_1 : List Tok := [.split, (.A 454), (.A 182), .split, .split, (.A 182), (.A 118), (.A 180), .split, (.A 198), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), (.A 118), .split, .split, .split, (.A 452), (.D 4), .split, (.A 436), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152B_1 : wsegOk P 1 nb152 kN152 k152B_1 t152B_1 k152B_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152B_2 : List Tok := [.split, (.D 4), (.A 909), .split, .split, (.A 454), (.A 398), .split, .split, .split, .split, (.A 390), (.A 388), .split, .split, (.A 32948), (.A 436), (.A 900), .split, .split, .split, .split, (.A 32966), .split, .split, (.A 390), (.A 198), (.A 390), (.A 198), (.A 389), .split, .split, (.A 132), .split, (.A 134), .split, .split, (.A 132), .split, (.A 134), .split, (.A 132)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152B_2 : wsegOk P 1 nb152 kN152 k152B_2 t152B_2 k152B_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152B_3 : List Tok := [(.A 141), (.A 141), .split, (.A 909), .split, (.A 141), (.A 909), .split, (.A 909), (.A 909), .split, .split, .split, .split, .split, (.D 6), .split, .split, (.D 6), (.A 176), (.D 6), (.A 948), .split, (.D 6), .split, (.D 6), (.A 876), .split, .split, .split, (.A 882), (.A 114), .split, .split, .split, (.A 116), (.A 948), (.A 884)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152B_3 : wsegOk P 1 nb152 kN152 k152B_3 t152B_3 k152B_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152B_4 : List Tok := [.split, .split, (.A 114), .split, .split, (.A 116), (.A 892), (.A 112), (.A 876), (.A 876), .split, .split, (.A 948), (.A 932), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 188), (.A 172), .split, (.A 908), (.A 141), .split, .split, (.A 876), .split, (.A 108), (.A 876), (.A 940), (.A 909), .split, (.A 876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152B_4 : wsegOk P 1 nb152 kN152 k152B_4 t152B_4 k152B_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152B_5 : List Tok := [(.A 940), (.A 909), .split, (.A 876), (.A 844), .split, .split, .split, .split, .split, .split, (.A 66), (.D 5), (.A 198), .split, (.A 114), .split, (.A 242), (.A 226), .split, .split, (.D 5), (.A 230), .split, .split, .split, (.D 5), .split, (.D 5), (.A 241), (.D 5), (.A 225), .split, .split, .split, (.A 454), .split, .split, (.D 8), (.A 397)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152B_5 : wsegOk P 1 nb152 kN152 k152B_5 t152B_5 k152B_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152B_6 : List Tok := [(.D 8), .split, .split, .split, .split, (.A 198), (.A 197), .split, (.A 193), (.A 141), (.A 193), .split, .split, .split, (.A 397), (.A 32909), (.A 32909), (.A 141), .split, .split, (.A 485), (.D 8), .split, (.A 225), .split, (.A 141), (.D 8), .split, .split, .split, .split, .split, (.A 114), .split, (.A 114), .split, (.D 9), .split, (.A 114), (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152B_6 : wsegOk P 1 nb152 kN152 k152B_6 t152B_6 k152B_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152B_7 : List Tok := [.split, .split, .split, (.A 114), (.A 97), (.A 876), (.A 97), .split, (.A 878), (.A 876), .split, .split, .split, .split, .split, (.D 9), (.A 113), (.D 9), (.D 9), .split, .split, (.A 225), .split, .split, (.A 97), (.D 9), (.A 225), (.A 32993), .split, (.D 9), .split, .split, .split, (.D 9), (.A 736), (.D 9), (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152B_7 : wsegOk P 1 nb152 kN152 k152B_7 t152B_7 k152B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152B_8 : List Tok := [.split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 173), .split, (.A 108), (.A 173), (.A 237), (.A 141), .split, (.A 108), (.A 173), (.A 237), (.A 141), .split, .split, (.A 876), (.A 108), .split, (.A 941), .split, (.A 173), (.A 877), .split, (.A 225), (.A 109), .split, (.A 909), (.A 141), .split, .split, (.A 876), .split, (.A 108)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152B_8 : wsegOk P 1 nb152 kN152 k152B_8 t152B_8 k152B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152B_9 : List Tok := [(.A 32876), .split, (.A 845), (.D 3), .split, .split, (.A 225), (.A 161), .split, .split, .split, (.A 236), (.D 3), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 10), .split, (.D 10), .split, (.A 32948), (.D 10), (.D 0), .split, .split, (.D 6), .split, (.A 436), (.D 6), (.D 0), .split, .split, .split, .split, (.D 4), (.A 436)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152B_9 : wsegOk P 1 nb152 kN152 k152B_9 t152B_9 k152B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152B_10 : List Tok := [(.D 4), (.D 0), .split, .split, .split, (.A 436), (.D 7), (.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), (.A 737), .split, (.D 0), .split, (.D 8), .split, .split, (.D 8), (.A 32993), (.D 8), .split, .split, (.D 0), .split, (.A 737), (.D 9), .split, (.D 0), .split, .split, (.A 225)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152B_10 : wsegOk P 1 nb152 kN152 k152B_10 t152B_10 k152B_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152B_11 : List Tok := [(.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8), (.A 454), (.D 1), .split, .split, (.D 5), .split, .split, (.A 32966), (.D 5), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s152B_11 : wsegOk P 1 nb152 kN152 k152B_11 t152B_11 k152B_12 = true := by
  decide +kernel

end PackLean.D40.Tet
