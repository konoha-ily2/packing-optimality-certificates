-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok2_40 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_40) = sv2_40 := by decide +kernel
theorem sb_ok2_41 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_41) = sv2_41 := by decide +kernel
theorem sb_ok2_42 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_42) = sv2_42 := by decide +kernel

end PackLean.D30S3.KL
