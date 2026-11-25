-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey019

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN128_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, .split, (.D 13), .split, (.A 8 5 0 3 4), (.A 8 5 0 3 11), (.A 8 5 0 3 4), .split, .split, (.D 13), (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN128_0 : wsegOk P nbN128 (nInsideL P nbN128) (rRoots P.rden) tN128_0 kN128_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN128_1 : List Tok := [.split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), (.A 3 5 0 7 11), (.A 3 6 8 7 10), .split, (.A 8 5 0 3 10), .split, (.A 3 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 8 6 0 7 10), .split, .split, (.A 8 1 8 3 11), (.A 3 1 8 7 11), .split, (.A 8 5 0 3 11), .split, (.A 8 6 0 7 10), (.A 8 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, (.A 3 6 8 7 11), .split, .split, (.A 3 1 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN128_1 : wsegOk P nbN128 (nInsideL P nbN128) kN128_1 tN128_1 kN128_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN128_2 : List Tok := [(.A 3 0 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), .split, (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), (.A 2 6 0 7 10), (.A 2 11 0 7 10), .split, .split, (.A 8 5 0 7 10), .split, (.A 2 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 8 5 0 7 10), .split, (.A 8 5 0 7 10), (.A 2 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN128_2 : wsegOk P nbN128 (nInsideL P nbN128) kN128_2 tN128_2 kN128_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN128_3 : List Tok := [(.D 33), .split, .split, (.A 8 5 0 3 10), (.A 8 5 0 3 10), .split, (.D 9), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), .split, (.A 2 6 0 7 10), .split, (.A 2 5 0 7 10), .split, (.D 3), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, (.A 8 6 0 7 10), (.A 3 6 8 7 9), .split, (.A 8 5 0 7 10), .split, (.A 2 6 0 7 10), (.A 8 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN128_3 : wsegOk P nbN128 (nInsideL P nbN128) kN128_3 tN128_3 kN128_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN128_4 : List Tok := [.split, (.A 8 6 8 2 9), .split, (.A 8 5 4 2 10), (.A 8 5 4 2 9), .split, (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9), (.A 8 6 8 2 9), .split, .split, .split, .split, (.A 8 5 0 2 10), .split, (.A 8 5 4 2 3), (.A 8 5 4 2 10), (.D 33), (.A 8 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 10 1 8 3 11), .split, .split, (.A 8 1 0 3 11), .split, .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN128_4 : wsegOk P nbN128 (nInsideL P nbN128) kN128_4 tN128_4 kN128_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN128_5 : List Tok := [(.A 10 1 0 3 11), .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), .split, .split, (.A 10 1 8 3 11), (.A 8 1 0 3 11), (.A 10 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, (.A 10 1 8 7 11), (.A 3 0 8 7 11), (.A 3 1 8 7 11), .split, (.D 41), .split, (.A 10 1 8 3 11), .split, (.A 3 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN128_5 : wsegOk P nbN128 (nInsideL P nbN128) kN128_5 tN128_5 kN128_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN128_6 : List Tok := [.split, .split, .split, .split, (.A 3 1 8 7 11), (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), .split, .split, (.A 10 1 4 3 11), (.A 3 1 8 2 9), .split, (.A 10 1 4 3 9), .split, (.A 3 6 4 2 9), (.A 3 1 4 2 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, .split, .split, (.A 10 1 4 3 11), .split, .split, (.A 10 1 4 3 5), (.A 10 1 4 3 9), (.D 20), (.A 10 1 4 3 9), (.A 10 1 4 3 5), (.D 20), (.D 40), (.D 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN128_6 : wsegOk P nbN128 (nInsideL P nbN128) kN128_6 tN128_6 kN128_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN128_7 : List Tok := [.split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), (.A 8 5 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), .split, .split, (.A 10 1 4 3 9), (.A 8 1 4 3 9), (.A 10 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 8 6 4 2 9), (.A 8 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN128_7 : wsegOk P nbN128 (nInsideL P nbN128) kN128_7 tN128_7 kN128_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN128_8 : List Tok := [(.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 8 1 4 2 9), .split, .split, (.A 3 6 4 2 9), (.A 8 6 4 2 9), (.A 3 1 4 2 9), (.A 8 1 4 2 9), .split, .split, (.A 3 6 8 2 9), (.A 8 6 4 2 9), .split, (.A 3 6 4 2 9), (.A 8 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, .split, .split, (.A 10 1 4 2 9), .split, (.A 10 1 4 2 9), .split, (.A 8 1 4 2 9), (.D 20), (.A 10 1 4 2 9), (.D 20), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN128_8 : wsegOk P nbN128 (nInsideL P nbN128) kN128_8 tN128_8 kN128_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN128_9 : List Tok := [(.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN128_9 : wsegOk P nbN128 (nInsideL P nbN128) kN128_9 tN128_9 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 7 6 2 7 10), .split, .split, .split, (.D 7), .split, (.A 7 6 2 7 10), (.A 7 6 0 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 7 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 7 6 8 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_0 : wsegOk P nbM128 (nInsideL P nbM128) (rRoots P.rden) tM128_0 kM128_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_1 : List Tok := [.split, (.A 3 5 0 3 10), (.A 7 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), (.A 2 1 0 7 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), .split, .split, (.A 2 6 8 7 10), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.A 2 6 8 7 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_1 : wsegOk P nbM128 (nInsideL P nbM128) kM128_1 tM128_1 kM128_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_2 : List Tok := [(.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.A 7 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, (.A 7 11 0 7 10), .split, (.A 7 6 0 7 10), .split, (.A 7 5 0 7 10), (.A 2 11 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, (.A 2 6 8 7 10), .split, (.A 2 5 0 7 10), (.A 2 6 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_2 : wsegOk P nbM128 (nInsideL P nbM128) kM128_2 tM128_2 kM128_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_3 : List Tok := [.split, .split, (.A 2 6 0 2 10), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), .split, .split, (.A 3 1 8 3 11), (.A 3 1 0 3 11), (.A 3 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_3 : wsegOk P nbM128 (nInsideL P nbM128) kM128_3 tM128_3 kM128_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM128_4 : List Tok := [.split, .split, .split, .split, .split, (.A 7 1 8 7 11), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 2 1 8 2 9), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 2 1 4 2 9), .split, (.A 2 6 8 2 9), .split, .split, .split, (.A 2 6 8 2 9), .split, .split, .split, (.A 2 6 8 2 9), (.A 3 6 10 2 9), (.D 40), (.A 2 6 10 2 9), (.D 40), (.A 2 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM128_4 : wsegOk P nbM128 (nInsideL P nbM128) kM128_4 tM128_4 kM128_5 = true := by
  decide +kernel

end PackLean.D28.Ico
