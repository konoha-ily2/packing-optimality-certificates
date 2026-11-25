-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey064

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), (.A 1 2 0 3 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 4 1 5), .split, (.D 5), (.A 0 7 4 1 5), .split, .split, (.A 5 2 4 1 6), .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_0 : wsegOk P nbN149 (nInsideL P nbN149) (rRoots P.rden) tN149_0 kN149_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_1 : List Tok := [.split, (.D 17), .split, (.D 5), (.A 4 2 4 5 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 5), .split, .split, (.A 1 2 4 1 5), .split, (.A 5 2 4 1 5), .split, (.A 0 6 4 1 5), (.A 1 2 4 1 5), (.A 5 2 4 1 5), (.A 4 3 4 1 5), .split, (.A 5 2 4 1 7), (.A 4 2 4 1 5), .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, .split, .split, (.D 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_1 : wsegOk P nbN149 (nInsideL P nbN149) kN149_1 tN149_1 kN149_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_2 : List Tok := [.split, .split, (.D 9), .split, (.A 1 6 4 3 5), .split, .split, (.A 0 7 4 3 5), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, (.A 1 6 5 2 7), (.D 7), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, .split, (.A 4 2 4 0 5), (.A 0 6 4 0 5), (.A 4 3 4 0 5), (.A 0 7 4 0 5), .split, .split, (.A 5 6 4 0 5), (.A 1 6 4 0 5), (.A 4 6 4 0 5), .split, (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_2 : wsegOk P nbN149 (nInsideL P nbN149) kN149_2 tN149_2 kN149_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_3 : List Tok := [(.A 0 6 4 0 1), .split, (.A 1 6 4 0 3), .split, .split, .split, (.A 5 6 4 0 7), .split, (.A 5 2 4 0 5), .split, .split, (.A 1 6 4 0 1), .split, (.A 5 2 4 0 5), (.A 4 6 4 0 1), (.A 5 2 4 0 1), (.A 5 2 4 0 3), .split, .split, (.A 1 6 4 0 1), (.A 0 6 4 0 1), (.A 1 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 5 0 3), .split, .split, .split, .split, (.D 5), (.A 0 3 6 1 5), .split, (.D 2), .split, (.D 6), (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_3 : wsegOk P nbN149 (nInsideL P nbN149) kN149_3 tN149_3 kN149_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_4 : List Tok := [.split, .split, .split, (.D 5), (.A 4 3 2 4 7), .split, (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 6 1 2 4 7), .split, (.A 4 3 6 0 5), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), (.A 0 7 6 2 5), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, .split, (.A 0 7 4 0 5), (.A 4 3 6 0 5), (.A 4 3 4 0 5), (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_4 : wsegOk P nbN149 (nInsideL P nbN149) kN149_4 tN149_4 kN149_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_5 : List Tok := [(.A 4 3 6 0 5), .split, .split, .split, (.A 4 3 4 0 5), (.A 5 2 6 0 1), .split, .split, .split, .split, (.A 4 7 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, .split, .split, .split, .split, (.A 5 2 4 0 1), (.A 4 6 4 0 1), (.A 4 3 4 0 1), (.A 5 2 4 0 1), .split, (.A 0 7 5 0 1), (.A 4 6 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, (.A 0 7 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_5 : wsegOk P nbN149 (nInsideL P nbN149) kN149_5 tN149_5 kN149_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_6 : List Tok := [(.D 18), (.A 4 3 5 2 1), .split, (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), (.A 5 2 4 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), (.A 5 0 6 5 7), (.A 7 0 6 5 3), .split, (.A 5 2 4 1 7), .split, .split, (.A 7 0 4 1 3), (.A 5 2 5 1 3), (.A 5 2 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_6 : wsegOk P nbN149 (nInsideL P nbN149) kN149_6 tN149_6 kN149_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_7 : List Tok := [.split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4), .split, (.A 7 0 6 5 3), .split, (.A 5 2 7 5 3), (.D 15), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_7 : wsegOk P nbN149 (nInsideL P nbN149) kN149_7 tN149_7 kN149_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_8 : List Tok := [(.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 5 6 5 0 3), (.A 1 6 5 1 3), (.A 1 6 5 0 3), (.A 5 6 7 0 3), .split, .split, (.A 1 6 5 0 3), .split, (.A 1 6 5 0 3), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3), (.A 1 6 7 1 3), (.D 12), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_8 : wsegOk P nbN149 (nInsideL P nbN149) kN149_8 tN149_8 kN149_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_9 : List Tok := [.split, (.A 5 2 7 5 3), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), .split, .split, (.D 17), .split, (.A 5 2 6 5 7), (.A 7 0 6 5 7), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), .split, (.A 7 0 6 5 7), (.D 13), .split, .split, .split, .split, .split, (.A 5 2 6 1 7), (.A 4 2 6 4 7), (.A 5 2 6 4 7), (.A 5 2 6 0 1), .split, .split, (.A 4 3 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_9 : wsegOk P nbN149 (nInsideL P nbN149) kN149_9 tN149_9 kN149_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_10 : List Tok := [.split, .split, (.D 13), (.A 5 2 6 4 5), (.D 13), .split, (.A 4 3 6 0 5), (.A 5 2 6 4 5), .split, .split, .split, (.A 5 2 6 4 3), (.A 7 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), (.A 5 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, .split, (.D 13), (.A 5 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_10 : wsegOk P nbN149 (nInsideL P nbN149) kN149_10 tN149_10 kN149_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_11 : List Tok := [(.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 7 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), (.A 5 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, (.A 5 2 7 0 1), .split, .split, .split, (.A 5 2 5 0 1), (.A 5 6 5 0 1), .split, (.A 5 2 5 0 1), (.A 4 2 5 0 1), (.A 5 2 5 0 1), .split, (.A 5 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_11 : wsegOk P nbN149 (nInsideL P nbN149) kN149_11 tN149_11 kN149_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_12 : List Tok := [.split, (.A 4 3 7 0 1), (.A 5 2 7 4 1), (.A 5 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 5 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, (.A 5 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_12 : wsegOk P nbN149 (nInsideL P nbN149) kN149_12 tN149_12 kN149_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_13 : List Tok := [(.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_13 : wsegOk P nbN149 (nInsideL P nbN149) kN149_13 tN149_13 kN149_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_14 : List Tok := [(.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_14 : wsegOk P nbN149 (nInsideL P nbN149) kN149_14 tN149_14 [] = true := by
  decide +kernel

end PackLean.D28.Cub
