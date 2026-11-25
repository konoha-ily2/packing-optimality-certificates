-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey53

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t53_0 : List LTok := [(.acc 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s53_0 : lsegOk P ce5.tube (fullW P ce5.tube) it5 [⟨lo53, hi53⟩] t53_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
