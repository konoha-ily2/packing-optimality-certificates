-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey054

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_10 : List Tok := [.split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), (.A 0 3 5 0 1), .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), .split, .split, (.A 0 3 4 0 1), (.D 6), .split, (.A 0 3 5 0 1), .split, (.A 0 3 7 0 1), (.D 6), .split, .split, (.A 2 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1), (.A 0 7 5 0 1), (.D 18), .split, .split, (.D 6), .split, .split, (.A 0 3 5 0 1), (.D 18), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_10 : wsegOk P nbM130 (nInsideL P nbM130) kM130_10 tM130_10 kM130_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_11 : List Tok := [(.D 18), .split, .split, (.D 6), .split, .split, .split, (.D 6), (.A 4 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 2 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_11 : wsegOk P nbM130 (nInsideL P nbM130) kM130_11 tM130_11 kM130_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_12 : List Tok := [.split, (.D 4), .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), (.A 1 2 4 1 3), .split, (.A 0 2 6 1 7), .split, .split, (.A 0 2 4 0 7), (.A 0 2 6 0 7), (.A 0 2 6 0 3), .split, .split, (.A 1 2 4 1 3), .split, (.A 1 2 4 1 3), .split, (.A 1 2 4 1 3), (.A 1 2 6 1 3), .split, .split, .split, (.A 1 2 6 1 3), (.A 4 2 6 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_12 : wsegOk P nbM130 (nInsideL P nbM130) kM130_12 tM130_12 kM130_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_13 : List Tok := [(.A 5 2 6 1 3), (.A 0 2 6 0 3), .split, .split, .split, .split, (.D 4), (.A 5 2 4 1 3), (.D 4), .split, .split, .split, (.D 4), (.A 1 2 5 1 3), .split, (.A 1 2 4 1 3), (.A 1 2 5 1 3), .split, (.D 4), .split, .split, (.A 1 2 6 1 3), (.D 4), (.A 1 2 7 1 3), .split, .split, (.A 5 2 6 5 3), (.A 5 0 6 5 3), .split, .split, (.A 1 2 6 1 3), .split, (.A 5 2 6 5 3), .split, .split, .split, (.A 5 2 6 1 3), .split, (.A 0 2 6 0 3), (.A 5 2 6 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_13 : wsegOk P nbM130 (nInsideL P nbM130) kM130_13 tM130_13 kM130_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_14 : List Tok := [(.A 4 2 6 0 3), (.A 5 2 6 0 3), .split, .split, (.A 5 2 6 1 3), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 3), .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_14 : wsegOk P nbM130 (nInsideL P nbM130) kM130_14 tM130_14 kM130_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_15 : List Tok := [(.A 1 6 5 0 3), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), (.A 0 6 5 0 3), .split, (.A 1 2 4 0 3), (.A 0 6 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), (.A 0 2 5 0 3), .split, (.A 0 2 5 0 3), .split, .split, (.A 0 2 6 0 3), (.A 0 2 7 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_15 : wsegOk P nbM130 (nInsideL P nbM130) kM130_15 tM130_15 kM130_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_16 : List Tok := [.split, (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 5 0 3), (.A 0 2 7 0 3), (.A 1 2 7 0 3), (.A 0 2 5 0 3), .split, .split, .split, (.A 0 2 7 0 3), (.A 4 2 7 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_16 : wsegOk P nbM130 (nInsideL P nbM130) kM130_16 tM130_16 kM130_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_17 : List Tok := [(.A 4 2 7 0 3), (.A 0 2 7 0 3), .split, .split, (.A 1 2 7 0 3), .split, .split, .split, (.A 1 2 7 0 3), (.A 0 6 7 0 3), (.A 0 2 7 0 3), .split, (.A 1 6 7 0 3), .split, (.A 5 2 7 0 3), (.D 12), (.A 4 2 7 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 6 5 0 3), (.D 12), (.A 4 2 7 0 3), (.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_17 : wsegOk P nbM130 (nInsideL P nbM130) kM130_17 tM130_17 kM130_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_18 : List Tok := [(.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3), .split, (.A 1 6 7 1 3), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, (.A 5 2 7 1 3), (.D 12), (.A 5 2 7 4 3), (.D 12), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_18 : wsegOk P nbM130 (nInsideL P nbM130) kM130_18 tM130_18 kM130_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_19 : List Tok := [.split, .split, (.A 5 3 6 5 7), (.A 4 3 6 4 7), .split, .split, (.D 17), (.A 5 2 6 5 7), (.D 13), .split, (.D 13), (.A 4 1 6 4 7), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 0 2 6 0 7), (.A 0 2 6 0 1), (.A 0 2 6 0 5), (.A 0 2 6 0 3), (.A 4 2 6 0 5), .split, (.A 4 2 6 0 3), .split, (.A 4 2 6 4 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_19 : wsegOk P nbM130 (nInsideL P nbM130) kM130_19 tM130_19 kM130_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_20 : List Tok := [(.A 4 2 6 4 1), .split, .split, .split, (.A 4 3 6 4 7), (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 4 2 6 4 3), .split, (.A 5 0 6 5 3), (.D 13), (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, .split, (.D 13), (.A 4 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_20 : wsegOk P nbM130 (nInsideL P nbM130) kM130_20 tM130_20 kM130_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_21 : List Tok := [(.D 13), .split, (.A 4 3 6 4 5), .split, .split, (.D 13), (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), .split, .split, (.A 5 2 7 5 3), .split, (.D 13), (.A 4 2 7 4 1), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_21 : wsegOk P nbM130 (nInsideL P nbM130) kM130_21 tM130_21 kM130_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_22 : List Tok := [(.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 2 6 0 1), .split, (.A 0 2 4 0 1), (.A 0 2 5 0 1), (.A 0 2 6 0 1), .split, .split, .split, (.A 0 2 6 0 1), .split, (.A 4 2 7 0 3), (.A 4 2 7 0 1), .split, (.A 0 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, (.A 0 2 5 0 1), .split, (.A 0 2 5 0 1), .split, (.A 0 3 5 0 1), (.A 4 2 5 0 1), .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_22 : wsegOk P nbM130 (nInsideL P nbM130) kM130_22 tM130_22 kM130_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_23 : List Tok := [.split, .split, .split, .split, (.A 4 2 6 0 1), .split, (.A 4 3 7 0 1), (.A 4 2 7 0 1), (.A 4 3 7 0 1), (.A 4 2 7 4 1), .split, .split, .split, (.A 4 3 7 0 1), (.A 4 3 5 0 1), (.A 4 3 7 4 1), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, (.A 4 2 7 4 3), (.A 4 2 7 4 1), (.A 4 2 7 4 1), (.A 4 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, (.A 0 7 5 0 1), (.A 4 7 5 0 1), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_23 : wsegOk P nbM130 (nInsideL P nbM130) kM130_23 tM130_23 kM130_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_24 : List Tok := [(.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, .split, (.A 4 2 7 4 1), (.D 12), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_24 : wsegOk P nbM130 (nInsideL P nbM130) kM130_24 tM130_24 kM130_25 = true := by
  decide +kernel

end PackLean.D28.Cub
