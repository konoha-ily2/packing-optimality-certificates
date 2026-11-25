-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey003

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN016_11 : List Tok := [.split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, (.A 5 6 7 0 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), (.A 4 1 6 4 7), .split, (.A 4 0 6 5 7), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN016_11 : wsegOk P nbN016 (nInsideL P nbN016) kN016_11 tN016_11 kN016_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN016_12 : List Tok := [(.A 4 2 6 4 5), .split, .split, .split, (.A 4 2 6 4 3), (.A 4 0 6 5 3), .split, (.A 4 2 6 4 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 4 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 6 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), (.A 6 1 7 4 5), .split, .split, (.D 13), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN016_12 : wsegOk P nbN016 (nInsideL P nbN016) kN016_12 tN016_12 kN016_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN016_13 : List Tok := [(.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, (.A 4 2 7 0 1), (.A 4 2 5 0 1), (.A 4 2 7 4 1), .split, .split, (.A 5 2 7 4 1), .split, (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, (.A 4 7 5 0 1), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN016_13 : wsegOk P nbN016 (nInsideL P nbN016) kN016_13 tN016_13 kN016_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN016_14 : List Tok := [(.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, .split, .split, (.A 4 2 7 4 1), (.A 4 2 7 4 1), (.D 19), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, (.A 5 2 7 4 1), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN016_14 : wsegOk P nbN016 (nInsideL P nbN016) kN016_14 tN016_14 kN016_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN016_15 : List Tok := [(.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN016_15 : wsegOk P nbN016 (nInsideL P nbN016) kN016_15 tN016_15 kN016_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN016_16 : List Tok := [(.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN016_16 : wsegOk P nbN016 (nInsideL P nbN016) kN016_16 tN016_16 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM016_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 0 6 4 1 5), .split, (.D 5), .split, (.D 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM016_0 : wsegOk P nbM016 (nInsideL P nbM016) (rRoots P.rden) tM016_0 kM016_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM016_1 : List Tok := [.split, (.D 17), .split, (.D 5), (.A 4 2 4 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), (.A 0 2 4 1 7), (.A 0 2 4 1 5), .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 4 2 4 1 7), .split, (.A 0 2 4 1 7), (.A 4 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM016_1 : wsegOk P nbM016 (nInsideL P nbM016) kM016_1 tM016_1 kM016_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM016_2 : List Tok := [(.D 7), .split, .split, .split, .split, (.D 7), .split, (.A 1 6 4 3 7), (.D 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 0 6 4 1 7), (.A 0 6 4 2 1), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, .split, (.A 1 6 4 0 7), (.A 0 6 4 0 7), .split, (.A 1 6 4 0 7), .split, .split, (.A 0 2 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM016_2 : wsegOk P nbM016 (nInsideL P nbM016) kM016_2 tM016_2 kM016_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM016_3 : List Tok := [(.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), (.A 4 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), (.A 4 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM016_3 : wsegOk P nbM016 (nInsideL P nbM016) kM016_3 tM016_3 kM016_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM016_4 : List Tok := [.split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), (.A 4 3 2 4 7), .split, (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, .split, .split, (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM016_4 : wsegOk P nbM016 (nInsideL P nbM016) kM016_4 tM016_4 kM016_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM016_5 : List Tok := [(.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, .split, (.D 2), (.A 0 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), (.A 6 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM016_5 : wsegOk P nbM016 (nInsideL P nbM016) kM016_5 tM016_5 kM016_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM016_6 : List Tok := [.split, (.A 0 7 4 0 1), .split, (.A 0 3 4 0 1), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), .split, (.D 6), (.A 4 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 4 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 0 1), .split, (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, .split, .split, .split, (.A 4 2 4 0 1), (.A 4 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM016_6 : wsegOk P nbM016 (nInsideL P nbM016) kM016_6 tM016_6 kM016_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM016_7 : List Tok := [(.A 4 2 4 0 1), (.A 4 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, (.A 4 7 5 2 1), (.A 4 3 5 2 1), .split, .split, (.D 6), .split, .split, (.A 6 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM016_7 : wsegOk P nbM016 (nInsideL P nbM016) kM016_7 tM016_7 kM016_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM016_8 : List Tok := [.split, (.D 17), .split, (.A 4 2 4 5 7), .split, (.A 5 0 4 5 7), (.A 4 0 6 5 7), .split, (.D 4), .split, (.D 17), .split, .split, (.A 5 0 6 5 3), (.A 4 0 6 5 7), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), (.A 5 2 4 1 3), .split, (.A 5 2 6 1 7), (.A 4 2 4 1 3), .split, .split, (.A 5 0 4 1 3), (.A 5 2 5 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM016_8 : wsegOk P nbM016 (nInsideL P nbM016) kM016_8 tM016_8 kM016_9 = true := by
  decide +kernel

end PackLean.D28.Cub
