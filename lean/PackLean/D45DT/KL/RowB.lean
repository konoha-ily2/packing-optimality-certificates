-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.TabB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sp_okB : candsB.map (fun cd => splitE0 (candPoly (locParts P P.tB) cd)) = spB := by decide +kernel

end PackLean.D45DT.KL
