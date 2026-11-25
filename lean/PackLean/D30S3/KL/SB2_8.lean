-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok2_32 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_32) = sv2_32 := by decide +kernel
theorem sb_ok2_33 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_33) = sv2_33 := by decide +kernel
theorem sb_ok2_34 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_34) = sv2_34 := by decide +kernel
theorem sb_ok2_35 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_35) = sv2_35 := by decide +kernel

end PackLean.D30S3.KL
