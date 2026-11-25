import PackLean.Formal.LocalTubeMain
import PackLean.Formal.D16Main

/-!
# D45 stage 5b (part 3): the mixed leaves of the tube — the real core

The mixed leaf of `D30S3.mixOk` (Lemma W (i)(ii), D30 3.1) combines several candidates `k` with
weights `w_k ≥ 0` and lifts the faces `f` of `act` by the opposite pair `(−f, −v_f)` with `c_f ≥ 0`.
At a point `x` of the leaf (rotation `R`, `ρ ≥ 0`), with `μ_f = Σ_k w_k A^k_f` the combined multiplier of
the row `(f, α(f))`:

* the checked multipliers are `a_f = μ_f + ρ c_f dm dn0 ≥ 0`, and `b_f := ρ c_f dm dn0 ≥ 0`;
* the row `(f, α(f))` gets `a_f`, the opposite row `(−f, −α(f))` gets `b_f`: they add up to
  `(a_f + b_f) X_f + μ_f Y_f ≤ (a_f + b_f) S`, `X_f = n_f·R v_f`, `Y_f = n_f·t`;
* the candidates' identities give `Σ_f μ_f Y_f = −(Σw) dm N dn0 (R n0)·t ≥ (Σw) dm N dn0 D0`;
* so `Σ_k w_k F_k + ρ Σ_f c_f L_f ≤ D·N dn dv Σ_f (a_f + b_f) (S − S*)` (`mix_bound`), and
  `Σ_f (a_f + b_f) > 0` (else `μ = 0` and `(R n0)·t = 0 > −D0` fails).

This file has the parts that do not depend on the encoding of `mixOk`:

* `cand_parts`: the value of `F` and the cancellation identity for one candidate, **without** the
  sign of `A` (the first half of `LocalW.cand_le`);
* `mix_core`: the real lemma above;
* `lift_value`: the value of `liftPoly`.
-/

namespace PackLean.Formal.LocalTubeMix

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign Mono Poly padd psum pmul
  psmulZ psmulF nth vecGet)
open PackLean.D16 (Prob Cand candOk candPolys rotPoly psub containerOk pieceOk vsmul)
open PackLean.D30S3 (liftPoly idxOf)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.QuadSem
  PackLean.Formal.FarAccept PackLean.Formal.LocalG
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.PolySemG (pEval)

noncomputable section

/-- The row value `X_j = n_{J_j} · R v_{α_j}` of a candidate. -/
def XV (P : Prob) (c : Cand) (R : M3) (j : ℕ) : ℝ :=
  dot (NCv P (nth c.J j 0)) (mv R (Vv P (nth c.al j 0)))

