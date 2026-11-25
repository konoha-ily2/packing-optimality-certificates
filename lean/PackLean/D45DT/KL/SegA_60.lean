-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_227 : segChk P ctxA yA_1_226 tA_1_227 yA_1_227 = true := by decide +kernel
theorem sA_1_228 : segChk P ctxA yA_1_227 tA_1_228 yA_1_228 = true := by decide +kernel
theorem sA_2_0 : segChk P ctxA ([⟨[-128, 0, -1024, 1024, -1024, -1024], [128, 32, 1024, 1024, 1024, 1024]⟩], 0, false) tA_2_0 yA_2_0 = true := by decide +kernel
theorem sA_2_1 : segChk P ctxA yA_2_0 tA_2_1 yA_2_1 = true := by decide +kernel

end PackLean.D45DT.KL
