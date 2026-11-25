-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey019

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060B_9 : List Tok := [.split, .split, .split, .split, .split, (.D 9), .split, (.D 9), (.A 114), (.D 2), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), (.A 114), (.D 6), (.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060B_9 : wsegOk P 1 nb060 kN060 k060B_9 t060B_9 k060B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060B_10 : List Tok := [.split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2), .split, .split, (.A 909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s060B_10 : wsegOk P 1 nb060 kN060 k060B_10 t060B_10 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t061A_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22772), .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 178), .split, (.A 32948), .split, .split, (.A 180), .split, (.A 32948), (.A 180), (.A 180), .split, .split, .split, (.D 7), .split, (.D 7), (.A 114), .split, .split, (.A 32966)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s061A_0 : wsegOk P 0 nb061 kN061 (rRoots P.den) t061A_0 k061A_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t061A_1 : List Tok := [.split, (.A 198), (.A 198), (.A 198), .split, (.A 114), .split, .split, .split, .split, (.A 182), .split, (.A 246), .split, (.A 32886), (.A 246), .split, .split, .split, (.A 246), .split, (.A 32950), .split, (.A 32966), (.A 32950), (.A 180), .split, (.A 198), (.A 182), .split, .split, (.A 182), (.A 118), (.A 180), .split, .split, (.A 246), (.A 198)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s061A_1 : wsegOk P 0 nb061 kN061 k061A_1 t061A_1 k061A_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t061A_2 : List Tok := [.split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), (.A 246), .split, .split, .split, .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), (.A 32964), (.D 4), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s061A_2 : wsegOk P 0 nb061 kN061 k061A_2 t061A_2 k061A_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t061A_3 : List Tok := [(.D 4), .split, .split, (.A 32948), .split, (.A 436), (.A 436), (.A 437), .split, .split, .split, .split, (.A 32966), .split, .split, .split, (.A 32966), .split, (.A 32966), (.A 454), (.A 32966), (.A 454), (.A 454), .split, (.D 4), .split, (.D 4), (.A 397), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 32902), (.A 32900), (.A 32948), (.A 32902), (.A 388)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s061A_3 : wsegOk P 0 nb061 kN061 k061A_3 t061A_3 k061A_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t061A_4 : List Tok := [.split, (.A 180), (.A 32900), .split, .split, .split, .split, (.A 32966), (.A 32902), (.A 32966), (.A 32902), (.A 134), (.A 388), .split, (.A 180), .split, (.A 388), .split, (.A 389), (.A 141), .split, .split, .split, .split, (.A 32966), (.A 134), .split, (.A 32966), .split, (.A 198), .split, .split, (.A 198), (.A 134), (.A 198), .split, .split, (.A 390)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s061A_4 : wsegOk P 0 nb061 kN061 k061A_4 t061A_4 k061A_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t061A_5 : List Tok := [(.A 389), .split, .split, (.A 454), (.A 389), .split, .split, .split, .split, .split, (.A 32902), .split, (.A 454), (.A 134), (.A 32901), (.A 133), .split, .split, (.A 198), (.A 32901), (.A 133), (.A 397), .split, .split, (.A 132), .split, (.A 134), (.A 133), (.A 141), (.A 397), .split, .split, .split, .split, .split, (.D 6), .split, .split, (.D 6), .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s061A_5 : wsegOk P 0 nb061 kN061 k061A_5 t061A_5 k061A_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t061A_6 : List Tok := [.split, .split, (.D 6), (.A 176), (.D 6), (.D 6), .split, (.A 32948), .split, .split, .split, (.A 32948), (.A 180), (.A 32948), (.A 948), .split, (.D 6), .split, (.D 6), (.A 876), .split, .split, .split, .split, (.A 114), (.A 882), (.A 114), .split, .split, .split, (.A 116), .split, (.A 32948), .split, (.A 180), .split, (.A 116), (.A 180)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s061A_6 : wsegOk P 0 nb061 kN061 k061A_6 t061A_6 k061A_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t061A_7 : List Tok := [.split, (.A 884), .split, (.A 29556), (.A 892), .split, .split, (.A 114), .split, .split, .split, (.A 116), (.A 180), (.A 124), (.A 112), (.A 108), (.A 876), .split, .split, (.A 948), .split, .split, (.D 10), .split, (.A 932), (.D 10), (.D 10), .split, .split, .split, .split, .split, (.A 180), .split, (.A 956), (.A 908), .split, .split, (.A 956), .split, (.A 956)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s061A_7 : wsegOk P 0 nb061 kN061 k061A_7 t061A_7 k061A_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t061A_8 : List Tok := [(.A 876), (.A 940), .split, .split, .split, (.A 188), .split, .split, .split, (.A 188), (.A 172), (.A 141), .split, .split, .split, (.A 172), (.A 108), (.A 108), (.A 172), .split, .split, (.A 141), .split, (.A 140), (.A 32909), (.A 141), .split, .split, .split, .split, .split, .split, (.A 172), (.A 876), (.A 108), .split, (.A 940), (.A 172), (.A 32876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s061A_8 : wsegOk P 0 nb061 kN061 k061A_8 t061A_8 k061A_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t061A_9 : List Tok := [.split, .split, (.A 108), .split, .split, (.A 172), (.A 108), .split, (.A 108), (.A 32876), (.A 32876), .split, (.A 940), .split, .split, (.A 172), (.A 141), .split, .split, .split, .split, (.A 32876), (.A 32940), (.A 32876), .split, .split, (.A 32876), .split, (.A 32940), (.A 108), (.A 32876), .split, (.A 940), .split, .split, (.A 32940), (.A 32909), .split, (.A 32876)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s061A_9 : wsegOk P 0 nb061 kN061 k061A_9 t061A_9 k061A_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t061A_10 : List Tok := [(.A 32940), .split, (.A 909), (.A 23437), .split, .split, (.A 876), (.A 23404), .split, (.D 10), .split, .split, .split, (.D 10), .split, .split, .split, (.D 10), .split, .split, (.A 32844), (.D 10), (.D 10), (.D 10), (.D 10), (.D 10), (.D 10), .split, .split, .split, .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, (.A 66), (.D 5), (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s061A_10 : wsegOk P 0 nb061 kN061 k061A_10 t061A_10 k061A_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t061A_11 : List Tok := [.split, (.A 198), .split, (.A 32966), .split, (.A 198), (.A 198), .split, .split, (.A 114), .split, .split, (.D 5), .split, .split, (.D 5), (.A 114), (.D 5), .split, (.A 32882), .split, (.A 32882), .split, .split, (.D 5), .split, (.A 32882), (.D 5), (.A 32882), .split, .split, (.A 198), .split, (.A 114), .split, (.A 242), (.A 226), .split, .split, (.A 226)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s061A_11 : wsegOk P 0 nb061 kN061 k061A_11 t061A_11 k061A_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t061A_12 : List Tok := [(.A 194), .split, .split, (.A 242), .split, (.A 226), .split, .split, (.A 242), (.A 32994), (.A 225), (.A 225), .split, .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 230), (.D 5), (.D 5), .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 33009)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s061A_12 : wsegOk P 0 nb061 kN061 k061A_12 t061A_12 k061A_13 = true := by
  decide +kernel

end PackLean.D40.Tet
