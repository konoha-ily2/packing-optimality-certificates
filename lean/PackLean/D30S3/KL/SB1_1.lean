-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok1_4 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_4) = sv1_4 := by decide +kernel
theorem sb_ok1_5 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_5) = sv1_5 := by decide +kernel
theorem sb_ok1_6 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_6) = sv1_6 := by decide +kernel
theorem sb_ok1_7 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_7) = sv1_7 := by decide +kernel

end PackLean.D30S3.KL
