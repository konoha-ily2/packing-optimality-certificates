import PackLean.Formal.PolyLP

/-!
# D45 stage 4h: the representative of largest trace

The discard rule of the far checker (`D16.Core`, token `D m`): on a box where
`tr(g_m R k_m) > tr(R)` for a symmetry pair `(g_m, k_m)`, no rotation needs to be looked at.  The
reason: every feasible `R` has a feasible representative `Q = g R k` of *largest* trace among all
symmetry pairs, and such a `Q` is in no discarded box.

* `Gset NC mc`: orthogonal `g` mapping the container normals into themselves;
* `Kset V nv n0`: orthogonal `k` mapping the points of the piece into themselves and fixing `n0`;
* `orbit R = {g R k | g ∈ Gset, k ∈ Kset, det g · det k = 1}`.

`orbit R` is compact (the pairs form a closed subset of the bounded set of matrices with entries in
`[-1, 1]`), so the trace has a maximum on it (`exists_max_trace`); no finiteness or spanning of the
normals is needed.  The orbit is closed under further pairs (`orbit_mul`), hence the maximum `Q`
satisfies `tr(g Q k) ≤ tr(Q)` for *every* pair (`max_rep`), and `Q` is feasible with the same `S`
(`polyLP_sym`).
-/

namespace PackLean.Formal.Orbit

open PackLean.Formal PackLean.Formal.Polytope PackLean.Formal.PolyLP Finset
open scoped Matrix

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-- Symmetries of the container: orthogonal, mapping the normals into themselves. -/
def Gset (NC : ℕ → E3) (mc : ℕ) : Set M3 :=
  {g | gᵀ * g = 1 ∧ ∀ j < mc, ∃ j' < mc, mv g (NC j) = NC j'}

/-- Symmetries of the piece fixing the face `n0`. -/
def Kset (V : ℕ → E3) (nv : ℕ) (n0 : E3) : Set M3 :=
  {k | kᵀ * k = 1 ∧ (∀ l < nv, ∃ l' < nv, mv k (V l) = V l') ∧ mv k n0 = n0}

/-- The admissible pairs. -/
def Pairs (V : ℕ → E3) (nv : ℕ) (NC : ℕ → E3) (mc : ℕ) (n0 : E3) : Set (M3 × M3) :=
  {p | p.1 ∈ Gset NC mc ∧ p.2 ∈ Kset V nv n0 ∧ p.1.det * p.2.det = 1}

/-- The orbit of `R` under the pairs. -/
def orbit (V : ℕ → E3) (nv : ℕ) (NC : ℕ → E3) (mc : ℕ) (n0 : E3) (R : M3) : Set M3 :=
  (fun p : M3 × M3 => p.1 * R * p.2) '' Pairs V nv NC mc n0

variable {V : ℕ → E3} {nv : ℕ} {NC : ℕ → E3} {mc : ℕ} {n0 : E3}

/-! ## Closure under products -/

theorem one_mem_G : (1 : M3) ∈ Gset NC mc :=
  ⟨by simp, fun j hj => ⟨j, hj, mv_one _⟩⟩

theorem one_mem_K : (1 : M3) ∈ Kset V nv n0 :=
  ⟨by simp, fun l hl => ⟨l, hl, mv_one _⟩, mv_one _⟩

