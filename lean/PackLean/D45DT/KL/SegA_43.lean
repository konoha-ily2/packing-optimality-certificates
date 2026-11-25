-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_159 : segChk P ctxA yA_1_158 tA_1_159 yA_1_159 = true := by decide +kernel
theorem sA_1_160 : segChk P ctxA yA_1_159 tA_1_160 yA_1_160 = true := by decide +kernel
theorem sA_1_161 : segChk P ctxA yA_1_160 tA_1_161 yA_1_161 = true := by decide +kernel
theorem sA_1_162 : segChk P ctxA yA_1_161 tA_1_162 yA_1_162 = true := by decide +kernel

end PackLean.D45DT.KL
