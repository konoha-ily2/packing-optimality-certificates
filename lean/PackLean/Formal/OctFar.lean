import PackLean.Formal.TetReduction
import PackLean.D28.UpperCore
import PackLean.Formal.CoverTreeG
import PackLean.Formal.Charts
import PackLean.D31.Core

/-!
# A9 stage 7d (part 1): meaning of the far checks of `D31.Core` (octintet)

Design: `plan/A9f_tet_design.md` §4 and §9.  The checker of `D31.Core` works with the piece scaled by
`√2` (vertices `±e_k`) and the dual bound in the form `g` (D31 §1.1); the Lean side keeps the unit
octahedron (vertices `±(√2/2) e_k`, `VV`) and reads every check as a statement about
`TetReduction.Low`:

* `qEval` (value of a `D31.Quad`; **the monomial order of D31 is `[1, s₀, s₁, s₂, s₀², s₁², s₂², s₀s₁,
  s₀s₂, s₁s₂]`**, not the order of `D28`), `rotQ_eval`, `quadLb_le`;
* the R boxes of `D31` are the R boxes of `D28` (`toD28`, same fields, same `rboxWf`, same `split3`),
  so `QuadSem.box_param` and `CoverTreeG.split3_cover` are used as they are;
* `Gc`: the candidate form `G_c(h, k′, R)` (D31 §1.2), `low_of_G`: `G_c ≥ 0` at a point of `D_n` is
  `Low VV 6 (3√2/4) p R ((√2/4) y)` (the left branch with `μ = p · b₂`, the vertices of the
  candidate; the identity `Low − κ = (√2/2) G_c` holds for every candidate);
* `accept_G` (token `A`): `farLb ≥ 0` gives `G_c ≥ 0` on the direction box times the rotation box;
* `disc_trace` (token `D`): `discLb > 0` gives `tr(R k) > tr(R)`;
* `rot_krot`: an integer rotation that maps the six vertices to vertices is in `Krot`.
-/

namespace PackLean.Formal.OctFar

open PackLean.D31 (Prm Aff Quad affMul qadd qsub qsmul qzero quadLb RBox rboxQ rboxWf rotQ Cand
  decCand decPair farLbAt farLb NBox nboxWf discLb nth bvec iabs split3)
open PackLean.Formal PackLean.Formal.PolyLP
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.TetSep (bT)
open PackLean.Formal.TetReduction (Low TetCert MaxRep Krot)
open scoped Matrix

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

noncomputable section

/-! ## 1. Values of the quadratics -/

/-- The 10 monomials in the order of `D31.affMul`. -/
def qmono (s : Fin 3 → ℝ) : List ℝ :=
  [1, s 0, s 1, s 2, s 0 ^ 2, s 1 ^ 2, s 2 ^ 2, s 0 * s 1, s 0 * s 2, s 1 * s 2]

/-- Value of an integer quadratic of `D31`. -/
def qEval (q : Quad) (s : Fin 3 → ℝ) : ℝ :=
  (List.zipWith (fun (c : ℤ) (m : ℝ) => (c : ℝ) * m) q (qmono s)).sum

/-- Value of an affine form `c + w₁s₀ + w₂s₁ + w₃s₂`. -/
def affEval (a : Aff) (s : Fin 3 → ℝ) : ℝ :=
  a.c + a.w1 * s 0 + a.w2 * s 1 + a.w3 * s 2

variable (s : Fin 3 → ℝ)

theorem qEval_affMul (a b : Aff) : qEval (affMul a b) s = affEval a s * affEval b s := by
  simp only [qEval, affMul, qmono, affEval, List.zipWith_cons_cons, List.zipWith_nil_left,
    List.sum_cons, List.sum_nil]
  push_cast
  ring

theorem affMul_length (a b : Aff) : (affMul a b).length = 10 := rfl

theorem qEval_qadd {a b : Quad} (h : a.length = b.length) :
    qEval (qadd a b) s = qEval a s + qEval b s := by
  have := QuadSem.zw_add (· + ·) 1 1 (fun x y => by push_cast; ring) a b (qmono s) h
  simpa [qEval, qadd] using this

theorem qEval_qsub {a b : Quad} (h : a.length = b.length) :
    qEval (qsub a b) s = qEval a s - qEval b s := by
  have := QuadSem.zw_add (· - ·) 1 (-1) (fun x y => by push_cast; ring) a b (qmono s) h
  simp only [qEval, qsub]
  rw [this]
  ring

theorem qEval_qsmul (c : ℤ) (a : Quad) : qEval (qsmul c a) s = c * qEval a s :=
  QuadSem.zw_smul c a (qmono s)

theorem qadd_length (a b : Quad) : (qadd a b).length = min a.length b.length := by
  simp [qadd]

theorem qsub_length (a b : Quad) : (qsub a b).length = min a.length b.length := by
  simp [qsub]

theorem qsmul_length (c : ℤ) (a : Quad) : (qsmul c a).length = a.length := by
  simp [qsmul]

theorem qzero_length : qzero.length = 10 := rfl

theorem qEval_qzero : qEval qzero s = 0 := by
  simp [qEval, qzero, qmono, List.replicate]

