import PackLean.Formal.FarAccept
import PackLean.Formal.CoverTreeG
import PackLean.Formal.Orbit
import PackLean.Formal.Charts

/-!
# D45 stage 4i (part 2): the discarded far boxes, the symmetry pairs, and the far region

* `discLb_le`: `discLb` bounds `Kb · Σ (M_ij − δ_ij d) e_ij`, `M = pairM` (`d = dg · dk`);
* `disc_trace`: at a rotation `R` of a box with `discLb > 0`, `tr(g R k) > tr(R)` for the pair `m`;
* `group_pair`: `groupOk` puts every pair `(g, k)` of the list in `Gset × Kset` with `det g · det k = 1`;
* `far_main`: if `farRun` passes, every feasible `(R, t, S)` with `R ∈ SO(3)` of largest trace in its
  orbit has `S ≥ S̄` or lies in the local box `L` (chart 0, `|u| ≤ r0`).
-/

namespace PackLean.Formal.FarG

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign Quad RBox rboxQ rboxWf rotQ
  combine nth vecGet)
open PackLean.D16 (Prob Term fdot fnn fpos termsOk acceptOk farLbW lbQuad boundsOk pairM discLb
  insideL groupOk orthOk matVec vsmul col det3 cross farRun Tok)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP
  PackLean.Formal.QuadSem PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.PolySemG (BracketG maskOf)
open scoped Matrix

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-! ## Matrices of the data -/

/-- The real matrix of a list of rows, divided by `d`. -/
def mat (ps : List ℕ) (nb d : ℕ) (g : List (List FE)) : M3 := fun i j => ent ps nb (nth g i []) j / d

/-- The rows of an entry of a list of matrices (out of range: none). -/
theorem rows_nth {ps : List ℕ} {Ls : List (List (List FE))}
    (h : ∀ g ∈ Ls, g.length = 3 ∧ ∀ r ∈ g, LenV ps r) (a : ℕ) : ∀ r ∈ nth Ls a [], LenV ps r := by
  intro r hr
  unfold nth at hr
  rcases lt_or_ge a Ls.length with ha | ha
  · rw [List.getD_eq_getElem _ _ ha] at hr; exact (h _ (List.getElem_mem ha)).2 r hr
  · rw [List.getD_eq_default _ _ ha] at hr; simp at hr

theorem getD_range_map {α : Type*} (f : ℕ → α) {n t : ℕ} (ht : t < n) (d : α) :
    ((List.range n).map f).getD t d = f t := by
  rw [List.getD_eq_getElem _ _ (by simpa using ht)]
  simp

/-- The values of the entries of `pairM`. -/
theorem pairM_spec {P : Prob} (hwf : WF P) (m t : ℕ) (ht : t < 9) :
    Len P.ps (nth (pairM P m) t (fzero P.nb)) ∧
      fval P.ps (nth (pairM P m) t (fzero P.nb))
        = ∑ l ∈ Finset.range 3, ent P.ps P.nb (nth (nth P.ks (nth P.pairs m (0, 0)).2 []) (t % 3) []) l
            * ent P.ps P.nb (nth (nth P.gs (nth P.pairs m (0, 0)).1 []) l []) (t / 3) := by
  have hk := rows_nth hwf.ks (nth P.pairs m (0, 0)).2
  have hg := rows_nth hwf.gs (nth P.pairs m (0, 0)).1
  have lz : Len P.ps (fzero P.nb) := by rw [hwf.nb]; exact len_fzero _
  have e : nth (pairM P m) t (fzero P.nb) = (List.range 3).foldl (fun acc l =>
      fadd acc (fmul P.ps (vecGet (nth (nth P.ks (nth P.pairs m (0, 0)).2 []) (t % 3) []) l P.nb)
        (vecGet (nth (nth P.gs (nth P.pairs m (0, 0)).1 []) l []) (t / 3) P.nb))) (fzero P.nb) := by
    unfold pairM nth
    rw [getD_range_map _ ht]
  rw [e]
  obtain ⟨h1, h2⟩ := fval_foldl (ps := P.ps) (fun l => fmul P.ps
      (vecGet (nth (nth P.ks (nth P.pairs m (0, 0)).2 []) (t % 3) []) l P.nb)
      (vecGet (nth (nth P.gs (nth P.pairs m (0, 0)).1 []) l []) (t / 3) P.nb)) (List.range 3)
    (fzero P.nb) (fun l _ => len_fmul (len_get hwf.nb hk _ _) (len_get hwf.nb hg _ _)) lz
  refine ⟨h1, ?_⟩
  rw [h2, fval_fzero, zero_add]
  simp only [show List.range 3 = [0, 1, 2] from rfl, List.map_cons, List.map_nil, List.sum_cons,
    List.sum_nil, Finset.sum_range_succ, Finset.sum_range_zero, zero_add, add_zero]
  rw [fval_fmul (len_get hwf.nb hk _ _) (len_get hwf.nb hg _ _),
    fval_fmul (len_get hwf.nb hk _ _) (len_get hwf.nb hg _ _),
    fval_fmul (len_get hwf.nb hk _ _) (len_get hwf.nb hg _ _)]
  simp only [FarAccept.ent]
  ring

