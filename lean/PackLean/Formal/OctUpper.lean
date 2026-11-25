import PackLean.Formal.OctFar
import PackLean.D31.UpperCore

/-!
# A9 stage 7d (part 4): the upper bound of `D31` (octintet)

Design: `plan/A9f_tet_design.md` §3, §9 (7d-4).  `D31.upperOk U` (`D31/UpperCore.lean`, data
`D31/Upper.lean` written by `lean/tools/export_d31_upper.py`) checks with integers that the octahedron
scaled by `1/β` (`β = √2/4`, vertices `octW = ±2 e_k`), rotated by the integer matrices `A₁`, `A₂`
and moved by `t₁`, `t₂`, satisfies the four container rows `b · x ≤ c` and lies on the two sides of
the plane `n · x = h`.  Multiplying by `β` gives the unit octahedron `VV` (vertices `±(√2/2) e_k`):

* `vecI`: the real vector of an integer list; `placed`: `A (VV l) + β t = β (A w_l + t)`;
* **`upper_fits`**: `upperOk U` ⇒ two copies of `conv (VV '' {l < 6})` fit in the tetrahedron of edge
  `c` (through `TetReduction.tet_upper` at the scale `β c`).
-/

namespace PackLean.Formal.OctUpper

open PackLean.D31 (Upper octW dot3 plc place upperOk nth bvec)
open PackLean.D28 (rotIntOk igt)
open PackLean.Formal PackLean.Formal.PolyLP
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.TetSep (bT)
open PackLean.Formal.OctFar (VV vsg imat imat_SO)

noncomputable section

/-- The real vector of an integer list (missing entries `0`). -/
def vecI (v : List ℤ) : E3 := !₂[((nth v 0 0 : ℤ) : ℝ), ((nth v 1 0 : ℤ) : ℝ), ((nth v 2 0 : ℤ) : ℝ)]

theorem octW_mem {l : ℕ} (hl : l < 6) : nth octW l [] ∈ octW := by
  interval_cases l <;> simp [octW, nth]

theorem bvec_mem (f : Fin 4) : nth bvec f.val [] ∈ bvec := by
  fin_cases f <;> simp [bvec, nth]

theorem bT_eq (f : Fin 4) : bT f = vecI (nth bvec f.val []) := by
  fin_cases f <;> ext i <;> fin_cases i <;> simp [bT, vecI, bvec, nth]

/-- **A placed vertex.** `A (VV l) + β t = β (A w_l + t)`. -/
theorem placed (A : List (List ℤ)) (t : List ℤ) {l : ℕ} (hl : l < 6) :
    mv (imat A) (VV l) + (√2 / 4) • vecI t = (√2 / 4) • vecI (place A t (nth octW l [])) := by
  simp only [vecI, place, plc]
  generalize nth t 0 0 = a0
  generalize nth t 1 0 = a1
  generalize nth t 2 0 = a2
  ext i
  interval_cases l <;> fin_cases i <;>
    simp [mv_apply, Fin.sum_univ_three, imat, VV, vsg, octW, nth] <;> ring

theorem dot_vecI (u x : List ℤ) : dot (vecI u) ((√2 / 4) • vecI x) = √2 / 4 * dot3 u x := by
  simp only [vecI, dot3]
  generalize nth u 0 0 = a0
  generalize nth u 1 0 = a1
  generalize nth u 2 0 = a2
  generalize nth x 0 0 = b0
  generalize nth x 1 0 = b1
  generalize nth x 2 0 = b2
  simp [dot, Fin.sum_univ_three]
  ring

/-- **The upper bound.** `upperOk U` ⇒ two copies of the unit octahedron fit in the tetrahedron of
edge `c`. -/
theorem upper_fits {U : Upper} (hU : upperOk U = true) :
    Fits (convexHull ℝ (VV '' {l | l < 6})) tet 2 U.c := by
  simp only [upperOk, Bool.and_eq_true] at hU
  obtain ⟨⟨⟨⟨⟨⟨⟨hA1, hA2⟩, hc⟩, hnz⟩, hr1⟩, hr2⟩, hbe⟩, hab⟩ := hU
  have hβ : (0 : ℝ) < √2 / 4 := by positivity
  have hcz : (0 : ℤ) < U.c := by simpa using hc
  have hrows : ∀ (A : List (List ℤ)) (t : List ℤ),
      octW.all (fun w => bvec.all (fun b => decide (dot3 b (place A t w) ≤ U.c))) = true →
      ∀ l < 6, ∀ f, dot (bT f) (mv (imat A) (VV l) + (√2 / 4) • vecI t) ≤ √2 / 4 * U.c := by
    intro A t hr l hl f
    have h1 := List.all_eq_true.1 hr _ (octW_mem hl)
    have h2 := List.all_eq_true.1 h1 _ (bvec_mem f)
    rw [decide_eq_true_eq] at h2
    rw [placed A t hl, bT_eq, dot_vecI]
    have : (dot3 (nth bvec f.val []) (place A t (nth octW l [])) : ℝ) ≤ U.c := by exact_mod_cast h2
    exact mul_le_mul_of_nonneg_left this hβ.le
  have key := TetReduction.tet_upper (V := VV) (nv := 6) (KV := VV '' {l | l < 6}) rfl
    (imat_SO hA1) (imat_SO hA2) (T₁ := (√2 / 4) • vecI U.t1) (T₂ := (√2 / 4) • vecI U.t2)
    (n := vecI U.n) (c := √2 / 4 * U.c) (h := √2 / 4 * U.h) ?_ ?_ ?_ (hrows U.A1 U.t1 hr1)
    (hrows U.A2 U.t2 hr2) ?_ ?_
  · have e : √2 / 4 * (U.c : ℝ) / (√2 / 4) = U.c := by field_simp
    rwa [e] at key
  · -- n ≠ 0
    intro hz
    simp only [vecI] at hz
    generalize nth U.n 0 0 = a0 at hz hnz
    generalize nth U.n 1 0 = a1 at hz hnz
    generalize nth U.n 2 0 = a2 at hz hnz
    have c0 := congrArg (fun v : E3 => v 0) hz
    have c1 := congrArg (fun v : E3 => v 1) hz
    have c2 := congrArg (fun v : E3 => v 2) hz
    simp at c0 c1 c2
    simp [c0, c1, c2] at hnz
  · have : (0 : ℝ) < U.c := by exact_mod_cast hcz
    positivity
  · rintro x ⟨l, hl, rfl⟩
    exact ⟨l, hl, rfl⟩
  · intro l hl
    have h1 := List.all_eq_true.1 hbe _ (octW_mem hl)
    rw [decide_eq_true_eq] at h1
    rw [placed U.A1 U.t1 hl, dot_vecI]
    have : (dot3 U.n (place U.A1 U.t1 (nth octW l [])) : ℝ) ≤ U.h := by exact_mod_cast h1
    exact mul_le_mul_of_nonneg_left this hβ.le
  · intro l hl
    have h1 := List.all_eq_true.1 hab _ (octW_mem hl)
    rw [decide_eq_true_eq] at h1
    rw [placed U.A2 U.t2 hl, dot_vecI]
    have : (U.h : ℝ) ≤ dot3 U.n (place U.A2 U.t2 (nth octW l [])) := by exact_mod_cast h1
    exact mul_le_mul_of_nonneg_left this hβ.le

end

#assert_std_axioms PackLean.Formal.OctUpper.upper_fits

end PackLean.Formal.OctUpper
