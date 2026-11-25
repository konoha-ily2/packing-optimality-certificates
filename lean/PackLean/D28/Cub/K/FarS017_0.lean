-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey017

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN054_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, .split, (.A 1 6 4 1 5), (.A 0 7 4 1 5), .split, (.A 1 6 4 1 5), (.A 0 6 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN054_0 : wsegOk P nbN054 (nInsideL P nbN054) (rRoots P.rden) tN054_0 kN054_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN054_1 : List Tok := [.split, (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 3 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 5), (.A 1 2 4 1 7), .split, (.D 5), .split, (.A 0 3 4 1 7), .split, .split, .split, (.D 5), (.A 5 2 4 1 7), .split, (.A 0 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN054_1 : wsegOk P nbN054 (nInsideL P nbN054) kN054_1 tN054_1 kN054_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN054_2 : List Tok := [(.A 1 2 4 1 7), .split, (.A 4 3 4 1 7), (.A 0 3 4 1 7), .split, .split, .split, (.A 1 2 4 1 5), .split, .split, (.A 1 2 4 1 5), (.A 0 2 4 1 5), (.A 1 2 4 1 5), (.A 0 3 4 1 5), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, .split, (.A 4 3 4 1 7), (.A 5 2 4 1 7), (.A 4 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN054_2 : wsegOk P nbN054 (nInsideL P nbN054) kN054_2 tN054_2 kN054_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN054_3 : List Tok := [.split, .split, .split, (.A 5 2 4 1 7), (.A 4 2 4 0 7), (.A 5 2 4 1 7), .split, (.A 0 2 4 0 7), (.A 4 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, (.A 0 7 4 3 5), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, .split, .split, (.D 7), (.A 1 6 4 2 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN054_3 : wsegOk P nbN054 (nInsideL P nbN054) kN054_3 tN054_3 kN054_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN054_4 : List Tok := [.split, (.D 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 6 4 0 7), (.A 1 6 4 0 7), (.A 0 6 5 0 3), .split, .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN054_4 : wsegOk P nbN054 (nInsideL P nbN054) kN054_4 tN054_4 kN054_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN054_5 : List Tok := [.split, (.A 0 6 4 0 3), .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 2 4 0 7), (.A 1 2 4 0 3), .split, .split, (.A 0 6 4 0 3), .split, (.A 0 2 4 0 3), (.A 0 6 4 0 3), .split, (.A 1 6 4 0 3), (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), .split, (.A 4 2 4 0 3), (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN054_5 : wsegOk P nbN054 (nInsideL P nbN054) kN054_5 tN054_5 kN054_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN054_6 : List Tok := [(.A 0 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN054_6 : wsegOk P nbN054 (nInsideL P nbN054) kN054_6 tN054_6 kN054_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN054_7 : List Tok := [.split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, (.A 4 3 6 0 7), (.A 4 3 6 0 7), .split, .split, .split, .split, .split, .split, (.A 4 3 6 0 5), (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), .split, (.A 0 3 6 0 5), .split, (.A 0 2 4 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN054_7 : wsegOk P nbN054 (nInsideL P nbN054) kN054_7 tN054_7 kN054_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN054_8 : List Tok := [(.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 0 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN054_8 : wsegOk P nbN054 (nInsideL P nbN054) kN054_8 tN054_8 kN054_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN054_9 : List Tok := [(.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, .split, (.A 0 2 4 0 5), .split, (.A 4 2 6 0 5), (.A 4 2 4 0 1), .split, (.A 4 2 4 0 1), (.A 4 2 6 0 1), (.A 0 2 4 0 1), .split, .split, (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, (.A 4 3 6 0 1), (.A 4 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN054_9 : wsegOk P nbN054 (nInsideL P nbN054) kN054_9 tN054_9 kN054_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN054_10 : List Tok := [(.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), .split, (.A 4 3 4 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1), (.A 4 7 5 0 1), (.D 18), .split, (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, (.A 4 3 7 0 5), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN054_10 : wsegOk P nbN054 (nInsideL P nbN054) kN054_10 tN054_10 kN054_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN054_11 : List Tok := [(.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN054_11 : wsegOk P nbN054 (nInsideL P nbN054) kN054_11 tN054_11 kN054_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN054_12 : List Tok := [(.A 5 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 0 7), .split, (.A 5 2 6 0 7), (.A 4 2 4 0 3), (.A 5 2 6 0 3), (.A 5 2 6 1 3), .split, .split, (.A 5 0 4 1 3), .split, .split, (.A 5 2 5 1 3), (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, .split, (.A 5 0 6 5 3), (.D 15), .split, .split, .split, (.D 4), .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN054_12 : wsegOk P nbN054 (nInsideL P nbN054) kN054_12 tN054_12 kN054_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN054_13 : List Tok := [(.A 5 0 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN054_13 : wsegOk P nbN054 (nInsideL P nbN054) kN054_13 tN054_13 kN054_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN054_14 : List Tok := [.split, .split, .split, .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), (.A 1 6 5 0 3), (.A 0 2 4 0 3), (.A 1 2 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 3), (.A 0 2 4 0 3), (.A 5 2 4 0 3), (.A 0 2 4 0 3), .split, (.A 4 2 4 0 3), .split, .split, (.A 0 2 4 0 3), (.A 4 2 4 0 1), (.A 4 2 4 0 3), .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 3), (.A 4 2 4 0 3), (.A 5 2 4 0 3), (.A 4 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN054_14 : wsegOk P nbN054 (nInsideL P nbN054) kN054_14 tN054_14 kN054_15 = true := by
  decide +kernel

end PackLean.D28.Cub