/-- **`quadLb`** is a lower bound on `[-1, 1]³` (when it is not the failure value). -/
theorem quadLb_le {q : Quad} (h : 0 ≤ quadLb q) (hs : ∀ i, |s i| ≤ 1) :
    (quadLb q : ℝ) ≤ qEval q s := by
  match q, h with
  | [c, a1, a2, a3, s1, s2, s3, x12, x13, x23], _ =>
    simp only [quadLb, qEval, qmono, List.zipWith_cons_cons, List.zipWith_nil_left, List.sum_cons,
      List.sum_nil, iabs]
    have b0 := abs_le.1 (hs 0); have b1 := abs_le.1 (hs 1); have b2 := abs_le.1 (hs 2)
    have q0 : s 0 ^ 2 ≤ 1 := by nlinarith
    have q1 : s 1 ^ 2 ≤ 1 := by nlinarith
    have q2 : s 2 ^ 2 ≤ 1 := by nlinarith
    have m01 : |s 0 * s 1| ≤ 1 := by
      rw [abs_mul]; exact mul_le_one₀ (hs 0) (abs_nonneg _) (hs 1)
    have m02 : |s 0 * s 2| ≤ 1 := by
      rw [abs_mul]; exact mul_le_one₀ (hs 0) (abs_nonneg _) (hs 2)
    have m12 : |s 1 * s 2| ≤ 1 := by
      rw [abs_mul]; exact mul_le_one₀ (hs 1) (abs_nonneg _) (hs 2)
    -- each term is at least its share of the bound
    have lin : ∀ (a : ℤ) (t : ℝ), |t| ≤ 1 → -((a.natAbs : ℤ) : ℝ) ≤ (a : ℝ) * t := by
      intro a t ht
      have : |(a : ℝ) * t| ≤ |(a : ℝ)| := by
        rw [abs_mul]; exact mul_le_of_le_one_right (abs_nonneg _) ht
      have e : ((a.natAbs : ℤ) : ℝ) = |(a : ℝ)| := by
        rw [Int.natCast_natAbs, Int.cast_abs]
      rw [e]; linarith [neg_abs_le ((a : ℝ) * t)]
    have sq : ∀ (a : ℤ) (t : ℝ), 0 ≤ t → t ≤ 1 → ((min 0 a : ℤ) : ℝ) ≤ (a : ℝ) * t := by
      intro a t h0 h1
      rcases le_total 0 a with ha | ha
      · rw [min_eq_left ha]; push_cast; exact mul_nonneg (by exact_mod_cast ha) h0
      · rw [min_eq_right ha]
        have : (a : ℝ) ≤ 0 := by exact_mod_cast ha
        nlinarith
    have t1 := lin a1 (s 0) (hs 0); have t2 := lin a2 (s 1) (hs 1); have t3 := lin a3 (s 2) (hs 2)
    have t4 := sq s1 _ (sq_nonneg _) q0; have t5 := sq s2 _ (sq_nonneg _) q1
    have t6 := sq s3 _ (sq_nonneg _) q2
    have t7 := lin x12 _ m01; have t8 := lin x13 _ m02; have t9 := lin x23 _ m12
    push_cast at t1 t2 t3 t4 t5 t6 t7 t8 t9 ⊢
    linarith

/-! ## 2. The rotation of a quaternion box -/

/-- **`rotQ`**: the 9 entries are `Rq(q)` and the last one is `|q|²`, at every point `s`. -/
theorem rotQ_eval (w x y z : Aff) :
    (rotQ [w, x, y, z]).1.map (qEval · s)
        = QuadSem.rqList (affEval w s) (affEval x s) (affEval y s) (affEval z s) ∧
      qEval (rotQ [w, x, y, z]).2 s
        = affEval w s ^ 2 + affEval x s ^ 2 + affEval y s ^ 2 + affEval z s ^ 2 := by
  have L := affMul_length
  constructor
  · simp only [rotQ, List.map_cons, List.map_nil, QuadSem.rqList, List.cons.injEq, and_true]
    simp only [qEval_qsmul, qEval_qsub, qEval_qadd, qadd_length, qsub_length, L, qEval_affMul,
      min_self]
    push_cast
    exact ⟨by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring⟩
  · simp only [rotQ, qEval_qadd, qadd_length, L, qEval_affMul, min_self]
    ring

theorem rotQ_length (w x y z : Aff) :
    (rotQ [w, x, y, z]).1.length = 9 ∧ (∀ e ∈ (rotQ [w, x, y, z]).1, e.length = 10) ∧
      (rotQ [w, x, y, z]).2.length = 10 := by
  refine ⟨rfl, ?_, ?_⟩
  · intro e he
    simp only [rotQ, List.mem_cons, List.not_mem_nil, or_false] at he
    rcases he with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
      simp [qadd_length, qsub_length, qsmul_length, affMul_length]
  · simp [rotQ, qadd_length, affMul_length]

/-- The R box of `D31` as an R box of `D28` (the same fields). -/
def toD28 (b : RBox) : PackLean.D28.RBox := ⟨b.ch, b.l0, b.l1, b.l2, b.h0, b.h1, b.h2⟩

theorem rboxWf_eq (b : RBox) : rboxWf b = PackLean.D28.rboxWf (toD28 b) := rfl

/-- The point `(ch, y)` lies in the closed box `b` (`CoverTreeG.InBox` of the same box). -/
def InBox (b : RBox) (ch : ℕ) (y : Fin 3 → ℝ) : Prop := CoverTreeG.InBox (toD28 b) ch y

