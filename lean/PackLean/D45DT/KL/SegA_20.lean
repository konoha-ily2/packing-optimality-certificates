-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_67 : segChk P ctxA yA_1_66 tA_1_67 yA_1_67 = true := by decide +kernel
theorem sA_1_68 : segChk P ctxA yA_1_67 tA_1_68 yA_1_68 = true := by decide +kernel
theorem sA_1_69 : segChk P ctxA yA_1_68 tA_1_69 yA_1_69 = true := by decide +kernel
theorem sA_1_70 : segChk P ctxA yA_1_69 tA_1_70 yA_1_70 = true := by decide +kernel

end PackLean.D45DT.KL
