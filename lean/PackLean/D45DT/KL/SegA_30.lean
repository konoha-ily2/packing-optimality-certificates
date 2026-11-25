-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_107 : segChk P ctxA yA_1_106 tA_1_107 yA_1_107 = true := by decide +kernel
theorem sA_1_108 : segChk P ctxA yA_1_107 tA_1_108 yA_1_108 = true := by decide +kernel
theorem sA_1_109 : segChk P ctxA yA_1_108 tA_1_109 yA_1_109 = true := by decide +kernel
theorem sA_1_110 : segChk P ctxA yA_1_109 tA_1_110 yA_1_110 = true := by decide +kernel

end PackLean.D45DT.KL
