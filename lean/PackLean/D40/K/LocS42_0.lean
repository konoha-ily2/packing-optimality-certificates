-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey42

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t42_0 : List LTok := [(.acc 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s42_0 : lsegOk P ce4.tube (fullW P ce4.tube) it4 [⟨lo42, hi42⟩] t42_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