/-! ## `discLb` -/

/-- The coefficient of `Rq_t` in `discLb`. -/
def dcoef (P : Prob) (m t : ℕ) : FE :=
  if t % 4 == 0 then fsub (nth (pairM P m) t (fzero P.nb)) (fofInt P.nb ((P.dg : ℤ) * P.dk))
  else nth (pairM P m) t (fzero P.nb)

theorem discLb_eq (P : Prob) (rb : RBox) (m : ℕ) :
    discLb P rb m = lbQuad P (combine P.nb ((List.range 9).map fun t =>
      (dcoef P m t, nth (rotQ (rboxQ P.rden rb)).1 t []))) := rfl

/-- The real `M_ij = Σ_l k_jl g_li` of the pair `m` (no denominators). -/
def Mv (P : Prob) (m i j : ℕ) : ℝ :=
  ∑ l ∈ Finset.range 3, FarAccept.ent P.ps P.nb (nth (nth P.ks (nth P.pairs m (0, 0)).2 []) j []) l
    * FarAccept.ent P.ps P.nb (nth (nth P.gs (nth P.pairs m (0, 0)).1 []) l []) i

theorem dcoef_spec {P : Prob} (hwf : WF P) (m t : ℕ) (ht : t < 9) :
    Len P.ps (dcoef P m t) ∧ fval P.ps (dcoef P m t)
      = Mv P m (t / 3) (t % 3) - (if t % 4 = 0 then ((P.dg : ℝ) * P.dk) else 0) := by
  obtain ⟨h1, h2⟩ := pairM_spec hwf m t ht
  have lo : Len P.ps (fofInt P.nb ((P.dg : ℤ) * P.dk)) := by rw [hwf.nb]; exact len_fofInt _ _
  unfold dcoef
  by_cases h : t % 4 = 0
  · simp only [h, beq_self_eq_true, ite_true]
    refine ⟨len_fsub h1 lo, ?_⟩
    have hf := fval_fofInt P.ps ((P.dg : ℤ) * P.dk)
    rw [← hwf.nb] at hf
    rw [fval_fsub h1 lo, h2, hf]
    push_cast; rfl
  · have : (t % 4 == 0) = false := by simpa using h
    simp only [this, h, ite_false, Bool.false_eq_true]
    exact ⟨h1, by rw [h2]; simp [Mv]⟩

/-- **`discLb`** bounds `Kb · Σ (M_ij − δ_ij d) e_ij`. -/
theorem discLb_le {P : Prob} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hwf : WF P)
    (rb : RBox) (m : ℕ) {s : Fin 3 → ℝ} (hs : ∀ i, |s i| ≤ 1) :
    (discLb P rb m : ℝ) ≤ Kb * ∑ i ∈ Finset.range 3, ∑ j ∈ Finset.range 3,
      (Mv P m i j - if i = j then ((P.dg : ℝ) * P.dk) else 0)
        * qEval (nth (rotQ (rboxQ P.rden rb)).1 (3 * i + j) []) s := by
  obtain ⟨wq, xq, yq, zq, hq⟩ := rboxQ_four P.rden rb
  obtain ⟨hl9, hl10, _⟩ := rotQ_length wq xq yq zq
  rw [← hq] at hl9 hl10
  rw [discLb_eq]
  refine le_of_le_of_eq (lbQuad_combine s hb hwf.nb hs ?_) ?_
  · intro x hx
    simp only [List.mem_map, List.mem_range] at hx
    obtain ⟨t, ht, rfl⟩ := hx
    refine ⟨(dcoef_spec hwf m t ht).1, hl10 _ ?_⟩
    unfold nth; rw [List.getD_eq_getElem _ _ (by omega)]; exact List.getElem_mem _
  · congr 1
    simp only [show List.range 9 = [0, 1, 2, 3, 4, 5, 6, 7, 8] from rfl, List.map_cons,
      List.map_nil, List.sum_cons, List.sum_nil, add_zero]
    simp only [(dcoef_spec hwf m _ (by norm_num : (0 : ℕ) < 9)).2,
      (dcoef_spec hwf m _ (by norm_num : (1 : ℕ) < 9)).2, (dcoef_spec hwf m _ (by norm_num : (2 : ℕ) < 9)).2,
      (dcoef_spec hwf m _ (by norm_num : (3 : ℕ) < 9)).2, (dcoef_spec hwf m _ (by norm_num : (4 : ℕ) < 9)).2,
      (dcoef_spec hwf m _ (by norm_num : (5 : ℕ) < 9)).2, (dcoef_spec hwf m _ (by norm_num : (6 : ℕ) < 9)).2,
      (dcoef_spec hwf m _ (by norm_num : (7 : ℕ) < 9)).2, (dcoef_spec hwf m _ (by norm_num : (8 : ℕ) < 9)).2,
      Finset.sum_range_succ, Finset.sum_range_zero, zero_add]
    norm_num
    ring

