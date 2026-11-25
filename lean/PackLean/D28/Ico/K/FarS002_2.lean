-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey002

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 2 5 0 7 10), (.A 2 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, (.A 3 5 0 3 4), .split, (.A 8 5 0 3 4), (.A 3 5 0 3 10), .split, .split, (.D 13), (.A 3 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_0 : wsegOk P nbN020 (nInsideL P nbN020) (rRoots P.rden) tN020_0 kN020_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_1 : List Tok := [.split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 8 5 0 3 10), (.A 8 5 0 3 11), .split, .split, (.A 3 6 8 7 11), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), .split, (.A 8 6 0 7 10), (.A 8 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 2 6 8 7 10), (.D 3), .split, .split, (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_1 : wsegOk P nbN020 (nInsideL P nbN020) kN020_1 tN020_1 kN020_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_2 : List Tok := [.split, (.A 3 6 8 7 11), .split, .split, (.A 3 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .split, (.A 3 6 8 7 10), (.A 8 6 8 7 9), (.A 3 6 8 7 9), (.A 3 6 8 7 9), .split, (.A 2 6 8 7 9), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, (.A 2 5 0 7 10), (.A 8 5 0 2 10), .split, (.D 9), (.A 2 5 0 2 10), (.D 33)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_2 : wsegOk P nbN020 (nInsideL P nbN020) kN020_2 tN020_2 kN020_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_3 : List Tok := [.split, (.D 3), .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, (.A 8 6 8 2 9), (.A 8 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, .split, (.A 2 5 4 2 10), .split, .split, (.A 8 5 4 2 10), (.A 8 5 4 2 9), (.A 0 5 4 2 3), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_3 : wsegOk P nbN020 (nInsideL P nbN020) kN020_3 tN020_3 kN020_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_4 : List Tok := [.split, .split, .split, (.D 13), (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .split, (.A 8 1 8 3 11), (.A 8 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, .split, .split, (.A 3 6 8 7 11), (.A 8 6 8 2 9), (.A 8 1 4 3 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_4 : wsegOk P nbN020 (nInsideL P nbN020) kN020_4 tN020_4 kN020_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_5 : List Tok := [.split, .split, (.A 3 1 4 3 9), .split, (.A 10 1 4 3 5), (.A 10 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_5 : wsegOk P nbN020 (nInsideL P nbN020) kN020_5 tN020_5 kN020_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_6 : List Tok := [.split, .split, .split, .split, .split, .split, .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_6 : wsegOk P nbN020 (nInsideL P nbN020) kN020_6 tN020_6 kN020_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN020_7 : List Tok := [(.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN020_7 : wsegOk P nbN020 (nInsideL P nbN020) kN020_7 tN020_7 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, .split, (.A 7 6 2 7 10), (.A 7 6 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 2 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, .split, (.A 3 6 8 7 11), (.A 2 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_0 : wsegOk P nbM020 (nInsideL P nbM020) (rRoots P.rden) tM020_0 kM020_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_1 : List Tok := [.split, (.A 3 1 8 3 11), .split, (.A 2 5 0 3 11), (.A 2 1 0 7 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, .split, (.A 7 6 8 7 10), (.A 2 6 8 7 10), (.D 3), .split, .split, (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 2 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .split, (.A 2 6 8 7 10), .split, (.A 2 6 8 7 11), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_1 : wsegOk P nbM020 (nInsideL P nbM020) kM020_1 tM020_1 kM020_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_2 : List Tok := [.split, .split, (.D 9), .split, .split, .split, (.D 7), (.A 2 5 0 7 10), (.D 33), .split, .split, .split, (.A 2 5 0 3 10), .split, (.A 2 5 0 3 11), (.A 2 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, (.A 2 11 0 7 10), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, (.A 2 6 0 2 10), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_2 : wsegOk P nbM020 (nInsideL P nbM020) kM020_2 tM020_2 kM020_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_3 : List Tok := [.split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), (.A 2 1 0 3 11), (.A 3 1 4 3 11), (.A 3 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 8 1 4 3 11), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_3 : wsegOk P nbM020 (nInsideL P nbM020) kM020_3 tM020_3 kM020_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_4 : List Tok := [.split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 2 1 8 2 9), (.A 2 6 8 2 9), (.A 3 1 4 3 9), (.A 2 6 8 2 9), (.A 3 1 4 3 9), .split, (.A 2 6 8 2 9), (.A 3 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_4 : wsegOk P nbM020 (nInsideL P nbM020) kM020_4 tM020_4 kM020_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_5 : List Tok := [.split, .split, .split, (.A 2 5 0 3 11), .split, .split, (.A 2 5 0 3 11), (.A 2 5 0 2 10), (.A 2 1 4 3 9), (.A 2 5 0 2 10), .split, (.A 8 1 4 3 11), (.A 8 5 4 2 9), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 2 1 4 2 9), (.A 2 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_5 : wsegOk P nbM020 (nInsideL P nbM020) kM020_5 tM020_5 kM020_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_6 : List Tok := [(.A 2 5 4 2 9), (.A 8 1 4 2 9), (.A 2 6 4 2 9), .split, .split, .split, (.A 2 5 4 2 9), (.A 0 5 4 2 3), (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_6 : wsegOk P nbM020 (nInsideL P nbM020) kM020_6 tM020_6 kM020_7 = true := by
  decide +kernel

end PackLean.D28.Ico
