-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok0_8 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_8) = sv0_8 := by decide +kernel
theorem sb_ok0_9 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_9) = sv0_9 := by decide +kernel
theorem sb_ok0_10 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_10) = sv0_10 := by decide +kernel
theorem sb_ok0_11 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_11) = sv0_11 := by decide +kernel

end PackLean.D30S3.KL