/-- **A discarded box.** At a rotation `R` of the box (`Rq = N · R`, `N > 0`), `discLb > 0` gives
`tr(g R k) > tr(R)` for the pair `m` (`g`, `k` the real matrices of the lists). -/
theorem disc_trace {P : Prob} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hKb : 0 < Kb)
    (hwf : WF P) (hdg : 0 < P.dg) (hdk : 0 < P.dk) {rb : RBox} {m : ℕ} (hD : discLb P rb m > 0)
    {s : Fin 3 → ℝ} (hs : ∀ i, |s i| ≤ 1) {R : M3} {Nv : ℝ} (hNv : 0 < Nv)
    (hR : ∀ i j : Fin 3, qEval (nth (rotQ (rboxQ P.rden rb)).1 (3 * i.val + j.val) []) s = Nv * R i j) :
    R.trace < (mat P.ps P.nb P.dg (nth P.gs (nth P.pairs m (0, 0)).1 []) * R
      * mat P.ps P.nb P.dk (nth P.ks (nth P.pairs m (0, 0)).2 [])).trace := by
  have h1 := discLb_le hb hwf rb m hs
  have h0 : (0 : ℝ) < discLb P rb m := by exact_mod_cast hD
  have hg : (0 : ℝ) < P.dg := by exact_mod_cast hdg
  have hk : (0 : ℝ) < P.dk := by exact_mod_cast hdk
  have e00 := hR 0 0; have e01 := hR 0 1; have e02 := hR 0 2
  have e10 := hR 1 0; have e11 := hR 1 1; have e12 := hR 1 2
  have e20 := hR 2 0; have e21 := hR 2 1; have e22 := hR 2 2
  simp only [Fin.val_zero, Fin.val_one, Fin.val_two] at e00 e01 e02 e10 e11 e12 e20 e21 e22
  set X := (mat P.ps P.nb P.dg (nth P.gs (nth P.pairs m (0, 0)).1 []) * R
      * mat P.ps P.nb P.dk (nth P.ks (nth P.pairs m (0, 0)).2 [])).trace - R.trace with hXdef
  have hX : (∑ i ∈ Finset.range 3, ∑ j ∈ Finset.range 3,
      (Mv P m i j - if i = j then ((P.dg : ℝ) * P.dk) else 0)
        * qEval (nth (rotQ (rboxQ P.rden rb)).1 (3 * i + j) []) s) = Nv * (P.dg * P.dk) * X := by
    rw [hXdef, Orbit.trace_gRk]
    simp only [Finset.sum_range_succ, Finset.sum_range_zero, zero_add, e00, e01, e02, e10, e11, e12,
      e20, e21, e22, Fin.sum_univ_three, mat, Matrix.trace, Matrix.diag, Fin.val_zero, Fin.val_one,
      Fin.val_two, Mv]
    norm_num
    field_simp
    ring
  rw [hX] at h1
  have : 0 < Kb * (Nv * (P.dg * P.dk) * X) := lt_of_lt_of_le h0 h1
  have hpos : 0 < Kb * (Nv * (P.dg * P.dk)) := by positivity
  have hXp : 0 < X := by
    by_contra hc
    push Not at hc
    nlinarith
  linarith

