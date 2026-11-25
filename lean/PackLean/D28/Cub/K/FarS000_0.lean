-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey000

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN000_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), (.A 0 2 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 5 7), .split, .split, (.A 0 2 4 1 7), .split, (.A 0 3 4 1 7), (.A 0 2 4 1 5), .split, .split, (.A 4 2 4 1 7), (.A 0 2 4 1 7), (.A 4 2 4 1 7), .split, .split, .split, (.D 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN000_0 : wsegOk P nbN000 (nInsideL P nbN000) (rRoots P.rden) tN000_0 kN000_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN000_1 : List Tok := [.split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, (.A 0 6 4 3 7), .split, (.A 1 6 5 2 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 6 4 0 5), (.A 0 7 4 2 1), .split, .split, .split, (.A 0 6 4 0 7), .split, (.A 0 6 4 0 7), .split, (.A 0 2 4 0 7), (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN000_1 : wsegOk P nbN000 (nInsideL P nbN000) kN000_1 tN000_1 kN000_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN000_2 : List Tok := [(.A 0 6 4 0 3), .split, (.A 4 2 4 0 5), .split, .split, (.A 0 6 4 0 1), (.A 4 2 4 0 1), (.A 4 2 4 0 1), (.A 4 2 4 0 3), (.A 4 6 4 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 4 7 5 2 3), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), (.A 2 3 6 0 4), .split, .split, .split, (.D 5), (.A 4 3 2 4 7), .split, (.A 0 3 6 0 5), .split, (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN000_2 : wsegOk P nbN000 (nInsideL P nbN000) kN000_2 tN000_2 kN000_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN000_3 : List Tok := [(.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, (.A 2 3 6 0 5), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 0 7 4 2 1), .split, (.A 2 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 4 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 0 3 4 0 5), (.A 4 3 6 0 5), (.A 4 7 4 2 1), .split, (.A 6 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN000_3 : wsegOk P nbN000 (nInsideL P nbN000) kN000_3 tN000_3 kN000_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN000_4 : List Tok := [.split, (.D 6), (.A 4 3 4 2 1), .split, .split, .split, (.A 4 3 4 0 5), (.A 4 2 6 0 1), (.A 4 3 4 0 1), (.A 4 3 6 0 1), (.A 4 7 4 2 1), .split, (.A 6 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), (.A 5 2 4 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), (.A 4 0 4 5 7), .split, (.D 4), (.A 4 0 6 5 3), .split, .split, (.A 5 2 4 1 7), (.A 4 2 6 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN000_4 : wsegOk P nbN000 (nInsideL P nbN000) kN000_4 tN000_4 kN000_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN000_5 : List Tok := [.split, (.A 5 2 6 1 3), .split, (.A 4 0 6 5 3), (.A 5 2 6 1 3), .split, (.D 4), .split, .split, .split, (.D 4), (.A 4 0 6 5 3), (.D 15), .split, (.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 1 6 5 0 3), .split, (.D 1), .split, (.A 5 6 5 1 3), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, .split, (.A 5 2 5 1 7), (.A 1 6 5 0 3), (.A 4 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN000_5 : wsegOk P nbN000 (nInsideL P nbN000) kN000_5 tN000_5 kN000_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN000_6 : List Tok := [(.A 5 6 5 0 3), (.A 4 6 5 0 3), .split, (.A 4 2 5 0 3), (.A 4 6 5 0 3), .split, (.A 5 6 5 0 3), .split, (.A 5 2 7 0 3), (.A 5 6 5 0 3), (.A 4 6 5 0 3), .split, .split, .split, .split, (.D 1), (.A 5 4 5 1 3), (.D 4), (.D 1), .split, (.A 5 6 7 1 3), (.D 12), .split, .split, .split, .split, .split, (.A 4 1 6 4 7), .split, (.A 4 0 6 5 7), (.D 13), .split, .split, (.A 4 2 6 0 7), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN000_6 : wsegOk P nbN000 (nInsideL P nbN000) kN000_6 tN000_6 kN000_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN000_7 : List Tok := [(.D 13), (.A 4 2 6 4 5), .split, (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 6 2 6 4 1), (.A 6 2 7 4 1), .split, (.D 13), .split, .split, .split, (.A 6 1 6 4 5), (.A 6 3 7 4 5), (.A 6 1 7 4 5), .split, .split, (.D 13), (.A 6 2 7 4 5), (.D 13), .split, .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, .split, (.A 5 2 7 5 3), .split, (.D 13), (.A 5 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN000_7 : wsegOk P nbN000 (nInsideL P nbN000) kN000_7 tN000_7 kN000_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN000_8 : List Tok := [.split, (.D 15), (.D 13), .split, (.D 13), (.A 6 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, (.A 4 2 7 0 1), (.A 4 2 7 4 1), .split, .split, (.A 4 7 5 4 1), (.A 4 3 5 4 1), (.D 12), .split, .split, (.A 6 3 7 4 1), (.A 6 2 7 4 1), .split, (.D 6), (.D 19), .split, .split, .split, .split, (.A 5 2 7 4 1), (.A 5 2 7 4 1), (.D 12), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN000_8 : wsegOk P nbN000 (nInsideL P nbN000) kN000_8 tN000_8 kN000_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN000_9 : List Tok := [.split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN000_9 : wsegOk P nbN000 (nInsideL P nbN000) kN000_9 tN000_9 kN000_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN000_10 : List Tok := [.split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN000_10 : wsegOk P nbN000 (nInsideL P nbN000) kN000_10 tN000_10 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM000_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 0 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), (.A 4 3 4 5 7), .split, .split, (.A 0 2 4 1 7), .split, (.A 0 3 4 1 7), (.A 0 2 4 1 5), .split, (.A 0 2 4 1 7), (.A 4 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM000_0 : wsegOk P nbM000 (nInsideL P nbM000) (rRoots P.rden) tM000_0 kM000_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM000_1 : List Tok := [.split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, (.A 0 6 4 3 7), .split, (.A 1 6 5 2 7), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 6 4 0 5), (.A 0 7 4 2 1), .split, .split, .split, (.A 0 6 4 0 7), .split, (.A 0 6 4 0 7), .split, (.A 0 2 4 0 7), (.A 0 6 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM000_1 : wsegOk P nbM000 (nInsideL P nbM000) kM000_1 tM000_1 kM000_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM000_2 : List Tok := [(.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), (.A 0 6 4 0 3), .split, (.A 0 2 4 0 5), .split, .split, (.A 0 6 4 0 1), (.A 0 2 4 0 1), (.A 4 2 4 0 1), .split, (.A 4 2 4 0 3), (.A 4 2 4 0 1), .split, (.A 0 6 4 0 1), (.A 4 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 4 7 5 2 3), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM000_2 : wsegOk P nbM000 (nInsideL P nbM000) kM000_2 tM000_2 kM000_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM000_3 : List Tok := [(.A 2 3 6 0 4), .split, .split, .split, (.D 5), (.A 4 3 2 4 7), .split, (.A 0 3 6 0 5), .split, (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, (.A 2 3 6 0 5), .split, (.A 6 3 6 0 5), (.A 6 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 2 7 4 2 1), .split, (.A 2 3 6 0 5), (.D 6), .split, (.D 9), .split, .split, (.A 2 7 4 2 1), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM000_3 : wsegOk P nbM000 (nInsideL P nbM000) kM000_3 tM000_3 kM000_4 = true := by
  decide +kernel

end PackLean.D28.Cub
