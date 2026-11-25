-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey62

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t62_0 : List LTok := [.split, .split, .split, (.acc 24), (.acc 23), .split, (.acc 24), (.acc 23), .split, .split, (.acc 24), (.acc 23), .split, (.acc 24), (.acc 23)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s62_0 : lsegOk P ce6.tube (fullW P ce6.tube) it6 [⟨lo62, hi62⟩] t62_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
