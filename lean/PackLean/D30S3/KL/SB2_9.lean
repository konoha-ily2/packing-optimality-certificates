-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok2_36 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_36) = sv2_36 := by decide +kernel
theorem sb_ok2_37 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_37) = sv2_37 := by decide +kernel
theorem sb_ok2_38 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_38) = sv2_38 := by decide +kernel
theorem sb_ok2_39 : subst P.ps sxs2 (homScale (kScale X) 4 sk2_39) = sv2_39 := by decide +kernel

end PackLean.D30S3.KL
