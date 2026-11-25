-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_35 : segChk P ctxA yA_1_34 tA_1_35 yA_1_35 = true := by decide +kernel
theorem sA_1_36 : segChk P ctxA yA_1_35 tA_1_36 yA_1_36 = true := by decide +kernel
theorem sA_1_37 : segChk P ctxA yA_1_36 tA_1_37 yA_1_37 = true := by decide +kernel
theorem sA_1_38 : segChk P ctxA yA_1_37 tA_1_38 yA_1_38 = true := by decide +kernel

end PackLean.D45DT.KL