/-! ## The symmetry pairs -/

theorem three_of_len {α : Type*} {L : List α} (h : L.length = 3) : ∃ a b c, L = [a, b, c] := by
  match L, h with
  | [a, b, c], _ => exact ⟨a, b, c, rfl⟩

theorem vecGet_three (a b c : FE) (nb : ℕ) :
    vecGet [a, b, c] 0 nb = a ∧ vecGet [a, b, c] 1 nb = b ∧ vecGet [a, b, c] 2 nb = c :=
  ⟨rfl, rfl, rfl⟩

theorem lenV_three {ps : List ℕ} {a b c : FE} (ha : Len ps a) (hb : Len ps b) (hc : Len ps c) :
    LenV ps [a, b, c] := ⟨rfl, by simp [ha, hb, hc]⟩

/-- Equal field elements have equal values. -/
theorem fval_congr {ps : List ℕ} {a b : FE} (h : a = b) : fval ps a = fval ps b := by rw [h]

/-- **`orthOk`** gives an orthogonal matrix. -/
theorem orth_of_ok {ps : List ℕ} {nb d : ℕ} (hnb : nb = 2 ^ ps.length) (hd : 0 < d)
    {K : List (List FE)} (hK : K.length = 3 ∧ ∀ r ∈ K, LenV ps r) (h : orthOk ps nb d K = true) :
    (mat ps nb d K)ᵀ * mat ps nb d K = 1 := by
  subst hnb
  obtain ⟨r0, r1, r2, rfl⟩ := three_of_len hK.1
  have h0 := hK.2 r0 (by simp); have h1 := hK.2 r1 (by simp); have h2 := hK.2 r2 (by simp)
  simp only [orthOk, Bool.and_eq_true, List.all_eq_true, List.mem_range, beq_iff_eq] at h
  obtain ⟨_, ht⟩ := h
  have hdR : (0 : ℝ) < d := by exact_mod_cast hd
  have key : ∀ i j : ℕ, i < 3 → j < 3 →
      ent ps (2 ^ ps.length) r0 i * ent ps (2 ^ ps.length) r0 j
        + ent ps (2 ^ ps.length) r1 i * ent ps (2 ^ ps.length) r1 j
        + ent ps (2 ^ ps.length) r2 i * ent ps (2 ^ ps.length) r2 j
        = if i = j then (d : ℝ) * d else 0 := by
    intro i j hi hj
    have := ht (3 * i + j) (by omega)
    have e1 : (3 * i + j) / 3 = i := by omega
    have e2 : (3 * i + j) % 3 = j := by omega
    rw [e1, e2] at this
    have hci : LenV ps (col (2 ^ ps.length) [r0, r1, r2] i) :=
      lenV_three (len_get1 rfl h0 i) (len_get1 rfl h1 i) (len_get1 rfl h2 i)
    have hcj : LenV ps (col (2 ^ ps.length) [r0, r1, r2] j) :=
      lenV_three (len_get1 rfl h0 j) (len_get1 rfl h1 j) (len_get1 rfl h2 j)
    have hv := (fval_fdot rfl hci hcj).2
    rw [fval_congr this] at hv
    simp only [col, List.map_cons, List.map_nil, FarAccept.ent, vecGet_three] at hv
    simp only [FarAccept.ent]
    by_cases hij : i = j
    · subst hij; simp only [ite_true] at hv ⊢; rw [fval_fofInt] at hv
      push_cast at hv; linarith
    · simp only [hij, ite_false] at hv ⊢
      rw [fval_fzero] at hv; linarith
  have k00 := key 0 0 (by norm_num) (by norm_num); have k01 := key 0 1 (by norm_num) (by norm_num)
  have k02 := key 0 2 (by norm_num) (by norm_num); have k10 := key 1 0 (by norm_num) (by norm_num)
  have k11 := key 1 1 (by norm_num) (by norm_num); have k12 := key 1 2 (by norm_num) (by norm_num)
  have k20 := key 2 0 (by norm_num) (by norm_num); have k21 := key 2 1 (by norm_num) (by norm_num)
  have k22 := key 2 2 (by norm_num) (by norm_num)
  norm_num at k00 k01 k02 k10 k11 k12 k20 k21 k22
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.mul_apply, mat, Fin.sum_univ_three, Matrix.one_apply, nth] <;>
    field_simp <;> linarith

