-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_1_10 : segChk P ctxB yB_1_9 tB_1_10 yB_1_10 = true := by decide +kernel
theorem sB_1_11 : segChk P ctxB yB_1_10 tB_1_11 yB_1_11 = true := by decide +kernel
theorem sB_1_12 : segChk P ctxB yB_1_11 tB_1_12 yB_1_12 = true := by decide +kernel
theorem sB_1_13 : segChk P ctxB yB_1_12 tB_1_13 yB_1_13 = true := by decide +kernel

end PackLean.D45DT.KL
