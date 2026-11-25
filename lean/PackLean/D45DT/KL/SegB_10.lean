-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_1_14 : segChk P ctxB yB_1_13 tB_1_14 yB_1_14 = true := by decide +kernel
theorem sB_1_15 : segChk P ctxB yB_1_14 tB_1_15 yB_1_15 = true := by decide +kernel
theorem sB_1_16 : segChk P ctxB yB_1_15 tB_1_16 yB_1_16 = true := by decide +kernel
theorem sB_1_17 : segChk P ctxB yB_1_16 tB_1_17 yB_1_17 = true := by decide +kernel

end PackLean.D45DT.KL
