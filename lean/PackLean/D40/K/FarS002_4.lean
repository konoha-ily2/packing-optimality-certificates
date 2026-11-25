-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey002

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t004A_60 : List Tok := [.split, .split, .split, .split, (.D 6), .split, (.A 32882), (.D 6), (.D 6), (.D 2), .split, .split, .split, .split, (.A 32882), (.D 7), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), .split, (.D 4), (.A 32909), .split, (.D 2), .split, (.D 10), .split, .split, (.D 10), (.A 32909), (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s004A_60 : wsegOk P 0 nb004 kN004 k004A_60 t004A_60 k004A_61 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t004A_61 : List Tok := [.split, .split, (.D 2), .split, .split, (.D 8), .split, (.D 8), (.A 32909), (.D 8), .split, (.D 2), .split, .split, .split, (.D 3), (.A 32909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s004A_61 : wsegOk P 0 nb004 kN004 k004A_61 t004A_61 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t004B_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), (.A 500), .split, (.A 178), (.A 436), .split, .split, (.A 70), (.A 454), .split, (.A 114), .split, (.A 438), .split, (.A 454), .split, (.A 114), .split, (.A 438), .split, (.A 502), .split, (.A 114), .split, (.A 438), .split, (.A 502), .split, (.A 114), .split, (.A 438), .split, (.A 246), (.A 118), .split, .split, .split, (.A 452)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s004B_0 : wsegOk P 1 nb004 kN004 (rRoots P.den) t004B_0 k004B_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t004B_1 : List Tok := [(.D 4), .split, (.A 436), (.A 437), .split, .split, (.A 454), (.A 910), .split, .split, (.A 388), .split, (.A 454), .split, .split, (.A 388), .split, (.A 390), .split, .split, (.A 388), .split, (.A 390), .split, .split, (.A 388), .split, (.A 390), .split, (.A 132), (.A 909), (.A 909), (.A 909), (.A 909), (.A 909), .split, .split, .split, .split, (.A 176)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s004B_1 : wsegOk P 1 nb004 kN004 k004B_1 t004B_1 k004B_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t004B_2 : List Tok := [(.A 436), .split, (.D 6), (.A 356), .split, .split, (.A 114), .split, (.A 372), (.A 112), .split, (.A 894), (.A 876), .split, .split, .split, (.A 436), (.A 957), .split, (.A 420), (.D 10), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, .split, .split, (.A 180), (.A 908), (.A 956), .split, (.A 140)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s004B_2 : wsegOk P 1 nb004 kN004 k004B_2 t004B_2 k004B_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t004B_3 : List Tok := [.split, (.A 108), (.A 940), (.A 909), (.A 940), (.A 909), (.A 940), (.A 909), (.A 940), (.A 909), (.A 876), (.A 909), .split, (.A 876), (.A 844), .split, .split, .split, .split, .split, (.A 66), (.A 454), .split, (.A 114), (.A 226), .split, .split, (.D 5), (.A 486), .split, (.A 241)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s004B_3 : wsegOk P 1 nb004 kN004 k004B_3 t004B_3 k004B_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t004B_4 : List Tok := [(.A 225), .split, .split, .split, (.A 454), (.A 974), .split, (.A 197), (.A 909), .split, .split, (.A 485), (.D 8), .split, (.A 225), (.A 129), .split, .split, .split, .split, (.A 114), .split, (.A 96), (.A 97), .split, (.A 878), (.A 876), .split, .split, (.A 113), (.A 225), .split, (.D 9), (.A 224), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 237), (.A 909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s004B_4 : wsegOk P 1 nb004 kN004 k004B_4 t004B_4 k004B_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t004B_5 : List Tok := [(.A 877), (.A 237), (.A 909), (.A 877), (.A 1005), (.A 909), (.A 877), (.A 1005), (.A 909), (.A 876), (.A 1005), (.A 909), .split, (.A 876), (.A 845), .split, .split, (.A 225), (.A 161), .split, (.A 236), (.D 3), .split, .split, .split, .split, .split, (.D 10), .split, (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s004B_5 : wsegOk P 1 nb004 kN004 k004B_5 t004B_5 k004B_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t004B_6 : List Tok := [(.A 436), (.D 0), .split, .split, (.D 6), .split, (.A 436), (.D 6), (.D 0), .split, .split, .split, .split, (.D 4), (.A 436), (.D 4), (.D 0), .split, .split, .split, (.A 436), (.D 7), (.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), (.A 225), .split, (.D 0), .split, (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s004B_6 : wsegOk P 1 nb004 kN004 k004B_6 t004B_6 k004B_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t004B_7 : List Tok := [.split, (.A 225), (.D 8), .split, .split, (.D 0), .split, .split, (.D 9), (.A 225), (.D 9), .split, (.D 0), .split, .split, (.A 225), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8), (.A 454), (.D 1), .split, .split, (.D 5), .split, (.A 454), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s004B_7 : wsegOk P 1 nb004 kN004 k004B_7 t004B_7 k004B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t004B_8 : List Tok := [(.D 4), (.D 1), .split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10), .split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), (.A 876), (.D 9), .split, (.D 1), .split, .split, (.A 876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s004B_8 : wsegOk P 1 nb004 kN004 k004B_8 t004B_8 k004B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t004B_9 : List Tok := [(.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), (.A 114), (.D 2), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), (.A 114), (.D 6), (.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s004B_9 : wsegOk P 1 nb004 kN004 k004B_9 t004B_9 k004B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t004B_10 : List Tok := [.split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2), .split, .split, (.A 909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s004B_10 : wsegOk P 1 nb004 kN004 k004B_10 t004B_10 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t005A_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22772), .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22706), .split, (.A 32948), .split, .split, (.A 180), (.A 180), (.A 180), .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22598)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s005A_0 : wsegOk P 0 nb005 kN005 (rRoots P.den) t005A_0 k005A_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t005A_1 : List Tok := [.split, .split, (.A 32966), (.A 198), .split, (.A 32966), (.A 198), .split, .split, .split, (.A 114), .split, (.A 32882), (.A 114), .split, (.A 114), (.A 32882), .split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), (.A 246), .split, .split, (.D 7), (.A 118), (.A 32950), .split, .split, .split, (.D 7), (.A 118), (.A 33014), .split, (.A 32886), .split, .split, .split, .split, (.A 32950)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s005A_1 : wsegOk P 0 nb005 kN005 k005A_1 t005A_1 k005A_2 = true := by
  decide +kernel

end PackLean.D40.Tet
