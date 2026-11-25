-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey30

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t30_45 : List LTok := [(.acc 10), .split, .split, (.acc 8), (.acc 9), .split, .split, (.acc 1), (.acc 1), (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s30_45 : lsegOk P ce3.tube (fullW P ce3.tube) it3 k30_45 t30_45 [] = true := by
  decide +kernel

end PackLean.D40.Tet
