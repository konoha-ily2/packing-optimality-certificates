-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_187 : segChk P ctxA yA_1_186 tA_1_187 yA_1_187 = true := by decide +kernel
theorem sA_1_188 : segChk P ctxA yA_1_187 tA_1_188 yA_1_188 = true := by decide +kernel
theorem sA_1_189 : segChk P ctxA yA_1_188 tA_1_189 yA_1_189 = true := by decide +kernel
theorem sA_1_190 : segChk P ctxA yA_1_189 tA_1_190 yA_1_190 = true := by decide +kernel

end PackLean.D45DT.KL
