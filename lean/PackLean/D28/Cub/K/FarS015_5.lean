-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey015

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_9 : List Tok := [.split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 1), .split, .split, (.A 0 3 4 0 1), (.D 6), (.A 4 3 7 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1), (.A 4 7 5 0 1), (.D 18), .split, .split, (.D 6), (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, (.A 4 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_9 : wsegOk P nbM051 (nInsideL P nbM051) kM051_9 tM051_9 kM051_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_10 : List Tok := [.split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_10 : wsegOk P nbM051 (nInsideL P nbM051) kM051_10 tM051_10 kM051_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_11 : List Tok := [.split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), (.A 1 2 4 1 3), .split, (.A 4 2 6 1 7), .split, .split, (.A 0 2 4 0 7), .split, (.A 4 2 6 0 7), (.A 4 2 4 0 3), .split, (.A 4 2 4 0 3), (.A 4 2 6 0 3), .split, (.A 5 2 4 1 3), .split, (.A 5 2 6 1 3), (.A 5 2 6 0 3), .split, .split, (.A 5 0 4 1 3), .split, .split, .split, (.D 4), (.A 1 2 5 1 3), (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_11 : wsegOk P nbM051 (nInsideL P nbM051) kM051_11 tM051_11 kM051_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_12 : List Tok := [.split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), (.A 5 0 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), .split, (.A 1 6 5 1 7), (.A 1 6 5 0 3), .split, (.D 1), (.A 1 6 5 0 3), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), (.A 1 6 5 0 3), .split, (.A 1 2 4 0 3), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_12 : wsegOk P nbM051 (nInsideL P nbM051) kM051_12 tM051_12 kM051_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_13 : List Tok := [.split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 3), (.A 4 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 5 0 3), (.A 0 2 5 0 3), .split, .split, .split, .split, (.A 1 2 5 0 3), .split, (.A 1 2 4 0 3), (.A 0 2 5 0 3), (.A 1 2 5 0 3), (.A 0 2 5 0 3), .split, .split, .split, (.A 4 2 4 0 3), (.A 4 2 6 0 3), (.A 4 2 7 0 3), (.A 4 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_13 : wsegOk P nbM051 (nInsideL P nbM051) kM051_13 tM051_13 kM051_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_14 : List Tok := [(.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 4 2 5 0 1), .split, .split, (.A 0 2 5 0 3), (.A 0 6 5 0 3), (.A 4 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, .split, (.A 1 2 7 1 3), (.A 5 2 7 1 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 2 7 0 3), .split, (.A 1 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_14 : wsegOk P nbM051 (nInsideL P nbM051) kM051_14 tM051_14 kM051_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_15 : List Tok := [(.A 5 2 5 0 3), .split, (.A 5 2 7 0 3), (.A 4 2 7 0 3), .split, .split, (.A 5 2 7 0 3), (.A 5 6 7 0 3), (.A 5 2 7 0 3), .split, .split, .split, .split, (.A 0 6 5 0 3), .split, (.A 1 6 5 0 3), (.A 4 6 5 0 3), (.D 12), .split, (.A 4 6 5 0 3), (.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_15 : wsegOk P nbM051 (nInsideL P nbM051) kM051_15 tM051_15 kM051_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_16 : List Tok := [(.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3), (.A 5 6 7 1 3), (.D 12), (.D 12), .split, (.A 5 2 7 5 3), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), (.A 4 1 6 4 7), .split, .split, (.D 17), (.A 4 0 6 5 3), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, .split, (.A 4 2 6 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_16 : wsegOk P nbM051 (nInsideL P nbM051) kM051_16 tM051_16 kM051_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_17 : List Tok := [(.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, (.A 4 2 6 4 3), .split, (.A 5 0 6 5 3), (.D 13), (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), (.A 4 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_17 : wsegOk P nbM051 (nInsideL P nbM051) kM051_17 tM051_17 kM051_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_18 : List Tok := [.split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 4 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_18 : wsegOk P nbM051 (nInsideL P nbM051) kM051_18 tM051_18 kM051_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_19 : List Tok := [.split, (.A 4 2 4 0 1), (.A 4 2 5 0 1), (.A 4 2 6 0 1), .split, .split, (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, .split, .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 0 6 5 0 1), (.A 4 2 5 0 1), (.A 4 6 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, (.A 4 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_19 : wsegOk P nbM051 (nInsideL P nbM051) kM051_19 tM051_19 kM051_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_20 : List Tok := [.split, .split, .split, .split, .split, (.A 4 7 5 0 1), (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_20 : wsegOk P nbM051 (nInsideL P nbM051) kM051_20 tM051_20 kM051_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_21 : List Tok := [.split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_21 : wsegOk P nbM051 (nInsideL P nbM051) kM051_21 tM051_21 kM051_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_22 : List Tok := [.split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_22 : wsegOk P nbM051 (nInsideL P nbM051) kM051_22 tM051_22 [] = true := by
  decide +kernel

end PackLean.D28.Cub