/-- **One candidate, the identities** (the first half of `LocalW.cand_le`, no sign on `A`):
`F = D·(dm dn0 dn dv D0 N² − dn dv S* N ΣA + Σ_j A_j N dn dv X_j)` and
`Σ_j A_j (n_{J_j}·t) = −dm N dn0 (R n0)·t`. -/
theorem cand_parts {P : Prob} {c : Cand} (hwf : WF P) (hd : Dens P) (hsd : 0 < P.sstar.den)
    (hc : candOk P c = true) (hm : ∀ v ∈ c.minv, LenV P.ps v)
    {e : ℕ → ℝ} {Nv : ℝ} {R : M3}
    (he : ∀ a b : Fin 3, e (3 * a.val + b.val) = Nv * R a b) (t : E3) :
    FV P c e Nv = ((P.d0.den : ℝ) * P.sstar.den) *
      (c.dm * P.dn0 * P.dn * P.dv * D0r P * Nv ^ 2 -
        P.dn * P.dv * Ss P * Nv * (AV P c e 0 + AV P c e 1 + AV P c e 2) +
        (AV P c e 0 * (Nv * P.dn * P.dv * XV P c R 0) + AV P c e 1 * (Nv * P.dn * P.dv * XV P c R 1) +
         AV P c e 2 * (Nv * P.dn * P.dv * XV P c R 2))) ∧
    AV P c e 0 * dot (NCv P (nth c.J 0 0)) t + AV P c e 1 * dot (NCv P (nth c.J 1 0)) t +
      AV P c e 2 * dot (NCv P (nth c.J 2 0)) t = -((c.dm : ℝ) * Nv * P.dn0) * dot (mv R (N0v P)) t := by
  obtain ⟨_, _, hdm, hJ, hα, hI⟩ := cand_ident hwf hm hc
  have hr3 : List.range 3 = [0, 1, 2] := rfl
  have hr9 : List.range 9 = [0, 1, 2, 3, 4, 5, 6, 7, 8] := rfl
  have hdn : (0 : ℝ) < P.dn := by exact_mod_cast hd.dn
  have hdv : (0 : ℝ) < P.dv := by exact_mod_cast hd.dv
  have hdn0 : (0 : ℝ) < P.dn0 := by exact_mod_cast hd.dn0
  have hd0d : (0 : ℝ) < P.d0.den := by exact_mod_cast hd.d0
  have hssd : (0 : ℝ) < P.sstar.den := by exact_mod_cast hsd
  have hAV : ∀ j, AV P c e j =
      -(mV P c j 0 * UV P e 0) - mV P c j 1 * UV P e 1 - mV P c j 2 * UV P e 2 := by
    intro j; unfold AV; rw [hr3]
    simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil]; ring
  have hUV : ∀ i : Fin 3, UV P e i.val = Nv * (R i 0 * oV P 0 + R i 1 * oV P 1 + R i 2 * oV P 2) := by
    intro i
    have a0 := he i 0
    have a1 := he i 1
    have a2 := he i 2
    simp only [Fin.val_zero, Fin.val_one, Fin.val_two, add_zero] at a0 a1 a2
    unfold UV; rw [hr3]
    simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero]
    rw [a0, a1, a2]; ring
  have hsel : ∀ a, a < 3 → UV P e 0 * (if a = 0 then (P.dn : ℝ) * c.dm else 0) +
      UV P e 1 * (if a = 1 then (P.dn : ℝ) * c.dm else 0) +
      UV P e 2 * (if a = 2 then (P.dn : ℝ) * c.dm else 0) = (P.dn : ℝ) * c.dm * UV P e a := by
    intro a ha; interval_cases a <;> simp <;> ring
  have hraw : ∀ a, a < 3 →
      AV P c e 0 * nV P c 0 a + AV P c e 1 * nV P c 1 a + AV P c e 2 * nV P c 2 a
        = -((P.dn : ℝ) * c.dm) * UV P e a := by
    intro a ha
    rw [hAV 0, hAV 1, hAV 2]
    have I0 := hI a 0 ha (by norm_num)
    have I1 := hI a 1 ha (by norm_num)
    have I2 := hI a 2 ha (by norm_num)
    linear_combination (-UV P e 0) * I0 + (-UV P e 1) * I1 + (-UV P e 2) * I2 - hsel a ha
  have hn : ∀ j (i : Fin 3), NCv P (nth c.J j 0) i = nV P c j i.val / P.dn := fun _ _ => rfl
  have hv : ∀ j (i : Fin 3), Vv P (nth c.al j 0) i = vV P c j i.val / P.dv := fun _ _ => rfl
  have hN0 : ∀ i : Fin 3, N0v P i = oV P i.val / P.dn0 := fun _ => rfl
  have hC : ∀ i : Fin 3, AV P c e 0 * NCv P (nth c.J 0 0) i + AV P c e 1 * NCv P (nth c.J 1 0) i +
      AV P c e 2 * NCv P (nth c.J 2 0) i = -((c.dm : ℝ) * Nv * P.dn0) * mv R (N0v P) i := by
    intro i
    calc AV P c e 0 * NCv P (nth c.J 0 0) i + AV P c e 1 * NCv P (nth c.J 1 0) i +
          AV P c e 2 * NCv P (nth c.J 2 0) i
        = (AV P c e 0 * nV P c 0 i.val + AV P c e 1 * nV P c 1 i.val + AV P c e 2 * nV P c 2 i.val)
            / P.dn := by rw [hn, hn, hn]; ring
      _ = (-((P.dn : ℝ) * c.dm) * UV P e i.val) / P.dn := by rw [hraw i.val i.isLt]
      _ = -((c.dm : ℝ) * Nv * P.dn0) * mv R (N0v P) i := by
        rw [hUV i, mv_apply, Fin.sum_univ_three, hN0 0, hN0 1, hN0 2]
        simp only [Fin.val_zero, Fin.val_one, Fin.val_two]
        field_simp
  have hcancel : AV P c e 0 * dot (NCv P (nth c.J 0 0)) t + AV P c e 1 * dot (NCv P (nth c.J 1 0)) t +
      AV P c e 2 * dot (NCv P (nth c.J 2 0)) t = -((c.dm : ℝ) * Nv * P.dn0) * dot (mv R (N0v P)) t := by
    simp only [dot, Fin.sum_univ_three]
    linear_combination (t 0) * hC 0 + (t 1) * hC 1 + (t 2) * hC 2
  have E0 : e 0 = Nv * R 0 0 := he 0 0
  have E1 : e 1 = Nv * R 0 1 := he 0 1
  have E2 : e 2 = Nv * R 0 2 := he 0 2
  have E3 : e 3 = Nv * R 1 0 := he 1 0
  have E4 : e 4 = Nv * R 1 1 := he 1 1
  have E5 : e 5 = Nv * R 1 2 := he 1 2
  have E6 : e 6 = Nv * R 2 0 := he 2 0
  have E7 : e 7 = Nv * R 2 1 := he 2 1
  have E8 : e 8 = Nv * R 2 2 := he 2 2
  have hX : ∀ j, BV P c e j = Nv * P.dn * P.dv * XV P c R j := by
    intro j
    unfold BV XV; rw [hr9]
    simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, Nat.reduceDiv, Nat.reduceMod]
    rw [E0, E1, E2, E3, E4, E5, E6, E7, E8]
    simp only [dot, mv_apply, Fin.sum_univ_three, hn, hv, Fin.val_zero, Fin.val_one, Fin.val_two]
    field_simp
    ring
  have hd0n : fval P.ps P.d0.num = D0r P * P.d0.den := by unfold D0r; field_simp
  have hssn : fval P.ps P.sstar.num = Ss P * P.sstar.den := by unfold Ss; field_simp
  refine ⟨?_, hcancel⟩
  unfold FV sAV; rw [hr3]
  simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil]
  rw [hX 0, hX 1, hX 2, hd0n, hssn]
  push_cast
  ring

