-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey042

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM104_24 : List Tok := [(.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM104_24 : wsegOk P nbM104 (nInsideL P nbM104) kM104_24 tM104_24 kM104_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM104_25 : List Tok := [.split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM104_25 : wsegOk P nbM104 (nInsideL P nbM104) kM104_25 tM104_25 kM104_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM104_26 : List Tok := [.split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM104_26 : wsegOk P nbM104 (nInsideL P nbM104) kM104_26 tM104_26 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN105_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 0 7 4 1 5), .split, (.A 1 6 4 1 5), .split, (.A 1 2 4 1 5), (.A 0 6 4 1 5), (.A 0 3 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN105_0 : wsegOk P nbN105 (nInsideL P nbN105) (rRoots P.rden) tN105_0 kN105_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN105_1 : List Tok := [.split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), .split, (.D 4), .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 3 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 4 3 4 1 7), .split, .split, (.A 1 2 4 1 5), .split, .split, (.A 0 3 4 1 5), .split, .split, .split, (.D 5), .split, (.A 5 2 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN105_1 : wsegOk P nbN105 (nInsideL P nbN105) kN105_1 tN105_1 kN105_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN105_2 : List Tok := [(.A 4 3 4 1 5), (.A 0 2 4 1 5), (.A 0 3 4 1 5), (.A 0 3 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, .split, (.A 5 2 4 1 5), .split, (.A 0 2 4 1 5), (.A 5 2 4 1 5), (.A 4 3 4 1 5), (.A 4 2 4 1 5), (.A 0 2 4 0 5), .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 0 5), (.A 4 2 4 0 5), (.A 5 2 4 0 5), (.A 5 2 4 1 7), .split, .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN105_2 : wsegOk P nbN105 (nInsideL P nbN105) kN105_2 tN105_2 kN105_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN105_3 : List Tok := [(.D 7), .split, .split, (.D 9), .split, (.A 1 6 4 3 5), .split, .split, (.A 0 7 4 3 5), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, (.A 1 6 5 2 7), (.D 7), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 1 6 4 0 5), (.A 1 2 4 0 5), (.A 1 6 4 0 5), .split, (.A 0 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN105_3 : wsegOk P nbN105 (nInsideL P nbN105) kN105_3 tN105_3 kN105_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN105_4 : List Tok := [.split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 7 4 0 1), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 7), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 1 6 4 0 5), .split, (.A 1 6 4 0 3), (.A 1 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 1 2 4 0 3), .split, .split, .split, .split, (.A 5 2 4 0 7), (.A 1 2 4 0 3), .split, (.A 5 2 4 0 5), .split, .split, .split, (.A 5 2 4 0 5), (.A 1 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN105_4 : wsegOk P nbN105 (nInsideL P nbN105) kN105_4 tN105_4 kN105_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN105_5 : List Tok := [(.A 4 2 4 0 5), (.A 5 2 4 0 1), (.A 5 2 4 0 3), .split, (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 3), (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 1), (.A 4 2 4 0 1), (.A 5 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 0 6 4 0 1), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 4 0 1), (.A 0 2 4 0 1), (.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 1), (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN105_5 : wsegOk P nbN105 (nInsideL P nbN105) kN105_5 tN105_5 kN105_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN105_6 : List Tok := [(.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 2 3), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, (.A 4 3 6 1 5), .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN105_6 : wsegOk P nbN105 (nInsideL P nbN105) kN105_6 tN105_6 kN105_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN105_7 : List Tok := [.split, .split, (.A 4 3 6 0 7), .split, .split, .split, (.A 4 3 6 0 5), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), (.A 0 7 6 2 5), (.A 0 7 4 2 1), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN105_7 : wsegOk P nbN105 (nInsideL P nbN105) kN105_7 tN105_7 kN105_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN105_8 : List Tok := [.split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 4 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, .split, (.A 0 2 4 0 5), (.A 4 3 4 0 5), (.A 4 2 4 0 5), .split, .split, .split, (.A 0 3 4 0 5), (.A 0 3 4 0 1), (.A 0 3 4 0 1), (.A 0 2 4 0 1), (.A 4 3 6 0 5), .split, .split, (.A 4 2 4 0 1), .split, .split, .split, (.A 4 2 4 0 1), (.A 0 2 4 0 1), (.A 4 2 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, (.A 0 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN105_8 : wsegOk P nbN105 (nInsideL P nbN105) kN105_8 tN105_8 kN105_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN105_9 : List Tok := [(.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1), (.A 0 7 5 0 1), (.D 18), (.A 4 3 5 2 1), .split, .split, (.D 6), (.A 4 3 7 2 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN105_9 : wsegOk P nbN105 (nInsideL P nbN105) kN105_9 tN105_9 kN105_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN105_10 : List Tok := [(.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 1 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), (.A 5 2 6 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN105_10 : wsegOk P nbN105 (nInsideL P nbN105) kN105_10 tN105_10 kN105_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN105_11 : List Tok := [.split, .split, (.A 5 0 4 1 3), .split, (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), (.A 5 0 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), .split, (.A 5 2 7 5 3), (.D 15), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN105_11 : wsegOk P nbN105 (nInsideL P nbN105) kN105_11 tN105_11 kN105_12 = true := by
  decide +kernel

end PackLean.D28.Cub
