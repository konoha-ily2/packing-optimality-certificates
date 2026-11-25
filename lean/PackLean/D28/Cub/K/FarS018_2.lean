-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey018

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM056_5 : List Tok := [(.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 0 3 6 1 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), .split, (.A 0 3 6 1 7), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, (.A 4 3 6 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM056_5 : wsegOk P nbM056 (nInsideL P nbM056) kM056_5 tM056_5 kM056_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM056_6 : List Tok := [(.A 4 3 6 0 7), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), .split, .split, (.A 4 2 6 0 7), .split, (.A 0 2 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM056_6 : wsegOk P nbM056 (nInsideL P nbM056) kM056_6 tM056_6 kM056_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM056_7 : List Tok := [.split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 5), (.A 0 2 6 0 1), (.A 0 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM056_7 : wsegOk P nbM056 (nInsideL P nbM056) kM056_7 tM056_7 kM056_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM056_8 : List Tok := [.split, .split, .split, .split, (.A 4 3 6 0 5), (.A 0 3 6 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, (.A 0 3 6 0 1), .split, .split, (.A 4 2 6 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), .split, .split, (.A 0 3 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 4 3 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM056_8 : wsegOk P nbM056 (nInsideL P nbM056) kM056_8 tM056_8 kM056_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM056_9 : List Tok := [(.A 4 3 5 0 1), .split, (.A 0 3 5 0 1), (.A 4 3 5 0 1), .split, .split, (.A 4 3 6 0 5), (.A 4 3 6 0 1), .split, .split, (.A 0 3 4 0 1), (.D 6), (.A 4 3 7 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1), (.A 4 7 5 0 1), (.D 18), .split, .split, (.D 6), (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, (.A 4 3 7 0 5), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM056_9 : wsegOk P nbM056 (nInsideL P nbM056) kM056_9 tM056_9 kM056_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM056_10 : List Tok := [(.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM056_10 : wsegOk P nbM056 (nInsideL P nbM056) kM056_10 tM056_10 kM056_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM056_11 : List Tok := [.split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, .split, (.A 5 2 4 0 7), (.A 0 2 4 0 7), .split, (.A 4 2 6 0 7), (.A 4 2 4 0 3), .split, .split, (.A 5 2 4 0 3), (.A 5 2 4 0 3), (.A 4 2 6 0 3), .split, (.A 5 2 4 1 3), (.A 5 2 6 0 3), .split, .split, (.A 5 0 4 1 3), .split, .split, .split, (.D 4), (.A 1 2 5 1 3), (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM056_11 : wsegOk P nbM056 (nInsideL P nbM056) kM056_11 tM056_11 kM056_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM056_12 : List Tok := [.split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), (.A 5 0 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), (.A 1 6 5 0 3), .split, (.D 1), .split, (.A 1 6 5 1 3), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM056_12 : wsegOk P nbM056 (nInsideL P nbM056) kM056_12 tM056_12 kM056_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM056_13 : List Tok := [(.A 1 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), (.A 4 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 5 0 3), .split, (.A 0 2 5 0 3), (.A 0 2 5 0 1), .split, .split, (.A 1 2 5 0 3), .split, (.A 0 2 5 0 3), (.A 1 2 5 0 3), .split, .split, .split, (.A 4 2 4 0 3), (.A 4 2 6 0 3), (.A 5 2 7 0 3), (.A 4 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM056_13 : wsegOk P nbM056 (nInsideL P nbM056) kM056_13 tM056_13 kM056_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM056_14 : List Tok := [.split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, .split, (.A 0 2 5 0 3), (.A 0 6 5 0 3), (.A 4 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 2 7 0 3), (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), .split, (.A 4 2 7 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM056_14 : wsegOk P nbM056 (nInsideL P nbM056) kM056_14 tM056_14 kM056_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM056_15 : List Tok := [(.A 5 2 7 0 3), .split, (.A 5 2 7 0 3), (.A 5 2 7 0 3), .split, .split, .split, (.A 1 6 5 0 3), (.D 12), .split, .split, .split, (.A 4 6 5 0 3), (.A 4 2 5 0 3), .split, (.A 4 6 5 0 3), (.A 4 2 7 0 3), (.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), (.A 1 4 5 1 3), (.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM056_15 : wsegOk P nbM056 (nInsideL P nbM056) kM056_15 tM056_15 kM056_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM056_16 : List Tok := [.split, (.A 5 6 7 1 3), (.D 12), (.D 12), (.D 12), .split, (.A 5 2 7 5 3), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), (.A 4 1 6 4 7), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, .split, (.A 4 2 6 0 7), (.A 4 2 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM056_16 : wsegOk P nbM056 (nInsideL P nbM056) kM056_16 tM056_16 kM056_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM056_17 : List Tok := [(.A 4 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), (.A 4 2 6 4 3), .split, (.A 5 0 6 5 3), (.D 13), .split, (.A 4 2 6 4 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 4 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM056_17 : wsegOk P nbM056 (nInsideL P nbM056) kM056_17 tM056_17 kM056_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM056_18 : List Tok := [.split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM056_18 : wsegOk P nbM056 (nInsideL P nbM056) kM056_18 tM056_18 kM056_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM056_19 : List Tok := [(.A 4 2 6 0 1), (.A 4 2 6 0 1), .split, .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1), (.A 4 2 5 0 1), (.A 4 2 6 0 1), .split, .split, (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, (.A 4 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM056_19 : wsegOk P nbM056 (nInsideL P nbM056) kM056_19 tM056_19 kM056_20 = true := by
  decide +kernel

end PackLean.D28.Cub
