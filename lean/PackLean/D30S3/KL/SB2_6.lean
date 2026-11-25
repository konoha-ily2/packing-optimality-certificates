-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok2_24 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_24) = sv2_24 := by decide +kernel
theorem sb_ok2_25 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_25) = sv2_25 := by decide +kernel
theorem sb_ok2_26 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_26) = sv2_26 := by decide +kernel
theorem sb_ok2_27 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_27) = sv2_27 := by decide +kernel

end PackLean.D30S3.KL
