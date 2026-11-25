-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok0_0 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_0) = sv0_0 := by decide +kernel
theorem sb_ok0_1 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_1) = sv0_1 := by decide +kernel
theorem sb_ok0_2 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_2) = sv0_2 := by decide +kernel
theorem sb_ok0_3 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_3) = sv0_3 := by decide +kernel

end PackLean.D30S3.KL