theorem split3_ch (b : RBox) : (split3 b).1.ch = b.ch ∧ (split3 b).2.ch = b.ch := by
  simp only [split3]; split_ifs <;> exact ⟨rfl, rfl⟩

theorem split3_cover (b : RBox) (ch : ℕ) (y : Fin 3 → ℝ) (h : InBox b ch y) :
    InBox (split3 b).1 ch y ∨ InBox (split3 b).2 ch y := by
  obtain ⟨hc, hy⟩ := h
  have h0 := hy 0; have h1 := hy 1; have h2 := hy 2
  simp only [QuadSem.bLo, QuadSem.bHi, toD28, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.cons_val_two, Matrix.head_cons, Matrix.tail_cons] at h0 h1 h2
  have key : ∀ (b' : RBox), b'.ch = ch → (b'.l0 : ℝ) ≤ y 0 → y 0 ≤ b'.h0 → (b'.l1 : ℝ) ≤ y 1 →
      y 1 ≤ b'.h1 → (b'.l2 : ℝ) ≤ y 2 → y 2 ≤ b'.h2 → InBox b' ch y := by
    intro b' hc' a1 a2 a3 a4 a5 a6
    refine ⟨hc', fun i => ?_⟩
    fin_cases i <;> simp [QuadSem.bLo, QuadSem.bHi, toD28] <;> constructor <;> assumption
  simp only [toD28] at hc
  simp only [split3]
  split_ifs
  · rcases le_total (y 0) (((b.l0 + b.h0) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact key _ hc h0.1 hz h1.1 h1.2 h2.1 h2.2
    · right; exact key _ hc hz h0.2 h1.1 h1.2 h2.1 h2.2
  · rcases le_total (y 1) (((b.l1 + b.h1) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact key _ hc h0.1 h0.2 h1.1 hz h2.1 h2.2
    · right; exact key _ hc h0.1 h0.2 hz h1.2 h2.1 h2.2
  · rcases le_total (y 2) (((b.l2 + b.h2) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact key _ hc h0.1 h0.2 h1.1 h1.2 h2.1 hz
    · right; exact key _ hc h0.1 h0.2 h1.1 h1.2 hz h2.2

theorem rboxQ_four (den : ℤ) (b : RBox) : ∃ w x y z, rboxQ den b = [w, x, y, z] := by
  unfold rboxQ; split <;> exact ⟨_, _, _, _, rfl⟩

/-- **`rboxQ`**: the four quaternion components at the box coordinate `s`. -/
theorem rboxQ_eval (den : ℤ) (b : RBox) :
    (rboxQ den b).map (affEval · s)
      = QuadSem.chq b.ch den (QuadSem.bu (toD28 b) s 0) (QuadSem.bu (toD28 b) s 1)
          (QuadSem.bu (toD28 b) s 2) := by
  obtain ⟨ch, l0, l1, l2, h0, h1, h2⟩ := b
  rcases ch with _ | _ | _ | n <;>
    simp [rboxQ, QuadSem.chq, affEval, QuadSem.bu, QuadSem.bLo, QuadSem.bHi, toD28]

/-- The rotation entries and `N` of a box, at the point `s`, through the quaternion `chq`. -/
theorem rotQ_rboxQ (den : ℤ) (b : RBox) :
    let q := QuadSem.chq b.ch den (QuadSem.bu (toD28 b) s 0) (QuadSem.bu (toD28 b) s 1)
      (QuadSem.bu (toD28 b) s 2)
    (rotQ (rboxQ den b)).1.map (qEval · s)
        = QuadSem.rqList (q.getD 0 0) (q.getD 1 0) (q.getD 2 0) (q.getD 3 0) ∧
      qEval (rotQ (rboxQ den b)).2 s
        = q.getD 0 0 ^ 2 + q.getD 1 0 ^ 2 + q.getD 2 0 ^ 2 + q.getD 3 0 ^ 2 := by
  intro q
  obtain ⟨w, x, y, z, hq⟩ := rboxQ_four den b
  have he := rboxQ_eval s den b
  rw [hq] at he ⊢
  simp only [List.map_cons, List.map_nil] at he
  have hq' : q = [affEval w s, affEval x s, affEval y s, affEval z s] := he.symm
  rw [hq']
  exact rotQ_eval s w x y z

/-- Every entry of the rotation quadratics has 10 coefficients (also the default `qzero`). -/
theorem mget_length (den : ℤ) (b : RBox) (t : ℕ) :
    (nth (rotQ (rboxQ den b)).1 t qzero).length = 10 := by
  obtain ⟨w, x, y, z, hq⟩ := rboxQ_four den b
  rw [hq]
  obtain ⟨_, hl, _⟩ := rotQ_length w x y z
  unfold nth
  rcases lt_or_ge t (rotQ [w, x, y, z]).1.length with ht | ht
  · rw [List.getD_eq_getElem _ _ ht]; exact hl _ (List.getElem_mem ht)
  · rw [List.getD_eq_default _ _ ht]; rfl

theorem q_length (den : ℤ) (b : RBox) : (rotQ (rboxQ den b)).2.length = 10 := by
  obtain ⟨w, x, y, z, hq⟩ := rboxQ_four den b
  rw [hq]; exact (rotQ_length w x y z).2.2

/-- **The rotation of a chart point, entry by entry** in the box coordinate `s`. -/
theorem box_entries {den : ℤ} {R : M3} {ch : ℕ} {u : Fin 3 → ℝ} (hc : Charts.ChartPt R den ch u)
    {B : RBox} (hB : B.ch = ch) {s : Fin 3 → ℝ} (hsu : ∀ i, QuadSem.bu (toD28 B) s i = u i) :
    ∃ Nv : ℝ, 0 < Nv ∧ qEval (rotQ (rboxQ den B)).2 s = Nv ∧
      ∀ i j : Fin 3, qEval (nth (rotQ (rboxQ den B)).1 (3 * i.val + j.val) qzero) s = Nv * R i j := by
  obtain ⟨_, hN, hlist⟩ := hc
  obtain ⟨h1, h2⟩ := rotQ_rboxQ s den B
  simp only [hB, hsu] at h1 h2
  refine ⟨_, hN, h2, fun i j => ?_⟩
  obtain ⟨wq, xq, yq, zq, hq⟩ := rboxQ_four den B
  have hl := (rotQ_length wq xq yq zq).1
  rw [← hq] at hl
  have ht : 3 * i.val + j.val < (rotQ (rboxQ den B)).1.length := by rw [hl]; omega
  have key : qEval (nth (rotQ (rboxQ den B)).1 (3 * i.val + j.val) qzero) s
      = ((rotQ (rboxQ den B)).1.map (qEval · s)).getD (3 * i.val + j.val) 0 := by
    unfold nth
    rw [List.getD_eq_getElem _ _ ht, List.getD_eq_getElem _ _ (by simpa using ht)]
    simp
  rw [key, h1, hlist]
  fin_cases i <;> fin_cases j <;> rfl

/-! ## 3. Integer rotations (as `TetUpper.imat_SO`) -/

open PackLean.D28 (rotIntOk igt)

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

/-! ## 4. The octahedron and the candidate form -/

/-- The sign of the vertex `l` (`D31.decPair`: even `+`, odd `−`). -/
def vsg (l : ℕ) : ℝ := if l % 2 = 0 then 1 else -1

/-- The six vertices `±(√2/2) e_k` of the unit octahedron (Spec's `octV`), `l = 2k + (0 | 1)`. -/
def VV (l : ℕ) : E3 := WithLp.toLp 2 (fun i => if i.val = l / 2 then √2 / 2 * vsg l else 0)

/-- The vertex of the component `m` with the sign `sg`. -/
def vidx (m : ℕ) (sg : ℤ) : ℕ := 2 * m + (if sg = 1 then 0 else 1)

theorem vidx_lt {m : ℕ} (hm : m < 3) (sg : ℤ) : vidx m sg < 6 := by
  unfold vidx; split <;> omega

/-- The entries of `R` with natural indices (`0` outside). -/
def rN (R : M3) (l m : ℕ) : ℝ := if h : l < 3 ∧ m < 3 then R ⟨l, h.1⟩ ⟨m, h.2⟩ else 0

/-- `p · R v` for the vertex `sg · e_m` of the octahedron. -/
theorem dot_mv_VV (p : E3) (R : M3) {m : ℕ} (hm : m < 3) {sg : ℤ} (hsg : sg = 1 ∨ sg = -1) :
    dot p (mv R (VV (vidx m sg)))
      = √2 / 2 * sg * (p 0 * rN R 0 m + p 1 * rN R 1 m + p 2 * rN R 2 m) := by
  rcases hsg with rfl | rfl <;> interval_cases m <;>
    simp [dot, VV, vidx, vsg, rN, Fin.sum_univ_three] <;> ring

/-- **The candidate form** `G_c(h, k′, R)` of `D31` (§1.2), with the candidate `c` of `D31.Cand`:
`h/2 + (s_n (Rᵀn)_i − 1) + (1 − h/2)(s₀ (Rᵀb₀)_j − 1) + (k′/2)(s₁ (Rᵀb₁)_{j₁} − 1)
 + ((k′+h)/2)(s₃ (Rᵀb₃)_{j₃} − 1)`, `n = (1 − h, 1 − h − k′, 1)`. -/
def Gc (h k : ℝ) (R : M3) (c : Cand) : ℝ :=
  h / 2 + (c.sn * ((1 - h) * rN R 0 c.i + (1 - h - k) * rN R 1 c.i + rN R 2 c.i) - 1)
  + (1 - h / 2) * (c.s0 * (-rN R 0 c.j - rN R 1 c.j - rN R 2 c.j) - 1)
  + k / 2 * (c.s1 * (-rN R 0 c.j1 + rN R 1 c.j1 + rN R 2 c.j1) - 1)
  + (k + h) / 2 * (c.s3 * (rN R 0 c.j3 + rN R 1 c.j3 - rN R 2 c.j3) - 1)

/-- A candidate with components `< 3` and signs `±1`. -/
structure CandOk (c : Cand) : Prop where
  i : c.i < 3
  j : c.j < 3
  j1 : c.j1 < 3
  j3 : c.j3 < 3
  sn : c.sn = 1 ∨ c.sn = -1
  s0 : c.s0 = 1 ∨ c.s0 = -1
  s1 : c.s1 = 1 ∨ c.s1 = -1
  s3 : c.s3 = 1 ∨ c.s3 = -1

theorem decPair_ok {d : ℕ} (hd : d < 6) :
    (decPair d).1 < 3 ∧ ((decPair d).2 = 1 ∨ (decPair d).2 = -1) := by
  simp only [decPair]
  refine ⟨by omega, ?_⟩
  split <;> simp

theorem decCand_ok (code : ℕ) : CandOk (decCand code) := by
  have h1 := decPair_ok (d := code / 216 % 6) (by omega)
  have h2 := decPair_ok (d := code / 36 % 6) (by omega)
  have h3 := decPair_ok (d := code / 6 % 6) (by omega)
  have h4 := decPair_ok (d := code % 6) (by omega)
  exact ⟨h1.1, h2.1, h3.1, h4.1, h1.2, h2.2, h3.2, h4.2⟩

theorem dot_bT (x y : ℝ) (f : Fin 4) :
    dot !₂[x, y, 1] (bT f) = match f with
      | 0 => -x - y - 1 | 1 => -x + y + 1 | 2 => x - y + 1 | 3 => x + y - 1 := by
  fin_cases f <;> simp [dot, bT, Fin.sum_univ_three] <;> ring

/-- At `p = (x, y, 1)` with `|y| ≤ x ≤ 1` the weight `μ = p · b₂` is the largest. -/
theorem mu_max {x y : ℝ} (h1 : -x ≤ y) (h2 : y ≤ x) (h3 : x ≤ 1) (f : Fin 4) :
    dot !₂[x, y, 1] (bT f) ≤ dot !₂[x, y, 1] (bT 2) := by
  rw [dot_bT, dot_bT]
  fin_cases f <;> simp <;> linarith

/-- The scale of the container in `TetReduction`: `c* = (√2/4) s*`, `s* = 3`. -/
def cbO : ℝ := √2 / 4 * 3

/-- **`G_c ≥ 0` is the left branch of `Low`.** At `p = (1 − h, 1 − h − k′, 1) ∈ D_n` the dual bound
with `μ = p · b₂` and the vertices of the candidate is `(√2/4) y + (√2/2) G_c`. -/
theorem low_of_G {h k : ℝ} (hh : 0 ≤ h) (hk : 0 ≤ k) (h2 : 2 * h + k ≤ 2) {R : M3} {c : Cand}
    (hc : CandOk c) (hG : 0 ≤ Gc h k R c) :
    Low VV 6 cbO !₂[1 - h, 1 - h - k, 1] R (√2 / 4 * (1 - h - k)) := by
  left
  refine ⟨dot !₂[1 - h, 1 - h - k, 1] (bT 2), vidx c.i c.sn, vidx_lt hc.i _,
    ![vidx c.j c.s0, vidx c.j1 c.s1, 0, vidx c.j3 c.s3], fun f => ?_,
    fun f => mu_max (by linarith) (by linarith) (by linarith) f, ?_⟩
  · fin_cases f
    · exact vidx_lt hc.j _
    · exact vidx_lt hc.j1 _
    · simp
    · exact vidx_lt hc.j3 _
  rw [← sub_nonneg]
  have e0 := dot_mv_VV !₂[1 - h, 1 - h - k, 1] R hc.i hc.sn
  have e1 := dot_mv_VV (bT 0) R hc.j hc.s0
  have e2 := dot_mv_VV (bT 1) R hc.j1 hc.s1
  have e3 := dot_mv_VV (bT 3) R hc.j3 hc.s3
  simp only [Fin.sum_univ_four, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two,
    Matrix.cons_val_three, Matrix.head_cons, Matrix.tail_cons, sub_self, zero_mul, add_zero, e0, e1,
    e2, e3]
  convert mul_nonneg (by positivity : (0 : ℝ) ≤ √2 / 2) hG using 1
  simp only [dot_bT]
  simp [Gc, cbO, bT]
  ring

/-! ## 5. Token `A`: `farLb ≥ 0` gives `G_c ≥ 0` -/

/-- The quadratic whose lower bound `farLbAt` takes (the body of `D31.farLbAt`). -/
def totQ (nd : ℤ) (M : List Quad) (Q : Quad) (c : Cand) (hv kv : ℤ) : Quad :=
  let Mget (l i : Nat) : Quad := nth M (3 * l + i) qzero
  let n2 : List Int := [2 * nd - 2 * hv, 2 * nd - 2 * hv - 2 * kv, 2 * nd]
  let tN := (List.range 3).foldl (fun acc l => qadd acc (qsmul (c.sn * nth n2 l 0) (Mget l c.i))) qzero
  let tB (f jj : Nat) (s W : Int) : Quad :=
    (List.range 3).foldl (fun acc l => qadd acc (qsmul (W * s * nth (nth bvec f []) l 0) (Mget l jj))) qzero
  qadd (qadd tN (tB 0 c.j c.s0 (2 * nd - hv)))
    (qadd (qadd (tB 1 c.j1 c.s1 kv) (tB 3 c.j3 c.s3 (kv + hv))) (qsmul (hv - 4 * nd - 2 * kv) Q))

theorem farLbAt_eq (nd : ℤ) (M : List Quad) (Q : Quad) (c : Cand) (hv kv : ℤ) :
    farLbAt nd M Q c hv kv = quadLb (totQ nd M Q c hv kv) := rfl

/-- The value of `totQ` with the entries `E l m` and `q` (all of the same form). -/
def FAE (nd hv kv : ℝ) (c : Cand) (E : ℕ → ℕ → ℝ) (q : ℝ) : ℝ :=
  c.sn * ((2 * nd - 2 * hv) * E 0 c.i + (2 * nd - 2 * hv - 2 * kv) * E 1 c.i + 2 * nd * E 2 c.i)
  + (2 * nd - hv) * c.s0 * (-E 0 c.j - E 1 c.j - E 2 c.j)
  + kv * c.s1 * (-E 0 c.j1 + E 1 c.j1 + E 2 c.j1)
  + (kv + hv) * c.s3 * (E 0 c.j3 + E 1 c.j3 - E 2 c.j3)
  + (hv - 4 * nd - 2 * kv) * q

theorem range3 : List.range 3 = [0, 1, 2] := rfl

theorem qEval_qadd_qzero {a : Quad} (ha : a.length = 10) : qEval (qadd qzero a) s = qEval a s := by
  rw [qEval_qadd s (by rw [qzero_length, ha]), qEval_qzero, zero_add]

theorem qEval_totQ (nd : ℤ) {M : List Quad} {Q : Quad} (hM : ∀ t, (nth M t qzero).length = 10)
    (hQ : Q.length = 10) (c : Cand) (hv kv : ℤ) :
    qEval (totQ nd M Q c hv kv) s
      = FAE nd hv kv c (fun l m => qEval (nth M (3 * l + m) qzero) s) (qEval Q s) := by
  simp only [totQ, range3, List.foldl_cons, List.foldl_nil]
  simp only [qEval_qadd_qzero, qEval_qadd, qEval_qsmul, qadd_length, qsmul_length, qzero_length, hM,
    hQ, min_self, qEval_qzero]
  simp only [FAE, bvec, nth, List.getD_cons_zero, List.getD_cons_succ]
  push_cast
  ring

/-- `FAE` with the entries of `R` is twice `nd` times `G_c` at `(H, K) / nd`. -/
theorem FAE_Gc {nd : ℝ} (hnd : 0 < nd) (H K : ℝ) (R : M3) (c : Cand) :
    FAE nd H K c (rN R) 1 = 2 * nd * Gc (H / nd) (K / nd) R c := by
  simp only [FAE, Gc]
  field_simp
  ring

/-- An affine function of two variables that is `≥ 0` at the four corners of a box is `≥ 0` on it. -/
theorem rect_nonneg {f : ℝ → ℝ → ℝ} {A B C : ℝ} (hf : ∀ H K, f H K = A + B * H + C * K)
    {l0 h0 l1 h1 H K : ℝ} (hl0 : l0 < h0) (hl1 : l1 < h1) (c1 : 0 ≤ f l0 l1) (c2 : 0 ≤ f l0 h1)
    (c3 : 0 ≤ f h0 l1) (c4 : 0 ≤ f h0 h1) (hH1 : l0 ≤ H) (hH2 : H ≤ h0) (hK1 : l1 ≤ K)
    (hK2 : K ≤ h1) : 0 ≤ f H K := by
  rw [hf] at c1 c2 c3 c4 ⊢
  have key : (h0 - l0) * (h1 - l1) * (A + B * H + C * K)
      = (h0 - H) * (h1 - K) * (A + B * l0 + C * l1) + (h0 - H) * (K - l1) * (A + B * l0 + C * h1)
        + (H - l0) * (h1 - K) * (A + B * h0 + C * l1)
        + (H - l0) * (K - l1) * (A + B * h0 + C * h1) := by
    ring
  have hp : 0 ≤ (h0 - l0) * (h1 - l1) * (A + B * H + C * K) := by
    rw [key]
    have a1 : 0 ≤ h0 - H := by linarith
    have a2 : 0 ≤ h1 - K := by linarith
    have a3 : 0 ≤ K - l1 := by linarith
    have a4 : 0 ≤ H - l0 := by linarith
    have := mul_nonneg (mul_nonneg a1 a2) c1
    have := mul_nonneg (mul_nonneg a1 a3) c2
    have := mul_nonneg (mul_nonneg a4 a2) c3
    have := mul_nonneg (mul_nonneg a4 a3) c4
    linarith
  have hpos : 0 < (h0 - l0) * (h1 - l1) := mul_pos (by linarith) (by linarith)
  exact (mul_nonneg_iff_of_pos_left hpos).1 hp

/-- The entries of a chart point with natural indices. -/
theorem entries_rN {E : ℕ → ℕ → ℝ} {R : M3} {Nv : ℝ}
    (h : ∀ i j : Fin 3, E i.val j.val = Nv * R i j) {l m : ℕ} (hl : l < 3) (hm : m < 3) :
    E l m = Nv * rN R l m := by
  have := h ⟨l, hl⟩ ⟨m, hm⟩
  simp only [rN, dif_pos (And.intro hl hm)]
  exact this

theorem FAE_scale {nd hv kv : ℝ} {c : Cand} (hc : CandOk c) {E : ℕ → ℕ → ℝ} {R : M3} {Nv : ℝ}
    (h : ∀ i j : Fin 3, E i.val j.val = Nv * R i j) :
    FAE nd hv kv c E Nv = Nv * FAE nd hv kv c (rN R) 1 := by
  have r := fun l m (hl : l < 3) (hm : m < 3) => entries_rN h hl hm
  simp only [FAE]
  rw [r 0 c.i (by norm_num) hc.i, r 1 c.i (by norm_num) hc.i, r 2 c.i (by norm_num) hc.i,
    r 0 c.j (by norm_num) hc.j, r 1 c.j (by norm_num) hc.j, r 2 c.j (by norm_num) hc.j,
    r 0 c.j1 (by norm_num) hc.j1, r 1 c.j1 (by norm_num) hc.j1, r 2 c.j1 (by norm_num) hc.j1,
    r 0 c.j3 (by norm_num) hc.j3, r 1 c.j3 (by norm_num) hc.j3, r 2 c.j3 (by norm_num) hc.j3]
  ring

/-- The point `u` of a well-formed box, its box coordinate and its rotation entries. -/
theorem box_point {den : ℤ} {rb : RBox} (hwf : rboxWf rb = true) {R : M3} {u : Fin 3 → ℝ}
    (hcu : Charts.ChartPt R den rb.ch u) (hin : InBox rb rb.ch u) :
    ∃ s : Fin 3 → ℝ, (∀ i, |s i| ≤ 1) ∧ ∃ Nv : ℝ, 0 < Nv ∧ qEval (rotQ (rboxQ den rb)).2 s = Nv ∧
      ∀ i j : Fin 3,
        qEval (nth (rotQ (rboxQ den rb)).1 (3 * i.val + j.val) qzero) s = Nv * R i j := by
  obtain ⟨s, hs, hsu⟩ := QuadSem.box_param (b := toD28 rb) (by rw [← rboxWf_eq]; exact hwf) u hin.2
  obtain ⟨Nv, hNv, hN, hent⟩ := box_entries hcu rfl hsu
  exact ⟨s, hs, Nv, hNv, hN, hent⟩

/-- **Token `A`.** If `farLb ≥ 0` for the candidate `decCand code`, then `G_c ≥ 0` at every point
`(H, K)` (in `nd` units) of the direction box and every rotation of the R box. -/
theorem accept_G {P : Prm} (hnd : 0 < P.nd) {nb : NBox} (hnw : nboxWf nb = true) {rb : RBox}
    (hwf : rboxWf rb = true) {code : ℕ} (hA : farLb P nb rb (decCand code) ≥ 0) {R : M3}
    {u : Fin 3 → ℝ} (hcu : Charts.ChartPt R P.den rb.ch u) (hin : InBox rb rb.ch u) {H K : ℝ}
    (hH1 : (nb.l0 : ℝ) ≤ H) (hH2 : H ≤ nb.h0) (hK1 : (nb.l1 : ℝ) ≤ K) (hK2 : K ≤ nb.h1) :
    0 ≤ Gc (H / P.nd) (K / P.nd) R (decCand code) := by
  have hc := decCand_ok code
  obtain ⟨s, hs, Nv, hNv, hN, hent⟩ := box_point hwf hcu hin
  have hndr : (0 : ℝ) < P.nd := by exact_mod_cast hnd
  set c := decCand code
  have corner : ∀ a b : ℤ,
      0 ≤ farLbAt P.nd (rotQ (rboxQ P.den rb)).1 (rotQ (rboxQ P.den rb)).2 c a b →
      0 ≤ FAE P.nd a b c (rN R) 1 := by
    intro a b hab
    rw [farLbAt_eq] at hab
    have h1 := quadLb_le s hab hs
    rw [qEval_totQ s _ (mget_length P.den rb) (q_length P.den rb), hN, FAE_scale hc hent] at h1
    have : (0 : ℝ) ≤ Nv * FAE P.nd a b c (rN R) 1 := le_trans (by exact_mod_cast hab) h1
    exact (mul_nonneg_iff_of_pos_left hNv).1 this
  simp only [farLb, ge_iff_le, le_min_iff] at hA
  obtain ⟨⟨a1, a2⟩, a3, a4⟩ := hA
  have hb : (nb.l0 : ℝ) < nb.h0 ∧ (nb.l1 : ℝ) < nb.h1 := by
    simp only [nboxWf, Bool.and_eq_true, decide_eq_true_eq] at hnw
    exact ⟨by exact_mod_cast hnw.1, by exact_mod_cast hnw.2⟩
  have hF := rect_nonneg (f := fun H K => FAE P.nd H K c (rN R) 1)
    (A := FAE P.nd 0 0 c (rN R) 1)
    (B := FAE P.nd 1 0 c (rN R) 1 - FAE P.nd 0 0 c (rN R) 1)
    (C := FAE P.nd 0 1 c (rN R) 1 - FAE P.nd 0 0 c (rN R) 1)
    (fun H K => by simp only [FAE]; ring) hb.1 hb.2
    (corner _ _ a1) (corner _ _ a2) (corner _ _ a3) (corner _ _ a4) hH1 hH2 hK1 hK2
  rw [FAE_Gc hndr] at hF
  exact (mul_nonneg_iff_of_pos_left (by positivity)).1 hF

/-! ## 6. Token `D`: `discLb > 0` gives `tr(R k) > tr(R)` -/

/-- The quadratic whose lower bound `discLb` takes. -/
def discQ (M : List Quad) (K : List (List ℤ)) : Quad :=
  (List.range 9).foldl (fun acc ij =>
    let i := ij / 3; let j := ij % 3
    let kji := nth (nth K j []) i 0
    qadd acc (qsmul (kji - (if i == j then 1 else 0)) (nth M ij qzero))) qzero

theorem discLb_eq (P : Prm) (rb : RBox) (K : List (List ℤ)) :
    discLb P rb K = quadLb (discQ (rotQ (rboxQ P.den rb)).1 K) := rfl

theorem range9 : List.range 9 = [0, 1, 2, 3, 4, 5, 6, 7, 8] := rfl

theorem disc_trace {P : Prm} {rb : RBox} (hwf : rboxWf rb = true) {K : List (List ℤ)}
    (hD : discLb P rb K > 0) {R : M3} {u : Fin 3 → ℝ} (hcu : Charts.ChartPt R P.den rb.ch u)
    (hin : InBox rb rb.ch u) : R.trace < (R * imat K).trace := by
  obtain ⟨s, hs, Nv, hNv, _, hent⟩ := box_point hwf hcu hin
  rw [discLb_eq] at hD
  have hM := mget_length P.den rb
  have hDr : (0 : ℝ) < (quadLb (discQ (rotQ (rboxQ P.den rb)).1 K) : ℝ) := by exact_mod_cast hD
  have h1 := lt_of_lt_of_le hDr (quadLb_le s (le_of_lt hD) hs)
  clear hDr
  simp only [discQ, range9, List.foldl_cons, List.foldl_nil] at h1
  simp only [qEval_qadd_qzero, qEval_qadd, qEval_qsmul, qadd_length, qsmul_length, qzero_length, hM,
    min_self, qEval_qzero] at h1
  have e00 := hent 0 0; have e01 := hent 0 1; have e02 := hent 0 2
  have e10 := hent 1 0; have e11 := hent 1 1; have e12 := hent 1 2
  have e20 := hent 2 0; have e21 := hent 2 1; have e22 := hent 2 2
  simp only [Fin.val_zero, Fin.val_one, Fin.val_two, Fin.isValue] at e00 e01 e02 e10 e11 e12 e20 e21 e22
  norm_num at e00 e01 e02 e10 e11 e12 e20 e21 e22 h1
  rw [e00, e01, e02, e10, e11, e12, e20, e21, e22] at h1
  have hpos : (0 : ℝ) < Nv * ((R * imat K).trace - R.trace) := by
    simp only [Matrix.trace, Matrix.diag, Matrix.mul_apply, Fin.sum_univ_three, imat, igt,
      PackLean.D28.nth, nth] at h1 ⊢
    norm_num at h1 ⊢
    linarith
  have := (mul_pos_iff_of_pos_left hNv).1 hpos
  linarith

/-! ## 7. The symmetries of the octahedron -/

/-- The integer sign of the vertex `l`. -/
def isg (l : ℕ) : ℤ := if l % 2 = 0 then 1 else -1

/-- The integer matrix maps every vertex `isg l · e_{l/2}` to a vertex. -/
def vmapOk (K : List (List ℤ)) : Bool :=
  (List.range 6).all fun l => (List.range 6).any fun l' =>
    (List.range 3).all fun i => isg l * igt K i (l / 2) == isg l' * (if i = l' / 2 then 1 else 0)

theorem VV_apply (l : ℕ) (i : Fin 3) :
    VV l i = √2 / 2 * isg l * (if i.val = l / 2 then 1 else 0) := by
  change (if i.val = l / 2 then √2 / 2 * vsg l else 0) = _
  unfold vsg isg
  split <;> split <;> simp

theorem mv_imat_VV (K : List (List ℤ)) {l : ℕ} (hl : l < 6) (i : Fin 3) :
    mv (imat K) (VV l) i = √2 / 2 * isg l * igt K i.val (l / 2) := by
  simp only [mv_apply, VV_apply, Fin.sum_univ_three, imat]
  rcases (show l / 2 = 0 ∨ l / 2 = 1 ∨ l / 2 = 2 by omega) with e | e | e <;>
    simp [e] <;> ring

/-- **An integer rotation that maps the vertices to vertices is in `Krot`.** -/
theorem rot_krot {K : List (List ℤ)} (h1 : rotIntOk K = true) (h2 : vmapOk K = true) :
    imat K ∈ Krot VV 6 := by
  have hSO := imat_SO h1
  rw [Matrix.mem_specialOrthogonalGroup_iff] at hSO
  refine ⟨(Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).1 hSO.1, hSO.2, fun l hl => ?_⟩
  simp only [vmapOk, List.all_eq_true, List.any_eq_true, List.mem_range, beq_iff_eq] at h2
  obtain ⟨l', hl', h⟩ := h2 l hl
  refine ⟨l', hl', ?_⟩
  ext i
  rw [mv_imat_VV K hl, VV_apply]
  have e : ((isg l * igt K i.val (l / 2) : ℤ) : ℝ)
      = ((isg l' * (if i.val = l' / 2 then 1 else 0) : ℤ) : ℝ) := by
    rw [h i.val i.isLt]
  push_cast at e
  rw [mul_assoc, e]
  split <;> simp

end

#assert_std_axioms PackLean.Formal.OctFar.accept_G PackLean.Formal.OctFar.disc_trace
  PackLean.Formal.OctFar.low_of_G PackLean.Formal.OctFar.rot_krot

end PackLean.Formal.OctFar
