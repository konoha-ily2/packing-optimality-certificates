-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey40

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t40_15 : List LTok := [.split, .split, (.acc 10), (.acc 12), .split, (.acc 10), (.acc 12), (.acc 10), (.acc 12), .split, .split, .split, (.acc 11), .split, .split, .split, (.acc 10), (.acc 12), (.acc 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s40_15 : lsegOk P ce4.tube (fullW P ce4.tube) it4 k40_15 t40_15 k40_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t40_16 : List LTok := [.split, .split, (.acc 10), (.acc 12), (.acc 7), (.acc 10), (.acc 12), .split, (.acc 10), .split, (.acc 10), (.acc 10), (.acc 12), .split, .split, .split, (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s40_16 : lsegOk P ce4.tube (fullW P ce4.tube) it4 k40_16 t40_16 k40_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t40_17 : List LTok := [.split, .split, .split, (.acc 10), (.acc 12), .split, (.acc 10), (.acc 12), .split, .split, (.acc 10), (.acc 12), .split, (.acc 10), (.acc 12), (.acc 10), (.acc 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s40_17 : lsegOk P ce4.tube (fullW P ce4.tube) it4 k40_17 t40_17 k40_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t40_18 : List LTok := [.split, .split, .split, .split, (.acc 11), .split, .split, .split, .split, .split, (.acc 11), .split, .split, .split, (.acc 10), (.acc 12), .split, (.acc 10), (.acc 12), .split, .split, (.acc 10), (.acc 12), .split, (.acc 10), (.acc 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s40_18 : lsegOk P ce4.tube (fullW P ce4.tube) it4 k40_18 t40_18 k40_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t40_19 : List LTok := [(.acc 10), (.acc 12), .split, .split, .split, (.acc 11), .split, .split, .split, (.acc 10), (.acc 12), (.acc 7), .split, .split, (.acc 10), (.acc 12), (.acc 7), (.acc 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s40_19 : lsegOk P ce4.tube (fullW P ce4.tube) it4 k40_19 t40_19 k40_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t40_20 : List LTok := [(.acc 12), .split, .split, .split, .split, (.acc 11), .split, .split, .split, (.acc 10), (.acc 12), .split, (.acc 10), (.acc 12), .split, .split, (.acc 10), (.acc 12), .split, (.acc 10), (.acc 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s40_20 : lsegOk P ce4.tube (fullW P ce4.tube) it4 k40_20 t40_20 k40_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t40_21 : List LTok := [(.acc 10), (.acc 12), .split, .split, .split, (.acc 11), .split, .split, .split, (.acc 10), (.acc 12), (.acc 7), .split, .split, (.acc 10), (.acc 12), (.acc 7), (.acc 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s40_21 : lsegOk P ce4.tube (fullW P ce4.tube) it4 k40_21 t40_21 k40_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t40_22 : List LTok := [(.acc 12), .split, (.acc 10), .split, .split, .split, (.acc 10), (.acc 10), (.acc 10), .split, .split, (.acc 10), (.acc 12), (.acc 10), (.acc 12), .split, .split, .split, (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s40_22 : lsegOk P ce4.tube (fullW P ce4.tube) it4 k40_22 t40_22 k40_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t40_23 : List LTok := [.split, .split, .split, (.acc 10), (.acc 12), .split, (.acc 10), (.acc 12), .split, .split, (.acc 10), (.acc 12), .split, (.acc 10), (.acc 12), (.acc 10), (.acc 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s40_23 : lsegOk P ce4.tube (fullW P ce4.tube) it4 k40_23 t40_23 k40_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t40_24 : List LTok := [.split, (.acc 8), .split, .split, (.acc 6), (.acc 12), (.acc 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s40_24 : lsegOk P ce4.tube (fullW P ce4.tube) it4 k40_24 t40_24 [] = true := by
  decide +kernel

end PackLean.D40.Tet
