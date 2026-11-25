-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok2_20 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_20) = sv2_20 := by decide +kernel
theorem sb_ok2_21 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_21) = sv2_21 := by decide +kernel
theorem sb_ok2_22 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_22) = sv2_22 := by decide +kernel
theorem sb_ok2_23 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_23) = sv2_23 := by decide +kernel

end PackLean.D30S3.KL
