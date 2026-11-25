-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey001

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN015_6 : List Tok := [(.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN015_6 : wsegOk P nbN015 (nInsideL P nbN015) kN015_6 tN015_6 kN015_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN015_7 : List Tok := [.split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN015_7 : wsegOk P nbN015 (nInsideL P nbN015) kN015_7 tN015_7 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, .split, (.A 7 6 2 7 10), (.A 2 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 2 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 2 5 0 3 10), (.A 2 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, .split, (.A 2 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_0 : wsegOk P nbM015 (nInsideL P nbM015) (rRoots P.rden) tM015_0 kM015_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_1 : List Tok := [(.A 2 5 0 7 10), (.A 2 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 2 6 8 7 10), (.D 3), .split, .split, (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 2 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .split, (.A 2 6 8 7 10), .split, (.A 2 6 8 7 11), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, (.A 2 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_1 : wsegOk P nbM015 (nInsideL P nbM015) kM015_1 tM015_1 kM015_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_2 : List Tok := [(.D 33), .split, .split, .split, (.A 2 5 0 3 10), .split, (.A 2 5 0 3 11), (.A 2 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, (.A 2 11 0 7 10), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, (.A 2 6 0 2 10), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, .split, .split, (.A 2 5 4 2 10), (.D 33), .split, (.A 2 5 4 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_2 : wsegOk P nbM015 (nInsideL P nbM015) kM015_2 tM015_2 kM015_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_3 : List Tok := [(.A 0 5 4 2 3), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), (.A 2 1 0 3 11), (.A 8 1 4 3 11), (.A 8 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 8 1 4 3 11), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_3 : wsegOk P nbM015 (nInsideL P nbM015) kM015_3 tM015_3 kM015_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_4 : List Tok := [.split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 2 1 8 2 9), (.A 2 6 8 2 9), (.A 3 1 4 3 9), (.A 2 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, (.A 3 1 4 3 9), .split, (.A 3 1 4 3 5), (.A 8 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_4 : wsegOk P nbM015 (nInsideL P nbM015) kM015_4 tM015_4 kM015_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_5 : List Tok := [.split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 2 5 0 3 11), (.A 2 5 0 2 10), (.A 8 1 4 3 9), (.A 2 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), .split, (.A 0 5 4 2 10), (.A 8 5 4 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 2 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_5 : wsegOk P nbM015 (nInsideL P nbM015) kM015_5 tM015_5 kM015_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_6 : List Tok := [(.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 8 1 4 2 9), (.A 2 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), .split, .split, (.A 0 5 4 2 9), (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_6 : wsegOk P nbM015 (nInsideL P nbM015) kM015_6 tM015_6 kM015_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM015_7 : List Tok := [.split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM015_7 : wsegOk P nbM015 (nInsideL P nbM015) kM015_7 tM015_7 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN016_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), (.A 2 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), .split, (.A 2 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 2 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN016_0 : wsegOk P nbN016 (nInsideL P nbN016) (rRoots P.rden) tN016_0 kN016_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN016_1 : List Tok := [.split, .split, (.A 3 6 8 7 11), .split, (.A 2 5 0 7 10), (.A 2 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .L, .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 2 6 8 7 10), (.D 3), .split, .split, (.A 3 6 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 10), (.A 2 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .split, (.A 2 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .L, (.A 2 6 8 7 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN016_1 : wsegOk P nbN016 (nInsideL P nbN016) kN016_1 tN016_1 kN016_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN016_2 : List Tok := [(.A 2 6 8 7 9), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, (.A 2 5 0 7 10), (.D 33), .split, .split, .split, (.A 2 5 0 3 10), (.A 8 5 0 3 10), .split, (.A 2 5 0 7 10), .split, .split, (.A 8 5 0 3 10), .split, (.A 2 5 0 7 10), .split, .split, (.A 8 5 0 3 10), .L, (.A 2 5 0 2 10), (.A 2 5 0 2 10), .split, (.D 9), (.A 2 5 0 2 10), (.D 33), .split, (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN016_2 : wsegOk P nbN016 (nInsideL P nbN016) kN016_2 tN016_2 kN016_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN016_3 : List Tok := [.split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .L, (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, .split, (.A 2 5 4 2 10), .split, (.A 2 5 4 2 10), (.A 0 5 4 2 3), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN016_3 : wsegOk P nbN016 (nInsideL P nbN016) kN016_3 tN016_3 kN016_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN016_4 : List Tok := [(.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .L, (.A 8 1 4 3 11), (.A 8 1 4 3 11), .split, (.D 41), .split, (.D 1), .split, (.A 8 1 4 3 11), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, .split, .split, (.A 3 6 8 7 11), .split, .L]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN016_4 : wsegOk P nbN016 (nInsideL P nbN016) kN016_4 tN016_4 kN016_5 = true := by
  decide +kernel

end PackLean.D28.Ico
