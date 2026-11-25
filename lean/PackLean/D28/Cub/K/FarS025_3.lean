-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey025

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM071_22 : List Tok := [(.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 2 6 0 1), .split, .split, .split, .split, (.A 0 2 6 0 3), (.A 4 2 6 0 1), (.A 4 2 6 0 3), (.A 0 2 6 0 1), (.A 4 2 6 0 1), .split, (.A 0 2 4 0 1), (.A 0 2 5 0 1), .split, (.A 4 2 6 0 1), .split, .split, .split, (.A 4 2 6 0 1), .split, (.A 0 2 6 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, .split, .split, (.A 4 2 6 0 3), (.A 4 2 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM071_22 : wsegOk P nbM071 (nInsideL P nbM071) kM071_22 tM071_22 kM071_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM071_23 : List Tok := [(.A 4 2 7 0 1), .split, .split, .split, (.A 4 2 7 0 1), (.A 4 2 5 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, (.A 0 2 5 0 1), .split, (.A 4 2 5 0 1), .split, (.A 4 3 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 4 2 5 0 1), .split, (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 3 7 0 1), (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, .split, .split, (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM071_23 : wsegOk P nbM071 (nInsideL P nbM071) kM071_23 tM071_23 kM071_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM071_24 : List Tok := [(.A 4 2 7 4 1), (.A 4 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM071_24 : wsegOk P nbM071 (nInsideL P nbM071) kM071_24 tM071_24 kM071_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM071_25 : List Tok := [.split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM071_25 : wsegOk P nbM071 (nInsideL P nbM071) kM071_25 tM071_25 kM071_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM071_26 : List Tok := [(.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM071_26 : wsegOk P nbM071 (nInsideL P nbM071) kM071_26 tM071_26 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN072_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), .split, (.D 4), (.A 5 2 4 1 7), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN072_0 : wsegOk P nbN072 (nInsideL P nbN072) (rRoots P.rden) tN072_0 kN072_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN072_1 : List Tok := [.split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), (.A 4 2 4 5 7), .split, .split, .split, .split, (.D 5), (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 1 7), .split, (.A 0 2 4 1 5), .split, .split, .split, .split, (.A 5 2 4 1 7), (.A 4 2 4 1 5), (.A 5 2 4 1 7), (.A 1 2 4 1 5), .split, (.A 4 2 4 1 5), (.A 0 2 4 0 5), .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN072_1 : wsegOk P nbN072 (nInsideL P nbN072) kN072_1 tN072_1 kN072_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN072_2 : List Tok := [(.A 4 2 4 0 7), (.A 5 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, (.A 0 7 4 1 5), (.A 0 7 4 2 1), (.D 7), .split, .split, (.A 1 6 5 2 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7), (.A 1 6 4 2 1), .split, .split, .split, (.A 0 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN072_2 : wsegOk P nbN072 (nInsideL P nbN072) kN072_2 tN072_2 kN072_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN072_3 : List Tok := [.split, (.A 1 2 4 0 5), (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 7 4 0 1), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 1 6 4 0 7), (.A 1 6 4 0 7), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 1 2 4 0 5), (.A 1 2 4 0 7), .split, .split, (.A 1 6 4 0 7), (.A 0 6 4 0 5), .split, (.A 1 6 4 0 3), .split, .split, .split, (.A 1 6 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN072_3 : wsegOk P nbN072 (nInsideL P nbN072) kN072_3 tN072_3 kN072_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN072_4 : List Tok := [(.A 0 6 4 0 5), .split, (.A 1 6 4 0 3), (.A 1 2 4 0 1), (.A 0 6 4 0 1), .split, .split, (.A 0 2 4 0 5), .split, .split, (.A 4 2 4 0 5), (.A 0 2 4 0 5), (.A 4 2 4 0 5), (.A 0 2 4 0 1), .split, .split, (.A 5 2 4 0 7), .split, .split, (.A 1 6 4 0 3), .split, (.A 1 2 4 0 3), (.A 1 6 4 0 3), .split, (.A 1 6 4 0 3), (.A 1 2 4 0 3), .split, .split, .split, .split, (.A 5 2 4 0 7), .split, (.A 5 2 4 0 5), (.A 5 2 4 0 3), (.A 4 2 4 0 5), (.A 5 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN072_4 : wsegOk P nbN072 (nInsideL P nbN072) kN072_4 tN072_4 kN072_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN072_5 : List Tok := [.split, (.A 0 2 4 0 1), .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 1), .split, (.A 1 2 4 0 1), (.A 5 2 4 0 1), (.A 4 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 4 0 1), .split, .split, (.A 0 6 4 0 1), (.A 0 6 4 0 1), (.A 0 6 4 0 1), .split, .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN072_5 : wsegOk P nbN072 (nInsideL P nbN072) kN072_5 tN072_5 kN072_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN072_6 : List Tok := [(.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), (.A 0 3 6 1 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, (.A 4 3 2 4 7), .split, .split, (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN072_6 : wsegOk P nbN072 (nInsideL P nbN072) kN072_6 tN072_6 kN072_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN072_7 : List Tok := [(.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 4 3 6 0 5), (.D 2), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), (.A 0 7 6 2 5), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 4 3 4 0 5), (.A 4 2 4 0 5), .split, .split, (.A 0 3 4 0 1), (.A 4 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN072_7 : wsegOk P nbN072 (nInsideL P nbN072) kN072_7 tN072_7 kN072_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN072_8 : List Tok := [.split, .split, (.A 4 2 4 0 1), .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1), (.A 4 3 4 0 1), (.A 4 3 6 0 5), .split, (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, .split, .split, .split, .split, (.A 4 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 4 0 1), (.A 4 2 4 0 1), (.A 4 3 4 0 1), .split, .split, (.A 4 2 4 0 1), .split, .split, (.A 4 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN072_8 : wsegOk P nbN072 (nInsideL P nbN072) kN072_8 tN072_8 kN072_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN072_9 : List Tok := [(.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, (.A 0 7 5 0 1), (.A 4 6 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1), (.A 4 7 5 0 1), (.D 18), (.A 4 3 5 2 1), .split, .split, (.D 6), (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN072_9 : wsegOk P nbN072 (nInsideL P nbN072) kN072_9 tN072_9 kN072_10 = true := by
  decide +kernel

end PackLean.D28.Cub
