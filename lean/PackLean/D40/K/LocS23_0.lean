-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey23

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t23_0 : List LTok := [.split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s23_0 : lsegOk P ce2.tube (fullW P ce2.tube) it2 [⟨lo23, hi23⟩] t23_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
