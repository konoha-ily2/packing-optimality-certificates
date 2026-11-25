-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok0_40 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_40) = sv0_40 := by decide +kernel
theorem sb_ok0_41 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_41) = sv0_41 := by decide +kernel
theorem sb_ok0_42 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_42) = sv0_42 := by decide +kernel
theorem sb_ok0_43 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_43) = sv0_43 := by decide +kernel

end PackLean.D30S3.KL
