-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok2_0 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_0) = sv2_0 := by decide +kernel
theorem sb_ok2_1 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_1) = sv2_1 := by decide +kernel
theorem sb_ok2_2 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_2) = sv2_2 := by decide +kernel
theorem sb_ok2_3 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_3) = sv2_3 := by decide +kernel

end PackLean.D30S3.KL
