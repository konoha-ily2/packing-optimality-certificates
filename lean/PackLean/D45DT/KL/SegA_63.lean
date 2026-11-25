-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_7_1 : segChk P ctxA yA_7_0 tA_7_1 yA_7_1 = true := by decide +kernel
theorem sA_7_2 : segChk P ctxA yA_7_1 tA_7_2 yA_7_2 = true := by decide +kernel

end PackLean.D45DT.KL
