-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey059

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_8 : List Tok := [.split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, .split, (.D 6), (.A 0 3 6 0 5), (.D 6), .split, (.D 9), (.A 2 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), .split, (.D 6), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), (.A 0 3 4 0 1), .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_8 : wsegOk P nbM140 (nInsideL P nbM140) kM140_8 tM140_8 kM140_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_9 : List Tok := [(.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 2 4 0 1), .split, .split, (.A 0 3 6 0 5), (.A 0 2 6 0 1), .split, (.A 0 3 6 0 1), (.A 0 2 6 0 1), .split, .split, .split, (.A 0 7 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 5 0 1), (.A 0 3 5 0 1), .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), .split, .split, (.A 0 3 4 0 1), (.D 6), .split, (.A 0 3 5 0 1), (.A 0 3 7 0 1), .split, .split, (.A 2 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_9 : wsegOk P nbM140 (nInsideL P nbM140) kM140_9 tM140_9 kM140_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_10 : List Tok := [(.D 6), .split, (.A 0 7 5 2 1), .split, .split, (.D 6), (.A 0 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, (.A 0 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 2 6 5 7), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_10 : wsegOk P nbM140 (nInsideL P nbM140) kM140_10 tM140_10 kM140_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_11 : List Tok := [.split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, .split, (.A 1 2 4 1 7), .split, (.D 4), .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 1 2 6 1 7), .split, .split, (.A 0 2 4 0 7), (.A 0 2 6 0 7), (.A 0 2 6 0 3), .split, (.A 1 2 4 1 3), .split, .split, (.A 1 2 6 1 3), (.A 5 2 6 1 3), .split, .split, (.A 1 2 6 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_11 : wsegOk P nbM140 (nInsideL P nbM140) kM140_11 tM140_11 kM140_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_12 : List Tok := [(.A 0 2 6 0 3), .split, (.A 1 2 6 0 3), (.A 0 2 6 0 3), .split, .split, .split, .split, (.D 4), (.A 5 2 4 1 3), (.D 4), .split, .split, (.A 1 2 5 1 3), (.A 1 2 4 1 3), .split, (.D 4), .split, (.A 1 2 6 1 3), (.A 1 2 7 1 3), .split, .split, (.A 5 2 6 5 3), (.A 5 0 6 5 3), .split, .split, (.A 1 2 6 1 3), .split, (.A 5 2 6 5 3), .split, .split, (.A 1 2 6 0 3), (.A 5 2 6 0 3), (.A 5 2 6 0 3), .split, .split, (.A 5 2 6 1 3), (.A 1 2 7 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_12 : wsegOk P nbM140 (nInsideL P nbM140) kM140_12 tM140_12 kM140_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_13 : List Tok := [(.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), (.A 1 0 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 3), .split, (.D 1), (.A 1 6 5 0 3), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_13 : wsegOk P nbM140 (nInsideL P nbM140) kM140_13 tM140_13 kM140_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_14 : List Tok := [(.A 1 6 5 0 3), .split, (.A 1 2 4 0 3), (.A 0 6 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), (.A 0 2 4 0 3), .split, .split, (.A 1 2 5 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 2 6 0 3), (.A 0 2 7 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_14 : wsegOk P nbM140 (nInsideL P nbM140) kM140_14 tM140_14 kM140_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_15 : List Tok := [(.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 2 7 0 3), (.A 0 2 5 0 3), (.A 0 2 7 0 3), .split, .split, (.A 1 2 7 0 3), .split, .split, (.A 1 6 7 0 3), (.A 0 2 7 0 3), (.A 1 6 7 0 3), .split, (.A 5 2 7 4 3), (.A 4 2 7 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_15 : wsegOk P nbM140 (nInsideL P nbM140) kM140_15 tM140_15 kM140_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_16 : List Tok := [(.A 0 2 7 0 3), (.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, (.A 1 6 7 1 3), (.D 12), (.D 12), .split, .split, .split, (.A 1 2 7 1 3), (.A 5 2 7 4 3), (.D 12), (.D 12), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_16 : wsegOk P nbM140 (nInsideL P nbM140) kM140_16 tM140_16 kM140_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_17 : List Tok := [(.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, (.A 5 3 6 5 7), (.A 4 3 6 4 7), .split, (.A 5 0 6 5 7), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, .split, .split, .split, (.A 0 2 6 0 7), (.A 4 2 6 0 7), .split, .split, (.A 0 2 6 0 7), (.A 0 2 6 0 5), (.A 0 2 6 0 3), (.A 4 2 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_17 : wsegOk P nbM140 (nInsideL P nbM140) kM140_17 tM140_17 kM140_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_18 : List Tok := [.split, .split, (.A 4 2 6 0 3), .split, .split, (.A 0 2 6 0 3), (.A 4 2 6 0 3), (.A 4 2 6 0 3), .split, (.A 4 2 6 4 3), (.A 4 2 6 4 1), .split, .split, .split, (.A 4 3 6 4 7), (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 4 2 6 4 3), .split, (.A 5 0 6 5 3), (.D 13), (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_18 : wsegOk P nbM140 (nInsideL P nbM140) kM140_18 tM140_18 kM140_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_19 : List Tok := [.split, .split, (.D 13), (.A 4 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, .split, (.D 13), (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), .split, (.A 5 2 7 4 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_19 : wsegOk P nbM140 (nInsideL P nbM140) kM140_19 tM140_19 kM140_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_20 : List Tok := [(.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 2 6 0 1), .split, (.A 0 2 4 0 1), (.A 0 2 5 0 1), (.A 0 2 6 0 1), .split, .split, .split, (.A 0 2 6 0 1), .split, (.A 0 2 7 0 3), (.A 4 2 7 0 1), (.A 0 2 7 0 1), (.A 4 2 7 0 1), (.A 0 2 5 0 1), .split, .split, .split, .split, (.A 4 2 6 0 1), .split, (.A 0 3 7 0 1), (.A 4 2 7 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_20 : wsegOk P nbM140 (nInsideL P nbM140) kM140_20 tM140_20 kM140_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_21 : List Tok := [(.A 4 3 7 0 1), (.A 4 2 7 4 1), .split, .split, .split, (.A 4 3 7 0 1), (.A 4 3 5 0 1), (.A 4 3 7 4 1), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, (.A 4 2 7 4 3), (.A 4 2 7 4 1), (.A 4 2 7 4 1), .split, (.A 4 2 7 4 1), (.A 4 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, (.A 0 7 5 0 1), .split, (.A 0 3 5 0 1), (.D 18), (.D 12), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_21 : wsegOk P nbM140 (nInsideL P nbM140) kM140_21 tM140_21 kM140_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_22 : List Tok := [.split, (.A 4 3 5 4 1), (.D 18), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_22 : wsegOk P nbM140 (nInsideL P nbM140) kM140_22 tM140_22 kM140_23 = true := by
  decide +kernel

end PackLean.D28.Cub
