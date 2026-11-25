-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok1_36 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_36) = sv1_36 := by decide +kernel
theorem sb_ok1_37 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_37) = sv1_37 := by decide +kernel
theorem sb_ok1_38 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_38) = sv1_38 := by decide +kernel
theorem sb_ok1_39 : subst P.ps sxs1 (homScale (kScale X) 4 sk1_39) = sv1_39 := by decide +kernel

end PackLean.D30S3.KL
