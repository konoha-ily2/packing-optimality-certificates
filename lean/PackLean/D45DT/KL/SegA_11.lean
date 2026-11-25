-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_31 : segChk P ctxA yA_1_30 tA_1_31 yA_1_31 = true := by decide +kernel
theorem sA_1_32 : segChk P ctxA yA_1_31 tA_1_32 yA_1_32 = true := by decide +kernel
theorem sA_1_33 : segChk P ctxA yA_1_32 tA_1_33 yA_1_33 = true := by decide +kernel
theorem sA_1_34 : segChk P ctxA yA_1_33 tA_1_34 yA_1_34 = true := by decide +kernel

end PackLean.D45DT.KL
