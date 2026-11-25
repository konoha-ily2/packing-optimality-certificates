-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_39 : segChk P ctxA yA_1_38 tA_1_39 yA_1_39 = true := by decide +kernel
theorem sA_1_40 : segChk P ctxA yA_1_39 tA_1_40 yA_1_40 = true := by decide +kernel
theorem sA_1_41 : segChk P ctxA yA_1_40 tA_1_41 yA_1_41 = true := by decide +kernel
theorem sA_1_42 : segChk P ctxA yA_1_41 tA_1_42 yA_1_42 = true := by decide +kernel

end PackLean.D45DT.KL
