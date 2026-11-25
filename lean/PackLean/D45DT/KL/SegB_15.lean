-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_1_34 : segChk P ctxB yB_1_33 tB_1_34 yB_1_34 = true := by decide +kernel
theorem sB_1_35 : segChk P ctxB yB_1_34 tB_1_35 yB_1_35 = true := by decide +kernel
theorem sB_1_36 : segChk P ctxB yB_1_35 tB_1_36 yB_1_36 = true := by decide +kernel
theorem sB_1_37 : segChk P ctxB yB_1_36 tB_1_37 yB_1_37 = true := by decide +kernel

end PackLean.D45DT.KL
