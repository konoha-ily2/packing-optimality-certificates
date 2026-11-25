-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey04

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t04_0 : List LTok := [.split, .split, .split, (.acc 10), (.acc 1), .split, (.acc 10), (.acc 1), .split, .split, (.acc 10), (.acc 1), .split, (.acc 10), (.acc 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s04_0 : lsegOk P ce0.tube (fullW P ce0.tube) it0 [⟨lo04, hi04⟩] t04_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
