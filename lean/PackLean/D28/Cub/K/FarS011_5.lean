-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey011

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM039_22 : List Tok := [.split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM039_22 : wsegOk P nbM039 (nInsideL P nbM039) kM039_22 tM039_22 kM039_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM039_23 : List Tok := [.split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM039_23 : wsegOk P nbM039 (nInsideL P nbM039) kM039_23 tM039_23 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN040_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), (.A 0 6 4 1 5), .split, (.D 5), .split, (.D 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 5 7), .split, .split, .split, .split, (.D 5), (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN040_0 : wsegOk P nbN040 (nInsideL P nbN040) (rRoots P.rden) tN040_0 kN040_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN040_1 : List Tok := [.split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 1 7), .split, (.A 0 2 4 1 5), (.A 4 2 4 1 5), .split, (.A 5 2 4 1 7), (.A 4 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, (.A 1 6 4 3 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, (.A 1 6 4 1 5), (.A 1 6 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN040_1 : wsegOk P nbN040 (nInsideL P nbN040) kN040_1 tN040_1 kN040_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN040_2 : List Tok := [(.A 0 6 4 2 1), .split, .split, (.A 0 6 4 0 5), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.A 0 2 4 0 5), (.A 4 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, .split, (.A 1 6 4 0 7), (.A 1 6 4 0 7), .split, (.A 1 6 4 0 7), (.A 5 6 4 0 7), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 0 2 4 0 7), (.A 4 2 4 0 5), .split, (.A 5 2 4 0 7), (.A 4 2 4 0 7), .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN040_2 : wsegOk P nbN040 (nInsideL P nbN040) kN040_2 tN040_2 kN040_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN040_3 : List Tok := [.split, (.A 1 6 4 0 3), (.A 4 6 4 0 1), .split, (.A 4 2 4 0 5), .split, (.A 4 6 4 0 1), (.A 4 2 4 0 1), .split, .split, (.A 5 2 4 0 7), .split, (.A 5 6 4 0 3), (.A 5 6 4 0 3), (.A 4 2 4 0 1), .split, .split, (.A 0 6 4 0 1), (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), (.A 4 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, (.A 0 3 2 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN040_3 : wsegOk P nbN040 (nInsideL P nbN040) kN040_3 tN040_3 kN040_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN040_4 : List Tok := [.split, (.D 2), .split, (.D 6), .split, .split, (.D 2), (.D 6), (.D 2), .split, .split, (.A 4 3 2 4 7), .split, (.A 4 3 6 0 5), .split, (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 6 1 2 4 7), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 4 3 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN040_4 : wsegOk P nbN040 (nInsideL P nbN040) kN040_4 tN040_4 kN040_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN040_5 : List Tok := [(.A 0 7 4 2 1), (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 1), .split, (.A 4 7 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 4 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), (.A 4 7 4 2 1), .split, .split, (.D 6), (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), (.A 5 2 4 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), (.A 4 0 4 5 7), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN040_5 : wsegOk P nbN040 (nInsideL P nbN040) kN040_5 tN040_5 kN040_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN040_6 : List Tok := [.split, (.D 17), .split, .split, (.A 5 0 6 5 3), (.A 5 0 6 5 7), (.A 7 0 6 5 3), .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, (.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN040_6 : wsegOk P nbN040 (nInsideL P nbN040) kN040_6 tN040_6 kN040_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN040_7 : List Tok := [(.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), (.A 5 6 5 0 1), (.A 5 6 5 0 3), (.A 5 6 5 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 1), (.D 12), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, (.A 5 6 7 0 3), (.D 12), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN040_7 : wsegOk P nbN040 (nInsideL P nbN040) kN040_7 tN040_7 kN040_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN040_8 : List Tok := [.split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.A 4 2 6 0 7), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), .split, (.A 4 2 6 4 3), (.A 5 2 6 4 3), (.A 7 0 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN040_8 : wsegOk P nbN040 (nInsideL P nbN040) kN040_8 tN040_8 kN040_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN040_9 : List Tok := [(.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, .split, (.A 5 2 6 4 1), (.A 4 2 7 4 1), .split, (.A 5 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 6 3 6 4 5), (.A 6 2 7 4 5), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), (.A 6 2 7 4 5), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 7 0 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN040_9 : wsegOk P nbN040 (nInsideL P nbN040) kN040_9 tN040_9 kN040_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN040_10 : List Tok := [(.A 5 2 7 5 3), .split, (.D 13), (.A 7 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, (.A 4 2 7 0 1), (.A 4 2 7 4 1), (.A 5 2 7 4 1), .split, .split, .split, .split, (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, .split, .split, (.A 4 2 7 4 1), (.A 5 2 7 4 1), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN040_10 : wsegOk P nbN040 (nInsideL P nbN040) kN040_10 tN040_10 kN040_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN040_11 : List Tok := [(.D 19), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN040_11 : wsegOk P nbN040 (nInsideL P nbN040) kN040_11 tN040_11 kN040_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN040_12 : List Tok := [.split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN040_12 : wsegOk P nbN040 (nInsideL P nbN040) kN040_12 tN040_12 [] = true := by
  decide +kernel

end PackLean.D28.Cub
