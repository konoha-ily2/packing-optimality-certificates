-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_0_4 : segChk P ctxB yB_0_3 tB_0_4 yB_0_4 = true := by decide +kernel
theorem sB_0_5 : segChk P ctxB yB_0_4 tB_0_5 yB_0_5 = true := by decide +kernel
theorem sB_0_6 : segChk P ctxB yB_0_5 tB_0_6 yB_0_6 = true := by decide +kernel
theorem sB_0_7 : segChk P ctxB yB_0_6 tB_0_7 yB_0_7 = true := by decide +kernel

end PackLean.D45DT.KL
