-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_219 : segChk P ctxA yA_1_218 tA_1_219 yA_1_219 = true := by decide +kernel
theorem sA_1_220 : segChk P ctxA yA_1_219 tA_1_220 yA_1_220 = true := by decide +kernel
theorem sA_1_221 : segChk P ctxA yA_1_220 tA_1_221 yA_1_221 = true := by decide +kernel
theorem sA_1_222 : segChk P ctxA yA_1_221 tA_1_222 yA_1_222 = true := by decide +kernel

end PackLean.D45DT.KL
