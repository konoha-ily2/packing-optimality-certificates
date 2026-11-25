-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_0_12 : segChk P ctxA yA_0_11 tA_0_12 yA_0_12 = true := by decide +kernel
theorem sA_1_0 : segChk P ctxA ([⟨[-128, 0, -1024, -1024, -1024, -1024], [128, 32, -1024, 1024, 1024, 1024]⟩], 0, false) tA_1_0 yA_1_0 = true := by decide +kernel
theorem sA_1_1 : segChk P ctxA yA_1_0 tA_1_1 yA_1_1 = true := by decide +kernel
theorem sA_1_2 : segChk P ctxA yA_1_1 tA_1_2 yA_1_2 = true := by decide +kernel

end PackLean.D45DT.KL
