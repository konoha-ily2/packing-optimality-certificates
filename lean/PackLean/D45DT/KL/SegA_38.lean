-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_139 : segChk P ctxA yA_1_138 tA_1_139 yA_1_139 = true := by decide +kernel
theorem sA_1_140 : segChk P ctxA yA_1_139 tA_1_140 yA_1_140 = true := by decide +kernel
theorem sA_1_141 : segChk P ctxA yA_1_140 tA_1_141 yA_1_141 = true := by decide +kernel
theorem sA_1_142 : segChk P ctxA yA_1_141 tA_1_142 yA_1_142 = true := by decide +kernel

end PackLean.D45DT.KL
