-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey37

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t37_0 : List LTok := [.split, .split, .split, (.acc 12), (.acc 1), .split, (.acc 12), (.acc 1), .split, .split, (.acc 12), (.acc 1), .split, (.acc 12), (.acc 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s37_0 : lsegOk P ce3.tube (fullW P ce3.tube) it3 [⟨lo37, hi37⟩] t37_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
