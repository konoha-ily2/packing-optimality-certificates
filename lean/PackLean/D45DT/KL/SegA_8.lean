-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_19 : segChk P ctxA yA_1_18 tA_1_19 yA_1_19 = true := by decide +kernel
theorem sA_1_20 : segChk P ctxA yA_1_19 tA_1_20 yA_1_20 = true := by decide +kernel
theorem sA_1_21 : segChk P ctxA yA_1_20 tA_1_21 yA_1_21 = true := by decide +kernel
theorem sA_1_22 : segChk P ctxA yA_1_21 tA_1_22 yA_1_22 = true := by decide +kernel

end PackLean.D45DT.KL
