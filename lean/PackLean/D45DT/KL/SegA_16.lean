-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_51 : segChk P ctxA yA_1_50 tA_1_51 yA_1_51 = true := by decide +kernel
theorem sA_1_52 : segChk P ctxA yA_1_51 tA_1_52 yA_1_52 = true := by decide +kernel
theorem sA_1_53 : segChk P ctxA yA_1_52 tA_1_53 yA_1_53 = true := by decide +kernel
theorem sA_1_54 : segChk P ctxA yA_1_53 tA_1_54 yA_1_54 = true := by decide +kernel

end PackLean.D45DT.KL
