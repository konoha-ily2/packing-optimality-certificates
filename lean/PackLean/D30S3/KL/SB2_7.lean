-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok2_28 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_28) = sv2_28 := by decide +kernel
theorem sb_ok2_29 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_29) = sv2_29 := by decide +kernel
theorem sb_ok2_30 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_30) = sv2_30 := by decide +kernel
theorem sb_ok2_31 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_31) = sv2_31 := by decide +kernel

end PackLean.D30S3.KL
