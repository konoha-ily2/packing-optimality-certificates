-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey65

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t65_0 : List LTok := [(.acc 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s65_0 : lsegOk P ce6.tube (fullW P ce6.tube) it6 [⟨lo65, hi65⟩] t65_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
