-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_135 : segChk P ctxA yA_1_134 tA_1_135 yA_1_135 = true := by decide +kernel
theorem sA_1_136 : segChk P ctxA yA_1_135 tA_1_136 yA_1_136 = true := by decide +kernel
theorem sA_1_137 : segChk P ctxA yA_1_136 tA_1_137 yA_1_137 = true := by decide +kernel
theorem sA_1_138 : segChk P ctxA yA_1_137 tA_1_138 yA_1_138 = true := by decide +kernel

end PackLean.D45DT.KL
