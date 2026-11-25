-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey000

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN003_4 : List Tok := [(.A 4 3 6 0 5), (.A 4 7 4 2 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 2 1), .split, .split, .split, (.A 4 3 4 0 5), (.A 4 2 6 0 1), (.A 4 3 4 0 1), (.A 4 3 6 0 1), (.A 4 7 4 2 1), .split, (.A 6 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), (.A 5 2 4 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), (.A 4 0 4 5 7), .split, (.D 4), (.A 4 0 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN003_4 : wsegOk P nbN003 (nInsideL P nbN003) kN003_4 tN003_4 kN003_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN003_5 : List Tok := [.split, .split, (.A 5 2 4 1 7), (.A 4 2 6 1 7), .split, (.A 5 2 6 1 3), .split, .split, (.A 4 2 6 5 3), (.A 5 0 6 5 3), (.A 5 2 6 1 3), .split, (.D 4), .split, .split, .split, (.D 4), (.A 4 0 6 5 3), (.D 15), .split, (.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 1 6 5 0 3), .split, (.D 1), .split, (.A 5 6 5 1 3), (.D 1), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN003_5 : wsegOk P nbN003 (nInsideL P nbN003) kN003_5 tN003_5 kN003_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN003_6 : List Tok := [.split, .split, .split, .split, .split, .split, .split, (.A 5 2 5 1 7), (.A 1 6 5 0 3), .split, (.A 5 2 4 0 3), (.A 4 6 5 0 3), (.A 5 6 5 0 3), .split, (.A 0 6 5 0 3), (.A 5 6 5 0 3), .split, (.A 4 2 5 0 3), (.A 4 6 5 0 3), .split, (.A 5 6 5 0 3), .split, (.A 5 2 7 0 3), (.A 5 6 5 0 3), .split, (.A 4 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), (.A 5 4 5 1 3), (.D 4), (.D 1), .split, (.A 5 6 7 1 3), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN003_6 : wsegOk P nbN003 (nInsideL P nbN003) kN003_6 tN003_6 kN003_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN003_7 : List Tok := [.split, .split, .split, .split, .split, (.A 4 1 6 4 7), .split, (.A 4 0 6 5 7), (.D 13), .split, .split, (.A 4 2 6 0 7), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, (.A 4 0 6 5 3), (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), (.A 6 2 7 4 1), .split, (.D 13), .split, .split, .split, (.A 6 1 6 4 5), (.A 6 3 7 4 5), (.A 6 1 7 4 5), .split, .split, (.D 13), (.A 6 2 7 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN003_7 : wsegOk P nbN003 (nInsideL P nbN003) kN003_7 tN003_7 kN003_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN003_8 : List Tok := [(.D 13), .split, .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 5 2 7 4 3), .split, (.D 15), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, (.A 4 2 7 0 1), .split, (.A 5 2 7 4 1), (.A 4 2 7 4 1), .split, .split, (.A 4 7 5 4 1), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 6 3 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN003_8 : wsegOk P nbN003 (nInsideL P nbN003) kN003_8 tN003_8 kN003_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN003_9 : List Tok := [(.D 6), (.A 6 2 7 4 1), .split, (.D 6), (.D 19), .split, .split, .split, .split, (.A 5 2 7 4 1), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN003_9 : wsegOk P nbN003 (nInsideL P nbN003) kN003_9 tN003_9 kN003_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN003_10 : List Tok := [(.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN003_10 : wsegOk P nbN003 (nInsideL P nbN003) kN003_10 tN003_10 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 0 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), (.A 4 3 4 5 7), .split, .split, (.A 0 2 4 1 7), .split, (.A 0 3 4 1 7), (.A 0 2 4 1 5), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_0 : wsegOk P nbM003 (nInsideL P nbM003) (rRoots P.rden) tM003_0 kM003_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_1 : List Tok := [.split, (.A 4 2 4 1 7), .split, (.A 0 2 4 1 7), (.A 4 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, .split, (.D 7), (.A 0 6 4 2 7), .split, (.A 1 6 5 2 7), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 0 6 4 1 7), (.A 0 6 4 2 1), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_1 : wsegOk P nbM003 (nInsideL P nbM003) kM003_1 tM003_1 kM003_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_2 : List Tok := [.split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, (.A 0 6 4 0 7), .split, (.A 0 2 4 0 7), (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, .split, (.A 4 2 4 0 5), (.A 4 2 4 0 3), (.A 4 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), (.A 4 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_2 : wsegOk P nbM003 (nInsideL P nbM003) kM003_2 tM003_2 kM003_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_3 : List Tok := [.split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 4 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), (.A 2 3 6 0 5), .split, .split, .split, (.D 5), (.A 4 3 2 4 7), .split, (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_3 : wsegOk P nbM003 (nInsideL P nbM003) kM003_3 tM003_3 kM003_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_4 : List Tok := [.split, (.D 2), (.D 2), .split, (.A 2 3 6 0 5), .split, .split, .split, .split, (.A 4 3 6 0 5), (.D 2), (.A 6 3 6 0 5), (.A 6 3 6 0 5), (.A 6 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 2 7 4 2 1), .split, (.A 2 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 0 3 4 0 5), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_4 : wsegOk P nbM003 (nInsideL P nbM003) kM003_4 tM003_4 kM003_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_5 : List Tok := [.split, (.A 0 7 4 2 1), (.A 4 7 4 0 1), .split, .split, (.A 2 3 6 0 5), (.A 4 3 6 0 5), .split, (.D 6), .split, (.A 4 3 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 4 3 4 0 5), .split, .split, (.A 0 3 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, (.A 4 7 4 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 4 7 4 2 1), (.D 6), .split, (.A 4 7 5 2 1), (.A 4 3 5 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_5 : wsegOk P nbM003 (nInsideL P nbM003) kM003_5 tM003_5 kM003_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_6 : List Tok := [.split, .split, (.D 6), (.A 6 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 1 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), (.A 4 0 4 5 7), .split, (.D 4), (.A 4 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), (.A 5 2 4 1 3), (.A 4 2 6 1 7), .split, (.A 5 2 6 1 3), .split, (.A 4 0 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_6 : wsegOk P nbM003 (nInsideL P nbM003) kM003_6 tM003_6 kM003_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM003_7 : List Tok := [(.A 5 2 6 1 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, (.A 5 0 6 1 3), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM003_7 : wsegOk P nbM003 (nInsideL P nbM003) kM003_7 tM003_7 kM003_8 = true := by
  decide +kernel

end PackLean.D28.Cub
