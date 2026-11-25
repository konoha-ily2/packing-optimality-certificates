-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_79 : segChk P ctxA yA_1_78 tA_1_79 yA_1_79 = true := by decide +kernel
theorem sA_1_80 : segChk P ctxA yA_1_79 tA_1_80 yA_1_80 = true := by decide +kernel
theorem sA_1_81 : segChk P ctxA yA_1_80 tA_1_81 yA_1_81 = true := by decide +kernel
theorem sA_1_82 : segChk P ctxA yA_1_81 tA_1_82 yA_1_82 = true := by decide +kernel

end PackLean.D45DT.KL
