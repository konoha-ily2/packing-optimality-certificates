-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey34

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t34_0 : List LTok := [.split, .split, .split, (.acc 0), (.acc 11), .split, .split, .split, .split, .split, .split, (.acc 0), (.acc 11), (.acc 3), .split, .split, (.acc 0), (.acc 11), (.acc 3), .split, .split, .split, (.acc 0), (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s34_0 : lsegOk P ce3.tube (fullW P ce3.tube) it3 [⟨lo34, hi34⟩] t34_0 k34_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t34_1 : List LTok := [(.acc 3), .split, .split, (.acc 0), (.acc 11), (.acc 3), .split, .split, .split, .split, (.acc 0), (.acc 11), .split, (.acc 0), (.acc 11), .split, .split, (.acc 0), (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s34_1 : lsegOk P ce3.tube (fullW P ce3.tube) it3 k34_1 t34_1 k34_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t34_2 : List LTok := [(.acc 3), .split, .split, .split, (.acc 0), (.acc 11), (.acc 3), .split, .split, (.acc 0), (.acc 11), (.acc 3), (.acc 11), .split, .split, (.acc 0), (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s34_2 : lsegOk P ce3.tube (fullW P ce3.tube) it3 k34_2 t34_2 k34_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t34_3 : List LTok := [.split, .split, .split, .split, .split, .split, (.acc 0), (.acc 11), .split, (.acc 0), (.acc 11), .split, .split, (.acc 0), (.acc 11), .split, (.acc 0), (.acc 11), .split, .split, .split, (.acc 0), (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s34_3 : lsegOk P ce3.tube (fullW P ce3.tube) it3 k34_3 t34_3 k34_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t34_4 : List LTok := [.split, (.acc 0), (.acc 11), .split, .split, (.acc 0), (.acc 11), (.acc 3), .split, .split, .split, .split, (.acc 0), (.acc 11), .split, (.acc 0), (.acc 11), .split, .split, (.acc 0)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s34_4 : lsegOk P ce3.tube (fullW P ce3.tube) it3 k34_4 t34_4 k34_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t34_5 : List LTok := [(.acc 11), .split, (.acc 0), (.acc 11), .split, .split, .split, (.acc 0), (.acc 11), .split, (.acc 0), (.acc 11), .split, .split, (.acc 0), (.acc 11), .split, (.acc 0)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s34_5 : lsegOk P ce3.tube (fullW P ce3.tube) it3 k34_5 t34_5 k34_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t34_6 : List LTok := [(.acc 11), (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s34_6 : lsegOk P ce3.tube (fullW P ce3.tube) it3 k34_6 t34_6 [] = true := by
  decide +kernel

end PackLean.D40.Tet
