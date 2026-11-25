import PackLean.Formal.LocalG

/-!
# D45 stage 6b/5b: weighted weak duality (Lemma W (i), D30 3.1; Lemma Q, D44 3.2)

`LocalG.cand_bound` gives `S ≥ S*` from **one** candidate `k = (J, α)` with `A^k_j ≥ 0` and `F_k ≥ 0`.
Here the same identity is used for several candidates at the same point: for every candidate with
`A^k ≥ 0`,

  `F_k ≤ c_k · (S - S*)`,   `c_k := den(D0)·den(S*)·dn·dv·N·Σ_j A^k_j ≥ 0`   (`cand_le`),

so positive weights `w_k ≥ 0` with `Σ w_k F_k > 0` give `S ≥ S*` (`cands_wbound`). The weights and the
candidates are arbitrary (the soundness does not depend on how they are chosen); the denominators `dm`
of the candidates need not agree.

* `wdual_list` / `wdual_list'`: the real core (strict sum, or `Σ w F ≥ 0` with `Σ w c > 0`);
* `dual_le`: the per-candidate inequality behind `LocalG.dual_core`;
* `cand_le`: `F_k ≤ c_k (S - S*)` for one candidate (the computation of `LocalG.cand_bound`);
* `cands_wbound`: the weighted bound for a list of (candidate, weight) indices.

Shared by the local region of Lemma Q (D44: icoinico・dodindod・octinoct, `LocalQ`) and the mixed
leaves of the tube (octinico, `LocalTube`).
-/

namespace PackLean.Formal.LocalW

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign Mono Poly padd psum pmul
  psmulZ psmulF nth vecGet)
open PackLean.D16 (Prob Cand candOk)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.QuadSem
  PackLean.Formal.FarAccept PackLean.Formal.LocalG
open PackLean.Formal.Polytope (dot)

noncomputable section

/-! ## The real core -/

theorem sum_map_nonpos {ι : Type*} (l : List ι) (f : ι → ℝ) (h : ∀ i ∈ l, f i ≤ 0) :
    (l.map f).sum ≤ 0 := by
  induction l with
  | nil => simp
  | cons a l ih =>
    simp only [List.map_cons, List.sum_cons]
    have h1 := h a (by simp)
    have h2 := ih (fun i hi => h i (List.mem_cons_of_mem _ hi))
    linarith

