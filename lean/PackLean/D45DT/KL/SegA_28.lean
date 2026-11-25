-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_99 : segChk P ctxA yA_1_98 tA_1_99 yA_1_99 = true := by decide +kernel
theorem sA_1_100 : segChk P ctxA yA_1_99 tA_1_100 yA_1_100 = true := by decide +kernel
theorem sA_1_101 : segChk P ctxA yA_1_100 tA_1_101 yA_1_101 = true := by decide +kernel
theorem sA_1_102 : segChk P ctxA yA_1_101 tA_1_102 yA_1_102 = true := by decide +kernel

end PackLean.D45DT.KL
