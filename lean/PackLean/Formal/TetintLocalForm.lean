import PackLean.Formal.TetintPoly
import PackLean.Formal.TetintCover

/-!
# A9 stage 7e-3 (part 2): the value of the centre polynomial `locP` of `D40`

Design: `plan/A9f_tet_design.md` §10.  At `x = (h, k′, p₁, p₂, p₃)` the quaternion
`q = q_c ⊗ (1, p)` (`qmulP`, `q_c` the integer numerator of the centre) has the rotation entries
`rotP` and `|q|²`; if those entries are `|q|² R`, the candidate polynomial `locP` (types F and M) has
the value `8 s_d KD |q|² (dualC + sgn · κ̃₁)` (`locP_val`).
-/

namespace PackLean.Formal.TetintLocalForm

open PackLean.D40 (Prm Cen Cand Poly Mono padd psmul psub psum pconst pvar pmul qmulP rotP centerMQ
  mv2 dotIP dotPP nPoly locP vt bvec nth vsub)
open PackLean.Formal.TetintPoly
open PackLean.Formal PackLean.Formal.PolyLP PackLean.Formal.TetintFar PackLean.Formal.TetintCover
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.TetSep (bT)
open scoped Matrix

noncomputable section

/-! ## 1. Values with the invariant -/

/-- `p` has monomials of length 5 and the value `v` at `x`. -/
def PV (x : ℕ → ℝ) (p : Poly) (v : ℝ) : Prop := WF 5 p ∧ pv p x = v

variable {x : ℕ → ℝ}

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

theorem PV.var (i : ℕ) (hi : i < 5) : PV x (pvar i) (x i) := ⟨pvar_WF i, pv_pvar x i hi⟩

theorem PV.nil : PV x [] 0 := ⟨fun e he => by simp at he, rfl⟩

theorem PV.foldl {ι : Type*} (f : ι → Poly) (g : ι → ℝ) :
    ∀ (L : List ι), (∀ i ∈ L, PV x (f i) (g i)) → ∀ (acc : Poly) (a : ℝ), PV x acc a →
      PV x ((L.map f).foldl padd acc) (a + (L.map g).sum)
  | [], _, acc, a, h => by simpa using h
  | i :: L, hL, acc, a, h => by
    simp only [List.map_cons, List.foldl_cons, List.sum_cons]
    have := PV.foldl f g L (fun j hj => hL j (List.mem_cons_of_mem _ hj)) _ _
      (h.add (hL i (by simp)))
    exact this.congr (by ring)

theorem PV.psum_map {ι : Type*} (L : List ι) (f : ι → Poly) (g : ι → ℝ)
    (h : ∀ i ∈ L, PV x (f i) (g i)) : PV x (psum (L.map f)) (L.map g).sum :=
  (PV.foldl f g L h [] 0 PV.nil).congr (by ring)

theorem PV.psum4 {p0 p1 p2 p3 : Poly} {a b c d : ℝ} (h0 : PV x p0 a) (h1 : PV x p1 b)
    (h2 : PV x p2 c) (h3 : PV x p3 d) : PV x (psum [p0, p1, p2, p3]) (a + b + c + d) :=
  ((((PV.nil.add h0).add h1).add h2).add h3).congr (by ring)

theorem PV.psum3 {p0 p1 p2 : Poly} {a b c : ℝ} (h0 : PV x p0 a) (h1 : PV x p1 b) (h2 : PV x p2 c) :
    PV x (psum [p0, p1, p2]) (a + b + c) :=
  (((PV.nil.add h0).add h1).add h2).congr (by ring)

/-! ## 2. The quaternion and its rotation -/

/-- The quaternion product `p ⊗ q` (real). -/
def qmulR (w1 x1 y1 z1 w2 x2 y2 z2 : ℝ) : ℝ × ℝ × ℝ × ℝ :=
  (w1 * w2 - x1 * x2 - y1 * y2 - z1 * z2, w1 * x2 + x1 * w2 + y1 * z2 - z1 * y2,
   w1 * y2 - x1 * z2 + y1 * w2 + z1 * x2, w1 * z2 + x1 * y2 - y1 * x2 + z1 * w2)

