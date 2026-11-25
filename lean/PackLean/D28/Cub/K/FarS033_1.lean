-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey033

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN087_15 : List Tok := [(.A 5 2 6 1 3), .split, .split, (.A 5 0 4 1 3), .split, .split, .split, (.D 4), (.A 1 2 5 1 3), (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, .split, (.A 7 0 6 5 3), (.D 15), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN087_15 : wsegOk P nbN087 (nInsideL P nbN087) kN087_15 tN087_15 kN087_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN087_16 : List Tok := [(.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, .split, .split, .split, (.A 5 2 4 0 3), (.A 1 2 4 0 3), .split, .split, .split, (.A 5 2 4 0 3), (.A 4 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN087_16 : wsegOk P nbN087 (nInsideL P nbN087) kN087_16 tN087_16 kN087_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN087_17 : List Tok := [(.A 5 2 4 0 3), (.A 4 2 4 0 3), (.A 5 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 1 2 4 0 3), .split, (.A 4 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 1 2 4 0 3), .split, (.A 5 2 6 0 3), .split, .split, .split, (.A 5 2 4 0 3), (.A 1 2 4 0 3), .split, (.A 5 2 4 0 3), .split, (.A 4 2 4 0 3), .split, (.A 5 2 4 0 3), (.A 4 2 4 0 1), (.A 5 2 4 0 3), .split, (.A 0 2 4 0 3), .split, .split, (.A 1 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN087_17 : wsegOk P nbN087 (nInsideL P nbN087) kN087_17 tN087_17 kN087_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN087_18 : List Tok := [(.A 1 2 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), (.A 4 2 4 0 1), (.A 0 2 5 0 1), .split, (.A 1 2 5 0 3), .split, .split, .split, .split, (.A 5 2 4 0 3), .split, (.A 0 2 5 0 3), .split, (.A 5 2 5 0 3), (.A 4 2 5 0 3), (.A 4 2 4 0 1), (.A 5 2 5 0 3), (.A 0 2 5 0 1), (.A 0 2 5 0 1), .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), .split, .split, .split, (.A 1 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN087_18 : wsegOk P nbN087 (nInsideL P nbN087) kN087_18 tN087_18 kN087_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN087_19 : List Tok := [.split, (.A 5 2 5 0 3), (.A 5 2 5 0 3), (.A 5 2 5 0 3), .split, (.A 0 2 5 0 3), .split, (.A 1 2 5 0 3), (.A 4 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 0 2 5 0 3), (.A 1 6 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN087_19 : wsegOk P nbN087 (nInsideL P nbN087) kN087_19 tN087_19 kN087_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN087_20 : List Tok := [(.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), (.A 5 2 7 0 3), .split, .split, (.A 5 2 7 0 3), (.A 1 6 7 0 3), (.A 5 2 7 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), (.A 0 2 5 0 3), (.D 12), .split, (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN087_20 : wsegOk P nbN087 (nInsideL P nbN087) kN087_20 tN087_20 kN087_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN087_21 : List Tok := [.split, (.A 5 2 7 0 3), (.D 12), (.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), (.A 1 4 5 1 3), (.D 4), (.D 1), .split, .split, .split, .split, .split, (.A 1 6 7 1 3), (.D 12), (.D 12), (.A 5 6 7 4 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, (.A 5 3 6 5 7), (.A 4 3 6 4 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN087_21 : wsegOk P nbN087 (nInsideL P nbN087) kN087_21 tN087_21 kN087_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN087_22 : List Tok := [.split, .split, (.D 17), (.A 5 2 6 5 7), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 5 2 6 5 7), (.A 4 2 6 4 7), .split, .split, .split, (.A 5 2 6 0 7), .split, (.A 4 2 6 0 5), (.A 5 2 6 0 3), (.A 4 2 6 0 5), .split, (.A 5 2 6 0 3), (.A 4 2 6 4 1), .split, .split, (.A 4 3 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN087_22 : wsegOk P nbN087 (nInsideL P nbN087) kN087_22 tN087_22 kN087_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN087_23 : List Tok := [.split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 5 2 6 4 3), (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 5 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN087_23 : wsegOk P nbN087 (nInsideL P nbN087) kN087_23 tN087_23 kN087_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN087_24 : List Tok := [.split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), (.A 5 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 4 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), .split, .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN087_24 : wsegOk P nbN087 (nInsideL P nbN087) kN087_24 tN087_24 kN087_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN087_25 : List Tok := [.split, .split, (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 7 0 1), (.A 4 2 6 0 1), .split, .split, (.A 5 2 7 0 1), .split, .split, .split, (.A 4 2 7 0 1), (.A 4 2 5 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, (.A 0 2 5 0 1), .split, (.A 4 2 5 0 1), .split, (.A 4 3 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 4 2 5 0 1), (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, (.A 5 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN087_25 : wsegOk P nbN087 (nInsideL P nbN087) kN087_25 tN087_25 kN087_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN087_26 : List Tok := [.split, .split, .split, .split, .split, (.A 4 2 5 0 1), (.A 4 2 7 4 1), .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), .split, (.A 4 3 5 0 1), (.D 18), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN087_26 : wsegOk P nbN087 (nInsideL P nbN087) kN087_26 tN087_26 kN087_27 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN087_27 : List Tok := [(.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN087_27 : wsegOk P nbN087 (nInsideL P nbN087) kN087_27 tN087_27 kN087_28 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN087_28 : List Tok := [(.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN087_28 : wsegOk P nbN087 (nInsideL P nbN087) kN087_28 tN087_28 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM087_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.A 0 7 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM087_0 : wsegOk P nbM087 (nInsideL P nbM087) (rRoots P.rden) tM087_0 kM087_1 = true := by
  decide +kernel

end PackLean.D28.Cub
