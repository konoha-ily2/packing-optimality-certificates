-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_0_16 : segChk P ctxB yB_0_15 tB_0_16 yB_0_16 = true := by decide +kernel
theorem sB_0_17 : segChk P ctxB yB_0_16 tB_0_17 yB_0_17 = true := by decide +kernel
theorem sB_0_18 : segChk P ctxB yB_0_17 tB_0_18 yB_0_18 = true := by decide +kernel
theorem sB_0_19 : segChk P ctxB yB_0_18 tB_0_19 yB_0_19 = true := by decide +kernel

end PackLean.D45DT.KL
