-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.Tab

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sb_ok3_44 : subst P.ps sxs3 (homScale (kScale X) 4 sk3_44) = sv3_44 := by decide +kernel

end PackLean.D30S3.KL
