-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok3_32 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_32) = sv3_32 := by decide +kernel
theorem sb_ok3_33 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_33) = sv3_33 := by decide +kernel
theorem sb_ok3_34 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_34) = sv3_34 := by decide +kernel
theorem sb_ok3_35 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_35) = sv3_35 := by decide +kernel

end PackLean.D30S3.KL