/-- **Weighted weak duality, strict form.** If every term satisfies `F_i ≤ c_i (S - S*)` with
`c_i ≥ 0`, nonnegative weights and `Σ w_i F_i > 0`, then `S* ≤ S`. -/
theorem wdual_list {ι : Type*} (ws : List ι) (w F c : ι → ℝ) {Sst S : ℝ}
    (hw : ∀ i ∈ ws, 0 ≤ w i) (hc : ∀ i ∈ ws, 0 ≤ c i) (hF : ∀ i ∈ ws, F i ≤ c i * (S - Sst))
    (hpos : 0 < (ws.map (fun i => w i * F i)).sum) : Sst ≤ S := by
  by_contra hlt
  have hlt' : S - Sst < 0 := by linarith [not_le.1 hlt]
  have hle : (ws.map (fun i => w i * F i)).sum ≤ 0 := by
    apply sum_map_nonpos
    intro i hi
    have h1 : F i ≤ 0 := (hF i hi).trans (mul_nonpos_of_nonneg_of_nonpos (hc i hi) hlt'.le)
    exact mul_nonpos_of_nonneg_of_nonpos (hw i hi) h1
  linarith

/-- **Weighted weak duality, nonstrict form** (as written in D44 3.2): `Σ w_i F_i ≥ 0` and
`Σ w_i c_i > 0`. -/
theorem wdual_list' {ι : Type*} (ws : List ι) (w F c : ι → ℝ) {Sst S : ℝ}
    (hw : ∀ i ∈ ws, 0 ≤ w i) (hF : ∀ i ∈ ws, F i ≤ c i * (S - Sst))
    (hpos : 0 ≤ (ws.map (fun i => w i * F i)).sum) (hcpos : 0 < (ws.map (fun i => w i * c i)).sum) :
    Sst ≤ S := by
  have hle : (ws.map (fun i => w i * F i)).sum ≤ (ws.map (fun i => w i * c i)).sum * (S - Sst) := by
    rw [← List.sum_map_mul_right]
    apply List.sum_le_sum
    intro i hi
    have := mul_le_mul_of_nonneg_left (hF i hi) (hw i hi)
    linarith
  by_contra hlt
  have hlt' : S - Sst < 0 := by linarith [not_le.1 hlt]
  have : (ws.map (fun i => w i * c i)).sum * (S - Sst) < 0 := mul_neg_of_pos_of_neg hcpos hlt'
  linarith

/-- The inequality behind `LocalG.dual_core`, without dividing: the face row and the rows
`(J_j, α_j)` with multipliers `A_j ≥ 0` bound the candidate expression by `dn·dv·N·ΣA·(S - S*)`. -/
theorem dual_le {A0 A1 A2 X0 X1 X2 Y0 Y1 Y2 Z Nv dn dv dn0 dm D0 Sst S : ℝ}
    (hA0 : 0 ≤ A0) (hA1 : 0 ≤ A1) (hA2 : 0 ≤ A2) (hNv : 0 < Nv) (hdn : 0 < dn) (hdv : 0 < dv)
    (hdn0 : 0 < dn0) (hdm : 0 < dm)
    (r0 : X0 + Y0 ≤ S) (r1 : X1 + Y1 ≤ S) (r2 : X2 + Y2 ≤ S) (hZ : Z ≤ -D0)
    (hc : A0 * Y0 + A1 * Y1 + A2 * Y2 = -(dm * Nv * dn0) * Z) :
    dm * dn0 * dn * dv * D0 * Nv ^ 2 - dn * dv * Sst * Nv * (A0 + A1 + A2) +
      (A0 * (Nv * dn * dv * X0) + A1 * (Nv * dn * dv * X1) + A2 * (Nv * dn * dv * X2))
      ≤ dn * dv * Nv * (A0 + A1 + A2) * (S - Sst) := by
  have e0 := mul_le_mul_of_nonneg_left r0 hA0
  have e1 := mul_le_mul_of_nonneg_left r1 hA1
  have e2 := mul_le_mul_of_nonneg_left r2 hA2
  have hk : 0 < dm * Nv * dn0 := by positivity
  have ez := mul_le_mul_of_nonneg_left hZ hk.le
  have h1 : A0 * X0 + A1 * X1 + A2 * X2 ≤ (A0 + A1 + A2) * S - dm * Nv * dn0 * D0 := by
    linarith
  have hQ : 0 < Nv * dn * dv := by positivity
  have h1' := mul_le_mul_of_nonneg_left h1 hQ.le
  nlinarith

/-! ## One candidate -/

/-- The coefficient `c_k = den(D0)·den(S*)·dn·dv·N·Σ_j A^k_j` of `F_k ≤ c_k (S - S*)`. -/
def cW (P : Prob) (c : Cand) (e : ℕ → ℝ) (Nv : ℝ) : ℝ :=
  ((P.d0.den : ℝ) * P.sstar.den) * (P.dn * P.dv * Nv * (AV P c e 0 + AV P c e 1 + AV P c e 2))

theorem cW_nonneg {P : Prob} (hd : Dens P) {c : Cand} {e : ℕ → ℝ} {Nv : ℝ} (hNv : 0 < Nv)
    (hA : ∀ j < 3, 0 ≤ AV P c e j) : 0 ≤ cW P c e Nv := by
  have hdn : (0 : ℝ) < P.dn := by exact_mod_cast hd.dn
  have hdv : (0 : ℝ) < P.dv := by exact_mod_cast hd.dv
  have h0 := hA 0 (by norm_num)
  have h1 := hA 1 (by norm_num)
  have h2 := hA 2 (by norm_num)
  unfold cW
  positivity

/-- **One candidate, without the sign of `F`.** At a point whose rotation entries are
`e (3a + b) = N · R a b`, with `A_j ≥ 0`, every feasible `(R, t, S)` has `F_k ≤ c_k (S - S*)`. -/
theorem cand_le {P : Prob} {c : Cand} (hwf : WF P) (hd : Dens P) (hsd : 0 < P.sstar.den)
    (hc : candOk P c = true) (hm : ∀ v ∈ c.minv, LenV P.ps v)
    {e : ℕ → ℝ} {Nv : ℝ} (hNv : 0 < Nv) {R : M3}
    (he : ∀ a b : Fin 3, e (3 * a.val + b.val) = Nv * R a b) {t : E3} {S : ℝ}
    (hLP : polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S)
    (hA : ∀ j < 3, 0 ≤ AV P c e j) : FV P c e Nv ≤ cW P c e Nv * (S - Ss P) := by
  obtain ⟨_, _, hdm, hJ, hα, hI⟩ := cand_ident hwf hm hc
  have hr3 : List.range 3 = [0, 1, 2] := rfl
  have hr9 : List.range 9 = [0, 1, 2, 3, 4, 5, 6, 7, 8] := rfl
  have hdn : (0 : ℝ) < P.dn := by exact_mod_cast hd.dn
  have hdv : (0 : ℝ) < P.dv := by exact_mod_cast hd.dv
  have hdn0 : (0 : ℝ) < P.dn0 := by exact_mod_cast hd.dn0
  have hdm' : (0 : ℝ) < c.dm := by exact_mod_cast hdm
  have hd0d : (0 : ℝ) < P.d0.den := by exact_mod_cast hd.d0
  have hssd : (0 : ℝ) < P.sstar.den := by exact_mod_cast hsd
  -- the multipliers
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
  have hX : ∀ j, BV P c e j =
      Nv * P.dn * P.dv * dot (NCv P (nth c.J j 0)) (mv R (Vv P (nth c.al j 0))) := by
    intro j
    unfold BV; rw [hr9]
    simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, Nat.reduceDiv, Nat.reduceMod]
    rw [E0, E1, E2, E3, E4, E5, E6, E7, E8]
    simp only [dot, mv_apply, Fin.sum_univ_three, hn, hv, Fin.val_zero, Fin.val_one, Fin.val_two]
    field_simp
    ring
  have hd0n : fval P.ps P.d0.num = D0r P * P.d0.den := by unfold D0r; field_simp
  have hssn : fval P.ps P.sstar.num = Ss P * P.sstar.den := by unfold Ss; field_simp
  have hFeq : FV P c e Nv = ((P.d0.den : ℝ) * P.sstar.den) *
      (c.dm * P.dn0 * P.dn * P.dv * D0r P * Nv ^ 2 -
        P.dn * P.dv * Ss P * Nv * (AV P c e 0 + AV P c e 1 + AV P c e 2) +
        (AV P c e 0 * (Nv * P.dn * P.dv * dot (NCv P (nth c.J 0 0)) (mv R (Vv P (nth c.al 0 0)))) +
         AV P c e 1 * (Nv * P.dn * P.dv * dot (NCv P (nth c.J 1 0)) (mv R (Vv P (nth c.al 1 0)))) +
         AV P c e 2 * (Nv * P.dn * P.dv * dot (NCv P (nth c.J 2 0)) (mv R (Vv P (nth c.al 2 0)))))) := by
    unfold FV sAV; rw [hr3]
    simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil]
    rw [hX 0, hX 1, hX 2, hd0n, hssn]
    push_cast
    ring
  have hcore := dual_le (Sst := Ss P) (hA 0 (by norm_num)) (hA 1 (by norm_num)) (hA 2 (by norm_num))
    hNv hdn hdv hdn0 hdm' (hLP.1 _ (hJ 0 (by norm_num)) _ (hα 0 (by norm_num)))
    (hLP.1 _ (hJ 1 (by norm_num)) _ (hα 1 (by norm_num)))
    (hLP.1 _ (hJ 2 (by norm_num)) _ (hα 2 (by norm_num))) hLP.2 hcancel
  rw [hFeq]
  unfold cW
  have hk : (0 : ℝ) ≤ (P.d0.den : ℝ) * P.sstar.den := by positivity
  have := mul_le_mul_of_nonneg_left hcore hk
  linarith

