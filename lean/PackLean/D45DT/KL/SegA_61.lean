-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_2_2 : segChk P ctxA yA_2_1 tA_2_2 yA_2_2 = true := by decide +kernel
theorem sA_3_0 : segChk P ctxA ([⟨[-128, 0, -1024, -1024, -1024, -1024], [128, 32, 1024, -1024, 1024, 1024]⟩], 0, false) tA_3_0 yA_3_0 = true := by decide +kernel
theorem sA_3_1 : segChk P ctxA yA_3_0 tA_3_1 yA_3_1 = true := by decide +kernel
theorem sA_4_0 : segChk P ctxA ([⟨[-128, 0, -1024, -1024, 1024, -1024], [128, 32, 1024, 1024, 1024, 1024]⟩], 0, false) tA_4_0 yA_4_0 = true := by decide +kernel

end PackLean.D45DT.KL
