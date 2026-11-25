-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey007

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM058_5 : List Tok := [(.A 3 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), (.A 3 6 8 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), .split, (.A 3 5 0 3 10), (.A 3 5 4 2 10), .split, (.A 3 1 4 3 11), (.A 3 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM058_5 : wsegOk P nbM058 (nInsideL P nbM058) kM058_5 tM058_5 kM058_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM058_6 : List Tok := [.split, (.A 8 5 0 3 10), .split, (.A 2 5 4 2 10), (.A 8 5 4 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 4 3 9), (.A 8 5 4 2 9), .split, (.A 8 5 0 2 10), (.A 8 5 4 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 5 4 2 9), (.A 3 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM058_6 : wsegOk P nbM058 (nInsideL P nbM058) kM058_6 tM058_6 kM058_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM058_7 : List Tok := [(.A 3 5 4 2 9), (.A 3 1 4 2 9), (.A 3 6 4 2 9), (.A 2 5 4 2 9), .split, (.A 3 1 4 2 9), (.A 8 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, .split, (.A 8 1 4 2 9), (.A 8 6 4 2 9), (.A 8 1 4 2 9), (.A 2 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM058_7 : wsegOk P nbM058 (nInsideL P nbM058) kM058_7 tM058_7 kM058_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM058_8 : List Tok := [.split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM058_8 : wsegOk P nbM058 (nInsideL P nbM058) kM058_8 tM058_8 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN059_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, (.A 3 5 0 3 4), (.A 3 5 0 3 4), .split, (.A 3 5 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN059_0 : wsegOk P nbN059 (nInsideL P nbN059) (rRoots P.rden) tN059_0 kN059_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN059_1 : List Tok := [.split, (.A 3 5 0 3 11), .split, .split, (.A 3 6 8 7 11), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, .split, .split, (.A 7 6 2 7 10), (.A 2 6 0 7 10), (.A 3 6 8 7 10), (.D 3), .split, .split, (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .split, (.A 3 6 8 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN059_1 : wsegOk P nbN059 (nInsideL P nbN059) kN059_1 tN059_1 kN059_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN059_2 : List Tok := [(.A 3 6 8 7 9), (.A 3 6 8 7 9), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, (.A 2 5 0 7 10), .split, .split, (.A 8 5 0 3 10), .split, .split, (.A 3 5 0 7 10), (.A 8 5 0 7 10), .split, .split, (.A 8 5 0 3 10), .split, (.A 3 5 0 7 10), .split, (.A 3 5 0 3 10), (.A 8 5 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN059_2 : wsegOk P nbN059 (nInsideL P nbN059) kN059_2 tN059_2 kN059_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN059_3 : List Tok := [(.A 8 5 0 2 10), (.A 8 5 0 2 10), .split, (.D 9), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, (.A 2 6 8 7 10), .split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 2 6 8 7 10), .split, (.A 2 5 0 2 10), (.A 2 6 0 2 10), .split, .split, .split, .split, (.A 3 6 8 7 10), .split, (.A 3 5 0 2 10), (.A 3 6 0 2 10), .split, .split, .split, (.A 3 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN059_3 : wsegOk P nbN059 (nInsideL P nbN059) kN059_3 tN059_3 kN059_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN059_4 : List Tok := [.split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 3 6 8 2 9), .split, .split, .split, .split, (.A 8 5 0 2 10), (.A 3 5 4 2 10), (.A 8 5 0 2 10), .split, .split, (.A 8 5 4 2 10), (.A 8 5 4 2 9), (.A 8 5 4 2 10), .split, .split, (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.A 8 6 4 2 9), (.A 8 6 4 2 9), (.A 3 6 8 2 9), .split, .split, .split, .split, (.A 8 5 0 2 10), .split, (.A 2 5 0 2 10), (.A 8 5 4 2 10), (.A 8 5 4 2 10), (.A 8 5 4 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN059_4 : wsegOk P nbN059 (nInsideL P nbN059) kN059_4 tN059_4 kN059_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN059_5 : List Tok := [.split, (.A 2 6 4 2 9), (.A 8 6 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, .split, (.A 2 5 4 2 10), (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), (.A 3 1 0 3 11), .split, (.A 3 1 4 3 11), (.A 8 1 4 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN059_5 : wsegOk P nbN059 (nInsideL P nbN059) kN059_5 tN059_5 kN059_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN059_6 : List Tok := [.split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, (.A 3 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, (.A 3 1 4 3 9), .split, .split, (.A 10 1 4 3 5), (.D 20), .split, (.A 10 1 4 3 9), (.D 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN059_6 : wsegOk P nbN059 (nInsideL P nbN059) kN059_6 tN059_6 kN059_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN059_7 : List Tok := [(.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 3 5 0 3 11), .split, (.A 8 5 0 3 10), .split, .split, .split, (.A 8 5 0 2 10), .split, .split, (.A 3 5 4 2 10), (.A 8 5 4 2 10), .split, (.A 3 5 4 2 10), (.A 8 5 4 2 10), (.A 8 5 4 2 10), (.A 8 5 4 2 9), .split, .split, (.A 8 1 4 3 11), (.A 3 1 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN059_7 : wsegOk P nbN059 (nInsideL P nbN059) kN059_7 tN059_7 kN059_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN059_8 : List Tok := [(.A 8 5 4 2 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 5 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.A 8 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN059_8 : wsegOk P nbN059 (nInsideL P nbN059) kN059_8 tN059_8 kN059_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN059_9 : List Tok := [(.A 8 1 4 2 9), (.A 3 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 8 1 4 2 9), (.A 8 6 4 2 9), (.A 8 1 4 2 9), .split, (.A 2 6 4 2 9), (.A 8 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN059_9 : wsegOk P nbN059 (nInsideL P nbN059) kN059_9 tN059_9 kN059_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN059_10 : List Tok := [(.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN059_10 : wsegOk P nbN059 (nInsideL P nbN059) kN059_10 tN059_10 [] = true := by
  decide +kernel

end PackLean.D28.Ico
