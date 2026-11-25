-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_95 : segChk P ctxA yA_1_94 tA_1_95 yA_1_95 = true := by decide +kernel
theorem sA_1_96 : segChk P ctxA yA_1_95 tA_1_96 yA_1_96 = true := by decide +kernel
theorem sA_1_97 : segChk P ctxA yA_1_96 tA_1_97 yA_1_97 = true := by decide +kernel
theorem sA_1_98 : segChk P ctxA yA_1_97 tA_1_98 yA_1_98 = true := by decide +kernel

end PackLean.D45DT.KL
