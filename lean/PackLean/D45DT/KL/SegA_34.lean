-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_123 : segChk P ctxA yA_1_122 tA_1_123 yA_1_123 = true := by decide +kernel
theorem sA_1_124 : segChk P ctxA yA_1_123 tA_1_124 yA_1_124 = true := by decide +kernel
theorem sA_1_125 : segChk P ctxA yA_1_124 tA_1_125 yA_1_125 = true := by decide +kernel
theorem sA_1_126 : segChk P ctxA yA_1_125 tA_1_126 yA_1_126 = true := by decide +kernel

end PackLean.D45DT.KL
