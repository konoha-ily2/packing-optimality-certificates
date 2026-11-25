-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey63

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t63_0 : List LTok := [(.acc 16)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s63_0 : lsegOk P ce6.tube (fullW P ce6.tube) it6 [⟨lo63, hi63⟩] t63_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
