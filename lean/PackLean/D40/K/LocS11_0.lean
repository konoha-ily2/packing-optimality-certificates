-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey11

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t11_0 : List LTok := [.split, .split, .split, (.acc 0), (.acc 12), .split, (.acc 0), (.acc 12), .split, .split, (.acc 0), (.acc 12), .split, (.acc 0), (.acc 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s11_0 : lsegOk P ce1.tube (fullW P ce1.tube) it1 [⟨lo11, hi11⟩] t11_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
