-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_191 : segChk P ctxA yA_1_190 tA_1_191 yA_1_191 = true := by decide +kernel
theorem sA_1_192 : segChk P ctxA yA_1_191 tA_1_192 yA_1_192 = true := by decide +kernel
theorem sA_1_193 : segChk P ctxA yA_1_192 tA_1_193 yA_1_193 = true := by decide +kernel
theorem sA_1_194 : segChk P ctxA yA_1_193 tA_1_194 yA_1_194 = true := by decide +kernel

end PackLean.D45DT.KL
