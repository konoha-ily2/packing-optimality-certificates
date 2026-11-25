-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey021

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN063_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), .split, (.D 4), (.A 5 2 4 1 7), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN063_0 : wsegOk P nbN063 (nInsideL P nbN063) (rRoots P.rden) tN063_0 kN063_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN063_1 : List Tok := [.split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), (.A 4 2 4 5 7), .split, .split, .split, .split, (.D 5), (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 1 7), .split, (.A 0 2 4 1 5), (.A 0 2 4 1 5), .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.A 4 2 4 1 7), (.A 5 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 5 2 4 1 7), (.A 4 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN063_1 : wsegOk P nbN063 (nInsideL P nbN063) kN063_1 tN063_1 kN063_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN063_2 : List Tok := [.split, (.A 5 2 4 1 7), (.A 5 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, (.A 1 6 5 2 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7), (.A 0 6 4 2 1), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN063_2 : wsegOk P nbN063 (nInsideL P nbN063) kN063_2 tN063_2 kN063_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN063_3 : List Tok := [(.A 0 6 4 0 1), .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 6 4 0 7), (.A 1 6 4 0 7), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 0 2 4 0 5), .split, (.A 1 2 4 0 7), .split, (.A 1 2 4 0 7), .split, (.A 0 2 4 0 7), (.A 1 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 1 6 4 0 3), .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 3), (.A 0 6 4 0 1), .split, .split, (.A 0 2 4 0 5), .split, .split, (.A 4 2 4 0 5), (.A 0 2 4 0 5), (.A 4 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN063_3 : wsegOk P nbN063 (nInsideL P nbN063) kN063_3 tN063_3 kN063_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN063_4 : List Tok := [(.A 0 2 4 0 1), .split, .split, .split, (.A 1 2 4 0 7), (.A 5 2 4 0 3), .split, .split, (.A 1 6 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), (.A 0 2 4 0 3), (.A 1 2 4 0 3), (.A 0 6 4 0 3), .split, (.A 1 6 4 0 3), (.A 1 2 4 0 3), .split, .split, .split, .split, (.A 4 2 4 0 7), .split, (.A 4 2 4 0 5), (.A 4 2 4 0 3), (.A 4 2 4 0 5), .split, (.A 5 2 4 0 3), (.A 4 2 4 0 1), .split, (.A 0 2 4 0 1), .split, .split, .split, (.A 4 2 4 0 3), (.A 5 2 4 0 3), (.A 0 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN063_4 : wsegOk P nbN063 (nInsideL P nbN063) kN063_4 tN063_4 kN063_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN063_5 : List Tok := [(.A 4 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), .split, .split, .split, (.A 0 6 4 0 1), (.A 4 2 4 0 1), (.A 4 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), (.A 0 3 6 1 5), .split, (.D 2), .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN063_5 : wsegOk P nbN063 (nInsideL P nbN063) kN063_5 tN063_5 kN063_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN063_6 : List Tok := [.split, (.A 0 3 6 0 5), (.D 2), .split, .split, (.A 4 3 2 4 7), .split, .split, .split, (.A 4 3 6 1 5), .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 4 3 6 0 5), (.D 2), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN063_6 : wsegOk P nbN063 (nInsideL P nbN063) kN063_6 tN063_6 kN063_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN063_7 : List Tok := [(.D 6), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 4 3 4 0 5), (.A 4 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 5), .split, (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN063_7 : wsegOk P nbN063 (nInsideL P nbN063) kN063_7 tN063_7 kN063_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN063_8 : List Tok := [.split, .split, .split, .split, .split, (.A 4 2 4 0 1), (.A 0 6 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1), .split, (.A 0 7 5 0 1), (.A 4 6 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), (.A 4 7 5 2 1), .split, .split, (.D 6), (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), (.A 5 2 4 1 7), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN063_8 : wsegOk P nbN063 (nInsideL P nbN063) kN063_8 tN063_8 kN063_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN063_9 : List Tok := [(.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 4 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, (.A 5 2 4 1 7), (.A 5 2 6 1 7), .split, .split, (.A 5 0 4 1 3), (.A 5 2 5 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4), (.A 5 0 7 1 3), (.A 5 0 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN063_9 : wsegOk P nbN063 (nInsideL P nbN063) kN063_9 tN063_9 kN063_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN063_10 : List Tok := [(.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 2 4 0 3), (.A 1 2 5 0 3), .split, (.A 5 2 4 0 3), .split, .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 5 2 4 0 3), .split, (.A 5 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN063_10 : wsegOk P nbN063 (nInsideL P nbN063) kN063_10 tN063_10 kN063_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN063_11 : List Tok := [(.A 4 2 4 0 3), (.A 5 2 5 0 3), (.A 4 2 4 0 1), (.A 5 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), .split, .split, (.A 4 6 5 0 1), (.A 4 2 5 0 3), (.A 0 6 5 0 1), (.A 5 6 5 0 3), (.A 0 6 5 0 3), .split, (.A 4 2 5 0 1), (.A 4 6 5 0 1), .split, (.A 5 6 5 0 3), (.A 4 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 1 6 5 0 3), .split, (.A 5 6 5 0 3), .split, .split, (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN063_11 : wsegOk P nbN063 (nInsideL P nbN063) kN063_11 tN063_11 kN063_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN063_12 : List Tok := [(.A 4 6 5 0 1), (.A 5 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 5 2 5 0 3), (.A 5 6 5 1 3), (.A 1 6 5 0 3), .split, (.A 5 2 7 0 3), (.A 5 6 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, (.A 5 6 7 1 3), (.D 12), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN063_12 : wsegOk P nbN063 (nInsideL P nbN063) kN063_12 tN063_12 kN063_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN063_13 : List Tok := [(.A 5 6 7 4 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.A 4 2 6 0 7), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN063_13 : wsegOk P nbN063 (nInsideL P nbN063) kN063_13 tN063_13 kN063_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN063_14 : List Tok := [(.A 5 2 6 4 3), (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 5 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN063_14 : wsegOk P nbN063 (nInsideL P nbN063) kN063_14 tN063_14 kN063_15 = true := by
  decide +kernel

end PackLean.D28.Cub
