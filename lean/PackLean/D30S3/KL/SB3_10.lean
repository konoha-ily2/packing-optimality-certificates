-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok3_40 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_40) = sv3_40 := by decide +kernel
theorem sb_ok3_41 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_41) = sv3_41 := by decide +kernel
theorem sb_ok3_42 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_42) = sv3_42 := by decide +kernel
theorem sb_ok3_43 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_43) = sv3_43 := by decide +kernel

end PackLean.D30S3.KL
