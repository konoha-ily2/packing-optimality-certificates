-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Cub.K.LocS1_1_0

namespace PackLean.D28.Cub
open PackLean.D28

def f1_1_8 : List LTok := [.split, (.acc 11), (.acc 26), .split, .split, (.acc 9), .split, (.acc 24), (.acc 0), .split, (.acc 11), (.acc 26), (.acc 2), .split, (.acc 1), .split, (.acc 11), .split, .split, .split, .split, (.acc 8), (.acc 10), (.acc 8), .split, .split, (.acc 8), (.acc 10), (.acc 8)]
def k1_1_9 : List LBox := [⟨[549755813888, -549755813888, -549755813888, -549755813888, 549755813888], [824633720832, 0, 0, 0, 1099511627776]⟩, ⟨[824633720832, -1099511627776, -1099511627776, -1099511627776, 0], [1099511627776, 0, 0, 0, 1099511627776]⟩, ⟨[549755813888, -1099511627776, -1099511627776, 0, -1099511627776], [1099511627776, 0, 0, 1099511627776, 1099511627776]⟩, ⟨[549755813888, -1099511627776, 0, -1099511627776, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z1=+1）の区間 8（葉 16）。 -/
theorem s1_1_8 : lsegOk P 1099511627776 (hsOfG scl1 1 (1) Gs1) k1_1_8 f1_1_8 k1_1_9 = true := by decide +kernel

def f1_1_9 : List LTok := [(.acc 2), .split, .split, (.acc 1), .split, (.acc 11), .split, .split, .split, .split, .split, (.acc 9), .split, (.acc 24), (.acc 0), .split, (.acc 11), (.acc 26), .split, .split, (.acc 9), .split, (.acc 8), (.acc 0), .split, (.acc 11), (.acc 26), .split, .split, .split, (.acc 9), .split, (.acc 24), (.acc 0)]
def k1_1_10 : List LBox := [⟨[962072674304, -1099511627776, -274877906944, -549755813888, 0], [1099511627776, -824633720832, 0, 0, 549755813888]⟩, ⟨[962072674304, -824633720832, -549755813888, -549755813888, 0], [1099511627776, -549755813888, 0, 0, 549755813888]⟩, ⟨[824633720832, -1099511627776, -549755813888, -549755813888, 549755813888], [1099511627776, -549755813888, 0, 0, 1099511627776]⟩, ⟨[824633720832, -549755813888, -1099511627776, -1099511627776, 0], [1099511627776, 0, 0, 0, 1099511627776]⟩, ⟨[549755813888, -1099511627776, -1099511627776, 0, -1099511627776], [1099511627776, 0, 0, 1099511627776, 1099511627776]⟩, ⟨[549755813888, -1099511627776, 0, -1099511627776, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z1=+1）の区間 9（葉 16）。 -/
theorem s1_1_9 : lsegOk P 1099511627776 (hsOfG scl1 1 (1) Gs1) k1_1_9 f1_1_9 k1_1_10 = true := by decide +kernel

def f1_1_10 : List LTok := [.split, (.acc 11), (.acc 26), .split, .split, (.acc 9), .split, (.acc 8), (.acc 0), .split, (.acc 11), (.acc 26), (.acc 2), .split, (.acc 1), .split, (.acc 11), .split, .split, .split, .split, (.acc 8), (.acc 10), (.acc 8), .split, .split, (.acc 8), (.acc 10), (.acc 8)]
def k1_1_11 : List LBox := [⟨[824633720832, -549755813888, -549755813888, -549755813888, 549755813888], [1099511627776, 0, 0, 0, 1099511627776]⟩, ⟨[549755813888, -1099511627776, -1099511627776, 0, -1099511627776], [1099511627776, 0, 0, 1099511627776, 1099511627776]⟩, ⟨[549755813888, -1099511627776, 0, -1099511627776, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z1=+1）の区間 10（葉 16）。 -/
theorem s1_1_10 : lsegOk P 1099511627776 (hsOfG scl1 1 (1) Gs1) k1_1_10 f1_1_10 k1_1_11 = true := by decide +kernel

def f1_1_11 : List LTok := [(.acc 2), .split, .split, (.acc 16), (.acc 16), .split, .split, .split, (.acc 0), .split, .split, (.acc 16), (.acc 18), (.acc 22), .split, (.acc 0), .split, .split, .split, .split, (.acc 16), .split, (.acc 16), .split, (.acc 26), (.acc 22), .split, (.acc 16), .split, (.acc 16), .split, (.acc 26), (.acc 22)]
def k1_1_12 : List LBox := [⟨[549755813888, -549755813888, -549755813888, 0, 549755813888], [824633720832, 0, 0, 549755813888, 1099511627776]⟩, ⟨[549755813888, -549755813888, -549755813888, 549755813888, 0], [824633720832, 0, 0, 1099511627776, 1099511627776]⟩, ⟨[824633720832, -1099511627776, -1099511627776, 0, 0], [1099511627776, 0, 0, 1099511627776, 1099511627776]⟩, ⟨[549755813888, -1099511627776, 0, -1099511627776, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z1=+1）の区間 11（葉 16）。 -/
theorem s1_1_11 : lsegOk P 1099511627776 (hsOfG scl1 1 (1) Gs1) k1_1_11 f1_1_11 k1_1_12 = true := by decide +kernel

def f1_1_12 : List LTok := [(.acc 2), (.acc 22), .split, .split, (.acc 0), .split, .split, (.acc 16), (.acc 18), (.acc 22), .split, (.acc 0), .split, .split, .split, .split, (.acc 16), .split, (.acc 16), .split, (.acc 26), (.acc 22), .split, (.acc 16), .split, (.acc 16), .split, (.acc 26), (.acc 22), (.acc 2)]
def k1_1_13 : List LBox := [⟨[824633720832, -549755813888, -549755813888, 549755813888, 0], [1099511627776, 0, 0, 1099511627776, 1099511627776]⟩, ⟨[549755813888, -1099511627776, 0, -1099511627776, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z1=+1）の区間 12（葉 16）。 -/
theorem s1_1_12 : lsegOk P 1099511627776 (hsOfG scl1 1 (1) Gs1) k1_1_12 f1_1_12 k1_1_13 = true := by decide +kernel

def f1_1_13 : List LTok := [(.acc 22), .split, .split, (.acc 29), .split, .split, .split, .split, (.acc 11), .split, (.acc 27), (.acc 11), (.acc 27), (.acc 11), .split, .split, .split, (.acc 11), .split, (.acc 27), (.acc 10), (.acc 27), (.acc 11), .split, (.acc 28), .split, .split, (.acc 22), .split, (.acc 18), (.acc 30)]
def k1_1_14 : List LBox := [⟨[824633720832, -1099511627776, 0, 0, 0], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z1=+1）の区間 13（葉 16）。 -/
theorem s1_1_13 : lsegOk P 1099511627776 (hsOfG scl1 1 (1) Gs1) k1_1_13 f1_1_13 k1_1_14 = true := by decide +kernel

def f1_1_14 : List LTok := [.split, (.acc 18), .split, .split, (.acc 18), (.acc 22), (.acc 30)]
def k1_1_15 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 1（z1=+1）の区間 14（葉 4）。 -/
theorem s1_1_14 : lsegOk P 1099511627776 (hsOfG scl1 1 (1) Gs1) k1_1_14 f1_1_14 k1_1_15 = true := by decide +kernel

end PackLean.D28.Cub
