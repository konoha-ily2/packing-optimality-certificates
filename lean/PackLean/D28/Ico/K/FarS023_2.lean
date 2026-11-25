-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey023

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN153_9 : List Tok := [.split, (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 10 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN153_9 : wsegOk P nbN153 (nInsideL P nbN153) kN153_9 tN153_9 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM153_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), (.A 7 1 8 7 11), (.A 7 1 8 7 11), .split, .split, (.A 3 5 0 3 4), (.A 3 5 0 3 11), .split, .split, .split, .split, .split, .split, (.A 7 1 0 7 11), (.A 7 6 8 7 10), (.A 7 5 0 7 10), (.A 3 1 0 3 11), (.A 7 6 8 7 10), (.A 7 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM153_0 : wsegOk P nbM153 (nInsideL P nbM153) (rRoots P.rden) tM153_0 kM153_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM153_1 : List Tok := [.split, (.A 7 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 7 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), .split, (.A 7 6 8 7 9), (.A 2 6 8 7 9), (.A 7 6 8 7 9), (.A 7 6 8 7 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM153_1 : wsegOk P nbM153 (nInsideL P nbM153) kM153_1 tM153_1 kM153_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM153_2 : List Tok := [(.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.A 7 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, (.A 7 11 0 7 10), .split, (.A 7 6 0 7 10), .split, (.A 7 5 0 7 10), .split, (.D 3), .split, (.A 7 6 0 7 10), .split, (.A 7 5 0 7 10), (.A 1 11 0 7 10), (.D 3), (.D 33)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM153_2 : wsegOk P nbM153 (nInsideL P nbM153) kM153_2 tM153_2 kM153_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM153_3 : List Tok := [.split, .split, .split, .split, (.A 7 6 8 7 10), .split, (.A 2 5 0 7 10), .split, (.A 2 6 0 7 10), (.A 2 6 4 2 9), .split, .split, (.A 2 6 0 2 10), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, .split, (.A 2 5 4 2 10), (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), .split, (.A 3 1 8 3 11), (.A 3 1 4 3 11), .split, (.D 41)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM153_3 : wsegOk P nbM153 (nInsideL P nbM153) kM153_3 tM153_3 kM153_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM153_4 : List Tok := [.split, (.D 1), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, (.A 7 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 7 6 8 7 11), .split, (.A 2 1 8 2 9), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), .split, .split, (.A 7 6 8 7 11), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 2 1 8 7 9), (.A 2 1 4 2 9), (.A 2 1 4 2 9), (.A 2 6 8 2 9), .split, (.D 41)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM153_4 : wsegOk P nbM153 (nInsideL P nbM153) kM153_4 tM153_4 kM153_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM153_5 : List Tok := [.split, .split, (.A 3 1 4 3 9), (.A 3 1 4 3 5), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 3 5 0 3 11), .split, (.A 3 7 0 3 11), .split, (.D 9), .split, (.A 3 5 0 3 11), .split, (.A 3 7 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, (.A 2 5 0 3 10), (.A 2 1 4 3 9), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11), (.A 2 5 4 2 9), (.A 2 5 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM153_5 : wsegOk P nbM153 (nInsideL P nbM153) kM153_5 tM153_5 kM153_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM153_6 : List Tok := [.split, (.A 3 1 4 3 11), .split, .split, (.A 2 5 0 3 10), .split, (.A 3 1 4 3 11), .split, .split, (.A 2 5 0 3 10), .split, (.A 2 1 4 3 11), .split, .split, (.A 2 5 0 2 10), (.A 8 1 4 8 9), (.A 2 1 4 2 9), (.A 2 1 4 2 9), (.A 2 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), .split, (.A 2 5 4 2 10), (.D 31), .split, .split, (.D 1), .split, .split, (.A 3 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM153_6 : wsegOk P nbM153 (nInsideL P nbM153) kM153_6 tM153_6 kM153_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM153_7 : List Tok := [(.D 1), .split, .split, .split, .split, .split, (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, .split, (.A 2 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM153_7 : wsegOk P nbM153 (nInsideL P nbM153) kM153_7 tM153_7 kM153_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM153_8 : List Tok := [(.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM153_8 : wsegOk P nbM153 (nInsideL P nbM153) kM153_8 tM153_8 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN154_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), .split, (.A 3 1 8 7 11), .split, (.A 10 1 8 9 11), (.A 10 1 8 7 11), .split, .split, .split, .split, (.D 13), .split, .split, .split, (.D 13), .split, (.A 3 5 0 3 4), .split, (.D 13), (.A 8 5 0 3 11), (.A 8 5 0 3 4), .split, .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN154_0 : wsegOk P nbN154 (nInsideL P nbN154) (rRoots P.rden) tN154_0 kN154_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN154_1 : List Tok := [(.A 8 1 0 3 11), (.A 8 5 0 3 11), (.A 8 5 0 3 4), .split, .split, (.D 13), .split, .split, (.A 10 1 0 3 11), (.A 8 5 0 3 11), (.A 10 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, .split, .split, .split, (.A 10 1 8 3 11), .split, (.A 8 1 0 3 11), (.A 3 1 0 3 11), (.A 10 1 8 3 11), (.A 3 1 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN154_1 : wsegOk P nbN154 (nInsideL P nbN154) kN154_1 tN154_1 kN154_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN154_2 : List Tok := [.split, .split, .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 3 11), (.A 8 5 0 3 10), .split, (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 11), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), .split, .split, (.A 8 5 0 3 11), .split, (.A 8 1 0 3 11), (.A 8 5 0 3 11), (.A 3 1 0 7 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, .split, (.D 11), (.A 3 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN154_2 : wsegOk P nbN154 (nInsideL P nbN154) kN154_2 tN154_2 kN154_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN154_3 : List Tok := [.split, .split, (.A 3 1 8 7 11), .split, (.D 11), .split, (.D 11), (.A 3 0 8 7 11), .split, .split, (.A 3 6 8 7 11), (.A 3 1 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), .split, (.D 7), .split, (.A 3 6 0 7 10), .split, (.D 7), (.A 3 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN154_3 : wsegOk P nbN154 (nInsideL P nbN154) kN154_3 tN154_3 kN154_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN154_4 : List Tok := [.split, (.D 7), (.A 2 11 0 7 10), .split, .split, (.A 8 5 0 7 10), (.A 3 5 0 7 10), .split, (.A 8 5 0 7 10), .split, (.A 2 5 0 7 10), (.A 8 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, .split, .split, (.A 8 5 0 3 10), .split, (.A 8 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 2 10), .split, (.D 9), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 2 11 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN154_4 : wsegOk P nbN154 (nInsideL P nbN154) kN154_4 tN154_4 kN154_5 = true := by
  decide +kernel

end PackLean.D28.Ico
