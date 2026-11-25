-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_115 : segChk P ctxA yA_1_114 tA_1_115 yA_1_115 = true := by decide +kernel
theorem sA_1_116 : segChk P ctxA yA_1_115 tA_1_116 yA_1_116 = true := by decide +kernel
theorem sA_1_117 : segChk P ctxA yA_1_116 tA_1_117 yA_1_117 = true := by decide +kernel
theorem sA_1_118 : segChk P ctxA yA_1_117 tA_1_118 yA_1_118 = true := by decide +kernel

end PackLean.D45DT.KL
