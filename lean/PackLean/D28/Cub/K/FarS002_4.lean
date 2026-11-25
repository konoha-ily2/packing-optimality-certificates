-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey002

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN011_5 : List Tok := [(.A 4 7 4 0 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 2 1), .split, .split, .split, .split, .split, (.A 4 3 4 0 5), (.A 4 3 4 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), (.A 4 3 4 0 1), (.A 4 3 6 0 1), (.A 4 7 4 2 1), .split, .split, (.D 6), (.A 6 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN011_5 : wsegOk P nbN011 (nInsideL P nbN011) kN011_5 tN011_5 kN011_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN011_6 : List Tok := [(.A 4 0 4 5 7), .split, (.D 4), (.A 4 0 6 5 3), .split, .split, (.A 5 2 4 1 7), .split, (.A 4 2 6 1 7), (.A 4 2 4 1 3), (.A 5 2 6 1 3), .split, (.D 4), .split, .split, .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), (.D 15), .split, (.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN011_6 : wsegOk P nbN011 (nInsideL P nbN011) kN011_6 tN011_6 kN011_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN011_7 : List Tok := [(.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), .split, (.A 5 2 4 0 3), (.A 5 6 5 0 3), (.A 5 6 5 0 3), (.A 1 6 5 0 3), .split, (.A 4 2 5 0 3), (.A 4 6 5 0 3), .split, (.A 5 6 5 0 3), .split, (.A 5 2 7 0 3), (.A 5 6 5 0 3), .split, .split, (.A 0 6 5 0 3), (.A 4 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, (.A 5 6 7 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN011_7 : wsegOk P nbN011 (nInsideL P nbN011) kN011_7 tN011_7 kN011_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN011_8 : List Tok := [(.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), (.A 4 1 2 4 7), .split, (.A 4 0 6 5 7), (.D 13), .split, .split, (.A 4 2 6 0 7), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, (.A 4 2 6 4 3), (.A 4 0 6 5 3), .split, (.A 4 2 6 4 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN011_8 : wsegOk P nbN011 (nInsideL P nbN011) kN011_8 tN011_8 kN011_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN011_9 : List Tok := [(.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), (.A 6 3 7 4 5), (.A 6 1 7 4 5), .split, .split, (.D 13), (.A 6 2 7 4 5), (.D 13), .split, .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, (.A 4 2 7 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN011_9 : wsegOk P nbN011 (nInsideL P nbN011) kN011_9 tN011_9 kN011_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN011_10 : List Tok := [.split, (.A 5 2 7 4 1), (.A 4 2 7 4 1), .split, .split, .split, .split, (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, .split, (.A 6 3 7 4 5), (.A 6 2 7 4 1), (.A 4 3 7 4 1), (.D 6), .split, .split, (.A 6 2 7 4 1), (.D 19), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN011_10 : wsegOk P nbN011 (nInsideL P nbN011) kN011_10 tN011_10 kN011_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN011_11 : List Tok := [(.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN011_11 : wsegOk P nbN011 (nInsideL P nbN011) kN011_11 tN011_11 kN011_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN011_12 : List Tok := [.split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN011_12 : wsegOk P nbN011 (nInsideL P nbN011) kN011_12 tN011_12 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM011_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), (.A 0 6 4 1 5), .split, (.D 5), .split, (.D 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM011_0 : wsegOk P nbM011 (nInsideL P nbM011) (rRoots P.rden) tM011_0 kM011_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM011_1 : List Tok := [(.A 4 3 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 7), .split, (.A 0 3 4 1 7), (.A 0 2 4 1 5), .split, .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 4 2 4 1 7), .split, (.A 0 2 4 1 7), (.A 4 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, .split, (.D 7), (.A 0 6 4 2 7), .split, (.A 1 6 5 2 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM011_1 : wsegOk P nbM011 (nInsideL P nbM011) kM011_1 tM011_1 kM011_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM011_2 : List Tok := [.split, (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 0 6 4 1 7), (.A 0 6 4 2 1), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, (.A 0 6 4 0 7), .split, (.A 0 2 4 0 7), (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM011_2 : wsegOk P nbM011 (nInsideL P nbM011) kM011_2 tM011_2 kM011_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM011_3 : List Tok := [(.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), (.A 4 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), (.A 4 6 4 0 1), (.A 4 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 4 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM011_3 : wsegOk P nbM011 (nInsideL P nbM011) kM011_3 tM011_3 kM011_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM011_4 : List Tok := [.split, (.D 2), .split, (.D 6), .split, .split, (.D 2), (.D 6), (.D 2), .split, .split, .split, (.D 5), (.A 4 3 2 4 7), .split, (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, .split, (.D 2), (.A 2 3 6 0 5), (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM011_4 : wsegOk P nbM011 (nInsideL P nbM011) kM011_4 tM011_4 kM011_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM011_5 : List Tok := [.split, .split, .split, (.A 4 3 6 0 5), .split, (.A 4 3 6 0 5), (.D 2), (.A 6 3 6 0 5), (.A 6 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 2 7 4 2 1), .split, (.A 2 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 3 4 0 5), .split, (.A 0 7 4 2 1), .split, (.A 0 7 4 0 1), .split, (.A 0 3 4 0 1), (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM011_5 : wsegOk P nbM011 (nInsideL P nbM011) kM011_5 tM011_5 kM011_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM011_6 : List Tok := [.split, .split, (.A 0 3 6 0 5), .split, (.A 0 3 6 0 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 6), .split, (.A 4 3 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 0 1), .split, .split, .split, (.A 4 2 4 0 5), (.A 4 2 6 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM011_6 : wsegOk P nbM011 (nInsideL P nbM011) kM011_6 tM011_6 kM011_7 = true := by
  decide +kernel

end PackLean.D28.Cub
