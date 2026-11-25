-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok0_36 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_36) = sv0_36 := by decide +kernel
theorem sb_ok0_37 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_37) = sv0_37 := by decide +kernel
theorem sb_ok0_38 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_38) = sv0_38 := by decide +kernel
theorem sb_ok0_39 : subst P.ps sxs0 (homScale (kScale X) 4 sk0_39) = sv0_39 := by decide +kernel

end PackLean.D30S3.KL
