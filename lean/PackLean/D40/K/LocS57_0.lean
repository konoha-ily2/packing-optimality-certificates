-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey57

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t57_0 : List LTok := [.split, .split, .split, (.acc 14), .split, .split, .split, .split, (.acc 6), .split, (.acc 14), (.acc 3), .split, (.acc 6), .split, (.acc 14), (.acc 3), .split, .split, (.acc 6), .split, (.acc 14), (.acc 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s57_0 : lsegOk P ce5.tube (fullW P ce5.tube) it5 [⟨lo57, hi57⟩] t57_0 k57_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t57_1 : List LTok := [.split, (.acc 6), .split, (.acc 14), (.acc 3), .split, .split, .split, .split, (.acc 14), (.acc 3), .split, (.acc 14), (.acc 3), .split, .split, (.acc 14), (.acc 3), .split, (.acc 14)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s57_1 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k57_1 t57_1 k57_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t57_2 : List LTok := [(.acc 3), .split, .split, .split, (.acc 14), (.acc 3), .split, (.acc 14), (.acc 3), .split, (.acc 6), .split, (.acc 14), (.acc 3), .split, (.acc 14), (.acc 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s57_2 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k57_2 t57_2 k57_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t57_3 : List LTok := [.split, .split, (.acc 14), .split, .split, .split, .split, .split, (.acc 14), (.acc 3), .split, (.acc 14), (.acc 3), .split, .split, (.acc 14), (.acc 3), .split, (.acc 14), (.acc 3), .split, .split, .split, (.acc 14)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s57_3 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k57_3 t57_3 k57_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t57_4 : List LTok := [(.acc 3), .split, (.acc 14), (.acc 3), .split, .split, (.acc 14), (.acc 3), .split, (.acc 14), (.acc 3), .split, .split, .split, .split, (.acc 14), (.acc 3), .split, (.acc 14)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s57_4 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k57_4 t57_4 k57_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t57_5 : List LTok := [(.acc 3), .split, .split, (.acc 14), (.acc 3), .split, (.acc 14), (.acc 3), .split, .split, .split, (.acc 14), (.acc 3), .split, (.acc 14), (.acc 3), .split, .split, (.acc 14)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s57_5 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k57_5 t57_5 k57_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t57_6 : List LTok := [(.acc 3), .split, (.acc 14), (.acc 3), .split, (.acc 14), (.acc 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s57_6 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k57_6 t57_6 [] = true := by
  decide +kernel

end PackLean.D40.Tet
