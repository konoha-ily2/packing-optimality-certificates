-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_6_11 : segChk P ctxB yB_6_10 tB_6_11 yB_6_11 = true := by decide +kernel
theorem sB_6_12 : segChk P ctxB yB_6_11 tB_6_12 yB_6_12 = true := by decide +kernel
theorem sB_6_13 : segChk P ctxB yB_6_12 tB_6_13 yB_6_13 = true := by decide +kernel
theorem sB_6_14 : segChk P ctxB yB_6_13 tB_6_14 yB_6_14 = true := by decide +kernel

end PackLean.D45DT.KL
