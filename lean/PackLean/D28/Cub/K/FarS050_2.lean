-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey050

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_13 : List Tok := [(.A 0 2 4 0 3), .split, (.A 1 2 4 1 3), (.A 1 2 6 1 3), .split, .split, .split, .split, (.A 5 2 6 1 7), (.A 0 2 6 1 3), (.A 4 2 6 0 3), (.A 4 2 6 1 3), (.A 0 2 6 0 3), .split, .split, .split, .split, (.D 4), (.A 5 2 4 1 3), (.D 4), .split, .split, .split, (.D 4), (.A 1 2 5 1 3), .split, (.A 1 2 4 1 3), (.A 1 2 5 1 3), .split, (.D 4), .split, .split, .split, (.D 4), (.A 5 2 6 1 3), (.D 4), (.A 1 2 7 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_13 : wsegOk P nbM121 (nInsideL P nbM121) kM121_13 tM121_13 kM121_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_14 : List Tok := [.split, .split, (.A 5 2 6 5 3), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 6 1 3), .split, (.A 1 2 6 1 3), (.A 5 2 7 1 3), .split, (.A 5 2 6 5 3), (.A 4 2 6 0 3), .split, .split, (.A 5 2 6 1 3), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_14 : wsegOk P nbM121 (nInsideL P nbM121) kM121_14 tM121_14 kM121_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_15 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 4), (.D 1), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 0 6 5 0 3), .split, (.D 1), (.A 1 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), .split, (.A 1 2 4 1 7), (.A 1 6 4 0 3), (.A 1 2 5 1 3), (.A 0 6 5 0 3), .split, (.A 0 2 4 0 3), (.A 0 6 5 0 3), .split, (.A 1 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 0 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_15 : wsegOk P nbM121 (nInsideL P nbM121) kM121_15 tM121_15 kM121_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_16 : List Tok := [.split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), (.A 0 2 5 0 3), .split, (.A 0 2 5 0 3), .split, .split, (.A 0 2 6 0 3), (.A 0 2 7 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, .split, .split, (.A 1 6 5 1 3), (.D 4), (.A 1 6 5 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_16 : wsegOk P nbM121 (nInsideL P nbM121) kM121_16 tM121_16 kM121_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_17 : List Tok := [.split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 0 2 5 0 3), (.A 0 2 7 0 3), (.A 1 2 7 0 3), (.A 0 2 5 0 3), (.A 4 2 7 0 3), .split, .split, .split, .split, (.A 1 2 7 1 3), (.A 5 2 7 0 3), (.A 5 2 7 1 3), .split, .split, .split, (.A 0 2 7 0 3), (.A 0 6 7 0 3), (.A 4 2 7 0 3), .split, (.A 1 6 7 0 3), (.A 4 2 7 0 3), (.A 4 2 7 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 4 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_17 : wsegOk P nbM121 (nInsideL P nbM121) kM121_17 tM121_17 kM121_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_18 : List Tok := [(.A 4 6 5 0 3), (.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 1), (.D 12), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3), .split, .split, (.A 1 2 7 1 3), (.A 5 6 7 1 3), (.D 12), (.D 12), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_18 : wsegOk P nbM121 (nInsideL P nbM121) kM121_18 tM121_18 kM121_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_19 : List Tok := [.split, .split, .split, .split, (.A 5 2 7 1 3), (.D 12), (.A 5 2 7 4 3), (.D 12), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, .split, (.D 17), (.A 4 2 6 5 7), (.A 4 3 6 4 7), .split, .split, (.D 17), (.A 4 2 6 5 7), (.D 13), .split, (.D 13), (.A 4 1 6 4 7), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_19 : wsegOk P nbM121 (nInsideL P nbM121) kM121_19 tM121_19 kM121_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_20 : List Tok := [.split, .split, .split, (.A 4 2 6 4 7), .split, .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 0 2 6 0 7), (.A 0 2 6 0 1), (.A 0 2 6 0 5), (.A 0 2 6 0 3), (.A 4 2 6 0 5), .split, (.A 4 2 6 0 3), .split, (.A 4 2 6 4 3), (.A 4 2 6 4 1), .split, .split, .split, (.A 4 3 6 4 7), (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_20 : wsegOk P nbM121 (nInsideL P nbM121) kM121_20 tM121_20 kM121_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_21 : List Tok := [(.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, .split, (.D 13), (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, .split, (.A 5 2 7 5 3), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_21 : wsegOk P nbM121 (nInsideL P nbM121) kM121_21 tM121_21 kM121_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_22 : List Tok := [(.A 4 2 7 4 1), .split, (.D 15), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 2 6 0 1), .split, (.A 0 2 4 0 1), (.A 0 2 5 0 1), .split, (.A 4 2 6 0 1), .split, (.A 0 2 6 0 1), (.A 4 2 7 0 1), .split, .split, .split, .split, (.A 0 2 6 0 3), (.A 4 2 6 0 1), .split, (.A 4 2 7 0 3), (.A 4 2 7 0 1), .split, .split, (.A 0 2 7 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_22 : wsegOk P nbM121 (nInsideL P nbM121) kM121_22 tM121_22 kM121_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_23 : List Tok := [(.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, (.A 0 2 5 0 1), .split, .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 0 3 5 0 1), (.A 4 3 5 0 1), (.A 4 2 5 0 1), .split, (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 3 7 0 1), (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, .split, .split, (.A 4 2 7 4 1), (.A 4 2 7 4 1), (.A 4 2 7 4 1), .split, .split, (.A 4 2 5 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_23 : wsegOk P nbM121 (nInsideL P nbM121) kM121_23 tM121_23 kM121_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_24 : List Tok := [(.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, .split, (.A 4 2 7 4 1), (.D 12), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_24 : wsegOk P nbM121 (nInsideL P nbM121) kM121_24 tM121_24 kM121_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_25 : List Tok := [(.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_25 : wsegOk P nbM121 (nInsideL P nbM121) kM121_25 tM121_25 kM121_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_26 : List Tok := [(.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_26 : wsegOk P nbM121 (nInsideL P nbM121) kM121_26 tM121_26 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN122_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN122_0 : wsegOk P nbN122 (nInsideL P nbN122) (rRoots P.rden) tN122_0 kN122_1 = true := by
  decide +kernel

end PackLean.D28.Cub
