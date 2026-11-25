-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok0_12 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_12) = sv0_12 := by decide +kernel
theorem sb_ok0_13 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_13) = sv0_13 := by decide +kernel
theorem sb_ok0_14 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_14) = sv0_14 := by decide +kernel
theorem sb_ok0_15 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_15) = sv0_15 := by decide +kernel

end PackLean.D30S3.KL
