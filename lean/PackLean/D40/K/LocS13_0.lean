-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey13

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t13_0 : List LTok := [(.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s13_0 : lsegOk P ce1.tube (fullW P ce1.tube) it1 [⟨lo13, hi13⟩] t13_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
