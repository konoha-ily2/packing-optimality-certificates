-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey018

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN056_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN056_0 : wsegOk P nbN056 (nInsideL P nbN056) (rRoots P.rden) tN056_0 kN056_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN056_1 : List Tok := [.split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 3 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), (.A 5 2 4 1 7), .split, (.D 5), .split, .split, .split, (.D 5), (.A 0 2 4 1 7), (.A 4 3 4 1 5), .split, (.A 4 2 4 1 7), (.A 4 3 4 1 7), .split, (.A 0 2 4 1 5), .split, .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN056_1 : wsegOk P nbN056 (nInsideL P nbN056) kN056_1 tN056_1 kN056_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN056_2 : List Tok := [(.A 1 2 4 1 5), (.A 0 2 4 1 5), .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 4 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, (.A 4 2 4 1 7), (.A 0 2 4 0 5), .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), (.A 4 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, (.A 0 7 4 3 5), .split, (.A 0 6 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN056_2 : wsegOk P nbN056 (nInsideL P nbN056) kN056_2 tN056_2 kN056_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN056_3 : List Tok := [(.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, .split, (.A 1 6 4 3 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7), (.A 0 6 4 2 1), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN056_3 : wsegOk P nbN056 (nInsideL P nbN056) kN056_3 tN056_3 kN056_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN056_4 : List Tok := [(.A 1 6 4 0 3), .split, (.A 0 6 4 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 1 2 4 0 7), .split, (.A 0 2 4 0 7), (.A 1 2 4 0 3), (.A 1 2 4 0 3), .split, .split, (.A 1 6 4 0 3), .split, (.A 0 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN056_4 : wsegOk P nbN056 (nInsideL P nbN056) kN056_4 tN056_4 kN056_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN056_5 : List Tok := [(.A 0 6 4 0 3), .split, (.A 1 6 4 0 3), (.A 0 2 4 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), (.A 0 2 4 0 3), .split, (.A 4 2 4 0 5), (.A 0 2 4 0 1), .split, .split, .split, (.A 4 2 4 0 7), (.A 5 2 4 0 3), (.A 0 2 4 0 3), (.A 4 2 4 0 1), .split, (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN056_5 : wsegOk P nbN056 (nInsideL P nbN056) kN056_5 tN056_5 kN056_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN056_6 : List Tok := [(.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, (.A 4 3 6 1 5), (.A 0 3 6 0 5), (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN056_6 : wsegOk P nbN056 (nInsideL P nbN056) kN056_6 tN056_6 kN056_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN056_7 : List Tok := [.split, .split, (.A 4 3 6 0 7), .split, .split, .split, (.A 4 3 6 0 5), .split, .split, (.A 4 2 4 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN056_7 : wsegOk P nbN056 (nInsideL P nbN056) kN056_7 tN056_7 kN056_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN056_8 : List Tok := [.split, (.D 9), .split, (.A 0 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 0 2 4 0 5), .split, (.A 4 3 6 0 5), .split, (.A 4 3 4 0 5), (.A 4 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 0 1), .split, .split, (.A 4 2 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN056_8 : wsegOk P nbN056 (nInsideL P nbN056) kN056_8 tN056_8 kN056_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN056_9 : List Tok := [(.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, .split, (.A 0 3 5 0 1), (.A 4 2 5 0 1), (.A 0 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN056_9 : wsegOk P nbN056 (nInsideL P nbN056) kN056_9 tN056_9 kN056_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN056_10 : List Tok := [(.A 4 7 5 0 1), (.D 18), (.A 4 3 5 2 1), .split, .split, (.D 6), (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 1 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN056_10 : wsegOk P nbN056 (nInsideL P nbN056) kN056_10 tN056_10 kN056_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN056_11 : List Tok := [.split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), (.A 5 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 1 7), (.A 5 2 6 0 7), (.A 5 2 6 1 3), .split, .split, (.A 5 0 4 1 3), .split, .split, (.A 5 2 5 1 3), (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, .split, (.A 7 0 6 5 3), (.D 15), .split, .split, .split, (.D 4), .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN056_11 : wsegOk P nbN056 (nInsideL P nbN056) kN056_11 tN056_11 kN056_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN056_12 : List Tok := [(.A 5 0 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN056_12 : wsegOk P nbN056 (nInsideL P nbN056) kN056_12 tN056_12 kN056_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN056_13 : List Tok := [.split, .split, .split, .split, (.A 1 2 4 0 3), .split, .split, (.A 1 6 5 0 3), .split, (.A 1 2 4 0 3), .split, .split, (.A 1 6 4 0 3), (.A 0 2 4 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 2 5 0 3), .split, .split, .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 5 2 4 0 3), (.A 4 2 4 0 3), (.A 5 2 4 0 3), (.A 4 2 4 0 3), (.A 5 2 4 0 3), .split, .split, (.A 0 2 4 0 3), .split, (.A 4 2 4 0 1), .split, (.A 0 2 4 0 1), .split, .split, (.A 4 2 5 0 1), (.A 0 2 5 0 1), (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN056_13 : wsegOk P nbN056 (nInsideL P nbN056) kN056_13 tN056_13 kN056_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN056_14 : List Tok := [.split, .split, .split, .split, (.A 5 2 4 0 3), .split, (.A 5 2 4 0 3), (.A 5 2 5 0 3), (.A 5 2 5 0 3), .split, (.A 0 2 5 0 3), .split, (.A 1 2 5 0 3), .split, (.A 5 2 5 0 3), (.A 4 2 5 0 3), (.A 4 2 5 0 3), .split, .split, (.A 5 2 5 0 3), (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), (.A 5 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 3), .split, (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, (.A 0 2 5 0 3), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN056_14 : wsegOk P nbN056 (nInsideL P nbN056) kN056_14 tN056_14 kN056_15 = true := by
  decide +kernel

end PackLean.D28.Cub
