-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey029

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN080_28 : List Tok := [(.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN080_28 : wsegOk P nbN080 (nInsideL P nbN080) kN080_28 tN080_28 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_0 : wsegOk P nbM080 (nInsideL P nbM080) (rRoots P.rden) tM080_0 kM080_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_1 : List Tok := [(.A 5 2 4 1 7), .split, (.D 17), (.A 5 3 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), .split, (.D 5), .split, (.A 1 3 4 1 7), .split, (.A 1 2 4 1 7), (.A 0 3 4 1 7), .split, .split, (.A 1 2 4 1 5), (.A 0 3 4 1 5), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_1 : wsegOk P nbM080 (nInsideL P nbM080) kM080_1 tM080_1 kM080_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_2 : List Tok := [.split, .split, (.A 5 3 4 1 7), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 0 3 4 1 7), (.A 4 2 4 1 7), (.A 0 2 4 1 7), .split, (.A 5 2 4 1 7), (.A 4 2 6 1 7), .split, (.A 5 2 4 1 7), (.A 5 2 6 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 4 2 4 0 7), .split, (.A 5 2 4 1 7), (.A 4 2 6 0 7), (.A 0 2 4 0 7), .split, .split, .split, (.D 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_2 : wsegOk P nbM080 (nInsideL P nbM080) kM080_2 tM080_2 kM080_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_3 : List Tok := [.split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, (.A 0 7 4 3 5), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, (.D 7), .split, (.A 1 6 4 3 7), (.D 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, (.A 1 6 4 1 5), (.A 1 6 4 0 7), .split, (.D 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_3 : wsegOk P nbM080 (nInsideL P nbM080) kM080_3 tM080_3 kM080_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_4 : List Tok := [.split, .split, (.A 0 6 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7), (.A 1 6 4 0 3), .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_4 : wsegOk P nbM080 (nInsideL P nbM080) kM080_4 tM080_4 kM080_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_5 : List Tok := [.split, .split, (.A 0 2 4 0 5), (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_5 : wsegOk P nbM080 (nInsideL P nbM080) kM080_5 tM080_5 kM080_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_6 : List Tok := [.split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), .split, (.A 0 3 6 1 7), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, .split, .split, (.A 4 3 6 1 7), .split, .split, (.A 0 3 6 1 7), (.A 4 3 6 0 7), (.A 4 3 6 0 7), (.A 4 3 6 0 7), .split, (.A 4 2 6 1 7), (.A 4 3 6 0 7), .split, .split, .split, .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_6 : wsegOk P nbM080 (nInsideL P nbM080) kM080_6 tM080_6 kM080_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_7 : List Tok := [(.A 0 2 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), .split, .split, (.A 4 2 6 0 7), .split, (.A 0 2 6 0 5), .split, .split, (.A 4 2 6 0 7), (.A 0 2 6 0 5), (.A 4 2 6 0 5), .split, (.A 4 3 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_7 : wsegOk P nbM080 (nInsideL P nbM080) kM080_7 tM080_7 kM080_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_8 : List Tok := [.split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 5), (.A 0 2 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_8 : wsegOk P nbM080 (nInsideL P nbM080) kM080_8 tM080_8 kM080_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_9 : List Tok := [(.A 0 2 4 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, (.A 0 3 6 0 1), .split, (.A 0 2 6 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), .split, .split, (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 3 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_9 : wsegOk P nbM080 (nInsideL P nbM080) kM080_9 tM080_9 kM080_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_10 : List Tok := [(.A 4 3 5 0 1), (.A 0 3 5 0 1), .split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 1), .split, (.A 0 3 6 0 1), (.A 4 3 7 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, (.A 0 7 5 0 1), (.D 18), .split, .split, (.D 6), (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, (.A 4 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_10 : wsegOk P nbM080 (nInsideL P nbM080) kM080_10 tM080_10 kM080_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_11 : List Tok := [.split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 5 2 6 1 7), .split, .split, .split, (.A 5 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_11 : wsegOk P nbM080 (nInsideL P nbM080) kM080_11 tM080_11 kM080_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_12 : List Tok := [.split, .split, (.A 1 2 4 0 7), (.A 0 2 4 0 7), (.A 1 2 4 0 3), .split, (.A 4 2 6 0 7), .split, .split, (.A 0 2 4 0 7), .split, (.A 4 2 6 0 7), .split, (.A 0 2 4 0 7), (.A 0 2 6 0 3), .split, (.A 4 2 4 0 3), (.A 4 2 6 0 3), .split, (.A 5 2 4 0 3), .split, (.A 5 2 6 0 3), (.A 4 2 6 0 3), .split, (.A 5 2 4 1 3), (.A 5 2 6 0 3), .split, .split, (.A 5 0 4 1 3), .split, (.A 1 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_12 : wsegOk P nbM080 (nInsideL P nbM080) kM080_12 tM080_12 kM080_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_13 : List Tok := [.split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_13 : wsegOk P nbM080 (nInsideL P nbM080) kM080_13 tM080_13 kM080_14 = true := by
  decide +kernel

end PackLean.D28.Cub
