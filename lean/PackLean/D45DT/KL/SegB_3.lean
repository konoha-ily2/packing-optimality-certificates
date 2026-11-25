-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_0_12 : segChk P ctxB yB_0_11 tB_0_12 yB_0_12 = true := by decide +kernel
theorem sB_0_13 : segChk P ctxB yB_0_12 tB_0_13 yB_0_13 = true := by decide +kernel
theorem sB_0_14 : segChk P ctxB yB_0_13 tB_0_14 yB_0_14 = true := by decide +kernel
theorem sB_0_15 : segChk P ctxB yB_0_14 tB_0_15 yB_0_15 = true := by decide +kernel

end PackLean.D45DT.KL
