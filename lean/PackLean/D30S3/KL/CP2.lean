-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem cp_ok16 : candPolys P ct.1 ct.2.1 cpk16 = cpv16 := by decide +kernel
theorem cp_ok17 : candPolys P ct.1 ct.2.1 cpk17 = cpv17 := by decide +kernel
theorem cp_ok18 : candPolys P ct.1 ct.2.1 cpk18 = cpv18 := by decide +kernel
theorem cp_ok19 : candPolys P ct.1 ct.2.1 cpk19 = cpv19 := by decide +kernel
theorem cp_ok20 : candPolys P ct.1 ct.2.1 cpk20 = cpv20 := by decide +kernel
theorem cp_ok21 : candPolys P ct.1 ct.2.1 cpk21 = cpv21 := by decide +kernel
theorem cp_ok22 : candPolys P ct.1 ct.2.1 cpk22 = cpv22 := by decide +kernel
theorem cp_ok23 : candPolys P ct.1 ct.2.1 cpk23 = cpv23 := by decide +kernel

end PackLean.D30S3.KL
