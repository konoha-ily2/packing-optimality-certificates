-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Cub.K.LocS0_0_5

namespace PackLean.D28.Cub
open PackLean.D28

def f0_0_48 : List LTok := [(.acc 17), (.acc 17), .split, .split, .split, (.acc 9), (.acc 17), (.acc 17), (.acc 17), (.acc 1), .split, (.acc 9), (.acc 17), .split, .split, (.acc 9), .split, (.acc 17), .split, .split, (.acc 1), .split, (.acc 0), (.acc 17), .split, (.acc 1), .split, (.acc 0)]
def k0_0_49 : List LBox := [⟨[687194767360, 824633720832, 274877906944, -549755813888, 549755813888], [824633720832, 1099511627776, 549755813888, 0, 1099511627776]⟩, ⟨[549755813888, 549755813888, 549755813888, -1099511627776, 0], [824633720832, 1099511627776, 1099511627776, 0, 1099511627776]⟩, ⟨[824633720832, 0, 0, -1099511627776, 0], [1099511627776, 1099511627776, 1099511627776, 0, 1099511627776]⟩, ⟨[549755813888, 0, 0, 0, -1099511627776], [1099511627776, 1099511627776, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 0（z0=-1）の区間 48（葉 16）。 -/
theorem s0_0_48 : lsegOk P 1099511627776 (hsOfG scl0 0 (-1) Gs0) k0_0_48 f0_0_48 k0_0_49 = true := by decide +kernel

def f0_0_49 : List LTok := [(.acc 17), .split, (.acc 25), (.acc 24), .split, .split, .split, (.acc 9), .split, .split, .split, .split, .split, (.acc 9), (.acc 17), (.acc 17), (.acc 17), .split, .split, .split, (.acc 9), (.acc 17), (.acc 17), (.acc 17), (.acc 1), .split, (.acc 9), (.acc 17), .split, .split, (.acc 9)]
def k0_0_50 : List LBox := [⟨[824633720832, 549755813888, 0, -549755813888, 0], [1099511627776, 1099511627776, 549755813888, 0, 1099511627776]⟩, ⟨[824633720832, 549755813888, 549755813888, -1099511627776, 0], [1099511627776, 1099511627776, 1099511627776, 0, 1099511627776]⟩, ⟨[549755813888, 0, 0, 0, -1099511627776], [1099511627776, 1099511627776, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 0（z0=-1）の区間 49（葉 16）。 -/
theorem s0_0_49 : lsegOk P 1099511627776 (hsOfG scl0 0 (-1) Gs0) k0_0_49 f0_0_49 k0_0_50 = true := by decide +kernel

def f0_0_50 : List LTok := [.split, (.acc 17), .split, .split, (.acc 1), .split, (.acc 0), (.acc 17), .split, .split, (.acc 0), (.acc 17), .split, (.acc 0), (.acc 17), .split, (.acc 25), (.acc 24), .split, (.acc 21), (.acc 16)]
def k0_0_51 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 0（z0=-1）の区間 50（葉 12）。 -/
theorem s0_0_50 : lsegOk P 1099511627776 (hsOfG scl0 0 (-1) Gs0) k0_0_50 f0_0_50 k0_0_51 = true := by decide +kernel

end PackLean.D28.Cub