/-! ## The real core of the mixed leaf -/

theorem sum_map_add {ι : Type*} (l : List ι) (f g : ι → ℝ) :
    (l.map (fun i => f i + g i)).sum = (l.map f).sum + (l.map g).sum := by
  induction l with
  | nil => simp
  | cons a l ih => simp only [List.map_cons, List.sum_cons, ih]; ring

theorem sum_map_le {ι : Type*} (l : List ι) (f g : ι → ℝ) (h : ∀ i ∈ l, f i ≤ g i) :
    (l.map f).sum ≤ (l.map g).sum := List.sum_le_sum h

/-- **The real core.** Rows `X_f + Y_f ≤ S` (multiplier `a_f ≥ 0`) and `X_f − Y_f ≤ S` (multiplier
`b_f ≥ 0`), with `Σ (a_f − b_f) Y_f = −κ Z`, `κ > 0`, `Z ≤ −D0 < 0`, give
`Σ (a_f + b_f) X_f ≤ Σ (a_f + b_f) S − κ D0` and `Σ (a_f + b_f) > 0`. -/
theorem mix_core {ι : Type*} (act : List ι) (a b X Y : ι → ℝ) {S κ Z D0 : ℝ}
    (ha : ∀ f ∈ act, 0 ≤ a f) (hb : ∀ f ∈ act, 0 ≤ b f)
    (hr1 : ∀ f ∈ act, X f + Y f ≤ S) (hr2 : ∀ f ∈ act, X f - Y f ≤ S)
    (hcanc : (act.map (fun f => (a f - b f) * Y f)).sum = -κ * Z) (hκ : 0 < κ) (hZ : Z ≤ -D0)
    (hD0 : 0 < D0) :
    (act.map (fun f => (a f + b f) * X f)).sum ≤ (act.map (fun f => a f + b f)).sum * S - κ * D0 ∧
      0 < (act.map (fun f => a f + b f)).sum := by
  have hrow : ∀ f ∈ act, (a f + b f) * X f + (a f - b f) * Y f ≤ (a f + b f) * S := by
    intro f hf
    have e1 := mul_le_mul_of_nonneg_left (hr1 f hf) (ha f hf)
    have e2 := mul_le_mul_of_nonneg_left (hr2 f hf) (hb f hf)
    nlinarith
  have hsum := sum_map_le act _ _ hrow
  rw [sum_map_add, hcanc, List.sum_map_mul_right] at hsum
  have hκZ : κ * D0 ≤ -κ * Z := by nlinarith
  refine ⟨by linarith, ?_⟩
  by_contra hle
  push Not at hle
  have hnn : 0 ≤ (act.map (fun f => a f + b f)).sum :=
    List.sum_nonneg (fun x hx => by
      obtain ⟨f, hf, rfl⟩ := List.mem_map.1 hx
      exact add_nonneg (ha f hf) (hb f hf))
  have h0 : (act.map (fun f => a f + b f)).sum = 0 := le_antisymm hle hnn
  have hz : ∀ f ∈ act, a f = 0 ∧ b f = 0 := by
    intro f hf
    have hle' : a f + b f ≤ (act.map (fun f => a f + b f)).sum :=
      List.single_le_sum (fun x hx => by
        obtain ⟨g, hg, rfl⟩ := List.mem_map.1 hx
        exact add_nonneg (ha g hg) (hb g hg)) _ (List.mem_map_of_mem hf)
    have := ha f hf; have := hb f hf
    constructor <;> linarith
  have hc0 : (act.map (fun f => (a f - b f) * Y f)).sum = 0 := by
    apply List.sum_eq_zero
    intro x hx
    obtain ⟨f, hf, rfl⟩ := List.mem_map.1 hx
    rw [(hz f hf).1, (hz f hf).2]; ring
  rw [hcanc] at hc0
  have : Z = 0 := by
    have := mul_eq_zero.1 (show κ * Z = 0 by linarith)
    rcases this with h | h
    · linarith
    · exact h
  linarith

