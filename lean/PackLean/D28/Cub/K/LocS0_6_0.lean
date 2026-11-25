-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Cub.K.LocG0

namespace PackLean.D28.Cub
open PackLean.D28

def root0_6 : LBox := ⟨[0, -1099511627776, -1099511627776, -1099511627776, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩
def k0_6_0 : List LBox := [root0_6]
def f0_6_0 : List LTok := [(.acc 9)]
def k0_6_1 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 6（z3=-1）の区間 0（葉 1）。 -/
theorem s0_6_0 : lsegOk P 1099511627776 (hsOfG scl0 3 (-1) Gs0) k0_6_0 f0_6_0 k0_6_1 = true := by decide +kernel

end PackLean.D28.Cub
