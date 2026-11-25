-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey008

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM030_8 : List Tok := [(.A 4 3 6 0 5), (.A 4 3 6 0 1), .split, (.A 4 3 6 0 1), (.A 4 3 7 0 1), .split, .split, .split, (.A 0 7 4 2 1), (.D 18), (.D 6), .split, (.A 4 7 5 2 1), (.A 4 3 5 2 1), .split, .split, (.D 6), .split, .split, (.A 6 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 1 2 4 1 7), (.D 4), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM030_8 : wsegOk P nbM030 (nInsideL P nbM030) kM030_8 tM030_8 kM030_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM030_9 : List Tok := [.split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.A 4 2 4 5 7), .split, (.A 5 0 4 5 7), (.A 4 0 6 5 7), .split, (.D 4), .split, (.D 17), .split, .split, (.A 5 0 6 5 3), (.A 4 0 6 5 7), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 1 2 4 1 3), (.A 5 2 4 1 3), .split, (.A 4 2 6 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM030_9 : wsegOk P nbM030 (nInsideL P nbM030) kM030_9 tM030_9 kM030_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM030_10 : List Tok := [.split, (.A 4 2 4 1 7), (.A 4 2 6 1 3), .split, .split, (.A 5 0 4 1 3), (.A 5 2 5 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), (.A 5 0 7 1 3), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 0 6 5 0 3), .split, (.D 1), .split, (.A 1 6 5 1 3), (.D 1), .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM030_10 : wsegOk P nbM030 (nInsideL P nbM030) kM030_10 tM030_10 kM030_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM030_11 : List Tok := [(.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), .split, (.A 1 2 4 1 7), (.A 0 6 4 0 3), (.A 1 2 5 1 3), (.A 0 6 5 0 3), (.A 0 2 5 0 3), .split, .split, (.A 1 2 5 1 3), (.A 1 6 5 0 3), .split, (.A 1 2 5 0 3), (.A 0 6 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), .split, (.A 4 2 4 0 3), .split, (.A 4 2 4 0 3), (.A 4 2 5 0 3), (.A 4 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM030_11 : wsegOk P nbM030 (nInsideL P nbM030) kM030_11 tM030_11 kM030_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM030_12 : List Tok := [.split, (.A 4 6 5 0 3), (.A 4 2 5 0 1), (.A 4 6 5 0 1), (.A 4 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), .split, (.A 5 2 5 1 3), (.A 5 6 5 0 3), (.A 5 6 5 1 3), (.A 1 6 5 0 3), .split, (.A 4 2 7 0 3), (.A 4 6 5 0 3), .split, .split, (.A 0 6 5 0 3), (.A 4 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, (.A 5 6 7 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM030_12 : wsegOk P nbM030 (nInsideL P nbM030) kM030_12 tM030_12 kM030_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM030_13 : List Tok := [.split, (.A 5 2 7 5 3), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), (.A 4 1 6 4 7), (.A 4 0 6 5 7), .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM030_13 : wsegOk P nbM030 (nInsideL P nbM030) kM030_13 tM030_13 kM030_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM030_14 : List Tok := [.split, (.A 4 2 6 4 1), (.A 4 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 6 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), (.A 6 1 7 4 5), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 2 7 4 3), .split, (.D 15), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM030_14 : wsegOk P nbM030 (nInsideL P nbM030) kM030_14 tM030_14 kM030_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM030_15 : List Tok := [.split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 2 5 0 1), .split, .split, (.A 4 3 7 0 1), (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, (.A 4 2 7 4 1), (.A 4 2 7 4 1), .split, .split, (.A 4 7 5 4 1), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, .split, (.A 6 3 7 4 5), .split, (.A 4 2 7 4 1), (.A 6 3 7 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM030_15 : wsegOk P nbM030 (nInsideL P nbM030) kM030_15 tM030_15 kM030_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM030_16 : List Tok := [(.A 6 3 7 4 1), (.D 6), .split, (.A 6 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM030_16 : wsegOk P nbM030 (nInsideL P nbM030) kM030_16 tM030_16 kM030_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM030_17 : List Tok := [.split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM030_17 : wsegOk P nbM030 (nInsideL P nbM030) kM030_17 tM030_17 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN031_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 0 1 5), .split, (.D 5), .split, (.D 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), .split, (.D 4), (.A 5 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 5 7), .split, .split, .split, .split, (.D 5), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN031_0 : wsegOk P nbN031 (nInsideL P nbN031) (rRoots P.rden) tN031_0 kN031_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN031_1 : List Tok := [(.A 1 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 1 7), (.A 0 2 4 1 5), .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), (.A 4 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, (.A 1 6 4 3 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 0 6 4 1 7), (.A 0 6 4 2 1), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN031_1 : wsegOk P nbN031 (nInsideL P nbN031) kN031_1 tN031_1 kN031_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN031_2 : List Tok := [.split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 6 4 0 7), .split, (.A 1 6 4 0 7), (.A 5 6 4 0 7), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, (.A 0 2 4 0 7), (.A 4 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 4 6 4 0 1), .split, (.A 4 2 4 0 5), .split, (.A 4 6 4 0 1), (.A 4 2 4 0 1), .split, .split, (.A 4 2 4 0 7), (.A 4 6 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN031_2 : wsegOk P nbN031 (nInsideL P nbN031) kN031_2 tN031_2 kN031_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN031_3 : List Tok := [(.A 4 2 4 0 1), .split, .split, (.A 0 6 4 0 1), (.A 0 6 4 0 1), (.A 4 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 4 7 5 0 1), (.D 18), .split, .split, .split, (.A 0 3 2 1 5), .split, (.D 2), .split, (.D 6), (.A 2 3 6 0 5), .split, .split, (.A 4 3 2 4 7), .split, (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN031_3 : wsegOk P nbN031 (nInsideL P nbN031) kN031_3 tN031_3 kN031_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN031_4 : List Tok := [(.D 2), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 0 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 4 3 4 0 5), (.A 4 7 4 2 1), (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 1), (.A 4 3 4 0 1), (.A 4 3 6 0 1), (.A 4 7 4 2 1), .split, .split, (.D 6), (.A 6 3 7 2 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN031_4 : wsegOk P nbN031 (nInsideL P nbN031) kN031_4 tN031_4 kN031_5 = true := by
  decide +kernel

end PackLean.D28.Cub
