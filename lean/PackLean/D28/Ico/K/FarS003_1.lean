-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey003

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM025_5 : List Tok := [.split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), (.A 3 1 0 3 11), (.A 3 1 4 3 11), .split, (.D 41), .split, (.D 1), .split, (.A 8 1 4 3 11), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM025_5 : wsegOk P nbM025 (nInsideL P nbM025) kM025_5 tM025_5 kM025_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM025_6 : List Tok := [(.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), .split, (.A 2 5 0 3 10), (.A 2 5 4 2 10), .split, .split, (.A 3 1 4 3 11), (.A 3 1 4 3 9), .split, .split, (.A 2 5 4 3 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM025_6 : wsegOk P nbM025 (nInsideL P nbM025) kM025_6 tM025_6 kM025_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM025_7 : List Tok := [(.A 8 5 4 3 9), (.A 2 5 4 2 9), .split, (.A 2 5 0 3 10), (.A 2 5 4 2 10), .split, .split, (.A 8 1 4 3 11), (.A 8 1 4 3 9), (.A 8 5 4 2 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM025_7 : wsegOk P nbM025 (nInsideL P nbM025) kM025_7 tM025_7 kM025_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM025_8 : List Tok := [.split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 8 1 4 2 9), (.A 2 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 2 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM025_8 : wsegOk P nbM025 (nInsideL P nbM025) kM025_8 tM025_8 kM025_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM025_9 : List Tok := [.split, (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM025_9 : wsegOk P nbM025 (nInsideL P nbM025) kM025_9 tM025_9 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN026_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, .split, (.A 3 6 8 7 11), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN026_0 : wsegOk P nbN026 (nInsideL P nbN026) (rRoots P.rden) tN026_0 kN026_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN026_1 : List Tok := [.split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 2 6 8 7 10), (.D 3), .split, .split, (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .split, (.A 3 6 8 7 10), .split, (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.A 3 6 8 7 9), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN026_1 : wsegOk P nbN026 (nInsideL P nbN026) kN026_1 tN026_1 kN026_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN026_2 : List Tok := [.split, .split, (.D 9), .split, .split, (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, (.A 2 5 0 7 10), .split, .split, (.A 8 5 0 3 10), .split, (.A 2 5 0 7 10), (.A 8 5 0 3 10), (.A 8 5 0 2 10), .split, (.D 9), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, (.A 8 6 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN026_2 : wsegOk P nbN026 (nInsideL P nbN026) kN026_2 tN026_2 kN026_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN026_3 : List Tok := [(.A 3 6 8 2 9), (.A 8 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), (.A 3 1 0 3 11), (.A 8 1 4 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN026_3 : wsegOk P nbN026 (nInsideL P nbN026) kN026_3 tN026_3 kN026_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN026_4 : List Tok := [.split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, (.A 3 1 4 3 9), .split, (.A 3 1 4 3 5), .split, (.A 10 1 4 3 9), (.D 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN026_4 : wsegOk P nbN026 (nInsideL P nbN026) kN026_4 tN026_4 kN026_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN026_5 : List Tok := [(.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN026_5 : wsegOk P nbN026 (nInsideL P nbN026) kN026_5 tN026_5 kN026_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN026_6 : List Tok := [.split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 8 6 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN026_6 : wsegOk P nbN026 (nInsideL P nbN026) kN026_6 tN026_6 kN026_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN026_7 : List Tok := [(.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN026_7 : wsegOk P nbN026 (nInsideL P nbN026) kN026_7 tN026_7 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_0 : wsegOk P nbM026 (nInsideL P nbM026) (rRoots P.rden) tM026_0 kM026_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM026_1 : List Tok := [.split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, .split, (.A 3 6 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 10), (.A 2 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .split, (.A 2 6 8 7 10), .split, (.A 3 6 8 7 11), .split, (.A 3 6 8 7 9), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM026_1 : wsegOk P nbM026 (nInsideL P nbM026) kM026_1 tM026_1 kM026_2 = true := by
  decide +kernel

end PackLean.D28.Ico
