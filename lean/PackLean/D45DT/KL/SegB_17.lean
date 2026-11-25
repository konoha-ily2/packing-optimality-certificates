-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_1_42 : segChk P ctxB yB_1_41 tB_1_42 yB_1_42 = true := by decide +kernel
theorem sB_1_43 : segChk P ctxB yB_1_42 tB_1_43 yB_1_43 = true := by decide +kernel
theorem sB_1_44 : segChk P ctxB yB_1_43 tB_1_44 yB_1_44 = true := by decide +kernel
theorem sB_1_45 : segChk P ctxB yB_1_44 tB_1_45 yB_1_45 = true := by decide +kernel

end PackLean.D45DT.KL
