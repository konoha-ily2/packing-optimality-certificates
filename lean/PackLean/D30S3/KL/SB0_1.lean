-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok0_4 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_4) = sv0_4 := by decide +kernel
theorem sb_ok0_5 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_5) = sv0_5 := by decide +kernel
theorem sb_ok0_6 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_6) = sv0_6 := by decide +kernel
theorem sb_ok0_7 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_7) = sv0_7 := by decide +kernel

end PackLean.D30S3.KL
