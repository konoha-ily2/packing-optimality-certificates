-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_1_22 : segChk P ctxB yB_1_21 tB_1_22 yB_1_22 = true := by decide +kernel
theorem sB_1_23 : segChk P ctxB yB_1_22 tB_1_23 yB_1_23 = true := by decide +kernel
theorem sB_1_24 : segChk P ctxB yB_1_23 tB_1_24 yB_1_24 = true := by decide +kernel
theorem sB_1_25 : segChk P ctxB yB_1_24 tB_1_25 yB_1_25 = true := by decide +kernel

end PackLean.D45DT.KL
