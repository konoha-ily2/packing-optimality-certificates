-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_59 : segChk P ctxA yA_1_58 tA_1_59 yA_1_59 = true := by decide +kernel
theorem sA_1_60 : segChk P ctxA yA_1_59 tA_1_60 yA_1_60 = true := by decide +kernel
theorem sA_1_61 : segChk P ctxA yA_1_60 tA_1_61 yA_1_61 = true := by decide +kernel
theorem sA_1_62 : segChk P ctxA yA_1_61 tA_1_62 yA_1_62 = true := by decide +kernel

end PackLean.D45DT.KL
