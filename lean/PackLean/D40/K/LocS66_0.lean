-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey66

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t66_0 : List LTok := [(.acc 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s66_0 : lsegOk P ce6.tube (fullW P ce6.tube) it6 [⟨lo66, hi66⟩] t66_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
