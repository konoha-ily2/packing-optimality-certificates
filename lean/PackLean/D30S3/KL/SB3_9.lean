-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok3_36 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_36) = sv3_36 := by decide +kernel
theorem sb_ok3_37 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_37) = sv3_37 := by decide +kernel
theorem sb_ok3_38 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_38) = sv3_38 := by decide +kernel
theorem sb_ok3_39 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_39) = sv3_39 := by decide +kernel

end PackLean.D30S3.KL
