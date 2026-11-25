-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Dodindod.KL.Tab

namespace PackLean.D44.Dodindod.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Dodindod
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem cp_ok0 : candPolys P ct.1 ct.2.1 cpk0 = cpv0 := by decide +kernel
theorem cp_ok1 : candPolys P ct.1 ct.2.1 cpk1 = cpv1 := by decide +kernel
theorem cp_ok2 : candPolys P ct.1 ct.2.1 cpk2 = cpv2 := by decide +kernel
theorem cp_ok3 : candPolys P ct.1 ct.2.1 cpk3 = cpv3 := by decide +kernel

end PackLean.D44.Dodindod.KL