/-! ## The value of the lift -/

/-- **The lift** `liftPoly P Rq N dm f v` at `x` is `2·den(D0)·dm·dn0·(den(S*)·B − dn dv S*num N)`
with `B = Σ_t n_f[t/3] v[t%3] e_t`. -/
theorem lift_value {P : Prob} (hwf : WF P) {Rq : List Poly} {N : Poly}
    (hRq : ∀ p ∈ Rq, PolySemG.WF P.ps p) (hN : PolySemG.WF P.ps N) (dm f v : ℕ)
    (hf : f < P.normals.length) (hv : v < P.verts.length) (x : Fin 3 → ℝ) :
    PolySemG.WF P.ps (liftPoly P Rq N dm f v) ∧
    pEval P.ps (liftPoly P Rq N dm f v) x =
      2 * P.d0.den * dm * P.dn0 *
        (P.sstar.den * ((List.range 9).map (fun t =>
            ent P.ps P.nb (nth P.normals f []) (t / 3) * ent P.ps P.nb (nth P.verts v []) (t % 3) *
              pEval P.ps (nth Rq t []) x)).sum -
          P.dn * P.dv * fval P.ps P.sstar.num * pEval P.ps N x) := by
  have hnth : ∀ t, Ev P.ps x (nth Rq t []) (pEval P.ps (nth Rq t []) x) :=
    fun t => ⟨LocalG.nth_WF hRq t, rfl⟩
  have hB : Ev P.ps x (psum ((List.range 9).map (fun t => psmulF P.ps
      (fmul P.ps (vecGet (nth P.normals f []) (t / 3) P.nb) (vecGet (nth P.verts v []) (t % 3) P.nb))
      (nth Rq t []))))
      ((List.range 9).map (fun t =>
            ent P.ps P.nb (nth P.normals f []) (t / 3) * ent P.ps P.nb (nth P.verts v []) (t % 3) *
              pEval P.ps (nth Rq t []) x)).sum := by
    refine ev_psum_range x 9 _ _ ?_
    intro t _
    have l1 := len_get hwf.nb hwf.normals f (t / 3)
    have l2 := len_get hwf.nb hwf.verts v (t % 3)
    have := ev_smulF x (len_fmul l1 l2) (hnth t)
    rw [fval_fmul l1 l2] at this
    exact this
  have hL := ev_psub x (ev_smul x (P.sstar.den : ℤ) hB)
    (ev_smulF x (len_fsmul ((P.dn : ℤ) * P.dv) hwf.sstar) (show Ev P.ps x N (pEval P.ps N x) from ⟨hN, rfl⟩))
  have hfin := ev_smul x (2 * (P.d0.den : ℤ) * dm * P.dn0) hL
  refine ⟨hfin.1, ?_⟩
  have h2 := hfin.2
  unfold liftPoly
  simp only at h2 ⊢
  rw [h2, fval_fsmul]
  push_cast
  ring

