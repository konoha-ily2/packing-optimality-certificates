-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey006

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN023_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 0 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN023_0 : wsegOk P nbN023 (nInsideL P nbN023) (rRoots P.rden) tN023_0 kN023_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN023_1 : List Tok := [(.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), (.A 4 2 4 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 0 2 4 1 7), .split, (.D 5), (.A 0 3 4 1 7), (.A 0 2 4 1 5), .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 4 2 4 1 7), .split, (.A 0 2 4 1 7), (.A 4 2 4 1 7), .split, .split, .split, (.D 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN023_1 : wsegOk P nbN023 (nInsideL P nbN023) kN023_1 tN023_1 kN023_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN023_2 : List Tok := [.split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, (.A 1 6 4 3 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 0 6 4 1 7), (.A 0 6 4 2 1), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, .split, (.A 1 6 4 0 7), .split, .split, (.A 1 6 4 0 7), (.A 1 2 4 0 7), (.A 0 6 4 0 7), .split, (.A 1 6 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN023_2 : wsegOk P nbN023 (nInsideL P nbN023) kN023_2 tN023_2 kN023_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN023_3 : List Tok := [.split, (.A 1 2 4 0 7), (.A 1 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, .split, .split, .split, (.A 4 2 4 0 7), (.A 0 2 4 0 3), (.A 4 2 4 0 5), (.A 4 2 4 0 3), .split, (.A 0 2 4 0 1), .split, .split, (.A 4 2 4 0 3), (.A 0 2 4 0 3), (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN023_3 : wsegOk P nbN023 (nInsideL P nbN023) kN023_3 tN023_3 kN023_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN023_4 : List Tok := [.split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), (.A 4 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN023_4 : wsegOk P nbN023 (nInsideL P nbN023) kN023_4 tN023_4 kN023_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN023_5 : List Tok := [.split, .split, (.A 4 3 2 4 7), .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, .split, (.D 2), (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), (.A 6 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN023_5 : wsegOk P nbN023 (nInsideL P nbN023) kN023_5 tN023_5 kN023_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN023_6 : List Tok := [.split, (.A 0 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 0 7 4 2 1), .split, (.A 0 7 4 0 1), (.A 0 7 4 0 1), .split, (.A 0 3 6 0 5), .split, (.D 6), (.A 4 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 4 2 4 0 5), .split, (.A 0 3 4 0 1), .split, (.A 0 2 4 0 1), (.A 4 3 4 0 1), (.A 4 3 6 0 5), .split, (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN023_6 : wsegOk P nbN023 (nInsideL P nbN023) kN023_6 tN023_6 kN023_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN023_7 : List Tok := [(.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, .split, .split, .split, (.A 4 2 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1), (.A 4 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), (.A 4 7 5 2 1), .split, .split, (.D 6), .split, (.A 4 3 7 0 5), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN023_7 : wsegOk P nbN023 (nInsideL P nbN023) kN023_7 tN023_7 kN023_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN023_8 : List Tok := [.split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.A 4 2 4 5 7), .split, (.A 5 0 4 5 7), (.A 4 0 6 5 7), .split, (.D 4), .split, (.D 17), .split, (.A 5 0 6 5 3), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 1 7), (.A 4 2 6 0 7), (.A 5 2 6 1 3), .split, (.A 5 2 6 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, .split, (.A 5 0 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN023_8 : wsegOk P nbN023 (nInsideL P nbN023) kN023_8 tN023_8 kN023_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN023_9 : List Tok := [(.D 15), .split, .split, .split, (.D 4), (.A 5 0 7 1 3), (.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN023_9 : wsegOk P nbN023 (nInsideL P nbN023) kN023_9 tN023_9 kN023_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN023_10 : List Tok := [.split, .split, .split, .split, .split, .split, (.A 5 2 4 0 3), (.A 4 2 4 0 3), (.A 5 2 4 0 3), (.A 0 2 5 0 3), (.A 4 2 4 0 3), .split, (.A 5 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 0 6 5 0 3), (.A 4 6 5 0 1), (.A 4 6 5 0 3), .split, .split, (.A 5 6 5 1 3), (.A 1 6 5 0 3), .split, (.A 5 2 7 0 3), (.A 5 6 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 5 0 3), (.D 12), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN023_10 : wsegOk P nbN023 (nInsideL P nbN023) kN023_10 tN023_10 kN023_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN023_11 : List Tok := [.split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, (.A 5 6 7 1 3), (.A 5 6 7 4 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), (.A 4 1 6 4 7), .split, (.A 4 0 6 5 7), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN023_11 : wsegOk P nbN023 (nInsideL P nbN023) kN023_11 tN023_11 kN023_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN023_12 : List Tok := [(.D 13), (.A 4 2 6 4 5), .split, .split, .split, (.A 4 2 6 4 3), .split, (.A 5 0 6 5 3), (.D 13), .split, (.A 4 2 6 4 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 4 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN023_12 : wsegOk P nbN023 (nInsideL P nbN023) kN023_12 tN023_12 kN023_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN023_13 : List Tok := [(.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, (.A 4 2 7 0 1), .split, (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 7 4 1), .split, .split, (.A 5 2 7 4 1), .split, (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN023_13 : wsegOk P nbN023 (nInsideL P nbN023) kN023_13 tN023_13 kN023_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN023_14 : List Tok := [(.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, (.A 5 2 7 4 1), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN023_14 : wsegOk P nbN023 (nInsideL P nbN023) kN023_14 tN023_14 kN023_15 = true := by
  decide +kernel

end PackLean.D28.Cub
