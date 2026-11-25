-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey052

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180B_11 : List Tok := [.split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10), .split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), .split, (.D 9), (.A 32876), (.D 9), .split, (.D 1), .split, .split, (.A 620), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), .split, (.A 32882), (.D 9), (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180B_11 : wsegOk P 1 nb180 kN180 k180B_11 t180B_11 k180B_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180B_12 : List Tok := [.split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), .split, (.A 32882), (.D 6), (.D 6), (.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180B_12 : wsegOk P 1 nb180 kN180 k180B_12 t180B_12 k180B_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180B_13 : List Tok := [(.D 10), .split, .split, (.D 2), .split, .split, (.D 8), .split, (.D 8), (.A 32909), (.D 8), .split, (.D 2), .split, .split, (.A 909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s180B_13 : wsegOk P 1 nb180 kN180 k180B_13 t180B_13 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t181A_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 500), .split, (.A 178), .split, (.A 32948), .split, .split, (.A 180), .split, (.A 32948), .split, .split, .split, (.D 7), (.A 180), (.A 32948), (.A 32948), (.A 180), .split, .split, .split, (.D 7), (.A 70), .split, .split, (.A 32966)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s181A_0 : wsegOk P 0 nb181 kN181 (rRoots P.den) t181A_0 k181A_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t181A_1 : List Tok := [.split, (.A 198), .split, .split, (.A 32966), (.A 454), (.A 32966), (.A 198), .split, (.A 114), .split, .split, .split, .split, (.A 182), .split, (.A 246), (.A 118), .split, .split, .split, (.A 246), (.A 438), (.A 180), .split, (.A 198), (.A 182), .split, .split, (.A 182), (.A 118), (.A 180), .split, (.A 198), .split, (.A 114), .split, (.A 182)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s181A_1 : wsegOk P 0 nb181 kN181 k181A_1 t181A_1 k181A_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t181A_2 : List Tok := [.split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), (.A 118), .split, .split, .split, .split, (.D 4), .split, (.D 4), (.A 388), (.D 4), .split, (.A 436), (.A 437), .split, .split, (.A 454), (.A 398), .split, .split, .split, .split, .split, (.A 388), .split, (.A 454), .split, .split, (.A 390), (.A 134)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s181A_2 : wsegOk P 0 nb181 kN181 k181A_2 t181A_2 k181A_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t181A_3 : List Tok := [(.A 390), (.A 388), .split, .split, (.A 32948), .split, (.A 132), (.A 180), (.A 388), .split, .split, .split, .split, (.A 32966), (.A 134), (.A 198), (.A 389), .split, .split, (.A 132), .split, (.A 134), .split, .split, (.A 132), (.A 133), (.A 141), (.A 141), .split, .split, (.A 397), (.A 909), .split, (.A 397), (.A 32909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s181A_3 : wsegOk P 0 nb181 kN181 k181A_3 t181A_3 k181A_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t181A_4 : List Tok := [.split, .split, .split, .split, .split, (.D 6), .split, .split, (.D 6), .split, (.D 6), .split, (.A 114), (.D 6), (.D 6), (.A 948), .split, (.D 6), .split, (.D 6), (.A 876), .split, .split, .split, .split, (.A 114), (.A 882), (.A 114), .split, .split, .split, (.A 116), .split, (.A 32948), (.A 180), (.A 884), .split, .split, (.A 114), .split, .split, .split, (.A 116), (.A 180)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s181A_4 : wsegOk P 0 nb181 kN181 k181A_4 t181A_4 k181A_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t181A_5 : List Tok := [(.A 124), (.A 112), (.A 876), (.A 876), .split, .split, (.A 948), .split, (.A 932), (.D 10), .split, .split, .split, (.A 956), .split, .split, .split, .split, (.A 188), .split, .split, (.A 956), .split, (.A 188), (.A 940), (.A 908), .split, .split, .split, (.A 188), (.A 172), (.A 141), (.A 172), (.A 909), .split, .split, (.A 876), .split, .split, (.A 876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s181A_5 : wsegOk P 0 nb181 kN181 k181A_5 t181A_5 k181A_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t181A_6 : List Tok := [.split, (.A 876), .split, .split, (.A 876), (.A 940), (.A 32876), (.A 32876), (.A 940), (.A 909), .split, (.A 876), .split, (.D 10), .split, .split, (.A 844), (.D 10), (.D 10), .split, .split, .split, .split, .split, .split, (.A 66), (.D 5), (.A 198), .split, .split, (.A 114), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.A 114)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s181A_6 : wsegOk P 0 nb181 kN181 k181A_6 t181A_6 k181A_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t181A_7 : List Tok := [.split, .split, (.A 198), (.A 242), (.A 226), .split, .split, (.D 5), .split, .split, (.D 5), (.A 226), (.D 5), .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 241), (.D 5), (.D 5), .split, (.A 225), (.A 32993), .split, .split, .split, (.A 454), .split, .split, (.D 8), (.A 397), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s181A_7 : wsegOk P 0 nb181 kN181 k181A_7 t181A_7 k181A_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t181A_8 : List Tok := [.split, .split, .split, .split, (.A 198), .split, (.A 453), (.A 197), .split, (.A 193), (.A 141), (.A 193), .split, .split, (.A 397), (.A 32909), .split, .split, .split, (.A 141), (.D 8), (.D 8), (.A 141), .split, .split, (.A 485), (.D 8), .split, (.A 225), .split, .split, (.D 8), (.A 141), (.D 8), .split, .split, .split, .split, .split, (.A 114), .split, (.A 114)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s181A_8 : wsegOk P 0 nb181 kN181 k181A_8 t181A_8 k181A_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t181A_9 : List Tok := [.split, (.D 9), .split, (.A 114), (.D 9), .split, .split, (.A 98), (.A 108), (.A 97), .split, .split, (.A 878), (.D 9), .split, (.A 876), (.A 620), .split, .split, .split, .split, .split, (.D 9), .split, (.A 113), (.D 9), (.D 9), (.D 9), .split, .split, (.A 225), .split, .split, (.A 97), (.D 9), (.A 225), (.A 32993)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s181A_9 : wsegOk P 0 nb181 kN181 k181A_9 t181A_9 k181A_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t181A_10 : List Tok := [.split, (.D 9), .split, .split, .split, (.D 9), .split, (.A 108), (.D 9), (.D 9), (.D 9), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 173), .split, (.A 108), (.A 173), (.A 237), (.A 141), .split, (.A 108), (.A 173), .split, (.A 237), (.A 109), (.A 141), .split, (.A 108), .split, .split, (.A 173), .split, .split, (.A 876), .split, (.A 108)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s181A_10 : wsegOk P 0 nb181 kN181 k181A_10 t181A_10 k181A_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t181A_11 : List Tok := [(.A 32876), .split, (.A 941), .split, (.A 32941), (.A 32877), .split, (.A 173), (.A 109), .split, (.A 225), (.A 109), .split, .split, (.A 32909), .split, .split, (.A 32909), (.A 141), (.A 32909), (.A 141), .split, .split, .split, .split, (.A 32876), .split, (.A 32876), (.A 108), (.A 32876), (.A 108), .split, .split, .split, .split, (.A 845), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s181A_11 : wsegOk P 0 nb181 kN181 k181A_11 t181A_11 k181A_12 = true := by
  decide +kernel

end PackLean.D40.Tet
