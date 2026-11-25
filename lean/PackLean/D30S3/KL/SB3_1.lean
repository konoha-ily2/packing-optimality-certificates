-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok3_4 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_4) = sv3_4 := by decide +kernel
theorem sb_ok3_5 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_5) = sv3_5 := by decide +kernel
theorem sb_ok3_6 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_6) = sv3_6 := by decide +kernel
theorem sb_ok3_7 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_7) = sv3_7 := by decide +kernel

end PackLean.D30S3.KL
