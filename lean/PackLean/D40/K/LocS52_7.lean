-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey52

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t52_105 : List LTok := [(.acc 11), (.acc 11), (.acc 11), (.acc 11), (.acc 11), (.acc 11), .split, .split, .split, .split, .split, .split, .split, .split, (.acc 11), .split, .split, .split, (.acc 13), (.acc 11), (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s52_105 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k52_105 t52_105 k52_106 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t52_106 : List LTok := [(.acc 11), (.acc 11), (.acc 11), .split, (.acc 11), (.acc 11), (.acc 11), .split, .split, .split, .split, .split, .split, .split, .split, (.acc 13), (.acc 11), .split, (.acc 13), (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s52_106 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k52_106 t52_106 k52_107 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t52_107 : List LTok := [(.acc 11), .split, .split, .split, (.acc 13), (.acc 11), .split, (.acc 13), (.acc 11), .split, .split, (.acc 13), (.acc 11), (.acc 11), (.acc 11), (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s52_107 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k52_107 t52_107 k52_108 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t52_108 : List LTok := [.split, (.acc 4), (.acc 11), (.acc 7), (.acc 11), (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s52_108 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k52_108 t52_108 [] = true := by
  decide +kernel

end PackLean.D40.Tet
