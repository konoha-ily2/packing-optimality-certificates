-- 自動で書き出したもの（lean/tools/export_d28_local_k.py）。手で直さない。
import PackLean.D28.Cub.K.LocS1_0_4

namespace PackLean.D28.Cub
open PackLean.D28

def f1_0_40 : List LTok := [(.acc 11), .split, .split, (.acc 11), (.acc 19), (.acc 27), .split, .split, .split, (.acc 20), (.acc 28), .split, (.acc 20), (.acc 28), (.acc 18)]
def k1_0_41 : List LBox := []
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 面 0（z0=-1）の区間 40（葉 9）。 -/
theorem s1_0_40 : lsegOk P 1099511627776 (hsOfG scl1 0 (-1) Gs1) k1_0_40 f1_0_40 k1_0_41 = true := by decide +kernel

end PackLean.D28.Cub
