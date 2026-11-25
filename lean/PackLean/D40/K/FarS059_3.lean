-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey059

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210A_12 : List Tok := [.split, (.D 0), .split, (.D 8), .split, .split, (.D 8), (.A 32993), (.D 8), .split, .split, (.D 0), .split, (.A 737), (.D 9), .split, (.D 0), .split, .split, (.A 225), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8), (.A 454), (.D 1), .split, .split, (.D 5), .split, .split, (.A 32966), (.D 5), (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s210A_12 : wsegOk P 0 nb210 kN210 k210A_12 t210A_12 k210A_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210A_13 : List Tok := [(.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, .split, (.A 32966), (.D 7), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10), .split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s210A_13 : wsegOk P 0 nb210 kN210 k210A_13 t210A_13 k210A_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210A_14 : List Tok := [.split, (.D 9), (.A 32876), (.D 9), .split, (.D 1), .split, .split, (.A 620), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), .split, (.A 32882), (.D 9), (.D 2), .split, .split, (.D 5), .split, .split, (.A 32882), (.D 5), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), .split, (.A 32882), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s210A_14 : wsegOk P 0 nb210 kN210 k210A_14 t210A_14 k210A_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210A_15 : List Tok := [(.D 6), (.D 2), .split, .split, (.A 114), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), .split, (.D 8), (.A 32909), (.D 8), .split, (.D 2), .split, .split, (.A 141)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s210A_15 : wsegOk P 0 nb210 kN210 k210A_15 t210A_15 k210A_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210A_16 : List Tok := [(.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s210A_16 : wsegOk P 0 nb210 kN210 k210A_16 t210A_16 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210B_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 500), .split, (.A 178), .split, (.A 32948), .split, .split, (.A 180), (.A 436), .split, (.A 180), (.A 32948), .split, .split, (.A 70), .split, .split, (.A 32966), (.A 198), (.A 198), .split, (.A 114), .split, .split, .split, .split, (.A 182), (.A 118), (.A 182), .split, .split, (.A 182)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s210B_0 : wsegOk P 1 nb210 kN210 (rRoots P.den) t210B_0 k210B_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210B_1 : List Tok := [(.A 118), (.A 180), .split, (.A 198), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), (.A 118), .split, .split, .split, .split, (.D 4), .split, (.D 4), (.A 388), (.D 4), .split, (.A 436), .split, (.D 4), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s210B_1 : wsegOk P 1 nb210 kN210 k210B_1 t210B_1 k210B_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210B_2 : List Tok := [(.A 909), .split, .split, (.A 454), (.A 398), .split, .split, .split, .split, .split, (.A 388), .split, (.A 454), (.A 390), (.A 388), .split, .split, (.A 32948), .split, .split, (.A 180), (.A 388), (.A 948), (.A 900), .split, .split, .split, .split, (.A 32966), (.A 134), (.A 198), .split, (.A 389), .split, .split, (.A 454), (.A 389), (.A 133), .split, .split, (.A 132)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s210B_2 : wsegOk P 1 nb210 kN210 k210B_2 t210B_2 k210B_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210B_3 : List Tok := [.split, (.A 134), .split, .split, (.A 132), .split, (.A 134), .split, (.A 132), (.A 141), (.A 141), .split, (.A 909), (.A 141), .split, (.A 909), .split, .split, (.A 397), (.A 32909), (.A 32909), .split, .split, .split, .split, .split, (.D 6), .split, .split, (.D 6), .split, (.D 6), .split, .split, (.D 6), (.A 176), (.D 6), (.D 6), (.A 948)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s210B_3 : wsegOk P 1 nb210 kN210 k210B_3 t210B_3 k210B_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210B_4 : List Tok := [.split, (.D 6), .split, (.D 6), (.A 876), .split, .split, (.A 882), .split, .split, .split, (.A 884), (.A 948), (.A 884), .split, .split, (.A 114), .split, .split, .split, (.A 116), (.A 180), (.A 892), (.A 112), (.A 876), (.A 876), .split, .split, (.A 948), .split, (.A 932), (.D 10), .split, .split, .split, (.A 956), .split, .split, .split, .split, .split, .split, (.A 948), .split, (.A 180)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s210B_4 : wsegOk P 1 nb210 kN210 k210B_4 t210B_4 k210B_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210B_5 : List Tok := [(.A 956), (.A 908), (.A 956), .split, .split, .split, (.A 188), (.A 172), (.A 141), .split, .split, .split, (.A 940), (.A 876), .split, (.A 108), (.A 876), (.A 940), (.A 909), .split, (.A 876), (.A 940), (.A 909), .split, (.A 876), .split, (.D 10), .split, .split, (.A 844), (.D 10), (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s210B_5 : wsegOk P 1 nb210 kN210 k210B_5 t210B_5 k210B_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210B_6 : List Tok := [.split, .split, .split, .split, .split, .split, (.A 66), (.D 5), (.A 198), .split, (.A 114), .split, (.A 242), (.A 226), .split, .split, (.D 5), .split, (.A 198), (.D 5), .split, .split, .split, (.D 5), .split, (.D 5), .split, (.A 114), (.D 5), (.D 5), (.A 225), .split, .split, .split, (.A 454), .split, .split, (.D 8), (.A 397), (.D 8), .split, .split, .split, .split, (.A 198)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s210B_6 : wsegOk P 1 nb210 kN210 k210B_6 t210B_6 k210B_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210B_7 : List Tok := [(.A 197), .split, (.A 193), (.A 141), (.A 193), .split, .split, (.A 141), (.A 32909), (.A 141), .split, .split, (.A 485), (.D 8), .split, (.A 225), .split, (.A 141), (.D 8), .split, .split, .split, .split, .split, (.A 114), .split, (.A 114), .split, (.D 9), .split, (.A 882), (.D 9), .split, .split, .split, (.A 114), (.A 97), .split, (.A 864)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s210B_7 : wsegOk P 1 nb210 kN210 k210B_7 t210B_7 k210B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210B_8 : List Tok := [.split, (.A 876), (.A 108), (.A 97), .split, .split, (.A 878), (.D 9), .split, (.A 876), .split, .split, (.A 876), .split, (.A 32876), (.A 620), (.A 32876), .split, .split, .split, .split, .split, (.D 9), .split, (.A 113), (.D 9), (.D 9), (.D 9), .split, .split, (.A 225), .split, .split, (.A 97), (.D 9), (.A 225), (.A 32993)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s210B_8 : wsegOk P 1 nb210 kN210 k210B_8 t210B_8 k210B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210B_9 : List Tok := [.split, (.D 9), .split, .split, .split, (.D 9), (.A 736), (.D 9), (.D 9), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 173), (.A 237), (.A 141), .split, (.A 108), (.A 173), (.A 237), (.A 141), .split, (.A 108), (.A 173), .split, (.A 237), (.A 109), (.A 141), .split, .split, .split, .split, (.A 876), .split, (.A 876), .split, (.A 109)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s210B_9 : wsegOk P 1 nb210 kN210 k210B_9 t210B_9 k210B_10 = true := by
  decide +kernel

end PackLean.D40.Tet
