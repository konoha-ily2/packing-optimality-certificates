-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey12

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t12_0 : List LTok := [(.acc 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s12_0 : lsegOk P ce1.tube (fullW P ce1.tube) it1 [⟨lo12, hi12⟩] t12_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
