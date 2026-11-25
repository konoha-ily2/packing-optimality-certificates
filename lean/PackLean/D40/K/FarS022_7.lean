-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey022

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070A_43 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.A 32948), (.D 4), (.D 4), (.D 0), .split, .split, .split, .split, (.A 32948), (.D 7), (.D 7), (.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), .split, (.D 5), (.A 32993), .split, (.D 0), .split, (.D 8), .split, .split, (.D 8), (.A 32993), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s070A_43 : wsegOk P 0 nb070 kN070 k070A_43 t070A_43 k070A_44 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070A_44 : List Tok := [.split, .split, (.D 0), .split, .split, (.D 9), .split, (.D 9), (.A 32993), (.D 9), .split, (.D 0), .split, .split, .split, (.D 3), (.A 32993), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8), .split, (.A 32966), (.D 8), (.D 1), .split, .split, (.D 5), .split, .split, (.A 32966), (.D 5), (.D 5), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s070A_44 : wsegOk P 0 nb070 kN070 k070A_44 t070A_44 k070A_45 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070A_45 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.A 32966), (.D 4), (.D 4), (.D 1), .split, .split, .split, .split, (.A 32966), (.D 7), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), .split, (.D 6), (.A 32876), .split, (.D 1), .split, (.D 10), .split, .split, (.D 10), (.A 32876), (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s070A_45 : wsegOk P 0 nb070 kN070 k070A_45 t070A_45 k070A_46 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070A_46 : List Tok := [.split, .split, (.D 1), .split, .split, (.D 9), .split, (.D 9), (.A 32876), (.D 9), .split, (.D 1), .split, .split, .split, (.D 3), (.A 32876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), .split, (.A 32882), (.D 9), (.D 2), .split, .split, (.D 5), .split, .split, (.A 32882), (.D 5), (.D 5), (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s070A_46 : wsegOk P 0 nb070 kN070 k070A_46 t070A_46 k070A_47 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070A_47 : List Tok := [.split, .split, .split, .split, (.D 6), .split, (.A 32882), (.D 6), (.D 6), (.D 2), .split, .split, .split, .split, (.A 32882), (.D 7), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), .split, (.D 4), (.A 32909), .split, (.D 2), .split, (.D 10), .split, .split, (.D 10), (.A 32909), (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s070A_47 : wsegOk P 0 nb070 kN070 k070A_47 t070A_47 k070A_48 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070A_48 : List Tok := [.split, .split, (.D 2), .split, .split, (.D 8), .split, (.D 8), (.A 32909), (.D 8), .split, (.D 2), .split, .split, .split, (.D 3), (.A 32909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s070A_48 : wsegOk P 0 nb070 kN070 k070A_48 t070A_48 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070B_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), (.A 500), .split, (.A 178), (.A 436), .split, .split, (.A 70), (.A 454), .split, (.A 114), .split, (.A 438), .split, (.A 454), .split, (.A 114), .split, (.A 438), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), (.A 118), .split, .split, .split, (.A 452)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s070B_0 : wsegOk P 1 nb070 kN070 (rRoots P.den) t070B_0 k070B_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070B_1 : List Tok := [(.D 4), .split, (.A 436), (.A 949), .split, .split, (.A 454), (.A 910), .split, .split, (.A 388), .split, (.A 454), .split, .split, (.A 388), .split, (.A 390), .split, .split, .split, (.A 390), (.A 900), .split, (.A 902), .split, .split, .split, (.A 902), (.A 900), .split, (.A 134), .split, .split, .split, (.A 902), .split, .split, (.A 948), .split, (.A 132), (.A 948), (.A 900)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s070B_1 : wsegOk P 1 nb070 kN070 k070B_1 t070B_1 k070B_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070B_2 : List Tok := [.split, (.A 134), .split, .split, (.A 132), (.A 133), (.A 909), (.A 909), (.A 909), (.A 909), (.A 909), (.A 909), .split, .split, .split, .split, (.A 176), (.A 436), .split, (.D 6), (.A 356), .split, .split, (.A 114), .split, (.A 884), .split, .split, (.A 114), .split, (.A 884), .split, (.A 112), (.A 892), (.A 876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s070B_2 : wsegOk P 1 nb070 kN070 k070B_2 t070B_2 k070B_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070B_3 : List Tok := [.split, (.A 894), (.A 876), .split, .split, (.A 948), .split, (.A 932), (.D 10), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, (.A 140), (.A 940), (.A 909), (.A 940), (.A 909), (.A 940), (.A 909), (.A 940), (.A 909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s070B_3 : wsegOk P 1 nb070 kN070 k070B_3 t070B_3 k070B_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070B_4 : List Tok := [(.A 940), (.A 909), (.A 876), (.A 909), .split, (.A 876), (.A 844), .split, .split, .split, .split, (.A 198), .split, (.A 114), (.A 226), .split, .split, (.D 5), (.A 230), .split, (.A 241), (.A 225), .split, .split, .split, (.A 454), (.A 974), .split, (.A 197), (.A 909), .split, .split, (.A 485), (.D 8), .split, (.A 225)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s070B_4 : wsegOk P 1 nb070 kN070 k070B_4 t070B_4 k070B_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070B_5 : List Tok := [(.A 129), .split, .split, .split, .split, (.A 114), .split, .split, (.A 98), (.A 876), (.A 97), .split, (.A 878), (.A 876), .split, .split, (.A 113), (.A 225), .split, (.D 9), (.A 224), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 173), (.A 237), (.A 909), (.A 877), (.A 237), (.A 909), (.A 877), (.A 1005), (.A 909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s070B_5 : wsegOk P 1 nb070 kN070 k070B_5 t070B_5 k070B_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070B_6 : List Tok := [(.A 877), (.A 1005), (.A 909), (.A 877), (.A 1005), (.A 909), (.A 876), .split, (.A 225), (.A 877), (.A 909), .split, (.A 876), (.A 845), .split, .split, (.A 225), (.A 161), .split, (.A 236), (.D 3), .split, .split, .split, .split, .split, (.D 10), .split, (.D 10), (.A 436), (.D 0)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s070B_6 : wsegOk P 1 nb070 kN070 k070B_6 t070B_6 k070B_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070B_7 : List Tok := [.split, .split, (.D 6), .split, (.A 436), (.D 6), (.D 0), .split, .split, .split, .split, (.D 4), (.A 436), (.D 4), (.D 0), .split, .split, .split, (.A 436), (.D 7), (.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), (.A 225), .split, (.D 0), .split, (.D 8), .split, (.A 225), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s070B_7 : wsegOk P 1 nb070 kN070 k070B_7 t070B_7 k070B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070B_8 : List Tok := [.split, .split, (.D 0), .split, .split, (.D 9), (.A 225), (.D 9), .split, (.D 0), .split, .split, (.A 225), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8), (.A 454), (.D 1), .split, .split, (.D 5), .split, (.A 454), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s070B_8 : wsegOk P 1 nb070 kN070 k070B_8 t070B_8 k070B_9 = true := by
  decide +kernel

end PackLean.D40.Tet
