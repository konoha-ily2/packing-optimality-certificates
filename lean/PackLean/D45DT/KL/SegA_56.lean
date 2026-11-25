-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_211 : segChk P ctxA yA_1_210 tA_1_211 yA_1_211 = true := by decide +kernel
theorem sA_1_212 : segChk P ctxA yA_1_211 tA_1_212 yA_1_212 = true := by decide +kernel
theorem sA_1_213 : segChk P ctxA yA_1_212 tA_1_213 yA_1_213 = true := by decide +kernel
theorem sA_1_214 : segChk P ctxA yA_1_213 tA_1_214 yA_1_214 = true := by decide +kernel

end PackLean.D45DT.KL
