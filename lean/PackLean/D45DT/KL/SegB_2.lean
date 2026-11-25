-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_0_8 : segChk P ctxB yB_0_7 tB_0_8 yB_0_8 = true := by decide +kernel
theorem sB_0_9 : segChk P ctxB yB_0_8 tB_0_9 yB_0_9 = true := by decide +kernel
theorem sB_0_10 : segChk P ctxB yB_0_9 tB_0_10 yB_0_10 = true := by decide +kernel
theorem sB_0_11 : segChk P ctxB yB_0_10 tB_0_11 yB_0_11 = true := by decide +kernel

end PackLean.D45DT.KL
