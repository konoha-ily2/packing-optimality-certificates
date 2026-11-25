-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_7_2 : segChk P ctxB yB_7_1 tB_7_2 yB_7_2 = true := by decide +kernel
theorem sB_7_3 : segChk P ctxB yB_7_2 tB_7_3 yB_7_3 = true := by decide +kernel
theorem sB_7_4 : segChk P ctxB yB_7_3 tB_7_4 yB_7_4 = true := by decide +kernel

end PackLean.D45DT.KL
