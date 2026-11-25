-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_0_24 : segChk P ctxB yB_0_23 tB_0_24 yB_0_24 = true := by decide +kernel
theorem sB_0_25 : segChk P ctxB yB_0_24 tB_0_25 yB_0_25 = true := by decide +kernel
theorem sB_1_0 : segChk P ctxB ([⟨[-224, 0, -512, -512, -512, -512], [64, 16, -512, 512, 512, 512]⟩], 0, false) tB_1_0 yB_1_0 = true := by decide +kernel
theorem sB_1_1 : segChk P ctxB yB_1_0 tB_1_1 yB_1_1 = true := by decide +kernel

end PackLean.D45DT.KL
