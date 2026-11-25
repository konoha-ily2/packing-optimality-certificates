-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey36

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t36_0 : List LTok := [(.acc 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s36_0 : lsegOk P ce3.tube (fullW P ce3.tube) it3 [⟨lo36, hi36⟩] t36_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
