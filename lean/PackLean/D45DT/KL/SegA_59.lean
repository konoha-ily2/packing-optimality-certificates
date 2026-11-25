-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_223 : segChk P ctxA yA_1_222 tA_1_223 yA_1_223 = true := by decide +kernel
theorem sA_1_224 : segChk P ctxA yA_1_223 tA_1_224 yA_1_224 = true := by decide +kernel
theorem sA_1_225 : segChk P ctxA yA_1_224 tA_1_225 yA_1_225 = true := by decide +kernel
theorem sA_1_226 : segChk P ctxA yA_1_225 tA_1_226 yA_1_226 = true := by decide +kernel

end PackLean.D45DT.KL
