-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey029

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_14 : List Tok := [.split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), .split, .split, (.A 4 2 4 0 3), .split, .split, (.A 4 2 6 0 3), (.A 4 2 4 0 3), (.A 4 2 6 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), (.A 4 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 5 0 3), .split, (.A 0 2 5 0 3), (.A 0 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_14 : wsegOk P nbM080 (nInsideL P nbM080) kM080_14 tM080_14 kM080_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_15 : List Tok := [.split, (.A 1 2 5 0 3), .split, .split, .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), (.A 0 2 4 0 3), (.A 1 2 5 0 3), .split, (.A 4 2 6 0 3), .split, .split, (.A 4 2 4 0 3), .split, (.A 4 2 6 0 3), (.A 4 2 7 0 3), (.A 4 2 7 0 3), .split, (.A 5 2 7 0 3), (.A 5 2 7 0 3), .split, .split, (.A 0 2 5 0 3), .split, (.A 0 2 5 0 3), (.A 0 2 5 0 3), .split, (.A 0 2 5 0 3), (.A 4 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_15 : wsegOk P nbM080 (nInsideL P nbM080) kM080_15 tM080_15 kM080_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_16 : List Tok := [.split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, .split, (.A 0 2 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), .split, .split, .split, (.A 5 2 7 0 3), (.A 1 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_16 : wsegOk P nbM080 (nInsideL P nbM080) kM080_16 tM080_16 kM080_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_17 : List Tok := [(.A 4 2 7 0 3), (.A 5 2 7 0 3), .split, .split, (.A 5 2 7 0 3), (.A 1 6 7 0 3), (.A 5 2 7 0 3), .split, .split, .split, (.A 1 6 5 0 3), (.D 12), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), (.A 4 2 5 0 3), .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 4 2 5 0 3), (.D 12), (.D 12), .split, (.A 4 2 7 0 3), (.D 12), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_17 : wsegOk P nbM080 (nInsideL P nbM080) kM080_17 tM080_17 kM080_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_18 : List Tok := [(.D 12), .split, .split, (.A 0 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), (.A 1 4 5 1 3), (.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3), (.A 1 6 7 1 3), (.D 12), (.D 12), .split, .split, (.A 5 2 7 4 3), (.D 12), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_18 : wsegOk P nbM080 (nInsideL P nbM080) kM080_18 tM080_18 kM080_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_19 : List Tok := [(.A 4 2 6 5 7), (.A 4 3 6 4 7), .split, .split, (.D 17), (.A 5 2 6 5 7), (.D 13), .split, (.D 13), (.A 4 1 6 4 7), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 4 2 6 0 7), (.A 0 2 6 0 1), (.A 4 2 6 0 5), (.A 4 2 6 0 3), (.A 4 2 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_19 : wsegOk P nbM080 (nInsideL P nbM080) kM080_19 tM080_19 kM080_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_20 : List Tok := [(.A 4 2 6 0 3), (.A 4 2 6 0 5), (.A 4 2 6 0 3), (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, .split, (.A 4 3 6 4 7), (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 4 2 6 4 3), (.A 5 0 6 5 3), .split, .split, (.A 5 2 6 4 3), (.A 4 2 6 4 1), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_20 : wsegOk P nbM080 (nInsideL P nbM080) kM080_20 tM080_20 kM080_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_21 : List Tok := [.split, .split, (.D 13), (.A 4 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_21 : wsegOk P nbM080 (nInsideL P nbM080) kM080_21 tM080_21 kM080_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_22 : List Tok := [.split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 2 6 0 1), (.A 4 2 6 0 1), .split, .split, (.A 4 2 6 0 1), .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 4 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), .split, (.A 0 2 4 0 1), .split, (.A 0 2 5 0 1), (.A 4 2 7 0 1), (.A 4 2 6 0 1), .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), .split, (.A 4 2 7 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_22 : wsegOk P nbM080 (nInsideL P nbM080) kM080_22 tM080_22 kM080_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_23 : List Tok := [(.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, (.A 0 2 5 0 1), .split, (.A 4 2 5 0 1), .split, (.A 4 3 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 4 2 5 0 1), .split, .split, (.A 0 6 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 4 3 7 0 1), (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, .split, .split, (.A 4 2 7 4 1), (.A 4 2 7 4 1), (.A 5 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_23 : wsegOk P nbM080 (nInsideL P nbM080) kM080_23 tM080_23 kM080_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_24 : List Tok := [(.A 4 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_24 : wsegOk P nbM080 (nInsideL P nbM080) kM080_24 tM080_24 kM080_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_25 : List Tok := [(.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_25 : wsegOk P nbM080 (nInsideL P nbM080) kM080_25 tM080_25 kM080_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_26 : List Tok := [.split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_26 : wsegOk P nbM080 (nInsideL P nbM080) kM080_26 tM080_26 [] = true := by
  decide +kernel

end PackLean.D28.Cub
