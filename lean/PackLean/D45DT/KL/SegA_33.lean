-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_119 : segChk P ctxA yA_1_118 tA_1_119 yA_1_119 = true := by decide +kernel
theorem sA_1_120 : segChk P ctxA yA_1_119 tA_1_120 yA_1_120 = true := by decide +kernel
theorem sA_1_121 : segChk P ctxA yA_1_120 tA_1_121 yA_1_121 = true := by decide +kernel
theorem sA_1_122 : segChk P ctxA yA_1_121 tA_1_122 yA_1_122 = true := by decide +kernel

end PackLean.D45DT.KL
