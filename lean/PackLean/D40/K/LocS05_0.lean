-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey05

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_0 : List LTok := [.split, .split, .split, .split, (.acc 11), .split, .split, .split, .split, (.acc 11), .split, (.acc 11), (.acc 9), .split, (.acc 11), .split, (.acc 11), (.acc 9), .split, .split, (.acc 11), .split, (.acc 11), (.acc 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_0 : lsegOk P ce0.tube (fullW P ce0.tube) it0 [⟨lo05, hi05⟩] t05_0 k05_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_1 : List LTok := [.split, (.acc 11), .split, (.acc 11), (.acc 9), .split, .split, .split, (.acc 11), .split, (.acc 11), (.acc 9), .split, (.acc 11), .split, (.acc 11), (.acc 9), .split, .split, (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_1 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_1 t05_1 k05_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_2 : List LTok := [.split, (.acc 11), (.acc 9), .split, (.acc 11), .split, (.acc 11), (.acc 9), .split, .split, .split, .split, .split, .split, (.acc 7), .split, .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_2 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_2 t05_2 k05_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_3 : List LTok := [.split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, .split, (.acc 11), (.acc 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_3 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_3 t05_3 k05_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_4 : List LTok := [.split, (.acc 11), (.acc 1), (.acc 0), (.acc 1), .split, .split, .split, (.acc 7), .split, .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, .split, (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_4 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_4 t05_4 k05_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_5 : List LTok := [(.acc 1), .split, (.acc 11), (.acc 1), .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, .split, (.acc 11), (.acc 1), .split, (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_5 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_5 t05_5 k05_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_6 : List LTok := [(.acc 1), (.acc 0), (.acc 1), .split, .split, .split, .split, (.acc 7), .split, .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, .split, (.acc 11), (.acc 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_6 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_6 t05_6 k05_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_7 : List LTok := [.split, (.acc 11), (.acc 1), .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_7 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_7 t05_7 k05_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_8 : List LTok := [(.acc 0), (.acc 1), .split, .split, .split, (.acc 7), .split, .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, .split, (.acc 11), (.acc 1), .split, (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_8 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_8 t05_8 k05_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_9 : List LTok := [(.acc 1), .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), (.acc 0)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_9 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_9 t05_9 k05_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_10 : List LTok := [(.acc 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.acc 11), (.acc 9), (.acc 9), .split, .split, (.acc 11), (.acc 9), (.acc 9), .split, .split, .split, (.acc 11), (.acc 9), (.acc 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_10 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_10 t05_10 k05_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_11 : List LTok := [.split, .split, (.acc 11), (.acc 9), (.acc 9), (.acc 9), (.acc 9), (.acc 9), .split, .split, .split, .split, .split, .split, .split, (.acc 11), (.acc 9), .split, (.acc 11), (.acc 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_11 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_11 t05_11 k05_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_12 : List LTok := [.split, .split, (.acc 11), (.acc 9), .split, (.acc 11), (.acc 9), .split, .split, .split, (.acc 11), (.acc 9), .split, (.acc 11), (.acc 9), .split, .split, (.acc 11), (.acc 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_12 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_12 t05_12 k05_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_13 : List LTok := [.split, (.acc 11), (.acc 9), (.acc 9), (.acc 9), .split, (.acc 9), (.acc 9), .split, .split, .split, .split, .split, .split, .split, .split, (.acc 11), (.acc 9), (.acc 9), .split, .split, (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_13 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_13 t05_13 k05_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_14 : List LTok := [(.acc 9), (.acc 9), .split, (.acc 9), .split, .split, (.acc 11), (.acc 9), (.acc 9), (.acc 9), (.acc 9), (.acc 9), .split, .split, .split, .split, .split, .split, .split, (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_14 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_14 t05_14 k05_15 = true := by
  decide +kernel

end PackLean.D40.Tet
