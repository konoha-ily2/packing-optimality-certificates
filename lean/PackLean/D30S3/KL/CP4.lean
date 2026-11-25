-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem cp_ok32 : candPolys P ct.1 ct.2.1 cpk32 = cpv32 := by decide +kernel
theorem cp_ok33 : candPolys P ct.1 ct.2.1 cpk33 = cpv33 := by decide +kernel
theorem cp_ok34 : candPolys P ct.1 ct.2.1 cpk34 = cpv34 := by decide +kernel
theorem cp_ok35 : candPolys P ct.1 ct.2.1 cpk35 = cpv35 := by decide +kernel

end PackLean.D30S3.KL
