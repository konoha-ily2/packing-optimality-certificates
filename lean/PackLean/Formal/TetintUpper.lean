import PackLean.Formal.TetintCase
import PackLean.D40.Data

/-!
# A9 stage 7e-4: the upper bound of tetintet on the data of `D40`

Design: `plan/A9f_tet_design.md` §10.  The configuration of `D40/Data.lean` (`d40_upper.py`): the
stopped piece `R̂ = M(q̂)/|q̂|²` moved by `t1Up`, the corner piece `τ = diag(−1, 1, −1)` moved by
`t2Up`, the plane normal `nUp`.  The rows and the separation are checked here as real inequalities
with `norm_num` (the same numbers as `D40.upperOk`, not through its Boolean value), directly at the
edge `b = 1.9535642446` of `Spec.tetintet_n02` (so `bracketOk` is not needed: `s_up ≤ b` is implicit
in the rows at `b`).
-/

namespace PackLean.Formal.TetintUpper

open PackLean.Formal PackLean.Formal.PolyLP PackLean.Formal.TetintFar PackLean.Formal.TetintCase
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.TetSep (bT)
open PackLean.D40 (Rt nth vt)
open PackLean.D40.Tet (qhat t1Up t2Up nUp)

noncomputable section

/-- The real value of a rational of `D40`. -/
def rtv (x : Rt) : ℝ := (x.n : ℝ) / x.d

/-- The real vector of three rationals. -/
def vecRt (l : List Rt) : E3 :=
  !₂[rtv (nth l 0 ⟨0, 1⟩), rtv (nth l 1 ⟨0, 1⟩), rtv (nth l 2 ⟨0, 1⟩)]

def A1 : M3 := qrot (nth qhat 0 0) (nth qhat 1 0) (nth qhat 2 0) (nth qhat 3 0)
def A2 : M3 := !![-1, 0, 0; 0, 1, 0; 0, 0, -1]

/-- The edge `b` of `Spec.tetintet_n02`. -/
def bUp : ℝ := 19535642446 / 10 ^ 10

theorem A1_SO : A1 ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ := by
  apply qrot_SO
  simp only [qhat, nth, List.getD_cons_zero, List.getD_cons_succ]
  norm_num

set_option maxHeartbeats 4000000 in
theorem rows1 : ∀ l < 4, ∀ f, dot (bT f) (mv A1 (VD l) + vecRt t1Up) ≤ bUp / 2 := by
  intro l hl f
  simp only [A1, bUp, qhat, t1Up, vecRt, rtv, nth, List.getD_cons_zero, List.getD_cons_succ]
  interval_cases l <;> fin_cases f <;>
    simp [qrot, mv_apply, VD, vtR, vt, nth, dot, bT, Fin.sum_univ_three] <;> norm_num

set_option maxHeartbeats 4000000 in
theorem rows2 : ∀ l < 4, ∀ f, dot (bT f) (mv A2 (VD l) + vecRt t2Up) ≤ bUp / 2 := by
  intro l hl f
  simp only [A2, bUp, t2Up, vecRt, rtv, nth, List.getD_cons_zero, List.getD_cons_succ]
  interval_cases l <;> fin_cases f <;>
    simp [mv_apply, VD, vtR, vt, nth, dot, bT, Fin.sum_univ_three] <;> norm_num

set_option maxHeartbeats 4000000 in
theorem sep : ∀ l < 4, ∀ l' < 4,
    dot (vecRt nUp) (mv A1 (VD l) + vecRt t1Up) ≤ dot (vecRt nUp) (mv A2 (VD l') + vecRt t2Up) := by
  intro l hl l' hl'
  simp only [A1, A2, qhat, t1Up, t2Up, nUp, vecRt, rtv, nth, List.getD_cons_zero, List.getD_cons_succ]
  interval_cases l <;> interval_cases l' <;>
    simp [qrot, mv_apply, VD, vtR, vt, nth, dot, Fin.sum_univ_three] <;> norm_num

theorem nUp_ne : vecRt nUp ≠ 0 := by
  intro h
  have := congrArg (fun v : E3 => v 2) h
  simp [vecRt, rtv, nUp, nth] at this

/-- **The upper bound of tetintet**: two unit tetrahedra fit in the tetrahedron of edge
`1.9535642446`. -/
theorem tetintet_upper : Fits tet tet 2 (19535642446 / 10 ^ 10) :=
  upper_of_sep A1_SO tau_SO nUp_ne (by norm_num) rows1 rows2 sep

end

#assert_std_axioms PackLean.Formal.TetintUpper.tetintet_upper

end PackLean.Formal.TetintUpper
