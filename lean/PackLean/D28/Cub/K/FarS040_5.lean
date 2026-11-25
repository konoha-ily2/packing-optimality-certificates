-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey040

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN101_25 : List Tok := [.split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN101_25 : wsegOk P nbN101 (nInsideL P nbN101) kN101_25 tN101_25 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM101_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.A 0 7 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM101_0 : wsegOk P nbM101 (nInsideL P nbM101) (rRoots P.rden) tM101_0 kM101_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM101_1 : List Tok := [.split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 5 3 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), (.A 1 3 4 1 7), .split, .split, (.A 1 2 4 1 5), (.A 0 3 4 1 5), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM101_1 : wsegOk P nbM101 (nInsideL P nbM101) kM101_1 tM101_1 kM101_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM101_2 : List Tok := [.split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 5 3 4 1 7), .split, (.A 5 2 4 1 7), (.A 5 3 6 1 7), .split, .split, (.A 1 2 4 1 7), .split, (.A 1 3 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 3 4 1 7), (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 6 1 7), .split, (.A 5 2 4 1 7), (.A 5 2 6 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM101_2 : wsegOk P nbM101 (nInsideL P nbM101) kM101_2 tM101_2 kM101_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM101_3 : List Tok := [(.A 1 2 6 0 7), (.A 0 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, .split, (.D 7), (.D 9), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, (.D 7), .split, (.A 1 6 4 3 7), (.D 7), .split, (.A 1 6 5 2 7), .split, (.A 1 6 5 1 7), .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM101_3 : wsegOk P nbM101 (nInsideL P nbM101) kM101_3 tM101_3 kM101_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM101_4 : List Tok := [(.D 7), (.D 7), .split, .split, .split, .split, .split, (.A 1 6 4 1 5), (.A 1 6 4 0 7), .split, (.D 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7), (.A 1 6 4 0 3), .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM101_4 : wsegOk P nbM101 (nInsideL P nbM101) kM101_4 tM101_4 kM101_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM101_5 : List Tok := [.split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM101_5 : wsegOk P nbM101 (nInsideL P nbM101) kM101_5 tM101_5 kM101_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM101_6 : List Tok := [(.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), .split, (.A 0 3 6 1 7), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, .split, .split, (.A 4 3 6 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM101_6 : wsegOk P nbM101 (nInsideL P nbM101) kM101_6 tM101_6 kM101_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM101_7 : List Tok := [.split, (.A 0 3 6 0 7), .split, .split, (.A 4 3 6 1 7), (.A 0 2 6 0 7), (.A 4 3 6 0 7), (.A 4 3 6 0 7), .split, (.A 4 2 6 1 7), (.A 4 3 6 0 7), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, (.A 0 2 6 0 7), (.A 4 2 6 0 7), (.A 0 2 6 0 5), .split, (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM101_7 : wsegOk P nbM101 (nInsideL P nbM101) kM101_7 tM101_7 kM101_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM101_8 : List Tok := [.split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM101_8 : wsegOk P nbM101 (nInsideL P nbM101) kM101_8 tM101_8 kM101_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM101_9 : List Tok := [(.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 5), (.A 0 2 6 0 1), (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), (.A 0 3 6 0 5), (.A 0 2 6 0 1), .split, (.A 0 3 6 0 1), (.A 0 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM101_9 : wsegOk P nbM101 (nInsideL P nbM101) kM101_9 tM101_9 kM101_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM101_10 : List Tok := [.split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), .split, (.A 0 3 4 0 1), (.A 0 3 5 0 1), .split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 1), .split, (.A 0 3 6 0 1), .split, .split, .split, (.A 0 3 6 0 1), (.A 4 3 7 0 1), (.A 4 3 5 0 1), (.A 4 3 7 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, (.A 0 7 5 0 1), (.D 18), .split, .split, (.D 6), (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM101_10 : wsegOk P nbM101 (nInsideL P nbM101) kM101_10 tM101_10 kM101_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM101_11 : List Tok := [.split, .split, (.A 4 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 2 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM101_11 : wsegOk P nbM101 (nInsideL P nbM101) kM101_11 tM101_11 kM101_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM101_12 : List Tok := [.split, .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 5 2 6 1 7), .split, .split, .split, (.A 1 2 4 0 7), .split, .split, (.A 1 2 4 0 7), (.A 0 2 4 0 7), (.A 1 2 4 0 3), .split, (.A 0 2 6 0 7), .split, (.A 0 2 4 0 7), (.A 0 2 6 0 3), .split, (.A 1 2 4 0 3), .split, .split, .split, .split, (.A 5 2 6 0 7), .split, (.A 1 2 6 0 3), (.A 5 2 6 0 3), (.A 4 2 6 0 7), (.A 5 2 6 0 3), (.A 0 2 6 0 3), .split, (.A 5 2 4 1 3), .split, (.A 5 2 6 1 3), .split, .split, .split, (.A 5 2 6 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM101_12 : wsegOk P nbM101 (nInsideL P nbM101) kM101_12 tM101_12 kM101_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM101_13 : List Tok := [(.A 1 2 6 0 3), .split, (.A 5 2 6 0 3), (.A 5 2 6 0 3), (.A 5 2 6 0 3), .split, .split, .split, .split, (.D 4), (.A 5 2 4 1 3), (.D 4), .split, (.A 1 2 4 1 3), .split, (.D 4), .split, (.A 5 2 6 1 3), (.A 1 2 7 1 3), .split, (.A 5 0 6 5 3), .split, (.A 5 2 6 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM101_13 : wsegOk P nbM101 (nInsideL P nbM101) kM101_13 tM101_13 kM101_14 = true := by
  decide +kernel

end PackLean.D28.Cub
