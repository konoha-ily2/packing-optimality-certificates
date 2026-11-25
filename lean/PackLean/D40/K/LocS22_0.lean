-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey22

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t22_0 : List LTok := [(.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s22_0 : lsegOk P ce2.tube (fullW P ce2.tube) it2 [⟨lo22, hi22⟩] t22_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
