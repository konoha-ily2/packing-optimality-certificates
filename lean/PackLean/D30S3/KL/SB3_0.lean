-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok3_0 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_0) = sv3_0 := by decide +kernel
theorem sb_ok3_1 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_1) = sv3_1 := by decide +kernel
theorem sb_ok3_2 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_2) = sv3_2 := by decide +kernel
theorem sb_ok3_3 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_3) = sv3_3 := by decide +kernel

end PackLean.D30S3.KL
