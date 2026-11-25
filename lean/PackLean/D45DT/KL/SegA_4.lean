-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_3 : segChk P ctxA yA_1_2 tA_1_3 yA_1_3 = true := by decide +kernel
theorem sA_1_4 : segChk P ctxA yA_1_3 tA_1_4 yA_1_4 = true := by decide +kernel
theorem sA_1_5 : segChk P ctxA yA_1_4 tA_1_5 yA_1_5 = true := by decide +kernel
theorem sA_1_6 : segChk P ctxA yA_1_5 tA_1_6 yA_1_6 = true := by decide +kernel

end PackLean.D45DT.KL
