-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey003

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN015_13 : List Tok := [.split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN015_13 : wsegOk P nbN015 (nInsideL P nbN015) kN015_13 tN015_13 kN015_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN015_14 : List Tok := [.split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN015_14 : wsegOk P nbN015 (nInsideL P nbN015) kN015_14 tN015_14 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), (.A 0 6 4 1 5), .split, (.D 5), .split, (.D 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_0 : wsegOk P nbM015 (nInsideL P nbM015) (rRoots P.rden) tM015_0 kM015_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_1 : List Tok := [.split, (.D 5), (.A 4 2 4 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), (.A 0 2 4 1 7), .split, .split, (.D 5), (.A 0 2 4 1 7), (.A 0 2 4 1 5), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 4 2 4 1 7), .split, (.A 0 2 4 1 7), (.A 4 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_1 : wsegOk P nbM015 (nInsideL P nbM015) kM015_1 tM015_1 kM015_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_2 : List Tok := [(.D 7), .split, .split, .split, .split, (.D 7), (.A 0 6 4 2 7), .split, (.A 1 6 5 2 7), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 0 6 4 1 7), (.A 0 6 4 2 1), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 0 2 4 0 7), (.A 0 6 4 0 3), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_2 : wsegOk P nbM015 (nInsideL P nbM015) kM015_2 tM015_2 kM015_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_3 : List Tok := [.split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), (.A 4 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), (.A 4 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_3 : wsegOk P nbM015 (nInsideL P nbM015) kM015_3 tM015_3 kM015_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_4 : List Tok := [(.A 4 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, .split, (.D 2), (.D 6), (.D 2), .split, .split, .split, (.D 5), (.A 4 3 2 4 7), .split, (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, .split, .split, (.A 0 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_4 : wsegOk P nbM015 (nInsideL P nbM015) kM015_4 tM015_4 kM015_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_5 : List Tok := [.split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, .split, (.D 2), (.A 2 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), (.A 6 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 0 7 4 2 1), .split, (.A 2 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 3 4 0 5), .split, (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_5 : wsegOk P nbM015 (nInsideL P nbM015) kM015_5 tM015_5 kM015_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_6 : List Tok := [.split, (.A 0 7 4 0 1), .split, (.A 0 3 4 0 1), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), .split, (.D 6), .split, (.A 4 3 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_6 : wsegOk P nbM015 (nInsideL P nbM015) kM015_6 tM015_6 kM015_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_7 : List Tok := [.split, .split, (.A 4 2 4 0 1), (.A 4 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, (.A 4 7 5 2 1), (.A 4 3 5 2 1), .split, .split, (.D 6), .split, .split, (.A 6 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_7 : wsegOk P nbM015 (nInsideL P nbM015) kM015_7 tM015_7 kM015_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_8 : List Tok := [.split, (.D 17), .split, (.A 4 2 4 5 7), (.A 4 0 6 5 7), .split, (.D 4), .split, (.D 17), .split, .split, (.A 5 0 6 5 3), (.A 4 0 6 5 7), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 5 2 4 1 7), (.A 5 2 4 1 3), .split, (.A 4 2 6 1 7), (.A 4 2 4 1 3), .split, .split, (.A 5 0 4 1 3), (.A 5 2 5 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_8 : wsegOk P nbM015 (nInsideL P nbM015) kM015_8 tM015_8 kM015_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_9 : List Tok := [(.A 5 0 7 1 3), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), (.A 1 6 5 0 3), .split, (.A 1 2 4 0 3), (.A 0 6 5 0 3), .split, (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_9 : wsegOk P nbM015 (nInsideL P nbM015) kM015_9 tM015_9 kM015_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_10 : List Tok := [.split, (.A 5 2 5 0 3), (.A 1 6 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 4 2 4 0 3), (.A 0 2 5 0 3), (.A 4 2 4 0 3), (.A 4 2 5 0 3), .split, .split, (.A 0 6 5 0 3), (.A 4 6 5 0 1), (.A 4 6 5 0 3), .split, .split, (.A 5 6 5 1 3), (.A 1 6 5 0 3), .split, (.A 5 2 7 0 3), .split, (.A 4 6 5 0 3), (.D 12), .split, .split, (.A 0 6 5 0 3), (.A 4 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_10 : wsegOk P nbM015 (nInsideL P nbM015) kM015_10 tM015_10 kM015_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_11 : List Tok := [(.D 1), (.D 4), (.D 1), .split, .split, (.A 5 6 7 0 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), (.A 4 1 6 4 7), (.A 4 0 6 5 7), .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, (.A 4 2 6 4 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_11 : wsegOk P nbM015 (nInsideL P nbM015) kM015_11 tM015_11 kM015_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_12 : List Tok := [(.A 4 0 6 5 3), (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), (.A 4 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 6 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), (.A 6 1 7 4 5), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_12 : wsegOk P nbM015 (nInsideL P nbM015) kM015_12 tM015_12 kM015_13 = true := by
  decide +kernel

end PackLean.D28.Cub
