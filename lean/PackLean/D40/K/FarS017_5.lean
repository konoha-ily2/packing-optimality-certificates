-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey017

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051A_30 : List Tok := [(.D 6), (.D 6), (.D 0), .split, .split, .split, .split, (.D 4), (.A 436), (.D 4), (.D 0), .split, .split, .split, .split, (.A 32948), (.D 7), (.D 7), (.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), .split, (.D 5), (.A 32993), .split, (.D 0), .split, (.D 8), .split, .split, (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051A_30 : wsegOk P 0 nb051 kN051 k051A_30 t051A_30 k051A_31 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051A_31 : List Tok := [(.A 32993), (.D 8), .split, .split, (.D 0), .split, .split, (.D 9), .split, (.D 9), (.A 32993), (.D 9), .split, (.D 0), .split, .split, .split, (.D 3), (.A 32993), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8), .split, (.A 32966), (.D 8), (.D 1), .split, .split, (.D 5), .split, .split, (.A 32966), (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051A_31 : wsegOk P 0 nb051 kN051 k051A_31 t051A_31 k051A_32 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051A_32 : List Tok := [(.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, .split, (.A 32966), (.D 7), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), .split, (.D 6), (.A 32876), .split, (.D 1), .split, (.D 10), .split, .split, (.D 10), (.A 32876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051A_32 : wsegOk P 0 nb051 kN051 k051A_32 t051A_32 k051A_33 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051A_33 : List Tok := [(.D 10), .split, .split, (.D 1), .split, .split, (.D 9), .split, (.D 9), (.A 32876), (.D 9), .split, (.D 1), .split, .split, .split, (.D 3), (.A 32876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), .split, (.A 32882), (.D 9), (.D 2), .split, .split, (.D 5), .split, .split, (.A 32882), (.D 5), (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051A_33 : wsegOk P 0 nb051 kN051 k051A_33 t051A_33 k051A_34 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051A_34 : List Tok := [(.D 2), .split, .split, .split, .split, (.D 6), .split, (.A 32882), (.D 6), (.D 6), (.D 2), .split, .split, .split, .split, (.A 32882), (.D 7), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), .split, (.D 4), (.A 32909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051A_34 : wsegOk P 0 nb051 kN051 k051A_34 t051A_34 k051A_35 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051A_35 : List Tok := [.split, .split, (.D 2), .split, .split, (.D 8), .split, (.D 8), (.A 32909), (.D 8), .split, (.D 2), .split, .split, .split, (.D 3), (.A 32909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051A_35 : wsegOk P 0 nb051 kN051 k051A_35 t051A_35 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051B_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), (.A 500), .split, (.A 178), (.A 436), .split, .split, (.A 70), (.A 454), .split, (.A 114), .split, (.A 438), .split, .split, (.A 246), (.A 454), .split, (.A 114), .split, (.A 438), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), (.A 118)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051B_0 : wsegOk P 1 nb051 kN051 (rRoots P.den) t051B_0 k051B_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051B_1 : List Tok := [.split, .split, .split, (.A 452), (.D 4), .split, (.A 436), (.A 437), .split, .split, (.A 454), (.A 398), .split, .split, (.A 388), .split, (.A 454), .split, .split, (.A 388), .split, (.A 390), .split, .split, .split, (.A 390), .split, (.A 436), (.A 388), .split, .split, (.A 198), (.A 389), .split, (.A 132), (.A 909), (.A 909), (.A 909), (.A 909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051B_1 : wsegOk P 1 nb051 kN051 k051B_1 t051B_1 k051B_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051B_2 : List Tok := [.split, .split, .split, .split, (.A 176), (.A 436), .split, (.D 6), .split, (.D 6), (.A 876), .split, .split, (.A 114), .split, (.A 884), (.A 112), .split, (.A 894), (.A 876), .split, .split, .split, (.A 436), (.A 957), .split, (.A 932), (.D 10), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, (.A 140), (.A 909), (.A 940)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051B_2 : wsegOk P 1 nb051 kN051 k051B_2 t051B_2 k051B_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051B_3 : List Tok := [(.A 909), (.A 940), (.A 909), (.A 876), (.A 909), .split, (.A 876), (.A 844), .split, .split, .split, .split, .split, (.A 66), (.A 454), .split, (.A 114), (.A 226), .split, .split, (.D 5), (.A 486), .split, (.A 241), (.A 225), .split, .split, .split, (.A 454), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.A 197)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051B_3 : wsegOk P 1 nb051 kN051 k051B_3 t051B_3 k051B_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051B_4 : List Tok := [(.A 909), .split, .split, (.A 485), (.D 8), .split, (.A 225), (.A 129), .split, .split, .split, .split, (.A 114), .split, (.A 96), (.A 97), .split, (.A 878), (.A 876), .split, .split, (.A 113), (.A 225), .split, (.D 9), (.A 224), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 173), (.A 237), (.A 909), (.A 877), (.A 237), (.A 909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051B_4 : wsegOk P 1 nb051 kN051 k051B_4 t051B_4 k051B_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051B_5 : List Tok := [(.A 876), .split, (.A 225), (.A 877), (.A 909), .split, (.A 876), (.A 845), .split, .split, (.A 225), (.A 161), .split, (.A 236), (.D 3), .split, .split, .split, .split, .split, (.D 10), .split, (.D 10), (.A 436), (.D 0), .split, .split, (.D 6), .split, (.A 436), (.D 6), (.D 0), .split, .split, .split, .split, (.D 4), (.A 436)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051B_5 : wsegOk P 1 nb051 kN051 k051B_5 t051B_5 k051B_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051B_6 : List Tok := [(.D 4), (.D 0), .split, .split, .split, (.A 436), (.D 7), (.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), (.A 225), .split, (.D 0), .split, (.D 8), .split, (.A 225), (.D 8), .split, .split, (.D 0), .split, .split, (.D 9), (.A 225), (.D 9), .split, (.D 0), .split, .split, (.A 225)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051B_6 : wsegOk P 1 nb051 kN051 k051B_6 t051B_6 k051B_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051B_7 : List Tok := [(.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8), (.A 454), (.D 1), .split, .split, (.D 5), .split, (.A 454), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051B_7 : wsegOk P 1 nb051 kN051 k051B_7 t051B_7 k051B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051B_8 : List Tok := [.split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10), .split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), (.A 876), (.D 9), .split, (.D 1), .split, .split, (.A 876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), (.A 114), (.D 2), .split, .split, (.D 5), .split, (.A 114)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051B_8 : wsegOk P 1 nb051 kN051 k051B_8 t051B_8 k051B_9 = true := by
  decide +kernel

end PackLean.D40.Tet
