-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey014

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM049_18 : List Tok := [(.A 4 2 6 0 1), .split, (.A 4 2 4 0 1), (.A 4 2 5 0 1), (.A 4 2 6 0 1), .split, (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, .split, (.A 4 2 5 0 1), (.A 4 6 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 4 3 7 0 1), (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, (.A 4 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, (.A 4 7 5 0 1), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM049_18 : wsegOk P nbM049 (nInsideL P nbM049) kM049_18 tM049_18 kM049_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM049_19 : List Tok := [(.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM049_19 : wsegOk P nbM049 (nInsideL P nbM049) kM049_19 tM049_19 kM049_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM049_20 : List Tok := [.split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM049_20 : wsegOk P nbM049 (nInsideL P nbM049) kM049_20 tM049_20 kM049_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM049_21 : List Tok := [.split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM049_21 : wsegOk P nbM049 (nInsideL P nbM049) kM049_21 tM049_21 [] = true := by
  decide +kernel

end PackLean.D28.Cub
