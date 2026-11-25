-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Cub.K.LocG0

namespace PackLean.D28.Cub
open PackLean.D28

def root0_4 : LBox := ⟨[0, -1099511627776, -1099511627776, -1099511627776, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩
def k0_4_0 : List LBox := [root0_4]
def f0_4_0 : List LTok := [(.acc 2)]
def k0_4_1 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 4（z2=-1）の区間 0（葉 1）。 -/
theorem s0_4_0 : lsegOk P 1099511627776 (hsOfG scl0 2 (-1) Gs0) k0_4_0 f0_4_0 k0_4_1 = true := by decide +kernel

end PackLean.D28.Cub
