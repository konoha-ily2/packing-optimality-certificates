-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Cub.K.LocS0_1_0

namespace PackLean.D28.Cub
open PackLean.D28

def f0_1_8 : List LTok := [.split, .split, (.acc 2), .split, (.acc 9), .split, (.acc 24), (.acc 8), .split, .split, (.acc 11), (.acc 2), (.acc 8), (.acc 0), .split, .split, (.acc 2), .split, (.acc 9), .split, .split, .split, .split, (.acc 2), .split, (.acc 9), (.acc 16), .split, (.acc 2), .split, (.acc 9), (.acc 16)]
def k0_1_9 : List LBox := [⟨[962072674304, -1099511627776, -549755813888, -549755813888, 0], [1099511627776, -549755813888, 0, 0, 549755813888]⟩, ⟨[824633720832, -1099511627776, -549755813888, -549755813888, 549755813888], [1099511627776, -549755813888, 0, 0, 1099511627776]⟩, ⟨[824633720832, -549755813888, -1099511627776, -1099511627776, 0], [1099511627776, 0, 0, 0, 1099511627776]⟩, ⟨[549755813888, -1099511627776, -1099511627776, 0, -1099511627776], [1099511627776, 0, 0, 1099511627776, 1099511627776]⟩, ⟨[549755813888, -1099511627776, 0, -1099511627776, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z1=+1）の区間 8（葉 16）。 -/
theorem s0_1_8 : lsegOk P 1099511627776 (hsOfG scl0 1 (1) Gs0) k0_1_8 f0_1_8 k0_1_9 = true := by decide +kernel

def f0_1_9 : List LTok := [.split, .split, (.acc 2), .split, (.acc 9), (.acc 16), .split, (.acc 2), .split, (.acc 9), (.acc 16), (.acc 0), .split, (.acc 2), .split, (.acc 9), .split, .split, .split, .split, (.acc 2), .split, (.acc 9), .split, (.acc 26), (.acc 8), .split, .split, (.acc 11), (.acc 2), (.acc 8)]
def k0_1_10 : List LBox := [⟨[962072674304, -549755813888, -549755813888, -549755813888, 0], [1099511627776, 0, 0, 0, 549755813888]⟩, ⟨[824633720832, -549755813888, -549755813888, -549755813888, 549755813888], [1099511627776, 0, 0, 0, 1099511627776]⟩, ⟨[549755813888, -1099511627776, -1099511627776, 0, -1099511627776], [1099511627776, 0, 0, 1099511627776, 1099511627776]⟩, ⟨[549755813888, -1099511627776, 0, -1099511627776, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z1=+1）の区間 9（葉 16）。 -/
theorem s0_1_9 : lsegOk P 1099511627776 (hsOfG scl0 1 (1) Gs0) k0_1_9 f0_1_9 k0_1_10 = true := by decide +kernel

def f0_1_10 : List LTok := [.split, .split, (.acc 2), .split, (.acc 9), .split, (.acc 24), (.acc 8), .split, .split, (.acc 11), (.acc 2), (.acc 8), (.acc 0), .split, (.acc 18), .split, .split, .split, (.acc 2), (.acc 16), .split, (.acc 2), .split, (.acc 16), (.acc 20), .split, .split, (.acc 2), (.acc 16)]
def k0_1_11 : List LBox := [⟨[824633720832, -549755813888, -1099511627776, 0, 0], [1099511627776, 0, 0, 1099511627776, 1099511627776]⟩, ⟨[549755813888, -1099511627776, 0, -1099511627776, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z1=+1）の区間 10（葉 16）。 -/
theorem s0_1_10 : lsegOk P 1099511627776 (hsOfG scl0 1 (1) Gs0) k0_1_10 f0_1_10 k0_1_11 = true := by decide +kernel

def f0_1_11 : List LTok := [.split, (.acc 2), .split, .split, (.acc 16), (.acc 0), (.acc 20), .split, .split, (.acc 29), .split, .split, .split, .split, (.acc 9), .split, (.acc 25), .split, .split, .split, (.acc 0), (.acc 24), (.acc 8), .split, .split, (.acc 0), (.acc 24), (.acc 8), (.acc 25), .split, .split, (.acc 9), .split, (.acc 25)]
def k0_1_12 : List LBox := [⟨[549755813888, -549755813888, 0, -549755813888, 549755813888], [824633720832, 0, 549755813888, 0, 1099511627776]⟩, ⟨[549755813888, -549755813888, 549755813888, -1099511627776, 0], [824633720832, 0, 1099511627776, 0, 1099511627776]⟩, ⟨[824633720832, -1099511627776, 0, -1099511627776, 0], [1099511627776, 0, 1099511627776, 0, 1099511627776]⟩, ⟨[549755813888, -1099511627776, 0, 0, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z1=+1）の区間 11（葉 16）。 -/
theorem s0_1_11 : lsegOk P 1099511627776 (hsOfG scl0 1 (1) Gs0) k0_1_11 f0_1_11 k0_1_12 = true := by decide +kernel

def f0_1_12 : List LTok := [(.acc 8), (.acc 25), .split, .split, .split, (.acc 9), .split, (.acc 24), .split, .split, .split, (.acc 0), (.acc 24), (.acc 8), .split, .split, (.acc 0), (.acc 24), (.acc 8), (.acc 25), .split, .split, (.acc 9), .split, (.acc 25), (.acc 8), (.acc 25), .split, (.acc 28)]
def k0_1_13 : List LBox := [⟨[549755813888, -1099511627776, 0, 0, 0], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z1=+1）の区間 12（葉 16）。 -/
theorem s0_1_12 : lsegOk P 1099511627776 (hsOfG scl0 1 (1) Gs0) k0_1_12 f0_1_12 k0_1_13 = true := by decide +kernel

def f0_1_13 : List LTok := [(.acc 16)]
def k0_1_14 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z1=+1）の区間 13（葉 1）。 -/
theorem s0_1_13 : lsegOk P 1099511627776 (hsOfG scl0 1 (1) Gs0) k0_1_13 f0_1_13 k0_1_14 = true := by decide +kernel

end PackLean.D28.Cub
