-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey034

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN089_15 : List Tok := [.split, .split, .split, (.D 4), (.A 1 2 5 1 3), (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, .split, (.A 7 0 6 5 3), (.D 15), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN089_15 : wsegOk P nbN089 (nInsideL P nbN089) kN089_15 tN089_15 kN089_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN089_16 : List Tok := [.split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), (.A 4 2 4 0 1), .split, (.A 5 2 4 0 3), (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN089_16 : wsegOk P nbN089 (nInsideL P nbN089) kN089_16 tN089_16 kN089_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN089_17 : List Tok := [(.A 5 2 4 0 3), .split, (.A 0 2 4 0 1), .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), (.A 4 2 4 0 1), .split, (.A 5 2 4 0 3), (.A 5 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 1 2 4 0 3), .split, (.A 5 2 6 0 3), .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), (.A 4 2 4 0 1), .split, (.A 5 2 4 0 3), (.A 5 2 4 0 1), (.A 5 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 1 2 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN089_17 : wsegOk P nbN089 (nInsideL P nbN089) kN089_17 tN089_17 kN089_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN089_18 : List Tok := [(.A 0 2 5 0 3), .split, .split, (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 3), (.A 0 2 4 0 3), (.A 4 2 4 0 1), (.A 0 2 5 0 1), .split, (.A 1 2 5 0 3), .split, .split, .split, .split, (.A 5 2 4 0 3), (.A 1 2 5 0 3), .split, (.A 5 2 4 0 1), (.A 4 2 5 0 1), .split, (.A 5 2 5 0 3), (.A 5 2 5 0 3), (.A 0 2 5 0 1), (.A 0 2 5 0 1), .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN089_18 : wsegOk P nbN089 (nInsideL P nbN089) kN089_18 tN089_18 kN089_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN089_19 : List Tok := [.split, .split, (.A 1 2 5 0 3), (.A 4 2 5 0 1), (.A 5 2 5 0 3), (.A 5 2 5 0 3), .split, (.A 0 2 5 0 3), .split, (.A 1 2 5 0 3), (.A 1 2 5 0 3), (.A 1 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, .split, .split, (.A 0 6 5 0 3), (.A 1 6 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN089_19 : wsegOk P nbN089 (nInsideL P nbN089) kN089_19 tN089_19 kN089_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN089_20 : List Tok := [(.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), (.A 5 2 7 0 3), .split, (.A 1 2 7 0 3), (.A 5 2 7 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), (.A 0 2 5 0 3), (.D 12), .split, (.A 1 6 5 0 3), .split, (.A 5 2 7 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN089_20 : wsegOk P nbN089 (nInsideL P nbN089) kN089_20 tN089_20 kN089_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN089_21 : List Tok := [(.D 12), (.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), (.A 1 4 5 1 3), (.D 4), (.D 1), .split, .split, .split, .split, .split, (.A 1 6 7 1 3), (.D 12), (.D 12), .split, .split, (.A 5 2 7 4 3), (.D 12), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, (.A 5 3 6 5 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN089_21 : wsegOk P nbN089 (nInsideL P nbN089) kN089_21 tN089_21 kN089_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN089_22 : List Tok := [(.A 4 3 6 4 7), .split, .split, (.D 17), (.A 5 2 6 5 7), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, .split, (.A 4 2 6 4 7), (.A 5 2 6 4 7), .split, .split, .split, (.A 5 2 6 0 7), (.A 5 2 6 0 5), (.A 4 2 6 0 5), .split, (.A 5 2 6 0 3), (.A 4 2 6 4 1), .split, .split, .split, (.A 4 3 6 4 7), (.A 4 3 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN089_22 : wsegOk P nbN089 (nInsideL P nbN089) kN089_22 tN089_22 kN089_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN089_23 : List Tok := [.split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 5 2 6 4 3), (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 5 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN089_23 : wsegOk P nbN089 (nInsideL P nbN089) kN089_23 tN089_23 kN089_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN089_24 : List Tok := [.split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), (.A 5 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 4 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), .split, (.A 0 2 4 0 1), .split, .split, .split, (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN089_24 : wsegOk P nbN089 (nInsideL P nbN089) kN089_24 tN089_24 kN089_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN089_25 : List Tok := [(.A 4 2 5 0 1), (.A 0 2 5 0 1), (.A 4 2 7 0 1), (.A 4 2 6 0 1), .split, .split, (.A 5 2 7 0 1), .split, .split, .split, (.A 4 2 7 0 1), (.A 4 2 5 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, (.A 0 2 5 0 1), .split, (.A 4 2 5 0 1), .split, .split, (.A 0 3 5 0 1), (.A 4 3 5 0 1), (.A 4 2 5 0 1), .split, .split, .split, (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN089_25 : wsegOk P nbN089 (nInsideL P nbN089) kN089_25 tN089_25 kN089_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN089_26 : List Tok := [(.A 4 3 7 4 1), .split, .split, (.A 5 2 7 4 1), .split, .split, .split, .split, .split, (.A 4 2 5 0 1), (.A 4 2 7 4 1), .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), .split, (.A 4 3 5 0 1), (.D 18), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN089_26 : wsegOk P nbN089 (nInsideL P nbN089) kN089_26 tN089_26 kN089_27 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN089_27 : List Tok := [(.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN089_27 : wsegOk P nbN089 (nInsideL P nbN089) kN089_27 tN089_27 kN089_28 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN089_28 : List Tok := [(.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN089_28 : wsegOk P nbN089 (nInsideL P nbN089) kN089_28 tN089_28 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM089_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.A 0 7 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM089_0 : wsegOk P nbM089 (nInsideL P nbM089) (rRoots P.rden) tM089_0 kM089_1 = true := by
  decide +kernel

end PackLean.D28.Cub
