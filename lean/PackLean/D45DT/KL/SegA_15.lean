-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_47 : segChk P ctxA yA_1_46 tA_1_47 yA_1_47 = true := by decide +kernel
theorem sA_1_48 : segChk P ctxA yA_1_47 tA_1_48 yA_1_48 = true := by decide +kernel
theorem sA_1_49 : segChk P ctxA yA_1_48 tA_1_49 yA_1_49 = true := by decide +kernel
theorem sA_1_50 : segChk P ctxA yA_1_49 tA_1_50 yA_1_50 = true := by decide +kernel

end PackLean.D45DT.KL
