-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_143 : segChk P ctxA yA_1_142 tA_1_143 yA_1_143 = true := by decide +kernel
theorem sA_1_144 : segChk P ctxA yA_1_143 tA_1_144 yA_1_144 = true := by decide +kernel
theorem sA_1_145 : segChk P ctxA yA_1_144 tA_1_145 yA_1_145 = true := by decide +kernel
theorem sA_1_146 : segChk P ctxA yA_1_145 tA_1_146 yA_1_146 = true := by decide +kernel

end PackLean.D45DT.KL
