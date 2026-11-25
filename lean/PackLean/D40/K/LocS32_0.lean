-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey32

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t32_0 : List LTok := [(.acc 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s32_0 : lsegOk P ce3.tube (fullW P ce3.tube) it3 [⟨lo32, hi32⟩] t32_0 [] = true := by
  decide +kernel

end PackLean.D40.Tet
