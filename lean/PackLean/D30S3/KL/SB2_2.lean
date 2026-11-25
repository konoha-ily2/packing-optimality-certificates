-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok2_8 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_8) = sv2_8 := by decide +kernel
theorem sb_ok2_9 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_9) = sv2_9 := by decide +kernel
theorem sb_ok2_10 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_10) = sv2_10 := by decide +kernel
theorem sb_ok2_11 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_11) = sv2_11 := by decide +kernel

end PackLean.D30S3.KL
