-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok1_28 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_28) = sv1_28 := by decide +kernel
theorem sb_ok1_29 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_29) = sv1_29 := by decide +kernel
theorem sb_ok1_30 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_30) = sv1_30 := by decide +kernel
theorem sb_ok1_31 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_31) = sv1_31 := by decide +kernel

end PackLean.D30S3.KL
