-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok1_16 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_16) = sv1_16 := by decide +kernel
theorem sb_ok1_17 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_17) = sv1_17 := by decide +kernel
theorem sb_ok1_18 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_18) = sv1_18 := by decide +kernel
theorem sb_ok1_19 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_19) = sv1_19 := by decide +kernel

end PackLean.D30S3.KL
