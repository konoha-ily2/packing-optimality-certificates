-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey032

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN085_15 : List Tok := [(.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 0 7), .split, (.A 5 2 6 0 7), .split, .split, (.A 5 2 4 0 7), .split, (.A 5 2 6 0 7), .split, .split, (.A 5 2 4 0 7), .split, (.A 5 2 6 0 7), (.A 4 2 4 0 3), (.A 5 2 6 0 3), (.A 5 2 6 0 3), (.A 5 2 6 0 3), (.A 5 2 6 1 3), .split, .split, (.A 5 0 4 1 3), .split, .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN085_15 : wsegOk P nbN085 (nInsideL P nbN085) kN085_15 tN085_15 kN085_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN085_16 : List Tok := [(.A 1 2 5 1 3), (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, .split, (.A 5 0 6 5 3), (.D 15), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN085_16 : wsegOk P nbN085 (nInsideL P nbN085) kN085_16 tN085_16 kN085_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN085_17 : List Tok := [.split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3), .split, .split, (.A 1 6 5 0 3), (.A 1 2 4 0 3), (.A 1 2 5 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 3), (.A 4 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN085_17 : wsegOk P nbN085 (nInsideL P nbN085) kN085_17 tN085_17 kN085_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN085_18 : List Tok := [(.A 5 2 4 0 3), (.A 0 2 4 0 3), (.A 4 2 4 0 3), .split, (.A 5 2 4 0 3), (.A 4 2 4 0 3), (.A 0 2 4 0 3), .split, (.A 1 2 4 0 3), .split, (.A 5 2 6 0 3), .split, (.A 4 2 4 0 3), .split, (.A 5 2 4 0 3), (.A 4 2 4 0 3), (.A 0 2 4 0 3), .split, (.A 1 2 4 0 3), .split, (.A 5 2 6 0 3), .split, .split, (.A 1 2 4 0 3), .split, .split, (.A 4 2 4 0 3), .split, (.A 5 2 4 0 3), .split, (.A 5 2 6 0 3), (.A 4 2 4 0 3), (.A 0 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN085_18 : wsegOk P nbN085 (nInsideL P nbN085) kN085_18 tN085_18 kN085_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN085_19 : List Tok := [.split, (.A 1 2 4 0 3), .split, (.A 5 2 6 0 3), .split, .split, .split, (.A 5 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 3), (.A 0 2 4 0 3), (.A 4 2 4 0 3), .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 3), .split, .split, (.A 5 2 4 0 3), .split, (.A 5 2 4 0 3), (.A 4 2 4 0 3), (.A 5 2 4 0 3), (.A 5 2 4 0 3), .split, (.A 5 2 6 0 3), (.A 4 2 4 0 3), .split, (.A 0 2 4 0 3), .split, .split, (.A 1 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN085_19 : wsegOk P nbN085 (nInsideL P nbN085) kN085_19 tN085_19 kN085_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN085_20 : List Tok := [(.A 0 2 5 0 3), .split, .split, (.A 0 2 4 0 3), .split, (.A 1 2 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 2 5 0 3), (.A 4 2 5 0 3), (.A 0 2 5 0 1), (.A 0 2 5 0 1), .split, (.A 1 2 5 0 3), .split, .split, .split, (.A 5 2 4 0 3), .split, (.A 5 2 6 0 3), .split, .split, (.A 5 2 4 0 3), (.A 5 2 6 0 3), (.A 5 2 7 0 3), (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), (.A 4 2 5 0 3), (.A 5 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN085_20 : wsegOk P nbN085 (nInsideL P nbN085) kN085_20 tN085_20 kN085_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN085_21 : List Tok := [(.A 0 2 5 0 3), .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), (.A 4 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, .split, (.A 1 2 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN085_21 : wsegOk P nbN085 (nInsideL P nbN085) kN085_21 tN085_21 kN085_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN085_22 : List Tok := [(.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), (.A 5 2 7 0 3), (.A 5 2 7 0 3), .split, (.A 1 2 7 0 3), (.A 5 2 7 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 5 0 3), (.A 0 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN085_22 : wsegOk P nbN085 (nInsideL P nbN085) kN085_22 tN085_22 kN085_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN085_23 : List Tok := [(.D 12), .split, (.A 1 6 5 0 3), .split, (.A 5 2 7 0 3), (.D 12), (.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), (.A 1 4 5 1 3), (.D 4), (.D 1), .split, .split, .split, .split, (.A 1 6 7 1 3), (.D 12), .split, .split, (.A 5 2 7 4 3), (.D 12), (.D 12), (.D 12), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN085_23 : wsegOk P nbN085 (nInsideL P nbN085) kN085_23 tN085_23 kN085_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN085_24 : List Tok := [.split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, (.A 5 3 6 5 7), (.A 4 3 6 4 7), .split, (.A 5 0 6 5 7), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, .split, (.A 4 2 6 4 7), (.A 5 2 6 4 7), .split, .split, .split, (.A 5 2 6 0 7), .split, (.A 4 2 6 0 5), .split, (.A 5 2 6 0 3), (.A 4 2 6 0 1), (.A 4 2 6 0 5), .split, (.A 5 2 6 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN085_24 : wsegOk P nbN085 (nInsideL P nbN085) kN085_24 tN085_24 kN085_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN085_25 : List Tok := [(.A 4 2 6 4 1), .split, .split, .split, (.A 4 3 6 4 7), (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 5 2 6 4 3), (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 5 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN085_25 : wsegOk P nbN085 (nInsideL P nbN085) kN085_25 tN085_25 kN085_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN085_26 : List Tok := [.split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN085_26 : wsegOk P nbN085 (nInsideL P nbN085) kN085_26 tN085_26 kN085_27 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN085_27 : List Tok := [(.A 4 2 6 0 1), (.A 4 2 6 0 1), (.A 4 2 4 0 1), (.A 4 2 6 0 1), .split, .split, (.A 4 2 6 0 1), .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 4 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), .split, (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1), (.A 4 2 5 0 1), (.A 0 2 5 0 1), (.A 4 2 7 0 1), (.A 4 2 6 0 1), .split, .split, .split, (.A 4 2 6 0 1), (.A 5 2 7 0 1), .split, .split, .split, (.A 4 2 7 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN085_27 : wsegOk P nbN085 (nInsideL P nbN085) kN085_27 tN085_27 kN085_28 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN085_28 : List Tok := [(.A 4 2 5 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, (.A 0 2 5 0 1), .split, (.A 4 2 5 0 1), .split, .split, (.A 0 3 5 0 1), (.A 4 3 5 0 1), (.A 4 2 5 0 1), .split, .split, .split, (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, (.A 5 2 7 4 1), .split, .split, .split, .split, .split, (.A 4 2 5 0 1), (.A 4 2 7 4 1), (.A 4 2 7 4 1), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN085_28 : wsegOk P nbN085 (nInsideL P nbN085) kN085_28 tN085_28 kN085_29 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN085_29 : List Tok := [(.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), .split, (.A 4 3 5 0 1), (.D 18), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 5 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN085_29 : wsegOk P nbN085 (nInsideL P nbN085) kN085_29 tN085_29 kN085_30 = true := by
  decide +kernel

end PackLean.D28.Cub
