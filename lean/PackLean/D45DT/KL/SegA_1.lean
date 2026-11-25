-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_0_4 : segChk P ctxA yA_0_3 tA_0_4 yA_0_4 = true := by decide +kernel
theorem sA_0_5 : segChk P ctxA yA_0_4 tA_0_5 yA_0_5 = true := by decide +kernel
theorem sA_0_6 : segChk P ctxA yA_0_5 tA_0_6 yA_0_6 = true := by decide +kernel
theorem sA_0_7 : segChk P ctxA yA_0_6 tA_0_7 yA_0_7 = true := by decide +kernel

end PackLean.D45DT.KL
