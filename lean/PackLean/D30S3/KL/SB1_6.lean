-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok1_24 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_24) = sv1_24 := by decide +kernel
theorem sb_ok1_25 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_25) = sv1_25 := by decide +kernel
theorem sb_ok1_26 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_26) = sv1_26 := by decide +kernel
theorem sb_ok1_27 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_27) = sv1_27 := by decide +kernel

end PackLean.D30S3.KL
