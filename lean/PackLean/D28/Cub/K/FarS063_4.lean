-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey063

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_1 : List Tok := [.split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 1 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), .split, (.D 5), .split, .split, (.A 1 2 4 1 7), (.A 1 3 6 1 7), (.A 5 2 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 1 6 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), (.A 1 3 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_1 : wsegOk P nbM148 (nInsideL P nbM148) kM148_1 tM148_1 kM148_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_2 : List Tok := [.split, .split, (.A 1 2 4 1 5), .split, (.A 1 3 4 1 5), (.A 0 3 4 1 5), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 6 1 7), (.A 0 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_2 : wsegOk P nbM148 (nInsideL P nbM148) kM148_2 tM148_2 kM148_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_3 : List Tok := [(.D 9), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, (.D 7), (.D 4), (.D 7), .split, .split, .split, (.D 7), (.A 1 6 4 1 7), (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, .split, (.D 7), (.A 0 6 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_3 : wsegOk P nbM148 (nInsideL P nbM148) kM148_3 tM148_3 kM148_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_4 : List Tok := [.split, (.A 0 6 4 1 7), (.A 0 6 4 0 7), .split, (.D 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), .split, (.A 0 7 4 2 1), (.D 7), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, (.A 0 6 4 0 7), (.A 0 6 4 0 7), .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_4 : wsegOk P nbM148 (nInsideL P nbM148) kM148_4 tM148_4 kM148_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_5 : List Tok := [.split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), (.A 0 2 4 0 1), (.A 0 6 4 0 1), .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 18), .split, .split, (.A 0 6 5 0 3), (.D 7), .split, .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_5 : wsegOk P nbM148 (nInsideL P nbM148) kM148_5 tM148_5 kM148_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_6 : List Tok := [.split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 0 3 4 0 5), (.A 0 3 6 0 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, .split, (.D 17), .split, (.D 5), .split, (.A 5 3 6 5 7), (.A 4 3 6 4 7), .split, (.D 5), (.A 4 3 6 4 7), .split, .split, .split, .split, (.D 5), .split, (.A 1 3 6 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_6 : wsegOk P nbM148 (nInsideL P nbM148) kM148_6 tM148_6 kM148_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_7 : List Tok := [(.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, (.A 0 3 6 0 7), .split, .split, .split, .split, (.A 1 3 6 1 7), (.A 0 3 6 1 7), .split, (.A 1 2 6 1 7), .split, (.A 4 3 6 1 7), (.A 0 2 6 0 7), (.A 0 2 6 0 7), (.A 0 3 6 0 7), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, .split, (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 7), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_7 : wsegOk P nbM148 (nInsideL P nbM148) kM148_7 tM148_7 kM148_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_8 : List Tok := [.split, (.A 4 3 6 4 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 2 7 4 2 1), .split, .split, (.D 6), .split, .split, (.A 0 3 6 0 5), (.D 6), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_8 : wsegOk P nbM148 (nInsideL P nbM148) kM148_8 tM148_8 kM148_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_9 : List Tok := [(.D 6), .split, (.D 9), (.A 2 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 3 4 0 5), .split, .split, (.A 2 7 4 2 1), .split, .split, (.A 2 7 4 2 1), (.A 0 7 4 0 1), (.A 2 7 4 2 1), .split, (.A 0 7 4 0 1), (.A 0 7 4 0 1), .split, (.A 0 3 6 0 5), .split, (.D 6), .split, .split, (.A 0 3 4 0 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), (.A 0 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_9 : wsegOk P nbM148 (nInsideL P nbM148) kM148_9 tM148_9 kM148_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_10 : List Tok := [.split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, (.A 0 2 4 0 1), .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 1), .split, (.A 0 3 6 0 1), (.A 0 2 6 0 1), .split, .split, .split, (.A 0 7 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 5 0 1), .split, (.A 0 3 4 0 1), (.A 0 3 5 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), (.A 0 3 6 0 5), (.A 0 3 6 0 1), .split, .split, (.A 0 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_10 : wsegOk P nbM148 (nInsideL P nbM148) kM148_10 tM148_10 kM148_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_11 : List Tok := [(.D 6), .split, .split, (.A 0 3 7 0 1), (.A 0 3 5 0 1), .split, (.A 0 3 7 0 1), (.D 6), .split, .split, (.A 2 7 4 2 1), (.D 6), .split, .split, .split, .split, (.A 0 7 4 2 1), .split, .split, (.A 2 7 4 2 1), (.A 0 7 5 2 1), (.D 18), (.A 0 7 5 0 1), (.D 18), .split, .split, (.D 6), .split, (.A 0 3 5 2 1), (.D 6), (.D 18), .split, .split, (.D 6), .split, .split, .split, (.D 6), .split, (.A 0 3 7 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_11 : wsegOk P nbM148 (nInsideL P nbM148) kM148_11 tM148_11 kM148_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_12 : List Tok := [(.D 6), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 2 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, .split, (.A 1 2 6 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_12 : wsegOk P nbM148 (nInsideL P nbM148) kM148_12 tM148_12 kM148_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_13 : List Tok := [.split, (.A 1 2 6 1 7), (.A 5 2 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 7), .split, (.A 0 2 6 1 7), .split, .split, (.A 0 2 4 0 7), (.A 0 2 6 0 7), (.A 0 2 6 0 3), .split, .split, (.A 1 2 4 1 3), .split, (.A 1 2 4 1 3), .split, (.A 1 2 4 1 3), (.A 0 2 6 1 3), .split, .split, .split, (.A 1 2 6 1 3), (.A 0 2 6 0 3), (.A 1 2 6 1 3), (.A 0 2 6 0 3), .split, .split, .split, .split, (.D 4), .split, (.D 4), (.A 1 2 6 1 3), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_13 : wsegOk P nbM148 (nInsideL P nbM148) kM148_13 tM148_13 kM148_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_14 : List Tok := [.split, .split, .split, (.D 4), (.A 1 2 5 1 3), .split, (.A 1 2 4 1 3), (.A 1 2 5 1 3), .split, (.D 4), .split, (.A 1 2 6 1 3), (.A 1 2 7 1 3), .split, .split, (.A 5 2 6 5 3), (.A 5 0 6 5 3), .split, .split, .split, (.A 1 2 6 1 3), (.A 1 2 6 1 3), .split, (.A 5 2 6 5 3), .split, (.A 0 2 6 0 3), .split, .split, (.A 5 2 6 1 3), (.A 0 2 7 0 3), (.A 4 2 6 4 3), .split, .split, (.A 5 2 6 1 3), (.A 1 2 7 1 3), .split, (.A 5 2 6 5 3), (.A 5 2 7 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_14 : wsegOk P nbM148 (nInsideL P nbM148) kM148_14 tM148_14 kM148_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_15 : List Tok := [.split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 0 6 5 0 3), .split, (.D 1), (.A 1 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_15 : wsegOk P nbM148 (nInsideL P nbM148) kM148_15 tM148_15 kM148_16 = true := by
  decide +kernel

end PackLean.D28.Cub
