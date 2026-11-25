-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_155 : segChk P ctxA yA_1_154 tA_1_155 yA_1_155 = true := by decide +kernel
theorem sA_1_156 : segChk P ctxA yA_1_155 tA_1_156 yA_1_156 = true := by decide +kernel
theorem sA_1_157 : segChk P ctxA yA_1_156 tA_1_157 yA_1_157 = true := by decide +kernel
theorem sA_1_158 : segChk P ctxA yA_1_157 tA_1_158 yA_1_158 = true := by decide +kernel

end PackLean.D45DT.KL
