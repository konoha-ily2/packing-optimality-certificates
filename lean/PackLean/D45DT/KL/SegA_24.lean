-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_83 : segChk P ctxA yA_1_82 tA_1_83 yA_1_83 = true := by decide +kernel
theorem sA_1_84 : segChk P ctxA yA_1_83 tA_1_84 yA_1_84 = true := by decide +kernel
theorem sA_1_85 : segChk P ctxA yA_1_84 tA_1_85 yA_1_85 = true := by decide +kernel
theorem sA_1_86 : segChk P ctxA yA_1_85 tA_1_86 yA_1_86 = true := by decide +kernel

end PackLean.D45DT.KL
