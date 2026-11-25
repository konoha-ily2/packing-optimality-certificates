-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey019

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN130_10 : List Tok := [.split, (.A 8 1 4 2 9), (.D 20), (.A 10 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN130_10 : wsegOk P nbN130 (nInsideL P nbN130) kN130_10 tN130_10 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 7 6 2 7 10), .split, .split, .split, (.D 7), .split, .split, (.A 3 6 2 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 7 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_0 : wsegOk P nbM130 (nInsideL P nbM130) (rRoots P.rden) tM130_0 kM130_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_1 : List Tok := [(.A 7 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 7 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 2 6 8 7 11), (.A 2 6 8 7 9), (.A 2 6 8 7 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_1 : wsegOk P nbM130 (nInsideL P nbM130) kM130_1 tM130_1 kM130_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_2 : List Tok := [(.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.A 7 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, (.A 7 11 0 7 10), .split, (.A 7 6 0 7 10), .split, (.A 7 5 0 7 10), (.A 2 11 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, (.A 2 6 8 7 10), .split, (.A 2 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_2 : wsegOk P nbM130 (nInsideL P nbM130) kM130_2 tM130_2 kM130_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_3 : List Tok := [(.A 2 6 0 2 10), .split, .split, (.A 2 6 0 2 10), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), (.A 3 1 0 3 11), .split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, (.A 7 1 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_3 : wsegOk P nbM130 (nInsideL P nbM130) kM130_3 tM130_3 kM130_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_4 : List Tok := [(.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 2 1 8 2 9), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), .split, (.A 2 6 8 2 9), .split, .split, .split, (.A 2 6 8 2 9), .split, .split, (.A 3 6 10 2 9), (.D 40), (.A 2 6 10 2 9), (.D 40), (.A 2 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_4 : wsegOk P nbM130 (nInsideL P nbM130) kM130_4 tM130_4 kM130_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_5 : List Tok := [.split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 3 5 0 3 11), .split, (.A 3 7 0 3 11), .split, (.D 9), .split, (.A 8 5 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, (.A 2 5 0 3 10), (.A 2 1 4 3 9), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11), (.A 2 5 4 2 9), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11), .split, .split, .split, (.A 2 5 0 3 11), (.A 2 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 10), (.A 8 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_5 : wsegOk P nbM130 (nInsideL P nbM130) kM130_5 tM130_5 kM130_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_6 : List Tok := [(.A 2 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), .split, .split, .split, (.A 2 5 4 2 10), (.A 8 5 6 2 10), (.A 2 5 4 2 9), (.D 31), .split, .split, (.D 1), .split, .split, (.A 3 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_6 : wsegOk P nbM130 (nInsideL P nbM130) kM130_6 tM130_6 kM130_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_7 : List Tok := [(.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_7 : wsegOk P nbM130 (nInsideL P nbM130) kM130_7 tM130_7 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN131_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), .split, (.A 3 1 8 7 11), .split, (.A 10 1 8 9 11), .split, (.A 10 1 8 3 11), (.A 3 1 8 7 11), .split, .split, .split, .split, (.D 13), .split, (.A 8 5 0 3 4), (.A 8 5 0 3 11), (.A 8 5 0 3 4), .split, .split, (.D 13), (.A 8 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN131_0 : wsegOk P nbN131 (nInsideL P nbN131) (rRoots P.rden) tN131_0 kN131_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN131_1 : List Tok := [(.A 8 5 0 3 11), .split, .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), (.A 3 5 0 7 11), (.A 3 6 8 7 10), .split, (.A 8 5 0 3 10), .split, (.A 3 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 8 6 0 7 10), .split, .split, (.A 8 1 8 3 11), (.A 3 1 8 7 11), .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 1 0 7 11), (.A 3 6 8 7 11), .split, (.A 8 5 0 7 10), (.A 8 6 0 7 10), .split, (.A 8 1 8 3 11), .split, (.A 8 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN131_1 : wsegOk P nbN131 (nInsideL P nbN131) kN131_1 tN131_1 kN131_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN131_2 : List Tok := [(.A 8 1 0 7 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, (.A 3 6 8 7 11), .split, .split, (.A 3 1 8 7 11), (.A 3 0 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), (.A 2 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN131_2 : wsegOk P nbN131 (nInsideL P nbN131) kN131_2 tN131_2 kN131_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN131_3 : List Tok := [(.A 2 11 0 7 10), .split, .split, (.A 8 5 0 7 10), .split, .split, (.A 3 6 0 7 10), (.A 2 5 0 7 10), .split, (.A 3 6 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), (.A 8 5 0 3 10), .split, (.D 9), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), .split, .split, (.A 3 6 0 7 10), (.A 3 6 8 7 10), .split, (.A 2 5 0 7 10), .split, (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN131_3 : wsegOk P nbN131 (nInsideL P nbN131) kN131_3 tN131_3 kN131_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN131_4 : List Tok := [(.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 8 6 0 7 10), (.A 3 6 8 7 9), .split, (.A 8 5 0 7 10), .split, .split, (.A 2 6 8 7 10), (.A 2 5 0 7 10), (.A 8 6 4 2 9), .split, .split, (.A 8 6 0 2 10), (.A 3 6 8 2 9), .split, (.A 8 5 4 2 10), .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 3 6 8 1 9), (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9), .split, (.A 8 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN131_4 : wsegOk P nbN131 (nInsideL P nbN131) kN131_4 tN131_4 kN131_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN131_5 : List Tok := [(.D 21), .split, .split, .split, .split, (.A 8 5 0 2 10), (.A 8 5 4 2 3), (.D 33), (.A 8 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 10 1 8 3 11), .split, .split, (.A 8 1 0 3 11), .split, .split, (.D 13), (.A 10 1 0 3 11), .split, (.A 8 7 0 3 11), .split, (.A 8 1 0 3 11), (.A 10 1 0 3 11), .split, .split, (.A 10 1 8 3 11), (.A 8 1 0 3 11), (.A 10 1 4 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN131_5 : wsegOk P nbN131 (nInsideL P nbN131) kN131_5 tN131_5 kN131_6 = true := by
  decide +kernel

end PackLean.D28.Ico
