-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey50

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t50_120 : List LTok := [(.acc 11), .split, .split, (.acc 13), (.acc 11), .split, (.acc 13), (.acc 11), .split, .split, .split, (.acc 13), (.acc 11), .split, (.acc 13), (.acc 11), .split, .split, (.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s50_120 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k50_120 t50_120 k50_121 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t50_121 : List LTok := [(.acc 11), .split, (.acc 13), (.acc 11), (.acc 11), .split, (.acc 13), .split, (.acc 13), (.acc 11), .split, .split, (.acc 13), .split, .split, .split, .split, .split, (.acc 13), (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s50_121 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k50_121 t50_121 k50_122 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t50_122 : List LTok := [.split, (.acc 13), (.acc 11), .split, .split, (.acc 13), (.acc 11), .split, (.acc 13), (.acc 11), .split, .split, .split, (.acc 13), (.acc 11), .split, (.acc 13), (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s50_122 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k50_122 t50_122 k50_123 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t50_123 : List LTok := [.split, .split, (.acc 13), (.acc 11), .split, (.acc 13), (.acc 11), (.acc 11), .split, (.acc 13), .split, (.acc 13), (.acc 11), (.acc 11), .split, (.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s50_123 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k50_123 t50_123 k50_124 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t50_124 : List LTok := [.split, .split, .split, .split, .split, (.acc 13), .split, (.acc 13), (.acc 11), (.acc 13), .split, (.acc 13), (.acc 13), .split, .split, .split, (.acc 13), .split, (.acc 13), (.acc 11), (.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s50_124 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k50_124 t50_124 k50_125 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t50_125 : List LTok := [.split, .split, (.acc 13), (.acc 13), (.acc 13), (.acc 11), .split, .split, .split, .split, .split, (.acc 2), (.acc 0), (.acc 2), .split, .split, (.acc 2), (.acc 0), (.acc 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s50_125 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k50_125 t50_125 k50_126 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t50_126 : List LTok := [.split, .split, .split, (.acc 2), (.acc 0), (.acc 2), .split, .split, (.acc 2), (.acc 0), (.acc 2), .split, .split, .split, (.acc 11), .split, (.acc 7), (.acc 11), (.acc 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s50_126 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k50_126 t50_126 k50_127 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t50_127 : List LTok := [.split, .split, (.acc 7), .split, .split, (.acc 4), (.acc 11), (.acc 11), (.acc 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s50_127 : lsegOk P ce5.tube (fullW P ce5.tube) it5 k50_127 t50_127 [] = true := by
  decide +kernel

end PackLean.D40.Tet
