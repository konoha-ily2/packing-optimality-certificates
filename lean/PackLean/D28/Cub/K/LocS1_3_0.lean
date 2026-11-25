-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Cub.K.LocG1

namespace PackLean.D28.Cub
open PackLean.D28

def root1_3 : LBox := ⟨[0, -1099511627776, -1099511627776, -1099511627776, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩
def k1_3_0 : List LBox := [root1_3]
def f1_3_0 : List LTok := [.split, .split, .split, (.acc 31), (.acc 22), (.acc 31), .split, .split, (.acc 15), (.acc 22), (.acc 31)]
def k1_3_1 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 3（z2=+1）の区間 0（葉 6）。 -/
theorem s1_3_0 : lsegOk P 1099511627776 (hsOfG scl1 2 (1) Gs1) k1_3_0 f1_3_0 k1_3_1 = true := by decide +kernel

end PackLean.D28.Cub
