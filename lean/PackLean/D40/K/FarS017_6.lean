-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey017

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051B_9 : List Tok := [(.D 5), (.D 2), .split, .split, .split, .split, (.D 6), (.A 114), (.D 6), (.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051B_9 : wsegOk P 1 nb051 kN051 k051B_9 t051B_9 k051B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051B_10 : List Tok := [(.A 909), (.D 8), .split, (.D 2), .split, .split, (.A 909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s051B_10 : wsegOk P 1 nb051 kN051 k051B_10 t051B_10 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t052A_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22772), .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 178), .split, (.A 32948), .split, .split, (.A 180), .split, (.A 32948), (.A 180), (.A 180), .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 70)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s052A_0 : wsegOk P 0 nb052 kN052 (rRoots P.den) t052A_0 k052A_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t052A_1 : List Tok := [.split, .split, (.A 32966), .split, (.A 198), (.A 198), (.A 198), .split, (.A 114), .split, .split, .split, .split, (.A 182), .split, (.A 246), .split, (.A 32886), (.A 246), .split, .split, .split, (.A 246), .split, (.A 32950), .split, (.A 32966), (.A 32950), (.A 180), .split, (.A 198), (.A 182), .split, .split, (.A 182), (.A 118), (.A 180), .split, .split, (.A 246)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s052A_1 : wsegOk P 0 nb052 kN052 k052A_1 t052A_1 k052A_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t052A_2 : List Tok := [(.A 198), .split, (.A 114), .split, .split, .split, .split, (.A 182), (.A 246), (.A 182), (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), .split, (.A 246), .split, (.A 114), .split, (.A 182), (.A 246), .split, .split, .split, .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s052A_2 : wsegOk P 0 nb052 kN052 k052A_2 t052A_2 k052A_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t052A_3 : List Tok := [.split, .split, (.D 4), (.A 32964), (.D 4), (.D 4), (.D 4), .split, .split, (.A 32948), .split, .split, .split, (.A 32948), (.A 22964), (.A 436), (.A 22964), (.A 437), .split, .split, .split, .split, (.A 32966), .split, .split, .split, (.A 32966), .split, (.A 32966), (.A 454), (.A 32966), .split, (.D 4), (.A 454), .split, (.A 32966), .split, (.A 32966)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s052A_3 : wsegOk P 0 nb052 kN052 k052A_3 t052A_3 k052A_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t052A_4 : List Tok := [(.A 454), .split, (.D 4), .split, (.D 4), (.A 397), .split, .split, .split, .split, .split, .split, .split, (.A 22662), .split, (.A 32900), (.A 32902), .split, (.A 180), (.A 32900), .split, .split, .split, .split, (.A 32966), (.A 32902), (.A 32966), (.A 32902), (.A 134), (.A 388), .split, (.A 180), .split, (.A 22916), .split, .split, (.A 132), (.A 32901), (.A 141)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s052A_4 : wsegOk P 0 nb052 kN052 k052A_4 t052A_4 k052A_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t052A_5 : List Tok := [.split, .split, .split, .split, (.A 32966), .split, .split, (.A 134), (.A 198), (.A 134), .split, (.A 32966), .split, (.A 198), .split, .split, (.A 198), (.A 134), (.A 198), .split, .split, (.A 390), .split, .split, (.A 389), .split, (.A 32902), (.A 133), (.A 32901), .split, .split, (.A 454), (.A 389), .split, .split, .split, .split, (.A 28806), (.A 32901), (.A 133), .split, .split, .split, .split, (.A 32966)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s052A_5 : wsegOk P 0 nb052 kN052 k052A_5 t052A_5 k052A_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t052A_6 : List Tok := [(.A 197), (.A 198), (.A 32901), (.A 133), (.A 397), .split, .split, (.A 132), .split, .split, .split, (.A 134), (.A 198), (.A 133), .split, .split, (.A 132), (.A 133), (.A 141), (.A 141), .split, (.A 397), (.A 22925), .split, .split, .split, .split, .split, (.D 6), .split, .split, (.D 6), .split, (.D 6), .split, .split, (.D 6), (.A 176)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s052A_6 : wsegOk P 0 nb052 kN052 k052A_6 t052A_6 k052A_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t052A_7 : List Tok := [(.D 6), (.D 6), .split, (.A 32948), .split, .split, .split, (.A 32948), .split, (.A 32948), .split, .split, (.D 6), .split, (.A 180), (.D 6), (.A 32948), (.A 32948), .split, .split, (.D 6), (.A 23412), (.A 948), .split, (.D 6), .split, (.D 6), (.A 876), .split, .split, .split, .split, .split, (.A 32882), (.A 114), (.A 882), .split, (.A 32882)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s052A_7 : wsegOk P 0 nb052 kN052 k052A_7 t052A_7 k052A_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t052A_8 : List Tok := [(.A 882), .split, .split, .split, (.A 22644), .split, (.A 32948), .split, (.A 180), .split, (.A 116), (.A 180), .split, (.A 884), .split, .split, .split, (.A 32884), (.A 948), (.A 884), .split, .split, (.A 124), .split, .split, .split, (.A 116), .split, (.A 32948), (.A 188), (.A 32892), (.A 124), (.A 876), .split, .split, (.A 114), .split, .split, .split, (.A 116), (.A 180)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s052A_8 : wsegOk P 0 nb052 kN052 k052A_8 t052A_8 k052A_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t052A_9 : List Tok := [(.A 124), (.A 112), (.A 108), .split, (.A 894), (.A 876), .split, .split, .split, .split, (.A 32948), (.A 948), (.A 957), .split, .split, (.D 10), .split, (.A 932), (.D 10), (.D 10), .split, .split, .split, .split, .split, (.A 180), .split, (.A 956), .split, (.A 140), (.A 908), .split, .split, (.A 956), .split, .split, .split, (.A 956), .split, (.A 188), .split, .split, .split, .split, (.A 32892)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s052A_9 : wsegOk P 0 nb052 kN052 k052A_9 t052A_9 k052A_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t052A_10 : List Tok := [(.A 956), (.A 32876), .split, .split, (.A 108), .split, .split, .split, (.A 892), .split, (.A 956), .split, (.A 188), (.A 876), (.A 32876), (.A 108), (.A 32876), .split, (.A 940), .split, .split, .split, (.A 940), .split, (.A 172), (.A 32876), (.A 32940), (.A 32876), (.A 956), .split, (.A 876), (.A 32940), (.A 940)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s052A_10 : wsegOk P 0 nb052 kN052 k052A_10 t052A_10 k052A_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t052A_11 : List Tok := [.split, .split, .split, (.A 188), .split, .split, .split, (.A 188), (.A 172), (.A 141), .split, .split, .split, (.A 172), (.A 108), (.A 108), (.A 172), .split, (.A 141), (.A 141), .split, .split, .split, .split, .split, .split, (.A 172), (.A 108), (.A 108), (.A 22700), (.A 32876), .split, .split, (.A 108), .split, .split, (.A 172), (.A 108), .split, .split, (.A 108), (.A 172)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s052A_11 : wsegOk P 0 nb052 kN052 k052A_11 t052A_11 k052A_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t052A_12 : List Tok := [(.A 32876), (.A 32876), .split, .split, .split, .split, (.A 940), (.A 172), (.A 32908), (.A 29612), .split, .split, (.A 172), (.A 141), .split, .split, .split, .split, (.A 32876), (.A 32940), (.A 32876), .split, .split, (.A 32876), .split, (.A 32940), (.A 108), (.A 32876), (.A 22700), .split, (.A 909), .split, (.A 32909), .split, (.A 23437), (.A 32909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s052A_12 : wsegOk P 0 nb052 kN052 k052A_12 t052A_12 k052A_13 = true := by
  decide +kernel

end PackLean.D40.Tet
