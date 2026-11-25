-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey005

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 0 6 4 1 5), .split, (.D 5), .split, (.D 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_0 : wsegOk P nbN020 (nInsideL P nbN020) (rRoots P.rden) tN020_0 kN020_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_1 : List Tok := [(.A 4 3 4 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 1 7), (.A 0 2 4 1 5), .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 4 2 4 1 7), .split, (.A 4 2 4 1 7), (.A 4 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, (.A 1 6 4 3 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_1 : wsegOk P nbN020 (nInsideL P nbN020) kN020_1 tN020_1 kN020_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_2 : List Tok := [(.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 0 6 4 1 7), (.A 0 6 4 2 1), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, .split, (.A 1 6 4 0 7), .split, .split, (.A 0 6 4 0 7), (.A 1 2 4 0 7), (.A 0 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7), (.A 1 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_2 : wsegOk P nbN020 (nInsideL P nbN020) kN020_2 tN020_2 kN020_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_3 : List Tok := [.split, (.A 0 6 4 0 3), .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, (.A 4 2 4 0 1), .split, .split, .split, (.A 4 2 4 0 1), (.A 0 2 4 0 1), (.A 4 2 4 0 1), (.A 4 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), (.A 4 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_3 : wsegOk P nbN020 (nInsideL P nbN020) kN020_3 tN020_3 kN020_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_4 : List Tok := [(.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), (.A 2 3 6 0 5), .split, .split, (.A 4 3 2 4 7), .split, (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_4 : wsegOk P nbN020 (nInsideL P nbN020) kN020_4 tN020_4 kN020_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_5 : List Tok := [(.A 6 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 0 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 0 7 4 2 1), .split, (.A 0 7 4 0 1), (.A 4 7 4 0 1), .split, (.A 4 3 6 0 5), .split, (.D 6), (.A 4 3 4 2 1), .split, .split, .split, .split, .split, (.A 4 3 4 0 5), .split, .split, (.A 0 3 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_5 : wsegOk P nbN020 (nInsideL P nbN020) kN020_5 tN020_5 kN020_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_6 : List Tok := [(.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, .split, .split, (.A 4 7 4 0 1), (.A 4 7 4 0 1), (.A 4 3 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 4 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), (.A 4 7 4 2 1), .split, .split, (.D 6), .split, (.A 4 3 7 0 5), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 1 2 4 1 7), (.D 4), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_6 : wsegOk P nbN020 (nInsideL P nbN020) kN020_6 tN020_6 kN020_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_7 : List Tok := [.split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.A 4 2 4 5 7), (.A 4 0 6 5 7), .split, (.D 4), .split, (.D 17), .split, .split, (.A 5 0 6 5 3), (.A 4 0 6 5 7), (.A 5 0 6 5 3), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 1 7), (.A 4 2 6 0 7), (.A 5 2 6 1 3), (.A 5 2 6 1 3), .split, (.D 4), .split, .split, (.A 5 0 6 5 3), (.D 15), .split, .split, (.A 5 0 6 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_7 : wsegOk P nbN020 (nInsideL P nbN020) kN020_7 tN020_7 kN020_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_8 : List Tok := [(.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 5 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 2 4 0 3), .split, .split, .split, (.A 5 2 4 0 3), (.A 0 6 5 0 3), (.A 4 2 4 0 3), (.A 5 2 5 0 3), (.A 4 2 4 0 3), (.A 5 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_8 : wsegOk P nbN020 (nInsideL P nbN020) kN020_8 tN020_8 kN020_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_9 : List Tok := [(.A 4 6 5 0 3), .split, (.A 5 6 5 0 3), .split, (.A 5 2 7 0 3), (.A 5 6 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 4 6 5 0 1), (.D 12), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, (.A 5 6 7 0 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_9 : wsegOk P nbN020 (nInsideL P nbN020) kN020_9 tN020_9 kN020_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_10 : List Tok := [(.A 4 0 6 5 7), .split, (.D 13), (.A 4 1 6 4 7), .split, (.A 4 0 6 5 7), (.D 13), .split, .split, (.A 4 2 6 0 7), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, (.A 4 2 6 4 3), .split, (.A 5 0 6 5 3), (.D 13), .split, .split, (.A 5 2 6 4 3), (.A 4 2 6 4 1), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_10 : wsegOk P nbN020 (nInsideL P nbN020) kN020_10 tN020_10 kN020_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_11 : List Tok := [(.A 5 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 6 3 6 4 5), (.A 6 2 7 4 5), .split, (.D 13), (.A 6 1 7 4 5), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_11 : wsegOk P nbN020 (nInsideL P nbN020) kN020_11 tN020_11 kN020_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_12 : List Tok := [.split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, (.A 4 2 7 0 1), (.A 4 2 5 0 1), (.A 4 2 7 4 1), .split, .split, (.A 5 2 7 4 1), .split, (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, .split, (.A 4 2 7 4 1), (.D 19), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_12 : wsegOk P nbN020 (nInsideL P nbN020) kN020_12 tN020_12 kN020_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_13 : List Tok := [.split, (.D 6), (.D 19), .split, .split, .split, .split, (.A 5 2 7 4 1), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_13 : wsegOk P nbN020 (nInsideL P nbN020) kN020_13 tN020_13 kN020_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_14 : List Tok := [.split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_14 : wsegOk P nbN020 (nInsideL P nbN020) kN020_14 tN020_14 [] = true := by
  decide +kernel

end PackLean.D28.Cub
