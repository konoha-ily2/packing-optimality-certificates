-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey14

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t14_0 : List LTok := [.split, .split, .split, (.acc 15), (.acc 3), .split, (.acc 15), (.acc 3), .split, .split, (.acc 15), (.acc 3), .split, (.acc 15), (.acc 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s14_0 : lsegOk P ce1.tube (fullW P ce1.tube) it1 [⟨lo14, hi14⟩] t14_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
