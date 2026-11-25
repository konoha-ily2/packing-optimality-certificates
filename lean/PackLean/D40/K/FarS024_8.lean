-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey024

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t076B_8 : List Tok := [(.A 454), (.D 1), .split, .split, (.D 5), .split, (.A 454), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s076B_8 : wsegOk P 1 nb076 kN076 k076B_8 t076B_8 k076B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t076B_9 : List Tok := [.split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), (.A 876), (.D 9), .split, (.D 1), .split, .split, (.A 876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), (.A 882), (.D 2), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), (.A 114), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s076B_9 : wsegOk P 1 nb076 kN076 k076B_9 t076B_9 k076B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t076B_10 : List Tok := [(.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2), .split, .split, (.A 909), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s076B_10 : wsegOk P 1 nb076 kN076 k076B_10 t076B_10 k076B_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t076B_11 : List Tok := [(.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s076B_11 : wsegOk P 1 nb076 kN076 k076B_11 t076B_11 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t077A_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22772), .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22706), .split, (.A 32948), .split, .split, (.A 180), (.A 180), (.A 180), .split, .split, .split, (.D 7), .split, (.D 7), (.A 114), .split, .split, (.A 32966)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s077A_0 : wsegOk P 0 nb077 kN077 (rRoots P.den) t077A_0 k077A_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t077A_1 : List Tok := [(.A 198), (.A 198), .split, .split, .split, (.A 114), .split, (.A 32882), (.A 114), (.A 114), .split, .split, .split, .split, .split, .split, (.D 7), (.A 246), (.A 182), .split, (.A 246), .split, (.A 32886), .split, (.A 182), .split, (.A 33014), (.A 118), .split, (.A 182), .split, (.A 198), (.A 182), .split, .split, .split, (.A 182), .split, .split, (.A 182), (.A 32886)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s077A_1 : wsegOk P 0 nb077 kN077 k077A_1 t077A_1 k077A_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t077A_2 : List Tok := [(.A 180), .split, .split, (.A 32886), .split, (.A 32950), (.A 118), .split, (.A 114), (.A 118), (.A 180), .split, .split, .split, .split, (.A 246), (.A 118), (.A 246), (.A 198), .split, (.A 114), .split, .split, .split, .split, (.A 182), .split, (.A 246), (.A 118), (.A 182), .split, .split, .split, (.A 182), (.A 118), (.A 118), (.A 180)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s077A_2 : wsegOk P 0 nb077 kN077 k077A_2 t077A_2 k077A_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t077A_3 : List Tok := [.split, (.A 246), .split, (.A 114), .split, .split, (.A 182), .split, (.A 118), (.A 180), .split, (.A 246), .split, (.A 114), .split, (.A 182), (.A 246), .split, .split, .split, .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), (.A 32964), (.D 4), (.D 4), (.D 4), .split, .split, (.A 32948), .split, .split, .split, (.A 32948)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s077A_3 : wsegOk P 0 nb077 kN077 k077A_3 t077A_3 k077A_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t077A_4 : List Tok := [.split, .split, (.A 32948), .split, (.D 4), (.A 32900), (.A 32948), (.A 436), .split, (.A 32948), (.A 22964), .split, (.D 4), .split, (.D 4), .split, (.A 437), (.D 4), .split, .split, .split, .split, (.A 32966), .split, .split, .split, (.A 32966), .split, (.A 32966), .split, (.D 4), (.A 32966), (.A 32966), .split, (.D 4), .split, (.D 4), .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s077A_4 : wsegOk P 0 nb077 kN077 k077A_4 t077A_4 k077A_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t077A_5 : List Tok := [(.A 32966), (.D 4), .split, (.A 32966), .split, (.A 32966), .split, .split, (.A 32966), .split, (.A 32966), .split, (.D 4), .split, (.D 4), .split, (.A 32966), (.D 4), (.A 32966), .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 398), (.D 4), (.D 4), .split, .split, .split, .split, .split, .split, .split, (.A 28806), .split, (.A 32900)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s077A_5 : wsegOk P 0 nb077 kN077 k077A_5 t077A_5 k077A_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t077A_6 : List Tok := [(.A 32902), (.A 180), (.A 22662), .split, .split, .split, .split, (.D 4), (.A 390), (.D 4), .split, (.A 32900), (.A 389), .split, (.A 22918), .split, .split, .split, .split, (.A 32902), (.A 388), (.A 32900), .split, (.A 32902), (.A 133), (.A 32901), .split, (.A 180), .split, .split, (.A 29060), (.A 180), (.A 133), .split, .split, .split, .split, (.A 32966)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s077A_6 : wsegOk P 0 nb077 kN077 k077A_6 t077A_6 k077A_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t077A_7 : List Tok := [(.A 134), .split, (.A 32966), .split, (.A 198), .split, .split, (.A 198), (.A 134), (.A 198), .split, .split, (.A 29062), .split, .split, (.A 133), (.A 133), (.A 32901), .split, .split, .split, .split, (.A 32966), .split, (.A 32966), (.A 32902), .split, (.A 32966), .split, (.A 32966), .split, .split, (.A 32966), .split, (.A 32966), (.A 32901), .split, (.A 32966), (.A 32965)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s077A_7 : wsegOk P 0 nb077 kN077 k077A_7 t077A_7 k077A_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t077A_8 : List Tok := [.split, .split, (.A 32902), (.A 32901), .split, .split, (.A 32966), (.A 32901), (.A 32901), .split, .split, .split, (.A 134), (.A 133), .split, .split, (.A 198), (.A 32901), (.A 133), .split, (.A 141), .split, (.A 141), (.A 32909), .split, .split, (.A 132), .split, (.A 134), (.A 133), (.A 141), .split, .split, (.A 397), .split, (.A 22925), (.A 32909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s077A_8 : wsegOk P 0 nb077 kN077 k077A_8 t077A_8 k077A_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t077A_9 : List Tok := [.split, .split, (.A 397), (.A 32909), (.A 32909), .split, .split, .split, .split, .split, (.D 6), .split, .split, (.D 6), .split, (.D 6), .split, .split, (.D 6), .split, (.D 6), .split, .split, (.D 6), (.A 32944), (.D 6), (.D 6), (.D 6), .split, (.A 32948), .split, .split, .split, (.A 32948), .split, (.A 32948), .split, .split, (.D 6), .split, .split, (.D 6), (.A 32948), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s077A_9 : wsegOk P 0 nb077 kN077 k077A_9 t077A_9 k077A_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t077A_10 : List Tok := [(.A 32948), (.A 32948), (.A 948), .split, (.D 6), .split, (.D 6), (.A 876), .split, .split, .split, .split, .split, (.A 32882), .split, .split, (.A 32882), .split, (.D 6), .split, (.D 6), (.A 32882), (.A 32882), (.A 882), (.A 23410), .split, .split, .split, .split, .split, .split, (.A 28788), .split, (.A 32948), .split, (.A 180), (.A 32884), .split, .split, (.A 32884), (.A 32880)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s077A_10 : wsegOk P 0 nb077 kN077 k077A_10 t077A_10 k077A_11 = true := by
  decide +kernel

end PackLean.D40.Tet
