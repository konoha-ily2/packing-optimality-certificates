-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_167 : segChk P ctxA yA_1_166 tA_1_167 yA_1_167 = true := by decide +kernel
theorem sA_1_168 : segChk P ctxA yA_1_167 tA_1_168 yA_1_168 = true := by decide +kernel
theorem sA_1_169 : segChk P ctxA yA_1_168 tA_1_169 yA_1_169 = true := by decide +kernel
theorem sA_1_170 : segChk P ctxA yA_1_169 tA_1_170 yA_1_170 = true := by decide +kernel

end PackLean.D45DT.KL
