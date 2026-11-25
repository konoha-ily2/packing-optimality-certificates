-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_1_26 : segChk P ctxB yB_1_25 tB_1_26 yB_1_26 = true := by decide +kernel
theorem sB_1_27 : segChk P ctxB yB_1_26 tB_1_27 yB_1_27 = true := by decide +kernel
theorem sB_1_28 : segChk P ctxB yB_1_27 tB_1_28 yB_1_28 = true := by decide +kernel
theorem sB_1_29 : segChk P ctxB yB_1_28 tB_1_29 yB_1_29 = true := by decide +kernel

end PackLean.D45DT.KL
