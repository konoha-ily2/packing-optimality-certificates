-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey033

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t104A_42 : List Tok := [.split, (.D 1), .split, (.D 10), .split, .split, (.D 10), (.A 32876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), .split, (.D 9), (.A 32876), (.D 9), .split, (.D 1), .split, .split, .split, (.D 3), (.A 32876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), .split, (.A 32882), (.D 9), (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s104A_42 : wsegOk P 0 nb104 kN104 k104A_42 t104A_42 k104A_43 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t104A_43 : List Tok := [.split, .split, (.D 5), .split, .split, (.A 32882), (.D 5), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), .split, (.A 32882), (.D 6), (.D 6), (.D 2), .split, .split, .split, .split, (.A 32882), (.D 7), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), .split, (.D 4), (.A 32909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s104A_43 : wsegOk P 0 nb104 kN104 k104A_43 t104A_43 k104A_44 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t104A_44 : List Tok := [.split, (.D 2), .split, (.D 10), .split, .split, (.D 10), (.A 32909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), .split, (.D 8), (.A 32909), (.D 8), .split, (.D 2), .split, .split, .split, (.D 3), (.A 32909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s104A_44 : wsegOk P 0 nb104 kN104 k104A_44 t104A_44 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t104B_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), (.A 500), .split, (.A 178), (.A 436), .split, .split, (.A 70), (.A 454), .split, (.A 114), .split, (.A 438), .split, (.A 454), .split, (.A 114), .split, (.A 438), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), (.A 118), .split, .split, .split, (.A 452)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s104B_0 : wsegOk P 1 nb104 kN104 (rRoots P.den) t104B_0 k104B_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t104B_1 : List Tok := [(.D 4), .split, (.A 436), (.A 949), .split, .split, (.A 454), (.A 910), .split, .split, (.A 388), .split, (.A 454), .split, .split, (.A 388), .split, (.A 390), .split, .split, .split, (.A 390), (.A 900), .split, (.A 134), .split, .split, .split, (.A 902), .split, .split, (.A 948), .split, (.A 132), (.A 948), (.A 900), .split, (.A 134), .split, (.A 132), (.A 909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s104B_1 : wsegOk P 1 nb104 kN104 k104B_1 t104B_1 k104B_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t104B_2 : List Tok := [(.A 909), (.A 909), (.A 909), (.A 909), .split, .split, .split, .split, (.A 176), (.A 436), .split, (.D 6), (.A 356), .split, .split, (.A 114), .split, (.A 884), .split, (.A 112), (.A 876), .split, (.A 894), (.A 876), .split, .split, (.A 948), .split, (.A 932), (.D 10), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s104B_2 : wsegOk P 1 nb104 kN104 k104B_2 t104B_2 k104B_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t104B_3 : List Tok := [.split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, (.A 140), (.A 940), (.A 909), (.A 940), (.A 909), (.A 940), (.A 909), (.A 940), (.A 909), (.A 876), (.A 909), .split, (.A 876), (.A 844), .split, .split, .split, .split, (.A 198), .split, (.A 114), (.A 226), .split, .split, (.D 5), (.A 230)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s104B_3 : wsegOk P 1 nb104 kN104 k104B_3 t104B_3 k104B_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t104B_4 : List Tok := [.split, (.A 241), (.A 225), .split, .split, .split, (.A 454), (.A 974), .split, (.A 197), (.A 909), .split, .split, (.A 485), (.D 8), .split, (.A 225), (.A 129), .split, .split, .split, .split, (.A 114), .split, (.A 96), (.A 97), .split, (.A 878), (.A 876), .split, .split, (.A 113), (.A 225), .split, (.D 9), (.A 224), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 237)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s104B_4 : wsegOk P 1 nb104 kN104 k104B_4 t104B_4 k104B_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t104B_5 : List Tok := [(.A 909), (.A 877), (.A 237), (.A 909), (.A 877), (.A 1005), (.A 909), (.A 877), (.A 1005), (.A 909), (.A 876), .split, (.A 225), (.A 877), (.A 909), .split, (.A 876), (.A 845), .split, .split, (.A 225), (.A 161), .split, (.A 236), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s104B_5 : wsegOk P 1 nb104 kN104 k104B_5 t104B_5 k104B_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t104B_6 : List Tok := [.split, .split, .split, .split, .split, (.D 10), .split, (.D 10), (.A 436), (.D 0), .split, .split, (.D 6), .split, (.A 436), (.D 6), (.D 0), .split, .split, .split, .split, (.D 4), (.A 436), (.D 4), (.D 0), .split, .split, .split, (.A 436), (.D 7), (.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), (.A 225)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s104B_6 : wsegOk P 1 nb104 kN104 k104B_6 t104B_6 k104B_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t104B_7 : List Tok := [.split, (.D 0), .split, (.D 8), .split, (.A 225), (.D 8), .split, .split, (.D 0), .split, .split, (.D 9), (.A 225), (.D 9), .split, (.D 0), .split, .split, (.A 225), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8), (.A 454), (.D 1), .split, .split, (.D 5), .split, (.A 454), (.D 5), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s104B_7 : wsegOk P 1 nb104 kN104 k104B_7 t104B_7 k104B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t104B_8 : List Tok := [.split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10), .split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), (.A 876), (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s104B_8 : wsegOk P 1 nb104 kN104 k104B_8 t104B_8 k104B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t104B_9 : List Tok := [.split, (.D 1), .split, .split, (.A 876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), (.A 882), (.D 2), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), (.A 114), (.D 6), (.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s104B_9 : wsegOk P 1 nb104 kN104 k104B_9 t104B_9 k104B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t104B_10 : List Tok := [.split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2), .split, .split, (.A 909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s104B_10 : wsegOk P 1 nb104 kN104 k104B_10 t104B_10 [] = true := by
  decide +kernel

end PackLean.D40.Tet
