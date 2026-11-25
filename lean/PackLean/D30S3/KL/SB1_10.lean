-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok1_40 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_40) = sv1_40 := by decide +kernel
theorem sb_ok1_41 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_41) = sv1_41 := by decide +kernel
theorem sb_ok1_42 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_42) = sv1_42 := by decide +kernel
theorem sb_ok1_43 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_43) = sv1_43 := by decide +kernel

end PackLean.D30S3.KL
