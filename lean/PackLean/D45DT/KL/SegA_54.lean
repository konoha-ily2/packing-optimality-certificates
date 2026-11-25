-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_203 : segChk P ctxA yA_1_202 tA_1_203 yA_1_203 = true := by decide +kernel
theorem sA_1_204 : segChk P ctxA yA_1_203 tA_1_204 yA_1_204 = true := by decide +kernel
theorem sA_1_205 : segChk P ctxA yA_1_204 tA_1_205 yA_1_205 = true := by decide +kernel
theorem sA_1_206 : segChk P ctxA yA_1_205 tA_1_206 yA_1_206 = true := by decide +kernel

end PackLean.D45DT.KL
