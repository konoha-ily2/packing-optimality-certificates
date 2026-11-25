-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey64

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t64_0 : List LTok := [.split, .split, .split, (.acc 6), (.acc 12), .split, (.acc 6), (.acc 12), .split, .split, (.acc 6), (.acc 12), .split, (.acc 6), (.acc 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s64_0 : lsegOk P ce6.tube (fullW P ce6.tube) it6 [⟨lo64, hi64⟩] t64_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
