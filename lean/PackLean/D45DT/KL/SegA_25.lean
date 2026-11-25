-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_87 : segChk P ctxA yA_1_86 tA_1_87 yA_1_87 = true := by decide +kernel
theorem sA_1_88 : segChk P ctxA yA_1_87 tA_1_88 yA_1_88 = true := by decide +kernel
theorem sA_1_89 : segChk P ctxA yA_1_88 tA_1_89 yA_1_89 = true := by decide +kernel
theorem sA_1_90 : segChk P ctxA yA_1_89 tA_1_90 yA_1_90 = true := by decide +kernel

end PackLean.D45DT.KL
