-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey027

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t086B_7 : List Tok := [(.D 7), (.D 0), .split, .split, .split, (.D 0), .split, (.D 5), .split, (.D 5), (.A 225), .split, (.D 0), .split, (.D 8), .split, (.A 225), (.D 8), .split, .split, (.D 0), .split, .split, (.D 9), (.A 225), (.D 9), .split, (.D 0), .split, .split, (.A 225), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 8), .split, (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s086B_7 : wsegOk P 1 nb086 kN086 k086B_7 t086B_7 k086B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t086B_8 : List Tok := [(.A 454), (.D 1), .split, .split, (.D 5), .split, (.A 454), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876), .split, (.D 1), .split, (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s086B_8 : wsegOk P 1 nb086 kN086 k086B_8 t086B_8 k086B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t086B_9 : List Tok := [.split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), (.A 876), (.D 9), .split, (.D 1), .split, .split, (.A 876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), (.A 882), (.D 2), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6), (.A 114), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s086B_9 : wsegOk P 1 nb086 kN086 k086B_9 t086B_9 k086B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t086B_10 : List Tok := [(.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2), .split, .split, (.A 909), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s086B_10 : wsegOk P 1 nb086 kN086 k086B_10 t086B_10 k086B_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t086B_11 : List Tok := [(.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s086B_11 : wsegOk P 1 nb086 kN086 k086B_11 t086B_11 [] = true := by
  decide +kernel

end PackLean.D40.Tet
