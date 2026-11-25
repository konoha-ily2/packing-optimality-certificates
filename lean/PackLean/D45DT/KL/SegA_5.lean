-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_7 : segChk P ctxA yA_1_6 tA_1_7 yA_1_7 = true := by decide +kernel
theorem sA_1_8 : segChk P ctxA yA_1_7 tA_1_8 yA_1_8 = true := by decide +kernel
theorem sA_1_9 : segChk P ctxA yA_1_8 tA_1_9 yA_1_9 = true := by decide +kernel
theorem sA_1_10 : segChk P ctxA yA_1_9 tA_1_10 yA_1_10 = true := by decide +kernel

end PackLean.D45DT.KL
