-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey47

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t47_0 : List LTok := [(.acc 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s47_0 : lsegOk P ce4.tube (fullW P ce4.tube) it4 [⟨lo47, hi47⟩] t47_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
