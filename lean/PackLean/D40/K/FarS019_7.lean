-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey019

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060A_22 : List Tok := [.split, .split, (.D 6), .split, .split, (.A 32948), (.D 6), (.D 6), (.D 0), .split, .split, .split, .split, (.D 4), (.A 436), (.D 4), (.D 0), .split, .split, .split, .split, (.A 32948), (.D 7), (.D 7), (.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), .split, (.D 5), (.A 32993), .split, (.D 0)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060A_22 : wsegOk P 0 nb060 kN060 k060A_22 t060A_22 k060A_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060A_23 : List Tok := [.split, (.D 8), .split, .split, (.D 8), (.A 32993), (.D 8), .split, .split, (.D 0), .split, .split, (.D 9), (.A 737), (.D 9), .split, (.D 0), .split, .split, .split, (.D 3), (.A 32993), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8), .split, (.A 32966), (.D 8), (.D 1), .split, .split, (.D 5), .split, .split, (.A 32966)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060A_23 : wsegOk P 0 nb060 kN060 k060A_23 t060A_23 k060A_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060A_24 : List Tok := [(.D 5), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, .split, (.A 32966), (.D 7), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), .split, (.D 6), (.A 32876), .split, (.D 1), .split, (.D 10), .split, (.A 876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060A_24 : wsegOk P 0 nb060 kN060 k060A_24 t060A_24 k060A_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060A_25 : List Tok := [(.D 10), .split, .split, (.D 1), .split, .split, (.D 9), .split, (.D 9), (.A 32876), (.D 9), .split, (.D 1), .split, .split, .split, (.D 3), (.A 32876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), .split, (.A 32882), (.D 9), (.D 2), .split, .split, (.D 5), .split, .split, (.A 32882), (.D 5), (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060A_25 : wsegOk P 0 nb060 kN060 k060A_25 t060A_25 k060A_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060A_26 : List Tok := [(.D 2), .split, .split, .split, .split, (.D 6), .split, (.A 32882), (.D 6), (.D 6), (.D 2), .split, .split, .split, .split, (.A 32882), (.D 7), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), .split, (.D 4), (.A 32909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060A_26 : wsegOk P 0 nb060 kN060 k060A_26 t060A_26 k060A_27 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060A_27 : List Tok := [.split, .split, (.D 2), .split, .split, (.D 8), .split, (.D 8), (.A 32909), (.D 8), .split, (.D 2), .split, .split, .split, (.D 3), (.A 32909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060A_27 : wsegOk P 0 nb060 kN060 k060A_27 t060A_27 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060B_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), (.A 500), .split, (.A 178), (.A 436), .split, .split, (.A 70), (.A 454), .split, (.A 114), .split, (.A 438), .split, (.A 198), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), (.A 118), .split, .split, .split, (.A 452)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060B_0 : wsegOk P 1 nb060 kN060 (rRoots P.den) t060B_0 k060B_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060B_1 : List Tok := [(.D 4), .split, (.A 436), (.A 437), .split, .split, (.A 454), (.A 398), .split, .split, (.A 388), .split, .split, (.A 454), (.A 389), .split, .split, .split, (.A 390), .split, (.A 436), (.A 900), .split, .split, (.A 454), (.A 389), .split, .split, (.A 132), .split, (.A 134), .split, (.A 132), (.A 141), (.A 909), (.A 909), (.A 909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060B_1 : wsegOk P 1 nb060 kN060 k060B_1 t060B_1 k060B_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060B_2 : List Tok := [.split, .split, .split, .split, .split, (.D 6), .split, (.A 114), (.D 6), (.A 436), .split, (.D 6), .split, (.D 6), (.A 876), .split, .split, (.A 114), .split, (.A 884), (.A 112), .split, (.A 894), (.A 876), .split, .split, (.A 948), .split, (.A 932), (.D 10), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, .split, .split, (.A 180), (.A 908), (.A 956)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060B_2 : wsegOk P 1 nb060 kN060 k060B_2 t060B_2 k060B_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060B_3 : List Tok := [(.A 172), (.A 909), (.A 940), (.A 909), (.A 876), (.A 909), .split, (.A 876), (.A 844), .split, .split, .split, .split, (.A 198), .split, (.A 114), (.A 226), .split, .split, (.D 5), (.A 486), .split, (.A 241), (.A 225), .split, .split, .split, (.A 454), .split, .split, (.D 8), (.A 397), (.D 8), .split, .split, .split, (.A 454)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060B_3 : wsegOk P 1 nb060 kN060 k060B_3 t060B_3 k060B_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060B_4 : List Tok := [(.A 205), (.A 193), (.A 909), .split, .split, (.A 485), (.D 8), .split, (.A 225), (.A 129), .split, .split, .split, .split, (.A 114), .split, (.A 96), (.A 97), .split, (.A 878), (.A 876), .split, .split, .split, .split, (.A 114), (.D 9), (.D 9), (.A 225), .split, (.D 9), .split, (.A 108), (.D 9), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 173)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060B_4 : wsegOk P 1 nb060 kN060 k060B_4 t060B_4 k060B_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060B_5 : List Tok := [(.A 237), (.A 909), (.A 877), (.A 237), (.A 909), .split, (.A 876), (.A 941), .split, (.A 225), (.A 109), (.A 909), .split, (.A 876), .split, (.A 845), (.D 3), .split, .split, (.A 225), (.A 161), .split, (.A 236), (.D 3), .split, .split, .split, .split, .split, (.D 10), .split, (.D 10), (.A 436)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060B_5 : wsegOk P 1 nb060 kN060 k060B_5 t060B_5 k060B_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060B_6 : List Tok := [(.D 0), .split, .split, (.D 6), .split, (.A 436), (.D 6), (.D 0), .split, .split, .split, .split, (.D 4), (.A 436), (.D 4), (.D 0), .split, .split, .split, (.A 436), (.D 7), (.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), (.A 225), .split, (.D 0), .split, (.D 8), .split, (.A 225)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060B_6 : wsegOk P 1 nb060 kN060 k060B_6 t060B_6 k060B_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060B_7 : List Tok := [(.D 8), .split, .split, (.D 0), .split, (.A 737), (.D 9), .split, (.D 0), .split, .split, (.A 225), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8), (.A 454), (.D 1), .split, .split, (.D 5), .split, (.A 454), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060B_7 : wsegOk P 1 nb060 kN060 k060B_7 t060B_7 k060B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060B_8 : List Tok := [.split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10), .split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), (.A 876), (.D 9), .split, (.D 1), .split, .split, (.A 876), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060B_8 : wsegOk P 1 nb060 kN060 k060B_8 t060B_8 k060B_9 = true := by
  decide +kernel

end PackLean.D40.Tet