theorem mul_mem_G {g g' : M3} (hg : g ∈ Gset NC mc) (hg' : g' ∈ Gset NC mc) :
    g' * g ∈ Gset NC mc := by
  refine ⟨?_, fun j hj => ?_⟩
  · rw [Matrix.transpose_mul]
    calc gᵀ * g'ᵀ * (g' * g) = gᵀ * (g'ᵀ * g') * g := by simp only [Matrix.mul_assoc]
      _ = 1 := by rw [hg'.1, Matrix.mul_one, hg.1]
  · obtain ⟨j1, hj1, e1⟩ := hg.2 j hj
    obtain ⟨j2, hj2, e2⟩ := hg'.2 j1 hj1
    exact ⟨j2, hj2, by rw [mv_mul, e1, e2]⟩

theorem mul_mem_K {k k' : M3} (hk : k ∈ Kset V nv n0) (hk' : k' ∈ Kset V nv n0) :
    k * k' ∈ Kset V nv n0 := by
  refine ⟨?_, fun l hl => ?_, ?_⟩
  · rw [Matrix.transpose_mul]
    calc k'ᵀ * kᵀ * (k * k') = k'ᵀ * (kᵀ * k) * k' := by simp only [Matrix.mul_assoc]
      _ = 1 := by rw [hk.1, Matrix.mul_one, hk'.1]
  · obtain ⟨l1, hl1, e1⟩ := hk'.2.1 l hl
    obtain ⟨l2, hl2, e2⟩ := hk.2.1 l1 hl1
    exact ⟨l2, hl2, by rw [mv_mul, e1, e2]⟩
  · rw [mv_mul, hk'.2.2, hk.2.2]

theorem self_mem_orbit (R : M3) : R ∈ orbit V nv NC mc n0 R :=
  ⟨(1, 1), ⟨one_mem_G, one_mem_K, by simp⟩, by simp⟩

/-- The orbit is closed under further pairs. -/
theorem orbit_mul {R Q : M3} (hQ : Q ∈ orbit V nv NC mc n0 R) {g k : M3} (hg : g ∈ Gset NC mc)
    (hk : k ∈ Kset V nv n0) (hdet : g.det * k.det = 1) : g * Q * k ∈ orbit V nv NC mc n0 R := by
  obtain ⟨⟨g0, k0⟩, ⟨hg0, hk0, hd0⟩, rfl⟩ := hQ
  refine ⟨(g * g0, k0 * k), ⟨mul_mem_G hg0 hg, mul_mem_K hk0 hk, ?_⟩, ?_⟩
  · simp only [Matrix.det_mul]
    linear_combination (g.det * k.det) * hd0 + hdet
  · simp only [Matrix.mul_assoc]

/-- Every member of the orbit of a feasible `R ∈ SO(3)` is a feasible rotation. -/
theorem orbit_feasible {D0 : ℝ} {R : M3} (hR : R ∈ SO3) {t : E3} {S : ℝ}
    (h : polyLP V nv NC mc n0 D0 R t S) {Q : M3} (hQ : Q ∈ orbit V nv NC mc n0 R) :
    Q ∈ SO3 ∧ ∃ t' : E3, polyLP V nv NC mc n0 D0 Q t' S := by
  obtain ⟨⟨g, k⟩, ⟨hg, hk, hd⟩, rfl⟩ := hQ
  exact ⟨sym_mem_SO hg.1 hk.1 hd hR, mv g t, polyLP_sym hg.1 hg.2 hk.2.1 hk.2.2 h⟩

/-! ## Compactness -/

/-- The entries of an orthogonal matrix are in `[-1, 1]`. -/
theorem entry_mem_Icc {g : M3} (hg : gᵀ * g = 1) (i j : Fin 3) : g i j ∈ Set.Icc (-1 : ℝ) 1 := by
  have h := congrFun (congrFun hg j) j
  simp only [Matrix.mul_apply, Matrix.transpose_apply, Matrix.one_apply_eq, Fin.sum_univ_three] at h
  constructor <;> fin_cases i <;> simp <;> nlinarith [sq_nonneg (g 0 j), sq_nonneg (g 1 j), sq_nonneg (g 2 j)]

/-- Matrices with entries in `[-1, 1]`. -/
def Box : Set M3 := Set.pi Set.univ fun _ => Set.pi Set.univ fun _ => Set.Icc (-1 : ℝ) 1

theorem isCompact_Box : IsCompact Box :=
  isCompact_univ_pi fun _ => isCompact_univ_pi fun _ => isCompact_Icc

theorem orth_mem_Box {g : M3} (hg : gᵀ * g = 1) : g ∈ Box :=
  fun i _ j _ => entry_mem_Icc hg i j

theorem continuous_entry (i j : Fin 3) : Continuous fun g : M3 => g i j :=
  (continuous_apply j).comp (continuous_apply i)

theorem isClosed_orth : IsClosed {g : M3 | gᵀ * g = 1} :=
  isClosed_eq (continuous_id.matrix_transpose.matrix_mul continuous_id) continuous_const

theorem isClosed_mv_eq (x y : E3) : IsClosed {g : M3 | mv g x = y} := by
  have : {g : M3 | mv g x = y}
      = ⋂ i : Fin 3, {g : M3 | g i 0 * x 0 + g i 1 * x 1 + g i 2 * x 2 = y i} := by
    ext g
    simp only [Set.mem_ofPred_eq, Set.mem_iInter]
    constructor
    · intro h i; rw [← Fin.sum_univ_three (fun j => g i j * x j), ← mv_apply, h]
    · intro h; ext i; rw [mv_apply, Fin.sum_univ_three, h i]
  rw [this]
  exact isClosed_iInter fun i => isClosed_eq
    ((((continuous_entry i 0).mul continuous_const).add ((continuous_entry i 1).mul continuous_const)).add
      ((continuous_entry i 2).mul continuous_const)) continuous_const

theorem isClosed_maps (W : ℕ → E3) (n : ℕ) :
    IsClosed {g : M3 | ∀ l < n, ∃ l' < n, mv g (W l) = W l'} := by
  have : {g : M3 | ∀ l < n, ∃ l' < n, mv g (W l) = W l'}
      = ⋂ l ∈ {l | l < n}, ⋃ l' ∈ {l' | l' < n}, {g : M3 | mv g (W l) = W l'} := by
    ext g; simp
  rw [this]
  exact isClosed_biInter fun l _ =>
    (Set.finite_lt_nat n).isClosed_biUnion fun l' _ => isClosed_mv_eq _ _

theorem isClosed_G : IsClosed (Gset NC mc) := isClosed_orth.inter (isClosed_maps NC mc)

theorem isClosed_K : IsClosed (Kset V nv n0) :=
  isClosed_orth.inter ((isClosed_maps V nv).inter (isClosed_mv_eq n0 n0))

theorem isCompact_Pairs : IsCompact (Pairs V nv NC mc n0) := by
  refine (isCompact_Box.prod isCompact_Box).of_isClosed_subset ?_ ?_
  · have h1 : IsClosed {p : M3 × M3 | p.1.det * p.2.det = 1} :=
      isClosed_eq (continuous_fst.matrix_det.mul continuous_snd.matrix_det) continuous_const
    exact (isClosed_G.preimage continuous_fst).inter ((isClosed_K.preimage continuous_snd).inter h1)
  · rintro p ⟨hg, hk, -⟩
    exact ⟨orth_mem_Box hg.1, orth_mem_Box hk.1⟩

theorem isCompact_orbit (R : M3) : IsCompact (orbit V nv NC mc n0 R) :=
  isCompact_Pairs.image ((continuous_fst.matrix_mul continuous_const).matrix_mul continuous_snd)

/-- The trace has a maximum on the orbit. -/
theorem exists_max_trace (R : M3) :
    ∃ Q ∈ orbit V nv NC mc n0 R, ∀ Q' ∈ orbit V nv NC mc n0 R, Q'.trace ≤ Q.trace := by
  obtain ⟨Q, hQ, hmax⟩ := (isCompact_orbit R).exists_isMaxOn ⟨R, self_mem_orbit R⟩
    (continuous_id.matrix_trace).continuousOn
  exact ⟨Q, hQ, fun Q' hQ' => hmax hQ'⟩

/-- **The representative of largest trace.** A feasible `R ∈ SO(3)` has a feasible `Q ∈ SO(3)` (same
`S`) with `tr(g Q k) ≤ tr(Q)` for every symmetry pair `(g, k)`. -/
theorem max_rep {D0 : ℝ} {R : M3} (hR : R ∈ SO3) {t : E3} {S : ℝ}
    (h : polyLP V nv NC mc n0 D0 R t S) :
    ∃ Q ∈ SO3, (∃ t' : E3, polyLP V nv NC mc n0 D0 Q t' S) ∧
      ∀ g ∈ Gset NC mc, ∀ k ∈ Kset V nv n0, g.det * k.det = 1 → (g * Q * k).trace ≤ Q.trace := by
  obtain ⟨Q, hQ, hmax⟩ := exists_max_trace (V := V) (nv := nv) (NC := NC) (mc := mc) (n0 := n0) R
  obtain ⟨hQSO, t', ht'⟩ := orbit_feasible hR h hQ
  exact ⟨Q, hQSO, ⟨t', ht'⟩, fun g hg k hk hd => hmax _ (orbit_mul hQ hg hk hd)⟩

/-- The trace of `g R k` as the sum `Σ M_ij R_ij` with `M_ij = Σ_l k_jl g_li` (`pairM` of the checker,
before the denominators). -/
theorem trace_gRk (g R k : M3) :
    (g * R * k).trace = ∑ i, ∑ j, (∑ l, k j l * g l i) * R i j := by
  simp only [Matrix.trace, Matrix.diag, Matrix.mul_apply, Fin.sum_univ_three]
  ring

end

#assert_std_axioms PackLean.Formal.Orbit.max_rep PackLean.Formal.Orbit.exists_max_trace
  PackLean.Formal.Orbit.orbit_feasible PackLean.Formal.Orbit.trace_gRk

end PackLean.Formal.Orbit
