-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sB_6_15 : segChk P ctxB yB_6_14 tB_6_15 yB_6_15 = true := by decide +kernel
theorem sB_6_16 : segChk P ctxB yB_6_15 tB_6_16 yB_6_16 = true := by decide +kernel
theorem sB_7_0 : segChk P ctxB ([⟨[-224, 0, -512, -512, -512, -512], [64, 16, 512, 512, 512, -512]⟩], 0, false) tB_7_0 yB_7_0 = true := by decide +kernel
theorem sB_7_1 : segChk P ctxB yB_7_0 tB_7_1 yB_7_1 = true := by decide +kernel

end PackLean.D45DT.KL
