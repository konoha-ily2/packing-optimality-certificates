-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok0_16 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_16) = sv0_16 := by decide +kernel
theorem sb_ok0_17 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_17) = sv0_17 := by decide +kernel
theorem sb_ok0_18 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_18) = sv0_18 := by decide +kernel
theorem sb_ok0_19 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_19) = sv0_19 := by decide +kernel

end PackLean.D30S3.KL