/-! ## The opposite rows -/

/-- `containerOk` closes the normals under `n ↦ −n`. -/
theorem csym_of {P : Prob} (hwf : WF P) (h : containerOk P = true) :
    ∀ j < P.normals.length, ∃ j' < P.normals.length, NCv P j' = -NCv P j := by
  unfold containerOk at h
  simp only [Bool.and_eq_true] at h
  have hs := h.1.1.1.1.1.1.1.1.1.1
  simp only [List.all_eq_true, List.any_eq_true, beq_iff_eq, Bool.and_eq_true] at hs
  intro j hj
  have hv : nth P.normals j [] ∈ P.normals := by
    unfold nth; rw [List.getD_eq_getElem _ _ hj]; exact List.getElem_mem hj
  obtain ⟨_, w, hw, hwe⟩ := hs _ hv
  obtain ⟨j', hj', he⟩ := FarG.exists_nth hw []
  refine ⟨j', hj', ?_⟩
  obtain ⟨_, hne⟩ := UpperG.neg_spec (nb := P.nb) (lenV_nth hwf.normals hj)
  ext i
  rw [PiLp.neg_apply, NCv, NCv, vec_apply, vec_apply, he, hwe]
  rw [hne, neg_div]

/-- **The opposite row.** If the container and the piece are centrally symmetric, the row
`(−f, −v)` gives `X − Y ≤ S` for the row `(f, v)` with `X = n_f·R v`, `Y = n_f·t`. -/
theorem opp_row {P : Prob} (hwf : WF P) (hco : containerOk P = true) (hpo : pieceOk P = true)
    {R : M3} {t : E3} {S : ℝ}
    (hLP : polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S)
    {f l : ℕ} (hf : f < P.normals.length) (hl : l < P.verts.length) :
    dot (NCv P f) (mv R (Vv P l)) - dot (NCv P f) t ≤ S := by
  obtain ⟨f', hf', hnf⟩ := csym_of hwf hco f hf
  obtain ⟨l', hl', hvl⟩ := D16Main.hsym_of hwf hpo l hl
  have := hLP.1 f' hf' l' hl'
  rw [hnf, hvl] at this
  have h1 : dot (-NCv P f) (mv R (-Vv P l)) = dot (NCv P f) (mv R (Vv P l)) := by
    simp only [dot, mv, PiLp.neg_apply, WithLp.toLp_neg, Fin.sum_univ_three]
    ring
  have h2 : dot (-NCv P f) t = -dot (NCv P f) t := by
    simp only [dot, PiLp.neg_apply, Fin.sum_univ_three]; ring
  linarith

