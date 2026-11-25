-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey008

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t023B_7 : List Tok := [(.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), (.A 225), .split, (.D 0), .split, (.D 8), .split, (.A 225), (.D 8), .split, .split, (.D 0), .split, .split, (.D 9), (.A 225), (.D 9), .split, (.D 0), .split, .split, (.A 225), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s023B_7 : wsegOk P 1 nb023 kN023 k023B_7 t023B_7 k023B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t023B_8 : List Tok := [(.A 454), (.D 1), .split, .split, (.D 5), .split, (.A 454), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s023B_8 : wsegOk P 1 nb023 kN023 k023B_8 t023B_8 k023B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t023B_9 : List Tok := [.split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), (.A 876), (.D 9), .split, (.D 1), .split, .split, (.A 876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), (.A 114), (.D 2), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), (.A 114)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s023B_9 : wsegOk P 1 nb023 kN023 k023B_9 t023B_9 k023B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t023B_10 : List Tok := [(.D 6), (.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2), .split, .split, (.A 909)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s023B_10 : wsegOk P 1 nb023 kN023 k023B_10 t023B_10 k023B_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t023B_11 : List Tok := [(.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s023B_11 : wsegOk P 1 nb023 kN023 k023B_11 t023B_11 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t024A_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22772), .split, .split, (.D 7), .split, (.D 7), .split, (.D 7), .split, (.D 7), (.A 22706), .split, (.A 32948), .split, .split, (.A 180), .split, (.A 32948), (.A 180), (.A 180), .split, .split, .split, (.D 7), .split, (.D 7), .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s024A_0 : wsegOk P 0 nb024 kN024 (rRoots P.den) t024A_0 k024A_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t024A_1 : List Tok := [(.A 22598), .split, .split, (.A 32966), (.A 198), (.A 198), .split, .split, .split, (.A 114), .split, (.A 32882), (.A 114), (.A 114), .split, .split, .split, .split, .split, .split, (.D 7), .split, (.D 7), (.A 246), (.A 182), .split, .split, (.A 118), (.A 33014), .split, (.A 32886), .split, (.A 182), .split, (.A 33014), .split, (.A 32886), .split, (.A 32950), (.A 246)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s024A_1 : wsegOk P 0 nb024 kN024 k024A_1 t024A_1 k024A_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t024A_2 : List Tok := [.split, .split, .split, .split, (.A 32950), (.A 33014), .split, (.A 32950), .split, (.A 32966), (.A 32950), (.A 180), .split, (.A 198), .split, .split, (.A 32950), (.A 246), (.A 182), .split, .split, .split, (.A 182), .split, .split, (.A 182), (.A 32886), (.A 180), .split, .split, (.A 32886), .split, (.A 32950), (.A 118), (.A 118), (.A 180), .split, .split, .split, .split, (.A 246)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s024A_2 : wsegOk P 0 nb024 kN024 k024A_2 t024A_2 k024A_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t024A_3 : List Tok := [.split, (.A 32886), .split, (.A 246), (.A 246), .split, (.A 198), .split, (.A 114), (.A 246), (.A 198), .split, (.A 114), .split, .split, .split, .split, .split, (.A 182), (.A 182), .split, (.A 246), .split, (.A 118), .split, (.A 182), (.A 246), (.A 182), .split, .split, .split, (.A 182), (.A 118), (.A 118), (.A 180), .split, (.A 246)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s024A_3 : wsegOk P 0 nb024 kN024 k024A_3 t024A_3 k024A_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t024A_4 : List Tok := [.split, (.A 114), .split, .split, .split, .split, (.A 182), (.A 246), (.A 182), .split, (.A 118), (.A 180), .split, (.A 246), .split, (.A 114), .split, (.A 182), (.A 246), .split, .split, .split, .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), (.A 32964), (.D 4), (.D 4), (.D 4), .split, .split, (.A 32948)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s024A_4 : wsegOk P 0 nb024 kN024 k024A_4 t024A_4 k024A_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t024A_5 : List Tok := [.split, .split, .split, (.A 32948), .split, .split, (.A 32948), .split, (.D 4), (.A 32900), (.A 32948), (.A 436), .split, (.A 32948), (.A 22964), .split, (.D 4), .split, (.D 4), (.A 397), .split, .split, .split, .split, (.A 32966), .split, .split, .split, (.A 32966), .split, (.A 32966), .split, (.D 4), (.A 32966), (.A 32966), .split, (.D 4), .split, (.D 4), .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s024A_5 : wsegOk P 0 nb024 kN024 k024A_5 t024A_5 k024A_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t024A_6 : List Tok := [(.A 32966), (.D 4), .split, (.A 32966), .split, (.A 32966), .split, .split, (.A 32966), .split, (.A 32966), .split, (.D 4), (.A 454), (.A 32966), .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 397), (.D 4), .split, .split, .split, .split, .split, .split, .split, (.A 28806), .split, (.A 32900), (.A 32902), (.A 180), (.A 22662)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s024A_6 : wsegOk P 0 nb024 kN024 k024A_6 t024A_6 k024A_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t024A_7 : List Tok := [.split, .split, .split, .split, (.D 4), (.A 29062), (.D 4), (.A 22916), .split, (.A 22918), .split, .split, .split, (.A 29062), (.A 32900), .split, (.A 32902), (.A 133), (.A 32901), .split, (.A 180), .split, .split, (.A 29060), (.A 180), (.A 133), .split, .split, .split, .split, (.A 32966), .split, .split, (.A 134), (.A 198), (.A 22662), .split, (.A 32966), .split, (.A 198)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s024A_7 : wsegOk P 0 nb024 kN024 k024A_7 t024A_7 k024A_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t024A_8 : List Tok := [.split, .split, .split, (.A 32966), .split, .split, (.A 32966), .split, (.A 32966), (.A 32902), (.A 198), (.A 134), (.A 198), .split, .split, (.A 29062), .split, .split, .split, (.A 32902), (.A 133), .split, (.A 32902), (.A 133), (.A 32901), .split, .split, .split, .split, (.A 32966), .split, (.A 32966), (.A 32902), .split, (.A 32966), .split, (.A 32966), .split, .split, (.A 32966), .split, (.A 32966)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s024A_8 : wsegOk P 0 nb024 kN024 k024A_8 t024A_8 k024A_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t024A_9 : List Tok := [(.A 32901), .split, (.A 32966), (.A 32965), .split, .split, (.A 32902), (.A 32901), .split, .split, (.A 32966), (.A 32901), (.A 32901), .split, .split, .split, .split, (.A 22662), (.A 32901), (.A 133), .split, .split, .split, .split, (.A 32966), .split, (.A 198), .split, (.A 32901), .split, (.A 32965), (.A 32901), .split, (.A 32966), (.A 32965), (.A 32901), .split, .split, (.A 133)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s024A_9 : wsegOk P 0 nb024 kN024 k024A_9 t024A_9 k024A_10 = true := by
  decide +kernel

end PackLean.D40.Tet
