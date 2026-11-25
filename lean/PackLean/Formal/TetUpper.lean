import PackLean.Formal.TetFar
import PackLean.Formal.TetReduction
import PackLean.D28.UpperCore

/-!
# A9 stage 7b (part 4): the upper bound of `D28` (icointet, cubintet)

Design: `plan/A9f_tet_design.md` §3, §8 (7b-4).  `D28.upperOk P U` (`D28/UpperCore.lean`, data
`D28/<Ico|Cub>/Upper.lean` written by `lean/tools/export_d28_upper.py`) checks with exact field
arithmetic that the piece `P.verts / dv`, rotated by the integer matrices `A₁`, `A₂` and moved by
`t₁ / dt`, `t₂ / dt`, satisfies the four container rows at `c*` and lies on the two sides of the plane
`n · x = h`.

* `imat_SO`: an integer matrix with `AᵀA = I` and `det A = 1` is in `SO(3)`;
* `placed`: the value of a placed vertex (the numerator `dt · A v + dv · t` over `dv · dt`);
* **`upper_fits`**: `upperOk P U` ⇒ two copies of `conv (VV P)` fit in the tetrahedron of edge
  `c* / (√2/4)` (through `TetReduction.tet_upper`).
-/

namespace PackLean.Formal.TetUpper

open PackLean.D28 (FE fadd fsub fsmul fzero fmul fsign QF nth vecGet Prob Upper imv idot fdot3 igt
  rotIntOk lenV3 placeN upperOk)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
  PackLean.Formal.TetFar
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.TetSep (bT)
open PackLean.Formal.FarG (three_of_len vecGet_three lenV_three mem_nth)
open scoped Matrix

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

noncomputable section

/-- The real matrix of an integer matrix. -/
def imat (A : List (List ℤ)) : M3 := fun i j => (igt A i.val j.val : ℝ)

theorem imat_SO {A : List (List ℤ)} (h : rotIntOk A = true) : imat A ∈ SO3 := by
  simp only [rotIntOk, Bool.and_eq_true, List.all_eq_true, List.mem_range, beq_iff_eq] at h
  obtain ⟨⟨_, ho⟩, hd⟩ := h
  rw [Matrix.mem_specialOrthogonalGroup_iff]
  refine ⟨(Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).2 ?_, ?_⟩
  · ext i j
    have hij := ho (3 * i.val + j.val) (by omega)
    have e1 : (3 * i.val + j.val) / 3 = i.val := by omega
    have e2 : (3 * i.val + j.val) % 3 = j.val := by omega
    rw [e1, e2] at hij
    have hc : ((igt A 0 i.val * igt A 0 j.val + igt A 1 i.val * igt A 1 j.val
        + igt A 2 i.val * igt A 2 j.val : ℤ) : ℝ) = if i = j then 1 else 0 := by
      rw [hij]
      by_cases e : i = j
      · subst e; simp
      · have hne : i.val ≠ j.val := fun h => e (Fin.ext h)
        simp [hne, e]
    push_cast at hc
    simp only [Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_three, imat, Matrix.one_apply,
      Fin.val_zero, Fin.val_one, Fin.val_two]
    simpa using hc
  · rw [Matrix.det_fin_three]
    have hc : ((igt A 0 0 * (igt A 1 1 * igt A 2 2 - igt A 1 2 * igt A 2 1)
        - igt A 0 1 * (igt A 1 0 * igt A 2 2 - igt A 1 2 * igt A 2 0)
        + igt A 0 2 * (igt A 1 0 * igt A 2 1 - igt A 1 1 * igt A 2 0) : ℤ) : ℝ) = 1 := by
      rw [hd]; simp
    push_cast at hc
    simp only [imat, Fin.val_zero, Fin.val_one, Fin.val_two, Fin.isValue]
    linarith

theorem lenV_of_ok3 {ps : List ℕ} {v : List FE} (h : lenV3 ps v = true) : LenV ps v := by
  simp only [lenV3, Bool.and_eq_true, beq_iff_eq, List.all_eq_true] at h
  exact ⟨h.1, fun a ha => h.2 a ha⟩

