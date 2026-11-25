-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_55 : segChk P ctxA yA_1_54 tA_1_55 yA_1_55 = true := by decide +kernel
theorem sA_1_56 : segChk P ctxA yA_1_55 tA_1_56 yA_1_56 = true := by decide +kernel
theorem sA_1_57 : segChk P ctxA yA_1_56 tA_1_57 yA_1_57 = true := by decide +kernel
theorem sA_1_58 : segChk P ctxA yA_1_57 tA_1_58 yA_1_58 = true := by decide +kernel

end PackLean.D45DT.KL