/-! ## The faces of a candidate are distinct -/

theorem J_distinct {P : Prob} {c : Cand} (hwf : WF P) (hd : Dens P) (hm : ∀ v ∈ c.minv, LenV P.ps v)
    (hc : candOk P c = true) :
    nth c.J 0 0 ≠ nth c.J 1 0 ∧ nth c.J 0 0 ≠ nth c.J 2 0 ∧ nth c.J 1 0 ≠ nth c.J 2 0 := by
  obtain ⟨_, _, hdm, _, _, hI⟩ := cand_ident hwf hm hc
  have hdn : (0 : ℝ) < P.dn := by exact_mod_cast hd.dn
  have hdm' : (0 : ℝ) < c.dm := by exact_mod_cast hdm
  have hk : (P.dn : ℝ) * c.dm ≠ 0 := by positivity
  let A : Matrix (Fin 3) (Fin 3) ℝ := Matrix.of fun r j => nV P c j.val r.val / ((P.dn : ℝ) * c.dm)
  let B : Matrix (Fin 3) (Fin 3) ℝ := Matrix.of fun j s => mV P c j.val s.val
  have hAB : A * B = 1 := by
    ext r s
    have := hI r.val s.val r.isLt s.isLt
    simp only [A, B, Matrix.mul_apply, Fin.sum_univ_three, Matrix.of_apply, Matrix.one_apply,
      Fin.val_zero, Fin.val_one, Fin.val_two]
    have e : (r = s) ↔ (r.val = s.val) := Fin.val_inj.symm
    by_cases h : r = s
    · rw [if_pos h]; rw [if_pos (e.1 h)] at this
      field_simp; linarith
    · rw [if_neg h]; rw [if_neg (fun h' => h (e.2 h'))] at this
      field_simp; linarith
  have hBA : B * A = 1 := mul_eq_one_comm.1 hAB
  have key : ∀ a b : Fin 3, a ≠ b → nth c.J a.val 0 ≠ nth c.J b.val 0 := by
    intro a b hab heq
    have h1 : (B * A) a a = (B * A) a b := by
      simp only [A, B, Matrix.mul_apply, Fin.sum_univ_three, Matrix.of_apply]
      unfold nV; rw [heq]
    rw [hBA, Matrix.one_apply_eq, Matrix.one_apply_ne hab] at h1
    exact one_ne_zero h1
  exact ⟨key 0 1 (by decide), key 0 2 (by decide), key 1 2 (by decide)⟩

/-! ## Regrouping the rows of a candidate by the faces of `act` -/

theorem sum_ite_single {act : List ℕ} (hact : act.Nodup) {c : ℕ} (hc : c ∈ act) (h : ℕ → ℝ) :
    (act.map (fun f => if f = c then h f else 0)).sum = h c := by
  induction act with
  | nil => simp at hc
  | cons a l ih =>
    rw [List.nodup_cons] at hact
    simp only [List.map_cons, List.sum_cons]
    by_cases hac : a = c
    · subst hac
      rw [if_pos rfl]
      have : (l.map (fun f => if f = a then h f else 0)).sum = 0 := by
        apply List.sum_eq_zero
        intro x hx
        obtain ⟨g, hg, rfl⟩ := List.mem_map.1 hx
        rw [if_neg (fun (e : g = a) => hact.1 (by rw [← e]; exact hg))]
      rw [this, add_zero]
    · rw [if_neg hac, zero_add]
      exact ih hact.2 ((List.mem_cons.1 hc).resolve_left (Ne.symm hac))

