-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_183 : segChk P ctxA yA_1_182 tA_1_183 yA_1_183 = true := by decide +kernel
theorem sA_1_184 : segChk P ctxA yA_1_183 tA_1_184 yA_1_184 = true := by decide +kernel
theorem sA_1_185 : segChk P ctxA yA_1_184 tA_1_185 yA_1_185 = true := by decide +kernel
theorem sA_1_186 : segChk P ctxA yA_1_185 tA_1_186 yA_1_186 = true := by decide +kernel

end PackLean.D45DT.KL