/-- The rows of an integer matrix with `rotIntOk`. -/
theorem rows_of_ok {A : List (List ℤ)} (h : rotIntOk A = true) :
    ∃ a00 a01 a02 a10 a11 a12 a20 a21 a22 : ℤ,
      A = [[a00, a01, a02], [a10, a11, a12], [a20, a21, a22]] := by
  simp only [rotIntOk, Bool.and_eq_true, beq_iff_eq, List.all_eq_true] at h
  obtain ⟨⟨⟨h3, hr⟩, _⟩, _⟩ := h
  obtain ⟨r0, r1, r2, rfl⟩ := three_of_len h3
  obtain ⟨a00, a01, a02, rfl⟩ := three_of_len (hr r0 (by simp))
  obtain ⟨a10, a11, a12, rfl⟩ := three_of_len (hr r1 (by simp))
  obtain ⟨a20, a21, a22, rfl⟩ := three_of_len (hr r2 (by simp))
  exact ⟨_, _, _, _, _, _, _, _, _, rfl⟩

/-- **A placed vertex.** The numerator `dt · A v + dv · t` has three entries of the right length, and
its value over `dv · dt` is the placed point `A (v / dv) + t / dt`. -/
theorem placed {P : Prob} (hwf : WF P) (U : Upper) {A : List (List ℤ)} (hA : rotIntOk A = true)
    {t : List FE} (ht : LenV P.ps t) (hdt : 0 < U.dt) {l : ℕ} (hl : l < P.verts.length) :
    ∃ x0 x1 x2 : FE, placeN P U A t (nth P.verts l []) = [x0, x1, x2] ∧
      Len P.ps x0 ∧ Len P.ps x1 ∧ Len P.ps x2 ∧
      ∀ i : Fin 3, fval P.ps ([x0, x1, x2].getD i.val [])
        = (P.dv : ℝ) * U.dt * (mv (imat A) (VV P l) + vec P.ps P.nb U.dt t) i := by
  obtain ⟨a00, a01, a02, a10, a11, a12, a20, a21, a22, rfl⟩ := rows_of_ok hA
  have hv := lenV_nth hwf.verts hl
  obtain ⟨v0, v1, v2, hve⟩ := three_of_len hv.1
  obtain ⟨t0, t1, t2, rfl⟩ := three_of_len ht.1
  have lv0 := hv.2 v0 (by simp [hve]); have lv1 := hv.2 v1 (by simp [hve])
  have lv2 := hv.2 v2 (by simp [hve])
  have lt0 := ht.2 t0 (by simp); have lt1 := ht.2 t1 (by simp); have lt2 := ht.2 t2 (by simp)
  have lz : Len P.ps (fzero P.nb) := by rw [hwf.nb]; exact len_fzero _
  have hdv : (0 : ℝ) < P.dv := by exact_mod_cast hwf.dv
  have hve' : P.verts.getD l [] = [v0, v1, v2] := hve
  rw [hve]
  simp only [placeN, imv, List.map_cons, List.map_nil, List.zip_cons_cons, List.zip_nil_left,
    List.foldl_cons, List.foldl_nil, List.zipWith_cons_cons, List.zipWith_nil_left]
  refine ⟨_, _, _, rfl, ?_, ?_, ?_, ?_⟩
  · simp (config := { maxDischargeDepth := 12 }) only [len_fadd, len_fsmul, lz, lv0, lv1, lv2, lt0]
  · simp (config := { maxDischargeDepth := 12 }) only [len_fadd, len_fsmul, lz, lv0, lv1, lv2, lt1]
  · simp (config := { maxDischargeDepth := 12 }) only [len_fadd, len_fsmul, lz, lv0, lv1, lv2, lt2]
  · intro i
    fin_cases i <;>
    · simp (config := { maxDischargeDepth := 12 }) only [List.getD_cons_zero, List.getD_cons_succ,
        Fin.val_zero, Fin.val_one, Fin.val_two, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Fin.isValue,
        fval_fadd, fval_fsmul, fval_fzero, len_fadd, len_fsmul, lz, lv0, lv1, lv2, lt0, lt1, lt2]
      simp only [PiLp.add_apply, mv_apply, Fin.sum_univ_three, imat, VV, vec_apply, ent, hve, igt,
        nth, hve', vecGet, List.getD_cons_zero, List.getD_cons_succ, Fin.val_zero, Fin.val_one, Fin.val_two,
        Fin.isValue]
      have : (0 : ℝ) < U.dt := by exact_mod_cast hdt
      field_simp
      push_cast
      ring

