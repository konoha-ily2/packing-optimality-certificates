-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok0_28 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_28) = sv0_28 := by decide +kernel
theorem sb_ok0_29 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_29) = sv0_29 := by decide +kernel
theorem sb_ok0_30 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_30) = sv0_30 := by decide +kernel
theorem sb_ok0_31 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_31) = sv0_31 := by decide +kernel

end PackLean.D30S3.KL
