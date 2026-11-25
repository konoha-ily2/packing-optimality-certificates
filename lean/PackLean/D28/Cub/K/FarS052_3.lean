-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey052

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN126_3 : List Tok := [(.A 1 6 4 0 5), (.A 1 2 4 0 5), (.A 1 6 4 0 5), .split, .split, (.A 0 2 4 0 5), .split, .split, (.A 4 2 4 0 5), (.A 0 2 4 0 5), (.A 4 2 4 0 5), .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 7 4 0 1), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 7), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 5 2 4 0 5), (.A 5 2 4 0 7), (.A 1 6 4 0 3), .split, .split, (.A 4 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN126_3 : wsegOk P nbN126 (nInsideL P nbN126) kN126_3 tN126_3 kN126_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN126_4 : List Tok := [(.A 5 2 4 0 5), (.A 0 2 4 0 1), .split, .split, (.A 5 2 4 0 7), (.A 1 6 4 0 3), .split, (.A 5 2 4 0 1), (.A 5 2 4 0 1), .split, .split, (.A 1 6 4 0 1), (.A 0 6 4 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 6 4 0 1), .split, (.A 4 6 4 0 1), (.A 0 6 4 0 1), .split, (.A 1 6 5 0 1), (.A 5 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 5 0 3), .split, .split, .split, .split, (.D 5), (.A 0 3 6 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN126_4 : wsegOk P nbN126 (nInsideL P nbN126) kN126_4 tN126_4 kN126_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN126_5 : List Tok := [.split, (.D 2), .split, (.D 6), .split, (.A 4 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), (.A 4 3 2 4 7), .split, (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 6 1 2 4 7), .split, (.A 4 3 6 0 5), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), (.A 0 7 6 2 5), (.A 0 7 4 2 1), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN126_5 : wsegOk P nbN126 (nInsideL P nbN126) kN126_5 tN126_5 kN126_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN126_6 : List Tok := [.split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, .split, (.A 4 3 4 0 5), (.A 0 3 4 0 5), (.A 4 3 6 0 5), (.A 0 7 4 2 1), (.A 4 3 6 0 5), .split, .split, .split, .split, .split, (.A 4 3 4 0 5), .split, (.A 4 3 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, .split, .split, (.A 0 6 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, .split, .split, .split, .split, (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN126_6 : wsegOk P nbN126 (nInsideL P nbN126) kN126_6 tN126_6 kN126_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN126_7 : List Tok := [(.A 4 6 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1), .split, (.A 0 7 5 0 1), (.A 4 6 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1), (.A 4 7 5 0 1), (.D 18), (.A 4 3 5 2 1), .split, (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN126_7 : wsegOk P nbN126 (nInsideL P nbN126) kN126_7 tN126_7 kN126_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN126_8 : List Tok := [(.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 4 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 7 0 6 5 3), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 0 4 1 3), (.A 5 2 5 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4), .split, (.A 5 0 7 1 3), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN126_8 : wsegOk P nbN126 (nInsideL P nbN126) kN126_8 tN126_8 kN126_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN126_9 : List Tok := [.split, (.A 7 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, (.A 1 6 5 0 3), .split, (.A 1 6 5 0 3), (.A 5 2 5 0 3), (.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), .split, (.A 5 6 5 0 1), (.A 1 6 5 0 1), .split, (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN126_9 : wsegOk P nbN126 (nInsideL P nbN126) kN126_9 tN126_9 kN126_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN126_10 : List Tok := [(.A 5 6 5 0 3), .split, .split, (.A 5 6 5 1 3), (.A 1 6 5 0 3), (.A 5 6 7 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, (.A 0 6 5 0 3), (.D 12), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3), (.A 5 6 7 1 3), (.D 12), (.D 12), (.A 5 6 7 4 3), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN126_10 : wsegOk P nbN126 (nInsideL P nbN126) kN126_10 tN126_10 kN126_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN126_11 : List Tok := [(.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 5 2 6 5 7), .split, .split, (.A 4 2 6 4 7), (.A 5 2 6 4 7), (.A 5 2 6 4 7), (.A 5 2 6 0 1), .split, .split, (.A 4 3 6 4 5), .split, .split, (.D 13), (.A 4 2 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN126_11 : wsegOk P nbN126 (nInsideL P nbN126) kN126_11 tN126_11 kN126_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN126_12 : List Tok := [(.D 13), (.A 4 2 6 4 5), .split, .split, (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), (.A 5 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN126_12 : wsegOk P nbN126 (nInsideL P nbN126) kN126_12 tN126_12 kN126_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN126_13 : List Tok := [.split, .split, (.D 13), .split, .split, .split, (.A 7 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), (.A 5 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, (.A 5 2 7 0 1), .split, .split, .split, (.A 5 2 5 0 1), (.A 4 6 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 5 2 5 0 1), .split, (.A 5 2 5 0 1), (.A 5 2 5 0 1), (.A 5 2 5 0 1), (.A 4 2 7 4 1), .split, (.A 5 2 7 4 1), (.A 5 2 7 4 1), .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN126_13 : wsegOk P nbN126 (nInsideL P nbN126) kN126_13 tN126_13 kN126_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN126_14 : List Tok := [(.A 4 7 5 0 1), .split, (.A 0 6 5 0 1), (.A 4 6 5 0 1), (.D 12), (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 5 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN126_14 : wsegOk P nbN126 (nInsideL P nbN126) kN126_14 tN126_14 kN126_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN126_15 : List Tok := [(.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN126_15 : wsegOk P nbN126 (nInsideL P nbN126) kN126_15 tN126_15 kN126_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN126_16 : List Tok := [(.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN126_16 : wsegOk P nbN126 (nInsideL P nbN126) kN126_16 tN126_16 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM126_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), (.A 0 7 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM126_0 : wsegOk P nbM126 (nInsideL P nbM126) (rRoots P.rden) tM126_0 kM126_1 = true := by
  decide +kernel

end PackLean.D28.Cub
