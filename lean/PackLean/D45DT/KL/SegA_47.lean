-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_175 : segChk P ctxA yA_1_174 tA_1_175 yA_1_175 = true := by decide +kernel
theorem sA_1_176 : segChk P ctxA yA_1_175 tA_1_176 yA_1_176 = true := by decide +kernel
theorem sA_1_177 : segChk P ctxA yA_1_176 tA_1_177 yA_1_177 = true := by decide +kernel
theorem sA_1_178 : segChk P ctxA yA_1_177 tA_1_178 yA_1_178 = true := by decide +kernel

end PackLean.D45DT.KL
