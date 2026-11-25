-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Cub.K.LocG1

namespace PackLean.D28.Cub
open PackLean.D28

def root1_7 : LBox := ⟨[0, -1099511627776, -1099511627776, -1099511627776, -1099511627776], [1099511627776, 0, 1099511627776, 1099511627776, 1099511627776]⟩
def k1_7_0 : List LBox := [root1_7]
def f1_7_0 : List LTok := [.split, (.acc 2), .split, (.acc 2), .split, (.acc 2), .split, (.acc 3), (.acc 18)]
def k1_7_1 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 7（z4=+1）の区間 0（葉 5）。 -/
theorem s1_7_0 : lsegOk P 1099511627776 (hsOfG scl1 4 (1) Gs1) k1_7_0 f1_7_0 k1_7_1 = true := by decide +kernel

end PackLean.D28.Cub
