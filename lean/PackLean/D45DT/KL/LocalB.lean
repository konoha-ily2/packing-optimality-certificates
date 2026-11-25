-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.FaceB
import PackLean.D45DT.KL.RowB
import PackLean.D45DT.KL.BrB

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- the local lemma on T_B (`tubeRunL`, faces as `List Char`) in the kernel only -/
theorem localB_okK : tubeRunL P P.tB candsB 512 facesBL = (true, [259, 480, 2, 40, 4, 1, 168, 48]) := by
  rw [tubeRunL_eq, sp_okB]
  exact tubeRunLS_eight (ulo := -224) (uhi := 64) (r0 := 16) (by decide +kernel) (by decide +kernel)
    (by decide +kernel) rfl (by decide +kernel) (by decide +kernel)
    faceB_0 faceB_1 faceB_2 faceB_3 faceB_4 faceB_5 faceB_6 faceB_7

/-- the same in the `String` form of `Local.lean` (`localB_ok` there, by native_decide) -/
theorem localB_okS : tubeRun P P.tB candsB 512 facesB = (true, [259, 480, 2, 40, 4, 1, 168, 48]) := by
  rw [tubeRun_eq, facesL_eqB]
  exact localB_okK

end PackLean.D45DT.KL
