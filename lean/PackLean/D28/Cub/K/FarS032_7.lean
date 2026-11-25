-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey032

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM086_12 : List Tok := [(.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, (.A 4 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM086_12 : wsegOk P nbM086 (nInsideL P nbM086) kM086_12 tM086_12 kM086_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM086_13 : List Tok := [(.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 7), .split, .split, (.A 1 2 4 0 7), .split, (.A 5 2 6 0 7), .split, .split, (.A 1 2 4 0 7), .split, (.A 5 2 6 0 7), .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 5 2 4 0 7), (.A 0 2 4 0 7), .split, (.A 4 2 6 0 7), .split, (.A 0 2 4 0 7), .split, (.A 4 2 4 0 3), (.A 4 2 6 0 3), .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM086_13 : wsegOk P nbM086 (nInsideL P nbM086) kM086_13 tM086_13 kM086_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM086_14 : List Tok := [.split, (.A 5 2 4 0 3), (.A 4 2 4 0 3), (.A 5 2 4 0 3), (.A 4 2 6 0 3), (.A 5 2 6 0 3), (.A 5 2 6 0 3), (.A 5 2 6 1 3), .split, .split, (.A 5 0 4 1 3), .split, (.A 1 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, .split, (.A 5 0 6 5 3), (.D 15), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM086_14 : wsegOk P nbM086 (nInsideL P nbM086) kM086_14 tM086_14 kM086_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM086_15 : List Tok := [.split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3), .split, .split, (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM086_15 : wsegOk P nbM086 (nInsideL P nbM086) kM086_15 tM086_15 kM086_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM086_16 : List Tok := [.split, (.A 1 2 4 0 3), (.A 0 6 5 0 3), (.A 1 2 5 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, .split, (.A 0 2 4 0 3), .split, (.A 1 2 4 0 3), .split, .split, (.A 4 2 4 0 3), .split, (.A 5 2 4 0 3), (.A 4 2 6 0 3), (.A 0 2 4 0 3), (.A 0 2 4 0 3), .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 6 0 3), .split, (.A 4 2 4 0 3), (.A 5 2 6 0 3), (.A 5 2 6 0 3), .split, (.A 0 2 4 0 3), .split, (.A 1 2 4 0 3), .split, .split, (.A 4 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM086_16 : wsegOk P nbM086 (nInsideL P nbM086) kM086_16 tM086_16 kM086_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM086_17 : List Tok := [.split, (.A 5 2 6 0 3), (.A 4 2 6 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), (.A 4 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 5 0 3), .split, .split, (.A 0 2 4 0 3), (.A 0 2 5 0 3), (.A 0 2 5 0 1), .split, (.A 1 2 5 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 6 0 3), .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 6 0 3), .split, .split, .split, .split, .split, (.A 5 2 4 0 3), .split, (.A 5 2 6 0 3), (.A 4 2 4 0 3), (.A 5 2 6 0 3), (.A 0 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM086_17 : wsegOk P nbM086 (nInsideL P nbM086) kM086_17 tM086_17 kM086_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM086_18 : List Tok := [.split, (.A 4 2 6 0 3), .split, .split, (.A 4 2 5 0 3), (.A 4 2 7 0 3), (.A 4 2 7 0 3), (.A 5 2 7 0 3), (.A 5 2 7 0 3), (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), .split, .split, (.A 0 2 5 0 3), .split, (.A 1 2 5 0 3), (.A 4 2 5 0 3), (.A 0 2 5 0 3), .split, (.A 1 2 5 0 3), .split, .split, (.A 5 2 7 0 3), (.A 5 2 7 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM086_18 : wsegOk P nbM086 (nInsideL P nbM086) kM086_18 tM086_18 kM086_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM086_19 : List Tok := [(.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, .split, (.A 0 2 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), (.A 1 6 7 1 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), (.A 5 2 7 0 3), (.A 5 2 7 0 3), .split, (.A 1 2 7 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM086_19 : wsegOk P nbM086 (nInsideL P nbM086) kM086_19 tM086_19 kM086_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM086_20 : List Tok := [(.A 5 2 7 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 6 5 0 3), (.A 0 2 5 0 3), .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 7 0 3), (.A 5 2 7 0 3), (.D 12), (.D 12), (.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), (.A 1 4 5 1 3), (.D 4), (.D 1), .split, .split, .split, .split, (.A 1 6 7 1 3), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM086_20 : wsegOk P nbM086 (nInsideL P nbM086) kM086_20 tM086_20 kM086_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM086_21 : List Tok := [.split, .split, (.A 5 2 7 4 3), (.D 12), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, (.A 5 3 6 5 7), (.A 4 3 6 4 7), .split, (.A 5 0 6 5 7), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, .split, (.A 4 2 6 4 7), (.A 5 2 6 4 7), .split, .split, .split, (.A 5 2 6 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM086_21 : wsegOk P nbM086 (nInsideL P nbM086) kM086_21 tM086_21 kM086_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM086_22 : List Tok := [.split, .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 4 2 6 0 7), .split, .split, (.A 4 2 6 0 7), (.A 4 2 6 0 5), (.A 4 2 6 0 3), (.A 4 2 6 0 5), (.A 4 2 6 0 3), (.A 4 2 6 0 5), (.A 4 2 6 0 3), (.A 4 2 6 0 5), (.A 4 2 6 0 3), (.A 4 2 6 0 5), .split, (.A 5 2 6 0 3), (.A 4 2 6 4 1), .split, .split, .split, (.A 4 3 6 4 7), (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM086_22 : wsegOk P nbM086 (nInsideL P nbM086) kM086_22 tM086_22 kM086_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM086_23 : List Tok := [.split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 5 2 6 4 3), (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 5 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM086_23 : wsegOk P nbM086 (nInsideL P nbM086) kM086_23 tM086_23 kM086_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM086_24 : List Tok := [.split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 2 6 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), (.A 0 2 4 0 1), (.A 4 2 6 0 1), .split, (.A 4 2 6 0 1), (.A 4 2 6 0 1), (.A 0 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM086_24 : wsegOk P nbM086 (nInsideL P nbM086) kM086_24 tM086_24 kM086_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM086_25 : List Tok := [(.A 4 2 6 0 1), .split, .split, (.A 4 2 6 0 1), .split, .split, .split, (.A 4 2 6 0 1), (.A 0 2 4 0 1), (.A 4 2 6 0 1), .split, .split, (.A 4 2 6 0 1), .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 4 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), .split, (.A 0 2 4 0 1), .split, (.A 0 2 5 0 1), (.A 4 2 7 0 1), (.A 4 2 6 0 1), .split, .split, .split, (.A 4 2 6 0 1), (.A 5 2 7 0 1), .split, .split, .split, (.A 4 2 7 0 1), (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM086_25 : wsegOk P nbM086 (nInsideL P nbM086) kM086_25 tM086_25 kM086_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM086_26 : List Tok := [(.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, (.A 0 2 5 0 1), .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, .split, (.A 5 2 7 4 1), (.A 5 2 7 4 1), .split, .split, .split, .split, .split, (.A 4 2 5 0 1), (.A 4 2 7 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, (.A 0 7 5 0 1), .split, (.A 4 3 5 0 1), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM086_26 : wsegOk P nbM086 (nInsideL P nbM086) kM086_26 tM086_26 kM086_27 = true := by
  decide +kernel

end PackLean.D28.Cub
