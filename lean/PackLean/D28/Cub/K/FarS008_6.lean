-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey008

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM031_8 : List Tok := [.split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), (.A 4 3 6 0 5), (.A 4 3 6 0 1), .split, .split, (.A 4 3 4 0 1), (.D 6), (.A 4 3 7 0 1), .split, .split, .split, .split, (.A 2 7 4 2 1), (.A 0 7 4 2 1), (.D 18), (.D 6), .split, (.A 4 7 5 2 1), .split, .split, (.D 6), (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, (.A 6 3 7 0 5), (.D 6), (.D 6), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM031_8 : wsegOk P nbM031 (nInsideL P nbM031) kM031_8 tM031_8 kM031_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM031_9 : List Tok := [.split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 1 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.A 4 2 4 5 7), .split, (.A 5 0 4 5 7), (.A 4 0 6 5 7), .split, (.D 4), .split, (.D 17), .split, .split, (.A 5 0 6 5 3), (.A 4 0 6 5 7), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM031_9 : wsegOk P nbM031 (nInsideL P nbM031) kM031_9 tM031_9 kM031_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM031_10 : List Tok := [(.A 0 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 4 2 6 1 7), .split, .split, .split, (.A 4 2 4 1 7), .split, (.A 0 2 4 1 7), (.A 0 2 4 1 3), .split, (.A 4 2 6 1 7), (.A 4 2 4 0 3), .split, (.A 4 2 4 1 3), (.A 4 2 6 0 3), .split, .split, (.A 5 0 4 1 3), .split, .split, (.A 5 2 5 1 3), (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), .split, .split, (.A 5 2 6 5 3), (.A 5 0 6 5 3), (.A 5 2 6 1 3), .split, (.D 4), .split, (.A 5 0 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM031_10 : wsegOk P nbM031 (nInsideL P nbM031) kM031_10 tM031_10 kM031_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM031_11 : List Tok := [.split, .split, .split, (.D 4), (.A 5 0 7 1 3), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 0 6 5 0 3), .split, (.D 1), (.A 1 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), (.A 0 2 4 1 7), (.A 1 2 5 1 3), (.A 0 6 5 0 3), (.A 0 2 5 0 3), .split, .split, (.A 1 2 5 1 3), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM031_11 : wsegOk P nbM031 (nInsideL P nbM031) kM031_11 tM031_11 kM031_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM031_12 : List Tok := [(.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), .split, (.A 4 2 4 0 3), .split, .split, (.A 0 2 4 0 3), (.A 4 2 4 0 1), (.A 4 2 5 0 3), (.A 4 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 4 2 5 0 1), .split, (.A 4 6 5 0 3), (.A 4 2 5 0 1), (.A 4 6 5 0 1), (.A 4 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), .split, (.A 5 2 5 1 3), (.A 5 6 5 0 3), (.A 5 6 5 1 3), .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM031_12 : wsegOk P nbM031 (nInsideL P nbM031) kM031_12 tM031_12 kM031_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM031_13 : List Tok := [(.D 12), .split, (.A 4 2 7 0 3), (.A 4 6 5 0 3), .split, .split, (.A 0 6 5 0 3), (.A 4 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, (.A 5 6 7 1 3), .split, (.A 5 2 7 5 3), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM031_13 : wsegOk P nbM031 (nInsideL P nbM031) kM031_13 tM031_13 kM031_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM031_14 : List Tok := [(.A 4 1 6 4 7), (.A 4 0 6 5 7), .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), (.A 4 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM031_14 : wsegOk P nbM031 (nInsideL P nbM031) kM031_14 tM031_14 kM031_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM031_15 : List Tok := [.split, (.D 13), (.A 6 1 7 4 5), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 4 0 6 5 3), .split, (.A 4 2 7 4 3), .split, (.D 15), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 5 0 1), (.A 4 2 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM031_15 : wsegOk P nbM031 (nInsideL P nbM031) kM031_15 tM031_15 kM031_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM031_16 : List Tok := [(.A 4 2 7 0 1), (.A 4 2 5 0 1), .split, .split, (.A 4 3 7 0 1), (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, (.A 4 2 7 4 1), (.A 4 2 7 4 1), .split, .split, (.A 4 7 5 4 1), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, .split, (.A 6 3 7 4 5), .split, (.A 4 2 7 4 1), (.A 6 3 7 4 5), (.A 6 3 7 4 1), (.D 6), .split, (.A 6 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM031_16 : wsegOk P nbM031 (nInsideL P nbM031) kM031_16 tM031_16 kM031_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM031_17 : List Tok := [(.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM031_17 : wsegOk P nbM031 (nInsideL P nbM031) kM031_17 tM031_17 kM031_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM031_18 : List Tok := [.split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM031_18 : wsegOk P nbM031 (nInsideL P nbM031) kM031_18 tM031_18 [] = true := by
  decide +kernel

end PackLean.D28.Cub
