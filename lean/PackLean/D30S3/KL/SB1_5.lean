-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok1_20 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_20) = sv1_20 := by decide +kernel
theorem sb_ok1_21 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_21) = sv1_21 := by decide +kernel
theorem sb_ok1_22 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_22) = sv1_22 := by decide +kernel
theorem sb_ok1_23 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_23) = sv1_23 := by decide +kernel

end PackLean.D30S3.KL
