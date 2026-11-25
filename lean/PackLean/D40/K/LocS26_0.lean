-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey26

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t26_0 : List LTok := [.split, .split, (.acc 2), (.acc 12), .split, (.acc 2), (.acc 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s26_0 : lsegOk P ce2.tube (fullW P ce2.tube) it2 [⟨lo26, hi26⟩] t26_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
