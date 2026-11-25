import PackLean.Formal.OctLocalPoly

/-!
# A9 stage 7d-3 (part 2): `twoPc = 2|q|² G_c`

Design: `plan/A9f_tet_design.md` §9.  `D31.twoPc` builds, from `q = (1, u+p₁, u+p₂, u−p₁−p₂)`
(`D31.qJ`) and the local candidate `(i, j, j₁, j₃)` (`D31.lcand`), the polynomial `2|q|² G_c` in
`(h, k′, u, p₁, p₂)`.  Here (`twoPc_val`): at the point `(h, k′, u, p₁, p₂)` with `q = (1, a, b, c)`
and the rotation `R` of `q` (`OctCover.QRot`), its value is `2 (1 + a² + b² + c²) · Gc h k′ R cd`
for the candidate `cd = lcandC code` (components of `lcand`, signs from the tables `sigN`, `sig0`,
`sig1`, `sig3`), which is a `CandOk` candidate (`lcandC_ok`).
-/

namespace PackLean.Formal.OctLocalForm

open PackLean.D31 (Mono Poly padd psmul psub psum pconst pvar pmul nth bvec qJ rotP twoPc lcand sigN
  sig0 sig1 sig3 Cand)
open PackLean.Formal PackLean.Formal.PolyLP PackLean.Formal.OctFar PackLean.Formal.OctLocalPoly
open PackLean.Formal.OctCover (QRot)

noncomputable section

/-! ## 1. Values with the invariant -/

/-- `p` has monomials of length 5 and the value `v` at `x`. -/
def PV (x : Fin 5 → ℝ) (p : Poly) (v : ℝ) : Prop := WF p ∧ pv p x = v

variable {x : Fin 5 → ℝ}

theorem PV.congr {p : Poly} {a b : ℝ} (h : PV x p a) (e : a = b) : PV x p b := e ▸ h

theorem PV.add {p q : Poly} {a b : ℝ} (hp : PV x p a) (hq : PV x q b) : PV x (padd p q) (a + b) :=
  ⟨padd_WF hp.1 hq.1, by rw [pv_padd, hp.2, hq.2]⟩

theorem PV.smul (c : ℤ) {p : Poly} {a : ℝ} (hp : PV x p a) : PV x (psmul c p) (c * a) :=
  ⟨psmul_WF c hp.1, by rw [pv_psmul, hp.2]⟩

theorem PV.sub {p q : Poly} {a b : ℝ} (hp : PV x p a) (hq : PV x q b) : PV x (psub p q) (a - b) :=
  ⟨psub_WF hp.1 hq.1, by rw [pv_psub, hp.2, hq.2]⟩

theorem PV.mul {p q : Poly} {a b : ℝ} (hp : PV x p a) (hq : PV x q b) : PV x (pmul p q) (a * b) :=
  ⟨pmul_WF hp.1 hq.1, by rw [pv_pmul x hp.1 hq.1, hp.2, hq.2]⟩

theorem PV.const (c : ℤ) : PV x (pconst c) c := ⟨pconst_WF c, pv_pconst x c⟩

theorem PV.var (i : ℕ) (hi : i < 5) : PV x (pvar i) (x ⟨i, hi⟩) := ⟨pvar_WF i, pv_pvar x i hi⟩

theorem PV.nil : PV x [] 0 := ⟨fun e he => by simp at he, rfl⟩

theorem PV.psum3 {p0 p1 p2 : Poly} {a b c : ℝ} (h0 : PV x p0 a) (h1 : PV x p1 b) (h2 : PV x p2 c) :
    PV x (psum [p0, p1, p2]) (a + b + c) :=
  (((PV.nil.add h0).add h1).add h2).congr (by ring)

theorem PV.psum5 {p0 p1 p2 p3 p4 : Poly} {a b c d e : ℝ} (h0 : PV x p0 a) (h1 : PV x p1 b)
    (h2 : PV x p2 c) (h3 : PV x p3 d) (h4 : PV x p4 e) :
    PV x (psum [p0, p1, p2, p3, p4]) (a + b + c + d + e) :=
  (((((PV.nil.add h0).add h1).add h2).add h3).add h4).congr (by ring)

