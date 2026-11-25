-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_195 : segChk P ctxA yA_1_194 tA_1_195 yA_1_195 = true := by decide +kernel
theorem sA_1_196 : segChk P ctxA yA_1_195 tA_1_196 yA_1_196 = true := by decide +kernel
theorem sA_1_197 : segChk P ctxA yA_1_196 tA_1_197 yA_1_197 = true := by decide +kernel
theorem sA_1_198 : segChk P ctxA yA_1_197 tA_1_198 yA_1_198 = true := by decide +kernel

end PackLean.D45DT.KL
