import PackLean.Formal.TetintLocal
import PackLean.D40.Data

/-!
# A9 stage 7e-5 (part 1): the constants of tetintet with the kernel

The constant parts of `TetintCover.FarConsts` and `TetintLocal.LocData` for the data of
`D40/Data.lean`, all by `decide +kernel` (no `native_decide`).  The tree runs (`D40/Far*.lean`,
`D40/Loc*.lean`, now `native_decide`) are the rest of stage 7e-5.
-/

namespace PackLean.Formal.Cases.TetTet

open PackLean.D40 (Cen decCand ratToD)
open PackLean.D40.Tet (P tab0 tab1 tab2 tab3 tab4 tab5 tab6)
open PackLean.Formal.TetintFar (vmapT)
open PackLean.Formal.TetintCover (FarConsts)
open PackLean.D28 (rotIntOk)

set_option maxRecDepth 100000

theorem far_consts : FarConsts P where
  nd := by decide +kernel
  den := by decide +kernel
  sd := by decide +kernel
  kd := by decide +kernel
  msign := by decide +kernel
  mus := by decide +kernel
  hm := by decide +kernel
  r0 := by decide +kernel
  r0hm := by decide +kernel
  rots := by decide +kernel

theorem du_pos : 0 < P.du := by decide +kernel
theorem hmD : ∃ v, ratToD P.du P.hmax = some v := ⟨24576, by decide +kernel⟩
theorem rD : ∃ v, ratToD P.du P.r0 = some v := ⟨2048, by decide +kernel⟩

theorem cens_ok : ∀ (c : ℕ) (ce : Cen), P.cens[c]? = some ce → (ce.side = 0 ∨ ce.side = 1) ∧
    ∃ a0 a1 a2 a3 : ℤ, ce.q = [a0, a1, a2, a3] ∧ 0 < a0 ^ 2 + a1 ^ 2 + a2 ^ 2 + a3 ^ 2 := by
  intro c ce h
  have hc : c < 7 := by
    by_contra hc
    rw [List.getElem?_eq_none (by have : P.cens.length = 7 := by decide +kernel
                                  omega)] at h
    exact absurd h (by simp)
  interval_cases c <;>
  · simp only [P, List.getElem?_cons_zero, List.getElem?_cons_succ, Option.some.injEq] at h
    subst h
    exact ⟨by decide, _, _, _, _, rfl, by decide +kernel⟩

theorem tabs_noS : ∀ tab ∈ [tab0, tab1, tab2, tab3, tab4, tab5, tab6], ∀ code ∈ tab,
    (decCand code).typ ≠ 2 := by decide +kernel

end PackLean.Formal.Cases.TetTet
