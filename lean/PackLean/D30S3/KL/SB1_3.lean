-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok1_12 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_12) = sv1_12 := by decide +kernel
theorem sb_ok1_13 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_13) = sv1_13 := by decide +kernel
theorem sb_ok1_14 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_14) = sv1_14 := by decide +kernel
theorem sb_ok1_15 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_15) = sv1_15 := by decide +kernel

end PackLean.D30S3.KL
