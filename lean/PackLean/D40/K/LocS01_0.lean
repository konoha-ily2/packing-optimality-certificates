-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey01

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t01_0 : List LTok := [.split, .split, .split, (.acc 0), (.acc 9), .split, (.acc 0), (.acc 9), .split, .split, (.acc 0), (.acc 9), .split, (.acc 0), (.acc 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s01_0 : lsegOk P ce0.tube (fullW P ce0.tube) it0 [⟨lo01, hi01⟩] t01_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