/-- The dot product of an integer vector with a placed vertex. -/
theorem idot_placed {P : Prob} (hwf : WF P) {x0 x1 x2 : FE} (l0 : Len P.ps x0) (l1 : Len P.ps x1)
    (l2 : Len P.ps x2) (b0 b1 b2 : ℤ) :
    Len P.ps (idot P.nb [b0, b1, b2] [x0, x1, x2]) ∧
      fval P.ps (idot P.nb [b0, b1, b2] [x0, x1, x2])
        = b0 * fval P.ps x0 + b1 * fval P.ps x1 + b2 * fval P.ps x2 := by
  have lz : Len P.ps (fzero P.nb) := by rw [hwf.nb]; exact len_fzero _
  simp only [idot, List.zip_cons_cons, List.zip_nil_left, List.foldl_cons, List.foldl_nil]
  refine ⟨?_, ?_⟩
  · simp (config := { maxDischargeDepth := 12 }) only [len_fadd, len_fsmul, lz, l0, l1, l2]
  · simp (config := { maxDischargeDepth := 12 }) only [fval_fadd, fval_fsmul, fval_fzero, len_fadd,
      len_fsmul, lz, l0, l1, l2]
    ring

/-- The value of a field-element vector (the plane normal, no denominator). -/
def nvec (P : Prob) (n : List FE) : E3 := vec P.ps P.nb 1 n

theorem nonneg_of_sign {ps : List ℕ} (hpos : ∀ p ∈ ps, 0 < p) {a : FE} (hl : Len ps a)
    (h : fsign ps a ≥ 0) : 0 ≤ fval ps a := by
  rw [fsign_spec ps hpos a hl] at h
  by_contra hc
  push Not at hc
  rw [sgn_neg hc] at h
  norm_num at h

/-- The container rows at a placed vertex, from `upperOk`. -/
theorem rows_placed {P : Prob} (hwf : WF P) (U : Upper) {A : List (List ℤ)} (hA : rotIntOk A = true)
    {t : List FE} (ht : LenV P.ps t) (hdt : 0 < U.dt)
    (hrow : P.verts.all (fun v => P.bvec.all (fun b =>
      decide (fsign P.ps (fsub (fsmul ((P.dv : ℤ) * U.dt) P.c0.num)
        (fsmul P.c0.den (idot P.nb b (placeN P U A t v)))) ≥ 0))) = true)
    {l : ℕ} (hl : l < P.verts.length) (f : Fin 4) :
    dot (bT f) (mv (imat A) (VV P l) + vec P.ps P.nb U.dt t) ≤ c0r P := by
  obtain ⟨x0, x1, x2, hx, l0, l1, l2, hval⟩ := placed hwf U hA ht hdt hl
  have hv := List.all_eq_true.1 hrow _ (mem_nth hl [])
  rw [hwf.bvec] at hv
  have hdv : (0 : ℝ) < P.dv := by exact_mod_cast hwf.dv
  have hdtR : (0 : ℝ) < U.dt := by exact_mod_cast hdt
  have hcd : (0 : ℝ) < P.c0.den := by exact_mod_cast hwf.c0d
  have key : ∀ b0 b1 b2 : ℤ, [b0, b1, b2] ∈ [[-1, -1, -1], [-1, 1, 1], [1, -1, 1], [1, 1, -1]] →
      (b0 : ℝ) * (mv (imat A) (VV P l) + vec P.ps P.nb U.dt t) 0
        + b1 * (mv (imat A) (VV P l) + vec P.ps P.nb U.dt t) 1
        + b2 * (mv (imat A) (VV P l) + vec P.ps P.nb U.dt t) 2 ≤ c0r P := by
    intro b0 b1 b2 hb
    have h1 := List.all_eq_true.1 hv _ hb
    rw [hx, decide_eq_true_eq] at h1
    obtain ⟨li, vi⟩ := idot_placed hwf l0 l1 l2 b0 b1 b2
    have lA := len_fsmul ((P.dv : ℤ) * U.dt) hwf.c0
    have lB := len_fsmul (P.c0.den : ℤ) li
    have h2 := nonneg_of_sign hwf.pos (len_fsub lA lB) h1
    rw [fval_fsub lA lB, fval_fsmul, fval_fsmul, vi] at h2
    have e0 := hval 0; have e1 := hval 1; have e2 := hval 2
    simp only [List.getD_cons_zero, List.getD_cons_succ, Fin.val_zero, Fin.val_one, Fin.val_two,
      Fin.isValue] at e0 e1 e2
    rw [e0, e1, e2] at h2
    unfold c0r
    rw [le_div_iff₀ hcd]
    push_cast at h2
    have hD : (0 : ℝ) < P.dv * U.dt := by positivity
    nlinarith
  fin_cases f
  · have := key (-1) (-1) (-1) (by simp)
    simp only [dot, bT, Fin.sum_univ_three]; simp at this ⊢; linarith
  · have := key (-1) 1 1 (by simp)
    simp only [dot, bT, Fin.sum_univ_three]; simp at this ⊢; linarith
  · have := key 1 (-1) 1 (by simp)
    simp only [dot, bT, Fin.sum_univ_three]; simp at this ⊢; linarith
  · have := key 1 1 (-1) (by simp)
    simp only [dot, bT, Fin.sum_univ_three]; simp at this ⊢; linarith

