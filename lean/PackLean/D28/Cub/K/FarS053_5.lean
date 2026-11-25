-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey053

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_16 : List Tok := [.split, .split, (.A 1 2 5 1 3), (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), (.A 0 2 5 0 3), .split, (.A 0 2 5 0 3), .split, (.A 0 2 7 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_16 : wsegOk P nbM128 (nInsideL P nbM128) kM128_16 tM128_16 kM128_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_17 : List Tok := [.split, (.A 1 2 5 1 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 1 6 5 1 3), (.D 4), (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), .split, (.A 0 6 5 0 3), (.A 0 6 7 0 3), (.A 0 6 5 0 3), .split, .split, (.A 0 2 7 0 3), .split, .split, (.A 1 2 7 0 3), .split, (.A 0 6 7 0 3), .split, (.A 0 6 7 0 3), (.A 4 2 7 0 3), (.A 4 2 7 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), .split, (.A 0 6 5 0 3), (.A 4 2 7 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_17 : wsegOk P nbM128 (nInsideL P nbM128) kM128_17 tM128_17 kM128_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_18 : List Tok := [(.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 1), (.D 12), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3), .split, .split, (.A 1 2 7 1 3), (.A 1 6 7 1 3), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, (.A 5 2 7 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_18 : wsegOk P nbM128 (nInsideL P nbM128) kM128_18 tM128_18 kM128_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_19 : List Tok := [(.D 12), (.A 4 2 7 4 3), (.D 12), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, .split, (.D 17), .split, .split, (.A 5 2 6 5 7), (.A 4 3 6 5 7), (.A 5 2 6 5 7), (.A 4 3 6 4 7), .split, .split, (.D 17), (.A 5 2 6 5 7), (.D 13), .split, (.D 13), (.A 4 1 6 4 7), .split, .split, (.D 17), .split, (.D 13), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_19 : wsegOk P nbM128 (nInsideL P nbM128) kM128_19 tM128_19 kM128_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_20 : List Tok := [(.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, .split, .split, (.A 0 2 6 0 7), .split, .split, (.A 0 2 6 0 7), (.A 0 2 6 0 5), (.A 0 2 6 0 3), .split, .split, (.A 0 2 6 0 5), (.A 4 2 6 0 5), (.A 0 2 6 0 5), .split, .split, (.A 4 2 6 0 3), (.A 4 2 6 0 3), .split, (.A 4 2 6 4 3), (.A 4 2 6 4 1), .split, .split, .split, (.A 4 3 6 4 7), (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 4 2 6 5 3), (.A 4 2 6 4 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_20 : wsegOk P nbM128 (nInsideL P nbM128) kM128_20 tM128_20 kM128_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_21 : List Tok := [(.A 4 0 6 5 3), (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, .split, (.D 13), (.A 4 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, .split, (.D 13), (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_21 : wsegOk P nbM128 (nInsideL P nbM128) kM128_21 tM128_21 kM128_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_22 : List Tok := [(.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, .split, (.A 5 2 7 5 3), .split, (.D 13), (.A 4 2 7 4 1), .split, (.D 15), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 2 6 0 1), .split, (.A 0 2 4 0 1), (.A 0 2 5 0 1), (.A 0 2 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_22 : wsegOk P nbM128 (nInsideL P nbM128) kM128_22 tM128_22 kM128_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_23 : List Tok := [.split, .split, .split, (.A 0 2 6 0 1), .split, (.A 0 2 7 0 3), (.A 4 2 7 0 1), (.A 0 2 7 0 1), (.A 4 2 7 0 1), .split, .split, (.A 0 2 5 0 1), .split, (.A 0 2 5 0 1), .split, (.A 0 3 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, .split, .split, .split, (.A 4 2 6 0 1), .split, (.A 0 3 7 0 1), (.A 4 2 7 0 1), .split, (.A 4 3 7 0 5), (.A 4 3 7 0 1), (.A 4 2 7 4 1), .split, .split, .split, (.A 4 3 7 0 1), (.A 4 3 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_23 : wsegOk P nbM128 (nInsideL P nbM128) kM128_23 tM128_23 kM128_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_24 : List Tok := [(.A 4 3 7 4 1), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, (.A 4 2 7 4 3), (.A 4 2 7 4 1), (.A 4 2 7 4 1), (.A 4 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), .split, .split, .split, (.A 0 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 5 0 1), (.D 18), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_24 : wsegOk P nbM128 (nInsideL P nbM128) kM128_24 tM128_24 kM128_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_25 : List Tok := [.split, .split, .split, .split, .split, (.A 4 3 7 4 5), .split, (.A 4 2 7 4 1), (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, .split, (.A 4 2 7 4 1), (.D 12), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_25 : wsegOk P nbM128 (nInsideL P nbM128) kM128_25 tM128_25 kM128_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_26 : List Tok := [.split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_26 : wsegOk P nbM128 (nInsideL P nbM128) kM128_26 tM128_26 kM128_27 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_27 : List Tok := [.split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_27 : wsegOk P nbM128 (nInsideL P nbM128) kM128_27 tM128_27 [] = true := by
  decide +kernel

end PackLean.D28.Cub
