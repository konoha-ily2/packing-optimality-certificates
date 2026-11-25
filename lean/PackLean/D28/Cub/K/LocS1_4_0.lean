-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Cub.K.LocG1

namespace PackLean.D28.Cub
open PackLean.D28

def root1_4 : LBox := ⟨[0, -1099511627776, -1099511627776, -1099511627776, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩
def k1_4_0 : List LBox := [root1_4]
def f1_4_0 : List LTok := [.split, .split, .split, (.acc 1), (.acc 0), .split, (.acc 1), (.acc 0), .split, .split, (.acc 1), (.acc 0), .split, .split, .split, (.acc 1), .split, .split, (.acc 1), .split, (.acc 9), .split, (.acc 24), (.acc 0), .split, (.acc 1), (.acc 8), (.acc 0), .split, .split, (.acc 16), .split, (.acc 16)]
def k1_4_1 : List LBox := [⟨[824633720832, -549755813888, 0, 0, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 0]⟩, ⟨[549755813888, -1099511627776, 0, 0, 0], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 4（z2=-1）の区間 0（葉 16）。 -/
theorem s1_4_0 : lsegOk P 1099511627776 (hsOfG scl1 2 (-1) Gs1) k1_4_0 f1_4_0 k1_4_1 = true := by decide +kernel

def f1_4_1 : List LTok := [.split, (.acc 4), (.acc 16), (.acc 0)]
def k1_4_2 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 4（z2=-1）の区間 1（葉 3）。 -/
theorem s1_4_1 : lsegOk P 1099511627776 (hsOfG scl1 2 (-1) Gs1) k1_4_1 f1_4_1 k1_4_2 = true := by decide +kernel

end PackLean.D28.Cub
