-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey54

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t54_0 : List LTok := [.split, .split, .split, (.acc 0), (.acc 11), .split, (.acc 0), (.acc 11), .split, .split, (.acc 0), (.acc 11), .split, (.acc 0), (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s54_0 : lsegOk P ce5.tube (fullW P ce5.tube) it5 [⟨lo54, hi54⟩] t54_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