/-! ## 2. The rotation of `q` -/

theorem rotP_PV {w y1 y2 y3 : Poly} {W Y1 Y2 Y3 : ℝ} (hw : PV x w W) (h1 : PV x y1 Y1)
    (h2 : PV x y2 Y2) (h3 : PV x y3 Y3) :
    (∀ t < 9, PV x (nth (rotP [w, y1, y2, y3]).1 t []) (nth (QuadSem.rqList W Y1 Y2 Y3) t 0)) ∧
    PV x (rotP [w, y1, y2, y3]).2 (W ^ 2 + Y1 ^ 2 + Y2 ^ 2 + Y3 ^ 2) := by
  refine ⟨fun t ht => ?_, ?_⟩
  · interval_cases t <;> simp only [rotP, nth, List.getD_cons_zero, List.getD_cons_succ,
      QuadSem.rqList]
    · exact (((hw.mul hw).add (h1.mul h1)).sub (h2.mul h2)).sub (h3.mul h3) |>.congr (by ring)
    · exact ((h1.mul h2).sub (hw.mul h3)).smul 2 |>.congr (by push_cast; ring)
    · exact ((h1.mul h3).add (hw.mul h2)).smul 2 |>.congr (by push_cast; ring)
    · exact ((h1.mul h2).add (hw.mul h3)).smul 2 |>.congr (by push_cast; ring)
    · exact (((hw.mul hw).add (h2.mul h2)).sub (h1.mul h1)).sub (h3.mul h3) |>.congr (by ring)
    · exact ((h2.mul h3).sub (hw.mul h1)).smul 2 |>.congr (by push_cast; ring)
    · exact ((h1.mul h3).sub (hw.mul h2)).smul 2 |>.congr (by push_cast; ring)
    · exact ((h2.mul h3).add (hw.mul h1)).smul 2 |>.congr (by push_cast; ring)
    · exact (((hw.mul hw).add (h3.mul h3)).sub (h1.mul h1)).sub (h2.mul h2) |>.congr (by ring)
  · simp only [rotP]
    exact (((hw.mul hw).add (h1.mul h1)).add ((h2.mul h2).add (h3.mul h3))).congr (by ring)

theorem entry_val {R : M3} {a b c : ℝ} (hR : QRot R a b c) {l i : ℕ} (hl : l < 3) (hi : i < 3) :
    nth (QuadSem.rqList 1 a b c) (3 * l + i) 0 = (1 + a ^ 2 + b ^ 2 + c ^ 2) * rN R l i := by
  unfold QRot at hR
  rw [hR]
  interval_cases l <;> interval_cases i <;> simp [nth, rN, Functor.map]

/-- The point `(h, k′, u, p₁, p₂)` of the quaternion `(1, a, b, c)`:
`u = (a + b + c)/3`, `p₁ = (2a − b − c)/3`, `p₂ = (2b − a − c)/3`. -/
def xpt (h k a b c : ℝ) : Fin 5 → ℝ :=
  ![h, k, (a + b + c) / 3, (2 * a - b - c) / 3, (2 * b - a - c) / 3]

theorem qJ_eq : qJ = [pconst 1, padd (pvar 2) (pvar 3), padd (pvar 2) (pvar 4),
    psub (pvar 2) (padd (pvar 3) (pvar 4))] := rfl

