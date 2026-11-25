-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_43 : segChk P ctxA yA_1_42 tA_1_43 yA_1_43 = true := by decide +kernel
theorem sA_1_44 : segChk P ctxA yA_1_43 tA_1_44 yA_1_44 = true := by decide +kernel
theorem sA_1_45 : segChk P ctxA yA_1_44 tA_1_45 yA_1_45 = true := by decide +kernel
theorem sA_1_46 : segChk P ctxA yA_1_45 tA_1_46 yA_1_46 = true := by decide +kernel

end PackLean.D45DT.KL