theorem sum_map_add3 {ι : Type*} (l : List ι) (f g h : ι → ℝ) :
    (l.map (fun i => f i + g i + h i)).sum = (l.map f).sum + (l.map g).sum + (l.map h).sum := by
  rw [sum_map_add, sum_map_add]

/-- **Regrouping.** For the three distinct faces `J` of a candidate, all in `act` (no repeats),
`Σ_j A_j g(J_j) = Σ_{f ∈ act} [f ∈ J] A_{idx f} g(f)` (the form of `mixOk`'s `terms`). -/
theorem regroup3 {act : List ℕ} (hact : act.Nodup) {J : List ℕ} (hJ : J.length = 3)
    (hd : nth J 0 0 ≠ nth J 1 0 ∧ nth J 0 0 ≠ nth J 2 0 ∧ nth J 1 0 ≠ nth J 2 0)
    (hsub : ∀ j < 3, nth J j 0 ∈ act) (A g : ℕ → ℝ) :
    A 0 * g (nth J 0 0) + A 1 * g (nth J 1 0) + A 2 * g (nth J 2 0) =
      (act.map (fun f => (if J.contains f then A (idxOf J f) else 0) * g f)).sum := by
  obtain ⟨j0, j1, j2, rfl⟩ := List.length_eq_three.1 hJ
  simp only [nth, List.getD_cons_zero, List.getD_cons_succ] at hd hsub ⊢
  obtain ⟨d01, d02, d12⟩ := hd
  have m0 : j0 ∈ act := hsub 0 (by norm_num)
  have m1 : j1 ∈ act := hsub 1 (by norm_num)
  have m2 : j2 ∈ act := hsub 2 (by norm_num)
  have hr : List.range 3 = [0, 1, 2] := rfl
  have hpt : ∀ f, (if [j0, j1, j2].contains f then A (idxOf [j0, j1, j2] f) else 0) * g f =
      (if f = j0 then A 0 * g f else 0) + (if f = j1 then A 1 * g f else 0) +
        (if f = j2 then A 2 * g f else 0) := by
    intro f
    by_cases h0 : f = j0
    · subst h0
      simp [idxOf, nth, hr, List.find?, d01, d02]
    · by_cases h1 : f = j1
      · subst h1
        have e1 : (j0 == f) = false := beq_eq_false_iff_ne.2 d01
        simp [idxOf, nth, hr, List.find?, d12, Ne.symm d01, h0, e1]
      · by_cases h2 : f = j2
        · subst h2
          have e1 : (j0 == f) = false := beq_eq_false_iff_ne.2 d02
          have e2 : (j1 == f) = false := beq_eq_false_iff_ne.2 d12
          simp [idxOf, nth, hr, List.find?, Ne.symm d02, Ne.symm d12, h0, h1, e1, e2]
        · simp [h0, h1, h2]
  simp only [hpt]
  rw [sum_map_add3, sum_ite_single hact m0 (fun f => A 0 * g f),
    sum_ite_single hact m1 (fun f => A 1 * g f), sum_ite_single hact m2 (fun f => A 2 * g f)]

/-! ## The candidate with the vertices of the box -/

theorem candOk_al {P : Prob} {c : Cand} (hc : candOk P c = true) {al' : List ℕ}
    (hl : al'.length = 3) (hv : ∀ v ∈ al', v < P.verts.length) : candOk P { c with al := al' } = true := by
  unfold candOk at hc ⊢
  simp only [Bool.and_eq_true, beq_iff_eq, List.all_eq_true, decide_eq_true_eq] at hc ⊢
  obtain ⟨⟨⟨⟨⟨⟨h1, _⟩, h3⟩, h4⟩, h5⟩, _⟩, h7⟩ := hc
  exact ⟨⟨⟨⟨⟨⟨h1, hl⟩, h3⟩, h4⟩, h5⟩, hv⟩, h7⟩

end

end PackLean.Formal.LocalTubeMix