theorem M_PV (h k a b c : ℝ) {R : M3} (hR : QRot R a b c) {l i : ℕ} (hl : l < 3) (hi : i < 3) :
    PV (xpt h k a b c) (nth (rotP qJ).1 (3 * l + i) [])
      ((1 + a ^ 2 + b ^ 2 + c ^ 2) * rN R l i) := by
  have v2 : PV (xpt h k a b c) (pvar 2) ((a + b + c) / 3) := PV.var 2 (by norm_num)
  have v3 : PV (xpt h k a b c) (pvar 3) ((2 * a - b - c) / 3) := PV.var 3 (by norm_num)
  have v4 : PV (xpt h k a b c) (pvar 4) ((2 * b - a - c) / 3) := PV.var 4 (by norm_num)
  have q1 : PV (xpt h k a b c) (padd (pvar 2) (pvar 3)) a := (v2.add v3).congr (by ring)
  have q2 : PV (xpt h k a b c) (padd (pvar 2) (pvar 4)) b := (v2.add v4).congr (by ring)
  have q3 : PV (xpt h k a b c) (psub (pvar 2) (padd (pvar 3) (pvar 4))) c :=
    (v2.sub (v3.add v4)).congr (by ring)
  have q0 : PV (xpt h k a b c) (pconst 1) 1 := (PV.const 1).congr (by norm_num)
  rw [qJ_eq]
  have := (rotP_PV q0 q1 q2 q3).1 (3 * l + i) (by omega)
  rw [entry_val hR hl hi] at this
  exact this

theorem Q_PV (h k a b c : ℝ) :
    PV (xpt h k a b c) (rotP qJ).2 (1 + a ^ 2 + b ^ 2 + c ^ 2) := by
  have v2 : PV (xpt h k a b c) (pvar 2) ((a + b + c) / 3) := PV.var 2 (by norm_num)
  have v3 : PV (xpt h k a b c) (pvar 3) ((2 * a - b - c) / 3) := PV.var 3 (by norm_num)
  have v4 : PV (xpt h k a b c) (pvar 4) ((2 * b - a - c) / 3) := PV.var 4 (by norm_num)
  have q1 : PV (xpt h k a b c) (padd (pvar 2) (pvar 3)) a := (v2.add v3).congr (by ring)
  have q2 : PV (xpt h k a b c) (padd (pvar 2) (pvar 4)) b := (v2.add v4).congr (by ring)
  have q3 : PV (xpt h k a b c) (psub (pvar 2) (padd (pvar 3) (pvar 4))) c :=
    (v2.sub (v3.add v4)).congr (by ring)
  have q0 : PV (xpt h k a b c) (pconst 1) 1 := (PV.const 1).congr (by norm_num)
  rw [qJ_eq]
  exact (rotP_PV q0 q1 q2 q3).2.congr (by ring)

/-! ## 3. The candidate -/

/-- The candidate of the local code: components of `lcand`, signs from the tables at `I`. -/
def lcandC (code : ℕ) : Cand :=
  ⟨(lcand code).1, nth sigN (lcand code).1 0, (lcand code).2.1, nth sig0 (lcand code).2.1 0,
   (lcand code).2.2.1, nth sig1 (lcand code).2.2.1 0, (lcand code).2.2.2, nth sig3 (lcand code).2.2.2 0⟩

theorem sig_ok (t : List ℤ) (ht : t = sigN ∨ t = sig0 ∨ t = sig1 ∨ t = sig3) {i : ℕ} (hi : i < 3) :
    nth t i 0 = 1 ∨ nth t i 0 = -1 := by
  rcases ht with rfl | rfl | rfl | rfl <;> interval_cases i <;> simp [nth, sigN, sig0, sig1, sig3]

theorem lcandC_ok (code : ℕ) : CandOk (lcandC code) := by
  have h1 : code / 27 % 3 < 3 := Nat.mod_lt _ (by norm_num)
  have h2 : code / 9 % 3 < 3 := Nat.mod_lt _ (by norm_num)
  have h3 : code / 3 % 3 < 3 := Nat.mod_lt _ (by norm_num)
  have h4 : code % 3 < 3 := Nat.mod_lt _ (by norm_num)
  exact ⟨h1, h2, h3, h4, sig_ok _ (Or.inl rfl) h1, sig_ok _ (Or.inr (Or.inl rfl)) h2,
    sig_ok _ (Or.inr (Or.inr (Or.inl rfl))) h3, sig_ok _ (Or.inr (Or.inr (Or.inr rfl))) h4⟩

/-! ## 4. The value of `twoPc` -/

theorem range3' : List.range 3 = [0, 1, 2] := rfl

