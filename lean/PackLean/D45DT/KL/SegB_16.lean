-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_1_38 : segChk P ctxB yB_1_37 tB_1_38 yB_1_38 = true := by decide +kernel
theorem sB_1_39 : segChk P ctxB yB_1_38 tB_1_39 yB_1_39 = true := by decide +kernel
theorem sB_1_40 : segChk P ctxB yB_1_39 tB_1_40 yB_1_40 = true := by decide +kernel
theorem sB_1_41 : segChk P ctxB yB_1_40 tB_1_41 yB_1_41 = true := by decide +kernel

end PackLean.D45DT.KL
