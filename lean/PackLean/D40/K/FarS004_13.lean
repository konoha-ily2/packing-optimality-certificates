-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey004

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012A_55 : List Tok := [.split, (.D 9), (.A 32876), (.D 9), .split, (.D 1), .split, .split, .split, (.D 3), (.A 32876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), .split, (.A 32882), (.D 9), (.D 2), .split, .split, (.D 5), .split, .split, (.A 32882), (.D 5), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), .split, (.A 32882)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s012A_55 : wsegOk P 0 nb012 kN012 k012A_55 t012A_55 k012A_56 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012A_56 : List Tok := [(.D 6), (.D 6), (.D 2), .split, .split, .split, .split, (.A 32882), (.D 7), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), .split, (.D 4), (.A 32909), .split, (.D 2), .split, (.D 10), .split, .split, (.D 10), (.A 32909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s012A_56 : wsegOk P 0 nb012 kN012 k012A_56 t012A_56 k012A_57 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012A_57 : List Tok := [.split, (.D 8), (.A 32909), (.D 8), .split, (.D 2), .split, .split, .split, (.D 3), (.A 32909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s012A_57 : wsegOk P 0 nb012 kN012 k012A_57 t012A_57 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012B_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), (.A 500), .split, (.A 178), (.A 436), .split, .split, (.A 326), (.A 454), .split, (.A 114), .split, (.A 438), .split, (.A 454), .split, (.A 114), .split, (.A 438), .split, (.A 502), .split, (.A 114), .split, (.A 438), .split, (.A 502), .split, (.A 114), .split, (.A 438), .split, (.A 246), .split, (.A 114), .split, (.A 182)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s012B_0 : wsegOk P 1 nb012 kN012 (rRoots P.den) t012B_0 k012B_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012B_1 : List Tok := [.split, (.A 246), (.A 118), .split, .split, .split, (.A 452), (.D 4), .split, (.A 436), (.A 437), .split, .split, (.A 454), (.A 910), .split, .split, (.A 388), .split, (.A 454), .split, .split, (.A 388), .split, (.A 390), .split, .split, (.A 388), .split, (.A 390), .split, .split, (.A 388), .split, (.A 390), .split, .split, .split, (.A 390), (.A 900), .split, (.A 134), .split, .split, .split, (.A 134)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s012B_1 : wsegOk P 1 nb012 kN012 k012B_1 t012B_1 k012B_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012B_2 : List Tok := [.split, (.A 180), (.A 900), .split, (.A 134), .split, (.A 132), (.A 909), (.A 909), (.A 909), (.A 909), (.A 909), (.A 909), (.A 909), .split, .split, .split, .split, (.A 176), (.A 436), .split, (.D 6), (.A 356), .split, .split, (.A 114), .split, (.A 372), .split, .split, (.A 114), .split, (.A 372), (.A 112)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s012B_2 : wsegOk P 1 nb012 kN012 k012B_2 t012B_2 k012B_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012B_3 : List Tok := [(.A 876), .split, (.A 894), (.A 876), .split, .split, .split, (.A 436), (.A 957), .split, (.A 420), (.D 10), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, .split, (.A 140), (.A 909), (.A 940), (.A 909), (.A 940), (.A 909), (.A 940)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s012B_3 : wsegOk P 1 nb012 kN012 k012B_3 t012B_3 k012B_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012B_4 : List Tok := [(.A 909), (.A 940), (.A 909), (.A 940), (.A 909), (.A 876), (.A 909), .split, (.A 876), (.A 844), .split, .split, .split, .split, .split, (.A 66), (.A 454), .split, (.A 114), (.A 226), .split, .split, (.D 5), (.A 486), .split, (.A 241), (.A 225), .split, .split, .split, (.A 454), (.A 974), .split, (.A 197)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s012B_4 : wsegOk P 1 nb012 kN012 k012B_4 t012B_4 k012B_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012B_5 : List Tok := [(.A 909), .split, .split, (.A 485), (.D 8), .split, (.A 225), (.A 129), .split, .split, .split, .split, (.A 114), .split, .split, (.A 98), (.A 876), (.A 97), .split, (.A 878), (.A 876), .split, .split, (.A 113), (.A 225), .split, (.D 9), (.A 224), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 173), (.A 877), (.A 237), (.A 909), (.A 877)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s012B_5 : wsegOk P 1 nb012 kN012 k012B_5 t012B_5 k012B_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012B_6 : List Tok := [(.A 1005), (.A 909), (.A 877), (.A 1005), (.A 909), (.A 877), (.A 1005), (.A 909), (.A 877), (.A 1005), (.A 909), (.A 876), (.A 1005), (.A 909), .split, (.A 876), (.A 845), .split, .split, (.A 225), (.A 161), .split, (.A 1004), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s012B_6 : wsegOk P 1 nb012 kN012 k012B_6 t012B_6 k012B_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012B_7 : List Tok := [.split, .split, .split, .split, .split, (.D 10), .split, (.D 10), (.A 436), (.D 0), .split, .split, (.D 6), .split, (.A 436), (.D 6), (.D 0), .split, .split, .split, .split, (.D 4), (.A 436), (.D 4), (.D 0), .split, .split, .split, (.A 436), (.D 7), (.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), (.A 225)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s012B_7 : wsegOk P 1 nb012 kN012 k012B_7 t012B_7 k012B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012B_8 : List Tok := [.split, (.D 0), .split, (.D 8), .split, (.A 225), (.D 8), .split, .split, (.D 0), .split, .split, (.D 9), (.A 225), (.D 9), .split, (.D 0), .split, .split, (.A 225), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8), (.A 454), (.D 1), .split, .split, (.D 5), .split, (.A 454), (.D 5), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s012B_8 : wsegOk P 1 nb012 kN012 k012B_8 t012B_8 k012B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012B_9 : List Tok := [.split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10), .split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), (.A 876), (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s012B_9 : wsegOk P 1 nb012 kN012 k012B_9 t012B_9 k012B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012B_10 : List Tok := [.split, (.D 1), .split, .split, (.A 876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), (.A 114), (.D 2), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), (.A 114), (.D 6), (.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7), (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s012B_10 : wsegOk P 1 nb012 kN012 k012B_10 t012B_10 k012B_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012B_11 : List Tok := [.split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2), .split, .split, (.A 909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s012B_11 : wsegOk P 1 nb012 kN012 k012B_11 t012B_11 [] = true := by
  decide +kernel

end PackLean.D40.Tet
