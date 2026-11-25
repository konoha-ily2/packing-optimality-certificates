-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey060

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN141_15 : List Tok := [.split, (.A 0 6 5 0 1), .split, (.A 0 6 5 0 1), (.A 4 2 5 0 1), .split, (.A 1 6 5 0 1), .split, (.A 4 2 5 0 1), .split, (.A 4 6 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 5 2 5 0 1), .split, .split, (.A 1 6 5 0 1), .split, (.A 5 2 5 0 1), .split, (.A 4 2 5 0 1), (.D 12), .split, (.A 1 6 5 0 1), (.A 5 2 5 0 1), (.A 5 2 5 0 1), (.A 4 2 7 4 1), .split, .split, (.A 5 2 7 4 1), .split, .split, (.A 5 2 5 4 1), (.A 5 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN141_15 : wsegOk P nbN141 (nInsideL P nbN141) kN141_15 tN141_15 kN141_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN141_16 : List Tok := [(.D 12), (.A 5 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), .split, (.A 4 3 5 0 1), (.D 18), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 5 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, (.A 5 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN141_16 : wsegOk P nbN141 (nInsideL P nbN141) kN141_16 tN141_16 kN141_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN141_17 : List Tok := [(.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN141_17 : wsegOk P nbN141 (nInsideL P nbN141) kN141_17 tN141_17 kN141_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN141_18 : List Tok := [(.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN141_18 : wsegOk P nbN141 (nInsideL P nbN141) kN141_18 tN141_18 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM141_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), (.A 1 7 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM141_0 : wsegOk P nbM141 (nInsideL P nbM141) (rRoots P.rden) tM141_0 kM141_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM141_1 : List Tok := [.split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 5 3 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), (.A 1 3 4 1 7), .split, .split, (.A 1 2 4 1 5), (.A 1 3 4 1 5), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM141_1 : wsegOk P nbM141 (nInsideL P nbM141) kM141_1 tM141_1 kM141_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM141_2 : List Tok := [.split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 3 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 3 6 1 7), (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 6 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, .split, (.D 7), (.D 9), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM141_2 : wsegOk P nbM141 (nInsideL P nbM141) kM141_2 tM141_2 kM141_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM141_3 : List Tok := [.split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 7), .split, .split, (.A 1 6 5 3 7), (.D 7), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, .split, (.D 7), .split, (.A 1 6 4 1 5), (.D 7), .split, (.A 1 6 4 1 7), (.A 0 6 4 0 7), .split, (.D 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM141_3 : wsegOk P nbM141 (nInsideL P nbM141) kM141_3 tM141_3 kM141_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM141_4 : List Tok := [(.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, .split, (.A 1 6 4 0 7), (.A 0 6 4 0 7), .split, .split, (.A 1 2 4 1 7), (.A 0 6 4 0 7), .split, .split, (.A 1 2 4 0 7), .split, (.A 1 2 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 2 4 0 3), (.A 0 6 4 0 3), .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM141_4 : wsegOk P nbM141 (nInsideL P nbM141) kM141_4 tM141_4 kM141_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM141_5 : List Tok := [.split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 1), (.A 0 2 4 0 1), (.A 0 6 4 0 1), .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 18), .split, .split, (.A 0 6 5 0 3), (.D 7), .split, .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM141_5 : wsegOk P nbM141 (nInsideL P nbM141) kM141_5 tM141_5 kM141_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM141_6 : List Tok := [.split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 0 3 4 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, .split, (.D 17), .split, (.D 5), .split, (.A 5 3 6 5 7), (.A 4 3 6 4 7), .split, (.D 5), (.A 4 3 6 4 7), .split, .split, .split, .split, (.D 5), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM141_6 : wsegOk P nbM141 (nInsideL P nbM141) kM141_6 tM141_6 kM141_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM141_7 : List Tok := [.split, (.A 0 3 6 1 5), .split, (.A 0 3 6 1 7), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, .split, .split, (.A 1 3 6 1 7), (.A 0 3 6 0 7), (.A 0 3 6 0 7), .split, .split, (.A 5 3 6 1 7), (.A 0 2 6 0 7), (.A 4 3 6 0 7), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), .split, .split, (.A 0 2 6 0 7), (.A 0 2 6 0 5), .split, .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM141_7 : wsegOk P nbM141 (nInsideL P nbM141) kM141_7 tM141_7 kM141_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM141_8 : List Tok := [(.A 0 2 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, (.A 4 3 6 0 5), (.A 0 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, .split, (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 2 7 4 2 1), .split, .split, (.D 6), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM141_8 : wsegOk P nbM141 (nInsideL P nbM141) kM141_8 tM141_8 kM141_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM141_9 : List Tok := [(.D 6), .split, (.D 9), (.A 2 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), .split, (.D 6), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), (.A 0 3 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 2 4 0 1), .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 1), .split, (.A 0 3 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM141_9 : wsegOk P nbM141 (nInsideL P nbM141) kM141_9 tM141_9 kM141_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM141_10 : List Tok := [(.A 0 2 6 0 1), .split, .split, .split, (.A 0 7 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 5 0 1), (.A 0 3 5 0 1), .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), .split, .split, (.A 0 3 4 0 1), (.D 6), .split, (.A 0 3 5 0 1), (.A 0 3 7 0 1), .split, .split, (.A 2 7 4 2 1), (.D 6), .split, .split, (.A 0 7 5 0 1), (.D 18), .split, .split, (.D 6), .split, (.A 0 3 5 2 1), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM141_10 : wsegOk P nbM141 (nInsideL P nbM141) kM141_10 tM141_10 kM141_11 = true := by
  decide +kernel

end PackLean.D28.Cub
