-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok3_24 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_24) = sv3_24 := by decide +kernel
theorem sb_ok3_25 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_25) = sv3_25 := by decide +kernel
theorem sb_ok3_26 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_26) = sv3_26 := by decide +kernel
theorem sb_ok3_27 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_27) = sv3_27 := by decide +kernel

end PackLean.D30S3.KL
