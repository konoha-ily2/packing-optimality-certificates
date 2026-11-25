-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok0_32 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_32) = sv0_32 := by decide +kernel
theorem sb_ok0_33 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_33) = sv0_33 := by decide +kernel
theorem sb_ok0_34 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_34) = sv0_34 := by decide +kernel
theorem sb_ok0_35 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_35) = sv0_35 := by decide +kernel

end PackLean.D30S3.KL