theorem qmulP_PV (w1 x1 y1 z1 : ℤ) {a b c d : Poly} {A B C D : ℝ} (ha : PV x a A) (hb : PV x b B)
    (hc : PV x c C) (hd : PV x d D) :
    let r := qmulR w1 x1 y1 z1 A B C D
    PV x (nth (qmulP [w1, x1, y1, z1] [a, b, c, d]) 0 []) r.1 ∧
    PV x (nth (qmulP [w1, x1, y1, z1] [a, b, c, d]) 1 []) r.2.1 ∧
    PV x (nth (qmulP [w1, x1, y1, z1] [a, b, c, d]) 2 []) r.2.2.1 ∧
    PV x (nth (qmulP [w1, x1, y1, z1] [a, b, c, d]) 3 []) r.2.2.2 := by
  intro r
  simp only [qmulP, nth, List.getD_cons_zero, List.getD_cons_succ, r, qmulR]
  refine ⟨?_, ?_, ?_, ?_⟩
  · exact (PV.psum4 (ha.smul w1) (hb.smul (-x1)) (hc.smul (-y1)) (hd.smul (-z1))).congr
      (by push_cast; ring)
  · exact (PV.psum4 (hb.smul w1) (ha.smul x1) (hd.smul y1) (hc.smul (-z1))).congr
      (by push_cast; ring)
  · exact (PV.psum4 (hc.smul w1) (hd.smul (-x1)) (ha.smul y1) (hb.smul z1)).congr
      (by push_cast; ring)
  · exact (PV.psum4 (hd.smul w1) (hc.smul x1) (hb.smul (-y1)) (ha.smul z1)).congr
      (by push_cast; ring)

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

/-- The centre quaternion `q_c ⊗ (1, p₁, p₂, p₃)` at `x`. -/
def qcx (qc : List ℤ) (x : ℕ → ℝ) : ℝ × ℝ × ℝ × ℝ :=
  qmulR ((nth qc 0 0 : ℤ) : ℝ) ((nth qc 1 0 : ℤ) : ℝ) ((nth qc 2 0 : ℤ) : ℝ) ((nth qc 3 0 : ℤ) : ℝ) 1
    (x 2) (x 3) (x 4)

/-- **The rotation polynomials of a centre** (`centerMQ`): the entries `Rq(q)` and `|q|²` of
`q = q_c ⊗ (1, p)`. -/
theorem centerMQ_PV {ce : Cen} {w1 x1 y1 z1 : ℤ} (hq : ce.q = [w1, x1, y1, z1]) :
    let q := qcx ce.q x
    (∀ t < 9, PV x (nth (centerMQ ce).1 t [])
      (nth (QuadSem.rqList q.1 q.2.1 q.2.2.1 q.2.2.2) t 0)) ∧
    PV x (centerMQ ce).2 (q.1 ^ 2 + q.2.1 ^ 2 + q.2.2.1 ^ 2 + q.2.2.2 ^ 2) := by
  intro q
  have v0 : PV x (pconst 1) 1 := (PV.const 1).congr (by norm_num)
  have v2 : PV x (pvar 2) (x 2) := PV.var 2 (by norm_num)
  have v3 : PV x (pvar 3) (x 3) := PV.var 3 (by norm_num)
  have v4 : PV x (pvar 4) (x 4) := PV.var 4 (by norm_num)
  obtain ⟨e0, e1, e2, e3⟩ := qmulP_PV w1 x1 y1 z1 v0 v2 v3 v4
  have hl : qmulP [w1, x1, y1, z1] [pconst 1, pvar 2, pvar 3, pvar 4]
      = [nth (qmulP [w1, x1, y1, z1] [pconst 1, pvar 2, pvar 3, pvar 4]) 0 [],
         nth (qmulP [w1, x1, y1, z1] [pconst 1, pvar 2, pvar 3, pvar 4]) 1 [],
         nth (qmulP [w1, x1, y1, z1] [pconst 1, pvar 2, pvar 3, pvar 4]) 2 [],
         nth (qmulP [w1, x1, y1, z1] [pconst 1, pvar 2, pvar 3, pvar 4]) 3 []] := rfl
  have hqc : qcx ce.q x = qmulR w1 x1 y1 z1 1 (x 2) (x 3) (x 4) := by
    simp [qcx, hq, nth]
  simp only [centerMQ, hq]
  rw [hl]
  simp only [q, hqc]
  exact rotP_PV e0 e1 e2 e3

