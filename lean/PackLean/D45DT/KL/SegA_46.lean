-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_171 : segChk P ctxA yA_1_170 tA_1_171 yA_1_171 = true := by decide +kernel
theorem sA_1_172 : segChk P ctxA yA_1_171 tA_1_172 yA_1_172 = true := by decide +kernel
theorem sA_1_173 : segChk P ctxA yA_1_172 tA_1_173 yA_1_173 = true := by decide +kernel
theorem sA_1_174 : segChk P ctxA yA_1_173 tA_1_174 yA_1_174 = true := by decide +kernel

end PackLean.D45DT.KL
