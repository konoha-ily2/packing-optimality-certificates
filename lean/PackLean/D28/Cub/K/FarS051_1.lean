-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey051

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN123_15 : List Tok := [(.D 19), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN123_15 : wsegOk P nbN123 (nInsideL P nbN123) kN123_15 tN123_15 kN123_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN123_16 : List Tok := [.split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN123_16 : wsegOk P nbN123 (nInsideL P nbN123) kN123_16 tN123_16 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM123_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), (.A 0 7 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM123_0 : wsegOk P nbM123 (nInsideL P nbM123) (rRoots P.rden) tM123_0 kM123_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM123_1 : List Tok := [.split, .split, (.D 17), .split, (.D 5), (.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 5 3 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), (.A 1 3 4 1 7), .split, .split, .split, (.A 1 2 4 1 5), (.A 1 2 4 1 5), (.A 0 3 4 1 5), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM123_1 : wsegOk P nbM123 (nInsideL P nbM123) kM123_1 tM123_1 kM123_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM123_2 : List Tok := [.split, .split, (.A 1 3 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 3 6 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 6 1 7), (.A 0 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, (.D 7), (.D 9), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM123_2 : wsegOk P nbM123 (nInsideL P nbM123) kM123_2 tM123_2 kM123_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM123_3 : List Tok := [(.D 7), (.D 7), .split, .split, .split, .split, (.D 7), .split, (.A 1 6 4 3 7), (.D 7), .split, .split, (.A 1 6 5 3 7), (.D 7), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, .split, (.D 7), (.A 0 6 4 1 5), (.A 0 6 4 0 7), .split, (.D 7), (.D 7), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM123_3 : wsegOk P nbM123 (nInsideL P nbM123) kM123_3 tM123_3 kM123_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM123_4 : List Tok := [(.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, .split, (.A 1 2 4 1 7), (.A 0 6 4 0 7), .split, (.A 0 2 4 0 7), (.A 0 6 4 0 3), .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, .split, (.A 0 6 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM123_4 : wsegOk P nbM123 (nInsideL P nbM123) kM123_4 tM123_4 kM123_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM123_5 : List Tok := [(.A 0 6 5 0 3), .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 18), .split, .split, (.A 0 6 5 0 3), (.D 7), .split, .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM123_5 : wsegOk P nbM123 (nInsideL P nbM123) kM123_5 tM123_5 kM123_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM123_6 : List Tok := [.split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, .split, (.D 17), .split, (.D 5), (.A 4 3 6 5 7), .split, (.D 5), (.A 4 3 6 4 7), .split, .split, .split, .split, (.D 5), .split, (.A 0 3 6 1 7), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, (.A 0 3 6 0 7), .split, .split, .split, .split, .split, (.A 4 3 6 1 7), (.A 0 2 6 1 7), (.A 4 3 6 1 7), (.A 4 2 6 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM123_6 : wsegOk P nbM123 (nInsideL P nbM123) kM123_6 tM123_6 kM123_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM123_7 : List Tok := [(.A 0 2 6 0 7), (.A 4 3 6 0 7), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), .split, .split, (.A 0 2 6 0 7), (.A 0 2 6 0 5), .split, (.A 0 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM123_7 : wsegOk P nbM123 (nInsideL P nbM123) kM123_7 tM123_7 kM123_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM123_8 : List Tok := [.split, .split, (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 2 7 4 2 1), .split, .split, (.D 6), (.A 0 3 6 0 5), (.D 6), .split, (.D 9), (.A 2 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 7 4 0 1), .split, (.A 0 3 6 0 5), .split, (.D 6), .split, (.A 0 3 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM123_8 : wsegOk P nbM123 (nInsideL P nbM123) kM123_8 tM123_8 kM123_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM123_9 : List Tok := [(.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), (.A 0 3 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), (.A 0 3 6 0 5), (.A 0 2 6 0 1), .split, (.A 0 3 6 0 1), (.A 0 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM123_9 : wsegOk P nbM123 (nInsideL P nbM123) kM123_9 tM123_9 kM123_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM123_10 : List Tok := [.split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), (.A 0 3 5 0 1), .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 1), .split, .split, (.A 0 3 4 0 1), (.D 6), .split, (.A 0 3 5 0 1), .split, (.A 4 3 7 0 1), (.D 6), .split, .split, (.A 2 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1), .split, (.A 0 7 5 0 1), (.D 18), (.D 18), .split, .split, (.D 6), .split, (.A 4 3 5 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM123_10 : wsegOk P nbM123 (nInsideL P nbM123) kM123_10 tM123_10 kM123_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM123_11 : List Tok := [(.D 6), (.D 18), .split, .split, (.D 6), .split, .split, .split, (.D 6), (.A 4 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 2 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM123_11 : wsegOk P nbM123 (nInsideL P nbM123) kM123_11 tM123_11 kM123_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM123_12 : List Tok := [.split, .split, .split, .split, (.A 1 2 4 1 7), .split, (.D 4), (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, .split, .split, (.A 1 2 4 1 7), (.A 5 2 6 1 7), (.A 5 2 6 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, (.A 0 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 0 2 6 1 7), .split, .split, (.A 0 2 4 0 7), (.A 0 2 6 0 7), (.A 0 2 6 0 3), .split, .split, .split, (.A 1 2 4 1 3), (.A 1 2 6 1 3), .split, (.A 1 2 4 1 3), .split, (.A 1 2 4 1 3), (.A 1 2 6 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM123_12 : wsegOk P nbM123 (nInsideL P nbM123) kM123_12 tM123_12 kM123_13 = true := by
  decide +kernel

end PackLean.D28.Cub
