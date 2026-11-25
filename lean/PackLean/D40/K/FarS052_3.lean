-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey052

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180A_14 : List Tok := [.split, .split, (.A 32966), (.D 5), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, .split, (.A 32966), (.D 7), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10), .split, (.A 876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180A_14 : wsegOk P 0 nb180 kN180 k180A_14 t180A_14 k180A_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180A_15 : List Tok := [(.D 10), .split, .split, (.D 1), .split, .split, (.D 9), .split, (.D 9), (.A 32876), (.D 9), .split, (.D 1), .split, .split, (.A 620), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), .split, (.A 32882), (.D 9), (.D 2), .split, .split, (.D 5), .split, .split, (.A 32882), (.D 5), (.D 5), (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180A_15 : wsegOk P 0 nb180 kN180 k180A_15 t180A_15 k180A_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180A_16 : List Tok := [.split, .split, .split, .split, (.D 6), .split, (.A 32882), (.D 6), (.D 6), (.D 2), .split, .split, (.A 114), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), .split, (.D 4), (.A 32909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), .split, (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180A_16 : wsegOk P 0 nb180 kN180 k180A_16 t180A_16 k180A_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180A_17 : List Tok := [(.A 32909), (.D 8), .split, (.D 2), .split, .split, .split, (.D 3), (.A 32909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180A_17 : wsegOk P 0 nb180 kN180 k180A_17 t180A_17 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180B_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 500), .split, (.A 178), .split, (.A 32948), .split, .split, (.A 180), (.A 436), (.A 436), .split, .split, (.A 70), .split, .split, (.A 32966), .split, (.A 198), (.A 454), .split, (.A 32966), (.A 198), .split, (.A 114), .split, .split, .split, (.A 246), (.A 438), (.A 180)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180B_0 : wsegOk P 1 nb180 kN180 (rRoots P.den) t180B_0 k180B_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180B_1 : List Tok := [.split, (.A 198), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), (.A 118), .split, .split, .split, (.A 452), (.D 4), .split, (.A 436), (.A 437), .split, .split, (.A 454), (.A 398), .split, .split, .split, (.A 388), (.A 436), .split, .split, (.A 454)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180B_1 : wsegOk P 1 nb180 kN180 k180B_1 t180B_1 k180B_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180B_2 : List Tok := [(.A 389), .split, .split, (.A 132), .split, (.A 134), .split, .split, (.A 132), .split, (.A 134), .split, (.A 132), (.A 141), (.A 141), (.A 909), (.A 909), .split, .split, .split, .split, .split, (.D 6), .split, .split, (.D 6), (.A 176), (.D 6), .split, (.A 32948), (.A 948), .split, (.D 6), .split, (.D 6), (.A 876), .split, .split, (.A 114)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180B_2 : wsegOk P 1 nb180 kN180 k180B_2 t180B_2 k180B_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180B_3 : List Tok := [.split, .split, (.A 180), (.A 884), .split, .split, (.A 114), (.A 124), (.A 876), (.A 876), .split, .split, (.A 948), (.A 932), .split, .split, .split, (.A 956), .split, .split, .split, .split, .split, .split, (.A 948), (.A 180), (.A 908), (.A 956), .split, .split, .split, (.A 188), (.A 172), (.A 141), .split, .split, .split, .split, (.A 108), (.A 940), (.A 876), (.A 108)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180B_3 : wsegOk P 1 nb180 kN180 k180B_3 t180B_3 k180B_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180B_4 : List Tok := [(.A 940), (.A 909), .split, (.A 876), (.A 940), (.A 909), .split, (.A 876), (.A 844), .split, .split, .split, .split, .split, .split, (.A 66), (.D 5), (.A 198), .split, (.A 114), .split, (.A 242), (.A 226), .split, .split, (.D 5), .split, (.A 198), (.D 5), .split, .split, .split, (.D 5), .split, (.D 5), (.A 241), (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180B_4 : wsegOk P 1 nb180 kN180 k180B_4 t180B_4 k180B_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180B_5 : List Tok := [(.A 225), .split, .split, .split, (.A 454), .split, .split, (.D 8), (.A 397), (.D 8), .split, .split, .split, .split, (.A 198), (.A 453), .split, (.A 193), (.A 141), (.A 193), .split, .split, .split, (.A 397), (.A 32909), (.A 32909), (.A 141), .split, .split, (.A 485), (.D 8), .split, (.A 225), .split, (.A 141), (.D 8), .split, .split, .split, .split, .split, (.A 114)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180B_5 : wsegOk P 1 nb180 kN180 k180B_5 t180B_5 k180B_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180B_6 : List Tok := [(.A 114), .split, .split, (.A 98), (.A 108), (.A 97), .split, .split, (.A 878), (.D 9), (.A 876), .split, .split, .split, .split, .split, (.D 9), (.A 113), (.D 9), (.D 9), .split, .split, (.A 225), .split, .split, (.A 97), (.D 9), (.A 225), (.A 32993), .split, (.D 9), .split, .split, .split, (.D 9), (.A 224), (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180B_6 : wsegOk P 1 nb180 kN180 k180B_6 t180B_6 k180B_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180B_7 : List Tok := [(.D 9), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 173), (.A 237), (.A 141), .split, (.A 108), (.A 173), (.A 237), (.A 141), .split, .split, (.A 876), (.A 108), .split, (.A 941), .split, (.A 173), (.A 877), .split, (.A 225), (.A 109), .split, (.A 909), (.A 141), .split, .split, (.A 876), .split, (.A 108), (.A 32876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180B_7 : wsegOk P 1 nb180 kN180 k180B_7 t180B_7 k180B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180B_8 : List Tok := [.split, (.A 845), (.D 3), .split, .split, (.A 225), (.A 161), .split, .split, (.A 108), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 10), .split, (.D 10), .split, (.A 32948), (.D 10), (.D 0), .split, .split, (.D 6), .split, (.A 436), (.D 6), (.D 0), .split, .split, .split, .split, (.D 4), (.A 436), (.D 4), (.D 0)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180B_8 : wsegOk P 1 nb180 kN180 k180B_8 t180B_8 k180B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180B_9 : List Tok := [.split, .split, .split, (.A 436), (.D 7), (.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), .split, (.D 5), (.A 32993), .split, (.D 0), .split, (.D 8), .split, .split, (.D 8), (.A 32993), (.D 8), .split, .split, (.D 0), .split, (.A 737), (.D 9), .split, (.D 0), .split, .split, (.A 225), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180B_9 : wsegOk P 1 nb180 kN180 k180B_9 t180B_9 k180B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180B_10 : List Tok := [(.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8), (.A 454), (.D 1), .split, .split, (.D 5), .split, .split, (.A 32966), (.D 5), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180B_10 : wsegOk P 1 nb180 kN180 k180B_10 t180B_10 k180B_11 = true := by
  decide +kernel

end PackLean.D40.Tet
