-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_0_8 : segChk P ctxA yA_0_7 tA_0_8 yA_0_8 = true := by decide +kernel
theorem sA_0_9 : segChk P ctxA yA_0_8 tA_0_9 yA_0_9 = true := by decide +kernel
theorem sA_0_10 : segChk P ctxA yA_0_9 tA_0_10 yA_0_10 = true := by decide +kernel
theorem sA_0_11 : segChk P ctxA yA_0_10 tA_0_11 yA_0_11 = true := by decide +kernel

end PackLean.D45DT.KL
