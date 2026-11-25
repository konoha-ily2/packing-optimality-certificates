-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TokA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sA_1_103 : segChk P ctxA yA_1_102 tA_1_103 yA_1_103 = true := by decide +kernel
theorem sA_1_104 : segChk P ctxA yA_1_103 tA_1_104 yA_1_104 = true := by decide +kernel
theorem sA_1_105 : segChk P ctxA yA_1_104 tA_1_105 yA_1_105 = true := by decide +kernel
theorem sA_1_106 : segChk P ctxA yA_1_105 tA_1_106 yA_1_106 = true := by decide +kernel

end PackLean.D45DT.KL
