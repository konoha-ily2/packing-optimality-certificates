-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey041

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_15 : List Tok := [(.A 0 6 5 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 1), .split, (.A 1 6 5 0 3), (.A 5 2 5 0 3), .split, (.A 0 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, (.A 5 2 7 0 3), (.A 5 2 7 0 3), .split, .split, (.A 1 6 5 0 3), .split, (.A 5 6 5 0 3), (.D 12), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_15 : wsegOk P nbN102 (nInsideL P nbN102) kN102_15 tN102_15 kN102_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_16 : List Tok := [.split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3), .split, (.A 1 6 7 1 3), (.D 12), (.D 12), (.D 12), (.A 5 6 7 4 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, .split, (.D 17), (.A 4 2 6 5 7), (.A 4 3 6 4 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_16 : wsegOk P nbN102 (nInsideL P nbN102) kN102_16 tN102_16 kN102_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_17 : List Tok := [.split, .split, (.D 17), (.A 5 2 6 5 7), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 5 2 6 5 7), .split, .split, (.A 4 2 6 4 7), (.A 5 2 6 4 7), (.A 5 2 6 4 7), .split, (.A 4 2 6 0 5), (.A 5 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, .split, (.D 13), (.A 4 2 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_17 : wsegOk P nbN102 (nInsideL P nbN102) kN102_17 tN102_17 kN102_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_18 : List Tok := [(.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 5 2 6 4 3), (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, .split, (.A 5 2 6 4 1), (.A 4 2 7 4 1), (.A 5 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_18 : wsegOk P nbN102 (nInsideL P nbN102) kN102_18 tN102_18 kN102_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_19 : List Tok := [(.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), (.A 5 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 5 2 6 0 1), (.A 4 2 5 0 1), (.A 4 2 6 0 1), (.A 5 2 7 0 1), .split, .split, .split, .split, .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_19 : wsegOk P nbN102 (nInsideL P nbN102) kN102_19 tN102_19 kN102_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_20 : List Tok := [.split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 0 6 5 0 1), (.A 0 2 5 0 1), .split, .split, .split, (.A 0 6 5 0 1), .split, (.A 0 6 5 0 1), (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 4 2 5 0 1), .split, (.A 4 6 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, .split, .split, (.A 4 2 5 0 1), (.A 5 2 5 0 1), .split, .split, .split, (.A 4 6 5 0 1), (.A 0 6 5 0 1), (.A 4 2 5 0 1), .split, (.A 4 6 5 0 1), (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_20 : wsegOk P nbN102 (nInsideL P nbN102) kN102_20 tN102_20 kN102_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_21 : List Tok := [(.A 4 2 5 0 1), (.A 4 2 7 4 1), .split, .split, (.A 5 2 7 4 1), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), .split, (.A 5 2 7 4 1), (.D 12), (.D 12), (.A 5 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), .split, (.A 4 3 5 0 1), (.D 18), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_21 : wsegOk P nbN102 (nInsideL P nbN102) kN102_21 tN102_21 kN102_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_22 : List Tok := [(.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_22 : wsegOk P nbN102 (nInsideL P nbN102) kN102_22 tN102_22 kN102_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_23 : List Tok := [(.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_23 : wsegOk P nbN102 (nInsideL P nbN102) kN102_23 tN102_23 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM102_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), (.A 1 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM102_0 : wsegOk P nbM102 (nInsideL P nbM102) (rRoots P.rden) tM102_0 kM102_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM102_1 : List Tok := [(.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 5 3 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), (.A 1 3 4 1 7), .split, .split, (.A 1 2 4 1 5), (.A 0 3 4 1 5), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 3 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM102_1 : wsegOk P nbM102 (nInsideL P nbM102) kM102_1 tM102_1 kM102_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM102_2 : List Tok := [.split, (.A 5 2 4 1 7), (.A 5 3 6 1 7), .split, .split, (.A 1 2 4 1 7), .split, (.A 1 3 4 1 7), (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 6 1 7), .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 7), .split, .split, (.A 1 2 4 1 7), (.A 5 2 6 1 7), (.A 5 2 6 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), .split, (.A 1 2 4 1 7), (.A 0 2 6 0 7), (.A 0 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM102_2 : wsegOk P nbM102 (nInsideL P nbM102) kM102_2 tM102_2 kM102_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM102_3 : List Tok := [.split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, .split, (.D 7), (.D 9), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, (.D 7), .split, (.A 1 6 4 3 7), (.D 7), .split, .split, (.A 1 6 5 3 7), (.D 7), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM102_3 : wsegOk P nbM102 (nInsideL P nbM102) kM102_3 tM102_3 kM102_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM102_4 : List Tok := [.split, .split, .split, .split, .split, (.A 1 6 4 1 5), .split, (.A 1 6 4 1 7), .split, (.A 1 6 4 1 7), (.A 0 6 4 0 7), .split, (.D 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 6 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM102_4 : wsegOk P nbM102 (nInsideL P nbM102) kM102_4 tM102_4 kM102_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM102_5 : List Tok := [.split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM102_5 : wsegOk P nbM102 (nInsideL P nbM102) kM102_5 tM102_5 kM102_6 = true := by
  decide +kernel

end PackLean.D28.Cub