theorem mem_nth {α : Type*} {L : List α} {i : ℕ} (h : i < L.length) (d : α) : nth L i d ∈ L := by
  unfold nth; rw [List.getD_eq_getElem _ _ h]; exact List.getElem_mem h

theorem exists_nth {α : Type*} {L : List α} {x : α} (h : x ∈ L) (d : α) :
    ∃ j < L.length, nth L j d = x := by
  obtain ⟨j, hj, rfl⟩ := List.getElem_of_mem h
  exact ⟨j, hj, by unfold nth; rw [List.getD_eq_getElem _ _ hj]⟩

/-- **`matVec`**: the matrix of the rows `g / dg` maps `n / d` to `m / d`. -/
theorem mv_of_matVec {ps : List ℕ} {nb dg d : ℕ} (hnb : nb = 2 ^ ps.length) (hdg : 0 < dg)
    (hd : 0 < d) {g : List (List FE)} {n m : List FE} (hg : g.length = 3 ∧ ∀ r ∈ g, LenV ps r) (hn : LenV ps n)
    (hm : LenV ps m) (h : matVec ps nb g n = vsmul dg m) :
    mv (mat ps nb dg g) (vec ps nb d n) = vec ps nb d m := by
  subst hnb
  obtain ⟨r0, r1, r2, rfl⟩ := three_of_len hg.1
  obtain ⟨m0, m1, m2, rfl⟩ := three_of_len hm.1
  have h0 := hg.2 r0 (by simp); have h1 := hg.2 r1 (by simp); have h2 := hg.2 r2 (by simp)
  simp only [matVec, vsmul, List.map_cons, List.map_nil, List.cons.injEq, and_true] at h
  obtain ⟨e0, e1, e2⟩ := h
  have v0 := (fval_fdot rfl h0 hn).2; rw [fval_congr e0, fval_fsmul] at v0
  have v1 := (fval_fdot rfl h1 hn).2; rw [fval_congr e1, fval_fsmul] at v1
  have v2 := (fval_fdot rfl h2 hn).2; rw [fval_congr e2, fval_fsmul] at v2
  have hdR : (0 : ℝ) < dg := by exact_mod_cast hdg
  have hdR' : (0 : ℝ) < d := by exact_mod_cast hd
  simp only [FarAccept.ent] at v0 v1 v2
  push_cast at v0 v1 v2
  ext i
  fin_cases i <;> simp only [mv_apply, mat, vec_apply, Fin.sum_univ_three, nth, FarAccept.ent,
      List.getD_cons_zero, List.getD_cons_succ, vecGet_three, Fin.val_zero, Fin.val_one, Fin.val_two,
      Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Fin.isValue] <;>
    field_simp <;> first | exact v0.symm | exact v1.symm | exact v2.symm

theorem cross_spec {ps : List ℕ} {a b : List FE} (ha : LenV ps a) (hb : LenV ps b) :
    ∃ c0 c1 c2, cross ps a b = [c0, c1, c2] ∧ Len ps c0 ∧ Len ps c1 ∧ Len ps c2 ∧
      fval ps c0 = ent ps (2 ^ ps.length) a 1 * ent ps (2 ^ ps.length) b 2
        - ent ps (2 ^ ps.length) a 2 * ent ps (2 ^ ps.length) b 1 ∧
      fval ps c1 = ent ps (2 ^ ps.length) a 2 * ent ps (2 ^ ps.length) b 0
        - ent ps (2 ^ ps.length) a 0 * ent ps (2 ^ ps.length) b 2 ∧
      fval ps c2 = ent ps (2 ^ ps.length) a 0 * ent ps (2 ^ ps.length) b 1
        - ent ps (2 ^ ps.length) a 1 * ent ps (2 ^ ps.length) b 0 := by
  obtain ⟨a0, a1, a2, rfl⟩ := three_of_len ha.1
  obtain ⟨b0, b1, b2, rfl⟩ := three_of_len hb.1
  have la0 := ha.2 a0 (by simp); have la1 := ha.2 a1 (by simp); have la2 := ha.2 a2 (by simp)
  have lb0 := hb.2 b0 (by simp); have lb1 := hb.2 b1 (by simp); have lb2 := hb.2 b2 (by simp)
  refine ⟨_, _, _, rfl, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;>
    simp only [nth, List.getD_cons_zero, List.getD_cons_succ, FarAccept.ent, vecGet_three]
  · exact len_fsub (len_fmul la1 lb2) (len_fmul la2 lb1)
  · exact len_fsub (len_fmul la2 lb0) (len_fmul la0 lb2)
  · exact len_fsub (len_fmul la0 lb1) (len_fmul la1 lb0)
  · rw [fval_fsub (len_fmul la1 lb2) (len_fmul la2 lb1), fval_fmul la1 lb2, fval_fmul la2 lb1]
  · rw [fval_fsub (len_fmul la2 lb0) (len_fmul la0 lb2), fval_fmul la2 lb0, fval_fmul la0 lb2]
  · rw [fval_fsub (len_fmul la0 lb1) (len_fmul la1 lb0), fval_fmul la0 lb1, fval_fmul la1 lb0]

