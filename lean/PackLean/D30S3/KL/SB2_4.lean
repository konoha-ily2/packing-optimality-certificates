-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok2_16 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_16) = sv2_16 := by decide +kernel
theorem sb_ok2_17 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_17) = sv2_17 := by decide +kernel
theorem sb_ok2_18 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_18) = sv2_18 := by decide +kernel
theorem sb_ok2_19 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_19) = sv2_19 := by decide +kernel

end PackLean.D30S3.KL
