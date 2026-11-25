-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey000

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN001_7 : List Tok := [(.A 6 1 7 4 5), .split, .split, (.D 13), (.A 6 2 7 4 5), (.D 13), .split, .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, .split, (.A 5 2 7 5 3), .split, (.D 13), (.A 5 2 7 4 1), .split, (.D 15), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, (.A 4 2 7 0 1), (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN001_7 : wsegOk P nbN001 (nInsideL P nbN001) kN001_7 tN001_7 kN001_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN001_8 : List Tok := [.split, .split, (.A 4 7 5 4 1), (.A 4 3 5 4 1), (.D 12), .split, .split, (.A 6 3 7 4 1), (.A 6 2 7 4 1), .split, (.D 6), (.D 19), .split, .split, .split, .split, (.A 5 2 7 4 1), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN001_8 : wsegOk P nbN001 (nInsideL P nbN001) kN001_8 tN001_8 kN001_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN001_9 : List Tok := [.split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN001_9 : wsegOk P nbN001 (nInsideL P nbN001) kN001_9 tN001_9 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM001_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 0 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), (.A 4 3 4 5 7), .split, .split, (.A 0 2 4 1 7), .split, (.A 0 3 4 1 7), (.A 0 2 4 1 5), .split, (.A 0 2 4 1 7), .split, (.A 4 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM001_0 : wsegOk P nbM001 (nInsideL P nbM001) (rRoots P.rden) tM001_0 kM001_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM001_1 : List Tok := [.split, (.A 0 2 4 1 7), (.A 4 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, (.A 0 6 4 3 7), .split, (.A 1 6 5 2 7), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 0 6 4 1 7), (.A 0 6 4 2 1), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM001_1 : wsegOk P nbM001 (nInsideL P nbM001) kM001_1 tM001_1 kM001_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM001_2 : List Tok := [.split, .split, .split, (.A 0 6 4 0 7), .split, (.A 0 6 4 0 7), .split, (.A 0 2 4 0 7), (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), (.A 0 6 4 0 3), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, (.A 4 2 4 0 7), .split, (.A 0 6 4 0 3), (.A 4 6 4 0 3), .split, .split, (.A 4 2 4 0 5), (.A 4 2 4 0 3), (.A 4 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 4 6 5 0 3), (.A 4 6 5 0 1), .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM001_2 : wsegOk P nbM001 (nInsideL P nbM001) kM001_2 tM001_2 kM001_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM001_3 : List Tok := [(.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.D 7), (.A 4 7 4 2 1), (.A 4 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), (.A 2 3 6 0 5), .split, .split, .split, (.D 5), (.A 4 3 2 4 7), .split, (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 7), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM001_3 : wsegOk P nbM001 (nInsideL P nbM001) kM001_3 tM001_3 kM001_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM001_4 : List Tok := [(.D 2), .split, (.A 2 3 6 0 5), .split, .split, .split, (.A 2 3 6 0 5), (.A 6 3 6 0 5), (.A 6 3 6 0 5), (.A 6 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 2 7 4 2 1), .split, (.A 2 3 6 0 5), (.D 6), .split, (.D 9), .split, .split, (.A 2 7 4 2 1), (.D 18), (.D 6), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, .split, (.A 0 3 4 0 5), (.A 0 3 4 0 5), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM001_4 : wsegOk P nbM001 (nInsideL P nbM001) kM001_4 tM001_4 kM001_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM001_5 : List Tok := [.split, (.A 0 7 4 2 1), (.A 4 7 4 0 1), .split, .split, (.A 2 3 6 0 5), (.A 6 3 6 0 5), .split, (.D 6), (.A 6 3 4 2 1), .split, .split, .split, .split, .split, (.A 4 3 4 0 5), .split, .split, .split, (.A 4 3 4 0 5), (.A 4 3 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), (.A 4 3 4 0 1), .split, (.A 4 3 6 0 5), (.A 4 3 7 0 1), .split, .split, (.A 4 7 4 2 1), (.D 6), .split, (.A 4 7 5 2 1), (.A 4 3 5 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM001_5 : wsegOk P nbM001 (nInsideL P nbM001) kM001_5 tM001_5 kM001_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM001_6 : List Tok := [.split, .split, (.D 6), (.A 6 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 1 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), (.A 4 0 4 5 7), .split, (.D 4), (.A 4 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), (.A 4 2 6 1 7), .split, (.A 5 2 6 1 3), (.A 4 2 6 5 3), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM001_6 : wsegOk P nbM001 (nInsideL P nbM001) kM001_6 tM001_6 kM001_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM001_7 : List Tok := [.split, (.A 5 0 6 5 3), .split, .split, (.A 5 0 6 1 3), (.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, (.A 0 6 5 0 3), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 2 4 1 7), (.A 1 2 5 1 3), (.A 0 6 5 0 3), (.A 4 2 5 0 3), .split, (.A 5 6 5 0 3), (.A 4 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM001_7 : wsegOk P nbM001 (nInsideL P nbM001) kM001_7 tM001_7 kM001_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM001_8 : List Tok := [(.A 0 6 5 0 3), .split, (.A 4 2 5 0 3), (.A 4 6 5 0 3), .split, (.A 5 6 5 0 3), .split, (.A 5 2 7 0 3), (.A 4 6 5 0 3), (.A 4 6 5 0 3), .split, .split, .split, .split, (.D 1), (.A 5 4 5 1 3), (.D 4), (.D 1), .split, (.A 5 6 7 1 3), (.D 12), .split, .split, .split, .split, .split, .split, (.A 4 1 6 5 7), (.A 4 1 2 4 7), (.A 4 0 6 5 7), .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, (.A 4 3 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM001_8 : wsegOk P nbM001 (nInsideL P nbM001) kM001_8 tM001_8 kM001_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM001_9 : List Tok := [.split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 4 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, (.A 6 1 6 4 5), (.A 6 3 7 4 5), (.A 6 1 7 4 5), .split, .split, (.D 13), (.A 6 2 7 4 5), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 4 0 6 5 3), .split, (.A 4 2 7 4 3), .split, (.D 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM001_9 : wsegOk P nbM001 (nInsideL P nbM001) kM001_9 tM001_9 kM001_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM001_10 : List Tok := [(.D 13), .split, (.D 13), (.A 6 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, (.A 4 2 7 0 1), .split, .split, (.A 4 3 7 0 1), (.A 4 2 7 4 1), (.A 4 3 7 4 1), (.A 4 2 7 4 1), .split, .split, (.A 4 7 5 4 1), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 6 3 7 4 1), (.D 6), (.A 6 2 7 4 1), .split, (.D 6), (.D 19), .split, .split, .split, .split, (.A 5 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM001_10 : wsegOk P nbM001 (nInsideL P nbM001) kM001_10 tM001_10 kM001_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM001_11 : List Tok := [(.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM001_11 : wsegOk P nbM001 (nInsideL P nbM001) kM001_11 tM001_11 kM001_12 = true := by
  decide +kernel

end PackLean.D28.Cub
