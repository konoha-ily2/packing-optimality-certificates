-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok1_32 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_32) = sv1_32 := by decide +kernel
theorem sb_ok1_33 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_33) = sv1_33 := by decide +kernel
theorem sb_ok1_34 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_34) = sv1_34 := by decide +kernel
theorem sb_ok1_35 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_35) = sv1_35 := by decide +kernel

end PackLean.D30S3.KL
