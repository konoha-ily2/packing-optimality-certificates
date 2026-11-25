-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_1_30 : segChk P ctxB yB_1_29 tB_1_30 yB_1_30 = true := by decide +kernel
theorem sB_1_31 : segChk P ctxB yB_1_30 tB_1_31 yB_1_31 = true := by decide +kernel
theorem sB_1_32 : segChk P ctxB yB_1_31 tB_1_32 yB_1_32 = true := by decide +kernel
theorem sB_1_33 : segChk P ctxB yB_1_32 tB_1_33 yB_1_33 = true := by decide +kernel

end PackLean.D45DT.KL
