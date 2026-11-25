-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_6_7 : segChk P ctxB yB_6_6 tB_6_7 yB_6_7 = true := by decide +kernel
theorem sB_6_8 : segChk P ctxB yB_6_7 tB_6_8 yB_6_8 = true := by decide +kernel
theorem sB_6_9 : segChk P ctxB yB_6_8 tB_6_9 yB_6_9 = true := by decide +kernel
theorem sB_6_10 : segChk P ctxB yB_6_9 tB_6_10 yB_6_10 = true := by decide +kernel

end PackLean.D45DT.KL
