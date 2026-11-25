-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey041

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, .split, (.A 1 6 4 1 5), (.A 1 7 4 1 5), .split, (.A 1 6 4 1 5), .split, (.A 1 2 4 1 5), (.A 1 6 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_0 : wsegOk P nbN102 (nInsideL P nbN102) (rRoots P.rden) tN102_0 kN102_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_1 : List Tok := [(.D 4), .split, (.A 1 2 4 1 7), .split, (.D 4), .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 3 4 1 7), .split, .split, .split, .split, (.D 5), (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 5 2 4 1 7), .split, (.D 5), .split, .split, (.A 5 3 4 1 7), (.A 4 3 4 1 5), (.A 4 3 4 1 7), .split, .split, (.A 1 2 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_1 : wsegOk P nbN102 (nInsideL P nbN102) kN102_1 tN102_1 kN102_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_2 : List Tok := [.split, .split, (.A 0 3 4 1 5), .split, .split, .split, (.D 5), .split, (.A 1 2 4 1 5), (.A 0 3 4 1 5), (.A 0 2 4 1 5), (.A 0 3 4 1 5), (.A 0 3 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, .split, .split, .split, (.A 5 2 4 1 5), (.A 4 3 4 1 5), (.A 5 2 4 1 5), (.A 1 2 4 1 5), (.A 4 3 4 1 5), (.A 4 2 4 1 5), (.A 0 2 4 0 5), .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_2 : wsegOk P nbN102 (nInsideL P nbN102) kN102_2 tN102_2 kN102_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_3 : List Tok := [.split, .split, .split, (.A 5 2 4 1 7), (.A 4 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 0 5), (.A 4 2 4 0 5), (.A 5 2 4 0 5), .split, (.A 5 2 4 1 7), (.A 5 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, (.A 0 7 4 3 5), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, (.A 1 6 5 2 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_3 : wsegOk P nbN102 (nInsideL P nbN102) kN102_3 tN102_3 kN102_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_4 : List Tok := [.split, .split, .split, .split, (.A 1 6 4 1 7), (.A 1 6 4 2 1), .split, .split, .split, (.A 0 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, .split, (.A 1 6 4 0 5), (.A 1 6 4 0 5), (.A 1 2 4 0 5), (.A 1 6 4 0 5), .split, (.A 0 2 4 0 5), .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 7 4 0 1), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 7), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_4 : wsegOk P nbN102 (nInsideL P nbN102) kN102_4 tN102_4 kN102_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_5 : List Tok := [.split, .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 1 6 4 0 5), .split, (.A 1 6 4 0 3), .split, (.A 1 6 4 0 1), (.A 1 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 7), .split, .split, (.A 1 6 4 0 3), .split, (.A 1 2 4 0 3), (.A 1 6 4 0 3), (.A 1 6 4 0 3), .split, .split, .split, .split, (.A 5 2 4 0 7), (.A 1 2 4 0 3), .split, (.A 5 2 4 0 5), .split, (.A 0 2 4 0 5), .split, .split, (.A 5 2 4 0 1), (.A 1 2 4 0 1), (.A 4 2 4 0 1), .split, (.A 5 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_5 : wsegOk P nbN102 (nInsideL P nbN102) kN102_5 tN102_5 kN102_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_6 : List Tok := [(.A 5 2 4 0 1), .split, (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 3), .split, (.A 1 2 4 0 1), (.A 1 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 4 0 1), (.A 0 6 4 0 1), .split, .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 2 3), .split, .split, .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_6 : wsegOk P nbN102 (nInsideL P nbN102) kN102_6 tN102_6 kN102_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_7 : List Tok := [.split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, (.A 4 3 6 1 5), .split, (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 5), (.A 0 3 4 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, .split, .split, (.A 4 3 6 0 5), .split, .split, (.A 4 2 4 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_7 : wsegOk P nbN102 (nInsideL P nbN102) kN102_7 tN102_7 kN102_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_8 : List Tok := [(.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 4 1 2 4 7), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), (.A 0 7 6 2 5), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 4 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, .split, (.A 0 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_8 : wsegOk P nbN102 (nInsideL P nbN102) kN102_8 tN102_8 kN102_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_9 : List Tok := [(.A 4 3 4 0 5), .split, .split, (.A 4 2 4 0 5), .split, (.A 0 2 4 0 5), (.A 4 2 4 0 5), (.A 4 3 4 0 5), .split, .split, .split, (.A 0 3 4 0 5), (.A 0 3 4 0 1), (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 0 1), .split, .split, (.A 4 2 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1), .split, .split, (.A 4 2 4 0 1), .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_9 : wsegOk P nbN102 (nInsideL P nbN102) kN102_9 tN102_9 kN102_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_10 : List Tok := [.split, .split, (.A 0 2 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1), (.A 0 7 5 0 1), (.D 18), (.A 4 3 5 2 1), .split, .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_10 : wsegOk P nbN102 (nInsideL P nbN102) kN102_10 tN102_10 kN102_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_11 : List Tok := [(.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 1 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_11 : wsegOk P nbN102 (nInsideL P nbN102) kN102_11 tN102_11 kN102_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_12 : List Tok := [(.A 5 2 4 1 3), (.A 5 2 6 1 7), .split, .split, (.A 5 0 4 1 3), .split, .split, (.A 5 2 5 1 3), (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), (.A 5 0 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), .split, (.A 5 2 7 5 3), (.D 15), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_12 : wsegOk P nbN102 (nInsideL P nbN102) kN102_12 tN102_12 kN102_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_13 : List Tok := [(.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 1), .split, .split, (.A 1 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 1 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_13 : wsegOk P nbN102 (nInsideL P nbN102) kN102_13 tN102_13 kN102_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_14 : List Tok := [.split, (.A 5 2 4 0 1), .split, (.A 4 2 5 0 1), (.A 5 2 5 0 1), .split, (.A 1 2 5 0 3), (.A 5 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), .split, (.A 1 2 5 0 1), (.A 0 6 5 0 1), (.A 1 6 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 1 6 5 0 3), .split, (.A 1 2 5 0 1), .split, .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 1 6 5 0 1), (.A 0 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_14 : wsegOk P nbN102 (nInsideL P nbN102) kN102_14 tN102_14 kN102_15 = true := by
  decide +kernel

end PackLean.D28.Cub
