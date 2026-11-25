-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_75 : segChk P ctxA yA_1_74 tA_1_75 yA_1_75 = true := by decide +kernel
theorem sA_1_76 : segChk P ctxA yA_1_75 tA_1_76 yA_1_76 = true := by decide +kernel
theorem sA_1_77 : segChk P ctxA yA_1_76 tA_1_77 yA_1_77 = true := by decide +kernel
theorem sA_1_78 : segChk P ctxA yA_1_77 tA_1_78 yA_1_78 = true := by decide +kernel

end PackLean.D45DT.KL
