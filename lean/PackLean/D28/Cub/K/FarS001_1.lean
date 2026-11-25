-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey001

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM005_2 : List Tok := [(.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, .split, (.A 1 2 4 1 7), (.A 0 6 4 0 7), .split, (.A 0 2 4 0 7), (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, .split, (.A 4 2 4 0 5), (.A 4 2 4 0 3), (.A 4 2 4 0 1), .split, (.A 0 6 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM005_2 : wsegOk P nbM005 (nInsideL P nbM005) kM005_2 tM005_2 kM005_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM005_3 : List Tok := [.split, (.A 0 6 5 0 3), (.A 4 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 4 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), (.A 2 3 6 0 5), .split, .split, .split, (.D 5), (.A 4 3 2 4 7), .split, (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM005_3 : wsegOk P nbM005 (nInsideL P nbM005) kM005_3 tM005_3 kM005_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM005_4 : List Tok := [(.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, (.A 2 3 6 0 5), .split, .split, (.A 6 3 6 0 5), (.A 6 3 6 0 5), (.A 6 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 0 7 4 2 1), .split, (.A 2 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 3 4 0 5), .split, (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM005_4 : wsegOk P nbM005 (nInsideL P nbM005) kM005_4 tM005_4 kM005_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM005_5 : List Tok := [.split, (.A 0 7 4 0 1), (.A 4 7 4 0 1), .split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), .split, (.D 6), (.A 4 3 4 2 1), .split, .split, .split, .split, .split, (.A 4 3 4 0 5), .split, .split, (.A 0 3 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, (.A 4 7 4 0 1), .split, (.A 4 2 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 4 7 4 2 1), (.D 6), (.A 4 7 5 2 1), .split, .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM005_5 : wsegOk P nbM005 (nInsideL P nbM005) kM005_5 tM005_5 kM005_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM005_6 : List Tok := [(.A 6 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 1 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 4 2 6 5 7), .split, (.D 4), (.A 4 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, (.A 4 2 6 1 7), (.A 4 2 4 1 3), .split, (.A 5 2 6 1 3), .split, .split, (.A 5 2 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM005_6 : wsegOk P nbM005 (nInsideL P nbM005) kM005_6 tM005_6 kM005_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM005_7 : List Tok := [(.A 5 0 6 5 3), (.A 5 2 6 1 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, (.A 5 0 6 1 3), (.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM005_7 : wsegOk P nbM005 (nInsideL P nbM005) kM005_7 tM005_7 kM005_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM005_8 : List Tok := [(.A 0 2 5 0 3), (.A 5 6 5 0 3), (.A 0 6 5 0 3), .split, (.A 4 2 5 0 3), (.A 4 6 5 0 3), .split, (.A 5 6 5 0 3), .split, (.A 5 2 7 0 3), (.A 5 6 5 0 3), .split, .split, (.A 0 6 5 0 3), (.A 4 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, (.A 5 6 7 1 3), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), (.A 4 3 6 5 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM005_8 : wsegOk P nbM005 (nInsideL P nbM005) kM005_8 tM005_8 kM005_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM005_9 : List Tok := [(.A 4 1 2 4 7), (.A 4 0 6 5 7), .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), (.A 4 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 6 3 6 4 5), (.A 6 2 7 4 5), (.A 6 1 7 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM005_9 : wsegOk P nbM005 (nInsideL P nbM005) kM005_9 tM005_9 kM005_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM005_10 : List Tok := [.split, .split, (.D 13), (.A 6 2 7 4 5), (.D 13), .split, .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, .split, (.A 5 2 7 5 3), .split, (.D 13), (.A 5 2 7 4 1), .split, (.D 15), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, (.A 4 2 7 0 1), (.A 4 2 7 4 1), (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM005_10 : wsegOk P nbM005 (nInsideL P nbM005) kM005_10 tM005_10 kM005_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM005_11 : List Tok := [.split, .split, (.A 4 7 5 4 1), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, .split, (.A 6 3 7 4 5), (.A 6 2 7 4 1), (.A 6 3 7 4 1), (.D 6), (.A 6 2 7 4 1), .split, (.D 6), (.D 19), .split, .split, .split, .split, (.A 5 2 7 4 1), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM005_11 : wsegOk P nbM005 (nInsideL P nbM005) kM005_11 tM005_11 kM005_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM005_12 : List Tok := [(.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM005_12 : wsegOk P nbM005 (nInsideL P nbM005) kM005_12 tM005_12 kM005_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM005_13 : List Tok := [(.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM005_13 : wsegOk P nbM005 (nInsideL P nbM005) kM005_13 tM005_13 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN006_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 0 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 5 7), .split, .split, (.A 0 2 4 1 7), .split, (.A 0 3 4 1 7), (.A 0 2 4 1 5), .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 5 2 4 1 7), (.A 4 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN006_0 : wsegOk P nbN006 (nInsideL P nbN006) (rRoots P.rden) tN006_0 kN006_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN006_1 : List Tok := [.split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, .split, (.D 7), (.A 0 6 4 2 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 0 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN006_1 : wsegOk P nbN006 (nInsideL P nbN006) kN006_1 tN006_1 kN006_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN006_2 : List Tok := [(.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 4 2 4 0 5), .split, .split, (.A 0 6 4 0 1), (.A 0 2 4 0 1), (.A 4 2 4 0 1), .split, .split, (.A 4 2 4 0 7), (.A 4 6 4 0 3), (.A 4 2 4 0 1), .split, (.A 0 6 4 0 1), (.A 4 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 4 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN006_2 : wsegOk P nbN006 (nInsideL P nbN006) kN006_2 tN006_2 kN006_3 = true := by
  decide +kernel

end PackLean.D28.Cub
