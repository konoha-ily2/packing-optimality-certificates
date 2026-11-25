-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey030

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM082_5 : List Tok := [.split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM082_5 : wsegOk P nbM082 (nInsideL P nbM082) kM082_5 tM082_5 kM082_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM082_6 : List Tok := [.split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), .split, (.A 0 3 6 1 7), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM082_6 : wsegOk P nbM082 (nInsideL P nbM082) kM082_6 tM082_6 kM082_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM082_7 : List Tok := [(.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, .split, .split, (.A 4 3 6 1 7), .split, .split, .split, (.A 4 3 6 1 7), (.A 0 3 6 1 7), (.A 4 3 6 0 7), (.A 4 3 6 0 7), (.A 4 3 6 0 7), .split, (.A 4 2 6 1 7), (.A 4 3 6 0 7), .split, .split, .split, .split, .split, .split, .split, (.A 0 3 6 0 5), .split, (.A 0 2 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, (.A 0 2 6 0 7), (.A 0 2 6 0 5), (.A 0 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM082_7 : wsegOk P nbM082 (nInsideL P nbM082) kM082_7 tM082_7 kM082_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM082_8 : List Tok := [(.A 0 3 6 0 5), .split, .split, (.A 4 2 6 0 7), .split, (.A 0 2 6 0 5), .split, .split, (.A 4 2 6 0 7), (.A 0 2 6 0 5), (.A 4 2 6 0 5), .split, (.A 4 3 6 0 5), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM082_8 : wsegOk P nbM082 (nInsideL P nbM082) kM082_8 tM082_8 kM082_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM082_9 : List Tok := [.split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 5), (.A 0 2 6 0 1), (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM082_9 : wsegOk P nbM082 (nInsideL P nbM082) kM082_9 tM082_9 kM082_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM082_10 : List Tok := [(.A 0 3 6 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, (.A 0 3 6 0 1), (.A 0 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), .split, .split, (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 3 5 0 1), (.A 0 3 5 0 1), (.A 0 3 5 0 1), .split, .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM082_10 : wsegOk P nbM082 (nInsideL P nbM082) kM082_10 tM082_10 kM082_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM082_11 : List Tok := [(.A 4 3 6 0 1), .split, (.A 0 3 6 0 1), .split, (.A 4 3 5 0 1), (.A 4 3 7 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, (.A 0 7 5 0 1), (.D 18), .split, .split, (.D 6), (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, (.A 4 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM082_11 : wsegOk P nbM082 (nInsideL P nbM082) kM082_11 tM082_11 kM082_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM082_12 : List Tok := [(.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, (.A 1 2 4 1 7), .split, (.A 5 2 6 1 7), .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 1 2 4 0 7), (.A 1 2 4 0 3), .split, .split, .split, .split, (.A 5 2 6 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM082_12 : wsegOk P nbM082 (nInsideL P nbM082) kM082_12 tM082_12 kM082_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM082_13 : List Tok := [(.A 5 2 4 0 7), (.A 4 2 6 0 7), (.A 5 2 6 0 7), .split, .split, (.A 0 2 4 0 7), .split, .split, (.A 0 2 6 0 7), (.A 4 2 6 0 7), .split, (.A 0 2 4 0 7), (.A 0 2 6 0 3), .split, .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 5 2 6 0 7), (.A 0 2 4 0 3), (.A 5 2 6 0 3), (.A 0 2 4 0 3), .split, (.A 4 2 6 0 3), .split, (.A 0 2 6 0 3), (.A 4 2 6 0 3), .split, (.A 5 2 4 0 3), .split, (.A 5 2 6 0 3), .split, .split, .split, (.A 5 2 6 0 3), .split, .split, (.A 1 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM082_13 : wsegOk P nbM082 (nInsideL P nbM082) kM082_13 tM082_13 kM082_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM082_14 : List Tok := [(.A 4 2 6 0 3), (.A 5 2 6 0 3), (.A 4 2 6 0 3), (.A 5 2 6 0 3), .split, (.A 5 2 4 1 3), (.A 5 2 6 0 3), .split, .split, .split, (.A 5 0 4 1 3), (.D 4), .split, (.A 1 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM082_14 : wsegOk P nbM082 (nInsideL P nbM082) kM082_14 tM082_14 kM082_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM082_15 : List Tok := [(.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM082_15 : wsegOk P nbM082 (nInsideL P nbM082) kM082_15 tM082_15 kM082_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM082_16 : List Tok := [.split, .split, (.A 1 2 4 0 3), (.A 0 2 4 0 3), .split, .split, .split, (.A 0 2 4 0 3), .split, (.A 4 2 6 0 3), (.A 0 2 6 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3), (.A 4 2 6 0 3), (.A 5 2 6 0 3), (.A 0 2 4 0 3), (.A 4 2 6 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 6 0 3), (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 5 0 3), .split, (.A 0 2 5 0 3), (.A 0 2 5 0 1), .split, (.A 1 2 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM082_16 : wsegOk P nbM082 (nInsideL P nbM082) kM082_16 tM082_16 kM082_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM082_17 : List Tok := [.split, .split, (.A 1 2 4 0 3), .split, (.A 1 2 4 0 3), (.A 0 2 5 0 3), (.A 1 2 5 0 3), .split, .split, .split, .split, (.A 5 2 6 0 3), .split, .split, .split, (.A 5 2 6 0 3), (.A 1 2 4 0 3), (.A 4 2 6 0 3), (.A 5 2 6 0 3), (.A 4 2 6 0 3), (.A 5 2 6 0 3), .split, .split, .split, .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), (.A 4 2 6 0 3), (.A 0 2 5 0 3), .split, (.A 4 2 6 0 3), .split, .split, (.A 0 2 4 0 3), .split, (.A 4 2 6 0 3), .split, .split, (.A 0 2 5 0 3), (.A 4 2 7 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM082_17 : wsegOk P nbM082 (nInsideL P nbM082) kM082_17 tM082_17 kM082_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM082_18 : List Tok := [(.A 4 2 7 0 3), (.A 4 2 7 0 3), .split, .split, .split, .split, .split, (.A 5 2 6 0 3), .split, .split, (.A 1 2 5 0 3), (.A 4 2 7 0 3), (.A 5 2 7 0 3), (.A 4 2 6 0 3), (.A 5 2 7 0 3), (.A 4 2 5 0 3), (.A 4 2 7 0 3), .split, .split, (.A 5 2 7 0 3), (.A 1 2 7 0 3), (.A 5 2 7 0 3), .split, .split, (.A 0 2 5 0 3), (.A 0 2 5 0 3), .split, (.A 1 2 5 0 3), (.A 4 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM082_18 : wsegOk P nbM082 (nInsideL P nbM082) kM082_18 tM082_18 kM082_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM082_19 : List Tok := [.split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), (.A 4 2 7 0 3), (.A 5 2 7 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM082_19 : wsegOk P nbM082 (nInsideL P nbM082) kM082_19 tM082_19 kM082_20 = true := by
  decide +kernel

end PackLean.D28.Cub
