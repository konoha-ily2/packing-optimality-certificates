-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Ico.K.LocS0_0_4

namespace PackLean.D28.Ico
open PackLean.D28

def f0_0_40 : List LTok := [.split, .split, (.acc 39), (.acc 57), .split, .split, .split, .split, .split, (.acc 39), .split, (.acc 39), (.acc 57), .split, (.acc 39), .split, (.acc 39), (.acc 57), (.acc 48), (.acc 66), (.acc 57)]
def k0_0_41 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 0（z0=+1）の区間 40（葉 11）。 -/
theorem s0_0_40 : lsegOk P 1099511627776 (hsOfG scl0 0 (1) Gs0) k0_0_40 f0_0_40 k0_0_41 = true := by decide +kernel

end PackLean.D28.Ico
