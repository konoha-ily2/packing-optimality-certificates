-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey030

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN081_15 : List Tok := [.split, (.A 1 2 5 0 3), (.A 0 2 5 0 3), .split, .split, .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1), .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), (.A 4 2 4 0 1), .split, (.A 5 2 4 0 3), (.A 5 2 4 0 1), (.A 4 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 1 2 5 0 3), .split, .split, .split, (.A 5 2 4 0 3), (.A 5 2 4 0 1), (.A 5 2 5 0 3), .split, .split, .split, .split, .split, (.A 1 2 5 0 3), (.A 4 2 5 0 1), (.A 5 2 5 0 3), (.A 0 2 5 0 3), (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN081_15 : wsegOk P nbN081 (nInsideL P nbN081) kN081_15 tN081_15 kN081_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN081_16 : List Tok := [.split, .split, (.A 5 2 5 0 3), .split, (.A 1 2 5 0 3), (.A 5 2 5 0 3), (.A 5 2 5 0 1), .split, (.A 1 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 3), .split, (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, (.A 0 2 5 0 3), (.A 0 6 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, .split, .split, .split, (.A 1 6 5 0 3), .split, (.A 1 2 5 0 3), (.A 0 6 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN081_16 : wsegOk P nbN081 (nInsideL P nbN081) kN081_16 tN081_16 kN081_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN081_17 : List Tok := [(.A 0 6 5 0 3), (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 2 5 0 3), .split, (.A 0 2 5 0 3), (.A 1 2 5 0 3), (.A 4 2 5 0 1), (.A 5 2 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 0 2 5 0 3), (.A 1 6 5 0 3), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN081_17 : wsegOk P nbN081 (nInsideL P nbN081) kN081_17 tN081_17 kN081_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN081_18 : List Tok := [(.A 4 2 5 0 1), .split, (.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), .split, (.A 5 2 5 0 1), (.A 4 6 5 0 1), (.A 5 6 5 0 3), .split, (.A 0 6 5 0 3), .split, (.A 1 6 5 0 3), .split, .split, (.A 0 6 5 0 3), (.D 12), (.D 12), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, (.A 5 2 7 1 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 5 2 5 0 3), (.A 5 2 7 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN081_18 : wsegOk P nbN081 (nInsideL P nbN081) kN081_18 tN081_18 kN081_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN081_19 : List Tok := [(.A 5 2 7 0 3), .split, .split, (.A 1 6 5 0 3), .split, (.A 5 6 5 0 3), (.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3), .split, (.A 5 6 7 1 3), (.D 12), (.D 12), (.D 12), (.A 5 6 7 4 3), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN081_19 : wsegOk P nbN081 (nInsideL P nbN081) kN081_19 tN081_19 kN081_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN081_20 : List Tok := [(.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, .split, (.D 17), (.A 4 2 6 5 7), (.A 4 3 6 4 7), (.A 4 0 6 5 7), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 4 2 6 0 5), .split, (.A 5 2 6 0 3), (.A 4 2 6 4 1), .split, .split, (.A 4 3 6 4 5), .split, .split, (.D 13), (.A 4 2 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN081_20 : wsegOk P nbN081 (nInsideL P nbN081) kN081_20 tN081_20 kN081_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN081_21 : List Tok := [(.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 5 2 6 4 3), (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 5 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN081_21 : wsegOk P nbN081 (nInsideL P nbN081) kN081_21 tN081_21 kN081_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN081_22 : List Tok := [(.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), (.A 5 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 5 0 1), (.A 4 2 6 0 1), (.A 4 2 7 0 1), .split, .split, .split, .split, .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN081_22 : wsegOk P nbN081 (nInsideL P nbN081) kN081_22 tN081_22 kN081_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN081_23 : List Tok := [.split, .split, (.A 0 6 5 0 1), (.A 0 2 5 0 1), (.A 4 6 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 4 2 5 0 1), .split, .split, (.A 4 6 5 0 1), (.A 4 2 5 0 1), .split, (.A 4 6 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 7 4 1), .split, .split, (.A 5 2 7 4 1), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), (.A 4 7 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN081_23 : wsegOk P nbN081 (nInsideL P nbN081) kN081_23 tN081_23 kN081_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN081_24 : List Tok := [(.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN081_24 : wsegOk P nbN081 (nInsideL P nbN081) kN081_24 tN081_24 kN081_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN081_25 : List Tok := [.split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN081_25 : wsegOk P nbN081 (nInsideL P nbN081) kN081_25 tN081_25 kN081_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN081_26 : List Tok := [.split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN081_26 : wsegOk P nbN081 (nInsideL P nbN081) kN081_26 tN081_26 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_0 : wsegOk P nbM081 (nInsideL P nbM081) (rRoots P.rden) tM081_0 kM081_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_1 : List Tok := [(.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 5 3 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), .split, (.D 5), .split, (.A 1 3 4 1 7), .split, (.A 1 2 4 1 7), (.A 0 3 4 1 7), .split, .split, (.A 1 2 4 1 5), (.A 0 3 4 1 5), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 0 2 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_1 : wsegOk P nbM081 (nInsideL P nbM081) kM081_1 tM081_1 kM081_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_2 : List Tok := [.split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 5 3 4 1 7), .split, (.A 5 2 4 1 7), (.A 5 3 6 1 7), .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 0 3 4 1 7), .split, (.A 1 2 4 1 7), (.A 0 3 6 1 7), (.A 0 2 4 1 7), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 4 2 6 1 7), (.A 5 2 6 1 7), (.A 0 2 4 1 7), .split, (.A 5 2 4 1 7), (.A 5 2 6 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_2 : wsegOk P nbM081 (nInsideL P nbM081) kM081_2 tM081_2 kM081_3 = true := by
  decide +kernel

end PackLean.D28.Cub
