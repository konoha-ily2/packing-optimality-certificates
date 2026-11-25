-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok0_20 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_20) = sv0_20 := by decide +kernel
theorem sb_ok0_21 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_21) = sv0_21 := by decide +kernel
theorem sb_ok0_22 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_22) = sv0_22 := by decide +kernel
theorem sb_ok0_23 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_23) = sv0_23 := by decide +kernel

end PackLean.D30S3.KL
