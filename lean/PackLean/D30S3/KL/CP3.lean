-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem cp_ok24 : candPolys P ct.1 ct.2.1 cpk24 = cpv24 := by decide +kernel
theorem cp_ok25 : candPolys P ct.1 ct.2.1 cpk25 = cpv25 := by decide +kernel
theorem cp_ok26 : candPolys P ct.1 ct.2.1 cpk26 = cpv26 := by decide +kernel
theorem cp_ok27 : candPolys P ct.1 ct.2.1 cpk27 = cpv27 := by decide +kernel
theorem cp_ok28 : candPolys P ct.1 ct.2.1 cpk28 = cpv28 := by decide +kernel
theorem cp_ok29 : candPolys P ct.1 ct.2.1 cpk29 = cpv29 := by decide +kernel
theorem cp_ok30 : candPolys P ct.1 ct.2.1 cpk30 = cpv30 := by decide +kernel
theorem cp_ok31 : candPolys P ct.1 ct.2.1 cpk31 = cpv31 := by decide +kernel

end PackLean.D30S3.KL
