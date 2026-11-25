-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey027

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN076_14 : List Tok := [(.A 5 2 6 0 3), (.A 5 2 6 1 3), .split, .split, (.A 5 0 4 1 3), .split, .split, .split, (.D 4), (.A 1 2 5 1 3), (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, .split, (.A 5 0 6 5 3), (.D 15), .split, .split, .split, (.D 4), .split, .split, (.D 4), (.A 5 0 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN076_14 : wsegOk P nbN076 (nInsideL P nbN076) kN076_14 tN076_14 kN076_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN076_15 : List Tok := [(.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3), .split, .split, (.A 1 6 5 0 3), .split, (.A 1 2 4 0 3), .split, (.A 0 6 4 0 3), .split, (.A 1 6 5 0 3), (.A 0 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN076_15 : wsegOk P nbN076 (nInsideL P nbN076) kN076_15 tN076_15 kN076_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN076_16 : List Tok := [(.A 1 2 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3), .split, .split, (.A 1 2 4 0 3), (.A 0 2 4 0 3), (.A 1 2 4 0 3), .split, (.A 4 2 4 0 3), .split, (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), (.A 4 2 4 0 1), .split, .split, (.A 5 2 4 0 3), (.A 1 2 4 0 3), .split, (.A 5 2 6 0 3), (.A 4 2 4 0 3), .split, .split, (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 2 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), .split, (.A 4 2 4 0 1), .split, (.A 0 2 4 0 1), (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN076_16 : wsegOk P nbN076 (nInsideL P nbN076) kN076_16 tN076_16 kN076_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN076_17 : List Tok := [(.A 4 2 5 0 3), (.A 0 2 5 0 1), .split, (.A 1 2 5 0 3), .split, .split, .split, (.A 5 2 4 0 3), (.A 5 2 6 0 3), (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), (.A 4 2 5 0 3), .split, (.A 5 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN076_17 : wsegOk P nbN076 (nInsideL P nbN076) kN076_17 tN076_17 kN076_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN076_18 : List Tok := [.split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, .split, (.A 1 2 5 0 3), (.A 0 6 5 0 3), .split, (.A 4 2 5 0 3), .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, .split, .split, (.A 0 6 5 0 3), .split, (.A 0 6 5 0 3), (.A 4 2 5 0 3), (.A 0 6 5 0 3), (.A 4 2 5 0 1), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN076_18 : wsegOk P nbN076 (nInsideL P nbN076) kN076_18 tN076_18 kN076_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN076_19 : List Tok := [(.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), (.A 5 2 7 0 3), (.A 5 2 7 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), (.A 4 6 5 0 3), .split, (.A 1 6 5 0 3), .split, (.A 5 2 7 0 3), (.D 12), (.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN076_19 : wsegOk P nbN076 (nInsideL P nbN076) kN076_19 tN076_19 kN076_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN076_20 : List Tok := [(.A 1 4 5 1 3), (.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3), .split, (.A 1 6 7 1 3), (.D 12), (.D 12), (.D 12), (.A 5 6 7 4 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, .split, (.D 17), (.A 4 2 6 5 7), (.A 4 3 6 4 7), .split, .split, (.D 17), (.A 5 2 6 5 7), (.D 13), .split, (.D 13), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN076_20 : wsegOk P nbN076 (nInsideL P nbN076) kN076_20 tN076_20 kN076_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN076_21 : List Tok := [(.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, .split, (.A 4 2 6 0 7), (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 5 2 6 4 3), (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN076_21 : wsegOk P nbN076 (nInsideL P nbN076) kN076_21 tN076_21 kN076_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN076_22 : List Tok := [.split, (.A 4 2 6 4 1), .split, .split, (.D 13), (.A 5 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN076_22 : wsegOk P nbN076 (nInsideL P nbN076) kN076_22 tN076_22 kN076_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN076_23 : List Tok := [.split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 4 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), .split, .split, .split, (.A 4 2 4 0 1), (.A 0 2 4 0 1), (.A 4 2 4 0 1), (.A 4 2 5 0 1), (.A 4 2 6 0 1), .split, .split, (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, (.A 0 2 5 0 1), .split, (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN076_23 : wsegOk P nbN076 (nInsideL P nbN076) kN076_23 tN076_23 kN076_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN076_24 : List Tok := [.split, (.A 4 3 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 4 2 5 0 1), .split, .split, (.A 0 6 5 0 1), (.A 4 2 5 0 1), .split, (.A 4 6 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, (.A 5 2 7 4 1), .split, .split, .split, (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), (.A 4 7 5 0 1), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN076_24 : wsegOk P nbN076 (nInsideL P nbN076) kN076_24 tN076_24 kN076_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN076_25 : List Tok := [(.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN076_25 : wsegOk P nbN076 (nInsideL P nbN076) kN076_25 tN076_25 kN076_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN076_26 : List Tok := [(.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN076_26 : wsegOk P nbN076 (nInsideL P nbN076) kN076_26 tN076_26 kN076_27 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN076_27 : List Tok := [(.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN076_27 : wsegOk P nbN076 (nInsideL P nbN076) kN076_27 tN076_27 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM076_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.A 1 6 4 1 5), (.A 1 6 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM076_0 : wsegOk P nbM076 (nInsideL P nbM076) (rRoots P.rden) tM076_0 kM076_1 = true := by
  decide +kernel

end PackLean.D28.Cub
