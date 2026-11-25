-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Cub.K.LocG1

namespace PackLean.D28.Cub
open PackLean.D28

def root1_5 : LBox := ⟨[0, -1099511627776, -1099511627776, -1099511627776, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩
def k1_5_0 : List LBox := [root1_5]
def f1_5_0 : List LTok := [(.acc 22)]
def k1_5_1 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 5（z3=+1）の区間 0（葉 1）。 -/
theorem s1_5_0 : lsegOk P 1099511627776 (hsOfG scl1 3 (1) Gs1) k1_5_0 f1_5_0 k1_5_1 = true := by decide +kernel

end PackLean.D28.Cub
