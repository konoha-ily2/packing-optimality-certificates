-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Ico.K.LocG0

namespace PackLean.D28.Ico
open PackLean.D28

def root0_9 : LBox := ⟨[0, -1099511627776, -1099511627776, -1099511627776, -1099511627776], [1099511627776, 1099511627776, 1099511627776, 1099511627776, 1099511627776]⟩
def k0_9_0 : List LBox := [root0_9]
def f0_9_0 : List LTok := [.split, .split, .split, .split, .split, (.acc 38), (.acc 10), .split, (.acc 56), (.acc 65), .split, .split, (.acc 38), (.acc 64), (.acc 56), .split, .split, (.acc 37), .split, (.acc 29), (.acc 65), .split, (.acc 37), .split, (.acc 29), (.acc 65), .split, .split, .split, .split, (.acc 38), (.acc 10), .split, (.acc 56)]
def k0_9_1 : List LBox := [⟨[549755813888, -1099511627776, -1099511627776, 0, 0], [1099511627776, 0, 0, 1099511627776, 1099511627776]⟩, ⟨[549755813888, -1099511627776, 0, -1099511627776, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩, ⟨[549755813888, 0, -1099511627776, -1099511627776, -1099511627776], [1099511627776, 1099511627776, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 9（z4=-1）の区間 0（葉 16）。 -/
theorem s0_9_0 : lsegOk P 1099511627776 (hsOfG scl0 4 (-1) Gs0) k0_9_0 f0_9_0 k0_9_1 = true := by decide +kernel

def f0_9_1 : List LTok := [(.acc 65), .split, .split, (.acc 38), (.acc 64), (.acc 56), .split, .split, (.acc 37), .split, (.acc 29), (.acc 65), .split, (.acc 37), .split, (.acc 29), (.acc 65)]
def k0_9_2 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 9（z4=-1）の区間 1（葉 10）。 -/
theorem s0_9_1 : lsegOk P 1099511627776 (hsOfG scl0 4 (-1) Gs0) k0_9_1 f0_9_1 k0_9_2 = true := by decide +kernel

end PackLean.D28.Ico
