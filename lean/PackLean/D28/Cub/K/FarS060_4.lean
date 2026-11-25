-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey060

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN142_15 : List Tok := [.split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 5 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, (.A 5 2 7 4 1), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN142_15 : wsegOk P nbN142 (nInsideL P nbN142) kN142_15 tN142_15 kN142_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN142_16 : List Tok := [(.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN142_16 : wsegOk P nbN142 (nInsideL P nbN142) kN142_16 tN142_16 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM142_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), (.A 1 7 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), .split, (.D 11), .split, .split, (.D 11), (.D 11), (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM142_0 : wsegOk P nbM142 (nInsideL P nbM142) (rRoots P.rden) tM142_0 kM142_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM142_1 : List Tok := [.split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 1 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 5 3 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), (.A 1 3 4 1 7), .split, .split, (.A 1 2 4 1 5), (.A 1 3 4 1 5), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM142_1 : wsegOk P nbM142 (nInsideL P nbM142) kM142_1 tM142_1 kM142_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM142_2 : List Tok := [(.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 3 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 3 6 1 7), (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 6 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM142_2 : wsegOk P nbM142 (nInsideL P nbM142) kM142_2 tM142_2 kM142_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM142_3 : List Tok := [(.D 9), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 7), .split, .split, (.A 1 6 5 3 7), (.D 7), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, .split, (.D 7), .split, (.A 1 6 4 1 5), (.D 7), .split, (.A 1 6 4 1 7), (.A 0 6 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM142_3 : wsegOk P nbM142 (nInsideL P nbM142) kM142_3 tM142_3 kM142_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM142_4 : List Tok := [.split, (.D 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, .split, (.A 1 2 4 1 7), (.A 0 6 4 0 7), .split, .split, (.A 1 2 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 2 4 0 7), (.A 0 6 4 0 3), .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM142_4 : wsegOk P nbM142 (nInsideL P nbM142) kM142_4 tM142_4 kM142_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM142_5 : List Tok := [.split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 1), (.A 0 2 4 0 1), (.A 0 6 4 0 1), .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 18), .split, .split, (.A 0 6 5 0 3), (.D 7), .split, .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM142_5 : wsegOk P nbM142 (nInsideL P nbM142) kM142_5 tM142_5 kM142_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM142_6 : List Tok := [.split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 0 3 4 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, .split, (.D 17), .split, (.D 5), .split, (.A 5 3 6 5 7), (.A 4 3 6 4 7), .split, (.D 5), (.A 4 3 6 4 7), .split, .split, .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM142_6 : wsegOk P nbM142 (nInsideL P nbM142) kM142_6 tM142_6 kM142_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM142_7 : List Tok := [.split, (.A 1 3 6 1 7), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, .split, .split, (.A 1 3 6 1 7), (.A 0 3 6 0 7), (.A 0 3 6 0 7), .split, .split, .split, (.A 1 3 6 1 7), .split, (.A 5 2 6 1 7), (.A 4 3 6 1 7), (.A 0 2 6 0 7), (.A 4 3 6 0 7), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), .split, .split, (.A 0 2 6 0 7), (.A 0 2 6 0 5), .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM142_7 : wsegOk P nbM142 (nInsideL P nbM142) kM142_7 tM142_7 kM142_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM142_8 : List Tok := [(.A 0 3 6 0 5), .split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, .split, (.A 4 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 2 7 4 2 1), .split, .split, (.D 6), (.A 0 3 6 0 5), (.D 6), .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM142_8 : wsegOk P nbM142 (nInsideL P nbM142) kM142_8 tM142_8 kM142_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM142_9 : List Tok := [(.A 2 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), .split, (.D 6), .split, (.A 0 3 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), (.A 0 3 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 2 4 0 1), .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 1), .split, (.A 0 3 6 0 1), (.A 0 2 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM142_9 : wsegOk P nbM142 (nInsideL P nbM142) kM142_9 tM142_9 kM142_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM142_10 : List Tok := [.split, .split, .split, (.A 0 7 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 5 0 1), (.A 0 3 5 0 1), .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), .split, .split, (.A 0 3 4 0 1), (.D 6), .split, (.A 0 3 5 0 1), (.A 0 3 7 0 1), .split, .split, (.A 2 7 4 2 1), (.D 6), .split, .split, (.A 0 7 5 0 1), (.D 18), .split, .split, (.D 6), .split, (.A 0 3 5 2 1), (.D 6), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM142_10 : wsegOk P nbM142 (nInsideL P nbM142) kM142_10 tM142_10 kM142_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM142_11 : List Tok := [.split, .split, (.D 6), .split, .split, .split, (.D 6), (.A 0 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 2 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM142_11 : wsegOk P nbM142 (nInsideL P nbM142) kM142_11 tM142_11 kM142_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM142_12 : List Tok := [(.A 1 2 4 1 3), .split, .split, (.A 1 2 6 1 7), (.A 5 2 6 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, .split, (.A 1 2 6 1 7), .split, (.A 1 2 6 1 7), (.A 0 2 6 0 7), .split, .split, (.A 0 2 4 0 7), (.A 0 2 6 0 7), (.A 0 2 6 0 3), .split, .split, (.A 1 2 4 1 3), .split, (.A 1 2 4 1 3), .split, (.A 1 2 4 1 3), (.A 1 2 6 1 3), .split, .split, (.A 1 2 6 1 3), (.A 5 2 6 1 3), (.A 0 2 6 0 3), .split, .split, .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM142_12 : wsegOk P nbM142 (nInsideL P nbM142) kM142_12 tM142_12 kM142_13 = true := by
  decide +kernel

end PackLean.D28.Cub
