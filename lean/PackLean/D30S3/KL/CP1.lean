-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem cp_ok8 : candPolys P ct.1 ct.2.1 cpk8 = cpv8 := by decide +kernel
theorem cp_ok9 : candPolys P ct.1 ct.2.1 cpk9 = cpv9 := by decide +kernel
theorem cp_ok10 : candPolys P ct.1 ct.2.1 cpk10 = cpv10 := by decide +kernel
theorem cp_ok11 : candPolys P ct.1 ct.2.1 cpk11 = cpv11 := by decide +kernel
theorem cp_ok12 : candPolys P ct.1 ct.2.1 cpk12 = cpv12 := by decide +kernel
theorem cp_ok13 : candPolys P ct.1 ct.2.1 cpk13 = cpv13 := by decide +kernel
theorem cp_ok14 : candPolys P ct.1 ct.2.1 cpk14 = cpv14 := by decide +kernel
theorem cp_ok15 : candPolys P ct.1 ct.2.1 cpk15 = cpv15 := by decide +kernel

end PackLean.D30S3.KL
