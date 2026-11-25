-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey022

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM065_14 : List Tok := [(.A 5 2 7 1 3), (.A 4 2 6 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 0 6 5 0 3), .split, (.D 1), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM065_14 : wsegOk P nbM065 (nInsideL P nbM065) kM065_14 tM065_14 kM065_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM065_15 : List Tok := [.split, (.A 0 6 5 0 3), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), .split, (.A 1 2 4 1 7), (.A 1 6 4 0 3), (.A 1 2 5 1 3), (.A 0 6 5 0 3), (.A 0 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 2 5 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 2 6 0 3), (.A 4 2 7 0 3), (.A 0 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM065_15 : wsegOk P nbM065 (nInsideL P nbM065) kM065_15 tM065_15 kM065_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM065_16 : List Tok := [.split, .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 4 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, .split, .split, (.A 1 6 5 1 3), (.D 4), (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM065_16 : wsegOk P nbM065 (nInsideL P nbM065) kM065_16 tM065_16 kM065_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM065_17 : List Tok := [.split, .split, .split, .split, .split, .split, (.A 1 2 5 0 3), (.A 4 2 7 0 3), .split, .split, (.A 5 2 7 1 3), .split, (.A 1 2 5 0 3), (.A 5 2 7 0 3), (.A 4 2 7 0 3), .split, (.A 0 2 5 0 3), .split, .split, (.A 0 2 5 0 3), (.A 0 6 5 0 3), (.A 4 2 7 0 3), (.A 4 2 7 0 3), .split, .split, (.A 5 2 7 0 3), (.A 5 6 7 0 3), (.A 4 2 7 0 3), .split, (.A 4 6 5 0 3), (.D 12), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 1), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM065_17 : wsegOk P nbM065 (nInsideL P nbM065) kM065_17 tM065_17 kM065_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM065_18 : List Tok := [(.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3), (.A 5 6 7 1 3), (.D 12), (.D 12), .split, (.A 5 2 7 5 3), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), (.A 4 1 6 4 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM065_18 : wsegOk P nbM065 (nInsideL P nbM065) kM065_18 tM065_18 kM065_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM065_19 : List Tok := [.split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 0 2 6 0 7), (.A 0 2 6 0 1), (.A 4 2 6 0 5), (.A 4 2 6 0 3), (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, .split, (.A 4 3 6 4 7), (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM065_19 : wsegOk P nbM065 (nInsideL P nbM065) kM065_19 tM065_19 kM065_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM065_20 : List Tok := [.split, (.A 4 2 6 4 1), (.A 4 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, .split, (.A 5 2 7 5 3), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM065_20 : wsegOk P nbM065 (nInsideL P nbM065) kM065_20 tM065_20 kM065_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM065_21 : List Tok := [(.A 4 2 7 4 1), .split, (.D 15), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 2 6 0 1), .split, (.A 0 2 4 0 1), .split, (.A 0 2 5 0 1), (.A 4 2 7 0 1), .split, (.A 4 2 6 0 1), .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM065_21 : wsegOk P nbM065 (nInsideL P nbM065) kM065_21 tM065_21 kM065_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM065_22 : List Tok := [.split, .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 3 7 0 1), (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, (.A 4 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM065_22 : wsegOk P nbM065 (nInsideL P nbM065) kM065_22 tM065_22 kM065_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM065_23 : List Tok := [(.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, .split, (.A 4 2 7 4 1), (.D 12), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM065_23 : wsegOk P nbM065 (nInsideL P nbM065) kM065_23 tM065_23 kM065_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM065_24 : List Tok := [.split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM065_24 : wsegOk P nbM065 (nInsideL P nbM065) kM065_24 tM065_24 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN066_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), .split, (.D 4), (.A 5 2 4 1 7), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN066_0 : wsegOk P nbN066 (nInsideL P nbN066) (rRoots P.rden) tN066_0 kN066_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN066_1 : List Tok := [.split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), (.A 4 2 4 5 7), .split, .split, .split, .split, (.D 5), (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 1 7), .split, (.A 0 2 4 1 5), .split, .split, .split, .split, (.A 5 2 4 1 7), (.A 4 2 4 1 5), (.A 5 2 4 1 7), (.A 1 2 4 1 5), .split, (.A 4 2 4 1 5), .split, (.A 0 2 4 0 5), (.A 4 2 4 0 5), .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN066_1 : wsegOk P nbN066 (nInsideL P nbN066) kN066_1 tN066_1 kN066_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN066_2 : List Tok := [.split, .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), (.A 4 2 4 0 7), (.A 5 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), (.A 0 7 4 2 5), (.D 7), .split, .split, (.A 1 6 5 2 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7), (.A 0 6 4 2 1), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 5), (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN066_2 : wsegOk P nbN066 (nInsideL P nbN066) kN066_2 tN066_2 kN066_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN066_3 : List Tok := [.split, (.A 0 2 4 0 5), .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 6 4 0 7), (.A 1 6 4 0 7), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 0 2 4 0 5), .split, (.A 1 2 4 0 7), .split, (.A 5 2 4 0 7), .split, (.A 1 2 4 0 7), (.A 1 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 1 6 4 0 3), .split, .split, (.A 0 6 4 0 5), .split, (.A 1 6 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN066_3 : wsegOk P nbN066 (nInsideL P nbN066) kN066_3 tN066_3 kN066_4 = true := by
  decide +kernel

end PackLean.D28.Cub
