-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok1_0 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_0) = sv1_0 := by decide +kernel
theorem sb_ok1_1 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_1) = sv1_1 := by decide +kernel
theorem sb_ok1_2 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_2) = sv1_2 := by decide +kernel
theorem sb_ok1_3 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_3) = sv1_3 := by decide +kernel

end PackLean.D30S3.KL
