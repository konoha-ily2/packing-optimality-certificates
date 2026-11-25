-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok3_20 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_20) = sv3_20 := by decide +kernel
theorem sb_ok3_21 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_21) = sv3_21 := by decide +kernel
theorem sb_ok3_22 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_22) = sv3_22 := by decide +kernel
theorem sb_ok3_23 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_23) = sv3_23 := by decide +kernel

end PackLean.D30S3.KL
