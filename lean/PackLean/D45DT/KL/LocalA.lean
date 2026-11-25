-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.FaceA
import PackLean.D45DT.KL.RowA
import PackLean.D45DT.KL.BrA

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- the local lemma on T_A (`tubeRunL`, faces as `List Char`) in the kernel only -/
theorem localA_okK : tubeRunL P P.tA candsA 1024 facesAL = (true, [124, 2450, 26, 16, 10, 14, 6, 24]) := by
  rw [tubeRunL_eq, sp_okA]
  exact tubeRunLS_eight (ulo := -128) (uhi := 128) (r0 := 32) (by decide +kernel) (by decide +kernel)
    (by decide +kernel) rfl (by decide +kernel) (by decide +kernel)
    faceA_0 faceA_1 faceA_2 faceA_3 faceA_4 faceA_5 faceA_6 faceA_7

/-- the same in the `String` form of `Local.lean` (`localA_ok` there, by native_decide) -/
theorem localA_okS : tubeRun P P.tA candsA 1024 facesA = (true, [124, 2450, 26, 16, 10, 14, 6, 24]) := by
  rw [tubeRun_eq, facesL_eqA]
  exact localA_okK

end PackLean.D45DT.KL
