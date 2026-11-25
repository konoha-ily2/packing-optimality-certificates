-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey036

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN092_30 : List Tok := [.split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN092_30 : wsegOk P nbN092 (nInsideL P nbN092) kN092_30 tN092_30 kN092_31 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN092_31 : List Tok := [.split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN092_31 : wsegOk P nbN092 (nInsideL P nbN092) kN092_31 tN092_31 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), (.A 1 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 5 2 4 5 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_0 : wsegOk P nbM092 (nInsideL P nbM092) (rRoots P.rden) tM092_0 kM092_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_1 : List Tok := [.split, (.D 17), (.A 5 3 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 5), (.A 1 2 4 1 7), .split, (.D 5), (.A 1 3 4 1 7), .split, .split, (.A 1 2 4 1 5), (.A 1 3 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, (.A 1 3 4 1 5), .split, (.A 1 2 4 1 7), (.A 0 2 4 1 5), (.A 0 2 4 0 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, .split, (.A 5 3 4 1 7), (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_1 : wsegOk P nbM092 (nInsideL P nbM092) kM092_1 tM092_1 kM092_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_2 : List Tok := [.split, (.A 5 3 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 3 4 1 7), .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 6 1 7), (.A 5 2 4 1 7), (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 7), (.A 1 2 4 1 7), (.A 0 2 4 0 5), (.A 1 2 4 1 7), (.A 0 2 4 0 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_2 : wsegOk P nbM092 (nInsideL P nbM092) kM092_2 tM092_2 kM092_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_3 : List Tok := [.split, (.A 5 2 6 1 7), (.A 1 2 4 0 7), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 0 7), (.A 0 2 4 0 7), .split, (.A 1 2 4 0 7), .split, .split, (.A 1 2 4 0 7), (.A 5 2 6 0 7), (.A 0 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, .split, (.D 7), (.D 9), .split, (.A 1 6 4 1 5), (.A 0 7 4 0 5), .split, (.D 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_3 : wsegOk P nbM092 (nInsideL P nbM092) kM092_3 tM092_3 kM092_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_4 : List Tok := [(.D 7), .split, .split, .split, .split, (.D 7), (.A 1 6 4 2 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7), .split, (.D 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 1 6 4 0 5), (.A 1 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_4 : wsegOk P nbM092 (nInsideL P nbM092) kM092_4 tM092_4 kM092_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_5 : List Tok := [(.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 7), .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 1 2 4 0 5), (.A 1 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 7), .split, .split, (.A 1 6 4 0 3), .split, (.A 0 2 4 0 3), (.A 0 6 4 0 3), .split, (.A 1 6 4 0 3), (.A 0 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_5 : wsegOk P nbM092 (nInsideL P nbM092) kM092_5 tM092_5 kM092_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_6 : List Tok := [.split, .split, (.A 0 2 4 0 5), (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_6 : wsegOk P nbM092 (nInsideL P nbM092) kM092_6 tM092_6 kM092_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_7 : List Tok := [.split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), .split, .split, (.D 5), .split, (.A 0 3 6 1 5), .split, (.A 0 3 6 1 7), (.A 4 3 6 0 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, .split, .split, (.A 4 3 6 1 7), .split, .split, .split, (.A 4 3 6 1 7), .split, .split, (.A 0 3 6 1 7), (.A 4 3 6 0 7), (.A 4 3 6 1 7), (.A 4 3 6 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_7 : wsegOk P nbM092 (nInsideL P nbM092) kM092_7 tM092_7 kM092_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_8 : List Tok := [(.A 4 3 6 0 7), (.A 4 3 6 0 7), .split, (.A 4 2 6 1 7), (.A 4 3 6 0 7), .split, .split, .split, .split, .split, .split, .split, (.A 0 3 6 0 5), .split, .split, (.A 0 3 6 0 7), (.A 0 2 6 0 5), (.A 0 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, .split, .split, (.A 4 2 6 0 7), (.A 0 2 6 0 7), (.A 4 3 6 0 5), (.A 4 2 6 0 7), (.A 0 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 0 2 4 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_8 : wsegOk P nbM092 (nInsideL P nbM092) kM092_8 tM092_8 kM092_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_9 : List Tok := [(.A 0 3 6 0 5), .split, .split, (.A 4 2 6 0 7), .split, (.A 0 2 6 0 5), .split, .split, (.A 4 2 6 0 7), (.A 0 2 6 0 5), (.A 4 2 6 0 5), .split, (.A 4 3 6 0 5), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, .split, (.D 2), (.A 0 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), (.A 4 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_9 : wsegOk P nbM092 (nInsideL P nbM092) kM092_9 tM092_9 kM092_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_10 : List Tok := [.split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 5), (.A 0 2 6 0 1), (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_10 : wsegOk P nbM092 (nInsideL P nbM092) kM092_10 tM092_10 kM092_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_11 : List Tok := [(.A 0 3 6 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, (.A 0 3 6 0 1), (.A 0 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), .split, .split, (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 3 5 0 1), (.A 0 3 5 0 1), (.A 0 3 5 0 1), .split, .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_11 : wsegOk P nbM092 (nInsideL P nbM092) kM092_11 tM092_11 kM092_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_12 : List Tok := [(.A 4 3 6 0 1), .split, (.A 0 3 6 0 1), .split, (.A 4 3 5 0 1), (.A 4 3 7 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, (.A 0 7 5 2 1), .split, .split, (.D 6), (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, (.A 4 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_12 : wsegOk P nbM092 (nInsideL P nbM092) kM092_12 tM092_12 kM092_13 = true := by
  decide +kernel

end PackLean.D28.Cub