/-- The plane normal times a placed vertex. -/
theorem ndot_placed {P : Prob} (hwf : WF P) (U : Upper) {A : List (List ℤ)} (hA : rotIntOk A = true)
    {t : List FE} (ht : LenV P.ps t) (hdt : 0 < U.dt) {n : List FE} (hn : LenV P.ps n)
    {l : ℕ} (hl : l < P.verts.length) :
    Len P.ps (fdot3 P.ps P.nb n (placeN P U A t (nth P.verts l []))) ∧
      fval P.ps (fdot3 P.ps P.nb n (placeN P U A t (nth P.verts l [])))
        = (P.dv : ℝ) * U.dt * dot (nvec P n) (mv (imat A) (VV P l) + vec P.ps P.nb U.dt t) := by
  obtain ⟨x0, x1, x2, hx, l0, l1, l2, hval⟩ := placed hwf U hA ht hdt hl
  rw [hx]
  have e : fdot3 P.ps P.nb n [x0, x1, x2] = PackLean.D16.fdot P.ps P.nb n [x0, x1, x2] := rfl
  rw [e]
  obtain ⟨h1, h2⟩ := fval_fdot hwf.nb hn (lenV_three l0 l1 l2)
  refine ⟨h1, ?_⟩
  rw [h2]
  have e0 := hval 0; have e1 := hval 1; have e2 := hval 2
  simp only [List.getD_cons_zero, List.getD_cons_succ, Fin.val_zero, Fin.val_one, Fin.val_two,
    Fin.isValue] at e0 e1 e2
  simp only [ent, vecGet_three, e0, e1, e2, dot, Fin.sum_univ_three, nvec, vec_apply, Fin.val_zero,
    Fin.val_one, Fin.val_two, Nat.cast_one, div_one]
  ring

