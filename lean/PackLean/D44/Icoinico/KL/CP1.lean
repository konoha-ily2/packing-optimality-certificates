-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Icoinico.KL.Tab

namespace PackLean.D44.Icoinico.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Icoinico
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem cp_ok8 : candPolys P ct.1 ct.2.1 cpk8 = cpv8 := by decide +kernel
theorem cp_ok9 : candPolys P ct.1 ct.2.1 cpk9 = cpv9 := by decide +kernel
theorem cp_ok10 : candPolys P ct.1 ct.2.1 cpk10 = cpv10 := by decide +kernel
theorem cp_ok11 : candPolys P ct.1 ct.2.1 cpk11 = cpv11 := by decide +kernel

end PackLean.D44.Icoinico.KL
