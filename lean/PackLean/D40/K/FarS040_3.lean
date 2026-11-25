-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey040

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t124A_45 : List Tok := [.split, .split, (.D 5), .split, .split, (.A 32882), (.D 5), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), .split, (.A 32882), (.D 6), (.D 6), (.D 2), .split, .split, .split, .split, (.A 32882), (.D 7), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), .split, (.D 4), (.A 32909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s124A_45 : wsegOk P 0 nb124 kN124 k124A_45 t124A_45 k124A_46 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t124A_46 : List Tok := [.split, (.D 2), .split, (.D 10), .split, .split, (.D 10), (.A 32909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), .split, (.D 8), (.A 32909), (.D 8), .split, (.D 2), .split, .split, .split, (.D 3), (.A 32909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s124A_46 : wsegOk P 0 nb124 kN124 k124A_46 t124A_46 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t124B_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), (.A 500), .split, (.A 178), (.A 436), .split, .split, (.A 70), (.A 454), .split, (.A 114), .split, (.A 438), .split, (.A 454), .split, (.A 114), .split, (.A 438), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), (.A 118), .split, .split, .split, (.A 452)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s124B_0 : wsegOk P 1 nb124 kN124 (rRoots P.den) t124B_0 k124B_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t124B_1 : List Tok := [(.D 4), .split, (.A 436), (.A 949), .split, .split, (.A 454), (.A 910), .split, .split, (.A 388), .split, (.A 454), .split, .split, (.A 388), .split, (.A 390), .split, .split, .split, (.A 902), (.A 900), .split, (.A 902), .split, .split, .split, (.A 902), (.A 900), .split, (.A 902), .split, .split, .split, (.A 902), (.A 900), .split, (.A 134), .split, .split, (.A 900), (.A 133)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s124B_1 : wsegOk P 1 nb124 kN124 k124B_1 t124B_1 k124B_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t124B_2 : List Tok := [(.A 909), (.A 909), (.A 909), (.A 909), (.A 909), (.A 909), .split, .split, .split, .split, (.A 176), (.A 436), .split, (.D 6), .split, (.D 6), (.A 876), .split, .split, (.A 114), (.A 884), .split, (.A 894), (.A 876), .split, .split, (.A 948), .split, (.A 932), (.D 10), .split, .split, (.A 940), (.A 909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s124B_2 : wsegOk P 1 nb124 kN124 k124B_2 t124B_2 k124B_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t124B_3 : List Tok := [.split, (.A 876), (.A 844), .split, .split, .split, .split, (.A 198), .split, (.A 114), (.A 226), .split, .split, (.D 5), (.A 230), .split, (.A 241), (.A 225), .split, .split, .split, (.A 454), (.A 974), .split, (.A 197), (.A 909), .split, .split, (.A 485), (.D 8), .split, (.A 225), (.A 129), .split, .split, .split, .split, (.A 114), .split, (.A 96), (.A 97)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s124B_3 : wsegOk P 1 nb124 kN124 k124B_3 t124B_3 k124B_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t124B_4 : List Tok := [.split, (.A 878), (.A 876), .split, .split, (.A 113), (.A 225), .split, (.D 9), (.A 992), .split, .split, .split, .split, .split, (.A 941), (.A 876), .split, (.A 225), (.A 877), (.A 909), .split, (.A 876), (.A 845), .split, .split, (.A 225), (.A 161), .split, (.A 236), (.D 3), .split, .split, .split, .split, .split, (.D 10), .split, (.D 10), (.A 436)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s124B_4 : wsegOk P 1 nb124 kN124 k124B_4 t124B_4 k124B_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t124B_5 : List Tok := [(.D 0), .split, .split, (.D 6), .split, (.A 436), (.D 6), (.D 0), .split, .split, .split, .split, (.D 4), (.A 436), (.D 4), (.D 0), .split, .split, .split, (.A 436), (.D 7), (.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), (.A 225), .split, (.D 0), .split, (.D 8), .split, (.A 225)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s124B_5 : wsegOk P 1 nb124 kN124 k124B_5 t124B_5 k124B_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t124B_6 : List Tok := [(.D 8), .split, .split, (.D 0), .split, (.A 737), (.D 9), .split, (.D 0), .split, .split, (.A 225), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8), (.A 454), (.D 1), .split, .split, (.D 5), .split, (.A 454), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s124B_6 : wsegOk P 1 nb124 kN124 k124B_6 t124B_6 k124B_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t124B_7 : List Tok := [.split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10), .split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), (.A 876), (.D 9), .split, (.D 1), .split, (.A 620), (.D 3), .split, .split, .split, .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s124B_7 : wsegOk P 1 nb124 kN124 k124B_7 t124B_7 k124B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t124B_8 : List Tok := [(.A 882), (.D 2), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), (.A 114), (.D 6), (.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s124B_8 : wsegOk P 1 nb124 kN124 k124B_8 t124B_8 k124B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t124B_9 : List Tok := [.split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2), .split, .split, (.A 909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s124B_9 : wsegOk P 1 nb124 kN124 k124B_9 t124B_9 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t125A_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22772), .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22706), .split, (.A 32948), .split, .split, (.A 180), .split, (.A 32948), (.A 180), (.A 180), .split, .split, .split, (.D 7), .split, (.D 7), (.A 114)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s125A_0 : wsegOk P 0 nb125 kN125 (rRoots P.den) t125A_0 k125A_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t125A_1 : List Tok := [.split, .split, (.A 32966), .split, (.A 198), (.A 198), (.A 198), .split, .split, .split, (.A 114), .split, (.A 32882), (.A 114), (.A 114), .split, .split, .split, .split, (.A 182), .split, (.A 246), .split, (.A 32886), .split, (.A 182), (.A 246), .split, .split, .split, .split, (.A 32950), (.A 33014), (.A 182), (.A 180), .split, (.A 198), (.A 182), .split, .split, .split, (.A 182)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s125A_1 : wsegOk P 0 nb125 kN125 k125A_1 t125A_1 k125A_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t125A_2 : List Tok := [.split, .split, (.A 182), (.A 32886), (.A 180), .split, .split, (.A 32886), .split, (.A 32950), (.A 118), .split, (.A 114), .split, .split, (.A 182), (.A 116), (.A 118), (.A 180), .split, .split, .split, .split, (.A 246), (.A 118), (.A 246), (.A 198), .split, (.A 114), .split, .split, .split, .split, (.A 182), .split, (.A 246), (.A 118), (.A 182)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s125A_2 : wsegOk P 0 nb125 kN125 k125A_2 t125A_2 k125A_3 = true := by
  decide +kernel

end PackLean.D40.Tet
