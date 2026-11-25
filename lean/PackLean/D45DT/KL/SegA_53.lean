-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_199 : segChk P ctxA yA_1_198 tA_1_199 yA_1_199 = true := by decide +kernel
theorem sA_1_200 : segChk P ctxA yA_1_199 tA_1_200 yA_1_200 = true := by decide +kernel
theorem sA_1_201 : segChk P ctxA yA_1_200 tA_1_201 yA_1_201 = true := by decide +kernel
theorem sA_1_202 : segChk P ctxA yA_1_201 tA_1_202 yA_1_202 = true := by decide +kernel

end PackLean.D45DT.KL
