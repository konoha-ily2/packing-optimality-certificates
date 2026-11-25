-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey43

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t43_0 : List LTok := [.split, .split, .split, (.acc 11), .split, .split, .split, .split, (.acc 5), .split, (.acc 11), (.acc 1), .split, (.acc 5), .split, (.acc 11), (.acc 1), .split, .split, (.acc 5), .split, (.acc 11), (.acc 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s43_0 : lsegOk P ce4.tube (fullW P ce4.tube) it4 [⟨lo43, hi43⟩] t43_0 k43_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t43_1 : List LTok := [.split, (.acc 5), .split, (.acc 11), (.acc 1), .split, .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, (.acc 5), .split, (.acc 11), (.acc 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s43_1 : lsegOk P ce4.tube (fullW P ce4.tube) it4 k43_1 t43_1 k43_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t43_2 : List LTok := [.split, .split, (.acc 5), .split, (.acc 11), (.acc 1), .split, (.acc 5), .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 0), .split, .split, (.acc 11), .split, .split, .split, .split, .split, (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s43_2 : lsegOk P ce4.tube (fullW P ce4.tube) it4 k43_2 t43_2 k43_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t43_3 : List LTok := [(.acc 1), .split, (.acc 11), (.acc 1), .split, (.acc 5), .split, (.acc 11), (.acc 1), .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s43_3 : lsegOk P ce4.tube (fullW P ce4.tube) it4 k43_3 t43_3 k43_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t43_4 : List LTok := [.split, (.acc 5), .split, (.acc 11), (.acc 1), .split, .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, .split, (.acc 11), (.acc 1), .split, (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s43_4 : lsegOk P ce4.tube (fullW P ce4.tube) it4 k43_4 t43_4 k43_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t43_5 : List LTok := [(.acc 1), .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, (.acc 5), .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 0)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s43_5 : lsegOk P ce4.tube (fullW P ce4.tube) it4 k43_5 t43_5 [] = true := by
  decide +kernel

end PackLean.D40.Tet
