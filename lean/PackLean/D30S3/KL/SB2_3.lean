-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok2_12 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_12) = sv2_12 := by decide +kernel
theorem sb_ok2_13 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_13) = sv2_13 := by decide +kernel
theorem sb_ok2_14 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_14) = sv2_14 := by decide +kernel
theorem sb_ok2_15 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_15) = sv2_15 := by decide +kernel

end PackLean.D30S3.KL
