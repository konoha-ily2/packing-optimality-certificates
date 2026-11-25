-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey00

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t00_150 : List LTok := [(.acc 9), .split, .split, .split, (.acc 9), .split, .split, (.acc 9), .split, (.acc 11), (.acc 9), .split, (.acc 9), .split, (.acc 11), (.acc 9), (.acc 9), (.acc 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s00_150 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k00_150 t00_150 k00_151 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t00_151 : List LTok := [.split, .split, (.acc 9), (.acc 9), .split, .split, .split, (.acc 9), .split, .split, (.acc 9), .split, (.acc 11), (.acc 9), .split, (.acc 9), .split, (.acc 11), (.acc 9), (.acc 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s00_151 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k00_151 t00_151 k00_152 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t00_152 : List LTok := [(.acc 9), (.acc 9), (.acc 9), .split, .split, .split, .split, (.acc 9), (.acc 9), (.acc 9), (.acc 9), .split, .split, .split, (.acc 9), .split, .split, .split, (.acc 9), (.acc 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s00_152 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k00_152 t00_152 k00_153 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t00_153 : List LTok := [.split, .split, .split, (.acc 9), .split, .split, (.acc 9), .split, (.acc 11), (.acc 9), (.acc 12), (.acc 9), (.acc 9), (.acc 12), (.acc 9), (.acc 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s00_153 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k00_153 t00_153 [] = true := by
  decide +kernel

end PackLean.D40.Tet
