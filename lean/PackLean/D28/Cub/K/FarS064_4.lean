-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey064

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), (.A 1 7 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), .split, (.D 11), .split, .split, (.D 11), (.D 11), (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_0 : wsegOk P nbM150 (nInsideL P nbM150) (rRoots P.rden) tM150_0 kM150_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_1 : List Tok := [.split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 1 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 5 3 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), (.A 1 3 4 1 7), .split, .split, (.A 1 2 4 1 5), (.A 1 3 4 1 5), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_1 : wsegOk P nbM150 (nInsideL P nbM150) kM150_1 tM150_1 kM150_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_2 : List Tok := [(.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 3 4 1 7), (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 6 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, (.D 7), (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_2 : wsegOk P nbM150 (nInsideL P nbM150) kM150_2 tM150_2 kM150_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_3 : List Tok := [.split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 7), .split, .split, (.A 1 6 5 3 7), (.D 7), .split, .split, (.A 1 6 4 1 7), (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, .split, (.D 7), .split, (.A 1 6 4 1 5), (.D 7), .split, .split, (.A 1 6 4 1 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_3 : wsegOk P nbM150 (nInsideL P nbM150) kM150_3 tM150_3 kM150_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_4 : List Tok := [(.A 0 6 4 0 7), .split, (.D 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, .split, (.A 1 2 4 1 7), (.A 0 6 4 0 7), .split, (.A 0 2 4 0 7), (.A 0 6 4 0 3), .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_4 : wsegOk P nbM150 (nInsideL P nbM150) kM150_4 tM150_4 kM150_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_5 : List Tok := [.split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 1), (.A 0 2 4 0 1), (.A 0 6 4 0 1), .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 18), .split, .split, (.A 0 6 5 0 3), (.D 7), .split, .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_5 : wsegOk P nbM150 (nInsideL P nbM150) kM150_5 tM150_5 kM150_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_6 : List Tok := [.split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 0 3 4 0 5), (.A 0 3 6 0 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, .split, (.D 17), .split, (.D 5), .split, (.A 5 3 6 5 7), (.A 4 3 6 4 7), .split, (.D 5), (.A 4 3 6 4 7), .split, .split, .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_6 : wsegOk P nbM150 (nInsideL P nbM150) kM150_6 tM150_6 kM150_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_7 : List Tok := [.split, (.A 1 3 6 1 7), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, .split, .split, (.A 1 3 6 1 7), (.A 0 3 6 0 7), (.A 0 3 6 0 7), .split, .split, .split, (.A 1 3 6 1 7), .split, (.A 1 2 6 1 7), (.A 4 3 6 1 7), (.A 0 2 6 0 7), (.A 0 3 6 0 7), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), .split, .split, (.A 0 2 6 0 7), (.A 0 2 6 0 5), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_7 : wsegOk P nbM150 (nInsideL P nbM150) kM150_7 tM150_7 kM150_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_8 : List Tok := [.split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 2 7 4 2 1), .split, .split, (.D 6), (.A 0 3 6 0 5), (.D 6), .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_8 : wsegOk P nbM150 (nInsideL P nbM150) kM150_8 tM150_8 kM150_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_9 : List Tok := [(.A 2 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), .split, (.D 6), .split, (.A 0 3 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), (.A 0 3 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, (.A 0 2 4 0 1), .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 1), .split, (.A 0 3 6 0 1), (.A 0 2 6 0 1), .split, .split, .split, (.A 0 7 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_9 : wsegOk P nbM150 (nInsideL P nbM150) kM150_9 tM150_9 kM150_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_10 : List Tok := [(.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 5 0 1), .split, (.A 0 3 4 0 1), (.A 0 3 5 0 1), .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), .split, .split, (.A 0 3 4 0 1), (.D 6), .split, (.A 0 3 5 0 1), (.A 0 3 7 0 1), .split, .split, (.A 2 7 4 2 1), (.D 6), .split, .split, (.A 0 7 5 0 1), (.D 18), .split, .split, (.D 6), .split, (.A 0 3 5 2 1), (.D 6), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_10 : wsegOk P nbM150 (nInsideL P nbM150) kM150_10 tM150_10 kM150_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_11 : List Tok := [.split, .split, (.D 6), .split, .split, .split, (.D 6), (.A 0 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 2 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_11 : wsegOk P nbM150 (nInsideL P nbM150) kM150_11 tM150_11 kM150_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_12 : List Tok := [(.A 1 2 4 1 3), .split, .split, (.A 1 2 6 1 7), .split, .split, (.A 5 2 6 1 7), (.A 1 2 6 1 7), (.A 5 2 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), (.A 1 2 4 1 3), .split, .split, (.A 1 2 6 1 7), .split, (.A 1 2 6 1 7), (.A 0 2 6 0 7), .split, .split, (.A 0 2 4 0 7), (.A 0 2 6 0 7), (.A 0 2 6 0 3), .split, .split, (.A 1 2 4 1 3), .split, (.A 1 2 4 1 3), .split, (.A 1 2 4 1 3), (.A 1 2 6 1 3), .split, .split, .split, (.A 1 2 6 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_12 : wsegOk P nbM150 (nInsideL P nbM150) kM150_12 tM150_12 kM150_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_13 : List Tok := [(.A 0 2 6 0 3), (.A 1 2 6 1 3), (.A 0 2 6 0 3), .split, .split, .split, .split, (.D 4), .split, (.D 4), (.A 1 2 6 1 3), (.D 4), .split, .split, .split, (.D 4), (.A 1 2 5 1 3), .split, (.A 1 2 4 1 3), (.A 1 2 5 1 3), .split, (.D 4), .split, (.A 1 2 6 1 3), (.A 1 2 7 1 3), .split, .split, (.A 5 2 6 5 3), (.A 5 0 6 5 3), .split, .split, (.A 1 2 6 1 3), .split, (.A 5 2 6 5 3), .split, (.A 0 2 6 0 3), .split, .split, (.A 5 2 6 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_13 : wsegOk P nbM150 (nInsideL P nbM150) kM150_13 tM150_13 kM150_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_14 : List Tok := [(.A 1 2 7 0 3), (.A 4 2 6 4 3), .split, .split, (.A 5 2 6 1 3), (.A 1 2 7 1 3), .split, (.A 5 2 6 5 3), (.A 5 2 7 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_14 : wsegOk P nbM150 (nInsideL P nbM150) kM150_14 tM150_14 kM150_15 = true := by
  decide +kernel

end PackLean.D28.Cub
