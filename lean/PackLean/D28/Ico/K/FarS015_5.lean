-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey015

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM106_1 : List Tok := [.split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, .split, .split, (.A 7 6 8 7 11), .split, .split, (.A 7 1 8 7 11), (.A 7 0 8 7 11), (.A 7 6 8 7 11), (.D 40), .split, .split, .split, (.A 7 6 8 7 10), .split, .split, (.A 7 6 8 7 10), (.A 3 6 8 7 10), (.A 7 6 8 7 9), .split, (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.A 7 6 8 7 9), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM106_1 : wsegOk P nbM106 (nInsideL P nbM106) kM106_1 tM106_1 kM106_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM106_2 : List Tok := [.split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.A 7 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), .split, (.A 2 5 0 7 10), (.A 3 5 0 2 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 7 6 0 7 10), (.A 7 11 0 7 10), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, (.A 2 6 8 7 10), .split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, .split, .split, (.A 2 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM106_2 : wsegOk P nbM106 (nInsideL P nbM106) kM106_2 tM106_2 kM106_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM106_3 : List Tok := [.split, .split, .split, (.A 3 6 0 7 10), .split, (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11), (.A 3 1 0 3 11), .split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM106_3 : wsegOk P nbM106 (nInsideL P nbM106) kM106_3 tM106_3 kM106_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM106_4 : List Tok := [(.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, (.A 3 0 8 7 11), .split, (.A 3 1 8 7 11), (.A 3 6 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), .split, .split, .split, (.A 3 6 8 7 9), (.D 40), (.A 2 6 8 2 9), (.A 3 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM106_4 : wsegOk P nbM106 (nInsideL P nbM106) kM106_4 tM106_4 kM106_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM106_5 : List Tok := [(.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), .split, (.D 9), (.A 8 7 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), (.A 3 5 0 2 10), .split, (.A 3 1 4 3 11), (.A 3 5 4 2 9), .split, (.A 8 5 0 2 10), .split, (.A 2 5 4 2 10), .split, (.A 3 5 4 2 9), (.A 2 5 4 2 10), .split, .split, (.A 3 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM106_5 : wsegOk P nbM106 (nInsideL P nbM106) kM106_5 tM106_5 kM106_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM106_6 : List Tok := [(.A 3 1 4 3 9), .split, .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 10), (.A 8 1 4 2 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), .split, .split, .split, (.A 8 1 4 3 11), (.A 3 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 2 5 4 2 9), (.A 3 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM106_6 : wsegOk P nbM106 (nInsideL P nbM106) kM106_6 tM106_6 kM106_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM106_7 : List Tok := [(.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), .split, (.A 2 5 4 2 9), (.D 21), .split, .split, .split, (.A 8 1 4 2 9), (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM106_7 : wsegOk P nbM106 (nInsideL P nbM106) kM106_7 tM106_7 kM106_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM106_8 : List Tok := [(.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM106_8 : wsegOk P nbM106 (nInsideL P nbM106) kM106_8 tM106_8 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN107_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, .split, (.D 13), .split, (.A 3 5 0 3 4), (.A 3 5 0 3 11), (.A 8 5 0 3 4), .split, .split, (.D 13), .split, .split, (.A 3 1 0 3 11), .split, (.D 13), (.A 3 5 0 3 11), .split, (.A 10 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN107_0 : wsegOk P nbN107 (nInsideL P nbN107) (rRoots P.rden) tN107_0 kN107_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN107_1 : List Tok := [(.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, .split, (.A 3 6 8 7 11), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, (.A 3 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN107_1 : wsegOk P nbN107 (nInsideL P nbN107) kN107_1 tN107_1 kN107_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN107_2 : List Tok := [.split, .split, (.A 3 1 8 7 11), (.A 3 0 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), (.A 2 6 0 7 10), (.A 2 11 0 7 10), .split, (.A 3 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, .split, (.A 3 5 0 7 10), (.A 8 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN107_2 : wsegOk P nbN107 (nInsideL P nbN107) kN107_2 tN107_2 kN107_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN107_3 : List Tok := [.split, .split, (.A 8 5 0 3 10), .split, .split, (.A 3 5 0 7 10), (.A 8 5 0 7 10), .split, .split, (.A 8 5 0 3 10), (.A 3 5 0 3 10), (.A 8 5 0 2 10), (.A 8 5 0 2 10), .split, (.D 9), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 6 8 7 9), .split, (.A 2 5 0 7 10), .split, (.A 2 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN107_3 : wsegOk P nbN107 (nInsideL P nbN107) kN107_3 tN107_3 kN107_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN107_4 : List Tok := [.split, .split, (.A 2 6 0 2 10), (.A 2 6 8 2 9), (.A 2 5 4 2 9), .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 2 10), .split, .split, .split, (.A 3 6 0 7 10), .split, (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 3 6 8 2 9), .split, .split, .split, .split, (.A 8 5 0 2 10), .split, .split, (.A 3 5 0 2 10), (.A 8 5 4 2 10), (.A 8 5 4 2 10), (.A 8 5 4 2 10), (.A 8 5 4 2 10), .split, .split, .split, .split, (.A 2 6 4 2 9), .split, (.A 3 6 4 2 9), (.A 8 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN107_4 : wsegOk P nbN107 (nInsideL P nbN107) kN107_4 tN107_4 kN107_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN107_5 : List Tok := [(.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 8 5 4 2 9), (.A 8 5 4 2 9), (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9), .split, (.A 2 6 4 2 9), (.D 21), .split, .split, (.A 2 5 4 2 10), .split, .split, (.A 8 5 4 2 10), (.A 8 5 4 2 9), (.A 8 5 4 2 3), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN107_5 : wsegOk P nbN107 (nInsideL P nbN107) kN107_5 tN107_5 kN107_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN107_6 : List Tok := [.split, .split, .split, (.D 13), (.A 10 1 8 3 11), .split, .split, (.A 8 1 0 3 11), .split, (.A 10 1 0 3 11), (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), (.A 3 1 0 3 11), .split, (.A 10 1 4 3 11), .split, (.A 10 1 0 3 11), (.A 10 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 3 0 8 7 11), (.A 3 1 8 7 11), .split, (.D 41)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN107_6 : wsegOk P nbN107 (nInsideL P nbN107) kN107_6 tN107_6 kN107_7 = true := by
  decide +kernel

end PackLean.D28.Ico
