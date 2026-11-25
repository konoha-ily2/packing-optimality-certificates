-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey062

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN145_15 : List Tok := [.split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN145_15 : wsegOk P nbN145 (nInsideL P nbN145) kN145_15 tN145_15 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM145_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), (.A 1 7 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), .split, (.D 11), .split, .split, (.D 11), (.D 11), (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM145_0 : wsegOk P nbM145 (nInsideL P nbM145) (rRoots P.rden) tM145_0 kM145_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM145_1 : List Tok := [.split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 1 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), .split, (.D 5), .split, .split, (.A 1 2 4 1 7), (.A 1 3 6 1 7), (.A 5 2 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 1 6 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), (.A 1 3 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM145_1 : wsegOk P nbM145 (nInsideL P nbM145) kM145_1 tM145_1 kM145_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM145_2 : List Tok := [.split, .split, .split, (.A 1 2 4 1 5), (.A 1 2 4 1 5), .split, (.A 1 3 4 1 5), (.A 0 3 4 1 5), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 3 4 1 7), (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 6 1 7), (.A 0 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM145_2 : wsegOk P nbM145 (nInsideL P nbM145) kM145_2 tM145_2 kM145_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM145_3 : List Tok := [(.D 9), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 7), .split, .split, (.A 1 6 5 3 7), (.D 7), .split, .split, (.A 1 6 4 1 7), (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, .split, (.D 7), (.A 0 6 4 1 5), (.A 0 6 4 0 7), .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM145_3 : wsegOk P nbM145 (nInsideL P nbM145) kM145_3 tM145_3 kM145_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM145_4 : List Tok := [(.D 7), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), .split, (.A 0 7 4 2 1), (.D 7), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, (.A 0 6 4 0 7), (.A 0 6 4 0 7), .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM145_4 : wsegOk P nbM145 (nInsideL P nbM145) kM145_4 tM145_4 kM145_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM145_5 : List Tok := [(.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), (.A 0 2 4 0 1), (.A 0 6 4 0 1), .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 18), .split, .split, (.A 0 6 5 0 3), (.D 7), .split, .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM145_5 : wsegOk P nbM145 (nInsideL P nbM145) kM145_5 tM145_5 kM145_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM145_6 : List Tok := [(.A 0 3 4 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, .split, (.D 17), .split, (.D 5), .split, (.A 5 3 6 5 7), (.A 4 3 6 4 7), .split, (.D 5), (.A 4 3 6 4 7), .split, .split, .split, .split, (.D 5), .split, (.A 0 3 6 1 7), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, (.A 0 3 6 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM145_6 : wsegOk P nbM145 (nInsideL P nbM145) kM145_6 tM145_6 kM145_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM145_7 : List Tok := [.split, .split, .split, (.A 0 3 6 1 7), .split, (.A 1 2 6 1 7), (.A 4 3 6 1 7), (.A 0 2 6 0 7), (.A 0 3 6 0 7), .split, .split, .split, (.A 0 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, .split, (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 7), (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM145_7 : wsegOk P nbM145 (nInsideL P nbM145) kM145_7 tM145_7 kM145_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM145_8 : List Tok := [.split, .split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 2 7 4 2 1), .split, .split, (.D 6), .split, .split, (.A 0 3 6 0 5), (.D 6), (.D 6), (.D 6), .split, (.D 9), (.A 2 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, .split, (.A 2 7 4 2 1), .split, .split, (.A 2 7 4 2 1), (.A 0 7 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM145_8 : wsegOk P nbM145 (nInsideL P nbM145) kM145_8 tM145_8 kM145_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM145_9 : List Tok := [(.A 2 7 4 2 1), .split, (.A 0 7 4 0 1), (.A 0 7 4 0 1), .split, (.A 0 3 6 0 5), .split, (.D 6), .split, .split, (.A 0 3 4 0 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), (.A 0 3 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, (.A 0 2 4 0 1), .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 1), .split, (.A 0 3 6 0 1), (.A 0 2 6 0 1), .split, .split, .split, (.A 0 7 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM145_9 : wsegOk P nbM145 (nInsideL P nbM145) kM145_9 tM145_9 kM145_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM145_10 : List Tok := [(.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), (.A 0 7 5 0 1), .split, (.A 0 3 4 0 1), (.A 0 3 5 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), (.A 0 3 6 0 5), (.A 0 3 6 0 1), .split, .split, (.A 0 3 4 0 1), (.D 6), .split, (.A 0 3 5 0 1), .split, (.A 0 3 7 0 1), (.D 6), .split, .split, (.A 2 7 4 2 1), (.D 6), .split, .split, .split, .split, (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM145_10 : wsegOk P nbM145 (nInsideL P nbM145) kM145_10 tM145_10 kM145_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM145_11 : List Tok := [.split, (.A 0 7 4 2 1), (.D 18), .split, (.A 0 7 5 0 1), (.A 0 7 5 0 1), (.D 18), .split, .split, (.D 6), .split, .split, (.A 0 3 5 0 1), (.D 18), (.D 6), (.D 18), .split, .split, (.D 6), .split, .split, .split, (.D 6), .split, .split, (.A 0 3 6 0 5), (.D 6), (.D 6), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM145_11 : wsegOk P nbM145 (nInsideL P nbM145) kM145_11 tM145_11 kM145_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM145_12 : List Tok := [.split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 2 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, .split, (.A 1 2 6 1 7), .split, .split, (.A 5 2 6 1 7), (.A 1 2 6 1 7), (.A 5 2 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 7), .split, (.A 0 2 6 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM145_12 : wsegOk P nbM145 (nInsideL P nbM145) kM145_12 tM145_12 kM145_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM145_13 : List Tok := [.split, .split, (.A 0 2 4 0 7), (.A 0 2 6 0 7), (.A 0 2 6 0 3), .split, .split, (.A 1 2 4 1 3), .split, .split, (.A 1 2 4 1 3), (.A 0 2 4 0 3), .split, (.A 1 2 4 1 3), (.A 0 2 6 1 3), .split, .split, .split, (.A 1 2 6 1 3), (.A 0 2 6 0 3), .split, (.A 1 2 6 1 3), (.A 4 2 6 1 3), (.A 0 2 6 0 3), .split, .split, .split, .split, (.D 4), (.A 5 2 4 1 3), (.D 4), .split, .split, .split, (.D 4), (.A 1 2 5 1 3), .split, (.A 1 2 4 1 3), (.A 1 2 5 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM145_13 : wsegOk P nbM145 (nInsideL P nbM145) kM145_13 tM145_13 kM145_14 = true := by
  decide +kernel

end PackLean.D28.Cub
