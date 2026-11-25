-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok1_8 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_8) = sv1_8 := by decide +kernel
theorem sb_ok1_9 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_9) = sv1_9 := by decide +kernel
theorem sb_ok1_10 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_10) = sv1_10 := by decide +kernel
theorem sb_ok1_11 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_11) = sv1_11 := by decide +kernel

end PackLean.D30S3.KL
