-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Ico.K.LocG0

namespace PackLean.D28.Ico
open PackLean.D28

def root0_5 : LBox := ⟨[0, -1099511627776, -1099511627776, -1099511627776, -1099511627776], [1099511627776, 1099511627776, 1099511627776, 1099511627776, 1099511627776]⟩
def k0_5_0 : List LBox := [root0_5]
def f0_5_0 : List LTok := [.split, .split, (.acc 19), .split, .split, (.acc 52), (.acc 10), .split, (.acc 52), (.acc 10), .split, .split, (.acc 19), .split, (.acc 46), (.acc 10), .split, .split, (.acc 52), (.acc 10), .split, (.acc 52), (.acc 16)]
def k0_5_1 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 5（z2=-1）の区間 0（葉 12）。 -/
theorem s0_5_0 : lsegOk P 1099511627776 (hsOfG scl0 2 (-1) Gs0) k0_5_0 f0_5_0 k0_5_1 = true := by decide +kernel

end PackLean.D28.Ico
