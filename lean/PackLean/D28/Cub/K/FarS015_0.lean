-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey015

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN050_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN050_0 : wsegOk P nbN050 (nInsideL P nbN050) (rRoots P.rden) tN050_0 kN050_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN050_1 : List Tok := [.split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 4 3 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 5), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 7), (.A 5 2 4 1 7), .split, (.D 5), .split, .split, (.A 0 3 4 1 7), (.A 4 3 4 1 5), (.A 4 3 4 1 7), (.A 0 2 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN050_1 : wsegOk P nbN050 (nInsideL P nbN050) kN050_1 tN050_1 kN050_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN050_2 : List Tok := [.split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 4 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, (.A 4 2 4 1 7), (.A 0 2 4 0 5), .split, (.A 5 2 4 1 7), (.A 4 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, (.A 1 6 4 3 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN050_2 : wsegOk P nbN050 (nInsideL P nbN050) kN050_2 tN050_2 kN050_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN050_3 : List Tok := [(.A 0 6 4 2 1), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7), (.A 1 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN050_3 : wsegOk P nbN050 (nInsideL P nbN050) kN050_3 tN050_3 kN050_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN050_4 : List Tok := [(.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 0 2 4 0 7), (.A 1 2 4 0 3), .split, .split, (.A 0 6 4 0 3), .split, (.A 0 2 4 0 3), (.A 0 6 4 0 3), .split, (.A 1 6 4 0 3), (.A 0 2 4 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), (.A 0 2 4 0 3), .split, (.A 4 2 4 0 5), .split, (.A 0 2 4 0 5), (.A 4 2 4 0 1), .split, .split, (.A 4 2 4 0 7), .split, (.A 0 2 4 0 3), (.A 4 2 4 0 3), (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN050_4 : wsegOk P nbN050 (nInsideL P nbN050) kN050_4 tN050_4 kN050_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN050_5 : List Tok := [.split, (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, (.A 4 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN050_5 : wsegOk P nbN050 (nInsideL P nbN050) kN050_5 tN050_5 kN050_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN050_6 : List Tok := [.split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), (.A 4 3 2 4 7), .split, .split, .split, (.A 4 3 6 1 5), (.A 0 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, .split, .split, (.A 4 3 6 0 5), .split, .split, (.A 4 2 4 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN050_6 : wsegOk P nbN050 (nInsideL P nbN050) kN050_6 tN050_6 kN050_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN050_7 : List Tok := [.split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 0 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 4 2 4 0 5), (.A 4 3 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN050_7 : wsegOk P nbN050 (nInsideL P nbN050) kN050_7 tN050_7 kN050_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN050_8 : List Tok := [.split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 0 1), .split, .split, (.A 4 2 4 0 1), .split, .split, .split, (.A 4 2 4 0 1), (.A 0 2 4 0 1), (.A 4 2 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 0 2 5 0 1), (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN050_8 : wsegOk P nbN050 (nInsideL P nbN050) kN050_8 tN050_8 kN050_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN050_9 : List Tok := [.split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, .split, (.A 4 3 5 0 1), (.A 4 2 5 0 1), (.A 4 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), (.A 4 7 5 0 1), (.D 18), (.A 4 3 5 2 1), .split, .split, (.D 6), .split, (.A 4 3 7 0 5), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN050_9 : wsegOk P nbN050 (nInsideL P nbN050) kN050_9 tN050_9 kN050_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN050_10 : List Tok := [.split, (.A 1 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 4 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), (.A 5 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 1 7), (.A 5 2 6 0 7), (.A 5 2 6 1 3), .split, .split, (.A 5 0 4 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN050_10 : wsegOk P nbN050 (nInsideL P nbN050) kN050_10 tN050_10 kN050_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN050_11 : List Tok := [(.A 5 2 5 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, .split, (.A 7 0 6 5 3), (.D 15), .split, .split, .split, (.D 4), (.A 5 0 7 1 3), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN050_11 : wsegOk P nbN050 (nInsideL P nbN050) kN050_11 tN050_11 kN050_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN050_12 : List Tok := [.split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), (.A 1 6 5 0 3), .split, (.A 1 2 4 0 3), .split, .split, (.A 1 6 4 0 3), (.A 0 2 4 0 3), .split, (.A 1 6 5 0 3), (.A 0 2 5 0 3), (.A 1 2 5 0 3), .split, .split, (.A 4 2 4 0 3), (.A 5 2 4 0 3), .split, .split, (.A 0 2 4 0 3), (.A 4 2 4 0 1), .split, .split, (.A 5 2 5 0 3), .split, .split, (.A 0 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN050_12 : wsegOk P nbN050 (nInsideL P nbN050) kN050_12 tN050_12 kN050_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN050_13 : List Tok := [(.A 4 2 5 0 3), (.A 5 2 5 0 3), (.A 4 2 5 0 3), .split, (.A 5 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 3), .split, (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, (.A 0 2 5 0 3), (.A 0 6 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, .split, .split, .split, (.A 0 6 5 0 3), .split, (.A 4 2 5 0 3), (.A 0 6 5 0 3), .split, (.A 0 6 5 0 3), (.A 4 2 5 0 3), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN050_13 : wsegOk P nbN050 (nInsideL P nbN050) kN050_13 tN050_13 kN050_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN050_14 : List Tok := [.split, (.A 4 2 5 0 1), (.A 4 6 5 0 1), (.A 0 6 5 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 4 6 5 0 3), (.A 4 2 5 0 1), .split, (.A 5 6 5 0 3), .split, (.A 5 2 5 0 3), (.A 4 6 5 0 3), (.A 4 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, .split, (.A 1 6 5 1 3), (.A 1 6 5 1 3), (.A 5 6 7 1 3), (.A 1 6 5 0 3), .split, (.A 5 2 7 0 3), (.A 5 6 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN050_14 : wsegOk P nbN050 (nInsideL P nbN050) kN050_14 tN050_14 kN050_15 = true := by
  decide +kernel

end PackLean.D28.Cub
