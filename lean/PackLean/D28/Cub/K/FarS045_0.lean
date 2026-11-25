-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey045

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN110_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.A 1 6 4 1 5), .split, (.A 1 2 4 1 5), (.A 1 6 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN110_0 : wsegOk P nbN110 (nInsideL P nbN110) (rRoots P.rden) tN110_0 kN110_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN110_1 : List Tok := [.split, (.A 1 2 4 1 7), .split, (.D 4), .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 3 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 5 3 4 1 7), .split, .split, (.A 1 2 4 1 5), .split, .split, .split, (.A 1 3 4 1 5), (.A 0 3 4 1 5), .split, (.A 1 3 4 1 5), (.A 0 3 4 1 5), .split, (.A 0 3 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN110_1 : wsegOk P nbN110 (nInsideL P nbN110) kN110_1 tN110_1 kN110_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN110_2 : List Tok := [.split, .split, (.A 1 2 4 1 5), .split, (.A 0 2 4 1 5), (.A 1 2 4 0 5), (.A 0 3 4 0 5), .split, (.A 1 2 4 1 7), .split, .split, .split, .split, (.A 5 2 4 1 5), (.A 1 2 4 1 5), .split, (.A 4 3 4 1 5), (.A 0 3 4 1 5), .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 1 5), (.A 4 2 4 1 5), .split, (.A 0 2 4 0 5), .split, (.A 1 2 4 0 5), (.A 0 2 4 0 5), .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN110_2 : wsegOk P nbN110 (nInsideL P nbN110) kN110_2 tN110_2 kN110_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN110_3 : List Tok := [.split, .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 0 5), .split, (.A 5 2 4 0 5), (.A 0 2 4 0 5), (.A 5 2 4 0 5), .split, (.A 5 2 4 1 7), (.A 5 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 1 6 4 3 5), .split, .split, (.A 0 7 4 3 5), .split, (.A 1 6 4 1 5), (.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, (.A 1 6 5 2 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN110_3 : wsegOk P nbN110 (nInsideL P nbN110) kN110_3 tN110_3 kN110_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN110_4 : List Tok := [.split, .split, .split, (.A 1 6 4 0 5), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 1 6 4 0 5), (.A 1 2 4 0 5), (.A 1 6 4 0 5), .split, (.A 0 2 4 0 5), .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 7 4 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, (.A 1 6 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN110_4 : wsegOk P nbN110 (nInsideL P nbN110) kN110_4 tN110_4 kN110_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN110_5 : List Tok := [.split, .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 1 6 4 0 5), (.A 1 6 4 0 3), .split, .split, (.A 0 2 4 0 5), .split, (.A 1 2 4 0 5), (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 5 2 4 0 5), .split, .split, (.A 1 2 4 0 5), (.A 0 2 4 0 5), (.A 1 2 4 0 1), .split, (.A 1 2 4 0 3), (.A 5 2 4 0 1), .split, .split, .split, (.A 1 2 4 0 1), .split, .split, (.A 1 6 4 0 1), (.A 0 2 4 0 1), (.A 1 2 4 0 1), (.A 0 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN110_5 : wsegOk P nbN110 (nInsideL P nbN110) kN110_5 tN110_5 kN110_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN110_6 : List Tok := [.split, .split, (.A 1 2 4 0 3), (.A 1 2 4 0 3), .split, (.A 1 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 0 6 4 0 1), (.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 1), (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 2 3), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, (.A 0 3 6 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN110_6 : wsegOk P nbN110 (nInsideL P nbN110) kN110_6 tN110_6 kN110_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN110_7 : List Tok := [(.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, (.A 4 3 6 1 5), .split, (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 5), (.A 0 3 4 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, .split, (.A 4 3 6 0 7), .split, (.A 5 2 6 1 7), (.A 4 3 6 0 7), .split, .split, .split, (.A 4 3 6 0 5), .split, .split, (.A 4 2 4 0 5), (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN110_7 : wsegOk P nbN110 (nInsideL P nbN110) kN110_7 tN110_7 kN110_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN110_8 : List Tok := [(.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 4 1 2 4 7), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), (.A 4 1 6 0 5), .split, .split, .split, .split, (.D 9), (.A 0 7 6 2 5), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, .split, (.A 0 2 4 0 5), (.A 0 3 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN110_8 : wsegOk P nbN110 (nInsideL P nbN110) kN110_8 tN110_8 kN110_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN110_9 : List Tok := [.split, (.A 0 2 4 0 5), .split, (.A 4 3 6 0 5), .split, .split, (.A 0 3 4 0 5), (.A 4 3 4 0 5), (.A 4 2 4 0 5), .split, .split, .split, (.A 0 3 4 0 5), (.A 0 3 4 0 1), (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 0 1), .split, .split, .split, .split, .split, (.A 4 2 4 0 5), .split, .split, (.A 0 2 4 0 5), (.A 4 2 4 0 5), (.A 4 2 4 0 1), .split, (.A 4 2 6 0 5), (.A 4 2 4 0 1), .split, .split, (.A 5 2 4 0 1), (.A 4 2 4 0 1), (.A 4 2 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN110_9 : wsegOk P nbN110 (nInsideL P nbN110) kN110_9 tN110_9 kN110_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN110_10 : List Tok := [.split, (.A 0 2 4 0 1), .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1), .split, .split, (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, (.A 4 3 6 0 1), (.A 4 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), .split, .split, (.A 4 3 4 0 1), .split, (.A 4 3 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN110_10 : wsegOk P nbN110 (nInsideL P nbN110) kN110_10 tN110_10 kN110_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN110_11 : List Tok := [(.A 4 3 5 0 1), (.A 0 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, (.A 0 7 5 0 1), (.D 18), .split, (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 1 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN110_11 : wsegOk P nbN110 (nInsideL P nbN110) kN110_11 tN110_11 kN110_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN110_12 : List Tok := [.split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), (.A 5 2 4 1 3), (.A 5 2 6 1 7), .split, .split, (.A 5 0 4 1 3), .split, .split, (.A 5 2 5 1 3), (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN110_12 : wsegOk P nbN110 (nInsideL P nbN110) kN110_12 tN110_12 kN110_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN110_13 : List Tok := [.split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), .split, (.A 5 2 7 5 3), (.D 15), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN110_13 : wsegOk P nbN110 (nInsideL P nbN110) kN110_13 tN110_13 kN110_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN110_14 : List Tok := [.split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), (.A 1 2 4 0 1), (.A 1 2 5 0 3), .split, (.A 1 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 1 6 5 0 3), .split, (.A 1 2 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 1 6 5 0 1), (.A 0 2 5 0 1), (.A 0 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN110_14 : wsegOk P nbN110 (nInsideL P nbN110) kN110_14 tN110_14 kN110_15 = true := by
  decide +kernel

end PackLean.D28.Cub
