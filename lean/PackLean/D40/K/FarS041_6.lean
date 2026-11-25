-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey041

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128A_36 : List Tok := [(.D 5), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, .split, (.A 32966), (.D 7), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), .split, (.D 6), (.A 32876), .split, (.D 1), .split, (.D 10), .split, .split, (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s128A_36 : wsegOk P 0 nb128 kN128 k128A_36 t128A_36 k128A_37 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128A_37 : List Tok := [(.A 32876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), .split, (.D 9), (.A 32876), (.D 9), .split, (.D 1), .split, .split, .split, (.D 3), (.A 32876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), .split, (.A 32882), (.D 9), (.D 2), .split, .split, (.D 5), .split, .split, (.A 32882), (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s128A_37 : wsegOk P 0 nb128 kN128 k128A_37 t128A_37 k128A_38 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128A_38 : List Tok := [(.D 5), (.D 2), .split, .split, .split, .split, (.D 6), .split, (.A 32882), (.D 6), (.D 6), (.D 2), .split, .split, .split, .split, (.A 32882), (.D 7), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), .split, (.D 4), (.A 32909), .split, (.D 2), .split, (.D 10), .split, .split, (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s128A_38 : wsegOk P 0 nb128 kN128 k128A_38 t128A_38 k128A_39 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128A_39 : List Tok := [(.A 32909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), .split, (.D 8), (.A 32909), (.D 8), .split, (.D 2), .split, .split, .split, (.D 3), (.A 32909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s128A_39 : wsegOk P 0 nb128 kN128 k128A_39 t128A_39 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128B_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), (.A 500), .split, (.A 178), (.A 436), .split, .split, (.A 70), (.A 454), .split, (.A 114), .split, (.A 438), .split, (.A 198), .split, (.A 114), .split, .split, (.A 438), (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), (.A 118)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s128B_0 : wsegOk P 1 nb128 kN128 (rRoots P.den) t128B_0 k128B_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128B_1 : List Tok := [.split, .split, .split, (.A 452), (.D 4), .split, (.A 436), (.A 949), .split, .split, (.A 454), (.A 398), .split, .split, (.A 388), .split, .split, (.A 454), (.A 389), .split, .split, (.A 388), .split, .split, (.A 454), (.A 901), .split, .split, .split, (.A 902), (.A 900), .split, (.A 134), .split, (.A 132), (.A 909), (.A 909), (.A 909), (.A 909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s128B_1 : wsegOk P 1 nb128 kN128 k128B_1 t128B_1 k128B_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128B_2 : List Tok := [.split, .split, .split, .split, .split, (.D 6), .split, (.A 114), (.D 6), (.A 436), .split, (.D 6), .split, (.D 6), (.A 876), .split, .split, (.A 114), .split, (.A 884), .split, (.A 112), (.A 876), .split, (.A 894), (.A 876), .split, .split, (.A 948), .split, (.A 932), (.D 10), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s128B_2 : wsegOk P 1 nb128 kN128 k128B_2 t128B_2 k128B_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128B_3 : List Tok := [.split, .split, .split, .split, .split, (.A 180), (.A 908), (.A 956), (.A 172), (.A 909), (.A 940), (.A 909), (.A 940), (.A 909), (.A 940), (.A 909), (.A 876), (.A 909), .split, (.A 876), (.A 844), .split, .split, .split, .split, (.A 198), .split, (.A 114), (.A 226), .split, .split, (.D 5), (.A 230)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s128B_3 : wsegOk P 1 nb128 kN128 k128B_3 t128B_3 k128B_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128B_4 : List Tok := [.split, (.A 241), (.A 225), .split, .split, .split, (.A 454), .split, .split, (.D 8), .split, (.A 462), (.D 8), (.D 8), .split, (.A 197), (.A 909), .split, .split, (.A 485), (.D 8), .split, (.A 225), (.A 129), .split, .split, .split, .split, (.A 114), .split, (.A 96), (.A 97), .split, (.A 878), (.A 876), .split, .split, (.A 113), (.A 225)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s128B_4 : wsegOk P 1 nb128 kN128 k128B_4 t128B_4 k128B_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128B_5 : List Tok := [.split, (.D 9), .split, (.A 876), (.D 9), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 173), (.A 877), (.A 237), (.A 909), (.A 877), (.A 237), (.A 909), (.A 877), (.A 237), (.A 909), .split, (.A 876), (.A 941), .split, (.A 225), (.A 877), (.A 909), .split, (.A 876), (.A 845)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s128B_5 : wsegOk P 1 nb128 kN128 k128B_5 t128B_5 k128B_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128B_6 : List Tok := [.split, .split, (.A 225), (.A 161), .split, (.A 236), (.D 3), .split, .split, .split, .split, .split, (.D 10), .split, (.D 10), (.A 436), (.D 0), .split, .split, (.D 6), .split, (.A 436), (.D 6), (.D 0), .split, .split, .split, .split, (.D 4), (.A 436), (.D 4), (.D 0), .split, .split, .split, (.A 436), (.D 7), (.D 7), (.D 0)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s128B_6 : wsegOk P 1 nb128 kN128 k128B_6 t128B_6 k128B_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128B_7 : List Tok := [.split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), (.A 225), .split, (.D 0), .split, (.D 8), .split, (.A 225), (.D 8), .split, .split, (.D 0), .split, (.A 737), (.D 9), .split, (.D 0), .split, .split, (.A 225), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8), (.A 454), (.D 1), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s128B_7 : wsegOk P 1 nb128 kN128 k128B_7 t128B_7 k128B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128B_8 : List Tok := [.split, (.A 454), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10), .split, (.A 876), (.D 10), .split, .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s128B_8 : wsegOk P 1 nb128 kN128 k128B_8 t128B_8 k128B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128B_9 : List Tok := [.split, .split, (.D 9), (.A 876), (.D 9), .split, (.D 1), .split, (.A 620), (.D 3), .split, .split, .split, .split, .split, (.D 9), (.A 882), (.D 2), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), (.A 114), (.D 6), (.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s128B_9 : wsegOk P 1 nb128 kN128 k128B_9 t128B_9 k128B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128B_10 : List Tok := [(.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2), .split, .split, (.A 909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s128B_10 : wsegOk P 1 nb128 kN128 k128B_10 t128B_10 [] = true := by
  decide +kernel

end PackLean.D40.Tet
