-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey000

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_8 : List Tok := [(.A 0 6 4 0 3), (.A 1 2 5 1 3), (.A 0 6 5 0 3), .split, .split, (.A 0 2 4 0 3), (.A 4 2 4 0 3), (.A 0 6 5 0 3), .split, (.A 5 6 5 0 3), (.A 5 2 5 0 3), (.A 0 6 5 0 3), .split, (.A 4 2 5 0 3), (.A 4 6 5 0 3), .split, (.A 5 6 5 0 3), .split, (.A 5 2 7 0 3), .split, (.A 4 6 5 0 3), (.D 12), (.A 4 6 5 0 3), .split, .split, .split, .split, (.D 1), (.A 5 4 5 1 3), (.D 4), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_8 : wsegOk P nbM003 (nInsideL P nbM003) kM003_8 tM003_8 kM003_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_9 : List Tok := [.split, (.A 5 6 7 1 3), (.D 12), .split, .split, .split, .split, .split, .split, (.A 4 1 6 5 7), (.A 4 1 2 4 7), (.A 4 0 6 5 7), .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), (.A 4 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_9 : wsegOk P nbM003 (nInsideL P nbM003) kM003_9 tM003_9 kM003_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_10 : List Tok := [(.A 6 3 7 4 5), (.A 6 1 7 4 5), .split, .split, (.D 13), (.A 6 2 7 4 5), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 4 0 6 5 3), .split, .split, (.A 5 2 7 5 3), .split, (.D 13), (.A 4 2 7 4 1), .split, (.D 15), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, (.A 4 2 7 0 1), .split, (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_10 : wsegOk P nbM003 (nInsideL P nbM003) kM003_10 tM003_10 kM003_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_11 : List Tok := [(.A 4 3 7 4 1), (.A 4 2 7 4 1), .split, .split, (.A 4 7 5 4 1), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 6 3 7 4 1), (.D 6), (.A 6 2 7 4 1), .split, (.D 6), (.D 19), .split, .split, .split, .split, (.A 5 2 7 4 1), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_11 : wsegOk P nbM003 (nInsideL P nbM003) kM003_11 tM003_11 kM003_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_12 : List Tok := [(.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_12 : wsegOk P nbM003 (nInsideL P nbM003) kM003_12 tM003_12 kM003_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_13 : List Tok := [(.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_13 : wsegOk P nbM003 (nInsideL P nbM003) kM003_13 tM003_13 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN004_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), (.A 0 2 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 5 7), .split, .split, (.A 0 2 4 1 7), .split, (.A 0 3 4 1 7), (.A 0 2 4 1 5), .split, .split, (.A 5 2 4 1 7), .split, (.A 0 2 4 1 7), (.A 5 2 4 1 7), (.A 4 2 4 1 7), .split, .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN004_0 : wsegOk P nbN004 (nInsideL P nbN004) (rRoots P.rden) tN004_0 kN004_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN004_1 : List Tok := [(.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, (.A 1 6 4 3 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), (.A 0 7 4 2 1), .split, .split, .split, (.A 0 6 4 0 7), .split, (.A 1 6 4 0 7), (.A 4 6 4 0 7), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN004_1 : wsegOk P nbN004 (nInsideL P nbN004) kN004_1 tN004_1 kN004_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN004_2 : List Tok := [.split, (.A 0 6 4 0 3), (.A 4 6 4 0 1), .split, (.A 4 2 4 0 5), (.A 4 2 4 0 1), (.A 4 2 4 0 3), (.A 4 6 4 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 4 7 5 2 3), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), (.A 2 3 6 0 4), .split, .split, .split, (.D 5), (.A 4 3 2 4 7), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN004_2 : wsegOk P nbN004 (nInsideL P nbN004) kN004_2 tN004_2 kN004_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN004_3 : List Tok := [(.D 2), .split, .split, (.A 6 3 6 0 5), (.D 2), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 2 3 6 0 5), (.D 6), .split, (.D 9), (.A 4 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 4 3 4 0 5), (.A 4 7 4 2 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 2 1), .split, .split, (.A 4 3 6 0 1), (.A 4 3 4 0 1), (.A 4 3 6 0 1), (.A 4 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN004_3 : wsegOk P nbN004 (nInsideL P nbN004) kN004_3 tN004_3 kN004_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN004_4 : List Tok := [.split, (.A 6 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), (.A 5 2 4 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), (.A 4 0 4 5 7), .split, (.D 4), (.A 4 0 6 5 3), .split, .split, (.A 5 2 4 1 7), (.A 4 2 6 1 7), .split, (.A 5 2 6 1 3), .split, (.A 5 0 6 5 3), (.A 5 2 6 1 3), .split, (.D 4), .split, .split, .split, (.D 4), (.A 4 0 6 5 3), (.D 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN004_4 : wsegOk P nbN004 (nInsideL P nbN004) kN004_4 tN004_4 kN004_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN004_5 : List Tok := [.split, (.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 1 6 5 0 3), .split, (.D 1), .split, (.A 5 6 5 1 3), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 6 5 0 3), (.A 1 6 5 0 3), .split, (.A 4 2 5 0 3), (.A 4 6 5 0 3), .split, (.A 5 6 5 0 3), .split, (.A 5 2 7 0 3), (.A 5 6 5 0 3), .split, (.A 4 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN004_5 : wsegOk P nbN004 (nInsideL P nbN004) kN004_5 tN004_5 kN004_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN004_6 : List Tok := [(.A 5 4 5 1 3), (.D 4), (.D 1), .split, (.A 5 6 7 1 3), (.D 12), .split, .split, .split, .split, .split, (.A 4 1 6 4 7), .split, (.A 4 0 6 5 7), (.D 13), .split, .split, (.A 4 2 6 0 7), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, (.A 4 0 6 5 3), (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), (.A 6 2 7 4 1), .split, (.D 13), .split, .split, (.A 6 3 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN004_6 : wsegOk P nbN004 (nInsideL P nbN004) kN004_6 tN004_6 kN004_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN004_7 : List Tok := [(.A 6 1 7 4 5), .split, .split, (.D 13), (.A 6 2 7 4 5), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 7 0 6 5 3), .split, (.A 5 2 7 4 3), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, (.A 4 2 7 0 1), .split, (.A 5 2 7 4 1), (.A 4 2 7 4 1), .split, .split, (.A 4 7 5 4 1), (.A 4 3 5 4 1), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN004_7 : wsegOk P nbN004 (nInsideL P nbN004) kN004_7 tN004_7 kN004_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN004_8 : List Tok := [.split, .split, .split, (.A 6 3 7 4 1), (.D 6), (.A 6 2 7 4 1), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, (.A 7 2 7 4 1), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN004_8 : wsegOk P nbN004 (nInsideL P nbN004) kN004_8 tN004_8 kN004_9 = true := by
  decide +kernel

end PackLean.D28.Cub