/-! ## Several candidates with weights -/

/-- **Weighted weak duality for candidates.** At one point (rotation entries `e`, `N > 0`), indices
`ws` name candidates `cd i` with weights `w i ≥ 0`; if every named candidate passes `candOk` and has
`A^{cd i}_j ≥ 0`, and `Σ w_i F_{cd i} > 0`, then every feasible `(R, t, S)` has `S ≥ S*`. -/
theorem cands_wbound {P : Prob} (hwf : WF P) (hd : Dens P) (hsd : 0 < P.sstar.den)
    {ι : Type*} (ws : List ι) (cd : ι → Cand) (w : ι → ℝ)
    (hc : ∀ i ∈ ws, candOk P (cd i) = true) (hm : ∀ i ∈ ws, ∀ v ∈ (cd i).minv, LenV P.ps v)
    (hw : ∀ i ∈ ws, 0 ≤ w i)
    {e : ℕ → ℝ} {Nv : ℝ} (hNv : 0 < Nv) {R : M3}
    (he : ∀ a b : Fin 3, e (3 * a.val + b.val) = Nv * R a b) {t : E3} {S : ℝ}
    (hLP : polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S)
    (hA : ∀ i ∈ ws, ∀ j < 3, 0 ≤ AV P (cd i) e j)
    (hpos : 0 < (ws.map (fun i => w i * FV P (cd i) e Nv)).sum) : Ss P ≤ S :=
  wdual_list ws w (fun i => FV P (cd i) e Nv) (fun i => cW P (cd i) e Nv) hw
    (fun i hi => cW_nonneg hd hNv (hA i hi))
    (fun i hi => cand_le hwf hd hsd (hc i hi) (hm i hi) hNv he hLP (hA i hi)) hpos

end

#assert_std_axioms PackLean.Formal.LocalW.cands_wbound PackLean.Formal.LocalW.wdual_list'

end PackLean.Formal.LocalW
