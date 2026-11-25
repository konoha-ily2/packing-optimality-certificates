-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_147 : segChk P ctxA yA_1_146 tA_1_147 yA_1_147 = true := by decide +kernel
theorem sA_1_148 : segChk P ctxA yA_1_147 tA_1_148 yA_1_148 = true := by decide +kernel
theorem sA_1_149 : segChk P ctxA yA_1_148 tA_1_149 yA_1_149 = true := by decide +kernel
theorem sA_1_150 : segChk P ctxA yA_1_149 tA_1_150 yA_1_150 = true := by decide +kernel

end PackLean.D45DT.KL
