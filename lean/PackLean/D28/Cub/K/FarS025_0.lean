-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey025

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN071_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 0 6 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), .split, (.D 4), .split, (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN071_0 : wsegOk P nbN071 (nInsideL P nbN071) (rRoots P.rden) tN071_0 kN071_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN071_1 : List Tok := [(.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 3 4 1 7), .split, .split, .split, .split, (.D 5), (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 1 7), .split, (.A 0 2 4 1 5), .split, .split, .split, (.A 1 2 4 1 7), (.A 5 2 4 1 7), (.A 1 2 4 1 5), .split, (.A 4 2 4 1 5), (.A 0 2 4 0 5), .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN071_1 : wsegOk P nbN071 (nInsideL P nbN071) kN071_1 tN071_1 kN071_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN071_2 : List Tok := [.split, .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 4 2 4 1 7), (.A 4 2 4 0 5), .split, (.A 5 2 4 1 7), (.A 5 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, (.A 0 7 4 3 5), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, (.A 1 6 5 2 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7), (.A 1 6 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN071_2 : wsegOk P nbN071 (nInsideL P nbN071) kN071_2 tN071_2 kN071_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN071_3 : List Tok := [.split, .split, .split, (.A 0 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, .split, (.A 1 6 4 0 5), (.A 0 6 4 0 5), (.A 1 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 7 4 0 1), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 1 6 4 0 7), (.A 1 6 4 0 7), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN071_3 : wsegOk P nbN071 (nInsideL P nbN071) kN071_3 tN071_3 kN071_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN071_4 : List Tok := [(.A 1 2 4 0 5), (.A 1 2 4 0 7), .split, .split, (.A 1 6 4 0 7), (.A 0 6 4 0 5), .split, (.A 1 6 4 0 3), .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 5), (.A 0 6 4 0 1), .split, (.A 1 6 4 0 3), (.A 1 2 4 0 1), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 7), .split, .split, (.A 1 6 4 0 3), .split, (.A 1 2 4 0 3), (.A 1 6 4 0 3), .split, (.A 1 6 4 0 3), (.A 1 2 4 0 3), .split, .split, .split, .split, (.A 5 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN071_4 : wsegOk P nbN071 (nInsideL P nbN071) kN071_4 tN071_4 kN071_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN071_5 : List Tok := [.split, .split, (.A 1 2 4 0 7), (.A 0 2 4 0 5), .split, (.A 1 2 4 0 3), (.A 5 2 4 0 1), (.A 4 2 4 0 5), .split, (.A 5 2 4 0 3), (.A 5 2 4 0 1), .split, (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 1 2 4 0 3), (.A 1 2 4 0 1), (.A 5 2 4 0 3), .split, (.A 0 2 4 0 1), .split, (.A 1 2 4 0 3), .split, (.A 1 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 4 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN071_5 : wsegOk P nbN071 (nInsideL P nbN071) kN071_5 tN071_5 kN071_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN071_6 : List Tok := [(.A 0 6 4 0 1), .split, .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN071_6 : wsegOk P nbN071 (nInsideL P nbN071) kN071_6 tN071_6 kN071_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN071_7 : List Tok := [(.A 4 3 2 4 7), .split, .split, .split, (.A 4 3 6 1 5), .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, .split, .split, (.A 4 3 6 0 5), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN071_7 : wsegOk P nbN071 (nInsideL P nbN071) kN071_7 tN071_7 kN071_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN071_8 : List Tok := [.split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 4 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, .split, .split, (.A 4 2 4 0 5), (.A 0 3 4 0 5), (.A 4 3 4 0 5), (.A 4 2 4 0 5), .split, .split, (.A 0 3 4 0 1), (.A 0 3 4 0 1), .split, (.A 0 2 4 0 1), (.A 4 3 4 0 1), (.A 4 3 6 0 5), .split, .split, (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN071_8 : wsegOk P nbN071 (nInsideL P nbN071) kN071_8 tN071_8 kN071_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN071_9 : List Tok := [.split, (.A 4 2 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, .split, .split, .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), (.A 4 3 5 0 1), (.A 4 2 5 0 1), (.A 0 7 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN071_9 : wsegOk P nbN071 (nInsideL P nbN071) kN071_9 tN071_9 kN071_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN071_10 : List Tok := [(.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1), (.A 4 7 5 0 1), (.D 18), (.A 4 3 5 2 1), .split, .split, (.D 6), (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 1 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN071_10 : wsegOk P nbN071 (nInsideL P nbN071) kN071_10 tN071_10 kN071_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN071_11 : List Tok := [.split, (.D 17), .split, .split, (.A 5 2 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, (.A 5 2 4 1 7), (.A 5 2 6 1 7), .split, .split, (.A 5 0 4 1 3), .split, (.A 5 2 4 1 3), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4), .split, (.A 5 0 7 1 3), (.D 4), (.A 5 0 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN071_11 : wsegOk P nbN071 (nInsideL P nbN071) kN071_11 tN071_11 kN071_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN071_12 : List Tok := [(.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 3), .split, .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), (.A 1 2 4 0 3), (.A 1 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN071_12 : wsegOk P nbN071 (nInsideL P nbN071) kN071_12 tN071_12 kN071_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN071_13 : List Tok := [.split, (.A 5 2 4 0 1), .split, .split, .split, (.A 5 2 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1), (.A 4 2 5 0 1), (.A 4 2 4 0 1), (.A 5 2 5 0 1), (.A 5 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 1 6 5 0 3), .split, (.A 1 2 5 0 3), (.A 1 6 5 0 3), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN071_13 : wsegOk P nbN071 (nInsideL P nbN071) kN071_13 tN071_13 kN071_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN071_14 : List Tok := [(.A 0 2 5 0 1), .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 2 5 0 1), (.A 1 2 5 0 1), (.A 4 2 5 0 1), (.A 5 2 5 0 1), .split, .split, (.A 0 6 5 0 1), (.A 4 6 5 0 1), (.A 4 6 5 0 1), (.A 0 6 5 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), (.A 5 6 5 0 1), (.A 5 6 5 0 3), .split, .split, (.A 1 6 5 0 3), (.A 0 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN071_14 : wsegOk P nbN071 (nInsideL P nbN071) kN071_14 tN071_14 kN071_15 = true := by
  decide +kernel

end PackLean.D28.Cub
