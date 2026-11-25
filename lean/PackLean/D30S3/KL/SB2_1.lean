-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok2_4 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_4) = sv2_4 := by decide +kernel
theorem sb_ok2_5 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_5) = sv2_5 := by decide +kernel
theorem sb_ok2_6 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_6) = sv2_6 := by decide +kernel
theorem sb_ok2_7 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_7) = sv2_7 := by decide +kernel

end PackLean.D30S3.KL
