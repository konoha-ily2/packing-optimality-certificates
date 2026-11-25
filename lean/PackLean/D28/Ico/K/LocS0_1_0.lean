-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Ico.K.LocG0

namespace PackLean.D28.Ico
open PackLean.D28

def root0_1 : LBox := ⟨[0, -1099511627776, -1099511627776, -1099511627776, -1099511627776], [1099511627776, 1099511627776, 1099511627776, 1099511627776, 1099511627776]⟩
def k0_1_0 : List LBox := [root0_1]
def f0_1_0 : List LTok := [.split, .split, .split, .split, .split, (.acc 2), (.acc 24), .split, (.acc 10), (.acc 19), .split, .split, .split, (.acc 56), (.acc 56), .split, (.acc 60), .split, (.acc 6), (.acc 60), .split, .split, (.acc 66), (.acc 68), (.acc 3), .split, .split, .split, .split, .split, (.acc 2), (.acc 74), .split, (.acc 2), (.acc 74)]
def k0_1_1 : List LBox := [⟨[0, 0, -1099511627776, -1099511627776, 0], [549755813888, 1099511627776, 0, 0, 1099511627776]⟩, ⟨[0, 0, -1099511627776, 0, -1099511627776], [549755813888, 1099511627776, 0, 1099511627776, 1099511627776]⟩, ⟨[0, 0, 0, -1099511627776, -1099511627776], [549755813888, 1099511627776, 1099511627776, 1099511627776, 1099511627776]⟩, ⟨[549755813888, -1099511627776, -1099511627776, -1099511627776, -1099511627776], [1099511627776, 1099511627776, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z0=-1）の区間 0（葉 16）。 -/
theorem s0_1_0 : lsegOk P 1099511627776 (hsOfG scl0 0 (-1) Gs0) k0_1_0 f0_1_0 k0_1_1 = true := by decide +kernel

def f0_1_1 : List LTok := [.split, (.acc 26), (.acc 26), .split, (.acc 64), .split, (.acc 19), (.acc 19), .split, (.acc 60), (.acc 66), .split, .split, .split, .split, (.acc 2), (.acc 24), .split, (.acc 10), (.acc 19), .split, .split, .split, (.acc 56), (.acc 56), .split, .split, (.acc 6), (.acc 60), .split, (.acc 6)]
def k0_1_2 : List LBox := [⟨[824633720832, -549755813888, 0, -1099511627776, 0], [1099511627776, 0, 1099511627776, 0, 1099511627776]⟩, ⟨[549755813888, -1099511627776, 0, 0, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩, ⟨[549755813888, 0, -1099511627776, -1099511627776, -1099511627776], [1099511627776, 1099511627776, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z0=-1）の区間 1（葉 16）。 -/
theorem s0_1_1 : lsegOk P 1099511627776 (hsOfG scl0 0 (-1) Gs0) k0_1_1 f0_1_1 k0_1_2 = true := by decide +kernel

def f0_1_2 : List LTok := [(.acc 60), .split, .split, .split, (.acc 68), (.acc 66), .split, (.acc 68), (.acc 66), (.acc 3), .split, .split, .split, .split, .split, .split, (.acc 20), .split, (.acc 35), .split, (.acc 65), (.acc 2), (.acc 74), .split, .split, (.acc 20), .split, (.acc 35), .split, (.acc 65), (.acc 2), (.acc 74)]
def k0_1_3 : List LBox := [⟨[549755813888, 0, -1099511627776, -1099511627776, 0], [1099511627776, 1099511627776, 0, 0, 1099511627776]⟩, ⟨[549755813888, 0, -1099511627776, 0, -1099511627776], [1099511627776, 1099511627776, 0, 1099511627776, 1099511627776]⟩, ⟨[549755813888, 0, 0, -1099511627776, -1099511627776], [1099511627776, 1099511627776, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z0=-1）の区間 2（葉 16）。 -/
theorem s0_1_2 : lsegOk P 1099511627776 (hsOfG scl0 0 (-1) Gs0) k0_1_2 f0_1_2 k0_1_3 = true := by decide +kernel

def f0_1_3 : List LTok := [.split, .split, (.acc 26), .split, (.acc 25), (.acc 26), .split, (.acc 26), .split, (.acc 25), (.acc 26), .split, (.acc 64), .split, (.acc 25), (.acc 25), .split, .split, (.acc 56), (.acc 60), (.acc 66)]
def k0_1_4 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z0=-1）の区間 3（葉 12）。 -/
theorem s0_1_3 : lsegOk P 1099511627776 (hsOfG scl0 0 (-1) Gs0) k0_1_3 f0_1_3 k0_1_4 = true := by decide +kernel

end PackLean.D28.Ico
