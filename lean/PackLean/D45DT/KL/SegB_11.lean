-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_1_18 : segChk P ctxB yB_1_17 tB_1_18 yB_1_18 = true := by decide +kernel
theorem sB_1_19 : segChk P ctxB yB_1_18 tB_1_19 yB_1_19 = true := by decide +kernel
theorem sB_1_20 : segChk P ctxB yB_1_19 tB_1_20 yB_1_20 = true := by decide +kernel
theorem sB_1_21 : segChk P ctxB yB_1_20 tB_1_21 yB_1_21 = true := by decide +kernel

end PackLean.D45DT.KL
