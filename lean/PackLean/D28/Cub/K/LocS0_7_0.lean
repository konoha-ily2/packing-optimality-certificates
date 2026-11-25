-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Cub.K.LocG0

namespace PackLean.D28.Cub
open PackLean.D28

def root0_7 : LBox := ⟨[0, -1099511627776, -1099511627776, -1099511627776, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩
def k0_7_0 : List LBox := [root0_7]
def f0_7_0 : List LTok := [.split, .split, (.acc 0), .split, (.acc 0), .split, (.acc 1), (.acc 4), .split, .split, (.acc 0), .split, (.acc 1), (.acc 4), .split, (.acc 0), .split, .split, .split, (.acc 1), (.acc 8), .split, .split, (.acc 1), .split, (.acc 1), .split, (.acc 9), (.acc 24), .split, (.acc 1), (.acc 8)]
def k0_7_1 : List LBox := [⟨[549755813888, -1099511627776, 0, 0, 0], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 7（z4=+1）の区間 0（葉 16）。 -/
theorem s0_7_0 : lsegOk P 1099511627776 (hsOfG scl0 4 (1) Gs0) k0_7_0 f0_7_0 k0_7_1 = true := by decide +kernel

def f0_7_1 : List LTok := [.split, (.acc 4), .split, (.acc 16), .split, (.acc 4), (.acc 16)]
def k0_7_2 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 7（z4=+1）の区間 1（葉 4）。 -/
theorem s0_7_1 : lsegOk P 1099511627776 (hsOfG scl0 4 (1) Gs0) k0_7_1 f0_7_1 k0_7_2 = true := by decide +kernel

end PackLean.D28.Cub
