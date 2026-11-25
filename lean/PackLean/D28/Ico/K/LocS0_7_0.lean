-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Ico.K.LocG0

namespace PackLean.D28.Ico
open PackLean.D28

def root0_7 : LBox := ⟨[0, -1099511627776, -1099511627776, -1099511627776, -1099511627776], [1099511627776, 1099511627776, 1099511627776, 1099511627776, 1099511627776]⟩
def k0_7_0 : List LBox := [root0_7]
def f0_7_0 : List LTok := [.split, (.acc 35), .split, (.acc 53), (.acc 53)]
def k0_7_1 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 7（z3=-1）の区間 0（葉 3）。 -/
theorem s0_7_0 : lsegOk P 1099511627776 (hsOfG scl0 3 (-1) Gs0) k0_7_0 f0_7_0 k0_7_1 = true := by decide +kernel

end PackLean.D28.Ico
