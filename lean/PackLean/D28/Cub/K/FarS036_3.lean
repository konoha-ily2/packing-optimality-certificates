-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey036

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_13 : List Tok := [.split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, (.A 1 2 4 1 7), .split, (.A 5 2 6 1 7), .split, .split, (.A 1 2 4 0 7), .split, (.A 5 2 6 0 7), .split, .split, (.A 1 2 4 0 7), .split, .split, .split, (.A 1 2 6 0 7), (.A 4 2 6 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_13 : wsegOk P nbM092 (nInsideL P nbM092) kM092_13 tM092_13 kM092_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_14 : List Tok := [.split, (.A 5 2 6 0 7), .split, (.A 5 2 6 0 7), (.A 5 2 6 0 7), .split, .split, (.A 0 2 4 0 7), (.A 0 2 6 0 7), (.A 0 2 6 0 3), .split, (.A 1 2 4 0 3), .split, (.A 5 2 6 0 3), .split, .split, (.A 1 2 6 0 3), .split, .split, .split, (.A 5 2 6 0 3), (.A 4 2 6 0 3), (.A 5 2 6 0 3), .split, .split, (.A 0 2 6 0 3), (.A 4 2 6 0 3), (.A 4 2 6 0 3), (.A 5 2 6 0 3), (.A 5 2 6 0 3), .split, (.A 5 2 4 1 3), (.A 5 2 6 0 3), .split, .split, (.A 5 0 4 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_14 : wsegOk P nbM092 (nInsideL P nbM092) kM092_14 tM092_14 kM092_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_15 : List Tok := [.split, (.A 1 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, .split, (.A 5 0 6 5 3), (.D 15), .split, .split, .split, (.D 4), .split, (.A 1 0 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_15 : wsegOk P nbM092 (nInsideL P nbM092) kM092_15 tM092_15 kM092_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_16 : List Tok := [.split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3), .split, .split, (.A 1 6 5 0 3), (.A 0 2 4 0 3), (.A 1 2 5 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, .split, (.A 0 2 4 0 3), .split, (.A 1 2 4 0 3), .split, (.A 0 2 6 0 3), (.A 0 2 4 0 3), (.A 0 2 4 0 3), .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_16 : wsegOk P nbM092 (nInsideL P nbM092) kM092_16 tM092_16 kM092_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_17 : List Tok := [.split, .split, .split, (.A 1 2 6 0 3), (.A 4 2 6 0 3), (.A 5 2 6 0 3), (.A 0 2 6 0 3), .split, (.A 1 2 6 0 3), .split, (.A 5 2 6 0 3), .split, .split, (.A 1 2 6 0 3), (.A 4 2 6 0 3), (.A 5 2 6 0 3), .split, (.A 0 2 4 0 3), .split, .split, (.A 1 2 4 0 3), (.A 0 2 4 0 3), .split, (.A 0 2 6 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 6 0 3), (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 5 0 3), .split, .split, (.A 0 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_17 : wsegOk P nbM092 (nInsideL P nbM092) kM092_17 tM092_17 kM092_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_18 : List Tok := [(.A 0 2 5 0 3), (.A 0 2 5 0 1), .split, (.A 1 2 5 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 6 0 3), .split, .split, .split, (.A 1 2 4 0 3), (.A 1 2 5 0 3), .split, .split, .split, .split, (.A 5 2 6 0 3), .split, .split, (.A 1 2 6 0 3), .split, (.A 1 2 6 0 3), (.A 0 2 6 0 3), (.A 1 2 6 0 3), (.A 4 2 6 0 3), (.A 5 2 6 0 3), .split, (.A 0 2 6 0 3), (.A 0 2 7 0 3), .split, (.A 1 2 7 0 3), .split, (.A 5 2 7 0 3), .split, .split, .split, (.A 5 2 7 0 3), (.A 1 2 7 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_18 : wsegOk P nbM092 (nInsideL P nbM092) kM092_18 tM092_18 kM092_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_19 : List Tok := [(.A 4 2 7 0 3), (.A 5 2 7 0 3), (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), .split, .split, (.A 0 2 5 0 3), .split, (.A 1 2 5 0 3), .split, (.A 0 2 7 0 3), (.A 0 2 5 0 3), (.A 0 2 5 0 3), .split, (.A 1 2 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), (.A 4 2 7 0 3), (.A 5 2 7 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), (.A 0 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_19 : wsegOk P nbM092 (nInsideL P nbM092) kM092_19 tM092_19 kM092_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_20 : List Tok := [.split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), (.A 1 6 7 1 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), (.A 4 2 7 0 3), (.A 5 2 7 0 3), (.A 5 2 7 0 3), .split, (.A 1 2 7 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_20 : wsegOk P nbM092 (nInsideL P nbM092) kM092_20 tM092_20 kM092_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_21 : List Tok := [(.A 5 2 7 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 3), .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 7 0 3), (.A 4 2 7 0 3), (.D 12), (.D 12), (.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), (.A 1 4 5 1 3), (.D 4), (.D 1), .split, .split, .split, .split, (.A 1 6 7 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_21 : wsegOk P nbM092 (nInsideL P nbM092) kM092_21 tM092_21 kM092_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_22 : List Tok := [(.D 12), .split, .split, .split, (.A 1 2 7 1 3), (.A 5 2 7 4 3), (.D 12), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, (.A 5 3 6 5 7), (.A 4 3 6 4 7), .split, (.A 5 0 6 5 7), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, .split, (.A 4 2 6 4 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_22 : wsegOk P nbM092 (nInsideL P nbM092) kM092_22 tM092_22 kM092_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_23 : List Tok := [(.A 5 2 6 4 7), .split, .split, .split, (.A 5 2 6 0 7), .split, .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 4 2 6 0 7), .split, .split, (.A 0 2 6 0 7), (.A 4 2 6 0 5), .split, .split, (.A 4 2 6 0 3), .split, (.A 0 2 6 0 3), (.A 4 2 6 0 3), (.A 4 2 6 0 1), (.A 4 2 6 0 5), (.A 4 2 6 0 3), (.A 4 2 6 0 5), (.A 4 2 6 0 3), (.A 4 2 6 0 5), .split, (.A 5 2 6 0 3), (.A 4 2 6 4 1), .split, .split, .split, (.A 4 3 6 4 7), (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_23 : wsegOk P nbM092 (nInsideL P nbM092) kM092_23 tM092_23 kM092_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_24 : List Tok := [(.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 5 2 6 4 3), (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, .split, (.D 13), (.A 5 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_24 : wsegOk P nbM092 (nInsideL P nbM092) kM092_24 tM092_24 kM092_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_25 : List Tok := [.split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 2 6 0 1), .split, .split, .split, .split, (.A 0 2 6 0 3), (.A 4 2 6 0 1), (.A 4 2 6 0 3), (.A 0 2 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_25 : wsegOk P nbM092 (nInsideL P nbM092) kM092_25 tM092_25 kM092_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_26 : List Tok := [(.A 4 2 6 0 1), (.A 0 2 4 0 1), (.A 4 2 6 0 1), .split, .split, .split, .split, .split, (.A 4 2 6 0 3), .split, .split, .split, (.A 4 2 6 0 3), (.A 0 2 6 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 3), (.A 4 2 6 0 1), (.A 4 2 6 0 3), .split, (.A 0 2 6 0 1), .split, .split, .split, .split, .split, (.A 4 2 6 0 3), .split, (.A 0 2 6 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), (.A 0 2 6 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), .split, (.A 0 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_26 : wsegOk P nbM092 (nInsideL P nbM092) kM092_26 tM092_26 kM092_27 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_27 : List Tok := [.split, (.A 0 2 5 0 1), .split, (.A 4 2 7 0 1), (.A 4 2 5 0 1), .split, (.A 4 2 6 0 1), .split, .split, .split, (.A 4 2 6 0 1), .split, (.A 0 2 6 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, .split, .split, .split, (.A 5 2 6 0 3), .split, .split, .split, (.A 4 2 6 0 3), .split, .split, .split, (.A 4 2 6 0 3), .split, .split, (.A 0 2 7 0 3), (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 2 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_27 : wsegOk P nbM092 (nInsideL P nbM092) kM092_27 tM092_27 kM092_28 = true := by
  decide +kernel

end PackLean.D28.Cub
