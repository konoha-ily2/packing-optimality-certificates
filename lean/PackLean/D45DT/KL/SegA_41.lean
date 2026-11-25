-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_151 : segChk P ctxA yA_1_150 tA_1_151 yA_1_151 = true := by decide +kernel
theorem sA_1_152 : segChk P ctxA yA_1_151 tA_1_152 yA_1_152 = true := by decide +kernel
theorem sA_1_153 : segChk P ctxA yA_1_152 tA_1_153 yA_1_153 = true := by decide +kernel
theorem sA_1_154 : segChk P ctxA yA_1_153 tA_1_154 yA_1_154 = true := by decide +kernel

end PackLean.D45DT.KL
