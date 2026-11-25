-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_1_46 : segChk P ctxB yB_1_45 tB_1_46 yB_1_46 = true := by decide +kernel
theorem sB_1_47 : segChk P ctxB yB_1_46 tB_1_47 yB_1_47 = true := by decide +kernel
theorem sB_2_0 : segChk P ctxB ([⟨[-224, 0, -512, 512, -512, -512], [64, 16, 512, 512, 512, 512]⟩], 0, false) tB_2_0 yB_2_0 = true := by decide +kernel
theorem sB_3_0 : segChk P ctxB ([⟨[-224, 0, -512, -512, -512, -512], [64, 16, 512, -512, 512, 512]⟩], 0, false) tB_3_0 yB_3_0 = true := by decide +kernel

end PackLean.D45DT.KL
