-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey036

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_28 : List Tok := [(.A 5 2 7 0 1), .split, .split, .split, .split, .split, (.A 0 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 0 2 5 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, (.A 0 2 5 0 1), .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 4 3 7 0 1), (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, .split, .split, .split, (.A 5 2 7 4 3), (.A 4 2 7 4 1), (.A 4 2 7 4 1), (.A 5 2 7 4 1), .split, .split, .split, .split, .split, (.A 4 2 5 0 1), (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_28 : wsegOk P nbM092 (nInsideL P nbM092) kM092_28 tM092_28 kM092_29 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_29 : List Tok := [(.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, (.A 0 7 5 0 1), .split, (.A 0 3 5 0 1), (.D 18), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_29 : wsegOk P nbM092 (nInsideL P nbM092) kM092_29 tM092_29 kM092_30 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_30 : List Tok := [(.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_30 : wsegOk P nbM092 (nInsideL P nbM092) kM092_30 tM092_30 kM092_31 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM092_31 : List Tok := [(.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM092_31 : wsegOk P nbM092 (nInsideL P nbM092) kM092_31 tM092_31 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN093_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.A 0 7 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN093_0 : wsegOk P nbN093 (nInsideL P nbN093) (rRoots P.rden) tN093_0 kN093_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN093_1 : List Tok := [(.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 3 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 5), (.A 1 2 4 1 7), .split, (.D 5), .split, (.A 1 3 4 1 7), .split, (.A 5 2 4 1 7), .split, (.A 5 3 4 1 7), .split, .split, (.A 5 3 4 1 7), (.A 5 3 4 1 5), (.A 5 3 4 1 7), .split, .split, (.A 1 2 4 1 5), (.A 1 3 4 1 5), .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN093_1 : wsegOk P nbN093 (nInsideL P nbN093) kN093_1 tN093_1 kN093_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN093_2 : List Tok := [.split, .split, (.A 1 3 4 1 5), .split, (.A 1 2 4 1 7), .split, (.A 1 3 4 1 5), (.A 0 2 4 0 5), (.A 0 2 4 0 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 5 3 4 1 7), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 5), (.A 4 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN093_2 : wsegOk P nbN093 (nInsideL P nbN093) kN093_2 tN093_2 kN093_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN093_3 : List Tok := [(.A 5 2 4 1 5), (.A 5 2 4 1 7), (.A 1 2 4 0 5), .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 0 7), .split, (.A 5 2 4 0 7), (.A 5 2 4 0 5), (.A 5 2 4 0 7), (.A 1 2 4 0 5), .split, (.A 1 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 0 7), .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 5 2 4 0 7), (.A 5 2 4 0 5), (.A 5 2 4 0 7), (.A 1 2 4 0 5), .split, (.A 1 2 4 0 7), .split, (.A 5 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN093_3 : wsegOk P nbN093 (nInsideL P nbN093) kN093_3 tN093_3 kN093_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN093_4 : List Tok := [.split, .split, (.A 1 2 4 0 7), .split, (.A 5 2 4 0 7), (.A 1 2 4 0 5), (.A 5 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, .split, (.D 7), (.D 9), .split, (.A 1 6 4 1 5), (.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, .split, .split, (.D 7), (.A 1 6 4 2 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN093_4 : wsegOk P nbN093 (nInsideL P nbN093) kN093_4 tN093_4 kN093_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN093_5 : List Tok := [(.A 1 6 4 2 1), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, (.A 1 6 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 7), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 1 6 4 0 5), .split, (.A 1 6 4 0 3), .split, .split, (.A 1 6 4 0 5), .split, (.A 1 6 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN093_5 : wsegOk P nbN093 (nInsideL P nbN093) kN093_5 tN093_5 kN093_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN093_6 : List Tok := [(.A 1 2 4 0 1), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 7), .split, .split, (.A 1 6 4 0 3), .split, (.A 1 2 4 0 3), (.A 0 6 4 0 3), .split, (.A 1 6 4 0 3), .split, (.A 1 2 4 0 3), (.A 1 6 4 0 3), .split, .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 1 2 4 0 5), (.A 1 2 4 0 3), (.A 0 2 4 0 5), .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 7), (.A 0 2 4 0 5), .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN093_6 : wsegOk P nbN093 (nInsideL P nbN093) kN093_6 tN093_6 kN093_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN093_7 : List Tok := [.split, (.A 5 2 4 0 5), .split, (.A 0 2 4 0 5), (.A 1 2 4 0 1), .split, (.A 1 2 4 0 3), .split, .split, (.A 5 2 4 0 5), (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 1), .split, (.A 5 2 4 0 1), (.A 5 2 4 0 1), (.A 5 2 4 0 1), (.A 1 2 4 0 1), (.A 0 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN093_7 : wsegOk P nbN093 (nInsideL P nbN093) kN093_7 tN093_7 kN093_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN093_8 : List Tok := [.split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 2 3), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 0 3 6 1 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5), .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN093_8 : wsegOk P nbN093 (nInsideL P nbN093) kN093_8 tN093_8 kN093_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN093_9 : List Tok := [(.A 0 3 6 0 5), (.A 4 3 6 0 5), .split, .split, .split, (.A 4 3 6 0 7), .split, (.A 5 2 6 1 7), (.A 4 3 6 0 7), .split, .split, .split, .split, .split, .split, (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), .split, .split, (.A 0 2 4 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 4 2 6 0 5), .split, (.A 0 2 4 0 5), .split, (.A 4 2 4 0 5), (.A 4 2 6 0 5), (.A 4 2 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN093_9 : wsegOk P nbN093 (nInsideL P nbN093) kN093_9 tN093_9 kN093_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN093_10 : List Tok := [.split, (.A 4 2 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 4 1 2 4 7), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), (.A 4 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN093_10 : wsegOk P nbN093 (nInsideL P nbN093) kN093_10 tN093_10 kN093_11 = true := by
  decide +kernel

end PackLean.D28.Cub
