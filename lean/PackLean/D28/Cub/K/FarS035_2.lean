-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey035

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN091_30 : List Tok := [(.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN091_30 : wsegOk P nbN091 (nInsideL P nbN091) kN091_30 tN091_30 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM091_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), (.A 1 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM091_0 : wsegOk P nbM091 (nInsideL P nbM091) (rRoots P.rden) tM091_0 kM091_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM091_1 : List Tok := [.split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 3 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 5), (.A 1 2 4 1 7), .split, (.D 5), .split, (.A 1 3 4 1 7), (.A 1 3 4 1 7), .split, .split, (.A 1 2 4 1 5), (.A 1 3 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, (.A 1 3 4 1 5), .split, (.A 1 2 4 1 7), .split, (.A 1 3 4 1 5), (.A 0 2 4 0 5), (.A 0 2 4 0 5), .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM091_1 : wsegOk P nbM091 (nInsideL P nbM091) kM091_1 tM091_1 kM091_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM091_2 : List Tok := [.split, .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 3 4 1 7), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 3 4 1 7), .split, (.A 1 3 4 1 7), .split, (.A 5 2 4 1 7), .split, (.A 5 3 6 1 7), (.A 5 3 4 1 7), (.A 5 2 4 1 7), (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 0 3 4 1 7), .split, (.A 1 2 4 1 7), .split, .split, (.A 1 3 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM091_2 : wsegOk P nbM091 (nInsideL P nbM091) kM091_2 tM091_2 kM091_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM091_3 : List Tok := [.split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 3 4 1 7), (.A 4 3 6 1 7), .split, (.A 5 2 4 1 7), (.A 4 3 6 1 7), (.A 0 2 4 1 7), (.A 0 2 4 1 7), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 1 7), (.A 4 2 6 1 7), (.A 5 2 6 1 7), (.A 5 2 6 1 7), (.A 1 2 4 1 7), (.A 5 2 4 1 7), (.A 1 2 4 0 7), (.A 1 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM091_3 : wsegOk P nbM091 (nInsideL P nbM091) kM091_3 tM091_3 kM091_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM091_4 : List Tok := [.split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 0 7), (.A 5 2 4 0 7), (.A 5 2 4 1 7), (.A 1 2 4 0 7), .split, (.A 1 2 4 0 5), (.A 1 2 4 0 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 0 7), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 2 4 0 5), .split, (.A 1 2 4 0 7), .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 5 2 6 0 7), .split, (.A 1 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM091_4 : wsegOk P nbM091 (nInsideL P nbM091) kM091_4 tM091_4 kM091_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM091_5 : List Tok := [(.A 5 2 6 0 7), (.A 5 2 6 0 7), .L, .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, .split, (.D 7), (.D 9), .split, (.A 1 6 4 1 5), (.A 0 7 4 0 5), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, (.D 7), (.A 1 6 4 2 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM091_5 : wsegOk P nbM091 (nInsideL P nbM091) kM091_5 tM091_5 kM091_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM091_6 : List Tok := [.split, (.D 7), (.D 7), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 1 6 4 0 5), (.A 1 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 7), .split, (.A 0 6 4 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 1 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM091_6 : wsegOk P nbM091 (nInsideL P nbM091) kM091_6 tM091_6 kM091_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM091_7 : List Tok := [(.A 1 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 1 6 4 0 3), .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 7), .split, .split, (.A 1 6 4 0 3), .split, .split, (.A 0 2 4 0 3), (.A 1 2 4 0 3), (.A 0 6 4 0 3), .split, (.A 1 6 4 0 3), (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), .split, .split, (.A 1 2 4 0 7), .split, .split, (.A 1 2 4 0 3), (.A 0 2 4 0 3), (.A 1 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM091_7 : wsegOk P nbM091 (nInsideL P nbM091) kM091_7 tM091_7 kM091_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM091_8 : List Tok := [.split, .L, (.A 0 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM091_8 : wsegOk P nbM091 (nInsideL P nbM091) kM091_8 tM091_8 kM091_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM091_9 : List Tok := [(.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), .split, .split, (.D 5), .split, .split, (.A 0 3 6 1 5), (.A 0 3 6 1 5), .split, .split, (.A 4 3 6 1 7), .split, (.A 0 3 6 1 5), (.A 4 3 6 1 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM091_9 : wsegOk P nbM091 (nInsideL P nbM091) kM091_9 tM091_9 kM091_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM091_10 : List Tok := [(.A 0 3 6 0 5), .split, .split, .split, (.A 4 3 6 0 7), .split, .split, (.A 5 3 6 1 7), (.A 4 2 6 0 7), (.A 4 3 6 0 7), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 3 6 0 5), .split, .split, .split, (.A 0 3 6 1 7), (.A 4 3 6 1 7), (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, .split, .split, (.A 4 3 6 1 7), .split, (.A 0 3 6 0 7), (.A 4 2 6 0 7), (.A 4 3 6 0 5), (.A 4 2 6 0 7), (.A 0 2 6 0 5), (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM091_10 : wsegOk P nbM091 (nInsideL P nbM091) kM091_10 tM091_10 kM091_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM091_11 : List Tok := [(.A 0 2 6 0 5), (.A 0 3 6 0 5), .split, .split, (.A 4 2 6 0 7), .split, (.A 0 2 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 0 2 4 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 2 6 0 7), .split, .split, (.A 0 2 6 0 5), (.A 4 2 6 0 5), .split, .split, (.A 4 2 6 0 7), .L, (.A 4 2 6 0 5), .split, (.A 4 3 6 0 5), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM091_11 : wsegOk P nbM091 (nInsideL P nbM091) kM091_11 tM091_11 kM091_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM091_12 : List Tok := [.split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), (.A 4 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 0 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM091_12 : wsegOk P nbM091 (nInsideL P nbM091) kM091_12 tM091_12 kM091_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM091_13 : List Tok := [(.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 5), .split, .split, .L, (.A 0 2 4 0 1), (.A 0 2 6 0 1), (.A 0 2 4 0 1), .split, .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 4 2 6 0 5), (.A 0 3 6 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, (.A 0 3 6 0 1), .split, (.A 0 2 6 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM091_13 : wsegOk P nbM091 (nInsideL P nbM091) kM091_13 tM091_13 kM091_14 = true := by
  decide +kernel

end PackLean.D28.Cub
