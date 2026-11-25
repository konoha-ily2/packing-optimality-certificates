-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_163 : segChk P ctxA yA_1_162 tA_1_163 yA_1_163 = true := by decide +kernel
theorem sA_1_164 : segChk P ctxA yA_1_163 tA_1_164 yA_1_164 = true := by decide +kernel
theorem sA_1_165 : segChk P ctxA yA_1_164 tA_1_165 yA_1_165 = true := by decide +kernel
theorem sA_1_166 : segChk P ctxA yA_1_165 tA_1_166 yA_1_166 = true := by decide +kernel

end PackLean.D45DT.KL