/-! ## 3. The candidate polynomial -/

theorem PV.psum1 {p0 : Poly} {a : ℝ} (h0 : PV x p0 a) : PV x (psum [p0]) a :=
  (PV.nil.add h0).congr (by ring)

theorem PV.psum2 {p0 p1 : Poly} {a b : ℝ} (h0 : PV x p0 a) (h1 : PV x p1 b) :
    PV x (psum [p0, p1]) (a + b) :=
  ((PV.nil.add h0).add h1).congr (by ring)

theorem range3 : List.range 3 = [0, 1, 2] := rfl
theorem range4 : List.range 4 = [0, 1, 2, 3] := rfl

/-- The point of the side at `(h, k′) = (x₀, x₁)`. -/
theorem pS_coords (side : ℕ) (h k : ℝ) :
    pS side h k = !₂[1 - h, (if side = 0 then 1 - h - k else -(1 - h - k)), 1] := by
  unfold pS; split_ifs <;> rfl

/-- **The value of `locP`** (types F and M): with the rotation entries `Qv · R` and `|q|² = Qv`,
`locP = 8 s_d KD Qv (dualC (s̄/2) p R c + sgn · κ̃₁(h, k′))` at `p = pS side h k`. -/
theorem locP_val {P : Prm} (hms : P.msign = 1) (hsd : 0 < P.sbar.2) (hKD : 0 < P.kd)
    {side : ℕ} (hs : side = 0 ∨ side = 1) {c : Cand} (ht : c.typ ≠ 2) {M : List Poly} {Q : Poly}
    {Qv : ℝ} {R : M3}
    (hM : ∀ t < 9, PV x (nth M t []) (Qv * OctFar.rN R (t / 3) (t % 3))) (hQ : PV x Q Qv) :
    PV x (locP P side (M, Q) c)
      (8 * P.sbar.2 * P.kd * Qv * (dualC (cbD P) (pS side (x 0) (x 1)) R c
        + sgn side * kapN P (0, 1) (x 0) (x 1))) := by
  have ht' : (c.typ == 2) = false := by simpa using ht
  have hsdr : ((P.sbar.2 : ℕ) : ℝ) ≠ 0 := by exact_mod_cast hsd.ne'
  have hKDr : (P.kd : ℝ) ≠ 0 := by exact_mod_cast hKD.ne'
  rcases hs with rfl | rfl
  all_goals
    simp only [locP, ht', Bool.false_eq_true, if_false, nPoly, beq_self_eq_true, if_true,
      show ((1 : ℕ) == 0) = false from rfl, hms, one_mul, mv2, dotPP, dotIP, range3, range4,
      List.map_cons, List.map_nil, List.zipWith_cons_cons, List.zipWith_nil_left, nth,
      List.getD_cons_zero, List.getD_cons_succ, bvec, vsub]
    apply PV.congr
    · repeat' (first
        | with_reducible apply PV.psum4 | with_reducible apply PV.psum3
        | with_reducible apply PV.psum2 | with_reducible apply PV.psum1
        | with_reducible apply PV.add | with_reducible apply PV.sub
        | with_reducible apply PV.mul | with_reducible apply PV.smul
        | with_reducible exact PV.const _ | with_reducible exact PV.var 0 (by norm_num)
        | with_reducible exact PV.var 1 (by norm_num)
        | exact hQ | exact hM _ (by norm_num))
    · simp only [dualC, muC, pS, sgn, kapN, cbD, Fin.sum_univ_four, Fin.sum_univ_three, dot,
        mv_apply, VD, vtR, bT, OctFar.rN, nth, if_true, if_false, one_ne_zero]
      simp
      field_simp
      ring

end

end PackLean.Formal.TetintLocalForm
