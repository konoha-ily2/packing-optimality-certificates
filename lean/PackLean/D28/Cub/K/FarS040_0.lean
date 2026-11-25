-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey040

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN100_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, .split, (.A 1 6 4 1 5), (.A 0 7 4 1 5), .split, (.A 1 6 4 1 5), .split, (.A 0 2 4 1 5), (.A 0 6 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN100_0 : wsegOk P nbN100 (nInsideL P nbN100) (rRoots P.rden) tN100_0 kN100_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN100_1 : List Tok := [(.D 4), .split, (.A 1 2 4 1 7), .split, (.D 4), .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 3 4 1 7), .split, .split, .split, .split, (.D 5), (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 4 3 4 1 7), .split, .split, .split, (.A 1 2 4 1 5), (.A 1 2 4 1 5), .split, (.A 0 3 4 1 5), (.A 0 3 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN100_1 : wsegOk P nbN100 (nInsideL P nbN100) kN100_1 tN100_1 kN100_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN100_2 : List Tok := [.split, .split, .split, (.A 1 2 4 1 7), (.A 5 2 4 1 7), (.A 1 2 4 1 5), .split, .split, .split, .split, (.A 4 2 4 1 5), (.A 0 2 4 1 5), (.A 4 3 4 1 5), (.A 4 2 4 1 5), (.A 0 2 4 0 5), .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.A 4 2 4 1 7), (.A 5 2 4 1 7), .split, .split, .split, (.A 5 2 4 0 5), (.A 1 2 4 0 5), (.A 4 2 4 0 5), .split, (.A 5 2 4 0 7), (.A 4 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN100_2 : wsegOk P nbN100 (nInsideL P nbN100) kN100_2 tN100_2 kN100_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN100_3 : List Tok := [.split, (.A 5 2 4 1 7), (.A 5 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, (.A 0 7 4 3 5), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, (.A 1 6 5 2 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7), (.A 1 6 4 2 1), .split, .split, .split, (.A 0 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 3 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN100_3 : wsegOk P nbN100 (nInsideL P nbN100) kN100_3 tN100_3 kN100_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN100_4 : List Tok := [(.A 0 7 4 0 5), .split, .split, .split, .split, (.A 1 6 4 0 5), (.A 0 6 4 0 5), (.A 1 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 7 4 0 1), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 7), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 1 2 4 0 5), (.A 1 2 4 0 7), .split, (.A 1 6 4 0 5), .split, (.A 1 6 4 0 3), .split, .split, (.A 1 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN100_4 : wsegOk P nbN100 (nInsideL P nbN100) kN100_4 tN100_4 kN100_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN100_5 : List Tok := [(.A 1 2 4 0 3), (.A 1 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 7), .split, .split, (.A 1 6 4 0 3), .split, (.A 1 2 4 0 3), (.A 1 6 4 0 3), .split, (.A 1 6 4 0 3), (.A 1 2 4 0 3), .split, .split, .split, .split, (.A 5 2 4 0 7), .split, (.A 1 2 4 0 5), (.A 1 2 4 0 3), .split, (.A 4 2 4 0 5), .split, .split, (.A 0 2 4 0 5), (.A 4 2 4 0 5), (.A 4 2 4 0 1), .split, (.A 5 2 4 0 3), (.A 5 2 4 0 1), .split, (.A 0 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN100_5 : wsegOk P nbN100 (nInsideL P nbN100) kN100_5 tN100_5 kN100_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN100_6 : List Tok := [.split, .split, (.A 1 2 4 0 3), .split, .split, (.A 1 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 1 2 4 0 3), (.A 1 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 4 0 1), (.A 0 6 4 0 1), .split, .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 2 3), .split, .split, .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN100_6 : wsegOk P nbN100 (nInsideL P nbN100) kN100_6 tN100_6 kN100_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN100_7 : List Tok := [.split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, (.A 4 3 6 1 5), .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, .split, .split, (.A 4 3 6 0 5), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN100_7 : wsegOk P nbN100 (nInsideL P nbN100) kN100_7 tN100_7 kN100_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN100_8 : List Tok := [.split, .split, (.D 2), (.A 4 1 2 4 7), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), (.A 0 7 6 2 5), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 4 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, .split, (.A 0 2 4 0 5), (.A 4 3 4 0 5), (.A 4 2 4 0 5), .split, .split, .split, (.A 0 3 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN100_8 : wsegOk P nbN100 (nInsideL P nbN100) kN100_8 tN100_8 kN100_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN100_9 : List Tok := [(.A 0 3 4 0 1), (.A 0 3 4 0 1), (.A 0 2 4 0 1), (.A 4 3 6 0 5), .split, .split, (.A 4 2 4 0 1), .split, .split, .split, (.A 4 2 4 0 1), (.A 0 2 4 0 1), (.A 4 2 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN100_9 : wsegOk P nbN100 (nInsideL P nbN100) kN100_9 tN100_9 kN100_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN100_10 : List Tok := [(.A 0 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1), .split, (.A 4 7 5 0 1), (.D 18), (.D 18), (.A 4 3 5 2 1), .split, .split, (.D 6), (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 1 2 4 1 7), (.D 4), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN100_10 : wsegOk P nbN100 (nInsideL P nbN100) kN100_10 tN100_10 kN100_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN100_11 : List Tok := [.split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), (.A 5 2 6 1 7), .split, .split, (.A 5 0 4 1 3), .split, (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN100_11 : wsegOk P nbN100 (nInsideL P nbN100) kN100_11 tN100_11 kN100_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN100_12 : List Tok := [.split, .split, .split, (.D 4), .split, .split, (.D 4), (.A 5 0 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, (.A 1 6 5 0 3), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN100_12 : wsegOk P nbN100 (nInsideL P nbN100) kN100_12 tN100_12 kN100_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN100_13 : List Tok := [(.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 1), .split, .split, (.A 1 2 4 0 1), (.A 4 2 4 0 1), .split, .split, (.A 5 2 5 0 1), (.A 1 2 5 0 1), (.A 5 2 5 0 1), (.A 5 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), .split, (.A 1 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 1 6 5 0 3), .split, (.A 1 2 5 0 3), (.A 1 6 5 0 3), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN100_13 : wsegOk P nbN100 (nInsideL P nbN100) kN100_13 tN100_13 kN100_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN100_14 : List Tok := [(.A 0 2 5 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 5 0 1), (.A 4 2 5 0 1), .split, (.A 1 2 5 0 3), (.A 5 2 5 0 1), .split, .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 1 6 5 0 1), (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), .split, (.A 5 2 5 0 1), .split, (.A 0 6 5 0 1), (.A 5 6 5 0 1), (.A 5 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN100_14 : wsegOk P nbN100 (nInsideL P nbN100) kN100_14 tN100_14 kN100_15 = true := by
  decide +kernel

end PackLean.D28.Cub
