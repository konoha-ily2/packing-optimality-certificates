-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_63 : segChk P ctxA yA_1_62 tA_1_63 yA_1_63 = true := by decide +kernel
theorem sA_1_64 : segChk P ctxA yA_1_63 tA_1_64 yA_1_64 = true := by decide +kernel
theorem sA_1_65 : segChk P ctxA yA_1_64 tA_1_65 yA_1_65 = true := by decide +kernel
theorem sA_1_66 : segChk P ctxA yA_1_65 tA_1_66 yA_1_66 = true := by decide +kernel

end PackLean.D45DT.KL
