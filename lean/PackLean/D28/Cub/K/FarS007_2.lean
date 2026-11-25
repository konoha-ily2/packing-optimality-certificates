-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey007

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_13 : List Tok := [(.D 1), (.D 4), (.D 1), .split, .split, .split, .split, (.A 5 6 7 1 3), (.D 12), (.A 5 6 7 4 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), (.A 4 1 6 4 7), (.A 4 0 6 5 7), .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_13 : wsegOk P nbM026 (nInsideL P nbM026) kM026_13 tM026_13 kM026_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_14 : List Tok := [(.A 4 2 6 4 5), .split, .split, .split, (.A 4 2 6 4 3), (.A 4 0 6 5 3), (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), (.A 4 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_14 : wsegOk P nbM026 (nInsideL P nbM026) kM026_14 tM026_14 kM026_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_15 : List Tok := [(.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), .split, (.A 5 2 7 4 3), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 6 0 1), (.A 4 2 7 0 1), .split, .split, (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_15 : wsegOk P nbM026 (nInsideL P nbM026) kM026_15 tM026_15 kM026_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_16 : List Tok := [.split, (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, .split, (.A 4 2 7 4 1), (.D 19), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 5 2 7 4 1), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_16 : wsegOk P nbM026 (nInsideL P nbM026) kM026_16 tM026_16 kM026_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_17 : List Tok := [(.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_17 : wsegOk P nbM026 (nInsideL P nbM026) kM026_17 tM026_17 kM026_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_18 : List Tok := [(.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_18 : wsegOk P nbM026 (nInsideL P nbM026) kM026_18 tM026_18 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN027_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 0 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN027_0 : wsegOk P nbN027 (nInsideL P nbN027) (rRoots P.rden) tN027_0 kN027_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN027_1 : List Tok := [(.A 5 2 4 1 7), .split, (.D 17), (.A 4 3 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 1 7), (.A 0 2 4 1 5), .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 4 2 4 1 7), .split, .split, (.A 4 2 4 1 7), (.A 4 2 4 0 7), (.A 4 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN027_1 : wsegOk P nbN027 (nInsideL P nbN027) kN027_1 tN027_1 kN027_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN027_2 : List Tok := [(.A 0 7 4 2 5), (.D 7), .split, .split, .split, (.A 1 6 4 3 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, (.A 0 6 4 1 5), (.A 1 6 4 0 7), (.A 0 6 4 2 1), .split, .split, (.A 0 6 4 0 5), .split, .split, (.A 0 6 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN027_2 : wsegOk P nbN027 (nInsideL P nbN027) kN027_2 tN027_2 kN027_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN027_3 : List Tok := [(.A 1 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 3), (.A 0 6 4 0 1), .split, .split, (.A 0 2 4 0 5), (.A 4 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, (.A 4 2 4 0 1), .split, .split, .split, .split, .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1), (.A 4 2 4 0 1), (.A 0 2 4 0 1), (.A 4 2 4 0 1), .split, (.A 4 2 4 0 3), (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN027_3 : wsegOk P nbN027 (nInsideL P nbN027) kN027_3 tN027_3 kN027_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN027_4 : List Tok := [.split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, (.A 4 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), (.A 0 3 6 1 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, (.A 4 3 2 4 7), .split, .split, .split, (.A 4 3 6 1 5), (.A 0 3 6 0 5), (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN027_4 : wsegOk P nbN027 (nInsideL P nbN027) kN027_4 tN027_4 kN027_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN027_5 : List Tok := [.split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 4 3 6 0 5), (.D 2), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 0 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN027_5 : wsegOk P nbN027 (nInsideL P nbN027) kN027_5 tN027_5 kN027_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN027_6 : List Tok := [.split, (.A 0 7 4 0 1), (.A 4 7 4 0 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 2 1), .split, .split, .split, .split, .split, (.A 4 3 4 0 5), .split, .split, (.A 0 3 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 4 7 4 0 1), (.A 4 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 4 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN027_6 : wsegOk P nbN027 (nInsideL P nbN027) kN027_6 tN027_6 kN027_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN027_7 : List Tok := [(.A 4 7 4 2 1), .split, .split, (.D 6), .split, (.A 4 3 7 0 5), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 5 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.A 4 2 4 5 7), .split, (.A 5 0 4 5 7), (.A 4 0 6 5 7), .split, (.D 4), .split, (.D 17), .split, .split, (.A 5 0 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN027_7 : wsegOk P nbN027 (nInsideL P nbN027) kN027_7 tN027_7 kN027_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN027_8 : List Tok := [(.A 5 0 6 5 7), (.A 5 0 6 5 3), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 7), (.A 5 2 4 1 3), .split, (.A 5 2 6 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, (.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN027_8 : wsegOk P nbN027 (nInsideL P nbN027) kN027_8 tN027_8 kN027_9 = true := by
  decide +kernel

end PackLean.D28.Cub
