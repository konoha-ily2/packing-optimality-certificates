-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Ico.K.LocG0

namespace PackLean.D28.Ico
open PackLean.D28

def root0_8 : LBox := ⟨[0, -1099511627776, -1099511627776, -1099511627776, -1099511627776], [1099511627776, 1099511627776, 1099511627776, 1099511627776, 1099511627776]⟩
def k0_8_0 : List LBox := [root0_8]
def f0_8_0 : List LTok := [.split, .split, .split, (.acc 24), (.acc 78), (.acc 48), .split, .split, (.acc 24), .split, (.acc 24), (.acc 75), .split, .split, (.acc 24), (.acc 48), .split, (.acc 24), (.acc 48)]
def k0_8_1 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 8（z4=+1）の区間 0（葉 10）。 -/
theorem s0_8_0 : lsegOk P 1099511627776 (hsOfG scl0 4 (1) Gs0) k0_8_0 f0_8_0 k0_8_1 = true := by decide +kernel

end PackLean.D28.Ico
