-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey053

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_1 : List Tok := [(.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 1 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), .split, (.D 5), .split, .split, (.A 1 2 4 1 7), (.A 1 3 6 1 7), (.A 5 2 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 1 6 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_1 : wsegOk P nbM128 (nInsideL P nbM128) kM128_1 tM128_1 kM128_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_2 : List Tok := [(.A 1 3 4 1 7), .split, .split, .split, (.A 1 2 4 1 5), .split, .split, (.A 1 2 4 1 5), (.A 1 2 4 1 5), (.A 1 2 4 1 5), (.A 0 3 4 1 5), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 3 4 1 7), (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 6 1 7), (.A 0 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_2 : wsegOk P nbM128 (nInsideL P nbM128) kM128_2 tM128_2 kM128_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_3 : List Tok := [(.D 7), .split, .split, .split, (.D 7), (.D 9), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 7), .split, .split, (.A 1 6 5 3 7), (.D 7), .split, .split, (.A 1 6 4 1 7), (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, .split, (.D 7), (.A 0 6 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_3 : wsegOk P nbM128 (nInsideL P nbM128) kM128_3 tM128_3 kM128_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_4 : List Tok := [(.A 0 6 4 0 7), .split, (.D 7), (.D 7), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), .split, (.A 0 7 4 2 1), (.D 7), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, (.A 0 6 4 0 7), (.A 0 6 4 0 7), .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_4 : wsegOk P nbM128 (nInsideL P nbM128) kM128_4 tM128_4 kM128_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_5 : List Tok := [.split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), (.A 0 2 4 0 1), (.A 0 6 4 0 1), .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 18), .split, .split, (.A 0 6 5 0 3), (.D 7), .split, .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_5 : wsegOk P nbM128 (nInsideL P nbM128) kM128_5 tM128_5 kM128_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_6 : List Tok := [.split, .split, (.D 5), (.A 0 3 4 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, .split, (.D 17), .split, (.D 5), .split, (.A 5 3 6 5 7), (.A 4 3 6 4 7), .split, (.D 5), (.A 4 3 6 4 7), .split, .split, .split, .split, (.D 5), .split, (.A 0 3 6 1 7), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_6 : wsegOk P nbM128 (nInsideL P nbM128) kM128_6 tM128_6 kM128_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_7 : List Tok := [.split, .split, .split, (.A 0 3 6 0 7), .split, (.A 0 2 6 1 7), (.A 0 3 6 0 7), .split, .split, .split, (.A 0 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, .split, (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 7), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.A 0 3 6 0 5), .split, .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_7 : wsegOk P nbM128 (nInsideL P nbM128) kM128_7 tM128_7 kM128_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_8 : List Tok := [(.A 0 3 6 0 5), (.D 2), (.A 0 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 2 7 4 2 1), .split, .split, (.D 6), .split, .split, (.A 0 3 6 0 5), (.D 6), (.D 6), (.D 6), .split, (.D 9), (.A 2 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, .split, (.A 2 7 4 2 1), .split, (.A 2 7 4 2 1), (.A 2 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_8 : wsegOk P nbM128 (nInsideL P nbM128) kM128_8 tM128_8 kM128_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_9 : List Tok := [.split, (.A 0 7 4 0 1), (.A 0 7 4 0 1), .split, (.A 0 3 6 0 5), .split, (.D 6), .split, .split, (.A 0 3 4 0 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 3 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, (.A 0 2 4 0 1), .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 1), .split, (.A 0 3 6 0 1), (.A 0 2 6 0 1), .split, .split, .split, (.A 0 7 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_9 : wsegOk P nbM128 (nInsideL P nbM128) kM128_9 tM128_9 kM128_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_10 : List Tok := [.split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), (.A 0 3 5 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), (.A 0 3 6 0 5), (.A 0 3 6 0 1), .split, .split, (.A 0 3 4 0 1), (.D 6), .split, .split, (.A 0 3 7 0 1), (.A 0 3 5 0 1), .split, (.A 0 3 7 0 1), (.D 6), .split, .split, (.A 2 7 4 2 1), (.D 6), .split, .split, .split, .split, (.A 0 7 4 2 1), .split, .split, (.A 2 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_10 : wsegOk P nbM128 (nInsideL P nbM128) kM128_10 tM128_10 kM128_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_11 : List Tok := [(.A 0 7 5 2 1), (.D 18), .split, (.A 0 7 5 0 1), .split, .split, (.A 0 7 5 0 1), .split, (.A 0 7 5 0 1), (.A 0 3 5 0 1), (.D 18), (.D 18), .split, .split, (.D 6), .split, .split, (.A 0 3 5 0 1), (.D 18), (.D 6), (.D 18), .split, .split, (.D 6), .split, .split, .split, (.D 6), .split, .split, (.A 0 3 6 0 5), (.D 6), (.D 6), (.D 6), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_11 : wsegOk P nbM128 (nInsideL P nbM128) kM128_11 tM128_11 kM128_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_12 : List Tok := [(.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 2 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, .split, (.A 1 2 6 1 7), .split, .split, (.A 5 2 6 1 7), (.A 1 2 6 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_12 : wsegOk P nbM128 (nInsideL P nbM128) kM128_12 tM128_12 kM128_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_13 : List Tok := [(.A 5 2 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 7), .split, (.A 0 2 6 1 7), .split, .split, (.A 0 2 4 0 7), (.A 0 2 6 0 7), (.A 0 2 6 0 3), .split, .split, (.A 1 2 4 1 3), .split, (.A 0 2 4 1 3), .split, (.A 1 2 4 1 3), (.A 0 2 6 1 3), (.A 0 2 6 0 3), .split, .split, .split, .split, (.D 4), (.A 5 2 4 1 3), (.D 4), .split, .split, .split, (.D 4), (.A 1 2 5 1 3), .split, (.A 1 2 4 1 3), (.A 1 2 5 1 3), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_13 : wsegOk P nbM128 (nInsideL P nbM128) kM128_13 tM128_13 kM128_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_14 : List Tok := [.split, (.A 1 2 6 1 3), (.A 1 2 7 1 3), .split, .split, (.A 5 2 6 5 3), (.A 5 0 6 5 3), .split, .split, .split, (.A 1 2 6 1 3), .split, .split, (.A 1 2 6 1 3), (.A 0 2 6 1 3), (.A 1 2 7 1 3), .split, (.A 5 2 6 5 3), .split, .split, (.A 0 2 6 0 3), (.A 4 2 6 0 3), (.A 4 2 6 0 3), .split, .split, (.A 5 2 6 1 3), (.A 5 2 7 1 3), .split, (.A 5 2 6 5 3), (.A 5 2 7 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_14 : wsegOk P nbM128 (nInsideL P nbM128) kM128_14 tM128_14 kM128_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_15 : List Tok := [.split, (.D 4), (.A 1 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 0 6 5 0 3), .split, (.D 1), (.A 1 6 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), (.A 0 2 4 1 7), (.A 1 2 5 1 3), (.A 0 6 5 0 3), .split, (.A 0 2 4 0 3), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_15 : wsegOk P nbM128 (nInsideL P nbM128) kM128_15 tM128_15 kM128_16 = true := by
  decide +kernel

end PackLean.D28.Cub
