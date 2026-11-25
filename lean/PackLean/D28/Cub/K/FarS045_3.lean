-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey045

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM110_21 : List Tok := [.split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 2 6 0 1), .split, (.A 0 2 4 0 1), (.A 0 2 5 0 1), .split, (.A 4 2 6 0 1), .split, (.A 0 2 6 0 1), (.A 4 2 7 0 1), .split, .split, .split, .split, .split, .split, .split, (.A 0 2 6 0 3), (.A 4 2 6 0 1), (.A 4 2 6 0 3), .split, (.A 0 2 6 0 1), .split, (.A 0 2 7 0 3), (.A 4 2 7 0 1), (.A 4 2 6 0 1), .split, (.A 4 2 7 0 3), (.A 4 2 7 0 1), .split, (.A 0 2 7 0 1), .split, (.A 0 2 7 0 1), (.A 4 2 7 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM110_21 : wsegOk P nbM110 (nInsideL P nbM110) kM110_21 tM110_21 kM110_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM110_22 : List Tok := [(.A 4 2 7 0 1), .split, (.A 0 2 5 0 1), .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 3 7 0 1), (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, .split, .split, .split, (.A 4 2 7 4 3), (.A 4 2 7 4 1), (.A 4 2 7 4 1), .split, (.A 5 2 7 4 1), (.A 4 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, (.A 0 7 5 0 1), .split, (.A 0 3 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM110_22 : wsegOk P nbM110 (nInsideL P nbM110) kM110_22 tM110_22 kM110_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM110_23 : List Tok := [(.D 18), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM110_23 : wsegOk P nbM110 (nInsideL P nbM110) kM110_23 tM110_23 kM110_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM110_24 : List Tok := [(.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM110_24 : wsegOk P nbM110 (nInsideL P nbM110) kM110_24 tM110_24 kM110_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM110_25 : List Tok := [(.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM110_25 : wsegOk P nbM110 (nInsideL P nbM110) kM110_25 tM110_25 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN111_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, .split, (.A 1 6 4 1 5), (.A 1 7 4 1 5), .split, (.A 1 6 4 1 5), .split, (.A 1 2 4 1 5), (.A 1 6 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN111_0 : wsegOk P nbN111 (nInsideL P nbN111) (rRoots P.rden) tN111_0 kN111_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN111_1 : List Tok := [(.D 4), .split, (.A 1 2 4 1 7), .split, (.D 4), .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 3 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 4 3 4 1 7), .split, .split, (.A 1 2 4 1 5), .split, .split, (.A 0 3 4 1 5), .split, (.A 1 3 4 1 5), (.A 0 3 4 1 5), .split, (.A 0 3 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN111_1 : wsegOk P nbN111 (nInsideL P nbN111) kN111_1 tN111_1 kN111_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN111_2 : List Tok := [.split, (.A 0 2 4 1 5), (.A 0 3 4 0 5), .split, (.A 1 2 4 1 7), .split, .split, .split, .split, (.A 5 2 4 1 5), .split, (.A 1 2 4 1 5), (.A 5 2 4 1 5), (.A 4 3 4 1 5), .split, (.A 5 2 4 1 7), (.A 4 2 4 1 5), (.A 0 2 4 0 5), .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 0 5), (.A 4 2 4 0 5), (.A 5 2 4 0 5), (.A 5 2 4 1 7), .split, .split, .split, (.D 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN111_2 : wsegOk P nbN111 (nInsideL P nbN111) kN111_2 tN111_2 kN111_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN111_3 : List Tok := [.split, .split, (.D 9), .split, (.A 1 6 4 3 5), .split, .split, (.A 0 7 4 3 5), .split, (.A 1 6 4 1 5), (.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, (.A 1 6 5 2 7), (.D 7), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 1 6 4 0 5), (.A 1 2 4 0 5), (.A 1 6 4 0 5), .split, (.A 0 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN111_3 : wsegOk P nbN111 (nInsideL P nbN111) kN111_3 tN111_3 kN111_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN111_4 : List Tok := [.split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 7 4 0 1), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 7), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 1 6 4 0 5), (.A 1 6 4 0 3), .split, .split, (.A 0 2 4 0 5), .split, (.A 1 2 4 0 5), (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 5 2 4 0 5), .split, .split, (.A 1 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN111_4 : wsegOk P nbN111 (nInsideL P nbN111) kN111_4 tN111_4 kN111_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN111_5 : List Tok := [(.A 4 2 4 0 5), (.A 5 2 4 0 1), (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 1 2 4 0 3), .split, (.A 1 2 4 0 1), .split, (.A 0 2 4 0 1), (.A 1 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 0 6 4 0 1), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 4 0 1), (.A 0 2 4 0 1), (.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 1), (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN111_5 : wsegOk P nbN111 (nInsideL P nbN111) kN111_5 tN111_5 kN111_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN111_6 : List Tok := [(.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 2 3), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, (.A 4 3 6 1 5), .split, (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 5), (.A 4 3 4 0 5), (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN111_6 : wsegOk P nbN111 (nInsideL P nbN111) kN111_6 tN111_6 kN111_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN111_7 : List Tok := [(.A 4 3 6 0 5), .split, .split, .split, (.A 4 3 6 0 7), (.A 4 3 6 0 7), .split, .split, .split, (.A 4 3 6 0 5), .split, .split, (.A 4 2 4 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 4 1 2 4 7), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), (.A 4 1 6 0 5), .split, .split, .split, .split, (.D 9), (.A 0 7 6 2 5), (.A 0 7 4 2 1), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN111_7 : wsegOk P nbN111 (nInsideL P nbN111) kN111_7 tN111_7 kN111_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN111_8 : List Tok := [.split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), (.A 0 3 6 0 5), .split, .split, .split, .split, .split, .split, .split, (.A 0 2 4 0 5), (.A 4 3 4 0 5), .split, .split, (.A 4 2 4 0 5), .split, (.A 0 2 4 0 5), (.A 4 2 4 0 5), (.A 4 3 4 0 5), .split, .split, .split, (.A 0 3 4 0 5), (.A 0 3 4 0 1), (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 0 1), .split, .split, (.A 4 2 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1), .split, .split, (.A 4 2 4 0 1), .split, (.A 0 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN111_8 : wsegOk P nbN111 (nInsideL P nbN111) kN111_8 tN111_8 kN111_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN111_9 : List Tok := [(.A 4 2 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, (.A 0 7 5 0 1), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN111_9 : wsegOk P nbN111 (nInsideL P nbN111) kN111_9 tN111_9 kN111_10 = true := by
  decide +kernel

end PackLean.D28.Cub
