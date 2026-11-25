-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok3_12 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_12) = sv3_12 := by decide +kernel
theorem sb_ok3_13 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_13) = sv3_13 := by decide +kernel
theorem sb_ok3_14 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_14) = sv3_14 := by decide +kernel
theorem sb_ok3_15 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_15) = sv3_15 := by decide +kernel

end PackLean.D30S3.KL
