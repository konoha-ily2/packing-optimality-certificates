-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey000

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t000A_75 : List Tok := [.split, (.D 9), .split, (.A 32882), (.D 9), (.D 2), .split, .split, (.D 5), .split, .split, (.A 32882), (.D 5), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), .split, (.A 32882), (.D 6), (.D 6), (.D 2), .split, .split, .split, .split, (.A 32882), (.D 7), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s000A_75 : wsegOk P 0 nb000 kN000 k000A_75 t000A_75 k000A_76 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t000A_76 : List Tok := [.split, (.D 4), .split, (.D 4), .split, (.D 4), (.A 32909), .split, (.D 2), .split, (.D 10), .split, .split, (.D 10), (.A 32909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), .split, (.D 8), (.A 32909), (.D 8), .split, (.D 2), .split, .split, .split, (.D 3), (.A 32909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s000A_76 : wsegOk P 0 nb000 kN000 k000A_76 t000A_76 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t000B_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), (.A 500), .split, (.A 178), (.A 436), .split, .split, (.A 326), (.A 454), .split, (.A 114), .split, (.A 438), .split, (.A 454), .split, (.A 114), .split, (.A 438), .split, (.A 502), .split, (.A 114), .split, (.A 438), .split, (.A 502), .split, (.A 114), .split, (.A 438), .split, (.A 502), .split, (.A 114), (.L 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s000B_0 : wsegOk P 1 nb000 kN000 (rRoots P.den) t000B_0 k000B_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t000B_1 : List Tok := [.split, .split, .split, (.A 452), (.D 4), .split, (.A 436), (.A 437), .split, .split, (.A 454), (.A 910), .split, .split, (.A 388), .split, (.A 454), .split, .split, (.A 388), .split, (.A 390), .split, .split, (.A 388), .split, (.A 390), .split, .split, (.A 388), .split, (.A 390), .split, (.L 6), (.A 909), (.A 909), (.A 909), (.A 909), (.A 909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s000B_1 : wsegOk P 1 nb000 kN000 k000B_1 t000B_1 k000B_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t000B_2 : List Tok := [.split, .split, .split, .split, (.A 176), (.A 436), .split, (.D 6), (.A 356), .split, .split, (.A 114), .split, (.A 372), .split, .split, (.A 114), .split, (.A 372), .split, .split, (.A 114), .split, (.A 372), .split, .split, (.A 114), .split, (.A 372), .split, .split, (.A 114), (.L 6), (.A 124), (.A 892), (.A 892), (.A 876), .split, (.A 894), (.A 876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s000B_2 : wsegOk P 1 nb000 kN000 k000B_2 t000B_2 k000B_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t000B_3 : List Tok := [.split, .split, .split, (.A 436), (.A 957), .split, (.A 420), (.D 10), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, (.L 6), (.A 909), (.A 940), (.A 909), (.A 940), (.A 909), (.A 940), (.A 909), (.A 876), (.A 909), .split, (.A 876), (.A 844)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s000B_3 : wsegOk P 1 nb000 kN000 k000B_3 t000B_3 k000B_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t000B_4 : List Tok := [.split, .split, .split, .split, .split, (.A 66), (.A 454), .split, (.A 114), (.A 226), .split, .split, (.D 5), (.A 486), .split, (.A 241), (.A 225), .split, .split, .split, (.A 454), (.A 974), .split, (.A 197), (.A 909), .split, .split, (.A 485), (.D 8), .split, (.A 225), (.A 129), .split, .split, .split, .split, (.A 114), .split, .split, (.A 98), (.A 876), (.A 97)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s000B_4 : wsegOk P 1 nb000 kN000 k000B_4 t000B_4 k000B_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t000B_5 : List Tok := [.split, (.A 878), (.A 876), .split, .split, (.A 113), (.A 225), .split, (.D 9), (.A 224), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.L 6), (.A 909), (.A 877), (.A 1005), (.A 909), (.A 877), (.A 1005), (.A 909), (.A 877), (.A 1005), (.A 909), (.A 876), (.A 1005), (.A 909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s000B_5 : wsegOk P 1 nb000 kN000 k000B_5 t000B_5 k000B_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t000B_6 : List Tok := [.split, (.A 876), (.A 845), .split, .split, (.A 225), (.A 161), .split, (.A 1004), (.D 3), .split, .split, .split, .split, .split, (.D 10), .split, (.D 10), (.A 436), (.D 0), .split, .split, (.D 6), .split, (.A 436), (.D 6), (.D 0), .split, .split, .split, .split, (.D 4), (.A 436), (.D 4), (.D 0), .split, .split, .split, (.A 436), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s000B_6 : wsegOk P 1 nb000 kN000 k000B_6 t000B_6 k000B_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t000B_7 : List Tok := [(.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), (.A 225), .split, (.D 0), .split, (.D 8), .split, (.A 225), (.D 8), .split, .split, (.D 0), .split, .split, (.D 9), (.A 225), (.D 9), .split, (.D 0), .split, .split, (.A 225), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s000B_7 : wsegOk P 1 nb000 kN000 k000B_7 t000B_7 k000B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t000B_8 : List Tok := [(.A 454), (.D 1), .split, .split, (.D 5), .split, (.A 454), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s000B_8 : wsegOk P 1 nb000 kN000 k000B_8 t000B_8 k000B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t000B_9 : List Tok := [.split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), (.A 876), (.D 9), .split, (.D 1), .split, .split, (.A 876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), (.A 114), (.D 2), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), (.A 114)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s000B_9 : wsegOk P 1 nb000 kN000 k000B_9 t000B_9 k000B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t000B_10 : List Tok := [(.D 6), (.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2), .split, .split, (.A 909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s000B_10 : wsegOk P 1 nb000 kN000 k000B_10 t000B_10 k000B_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t000B_11 : List Tok := [(.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s000B_11 : wsegOk P 1 nb000 kN000 k000B_11 t000B_11 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t001A_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22772), .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22706), .split, (.A 32948), .split, .split, (.A 180), .split, (.A 32948), (.A 180), (.A 180), .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s001A_0 : wsegOk P 0 nb001 kN001 (rRoots P.den) t001A_0 k001A_1 = true := by
  decide +kernel

end PackLean.D40.Tet
