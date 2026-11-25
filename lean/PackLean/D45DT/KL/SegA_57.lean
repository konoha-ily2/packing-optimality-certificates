-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_215 : segChk P ctxA yA_1_214 tA_1_215 yA_1_215 = true := by decide +kernel
theorem sA_1_216 : segChk P ctxA yA_1_215 tA_1_216 yA_1_216 = true := by decide +kernel
theorem sA_1_217 : segChk P ctxA yA_1_216 tA_1_217 yA_1_217 = true := by decide +kernel
theorem sA_1_218 : segChk P ctxA yA_1_217 tA_1_218 yA_1_218 = true := by decide +kernel

end PackLean.D45DT.KL
