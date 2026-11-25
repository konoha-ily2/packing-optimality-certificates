-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok0_24 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_24) = sv0_24 := by decide +kernel
theorem sb_ok0_25 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_25) = sv0_25 := by decide +kernel
theorem sb_ok0_26 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_26) = sv0_26 := by decide +kernel
theorem sb_ok0_27 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_27) = sv0_27 := by decide +kernel

end PackLean.D30S3.KL
