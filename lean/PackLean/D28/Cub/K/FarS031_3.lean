-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey031

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM083_17 : List Tok := [.split, (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), (.A 4 2 7 0 3), .split, .split, (.A 5 2 7 0 3), (.A 1 2 7 0 3), (.A 5 2 7 0 3), .split, (.A 1 2 7 0 3), (.A 5 2 7 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, .split, .split, (.A 0 6 5 0 3), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 3), .split, .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.D 12), (.D 12), .split, (.A 4 2 7 0 3), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM083_17 : wsegOk P nbM083 (nInsideL P nbM083) kM083_17 tM083_17 kM083_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM083_18 : List Tok := [(.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), (.A 1 4 5 1 3), (.D 4), (.D 1), .split, .split, .split, .split, .split, (.A 1 6 7 1 3), (.D 12), (.D 12), .split, .split, .split, .split, (.A 5 2 7 1 3), (.D 12), (.A 5 2 7 4 3), (.D 12), (.D 12), (.D 12), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM083_18 : wsegOk P nbM083 (nInsideL P nbM083) kM083_18 tM083_18 kM083_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM083_19 : List Tok := [.split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, (.A 5 3 6 5 7), (.A 4 3 6 4 7), .split, (.A 5 0 6 5 7), (.D 13), .split, (.D 13), (.A 4 1 6 4 7), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 4 2 6 0 7), .split, .split, (.A 0 2 6 0 7), (.A 4 2 6 0 5), .split, .split, (.A 4 2 6 0 3), .split, (.A 0 2 6 0 3), (.A 4 2 6 0 3), (.A 4 2 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM083_19 : wsegOk P nbM083 (nInsideL P nbM083) kM083_19 tM083_19 kM083_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM083_20 : List Tok := [(.A 4 2 6 0 5), (.A 4 2 6 0 3), (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, .split, (.A 4 3 6 4 7), (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), .split, (.A 4 2 6 4 3), (.A 5 2 6 4 3), (.A 5 0 6 5 3), .split, .split, (.A 5 2 6 4 3), (.A 4 2 6 4 1), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM083_20 : wsegOk P nbM083 (nInsideL P nbM083) kM083_20 tM083_20 kM083_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM083_21 : List Tok := [.split, .split, (.D 13), (.A 4 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM083_21 : wsegOk P nbM083 (nInsideL P nbM083) kM083_21 tM083_21 kM083_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM083_22 : List Tok := [.split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 2 6 0 1), .split, .split, .split, .split, .split, (.A 4 2 6 0 3), (.A 0 2 6 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 3), .split, (.A 0 2 6 0 1), .split, (.A 0 2 6 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), .split, (.A 0 2 4 0 1), (.A 0 2 5 0 1), .split, (.A 4 2 6 0 1), .split, .split, .split, (.A 4 2 6 0 1), .split, (.A 0 2 6 0 1), (.A 4 2 7 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM083_22 : wsegOk P nbM083 (nInsideL P nbM083) kM083_22 tM083_22 kM083_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM083_23 : List Tok := [(.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, .split, .split, .split, (.A 4 2 6 0 3), .split, .split, .split, (.A 4 2 6 0 3), .split, .split, .split, (.A 4 2 6 0 3), .split, (.A 0 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 2 6 0 1), .split, (.A 4 2 7 0 3), (.A 4 2 7 0 1), .split, .split, .split, .split, .split, (.A 0 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 0 2 5 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM083_23 : wsegOk P nbM083 (nInsideL P nbM083) kM083_23 tM083_23 kM083_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM083_24 : List Tok := [(.A 4 2 7 0 1), .split, .split, (.A 0 2 5 0 1), .split, .split, (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, (.A 0 3 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 4 2 5 0 1), (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, .split, .split, (.A 4 2 7 0 1), (.A 4 3 7 0 1), (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, .split, .split, (.A 4 2 7 4 1), (.A 4 2 7 4 1), (.A 5 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM083_24 : wsegOk P nbM083 (nInsideL P nbM083) kM083_24 tM083_24 kM083_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM083_25 : List Tok := [.split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM083_25 : wsegOk P nbM083 (nInsideL P nbM083) kM083_25 tM083_25 kM083_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM083_26 : List Tok := [(.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM083_26 : wsegOk P nbM083 (nInsideL P nbM083) kM083_26 tM083_26 kM083_27 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM083_27 : List Tok := [(.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM083_27 : wsegOk P nbM083 (nInsideL P nbM083) kM083_27 tM083_27 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_0 : wsegOk P nbN084 (nInsideL P nbN084) (rRoots P.rden) tN084_0 kN084_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_1 : List Tok := [(.A 5 2 4 1 7), .split, (.D 17), (.A 5 3 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 5), (.A 1 2 4 1 7), .split, (.D 5), .split, .split, (.A 1 3 4 1 7), .split, (.D 5), .split, (.D 5), .split, (.A 1 3 4 1 5), (.A 0 3 4 1 5), .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 5 3 4 1 7), .split, (.A 0 3 4 1 7), .split, .split, (.A 5 3 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 3 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_1 : wsegOk P nbN084 (nInsideL P nbN084) kN084_1 tN084_1 kN084_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_2 : List Tok := [.split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), (.A 4 3 4 1 7), .split, .split, (.A 1 2 4 1 5), .split, .split, (.A 0 3 4 1 5), .split, (.A 1 3 4 1 5), (.A 0 3 4 1 5), (.A 0 3 4 1 5), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), .split, .split, (.A 1 3 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 0 2 4 1 5), (.A 0 3 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, (.A 0 3 4 1 5), (.A 0 3 4 1 5), (.A 0 3 4 1 5), (.A 0 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_2 : wsegOk P nbN084 (nInsideL P nbN084) kN084_2 tN084_2 kN084_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_3 : List Tok := [(.A 0 2 4 0 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 3 4 1 7), .split, .split, (.A 5 2 4 1 7), (.A 4 3 4 1 7), (.A 5 2 4 1 7), (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 0 2 4 1 7), (.A 4 3 4 1 7), (.A 4 2 4 1 7), (.A 0 2 4 1 5), .split, (.A 5 2 4 1 7), (.A 4 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_3 : wsegOk P nbN084 (nInsideL P nbN084) kN084_3 tN084_3 kN084_4 = true := by
  decide +kernel

end PackLean.D28.Cub
