-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey018

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN057_12 : List Tok := [(.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4), .split, (.A 5 0 7 1 3), (.D 4), (.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN057_12 : wsegOk P nbN057 (nInsideL P nbN057) kN057_12 tN057_12 kN057_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN057_13 : List Tok := [(.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 1 6 5 0 3), (.A 1 2 4 0 3), (.A 1 2 5 0 3), .split, .split, .split, (.A 5 2 4 0 3), (.A 4 2 4 0 3), (.A 5 2 4 0 3), .split, .split, .split, .split, .split, (.A 1 2 4 0 3), (.A 4 2 4 0 3), (.A 5 2 4 0 3), (.A 0 2 5 0 3), .split, (.A 4 2 4 0 1), .split, .split, .split, (.A 4 2 4 0 1), (.A 0 2 4 0 1), (.A 4 2 4 0 1), (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN057_13 : wsegOk P nbN057 (nInsideL P nbN057) kN057_13 tN057_13 kN057_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN057_14 : List Tok := [.split, .split, (.A 5 2 5 0 3), .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 5 0 3), .split, (.A 4 2 5 0 3), (.A 5 2 5 0 3), (.A 5 2 5 0 3), (.A 4 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 3), .split, (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, (.A 0 2 5 0 3), (.A 0 6 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, .split, .split, .split, (.A 1 6 5 0 3), .split, (.A 0 2 5 0 3), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN057_14 : wsegOk P nbN057 (nInsideL P nbN057) kN057_14 tN057_14 kN057_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN057_15 : List Tok := [.split, (.A 1 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 6 5 0 1), (.A 0 6 5 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 6 5 0 3), (.A 1 6 5 0 3), .split, .split, (.A 4 2 5 0 1), (.A 5 2 5 0 3), (.A 4 6 5 0 1), .split, (.A 5 6 5 0 3), .split, (.A 5 2 5 0 3), (.A 5 6 5 0 3), .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN057_15 : wsegOk P nbN057 (nInsideL P nbN057) kN057_15 tN057_15 kN057_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN057_16 : List Tok := [.split, (.A 1 6 5 0 3), (.A 4 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), (.A 5 6 7 1 3), (.A 1 6 5 0 3), .split, (.A 5 2 7 0 3), (.A 5 6 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3), (.A 5 6 7 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN057_16 : wsegOk P nbN057 (nInsideL P nbN057) kN057_16 tN057_16 kN057_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN057_17 : List Tok := [(.D 12), (.D 12), (.A 5 6 7 4 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 4 2 6 0 5), .split, (.A 5 2 6 0 3), (.A 4 2 6 4 1), .split, .split, (.A 4 3 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN057_17 : wsegOk P nbN057 (nInsideL P nbN057) kN057_17 tN057_17 kN057_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN057_18 : List Tok := [.split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 5 2 6 4 3), (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 5 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN057_18 : wsegOk P nbN057 (nInsideL P nbN057) kN057_18 tN057_18 kN057_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN057_19 : List Tok := [.split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 6 0 1), (.A 4 2 7 0 1), .split, .split, .split, (.A 4 2 5 0 1), (.A 4 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN057_19 : wsegOk P nbN057 (nInsideL P nbN057) kN057_19 tN057_19 kN057_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN057_20 : List Tok := [(.A 4 2 5 0 1), .split, .split, (.A 4 2 5 0 1), .split, .split, (.A 4 6 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 7 4 1), .split, .split, (.A 5 2 7 4 1), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 4 6 5 0 1), (.D 12), (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN057_20 : wsegOk P nbN057 (nInsideL P nbN057) kN057_20 tN057_20 kN057_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN057_21 : List Tok := [.split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, (.A 5 2 7 4 1), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN057_21 : wsegOk P nbN057 (nInsideL P nbN057) kN057_21 tN057_21 kN057_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN057_22 : List Tok := [(.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN057_22 : wsegOk P nbN057 (nInsideL P nbN057) kN057_22 tN057_22 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM057_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.A 1 6 4 1 5), (.A 0 6 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM057_0 : wsegOk P nbM057 (nInsideL P nbM057) (rRoots P.rden) tM057_0 kM057_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM057_1 : List Tok := [(.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 5 3 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), (.A 0 3 4 1 7), .split, (.A 0 2 4 1 5), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM057_1 : wsegOk P nbM057 (nInsideL P nbM057) kM057_1 tM057_1 kM057_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM057_2 : List Tok := [(.A 1 2 4 1 7), (.A 4 3 4 1 7), .split, (.A 5 2 4 1 7), (.A 4 3 6 1 7), (.A 0 2 4 1 7), .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 7), .split, (.A 4 2 4 1 7), (.A 5 2 6 1 7), .split, (.A 0 2 4 1 7), .split, (.A 1 2 4 1 7), .split, (.A 0 2 4 1 7), (.A 0 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), .split, .split, (.A 0 7 4 3 5), (.A 0 7 4 0 5), .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM057_2 : wsegOk P nbM057 (nInsideL P nbM057) kM057_2 tM057_2 kM057_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM057_3 : List Tok := [(.D 7), (.D 7), .split, .split, .split, .split, (.D 7), .split, (.A 1 6 4 3 7), (.D 7), .split, (.A 1 6 5 2 7), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, (.A 1 6 4 1 5), .split, (.A 1 6 4 1 7), (.A 0 6 4 0 7), .split, (.D 7), (.D 7), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM057_3 : wsegOk P nbM057 (nInsideL P nbM057) kM057_3 tM057_3 kM057_4 = true := by
  decide +kernel

end PackLean.D28.Cub