/-- **`det3`** is the determinant of the matrix of values (no denominator). -/
theorem det3_spec {ps : List ℕ} {M : List (List FE)} (hM : M.length = 3 ∧ ∀ r ∈ M, LenV ps r) :
    Len ps (det3 ps M) ∧ fval ps (det3 ps M) = (mat ps (2 ^ ps.length) 1 M).det := by
  obtain ⟨r0, r1, r2, rfl⟩ := three_of_len hM.1
  have h0 := hM.2 r0 (by simp); have h1 := hM.2 r1 (by simp); have h2 := hM.2 r2 (by simp)
  obtain ⟨c0, c1, c2, hc, l0, l1, l2, v0, v1, v2⟩ := cross_spec h1 h2
  have hcv : LenV ps [c0, c1, c2] := lenV_three l0 l1 l2
  have hd := fval_fdot rfl h0 hcv
  have e : det3 ps [r0, r1, r2] = fdot ps (2 ^ ps.length) r0 [c0, c1, c2] := by
    simp only [det3, nth, List.getD_cons_zero, List.getD_cons_succ, hc]
  rw [e]
  refine ⟨hd.1, ?_⟩
  rw [hd.2]
  simp only [FarAccept.ent, vecGet_three] at v0 v1 v2 ⊢
  rw [v0, v1, v2, Matrix.det_fin_three]
  simp [mat, nth, FarAccept.ent]
  ring

theorem det_mat (ps : List ℕ) (nb d : ℕ) (M : List (List FE)) (hd : 0 < d) :
    (mat ps nb d M).det = (mat ps nb 1 M).det / ((d : ℝ) ^ 3) := by
  have : (d : ℝ) ≠ 0 := by positivity
  rw [Matrix.det_fin_three, Matrix.det_fin_three]
  simp only [mat, Nat.cast_one, div_one]
  field_simp

/-- The real matrices of the pair `m`. -/
def gM (P : Prob) (m : ℕ) : M3 := mat P.ps P.nb P.dg (nth P.gs (nth P.pairs m (0, 0)).1 [])
def kM (P : Prob) (m : ℕ) : M3 := mat P.ps P.nb P.dk (nth P.ks (nth P.pairs m (0, 0)).2 [])

