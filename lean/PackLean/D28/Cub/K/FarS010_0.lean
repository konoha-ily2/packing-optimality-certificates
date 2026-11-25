-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey010

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN035_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 0 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), .split, (.D 4), (.A 5 2 4 1 7), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN035_0 : wsegOk P nbN035 (nInsideL P nbN035) (rRoots P.rden) tN035_0 kN035_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN035_1 : List Tok := [.split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 4 3 4 1 7), .split, .split, .split, .split, (.D 5), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 1 7), (.A 0 2 4 1 5), .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 5 2 4 1 7), .split, (.A 4 2 4 1 7), .split, (.A 4 2 4 1 7), (.A 4 2 4 1 7), .split, .split, .split, (.D 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN035_1 : wsegOk P nbN035 (nInsideL P nbN035) kN035_1 tN035_1 kN035_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN035_2 : List Tok := [.split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, (.A 1 6 4 3 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, (.A 0 6 4 1 5), (.A 1 6 4 0 7), (.A 0 6 4 2 1), .split, .split, (.A 0 6 4 0 5), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN035_2 : wsegOk P nbN035 (nInsideL P nbN035) kN035_2 tN035_2 kN035_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN035_3 : List Tok := [(.A 1 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7), (.A 1 6 4 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 3), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 2 4 0 5), (.A 4 2 4 0 5), (.A 4 2 4 0 5), (.A 0 2 4 0 1), .split, .split, .split, .split, .split, (.A 5 2 4 0 7), (.A 1 2 4 0 7), (.A 4 2 4 0 7), (.A 5 2 4 0 3), .split, .split, .split, .split, (.A 0 6 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN035_3 : wsegOk P nbN035 (nInsideL P nbN035) kN035_3 tN035_3 kN035_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN035_4 : List Tok := [.split, (.A 1 6 4 0 3), .split, (.A 1 2 4 0 3), (.A 0 6 4 0 3), (.A 0 6 4 0 3), .split, (.A 0 2 4 0 3), (.A 0 6 4 0 3), .split, .split, (.A 1 2 4 0 3), (.A 1 6 4 0 3), .split, (.A 4 2 4 0 3), (.A 4 6 4 0 3), .split, (.A 4 2 4 0 1), .split, .split, .split, (.A 4 2 4 0 1), .split, (.A 4 6 4 0 1), .split, (.A 4 6 4 0 1), (.A 4 2 4 0 1), (.A 4 2 4 0 1), (.A 4 2 4 0 1), .split, .split, (.A 0 6 4 0 1), (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN035_4 : wsegOk P nbN035 (nInsideL P nbN035) kN035_4 tN035_4 kN035_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN035_5 : List Tok := [.split, (.A 4 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), (.A 0 3 6 1 5), .split, (.D 2), .split, (.D 6), (.A 2 3 6 0 5), .split, .split, (.A 4 3 2 4 7), .split, .split, (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN035_5 : wsegOk P nbN035 (nInsideL P nbN035) kN035_5 tN035_5 kN035_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN035_6 : List Tok := [.split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 4 3 6 0 5), (.D 2), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 0 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 0 7 4 2 1), .split, (.A 0 7 4 0 1), (.A 4 7 4 0 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN035_6 : wsegOk P nbN035 (nInsideL P nbN035) kN035_6 tN035_6 kN035_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN035_7 : List Tok := [.split, .split, .split, .split, .split, (.A 4 3 4 0 5), (.A 4 3 4 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, .split, .split, .split, (.A 4 7 4 0 1), (.A 4 3 4 0 1), (.A 4 7 4 0 1), (.A 4 3 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 4 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), (.A 4 7 4 2 1), .split, .split, (.D 6), .split, (.A 4 3 7 0 5), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN035_7 : wsegOk P nbN035 (nInsideL P nbN035) kN035_7 tN035_7 kN035_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN035_8 : List Tok := [.split, (.A 5 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.A 4 2 4 5 7), .split, (.A 5 0 4 5 7), (.A 4 0 6 5 7), .split, (.D 4), .split, (.D 17), .split, .split, (.A 5 0 6 5 3), (.A 5 0 6 5 7), (.A 5 0 6 5 3), .split, .split, (.A 5 2 4 1 7), (.A 5 2 6 1 7), .split, (.A 5 2 6 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN035_8 : wsegOk P nbN035 (nInsideL P nbN035) kN035_8 tN035_8 kN035_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN035_9 : List Tok := [.split, (.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), .split, (.A 5 2 4 0 3), (.A 1 6 5 0 3), (.A 5 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 5 6 5 0 3), .split, (.A 5 2 4 0 3), (.A 5 6 5 0 3), (.A 5 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN035_9 : wsegOk P nbN035 (nInsideL P nbN035) kN035_9 tN035_9 kN035_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN035_10 : List Tok := [(.A 4 2 4 0 3), (.A 5 2 5 0 3), .split, (.A 4 6 5 0 3), (.A 5 6 5 0 3), .split, .split, (.A 5 6 5 1 3), (.A 1 6 5 0 3), .split, (.A 5 2 7 0 3), (.A 5 6 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 1), (.D 12), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, (.A 5 6 7 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN035_10 : wsegOk P nbN035 (nInsideL P nbN035) kN035_10 tN035_10 kN035_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN035_11 : List Tok := [(.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), (.A 4 1 6 4 7), .split, (.A 4 0 6 5 7), (.D 13), .split, .split, (.A 4 2 6 0 7), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 6 5 3), .split, (.D 13), (.A 4 2 6 4 3), (.A 5 0 6 5 3), (.A 5 2 6 4 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN035_11 : wsegOk P nbN035 (nInsideL P nbN035) kN035_11 tN035_11 kN035_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN035_12 : List Tok := [.split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 5 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 6 3 6 4 5), (.A 6 2 7 4 5), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 7 0 6 5 3), (.A 5 2 7 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN035_12 : wsegOk P nbN035 (nInsideL P nbN035) kN035_12 tN035_12 kN035_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN035_13 : List Tok := [.split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, (.A 4 2 7 0 1), .split, (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 7 4 1), .split, .split, (.A 5 2 7 4 1), .split, (.A 5 2 7 4 1), (.D 12), (.A 5 2 7 4 1), .split, .split, .split, .split, (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN035_13 : wsegOk P nbN035 (nInsideL P nbN035) kN035_13 tN035_13 kN035_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN035_14 : List Tok := [(.A 4 3 7 4 1), (.D 6), .split, .split, (.A 4 2 7 4 1), (.D 19), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN035_14 : wsegOk P nbN035 (nInsideL P nbN035) kN035_14 tN035_14 kN035_15 = true := by
  decide +kernel

end PackLean.D28.Cub
