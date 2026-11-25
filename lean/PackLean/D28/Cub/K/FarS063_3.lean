-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey063

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN148_2 : List Tok := [.split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 1 6 4 3 5), .split, .split, (.A 0 7 4 3 5), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, (.A 1 6 5 2 7), (.D 7), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN148_2 : wsegOk P nbN148 (nInsideL P nbN148) kN148_2 tN148_2 kN148_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN148_3 : List Tok := [.split, .split, .split, (.A 1 6 4 0 5), (.A 1 2 4 0 5), (.A 1 6 4 0 5), .split, .split, .split, .split, (.A 4 2 4 0 5), (.A 0 6 4 0 5), (.A 4 3 4 0 5), .split, (.A 5 2 4 0 5), (.A 4 2 4 0 5), .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, (.A 1 6 4 0 5), .split, .split, .split, (.A 0 6 4 0 5), (.A 4 3 4 0 5), (.A 4 2 4 0 5), (.A 0 7 4 0 1), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, (.A 1 6 4 0 3), .split, .split, .split, .split, (.A 5 2 4 0 7), (.A 1 6 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN148_3 : wsegOk P nbN148 (nInsideL P nbN148) kN148_3 tN148_3 kN148_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN148_4 : List Tok := [.split, (.A 5 2 4 0 5), .split, .split, (.A 1 6 4 0 1), .split, (.A 4 2 4 0 5), .split, (.A 0 6 4 0 1), (.A 4 6 4 0 1), (.A 5 2 4 0 1), (.A 5 2 4 0 3), .split, .split, (.A 1 6 4 0 1), (.A 0 6 4 0 1), .split, (.A 1 6 5 0 3), (.A 1 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 5 0 3), .split, .split, .split, .split, (.D 5), (.A 0 3 6 1 5), .split, (.D 2), .split, (.D 6), (.A 4 3 6 0 5), .split, .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN148_4 : wsegOk P nbN148 (nInsideL P nbN148) kN148_4 tN148_4 kN148_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN148_5 : List Tok := [(.A 4 3 2 4 7), .split, (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 6 1 2 4 7), .split, (.A 4 3 6 0 5), .split, (.A 4 3 6 0 5), (.A 6 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), (.A 0 7 6 2 5), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, .split, (.A 0 7 4 0 5), (.A 4 3 6 0 5), (.A 4 3 4 0 5), (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN148_5 : wsegOk P nbN148 (nInsideL P nbN148) kN148_5 tN148_5 kN148_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN148_6 : List Tok := [(.A 4 3 6 0 5), .split, .split, .split, .split, .split, (.A 4 3 4 0 5), (.A 4 3 4 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, .split, .split, .split, .split, (.A 5 2 4 0 1), (.A 4 6 4 0 1), (.A 4 3 4 0 1), (.A 5 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 4 2 5 0 1), (.A 4 7 5 0 1), (.A 4 3 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN148_6 : wsegOk P nbN148 (nInsideL P nbN148) kN148_6 tN148_6 kN148_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN148_7 : List Tok := [(.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, (.A 0 7 5 0 1), (.D 18), (.A 4 3 5 2 1), .split, (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), (.A 5 0 6 5 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN148_7 : wsegOk P nbN148 (nInsideL P nbN148) kN148_7 tN148_7 kN148_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN148_8 : List Tok := [(.A 7 0 6 5 3), .split, (.A 5 2 4 1 7), .split, .split, (.A 7 0 4 1 3), (.A 5 2 5 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), (.A 5 0 7 1 3), (.D 4), .split, (.A 7 0 6 5 3), .split, (.A 5 2 7 5 3), (.D 15), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN148_8 : wsegOk P nbN148 (nInsideL P nbN148) kN148_8 tN148_8 kN148_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN148_9 : List Tok := [(.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 6 5 0 3), (.A 1 6 5 1 3), (.A 1 6 5 0 3), (.A 5 6 7 0 3), .split, .split, (.A 1 6 5 0 3), .split, (.A 1 6 5 0 3), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN148_9 : wsegOk P nbN148 (nInsideL P nbN148) kN148_9 tN148_9 kN148_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN148_10 : List Tok := [(.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3), (.A 1 6 7 1 3), (.D 12), (.D 12), .split, (.A 5 2 7 5 3), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), .split, .split, (.D 17), .split, (.A 5 2 6 5 7), (.A 5 0 6 5 7), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN148_10 : wsegOk P nbN148 (nInsideL P nbN148) kN148_10 tN148_10 kN148_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN148_11 : List Tok := [(.A 7 0 6 5 3), (.D 13), .split, .split, .split, .split, .split, (.A 5 2 6 1 7), (.A 4 2 6 4 7), (.A 5 2 6 4 7), (.A 5 2 6 0 1), .split, .split, (.A 4 3 6 4 5), .split, .split, (.D 13), (.A 5 2 6 4 5), (.D 13), .split, (.A 4 3 6 0 5), (.A 5 2 6 4 5), .split, .split, .split, (.A 5 2 6 4 3), (.A 7 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), (.A 5 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN148_11 : wsegOk P nbN148 (nInsideL P nbN148) kN148_11 tN148_11 kN148_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN148_12 : List Tok := [(.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 7 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), (.A 5 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, (.A 5 2 7 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN148_12 : wsegOk P nbN148 (nInsideL P nbN148) kN148_12 tN148_12 kN148_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN148_13 : List Tok := [.split, .split, .split, (.A 5 2 5 0 1), .split, .split, (.A 1 6 5 0 1), .split, (.A 5 2 5 0 1), (.A 4 6 5 0 1), (.A 5 6 5 0 1), (.A 4 2 5 0 1), (.A 5 2 5 0 1), (.A 4 2 7 4 1), (.A 5 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 5 2 7 4 1), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN148_13 : wsegOk P nbN148 (nInsideL P nbN148) kN148_13 tN148_13 kN148_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN148_14 : List Tok := [.split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, (.A 5 2 7 4 1), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN148_14 : wsegOk P nbN148 (nInsideL P nbN148) kN148_14 tN148_14 kN148_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN148_15 : List Tok := [.split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN148_15 : wsegOk P nbN148 (nInsideL P nbN148) kN148_15 tN148_15 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), (.A 1 7 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), .split, (.D 11), .split, .split, (.D 11), (.D 11), (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_0 : wsegOk P nbM148 (nInsideL P nbM148) (rRoots P.rden) tM148_0 kM148_1 = true := by
  decide +kernel

end PackLean.D28.Cub
