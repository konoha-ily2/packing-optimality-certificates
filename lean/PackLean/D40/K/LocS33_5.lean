-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey33

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t33_75 : List LTok := [(.acc 10), (.acc 2), .split, .split, (.acc 1), (.acc 10), (.acc 6), .split, .split, .split, .split, (.acc 1), (.acc 10), (.acc 2), .split, .split, (.acc 1), (.acc 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s33_75 : lsegOk P ce3.tube (fullW P ce3.tube) it3 k33_75 t33_75 k33_76 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t33_76 : List LTok := [(.acc 2), .split, .split, .split, (.acc 1), (.acc 10), (.acc 2), .split, .split, (.acc 1), (.acc 10), (.acc 6), (.acc 0), (.acc 0), (.acc 0)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s33_76 : lsegOk P ce3.tube (fullW P ce3.tube) it3 k33_76 t33_76 k33_77 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t33_77 : List LTok := [.split, .split, .split, .split, (.acc 1), .split, .split, .split, .split, .split, (.acc 1), (.acc 10), (.acc 2), .split, .split, (.acc 1), (.acc 10), (.acc 2), .split, .split, .split, (.acc 1), (.acc 10), (.acc 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s33_77 : lsegOk P ce3.tube (fullW P ce3.tube) it3 k33_77 t33_77 k33_78 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t33_78 : List LTok := [.split, .split, (.acc 1), (.acc 10), (.acc 6), .split, .split, .split, .split, (.acc 1), (.acc 10), (.acc 2), .split, .split, (.acc 1), (.acc 10), (.acc 2), .split, .split, .split, (.acc 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s33_78 : lsegOk P ce3.tube (fullW P ce3.tube) it3 k33_78 t33_78 k33_79 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t33_79 : List LTok := [(.acc 10), (.acc 2), .split, .split, (.acc 1), (.acc 10), (.acc 2), (.acc 0), (.acc 0), (.acc 0), (.acc 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s33_79 : lsegOk P ce3.tube (fullW P ce3.tube) it3 k33_79 t33_79 [] = true := by
  decide +kernel

end PackLean.D40.Tet
