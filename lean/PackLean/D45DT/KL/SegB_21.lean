-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_6_3 : segChk P ctxB yB_6_2 tB_6_3 yB_6_3 = true := by decide +kernel
theorem sB_6_4 : segChk P ctxB yB_6_3 tB_6_4 yB_6_4 = true := by decide +kernel
theorem sB_6_5 : segChk P ctxB yB_6_4 tB_6_5 yB_6_5 = true := by decide +kernel
theorem sB_6_6 : segChk P ctxB yB_6_5 tB_6_6 yB_6_6 = true := by decide +kernel

end PackLean.D45DT.KL
