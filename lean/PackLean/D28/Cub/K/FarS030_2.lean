-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey030

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_3 : List Tok := [.split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), .split, (.A 1 2 4 1 7), (.A 4 2 6 0 7), (.A 0 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, (.A 0 7 4 3 5), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, (.D 7), .split, (.A 1 6 4 3 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_3 : wsegOk P nbM081 (nInsideL P nbM081) kM081_3 tM081_3 kM081_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_4 : List Tok := [.split, (.A 1 6 5 2 7), .split, (.A 1 6 5 1 7), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, .split, (.A 1 6 4 1 5), (.A 1 6 4 0 7), .split, (.D 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_4 : wsegOk P nbM081 (nInsideL P nbM081) kM081_4 tM081_4 kM081_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_5 : List Tok := [(.A 1 6 4 0 3), .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_5 : wsegOk P nbM081 (nInsideL P nbM081) kM081_5 tM081_5 kM081_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_6 : List Tok := [.split, .split, (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), .split, (.A 0 3 6 1 7), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_6 : wsegOk P nbM081 (nInsideL P nbM081) kM081_6 tM081_6 kM081_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_7 : List Tok := [(.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, .split, .split, (.A 4 3 6 1 7), .split, (.A 0 3 6 0 7), .split, .split, (.A 4 3 6 1 7), (.A 4 2 6 0 7), (.A 4 3 6 0 7), (.A 4 3 6 0 7), .split, (.A 4 2 6 1 7), (.A 4 3 6 0 7), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, (.A 4 2 6 0 7), (.A 4 2 6 0 7), (.A 0 2 6 0 5), .split, (.A 4 3 6 0 5), .split, (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_7 : wsegOk P nbM081 (nInsideL P nbM081) kM081_7 tM081_7 kM081_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_8 : List Tok := [(.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_8 : wsegOk P nbM081 (nInsideL P nbM081) kM081_8 tM081_8 kM081_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_9 : List Tok := [.split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 5), (.A 0 2 6 0 1), (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), (.A 0 3 6 0 5), (.A 4 2 6 0 1), .split, (.A 0 3 6 0 1), (.A 0 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_9 : wsegOk P nbM081 (nInsideL P nbM081) kM081_9 tM081_9 kM081_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_10 : List Tok := [(.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), .split, .split, (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 3 5 0 1), (.A 0 3 5 0 1), (.A 0 3 5 0 1), .split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 1), .split, (.A 0 3 6 0 1), .split, .split, (.A 4 3 7 0 1), (.A 4 3 5 0 1), (.A 4 3 7 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, (.A 0 7 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_10 : wsegOk P nbM081 (nInsideL P nbM081) kM081_10 tM081_10 kM081_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_11 : List Tok := [(.D 18), .split, .split, (.D 6), (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, (.A 4 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 5 2 6 5 7), (.A 5 0 6 5 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_11 : wsegOk P nbM081 (nInsideL P nbM081) kM081_11 tM081_11 kM081_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_12 : List Tok := [.split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 0 2 4 0 7), (.A 1 2 4 0 3), .split, .split, (.A 4 2 6 0 7), (.A 4 2 6 0 7), .split, .split, (.A 0 2 4 0 7), (.A 0 2 6 0 7), (.A 0 2 6 0 3), .split, .split, (.A 5 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_12 : wsegOk P nbM081 (nInsideL P nbM081) kM081_12 tM081_12 kM081_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_13 : List Tok := [(.A 1 2 4 0 3), .split, .split, (.A 4 2 6 0 7), (.A 5 2 6 0 3), .split, .split, .split, (.A 4 2 6 0 3), (.A 0 2 6 0 3), (.A 4 2 6 0 3), (.A 4 2 6 0 3), .split, (.A 5 2 4 1 3), (.A 5 2 6 0 3), .split, .split, .split, (.A 5 0 4 1 3), (.D 4), .split, (.A 1 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_13 : wsegOk P nbM081 (nInsideL P nbM081) kM081_13 tM081_13 kM081_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_14 : List Tok := [(.A 5 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), .split, (.A 1 6 5 1 7), (.A 1 6 5 0 3), .split, (.D 1), .split, (.A 1 6 5 1 3), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_14 : wsegOk P nbM081 (nInsideL P nbM081) kM081_14 tM081_14 kM081_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_15 : List Tok := [.split, .split, .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 6 0 3), (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 5 0 3), (.A 0 2 5 0 3), .split, .split, (.A 1 2 5 0 3), (.A 1 2 5 0 3), .split, .split, .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 1 2 4 0 3), .split, (.A 5 2 6 0 3), .split, .split, (.A 1 2 4 0 3), (.A 5 2 6 0 3), (.A 5 2 6 0 3), (.A 0 2 5 0 3), .split, (.A 4 2 6 0 3), .split, .split, (.A 0 2 4 0 3), .split, (.A 4 2 6 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_15 : wsegOk P nbM081 (nInsideL P nbM081) kM081_15 tM081_15 kM081_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_16 : List Tok := [.split, .split, (.A 0 2 4 0 3), (.A 4 2 6 0 3), (.A 4 2 7 0 3), (.A 4 2 7 0 3), .split, .split, (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), (.A 0 2 5 0 3), (.A 5 2 7 0 3), (.A 4 2 7 0 3), .split, (.A 0 2 5 0 3), .split, (.A 0 2 5 0 3), (.A 4 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_16 : wsegOk P nbM081 (nInsideL P nbM081) kM081_16 tM081_16 kM081_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM081_17 : List Tok := [.split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), .split, .split, .split, .split, .split, (.A 1 2 5 0 3), (.A 5 2 7 0 3), (.A 5 2 7 0 3), (.A 0 2 5 0 3), (.A 4 2 7 0 3), .split, .split, (.A 5 2 7 0 3), .split, .split, (.A 1 2 7 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM081_17 : wsegOk P nbM081 (nInsideL P nbM081) kM081_17 tM081_17 kM081_18 = true := by
  decide +kernel

end PackLean.D28.Cub
