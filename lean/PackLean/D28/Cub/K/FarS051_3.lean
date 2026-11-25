-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey051

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN124_1 : List Tok := [.split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), (.A 4 2 4 5 7), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 1 7), .split, .split, .split, (.A 4 2 4 1 5), (.A 0 2 4 1 5), .split, (.A 4 3 4 1 5), (.A 0 3 4 1 5), .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 1 5), (.A 4 2 4 1 5), .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN124_1 : wsegOk P nbN124 (nInsideL P nbN124) kN124_1 tN124_1 kN124_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN124_2 : List Tok := [(.A 5 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 1 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, (.A 1 6 5 2 7), (.D 7), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, .split, (.A 0 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, .split, (.A 1 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), (.A 1 2 4 0 5), (.A 1 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN124_2 : wsegOk P nbN124 (nInsideL P nbN124) kN124_2 tN124_2 kN124_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN124_3 : List Tok := [.split, .split, (.A 0 2 4 0 5), .split, (.A 4 2 4 0 5), (.A 4 2 4 0 5), .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 7 4 0 1), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 1 6 4 0 7), (.A 1 6 4 0 7), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 2 4 0 7), (.A 1 6 4 0 3), .split, (.A 4 2 4 0 5), .split, .split, .split, (.A 0 2 4 0 5), (.A 0 6 4 0 1), .split, (.A 4 2 4 0 5), .split, (.A 0 6 4 0 1), (.A 4 6 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN124_3 : wsegOk P nbN124 (nInsideL P nbN124) kN124_3 tN124_3 kN124_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN124_4 : List Tok := [.split, .split, (.A 5 2 4 0 1), .split, (.A 0 6 4 0 1), (.A 5 6 4 0 1), (.A 4 2 4 0 1), .split, .split, (.A 5 2 4 0 7), (.A 5 6 4 0 3), (.A 5 2 4 0 1), .split, .split, (.A 1 6 4 0 1), (.A 0 6 4 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 6 4 0 1), (.A 4 6 4 0 1), (.A 5 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 5 0 3), .split, .split, .split, .split, (.D 5), (.A 0 3 6 1 5), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN124_4 : wsegOk P nbN124 (nInsideL P nbN124) kN124_4 tN124_4 kN124_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN124_5 : List Tok := [.split, (.D 6), .split, (.A 4 3 6 0 5), (.D 2), .split, .split, (.A 4 3 2 4 7), .split, (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 6 1 2 4 7), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 4 3 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN124_5 : wsegOk P nbN124 (nInsideL P nbN124) kN124_5 tN124_5 kN124_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN124_6 : List Tok := [(.A 0 7 4 2 1), (.A 4 3 6 0 5), .split, .split, .split, .split, .split, (.A 4 3 4 0 5), (.A 4 3 4 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, .split, .split, .split, (.A 4 7 4 0 1), .split, (.A 4 7 4 0 1), (.A 4 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, .split, (.A 4 2 4 0 1), .split, (.A 4 7 5 0 1), (.A 4 6 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), (.A 4 7 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN124_6 : wsegOk P nbN124 (nInsideL P nbN124) kN124_6 tN124_6 kN124_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN124_7 : List Tok := [(.D 18), (.A 4 3 5 2 1), .split, (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 4 2 6 5 7), .split, (.A 5 0 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), .split, (.D 4), .split, (.D 17), (.A 7 0 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN124_7 : wsegOk P nbN124 (nInsideL P nbN124) kN124_7 tN124_7 kN124_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN124_8 : List Tok := [.split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4), (.A 5 0 7 1 3), .split, (.A 7 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 6 5 0 3), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN124_8 : wsegOk P nbN124 (nInsideL P nbN124) kN124_8 tN124_8 kN124_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN124_9 : List Tok := [.split, (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), (.A 5 6 5 0 1), .split, (.A 1 6 5 0 3), (.A 5 6 5 0 3), .split, .split, (.A 5 6 5 1 3), (.A 1 6 5 0 3), (.A 5 6 7 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 6 5 0 3), (.A 0 6 5 0 1), (.D 12), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, (.A 5 6 7 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN124_9 : wsegOk P nbN124 (nInsideL P nbN124) kN124_9 tN124_9 kN124_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN124_10 : List Tok := [(.D 12), (.D 12), (.A 5 6 7 4 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), (.A 5 2 6 0 1), .split, .split, (.A 4 3 6 4 5), .split, .split, (.D 13), (.A 4 2 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN124_10 : wsegOk P nbN124 (nInsideL P nbN124) kN124_10 tN124_10 kN124_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN124_11 : List Tok := [(.D 13), (.A 4 2 6 4 5), .split, .split, (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), (.A 5 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN124_11 : wsegOk P nbN124 (nInsideL P nbN124) kN124_11 tN124_11 kN124_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN124_12 : List Tok := [.split, .split, (.D 13), .split, .split, .split, (.A 7 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), (.A 5 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, (.A 5 2 7 0 1), .split, .split, .split, (.A 5 2 5 0 1), (.A 4 6 5 0 1), (.A 4 2 5 0 1), (.A 5 2 5 0 1), (.A 4 2 7 4 1), (.A 5 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 4 6 5 0 1), (.D 12), (.A 4 7 5 0 1), (.D 12), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN124_12 : wsegOk P nbN124 (nInsideL P nbN124) kN124_12 tN124_12 kN124_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN124_13 : List Tok := [(.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 5 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN124_13 : wsegOk P nbN124 (nInsideL P nbN124) kN124_13 tN124_13 kN124_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN124_14 : List Tok := [.split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN124_14 : wsegOk P nbN124 (nInsideL P nbN124) kN124_14 tN124_14 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM124_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), (.A 0 7 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM124_0 : wsegOk P nbM124 (nInsideL P nbM124) (rRoots P.rden) tM124_0 kM124_1 = true := by
  decide +kernel

end PackLean.D28.Cub
