-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey41

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t41_15 : List LTok := [.split, (.acc 10), (.acc 12), .split, .split, (.acc 10), (.acc 12), .split, (.acc 10), (.acc 12), (.acc 10), (.acc 12), (.acc 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s41_15 : lsegOk P ce4.tube (fullW P ce4.tube) it4 k41_15 t41_15 [] = true := by
  decide +kernel

end PackLean.D40.Tet
