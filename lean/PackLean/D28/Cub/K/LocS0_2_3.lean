-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Cub.K.LocS0_2_2

namespace PackLean.D28.Cub
open PackLean.D28

def f0_2_24 : List LTok := [(.acc 21), .split, .split, (.acc 7), (.acc 22), (.acc 21), (.acc 22), (.acc 21), .split, .split, .split, (.acc 23), .split, .split, .split, .split, (.acc 7), (.acc 22), (.acc 21), .split, .split, (.acc 7), (.acc 22), (.acc 21), .split, .split, .split, (.acc 7), (.acc 22), (.acc 21)]
def k0_2_25 : List LBox := [⟨[962072674304, -274877906944, 0, 0, -549755813888], [1099511627776, 0, 549755813888, 549755813888, 0]⟩, ⟨[824633720832, -549755813888, 0, 549755813888, -1099511627776], [1099511627776, 0, 549755813888, 1099511627776, 0]⟩, ⟨[824633720832, -549755813888, 549755813888, 0, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 0]⟩, ⟨[549755813888, -1099511627776, 0, 0, 0], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 2（z1=-1）の区間 24（葉 16）。 -/
theorem s0_2_24 : lsegOk P 1099511627776 (hsOfG scl0 1 (-1) Gs0) k0_2_24 f0_2_24 k0_2_25 = true := by decide +kernel

def f0_2_25 : List LTok := [.split, .split, (.acc 7), (.acc 22), (.acc 21), (.acc 22), (.acc 21), .split, .split, .split, (.acc 4), .split, .split, (.acc 20), (.acc 4), (.acc 20), .split, (.acc 4), .split, (.acc 5), (.acc 20), .split, .split, (.acc 4), .split, .split, (.acc 20), (.acc 4), (.acc 20)]
def k0_2_26 : List LBox := [⟨[824633720832, -549755813888, 0, 0, 0], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 2（z1=-1）の区間 25（葉 16）。 -/
theorem s0_2_25 : lsegOk P 1099511627776 (hsOfG scl0 1 (-1) Gs0) k0_2_25 f0_2_25 k0_2_26 = true := by decide +kernel

def f0_2_26 : List LTok := [.split, (.acc 4), .split, (.acc 5), (.acc 20)]
def k0_2_27 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 2（z1=-1）の区間 26（葉 3）。 -/
theorem s0_2_26 : lsegOk P 1099511627776 (hsOfG scl0 1 (-1) Gs0) k0_2_26 f0_2_26 k0_2_27 = true := by decide +kernel

end PackLean.D28.Cub
