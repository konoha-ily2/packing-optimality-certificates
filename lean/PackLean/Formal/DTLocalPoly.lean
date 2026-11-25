import PackLean.Formal.PolySemN
import PackLean.Formal.DTBase

/-!
# A9k stage 7c-3 (part): the meaning of `D45DT.lamLb` (the six-variable box test of the local tube)

Design: `plan/A9k_dodintet_design.md` §2 (the `lamLb` row), §3 (7c-3).

* `dtLocOk P`: the Bool of the case for the local √5 bracket (`sqbOk` of `toProb P` with `sqbL`, `sqkL`).
* `bracketL`: `dtExtraOk P` and `dtLocOk P` give `BracketG P.sqbL (maskOf PS) (2 ^ P.sqkL)`.
* **`lamLb_spec`**: `lamLb P D dmax H lo hi = some v` ⇒ at every point `z` of the box `[lo, hi]`
  (`lo ≤ hi`, `hi − lo` even on each of the six axes), `v ≤ 2^sqkL · D^dmax · H(z / D)`.
  This is `PolySemN.shiftLbN_spec` with `n = 6` and the step `PolySemN.step_lam` (an axis of width `0`
  is a constant factor); the body of `lamLb` is the body of `shiftLbN_spec` (`rfl`).

The box conditions (`lo ≤ hi`, even widths) are not checked by `lamLb`; they come from the local tree
(`lroots`, `lsplitT`), stage 7c-3 proper.
-/

namespace PackLean.Formal.DTLocalPoly

open PackLean.D28 (FE fsmul Mono Poly psum psmulZ pmulAff monoLb loHi nth sqbOk)
open PackLean.D45DT (Prm PS toProb lamLb)
open PackLean.Formal.PolySemG (BracketG maskOf)
open PackLean.Formal.PolySemN (pEvalN WFN step_lam shiftLbN_spec deg_of_not_any)
open PackLean.Formal.DTBase (dtExtraOk)

/-- `toProb P` with the local bracket of √5 in place of the far one. -/
def toProbL (P : Prm) : PackLean.D28.Prob := { toProb P with sqb := P.sqbL, sqk := P.sqkL }

/-- The Bool of the case for the local √5 bracket. -/
def dtLocOk (P : Prm) : Bool := sqbOk (toProbL P)

/-- The √5 bracket of the local tube (`K = 2 ^ sqkL`). -/
theorem bracketL {P : Prm} (h0 : dtExtraOk P = true) (h : dtLocOk P = true) :
    BracketG P.sqbL (maskOf PS) ((2 : ℝ) ^ P.sqkL) := by
  simp only [dtExtraOk, Bool.and_eq_true] at h0
  have hwf : PackLean.Formal.TetFar.wfOk (toProbL P) = true := h0.1.1
  exact PackLean.Formal.TetFar.bracket_of_sqbOk (PackLean.Formal.TetFar.wf_of_ok hwf) h

/-- **The six-variable box test of `lamLb`.**  If `lamLb` returns `v`, then `v` is a lower bound of
`2^sqkL · D^dmax · H(z / D)` at every point `z` of the box `[lo, hi]`. -/
theorem lamLb_spec {P : Prm} (h0 : dtExtraOk P = true) (hL : dtLocOk P = true)
    {D : ℤ} (hD : 0 < D) {dmax : ℕ} {H : Poly} (hH : WFN 6 PS H) {lo hi : List ℤ}
    (hlo : lo.length = 6) (hhi : hi.length = 6)
    (hbox : ∀ k : Fin 6, nth lo k 0 ≤ nth hi k 0 ∧ (nth hi k 0 - nth lo k 0) % 2 = 0)
    {v : ℤ} (hv : lamLb P D dmax H lo hi = some v)
    (z : Fin 6 → ℝ) (hzb : ∀ k : Fin 6, ((nth lo k 0 : ℤ) : ℝ) ≤ z k ∧ z k ≤ ((nth hi k 0 : ℤ) : ℝ)) :
    (v : ℝ) ≤ (2 : ℝ) ^ P.sqkL * ((D : ℝ) ^ dmax * pEvalN 6 PS H (fun k => z k / D)) := by
  have hb := bracketL h0 hL
  unfold lamLb at hv
  split_ifs at hv with hdeg
  have hdeg' := deg_of_not_any hdeg
  have hspec := shiftLbN_spec hb hD dmax hH hdeg' hlo hhi hbox _
    (fun s => step_lam (n := 6) (ps := PS) _ _ s) z hzb
  simp only [Option.some.injEq] at hv
  rw [← hv]
  exact hspec

#assert_std_axioms PackLean.Formal.DTLocalPoly.lamLb_spec PackLean.Formal.DTLocalPoly.bracketL

end PackLean.Formal.DTLocalPoly