/-- **The upper bound.** `upperOk P U` ⇒ two copies of the hull of the vertices `VV P` fit in the
tetrahedron of edge `c* / (√2/4)`. -/
theorem upper_fits {P : Prob} (hwf : WF P) {U : Upper} (hU : upperOk P U = true) :
    Fits (convexHull ℝ (VV P '' {l | l < P.verts.length})) tet 2 (c0r P / (√2 / 4)) := by
  simp only [upperOk, Bool.and_eq_true] at hU
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨hA1, hA2⟩, ht1⟩, ht2⟩, hn⟩, hhl⟩, hdt⟩, hhd0⟩, hnz⟩, _⟩, hc0⟩, hr1⟩, hr2⟩,
    hbe⟩, hab⟩ := hU
  have ht1' := lenV_of_ok3 ht1
  have ht2' := lenV_of_ok3 ht2
  have hn' := lenV_of_ok3 hn
  have hdt' : 0 < U.dt := by simpa using hdt
  have hdv : (0 : ℝ) < P.dv := by exact_mod_cast hwf.dv
  have hdtR : (0 : ℝ) < U.dt := by exact_mod_cast hdt'
  have hD : (0 : ℝ) < P.dv * U.dt := by positivity
  have hhd : (0 : ℝ) < U.h.den := by
    have : 0 < U.h.den := by simpa using hhd0
    exact_mod_cast this
  have hhn : Len P.ps U.h.num := by simpa [Len] using hhl
  refine TetReduction.tet_upper (V := VV P) (nv := P.verts.length) rfl (imat_SO hA1) (imat_SO hA2)
    (T₁ := vec P.ps P.nb U.dt U.t1) (T₂ := vec P.ps P.nb U.dt U.t2) (n := nvec P U.n)
    (h := fval P.ps U.h.num / U.h.den) ?_ ?_ ?_ (fun l hl f => rows_placed hwf U hA1 ht1' hdt' hr1 hl f)
    (fun l hl f => rows_placed hwf U hA2 ht2' hdt' hr2 hl f) ?_ ?_
  · -- n ≠ 0
    obtain ⟨a, ha, hsa⟩ := List.any_eq_true.1 hnz
    rw [decide_eq_true_eq] at hsa
    obtain ⟨n0, n1, n2, hne⟩ := three_of_len hn'.1
    have hla : Len P.ps a := hn'.2 a ha
    have hva : fval P.ps a ≠ 0 := by
      intro h0
      rw [fsign_spec P.ps hwf.pos a hla, h0, sgn_zero] at hsa
      exact hsa rfl
    intro hz
    rw [hne] at ha
    have c0 := congrArg (fun v : E3 => v 0) hz
    have c1 := congrArg (fun v : E3 => v 1) hz
    have c2 := congrArg (fun v : E3 => v 2) hz
    simp only [nvec, vec_apply, hne, vecGet, List.getD_cons_zero, List.getD_cons_succ, Fin.val_zero,
      Fin.val_one, Fin.val_two, Nat.cast_one, div_one, PiLp.zero_apply] at c0 c1 c2
    simp only [List.mem_cons, List.not_mem_nil, or_false] at ha
    rcases ha with rfl | rfl | rfl
    · exact hva c0
    · exact hva c1
    · exact hva c2
  · -- c* > 0
    rw [decide_eq_true_eq, fsign_spec P.ps hwf.pos _ hwf.c0] at hc0
    have : 0 < fval P.ps P.c0.num := by
      by_contra hc
      push Not at hc
      rcases hc.lt_or_eq with h1 | h1
      · rw [sgn_neg h1] at hc0; norm_num at hc0
      · rw [h1, sgn_zero] at hc0; norm_num at hc0
    have : (0 : ℝ) < P.c0.den := by exact_mod_cast hwf.c0d
    unfold c0r
    positivity
  · rintro x ⟨l, hl, rfl⟩
    exact ⟨l, hl, rfl⟩
  · intro l hl
    have h1 := List.all_eq_true.1 hbe _ (mem_nth hl [])
    rw [decide_eq_true_eq] at h1
    obtain ⟨li, vi⟩ := ndot_placed hwf U hA1 ht1' hdt' hn' hl
    have lA := len_fsmul ((P.dv : ℤ) * U.dt) hhn
    have lB := len_fsmul (U.h.den : ℤ) li
    have h2 := nonneg_of_sign hwf.pos (len_fsub lA lB) h1
    rw [fval_fsub lA lB, fval_fsmul, fval_fsmul, vi] at h2
    push_cast at h2
    rw [le_div_iff₀ hhd]
    nlinarith
  · intro l hl
    have h1 := List.all_eq_true.1 hab _ (mem_nth hl [])
    rw [decide_eq_true_eq] at h1
    obtain ⟨li, vi⟩ := ndot_placed hwf U hA2 ht2' hdt' hn' hl
    have lA := len_fsmul ((P.dv : ℤ) * U.dt) hhn
    have lB := len_fsmul (U.h.den : ℤ) li
    have h2 := nonneg_of_sign hwf.pos (len_fsub lB lA) h1
    rw [fval_fsub lB lA, fval_fsmul, fval_fsmul, vi] at h2
    push_cast at h2
    rw [div_le_iff₀ hhd]
    nlinarith

end

#assert_std_axioms PackLean.Formal.TetUpper.upper_fits

end PackLean.Formal.TetUpper
