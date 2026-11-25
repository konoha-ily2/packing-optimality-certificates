-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey000

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM002_3 : List Tok := [.split, .split, (.A 8 1 4 3 11), (.A 3 1 8 2 9), (.A 8 1 4 2 9), .split, (.A 2 6 8 2 9), (.A 8 6 10 2 9), .split, (.D 41), .split, .split, .split, (.A 8 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 3 5), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 8 5 0 3 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), .split, (.A 0 5 4 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM002_3 : wsegOk P nbM002 (nInsideL P nbM002) kM002_3 tM002_3 kM002_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM002_4 : List Tok := [.split, .split, (.A 0 5 6 2 10), (.A 0 5 4 2 9), (.D 31), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), .split, (.A 0 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM002_4 : wsegOk P nbM002 (nInsideL P nbM002) kM002_4 tM002_4 kM002_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM002_5 : List Tok := [(.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM002_5 : wsegOk P nbM002 (nInsideL P nbM002) kM002_5 tM002_5 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN003_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), (.A 2 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, (.A 3 5 0 3 4), (.A 2 5 0 3 4), (.A 8 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), .split, (.A 2 6 8 7 10), (.A 3 6 8 7 11), (.A 2 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), (.A 2 1 0 7 11), .split, (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN003_0 : wsegOk P nbN003 (nInsideL P nbN003) (rRoots P.rden) tN003_0 kN003_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN003_1 : List Tok := [.split, (.D 11), .split, .split, .split, (.D 11), (.A 2 6 8 7 10), .split, .split, (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 2 6 8 7 10), (.A 2 6 8 7 11), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, (.A 2 5 0 7 10), (.D 33), .split, (.A 2 5 0 3 10), (.A 0 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.D 3), (.D 33)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN003_1 : wsegOk P nbN003 (nInsideL P nbN003) kN003_1 tN003_1 kN003_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN003_2 : List Tok := [.split, .split, .split, (.A 2 6 0 7 10), .split, (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 0 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11), (.A 8 1 0 3 11), .split, (.D 41), (.A 8 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN003_2 : wsegOk P nbN003 (nInsideL P nbN003) kN003_2 tN003_2 kN003_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN003_3 : List Tok := [(.A 8 6 8 2 9), .split, (.A 8 1 4 3 11), (.A 8 1 4 2 9), .split, (.A 3 6 8 2 9), (.A 8 6 10 2 9), .split, (.D 41), .split, .split, .split, (.A 8 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 3 5), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 8 5 0 3 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), .split, (.A 0 5 4 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN003_3 : wsegOk P nbN003 (nInsideL P nbN003) kN003_3 tN003_3 kN003_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN003_4 : List Tok := [.split, (.A 8 5 4 2 10), (.D 31), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), .split, .split, (.A 0 5 4 2 9), (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN003_4 : wsegOk P nbN003 (nInsideL P nbN003) kN003_4 tN003_4 kN003_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN003_5 : List Tok := [(.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN003_5 : wsegOk P nbN003 (nInsideL P nbN003) kN003_5 tN003_5 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), (.A 2 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, (.A 3 5 0 3 4), (.A 2 5 0 3 4), (.A 3 5 0 3 11), .split, .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 2 5 0 7 10), (.A 3 1 0 3 11), (.A 2 6 8 7 10), (.A 2 5 0 7 10), (.A 2 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_0 : wsegOk P nbM003 (nInsideL P nbM003) (rRoots P.rden) tM003_0 kM003_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_1 : List Tok := [(.A 2 6 8 7 10), .split, .split, (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 2 6 8 7 10), (.A 2 6 8 7 11), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, (.A 2 5 0 7 10), (.D 33), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, (.A 2 6 0 7 10), .split, (.A 2 6 8 2 9), (.A 2 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_1 : wsegOk P nbM003 (nInsideL P nbM003) kM003_1 tM003_1 kM003_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_2 : List Tok := [(.A 2 6 8 2 9), .split, .split, (.A 0 5 4 2 10), (.A 0 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), (.A 8 1 0 3 11), .split, (.D 41), (.A 8 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 8 1 8 2 9), (.A 2 6 8 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_2 : wsegOk P nbM003 (nInsideL P nbM003) kM003_2 tM003_2 kM003_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_3 : List Tok := [.split, .split, (.A 8 1 4 3 11), (.A 3 1 8 2 9), (.A 8 1 4 2 9), .split, (.A 2 6 8 2 9), .split, (.A 3 6 10 2 9), (.A 8 6 10 2 9), .split, (.D 41), .split, .split, .split, .split, (.A 8 1 4 3 11), (.A 8 1 4 3 5), (.A 8 1 4 3 9), (.A 8 1 4 3 5), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_3 : wsegOk P nbM003 (nInsideL P nbM003) kM003_3 tM003_3 kM003_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_4 : List Tok := [(.A 8 1 4 2 9), .split, (.D 9), .split, (.A 0 5 4 2 10), .split, (.A 0 5 4 2 10), (.D 31), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), .split, (.A 0 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_4 : wsegOk P nbM003 (nInsideL P nbM003) kM003_4 tM003_4 kM003_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_5 : List Tok := [(.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_5 : wsegOk P nbM003 (nInsideL P nbM003) kM003_5 tM003_5 [] = true := by
  decide +kernel

end PackLean.D28.Ico
