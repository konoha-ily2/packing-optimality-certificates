import PackLean.Formal.DTUpper
import PackLean.Formal.DTConsts

/-!
# A9k stage 7c-4: the upper bound for the dodintet_n02 data (kernel)

`upExtraOk P UP` and `upperRun P UP` (all six Bools) checked by `decide +kernel` (no `native_decide`), so
`DTUpper.upper_fitsT` gives the fit at `2√2 · (cnum + 1) / cden = 2√2 · 14986756530 / (5·10⁹)`.
-/

namespace PackLean.Formal.DTUpper

open PackLean.D45DT (P UP upperRun toProb)
open PackLean.Formal.TetFar (VV)

set_option maxRecDepth 100000 in
theorem dt_up_extra : upExtraOk P UP = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem dt_upper_run : upperRun P UP = [true, true, true, true, true, true] := by decide +kernel

/-- **The fit of `dodintet_n02`** (the piece `VV (toProb P)`; the bridge to `dod` is stage 7c-5). -/
theorem dt_upper :
    Fits (convexHull ℝ (VV (toProb P) '' {l | l < P.verts.length})) tet 2
      (2 * √2 * (((P.cnum : ℝ) + 1) / P.cden)) :=
  upper_fitsT DTBase.dt_extra_ok dt_up_extra dt_upper_run

#assert_std_axioms PackLean.Formal.DTUpper.dt_upper

end PackLean.Formal.DTUpper