/-- **`groupOk`**: every pair of the list is a symmetry pair of the LP (`Gset × Kset`, `det g · det k = 1`). -/
theorem group_pair {P : Prob} (hwf : WF P) (hd : Dens P) (hdg : 0 < P.dg) (hdk : 0 < P.dk)
    (h : groupOk P = true) {m : ℕ} (hm : m < P.pairs.length) :
    gM P m ∈ Orbit.Gset (NCv P) P.normals.length ∧
      kM P m ∈ Orbit.Kset (Vv P) P.verts.length (N0v P) ∧ (gM P m).det * (kM P m).det = 1 := by
  simp only [groupOk, Bool.and_eq_true, List.all_eq_true, List.any_eq_true, beq_iff_eq,
    decide_eq_true_eq] at h
  obtain ⟨⟨hG, hK⟩, hP⟩ := h
  set x := nth P.pairs m (0, 0) with hxdef
  have hx : x ∈ P.pairs := mem_nth hm _
  obtain ⟨⟨hx1, hx2⟩, hdet⟩ := hP x hx
  have hgm : nth P.gs x.1 [] ∈ P.gs := mem_nth hx1 _
  have hkm : nth P.ks x.2 [] ∈ P.ks := mem_nth hx2 _
  obtain ⟨hgo, hgn⟩ := hG _ hgm
  obtain ⟨⟨hko, hkv⟩, hkn⟩ := hK _ hkm
  have hgw := hwf.gs _ hgm
  have hkw := hwf.ks _ hkm
  refine ⟨⟨orth_of_ok hwf.nb hdg hgw hgo, fun j hj => ?_⟩, ⟨orth_of_ok hwf.nb hdk hkw hko,
    fun l hl => ?_, ?_⟩, ?_⟩
  · obtain ⟨n', hn', he⟩ := hgn _ (mem_nth hj [])
    obtain ⟨j', hj', rfl⟩ := exists_nth hn' []
    exact ⟨j', hj', mv_of_matVec hwf.nb hdg hd.dn hgw (lenV_nth hwf.normals hj)
      (lenV_nth hwf.normals hj') he⟩
  · obtain ⟨v', hv', he⟩ := hkv _ (mem_nth hl [])
    obtain ⟨l', hl', rfl⟩ := exists_nth hv' []
    exact ⟨l', hl', mv_of_matVec hwf.nb hdk hd.dv hkw (lenV_nth hwf.verts hl)
      (lenV_nth hwf.verts hl') he⟩
  · exact mv_of_matVec hwf.nb hdk hd.dn0 hkw hwf.n0 hwf.n0 hkn
  · have dg3 := det3_spec hgw
    have dk3 := det3_spec hkw
    have hv := fval_congr (ps := P.ps) hdet
    rw [fval_fmul dg3.1 dk3.1, dg3.2, dk3.2, hwf.nb, fval_fofInt] at hv
    unfold gM kM
    rw [det_mat _ _ _ _ hdg, det_mat _ _ _ _ hdk, hwf.nb]
    have : (0 : ℝ) < P.dg := by exact_mod_cast hdg
    have : (0 : ℝ) < P.dk := by exact_mod_cast hdk
    rw [div_mul_div_comm, hv]
    push_cast
    field_simp

/-! ## The far region -/

theorem map_nth {Rq : List Quad} {f : Quad → ℝ} {L : List ℝ} (h : Rq.map f = L) {t : ℕ}
    (ht : t < Rq.length) : f (nth Rq t []) = L.getD t 0 := by
  subst h
  unfold nth
  rw [List.getD_eq_getElem _ _ ht, List.getD_eq_getElem _ _ (by simpa using ht)]
  simp

/-- The rotation of a chart point, entry by entry in the box coordinate `s`. -/
theorem box_entries {P : Prob} {R : M3} {ch : ℕ} {u : Fin 3 → ℝ} (hc : Charts.ChartPt R P.rden ch u)
    {B : RBox} (hB : B.ch = ch) {s : Fin 3 → ℝ} (hsu : ∀ i, bu B s i = u i) :
    ∃ Nv : ℝ, 0 < Nv ∧ qEval (rotQ (rboxQ P.rden B)).2 s = Nv ∧
      ∀ i j : Fin 3, qEval (nth (rotQ (rboxQ P.rden B)).1 (3 * i.val + j.val) []) s = Nv * R i j := by
  obtain ⟨_, hN, hlist⟩ := hc
  obtain ⟨h1, h2⟩ := rotQ_rboxQ s P.rden B
  simp only [hB, hsu] at h1 h2
  refine ⟨_, hN, h2, fun i j => ?_⟩
  obtain ⟨wq, xq, yq, zq, hq⟩ := rboxQ_four P.rden B
  have hl := (rotQ_length wq xq yq zq).1
  rw [← hq] at hl
  rw [map_nth h1 (by rw [hl]; omega), hlist]
  fin_cases i <;> fin_cases j <;> rfl

theorem insideL_spec {P : Prob} {B : RBox} (h : insideL P B = true) {ch : ℕ} {u : Fin 3 → ℝ}
    (hin : CoverTreeG.InBox B ch u) : ch = 0 ∧ ∀ i, |u i| ≤ P.r0 := by
  obtain ⟨hc, hy⟩ := hin
  simp only [insideL, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨h0, a0⟩, a1⟩, a2⟩, b0⟩, b1⟩, b2⟩ := h
  refine ⟨hc ▸ h0, fun i => abs_le.2 ⟨?_, ?_⟩⟩ <;>
  · have := hy i
    fin_cases i <;> simp [bLo, bHi] at this ⊢ <;>
      first
      | (have : ((-P.r0 : ℤ) : ℝ) ≤ B.l0 := by exact_mod_cast a0); push_cast at this; linarith
      | (have : ((-P.r0 : ℤ) : ℝ) ≤ B.l1 := by exact_mod_cast a1); push_cast at this; linarith
      | (have : ((-P.r0 : ℤ) : ℝ) ≤ B.l2 := by exact_mod_cast a2); push_cast at this; linarith
      | (have : ((B.h0 : ℤ) : ℝ) ≤ P.r0 := by exact_mod_cast b0); linarith
      | (have : ((B.h1 : ℤ) : ℝ) ≤ P.r0 := by exact_mod_cast b1); linarith
      | (have : ((B.h2 : ℤ) : ℝ) ≤ P.r0 := by exact_mod_cast b2); linarith

/-- **The far region.** If `farRun` passes (and the constants), every feasible `(R, t, S)` with
`R ∈ SO(3)` of largest trace among the symmetry pairs has `S ≥ S̄`, or `R` is a point of chart 0
with `|u i| ≤ r0` (the local box `L`, in units of `rden`). -/
theorem far_main {P : Prob} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hKb : 0 < Kb)
    (hwf : WF P) (hd : Dens P) (hdg : 0 < P.dg) (hdk : 0 < P.dk) (hq : 0 < P.qlam)
    (hTr : 0 < Tr P) (hrden : 0 < P.rden) (hbo : boundsOk P = true) (hgrp : groupOk P = true)
    {toks : List Tok} (hfar : (farRun P toks).1 = true)
    (hPT : ∀ x : E3, (∀ j < P.normals.length, dot (NCv P j) x ≤ 1) →
      x ∈ convexHull ℝ (Wv P '' {w | w ∈ P.pv}))
    (hN0 : 0 < dot (N0v P) (N0v P))
    (hball : ∀ u : E3, ∃ l < P.verts.length, 0 ≤ dot u (Vv P l) ∧
      D0r P ^ 2 * dot u u ≤ dot (N0v P) (N0v P) * dot u (Vv P l) ^ 2)
    {R : M3} (hR : R ∈ SO3) {t : E3} {S : ℝ}
    (hLP : polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S)
    (hmax : ∀ g ∈ Orbit.Gset (NCv P) P.normals.length, ∀ k ∈ Orbit.Kset (Vv P) P.verts.length (N0v P),
      g.det * k.det = 1 → (g * R * k).trace ≤ R.trace) :
    Sb P ≤ S ∨ ∃ u, Charts.ChartPt R P.rden 0 u ∧ ∀ i, |u i| ≤ P.r0 := by
  by_cases hout : ∃ j < P.normals.length, Tr P < dot (NCv P j) t
  · obtain ⟨j, hj, hjt⟩ := hout
    have hRo : Rᵀ * R = 1 := by
      rw [Matrix.mem_specialOrthogonalGroup_iff] at hR
      exact (Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).1 hR.1
    exact Or.inl (outside_bound hwf hd hbo hRo hN0 hball hLP hj hjt)
  push Not at hout
  have hden : (0 : ℝ) < P.rden := by exact_mod_cast hrden
  obtain ⟨ch, hch, u, hc⟩ := Charts.charts_cover hR hden
  obtain ⟨B, ⟨hwB, hgood⟩, hin⟩ := CoverTreeG.farRun_cover P toks hfar ch hch u
    (fun i => abs_le.2 ⟨(hc.1 i).1, (hc.1 i).2⟩)
  obtain ⟨s, hs, hsu⟩ := box_param hwB u hin.2
  obtain ⟨Nv, hNv, hN, hent⟩ := box_entries hc hin.1 hsu
  rcases hgood with hL | ⟨m, hm, hD⟩ | ⟨mu, ts, hA⟩
  · obtain ⟨rfl, hu⟩ := insideL_spec hL hin
    exact Or.inr ⟨u, hc, hu⟩
  · exfalso
    have htr := disc_trace hb hKb hwf hdg hdk hD hs hNv hent
    obtain ⟨hg, hk, hdet⟩ := group_pair hwf hd hdg hdk hgrp hm
    have := hmax _ hg _ hk hdet
    unfold gM kM at this
    linarith
  · left
    have hG := accept_G hb hKb hwf hd hA hs hNv hent hN
    have hts : termsOk P ts = true := by
      simp only [acceptOk, Bool.and_eq_true] at hA; exact hA.1
    exact accept_bound hG hts hq hTr hPT hLP hout

end

#assert_std_axioms PackLean.Formal.FarG.far_main PackLean.Formal.FarG.group_pair
  PackLean.Formal.FarG.disc_trace

end PackLean.Formal.FarG
