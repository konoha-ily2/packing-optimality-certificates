-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_111 : segChk P ctxA yA_1_110 tA_1_111 yA_1_111 = true := by decide +kernel
theorem sA_1_112 : segChk P ctxA yA_1_111 tA_1_112 yA_1_112 = true := by decide +kernel
theorem sA_1_113 : segChk P ctxA yA_1_112 tA_1_113 yA_1_113 = true := by decide +kernel
theorem sA_1_114 : segChk P ctxA yA_1_113 tA_1_114 yA_1_114 = true := by decide +kernel

end PackLean.D45DT.KL
