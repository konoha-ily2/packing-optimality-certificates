-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Icoinico.KL.Tab

namespace PackLean.D44.Icoinico.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Icoinico
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem cp_ok0 : candPolys P ct.1 ct.2.1 cpk0 = cpv0 := by decide +kernel
theorem cp_ok1 : candPolys P ct.1 ct.2.1 cpk1 = cpv1 := by decide +kernel
theorem cp_ok2 : candPolys P ct.1 ct.2.1 cpk2 = cpv2 := by decide +kernel
theorem cp_ok3 : candPolys P ct.1 ct.2.1 cpk3 = cpv3 := by decide +kernel
theorem cp_ok4 : candPolys P ct.1 ct.2.1 cpk4 = cpv4 := by decide +kernel
theorem cp_ok5 : candPolys P ct.1 ct.2.1 cpk5 = cpv5 := by decide +kernel
theorem cp_ok6 : candPolys P ct.1 ct.2.1 cpk6 = cpv6 := by decide +kernel
theorem cp_ok7 : candPolys P ct.1 ct.2.1 cpk7 = cpv7 := by decide +kernel

end PackLean.D44.Icoinico.KL