theorem twoPc_gen (code : ℕ) {x : Fin 5 → ℝ} {R : M3} {Qv : ℝ} (hQpos : Qv ≠ 0) (M : List Poly)
    (Qp : Poly) (hM : ∀ l i, l < 3 → i < 3 → PV x (nth M (3 * l + i) []) (Qv * rN R l i))
    (hQ : PV x Qp Qv) :
    PV x (twoPc M Qp code) (2 * Qv * Gc (x 0) (x 1) R (lcandC code)) := by
  have hc := lcandC_ok code
  have vh : PV x (pvar 0) (x 0) := PV.var 0 (by norm_num)
  have vk : PV x (pvar 1) (x 1) := PV.var 1 (by norm_num)
  have v1 : PV x (pconst 1) 1 := (PV.const 1).congr (by norm_num)
  have v2 : PV x (pconst 2) 2 := (PV.const 2).congr (by norm_num)
  have i0 := hc.i; have j0 := hc.j; have j1 := hc.j1; have j3 := hc.j3
  simp only [lcandC] at i0 j0 j1 j3
  have M0 : ∀ i, i < 3 → PV x (M.getD i []) (Qv * rN R 0 i) := fun i hi => by
    have := hM 0 i (by norm_num) hi; rwa [Nat.mul_zero, Nat.zero_add] at this
  have M1 : ∀ i, i < 3 → PV x (M.getD (3 + i) []) (Qv * rN R 1 i) := fun i hi => by
    have := hM 1 i (by norm_num) hi; rwa [Nat.mul_one] at this
  have M2 : ∀ i, i < 3 → PV x (M.getD (3 * 2 + i) []) (Qv * rN R 2 i) := fun i hi =>
    hM 2 i (by norm_num) hi
  have E := PV.psum5 (vh.mul hQ)
    ((((PV.psum3 (((v1.sub vh).mul (M0 _ i0))) ((((v1.sub vh).sub vk).mul (M1 _ i0)))
      ((v1.mul (M2 _ i0)))).smul (nth sigN (lcand code).1 0)).sub hQ).smul 2)
    ((v2.sub vh).mul (((PV.psum3 ((M0 _ j0).smul (-1)) ((M1 _ j0).smul (-1))
      ((M2 _ j0).smul (-1))).smul (nth sig0 (lcand code).2.1 0)).sub hQ))
    (vk.mul (((PV.psum3 ((M0 _ j1).smul (-1)) ((M1 _ j1).smul 1) ((M2 _ j1).smul 1)).smul
      (nth sig1 (lcand code).2.2.1 0)).sub hQ))
    ((vk.add vh).mul (((PV.psum3 ((M0 _ j3).smul 1) ((M1 _ j3).smul 1)
      ((M2 _ j3).smul (-1))).smul (nth sig3 (lcand code).2.2.2 0)).sub hQ))
  unfold twoPc
  simp only [range3', List.map_cons, List.map_nil, nth, List.getD_cons_zero, List.getD_cons_succ,
    bvec, Nat.mul_zero, Nat.zero_add, Nat.mul_one]
  refine E.congr ?_
  simp only [Gc, lcandC]
  push_cast
  ring

/-- **`twoPc = 2|q|² G_c`** at the point of `(h, k′)` and the quaternion `(1, a, b, c)`. -/
theorem twoPc_val (code : ℕ) (h k a b c : ℝ) {R : M3} (hR : QRot R a b c) :
    PV (xpt h k a b c) (twoPc (rotP qJ).1 (rotP qJ).2 code)
      (2 * (1 + a ^ 2 + b ^ 2 + c ^ 2) * Gc h k R (lcandC code)) := by
  have hQpos : (1 + a ^ 2 + b ^ 2 + c ^ 2 : ℝ) ≠ 0 := by positivity
  have := twoPc_gen code hQpos (rotP qJ).1 (rotP qJ).2
    (fun l i hl hi => M_PV h k a b c hR hl hi) (Q_PV h k a b c)
  simpa [xpt] using this

end

end PackLean.Formal.OctLocalForm
