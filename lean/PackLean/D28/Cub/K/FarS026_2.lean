-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey026

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM073_11 : List Tok := [(.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, .split, (.A 1 2 4 1 7), (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM073_11 : wsegOk P nbM073 (nInsideL P nbM073) kM073_11 tM073_11 kM073_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM073_12 : List Tok := [.split, (.A 5 2 6 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), (.A 1 2 4 1 3), .split, (.A 0 2 6 1 7), .split, .split, (.A 0 2 4 0 7), (.A 0 2 6 0 7), (.A 0 2 6 0 3), .split, .split, (.A 5 2 4 1 3), .split, (.A 1 2 4 1 3), .split, (.A 1 2 4 1 3), (.A 1 2 6 1 3), .split, .split, .split, (.A 5 2 6 1 3), (.A 4 2 6 0 3), (.A 5 2 6 1 3), .split, .split, (.A 0 2 6 0 3), (.A 4 2 6 0 3), (.A 4 2 6 0 3), .split, .split, .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM073_12 : wsegOk P nbM073 (nInsideL P nbM073) kM073_12 tM073_12 kM073_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM073_13 : List Tok := [(.A 5 2 4 1 3), (.D 4), .split, .split, .split, (.D 4), (.A 1 2 5 1 3), .split, (.A 1 2 4 1 3), (.A 1 2 5 1 3), .split, (.D 4), .split, (.A 5 2 6 1 3), (.A 1 2 7 1 3), .split, .split, (.A 5 2 6 5 3), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 6 1 3), .split, .split, (.A 1 2 6 1 3), (.A 5 2 6 1 3), (.A 5 2 7 1 3), (.A 5 2 6 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM073_13 : wsegOk P nbM073 (nInsideL P nbM073) kM073_13 tM073_13 kM073_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM073_14 : List Tok := [.split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 0 6 5 0 3), .split, (.D 1), (.A 1 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), (.A 0 6 5 0 3), .split, (.A 1 2 4 0 3), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM073_14 : wsegOk P nbM073 (nInsideL P nbM073) kM073_14 tM073_14 kM073_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM073_15 : List Tok := [.split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), (.A 0 2 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), .split, (.A 1 2 5 0 3), .split, .split, (.A 0 2 4 0 3), .split, (.A 1 2 5 0 3), (.A 0 2 7 0 3), (.A 0 2 5 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 2 6 0 3), .split, (.A 0 2 7 0 3), (.A 4 2 7 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM073_15 : wsegOk P nbM073 (nInsideL P nbM073) kM073_15 tM073_15 kM073_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM073_16 : List Tok := [.split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, .split, (.A 1 6 5 1 3), (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 5 0 3), (.A 0 2 7 0 3), (.A 1 2 7 0 3), .split, (.A 0 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM073_16 : wsegOk P nbM073 (nInsideL P nbM073) kM073_16 tM073_16 kM073_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM073_17 : List Tok := [.split, .split, (.A 1 2 5 0 3), (.A 0 6 5 0 3), (.A 0 2 7 0 3), (.A 4 2 7 0 3), .split, .split, (.A 5 2 7 0 3), .split, .split, (.A 1 6 7 0 3), (.A 4 2 7 0 3), (.A 5 6 7 0 3), (.A 4 2 7 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 4 2 5 0 3), (.A 4 6 5 0 3), (.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM073_17 : wsegOk P nbM073 (nInsideL P nbM073) kM073_17 tM073_17 kM073_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM073_18 : List Tok := [.split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3), .split, .split, (.A 1 2 7 1 3), (.A 5 6 7 1 3), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, (.A 5 2 7 1 3), (.D 12), (.A 5 2 7 4 3), (.D 12), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, .split, (.D 17), (.A 4 2 6 5 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM073_18 : wsegOk P nbM073 (nInsideL P nbM073) kM073_18 tM073_18 kM073_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM073_19 : List Tok := [(.A 4 3 6 4 7), .split, .split, (.D 17), (.A 4 2 6 5 7), (.D 13), .split, (.D 13), (.A 4 1 6 4 7), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 0 2 6 0 7), (.A 0 2 6 0 1), (.A 0 2 6 0 5), (.A 4 2 6 0 3), (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, .split, (.A 4 3 6 4 7), (.A 4 3 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM073_19 : wsegOk P nbM073 (nInsideL P nbM073) kM073_19 tM073_19 kM073_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM073_20 : List Tok := [.split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, (.A 4 2 6 4 3), .split, (.A 5 0 6 5 3), (.D 13), (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 4 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM073_20 : wsegOk P nbM073 (nInsideL P nbM073) kM073_20 tM073_20 kM073_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM073_21 : List Tok := [(.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), .split, .split, (.A 5 2 7 5 3), .split, (.D 13), (.A 4 2 7 4 1), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 2 6 0 1), .split, (.A 0 2 4 0 1), (.A 0 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM073_21 : wsegOk P nbM073 (nInsideL P nbM073) kM073_21 tM073_21 kM073_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM073_22 : List Tok := [.split, (.A 4 2 6 0 1), .split, .split, (.A 0 2 6 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, .split, .split, .split, (.A 4 2 6 0 3), .split, .split, .split, (.A 4 2 6 0 3), (.A 0 2 7 0 1), (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 2 6 0 1), .split, (.A 4 2 7 0 3), (.A 4 2 7 0 1), .split, .split, .split, .split, .split, (.A 0 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 5 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, (.A 0 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM073_22 : wsegOk P nbM073 (nInsideL P nbM073) kM073_22 tM073_22 kM073_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM073_23 : List Tok := [.split, .split, .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 4 3 5 0 1), (.A 4 3 5 0 1), (.A 4 2 5 0 1), .split, (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 3 7 0 1), (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, .split, (.A 4 2 7 4 1), (.A 4 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM073_23 : wsegOk P nbM073 (nInsideL P nbM073) kM073_23 tM073_23 kM073_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM073_24 : List Tok := [(.D 12), (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM073_24 : wsegOk P nbM073 (nInsideL P nbM073) kM073_24 tM073_24 kM073_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM073_25 : List Tok := [(.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM073_25 : wsegOk P nbM073 (nInsideL P nbM073) kM073_25 tM073_25 kM073_26 = true := by
  decide +kernel

end PackLean.D28.Cub
