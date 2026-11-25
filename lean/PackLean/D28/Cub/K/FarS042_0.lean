-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey042

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.A 0 6 4 1 5), .split, (.A 1 6 4 1 5), (.A 0 6 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_0 : wsegOk P nbN104 (nInsideL P nbN104) (rRoots P.rden) tN104_0 kN104_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_1 : List Tok := [.split, (.D 4), .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 3 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 4 3 4 1 7), .split, .split, .split, .split, (.A 1 2 4 1 5), (.A 1 2 4 1 5), (.A 1 2 4 1 5), .split, (.A 0 3 4 1 5), (.A 0 3 4 1 5), .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_1 : wsegOk P nbN104 (nInsideL P nbN104) kN104_1 tN104_1 kN104_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_2 : List Tok := [.split, (.A 4 2 4 1 5), .split, (.A 0 2 4 0 5), (.A 4 2 4 0 5), .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, (.A 4 2 4 0 5), (.A 5 2 4 0 5), (.A 5 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 1 6 4 3 5), .split, .split, (.A 0 7 4 3 5), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, (.A 1 6 5 2 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_2 : wsegOk P nbN104 (nInsideL P nbN104) kN104_2 tN104_2 kN104_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_3 : List Tok := [(.D 7), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, .split, (.A 0 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, .split, (.A 1 6 4 0 5), .split, (.A 1 2 4 0 5), (.A 0 6 4 0 5), (.A 1 2 4 0 5), (.A 1 6 4 0 5), .split, (.A 0 2 4 0 5), .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 7 4 0 1), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_3 : wsegOk P nbN104 (nInsideL P nbN104) kN104_3 tN104_3 kN104_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_4 : List Tok := [(.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 1 6 4 0 5), (.A 1 6 4 0 3), .split, .split, (.A 0 2 4 0 5), .split, .split, (.A 5 2 4 0 5), (.A 1 2 4 0 5), (.A 4 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 1), .split, .split, .split, (.A 1 2 4 0 1), (.A 1 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 1), .split, .split, (.A 1 2 4 0 1), (.A 4 2 4 0 1), (.A 5 2 4 0 1), .split, (.A 0 6 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_4 : wsegOk P nbN104 (nInsideL P nbN104) kN104_4 tN104_4 kN104_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_5 : List Tok := [.split, (.A 1 6 5 0 3), .split, .split, .split, (.A 0 6 4 0 1), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 4 0 1), (.A 0 2 4 0 1), (.A 0 6 4 0 1), .split, (.A 1 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 2 3), .split, .split, .split, .split, (.D 5), (.A 0 3 6 1 5), .split, (.D 2), .split, (.D 6), .split, (.A 4 3 6 0 5), (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_5 : wsegOk P nbN104 (nInsideL P nbN104) kN104_5 tN104_5 kN104_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_6 : List Tok := [.split, .split, .split, (.D 5), (.A 4 3 2 4 7), .split, .split, .split, (.A 4 3 6 1 5), .split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_6 : wsegOk P nbN104 (nInsideL P nbN104) kN104_6 tN104_6 kN104_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_7 : List Tok := [.split, (.A 0 7 4 2 5), (.A 0 7 6 2 5), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 2 1), .split, .split, .split, .split, .split, .split, .split, (.A 4 2 4 0 5), (.A 4 3 4 0 5), (.A 4 2 4 0 5), .split, .split, .split, (.A 0 3 4 0 5), (.A 0 3 4 0 1), (.A 4 3 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 0 2 4 0 1), (.A 4 3 4 0 1), (.A 4 3 6 0 5), .split, (.A 4 2 4 0 1), (.A 4 3 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_7 : wsegOk P nbN104 (nInsideL P nbN104) kN104_7 tN104_7 kN104_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_8 : List Tok := [.split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, .split, .split, .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), (.A 4 3 5 0 1), (.A 4 2 5 0 1), (.A 0 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_8 : wsegOk P nbN104 (nInsideL P nbN104) kN104_8 tN104_8 kN104_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_9 : List Tok := [(.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1), (.A 4 7 5 0 1), (.D 18), (.A 4 3 5 2 1), .split, (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, .split, (.D 4), (.A 5 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_9 : wsegOk P nbN104 (nInsideL P nbN104) kN104_9 tN104_9 kN104_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_10 : List Tok := [(.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, (.A 5 2 4 1 7), (.A 5 2 6 1 7), .split, .split, (.A 5 0 4 1 3), .split, (.A 5 2 4 1 3), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4), .split, (.A 5 0 7 1 3), (.D 4), (.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_10 : wsegOk P nbN104 (nInsideL P nbN104) kN104_10 tN104_10 kN104_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_11 : List Tok := [(.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 2 4 0 3), (.A 1 2 5 0 3), .split, (.A 5 2 4 0 3), (.A 5 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 5 0 1), (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_11 : wsegOk P nbN104 (nInsideL P nbN104) kN104_11 tN104_11 kN104_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_12 : List Tok := [.split, (.A 1 2 5 0 1), (.A 5 2 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 1 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 1 6 5 0 3), .split, (.A 5 2 5 0 1), .split, (.A 1 6 5 0 1), (.A 1 6 5 0 1), (.A 0 6 5 0 1), .split, (.A 1 6 5 0 3), .split, (.A 5 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, (.A 5 2 7 1 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_12 : wsegOk P nbN104 (nInsideL P nbN104) kN104_12 tN104_12 kN104_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_13 : List Tok := [.split, (.A 5 2 7 0 3), .split, .split, (.A 1 6 5 0 3), (.A 5 6 5 0 3), (.D 12), .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3), .split, (.A 5 6 7 1 3), (.D 12), (.D 12), (.D 12), (.A 5 6 7 4 3), (.D 12), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_13 : wsegOk P nbN104 (nInsideL P nbN104) kN104_13 tN104_13 kN104_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_14 : List Tok := [.split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, .split, (.D 17), (.A 4 2 6 5 7), (.A 4 3 6 4 7), (.A 4 0 6 5 7), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 5 2 6 5 7), .split, .split, (.A 4 2 6 4 7), (.A 5 2 6 4 7), (.A 5 2 6 4 7), .split, (.A 5 2 6 0 5), (.A 5 2 6 4 3), .split, .split, (.A 4 3 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_14 : wsegOk P nbN104 (nInsideL P nbN104) kN104_14 tN104_14 kN104_15 = true := by
  decide +kernel

end PackLean.D28.Cub
