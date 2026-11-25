-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey007

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN026_15 : List Tok := [(.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN026_15 : wsegOk P nbN026 (nInsideL P nbN026) kN026_15 tN026_15 kN026_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN026_16 : List Tok := [(.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN026_16 : wsegOk P nbN026 (nInsideL P nbN026) kN026_16 tN026_16 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 0 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_0 : wsegOk P nbM026 (nInsideL P nbM026) (rRoots P.rden) tM026_0 kM026_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_1 : List Tok := [.split, (.D 17), .split, (.D 5), (.A 4 2 4 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 0 2 4 1 7), (.A 0 3 4 1 7), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, (.A 4 2 4 1 7), .split, (.A 0 2 4 1 7), .split, (.A 0 2 4 1 7), .split, (.A 4 2 4 1 7), (.A 0 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_1 : wsegOk P nbM026 (nInsideL P nbM026) kM026_1 tM026_1 kM026_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_2 : List Tok := [.split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, .split, (.D 7), .split, (.A 1 6 4 3 7), (.D 7), .split, (.A 1 6 5 2 7), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 0 6 4 1 7), .split, (.D 7), (.D 7), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_2 : wsegOk P nbM026 (nInsideL P nbM026) kM026_2 tM026_2 kM026_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_3 : List Tok := [.split, (.A 1 6 4 0 7), .split, (.A 0 2 4 0 7), (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_3 : wsegOk P nbM026 (nInsideL P nbM026) kM026_3 tM026_3 kM026_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_4 : List Tok := [(.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_4 : wsegOk P nbM026 (nInsideL P nbM026) kM026_4 tM026_4 kM026_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_5 : List Tok := [(.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_5 : wsegOk P nbM026 (nInsideL P nbM026) kM026_5 tM026_5 kM026_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_6 : List Tok := [.split, .split, (.D 6), (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 0 7 4 2 1), .split, (.A 0 7 4 0 1), (.A 0 7 4 0 1), .split, (.A 0 3 6 0 5), .split, (.D 6), .split, (.A 0 3 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_6 : wsegOk P nbM026 (nInsideL P nbM026) kM026_6 tM026_6 kM026_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_7 : List Tok := [(.A 0 3 4 0 1), .split, .split, .split, .split, (.A 0 2 4 0 5), .split, (.A 4 2 6 0 5), (.A 4 2 4 0 1), (.A 4 2 6 0 1), .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 1), .split, .split, (.A 4 2 4 0 1), .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, (.A 0 7 5 0 1), (.A 4 6 5 0 1), (.A 4 3 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_7 : wsegOk P nbM026 (nInsideL P nbM026) kM026_7 tM026_7 kM026_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_8 : List Tok := [(.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, (.A 4 7 5 2 1), (.A 4 3 5 2 1), .split, .split, (.D 6), .split, .split, (.A 6 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 4 2 6 5 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_8 : wsegOk P nbM026 (nInsideL P nbM026) kM026_8 tM026_8 kM026_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_9 : List Tok := [(.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 1 2 4 1 3), (.A 5 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 0 2 4 1 7), (.A 5 2 4 1 3), (.A 4 2 6 0 7), .split, (.A 5 2 4 1 3), (.A 4 2 6 0 3), .split, .split, (.A 5 0 4 1 3), (.A 5 2 5 1 3), (.A 5 2 6 5 3), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_9 : wsegOk P nbM026 (nInsideL P nbM026) kM026_9 tM026_9 kM026_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_10 : List Tok := [.split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), (.A 5 0 7 1 3), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 1 6 5 0 3), .split, (.D 1), .split, (.A 1 6 5 1 3), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), (.A 1 6 5 0 3), .split, (.A 1 2 4 0 3), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_10 : wsegOk P nbM026 (nInsideL P nbM026) kM026_10 tM026_10 kM026_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_11 : List Tok := [.split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), .split, (.A 4 2 4 0 3), .split, .split, (.A 0 2 4 0 3), (.A 4 2 4 0 1), (.A 4 2 5 0 3), .split, .split, .split, (.A 4 2 4 0 3), (.A 5 2 5 0 3), .split, (.A 0 2 5 0 3), (.A 4 2 5 0 3), (.A 4 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), .split, (.A 4 2 5 0 1), (.A 4 6 5 0 1), .split, (.A 4 6 5 0 3), (.A 4 2 5 0 1), (.A 0 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_11 : wsegOk P nbM026 (nInsideL P nbM026) kM026_11 tM026_11 kM026_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_12 : List Tok := [.split, (.A 0 6 5 0 3), (.A 4 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), .split, (.A 5 2 5 1 3), (.A 1 6 5 0 3), (.A 5 6 5 1 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 5 2 5 0 3), (.A 4 2 7 0 3), (.A 5 2 7 0 3), .split, (.A 4 6 5 0 3), (.D 12), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 4 6 5 0 1), (.D 12), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_12 : wsegOk P nbM026 (nInsideL P nbM026) kM026_12 tM026_12 kM026_13 = true := by
  decide +kernel

end PackLean.D28.Cub
