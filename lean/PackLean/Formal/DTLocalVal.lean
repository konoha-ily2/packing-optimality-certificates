import PackLean.Formal.DTLocalBox
import PackLean.AxiomAudit

/-!
# A9k stage 7c-3 (part 3): the value of the candidate polynomial `candPoly` of `D45DT`

Design: `plan/A9k_dodintet_design.md` §3 (7c-3), §7 (7c-3 段 2, the item `cand_valT`).

At `x = (u, w, p₁, p₂, p₃)` the polynomials of `locParts P t` have the values
* `n·dl = (p0 + u·d + w·ŵ, dl)` (`nIP_val`), i.e. `dl · (tX, tY, 1)`;
* `q = q_c ⊗ (1, p)` (`Q_val`, the quaternion `qcT t p₁ p₂ p₃` of `DTLocalBox`), its rotation
  entries `Rq(q)` and `|q|²` (`mkM_val`, the form of `TetintLocalForm.rotP_PV` with field
  coefficients);
* `X_v = Σ_j V_{v,j} · M_{3i+j}` (`XP_val`); with `Rq(q) = |q|²·R` this is `|q|²·dv·(R V_v)_i`.

**`cand_valT`**: if `R` is the rotation of `qcT t (x 2) (x 3) (x 4)` (`QRotT`), then
`candPoly (locParts P t) cd` has the value
`4·cden·kd·dl·dv·|q|²·(dualB(n, R) − κ_t(n))` at `x`, with `n = (tX, tY, 1)`, the vertices
`v₀ = cd₀`, `(lf₀, lf₁, lf₃) = (cd₁, cd₂, cd₃)` (`lf₂` is unused: its weight `n·(b₂ − b₂)` is 0) and
κ the tube form `kapForm P t.side 0` over `kd` (`kapV`).  `cand_WF`: the polynomial has the
invariant `WFN 5 PS` (needed by `splitE0_spec`).
-/

namespace PackLean.Formal.DTLocalVal

open PackLean.D28 (FE Mono Poly padd psum pmul psmulZ psmulF incAt nth vecGet fIsZero fzero)
open PackLean.D45DT (Prm Tube PS fz fI BV BTOP kapForm pI pF pV pM pS pSum LocParts locParts candPoly
  toProb)
open PackLean.Formal PackLean.Formal.PolyLP PackLean.Formal.QuadSem PackLean.Formal.TetFar
open PackLean.Formal.FieldSem (fval Len)
open PackLean.Formal.PolySemN (pEvalN WFN padd_WF pEvalN_padd psmulZ_WF pEvalN_psmulZ psum_WF
  pEvalN_psum pmul_spec psmulF_WF pEvalN_psmulF WFN_cons WFN_nil pEvalN_cons pEvalN_nil
  monoN_replicate monoN_incAt incAt_length)
open PackLean.Formal.BoxTree (monoN)
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.TetSep (bT)
open PackLean.Formal.DTLocalBox (tX tY qa qcT QRotT fvalI lenI tubeWfB)
open PackLean.Formal.TetintLocalForm (qmulR)
open PackLean.Formal.DTFar (kapV)
open PackLean.Formal.DTBase (dtExtraOk toProb_wf)
open scoped Matrix

noncomputable section

/-! ## 1. Values with the invariant -/

/-- `p` has the invariant `WFN 5 PS` and the value `v` at `x`. -/
def PVN (x : Fin 5 → ℝ) (p : Poly) (v : ℝ) : Prop := WFN 5 PS p ∧ pEvalN 5 PS p x = v

variable {x : Fin 5 → ℝ}

theorem PVN.congr {p : Poly} {a b : ℝ} (h : PVN x p a) (e : a = b) : PVN x p b := e ▸ h

theorem PVN.add {p q : Poly} {a b : ℝ} (hp : PVN x p a) (hq : PVN x q b) :
    PVN x (padd p q) (a + b) :=
  ⟨padd_WF hp.1 hq.1, by rw [pEvalN_padd x hp.1 hq.1, hp.2, hq.2]⟩

theorem PVN.smul (c : ℤ) {p : Poly} {a : ℝ} (hp : PVN x p a) : PVN x (psmulZ c p) (c * a) :=
  ⟨psmulZ_WF c hp.1, by rw [pEvalN_psmulZ x c p, hp.2]⟩

theorem PVN.sub {p q : Poly} {a b : ℝ} (hp : PVN x p a) (hq : PVN x q b) : PVN x (pS p q) (a - b) :=
  (hp.add (hq.smul (-1))).congr (by push_cast; ring)

theorem PVN.mul {p q : Poly} {a b : ℝ} (hp : PVN x p a) (hq : PVN x q b) : PVN x (pM p q) (a * b) :=
  ⟨(pmul_spec x hp.1 hq.1).1, by rw [pM, (pmul_spec x hp.1 hq.1).2, hp.2, hq.2]⟩

theorem PVN.smulF {c : FE} (hc : Len PS c) {p : Poly} {a : ℝ} (hp : PVN x p a) :
    PVN x (psmulF PS c p) (fval PS c * a) :=
  ⟨psmulF_WF hc hp.1, by rw [pEvalN_psmulF x hc hp.1, hp.2]⟩

theorem PVN.nil : PVN x [] 0 := ⟨WFN_nil, rfl⟩

theorem PVN.psum3 {p0 p1 p2 : Poly} {a b c : ℝ} (h0 : PVN x p0 a) (h1 : PVN x p1 b)
    (h2 : PVN x p2 c) : PVN x (psum [p0, p1, p2]) (a + b + c) :=
  (((PVN.nil.add h0).add h1).add h2).congr (by ring)

theorem mono_zero5 : monoN 5 [0, 0, 0, 0, 0] x = 1 := by
  have h : ([0, 0, 0, 0, 0] : Mono) = List.replicate 5 0 := rfl
  rw [h]; exact monoN_replicate x

theorem PVN.I (c : ℤ) : PVN x (pI c) c := by
  unfold pI
  split_ifs with h
  · have : c = 0 := beq_iff_eq.1 h
    subst this; exact PVN.nil.congr (by simp)
  · refine ⟨WFN_cons.2 ⟨⟨rfl, lenI c⟩, WFN_nil⟩, ?_⟩
    rw [pEvalN_cons, pEvalN_nil, fvalI, mono_zero5]; ring

theorem PVN.V (i : ℕ) (hi : i < 5) (c : ℤ) : PVN x (pV i c) (c * x ⟨i, hi⟩) := by
  unfold pV
  split_ifs with h
  · have : c = 0 := beq_iff_eq.1 h
    subst this; exact PVN.nil.congr (by simp)
  · have hm : ([0, 0, 0, 0, 0] : Mono).length = 5 := rfl
    refine ⟨WFN_cons.2 ⟨⟨(incAt_length _ _).trans hm, lenI c⟩, WFN_nil⟩, ?_⟩
    rw [pEvalN_cons, pEvalN_nil, fvalI, monoN_incAt hm i hi x, mono_zero5]; ring

theorem PVN.F {c : FE} (hc : Len PS c) : PVN x (pF c) (fval PS c) := by
  unfold pF
  split_ifs with h
  · exact PVN.nil.congr (FieldSem.fval_of_isZero PS h).symm
  · refine ⟨WFN_cons.2 ⟨⟨rfl, hc⟩, WFN_nil⟩, ?_⟩
    rw [pEvalN_cons, pEvalN_nil, mono_zero5]; ring

/-! ## 2. The parts of `locParts` as named polynomials (`locParts_eq` is `rfl`) -/

/-- The centre quaternion and `(1, p₁, p₂, p₃)`. -/
def qcP (t : Tube) : List Poly := t.q.map pF
def pqP : List Poly := [pI 1, pV 2 1, pV 3 1, pV 4 1]

/-- The four components of the quaternion product (the order of `locParts`). -/
def qmW (w1 x1 y1 z1 w2 x2 y2 z2 : Poly) : Poly := pS (pS (pS (pM w1 w2) (pM x1 x2)) (pM y1 y2)) (pM z1 z2)
def qmA (w1 x1 y1 z1 w2 x2 y2 z2 : Poly) : Poly := pS (padd (padd (pM w1 x2) (pM x1 w2)) (pM y1 z2)) (pM z1 y2)
def qmB (w1 x1 y1 z1 w2 x2 y2 z2 : Poly) : Poly := padd (padd (pS (pM w1 y2) (pM x1 z2)) (pM y1 w2)) (pM z1 x2)
def qmC (w1 x1 y1 z1 w2 x2 y2 z2 : Poly) : Poly := padd (pS (padd (pM w1 z2) (pM x1 y2)) (pM y1 x2)) (pM z1 w2)

def QW (t : Tube) : Poly := qmW (nth (qcP t) 0 []) (nth (qcP t) 1 []) (nth (qcP t) 2 []) (nth (qcP t) 3 [])
  (nth pqP 0 []) (nth pqP 1 []) (nth pqP 2 []) (nth pqP 3 [])
def QA (t : Tube) : Poly := qmA (nth (qcP t) 0 []) (nth (qcP t) 1 []) (nth (qcP t) 2 []) (nth (qcP t) 3 [])
  (nth pqP 0 []) (nth pqP 1 []) (nth pqP 2 []) (nth pqP 3 [])
def QB (t : Tube) : Poly := qmB (nth (qcP t) 0 []) (nth (qcP t) 1 []) (nth (qcP t) 2 []) (nth (qcP t) 3 [])
  (nth pqP 0 []) (nth pqP 1 []) (nth pqP 2 []) (nth pqP 3 [])
def QC (t : Tube) : Poly := qmC (nth (qcP t) 0 []) (nth (qcP t) 1 []) (nth (qcP t) 2 []) (nth (qcP t) 3 [])
  (nth pqP 0 []) (nth pqP 1 []) (nth pqP 2 []) (nth pqP 3 [])

/-- The rotation entries `Rq(q)` (as `rqList`) and `|q|²`. -/
def mkM (w a b c : Poly) : List Poly :=
  [pS (pS (padd (pM w w) (pM a a)) (pM b b)) (pM c c), psmulZ 2 (pS (pM a b) (pM w c)),
   psmulZ 2 (padd (pM a c) (pM w b)),
   psmulZ 2 (padd (pM a b) (pM w c)), pS (padd (pS (pM w w) (pM a a)) (pM b b)) (pM c c),
   psmulZ 2 (pS (pM b c) (pM w a)),
   psmulZ 2 (pS (pM a c) (pM w b)), psmulZ 2 (padd (pM b c) (pM w a)),
   pS (pS (padd (pM w w) (pM c c)) (pM a a)) (pM b b)]
def mkN (w a b c : Poly) : Poly := padd (padd (pM w w) (pM a a)) (padd (pM b b) (pM c c))

def MP (t : Tube) : List Poly := mkM (QW t) (QA t) (QB t) (QC t)
def NqP (t : Tube) : Poly := mkN (QW t) (QA t) (QB t) (QC t)

/-- `n·dl`. -/
def nIP (t : Tube) : List Poly :=
  [padd (padd (pI (nth t.p0 0 0)) (pV 0 (nth t.d 0 0))) (pV 1 (nth t.w 0 0)),
   padd (padd (pI (nth t.p0 1 0)) (pV 0 (nth t.d 1 0))) (pV 1 (nth t.w 1 0)),
   pI t.dl]

/-- `X_v = Σ_j V_{v,j} M_{3i+j}`. -/
def XP (P : Prm) (t : Tube) (v : ℕ) : List Poly := (List.range 3).map (fun i =>
  pSum ((List.range 3).map (fun j => psmulF PS (vecGet (nth P.verts v []) j 2) (nth (MP t) (3 * i + j) []))))

def ntP (P : Prm) (t : Tube) (Xv : List Poly) : Poly :=
  psmulZ (4 * ((P.cden : Int) * P.kd)) (pSum ((List.range 3).map (fun i => pM (nth (nIP t) i []) (nth Xv i []))))

def wtsP (t : Tube) (f : ℕ) : Poly :=
  pSum ((List.range 3).map (fun i => psmulZ (nth (nth BV BTOP []) i 0 - nth (nth BV f []) i 0) (nth (nIP t) i [])))

def btP (P : Prm) (t : Tube) (f : ℕ) (Xv : List Poly) : Poly :=
  psmulZ ((P.cden : Int) * P.kd)
    (pM (wtsP t f) (pSum ((List.range 3).map (fun i => psmulZ (nth (nth BV f []) i 0) (nth Xv i [])))))

def subP (P : Prm) (t : Tube) : Poly :=
  psmulZ (4 * (P.dv : Int))
    (pM (padd (psmulZ ((P.kd : Int) * P.cnum)
          (pSum ((List.range 3).map (fun i => psmulZ (nth (nth BV BTOP []) i 0) (nth (nIP t) i [])))))
        (psmulZ (P.cden : Int)
          (pSum ((List.range 3).map (fun i => psmulZ (nth (kapForm P t.side 0) i 0) (nth (nIP t) i []))))))
      (NqP t))

theorem locParts_eq (P : Prm) (t : Tube) : locParts P t =
    { nterm := ((List.range P.verts.length).map (XP P t)).map (ntP P t)
      bterm := (List.range 4).map (fun f => ((List.range P.verts.length).map (XP P t)).map (btP P t f))
      sub := subP P t } := rfl

/-! ## 3. The values of the parts -/

theorem range3 : List.range 3 = [0, 1, 2] := rfl

theorem pF_fz : pF fz = [] := by decide

theorem nth_qcP (t : Tube) (i : ℕ) : nth (qcP t) i [] = pF (nth t.q i fz) := by
  unfold qcP nth
  rw [← pF_fz, List.getD_map]

theorem qm_val {w1 x1 y1 z1 w2 x2 y2 z2 : Poly} {W1 X1 Y1 Z1 W2 X2 Y2 Z2 : ℝ}
    (h1 : PVN x w1 W1) (h2 : PVN x x1 X1) (h3 : PVN x y1 Y1) (h4 : PVN x z1 Z1)
    (h5 : PVN x w2 W2) (h6 : PVN x x2 X2) (h7 : PVN x y2 Y2) (h8 : PVN x z2 Z2) :
    PVN x (qmW w1 x1 y1 z1 w2 x2 y2 z2) (qmulR W1 X1 Y1 Z1 W2 X2 Y2 Z2).1 ∧
    PVN x (qmA w1 x1 y1 z1 w2 x2 y2 z2) (qmulR W1 X1 Y1 Z1 W2 X2 Y2 Z2).2.1 ∧
    PVN x (qmB w1 x1 y1 z1 w2 x2 y2 z2) (qmulR W1 X1 Y1 Z1 W2 X2 Y2 Z2).2.2.1 ∧
    PVN x (qmC w1 x1 y1 z1 w2 x2 y2 z2) (qmulR W1 X1 Y1 Z1 W2 X2 Y2 Z2).2.2.2 := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · exact ((((h1.mul h5).sub (h2.mul h6)).sub (h3.mul h7)).sub (h4.mul h8)).congr (by simp only [qmulR])
  · exact ((((h1.mul h6).add (h2.mul h5)).add (h3.mul h8)).sub (h4.mul h7)).congr (by simp only [qmulR])
  · exact ((((h1.mul h7).sub (h2.mul h8)).add (h3.mul h5)).add (h4.mul h6)).congr (by simp only [qmulR])
  · exact ((((h1.mul h8).add (h2.mul h7)).sub (h3.mul h6)).add (h4.mul h5)).congr (by simp only [qmulR])

/-- **The quaternion `q_c ⊗ (1, p)`** at `x`. -/
theorem Q_val (t : Tube) (hq : ∀ i, Len PS (nth t.q i fz)) :
    PVN x (QW t) (qcT t (x 2) (x 3) (x 4)).1 ∧ PVN x (QA t) (qcT t (x 2) (x 3) (x 4)).2.1 ∧
    PVN x (QB t) (qcT t (x 2) (x 3) (x 4)).2.2.1 ∧ PVN x (QC t) (qcT t (x 2) (x 3) (x 4)).2.2.2 := by
  have c : ∀ i, PVN x (nth (qcP t) i []) (qa t i) := fun i => by
    rw [nth_qcP]; exact PVN.F (hq i)
  have e0 : PVN x (nth pqP 0 []) 1 := (PVN.I (x := x) 1).congr (by norm_num)
  have e1 : PVN x (nth pqP 1 []) (x 2) := (PVN.V 2 (by norm_num) 1).congr (by simp)
  have e2 : PVN x (nth pqP 2 []) (x 3) := (PVN.V 3 (by norm_num) 1).congr (by simp)
  have e3 : PVN x (nth pqP 3 []) (x 4) := (PVN.V 4 (by norm_num) 1).congr (by simp)
  exact qm_val (c 0) (c 1) (c 2) (c 3) e0 e1 e2 e3

/-- The rotation entries of a quaternion (the form of `TetintLocalForm.rotP_PV`). -/
theorem mkM_val {w a b c : Poly} {W A B C : ℝ} (hw : PVN x w W) (ha : PVN x a A) (hb : PVN x b B)
    (hc : PVN x c C) :
    (∀ k < 9, PVN x (nth (mkM w a b c) k []) (nth (QuadSem.rqList W A B C) k 0)) ∧
    PVN x (mkN w a b c) (W ^ 2 + A ^ 2 + B ^ 2 + C ^ 2) := by
  refine ⟨fun k hk => ?_, ?_⟩
  · interval_cases k <;> simp only [mkM, nth, List.getD_cons_zero, List.getD_cons_succ, QuadSem.rqList]
    · exact ((((hw.mul hw).add (ha.mul ha)).sub (hb.mul hb)).sub (hc.mul hc)).congr (by ring)
    · exact (((ha.mul hb).sub (hw.mul hc)).smul 2).congr (by push_cast; ring)
    · exact (((ha.mul hc).add (hw.mul hb)).smul 2).congr (by push_cast; ring)
    · exact (((ha.mul hb).add (hw.mul hc)).smul 2).congr (by push_cast; ring)
    · exact ((((hw.mul hw).sub (ha.mul ha)).add (hb.mul hb)).sub (hc.mul hc)).congr (by ring)
    · exact (((hb.mul hc).sub (hw.mul ha)).smul 2).congr (by push_cast; ring)
    · exact (((ha.mul hc).sub (hw.mul hb)).smul 2).congr (by push_cast; ring)
    · exact (((hb.mul hc).add (hw.mul ha)).smul 2).congr (by push_cast; ring)
    · exact ((((hw.mul hw).add (hc.mul hc)).sub (ha.mul ha)).sub (hb.mul hb)).congr (by ring)
  · exact (((hw.mul hw).add (ha.mul ha)).add ((hb.mul hb).add (hc.mul hc))).congr (by ring)

/-- The value of `n·dl` by coordinate. -/
def nIv (t : Tube) (x : Fin 5 → ℝ) (i : ℕ) : ℝ :=
  if i = 0 then t.dl * tX t (x 0) (x 1) else if i = 1 then t.dl * tY t (x 0) (x 1) else t.dl

theorem nIP_val (t : Tube) (hdl : 0 < t.dl) : ∀ i < 3, PVN x (nth (nIP t) i []) (nIv t x i) := by
  have hd : (t.dl : ℝ) ≠ 0 := by exact_mod_cast hdl.ne'
  intro i hi
  interval_cases i <;> simp only [nIP, nth, List.getD_cons_zero, List.getD_cons_succ]
  · refine (((PVN.I _).add (PVN.V 0 (by norm_num) _)).add (PVN.V 1 (by norm_num) _)).congr ?_
    have e : (t.dl : ℝ) * tX t (x 0) (x 1)
        = ((nth t.p0 0 0 : ℤ) : ℝ) + x 0 * ((nth t.d 0 0 : ℤ) : ℝ) + x 1 * ((nth t.w 0 0 : ℤ) : ℝ) := by
      unfold tX; field_simp
    simp only [nIv, ite_true, e]
    have e0 : x ⟨0, by norm_num⟩ = x 0 := rfl
    have e1 : x ⟨1, by norm_num⟩ = x 1 := rfl
    rw [e0, e1]; simp only [nth]; ring
  · refine (((PVN.I _).add (PVN.V 0 (by norm_num) _)).add (PVN.V 1 (by norm_num) _)).congr ?_
    have e : (t.dl : ℝ) * tY t (x 0) (x 1)
        = ((nth t.p0 1 0 : ℤ) : ℝ) + x 0 * ((nth t.d 1 0 : ℤ) : ℝ) + x 1 * ((nth t.w 1 0 : ℤ) : ℝ) := by
      unfold tY; field_simp
    simp only [nIv, one_ne_zero, ite_false, ite_true, e]
    have e0 : x ⟨0, by norm_num⟩ = x 0 := rfl
    have e1 : x ⟨1, by norm_num⟩ = x 1 := rfl
    rw [e0, e1]; simp only [nth]; ring
  · exact (PVN.I _).congr (by simp [nIv])

/-- `X_v` with the rotation entries `m`. -/
def Xr (P : Prm) (m : ℕ → ℝ) (v i : ℕ) : ℝ :=
  fval PS (vecGet (nth P.verts v []) 0 2) * m (3 * i) + fval PS (vecGet (nth P.verts v []) 1 2) * m (3 * i + 1)
    + fval PS (vecGet (nth P.verts v []) 2 2) * m (3 * i + 2)

theorem XP_val (P : Prm) (t : Tube) (v : ℕ) (hV : ∀ j, Len PS (vecGet (nth P.verts v []) j 2))
    {m : ℕ → ℝ} (hM : ∀ k < 9, PVN x (nth (MP t) k []) (m k)) :
    ∀ i < 3, PVN x (nth (XP P t v) i []) (Xr P m v i) := by
  intro i hi
  have e : nth (XP P t v) i [] = pSum ((List.range 3).map (fun j =>
      psmulF PS (vecGet (nth P.verts v []) j 2) (nth (MP t) (3 * i + j) []))) := by
    unfold XP nth
    rw [List.getD_eq_getElem _ _ (by simpa using hi), List.getElem_map, List.getElem_range]
  rw [e, pSum, range3]
  simp only [List.map_cons, List.map_nil]
  exact (PVN.psum3 ((hM _ (by omega)).smulF (hV 0)) ((hM _ (by omega)).smulF (hV 1))
    ((hM _ (by omega)).smulF (hV 2))).congr (by simp [Xr])

/-- `s3 g = g 0 + g 1 + g 2`. -/
def s3 (g : ℕ → ℝ) : ℝ := g 0 + g 1 + g 2

theorem ntP_val (P : Prm) (t : Tube) (hdl : 0 < t.dl) {Xv : List Poly} {Xs : ℕ → ℝ}
    (hX : ∀ i < 3, PVN x (nth Xv i []) (Xs i)) :
    PVN x (ntP P t Xv) (((4 * ((P.cden : ℤ) * P.kd) : ℤ) : ℝ) * s3 (fun i => nIv t x i * Xs i)) := by
  have hn := nIP_val (x := x) t hdl
  unfold ntP
  rw [pSum, range3]
  simp only [List.map_cons, List.map_nil]
  exact ((PVN.psum3 ((hn 0 (by norm_num)).mul (hX 0 (by norm_num))) ((hn 1 (by norm_num)).mul (hX 1 (by norm_num)))
    ((hn 2 (by norm_num)).mul (hX 2 (by norm_num)))).smul _).congr (by simp only [s3])

/-- The value of the weight `n·dl·(b₂ − b_f)`. -/
def wv (t : Tube) (x : Fin 5 → ℝ) (f : ℕ) : ℝ :=
  s3 (fun i => ((nth (nth BV BTOP []) i 0 - nth (nth BV f []) i 0 : ℤ) : ℝ) * nIv t x i)

theorem wtsP_val (t : Tube) (hdl : 0 < t.dl) (f : ℕ) : PVN x (wtsP t f) (wv t x f) := by
  have hn := nIP_val (x := x) t hdl
  unfold wtsP
  rw [pSum, range3]
  simp only [List.map_cons, List.map_nil]
  exact (PVN.psum3 ((hn 0 (by norm_num)).smul _) ((hn 1 (by norm_num)).smul _)
    ((hn 2 (by norm_num)).smul _)).congr (by simp only [wv, s3])

/-- The value of a face term. -/
def bE (P : Prm) (t : Tube) (x : Fin 5 → ℝ) (Xs : ℕ → ℝ) (f : ℕ) : ℝ :=
  (((P.cden : ℤ) * P.kd : ℤ) : ℝ) * (wv t x f * s3 (fun i => ((nth (nth BV f []) i 0 : ℤ) : ℝ) * Xs i))

theorem btP_val (P : Prm) (t : Tube) (hdl : 0 < t.dl) (f : ℕ) {Xv : List Poly} {Xs : ℕ → ℝ}
    (hX : ∀ i < 3, PVN x (nth Xv i []) (Xs i)) : PVN x (btP P t f Xv) (bE P t x Xs f) := by
  unfold btP
  rw [pSum, range3]
  simp only [List.map_cons, List.map_nil]
  exact (((wtsP_val t hdl f).mul (PVN.psum3 ((hX 0 (by norm_num)).smul _) ((hX 1 (by norm_num)).smul _)
    ((hX 2 (by norm_num)).smul _))).smul _).congr (by simp only [bE, s3])

/-- The value of the subtracted term. -/
def sE (P : Prm) (t : Tube) (x : Fin 5 → ℝ) (Nqv : ℝ) : ℝ :=
  (((4 * (P.dv : ℤ)) : ℤ) : ℝ) *
    (((((P.kd : ℤ) * P.cnum : ℤ) : ℝ) * s3 (fun i => ((nth (nth BV BTOP []) i 0 : ℤ) : ℝ) * nIv t x i)
      + ((P.cden : ℤ) : ℝ) * s3 (fun i => ((nth (kapForm P t.side 0) i 0 : ℤ) : ℝ) * nIv t x i)) * Nqv)

theorem subP_val (P : Prm) (t : Tube) (hdl : 0 < t.dl) {Nqv : ℝ} (hN : PVN x (NqP t) Nqv) :
    PVN x (subP P t) (sE P t x Nqv) := by
  have hn := nIP_val (x := x) t hdl
  unfold subP
  rw [pSum, pSum, range3]
  simp only [List.map_cons, List.map_nil]
  have hA := (PVN.psum3 ((hn 0 (by norm_num)).smul (nth (nth BV BTOP []) 0 0))
    ((hn 1 (by norm_num)).smul (nth (nth BV BTOP []) 1 0)) ((hn 2 (by norm_num)).smul (nth (nth BV BTOP []) 2 0))).smul
    ((P.kd : Int) * P.cnum)
  have hB := (PVN.psum3 ((hn 0 (by norm_num)).smul (nth (kapForm P t.side 0) 0 0))
    ((hn 1 (by norm_num)).smul (nth (kapForm P t.side 0) 1 0))
    ((hn 2 (by norm_num)).smul (nth (kapForm P t.side 0) 2 0))).smul (P.cden : Int)
  exact (((hA.add hB).mul hN).smul (4 * (P.dv : Int))).congr (by simp only [sE, s3])

/-! ## 4. The candidate polynomial -/

theorem nth_map_range {F : ℕ → List Poly} {n k : ℕ} (hk : k < n) :
    nth ((List.range n).map F) k [] = F k := by
  unfold nth
  rw [List.getD_eq_getElem _ _ (by simpa using hk), List.getElem_map, List.getElem_range]

theorem nth_map_map_range {g : ℕ → List Poly} {h : List Poly → Poly} {n k : ℕ} (hk : k < n) :
    nth (((List.range n).map g).map h) k [] = h (g k) := by
  unfold nth
  rw [List.getD_eq_getElem _ _ (by simpa using hk), List.getElem_map, List.getElem_map, List.getElem_range]

theorem cand_eq (P : Prm) (t : Tube) {cd : List ℕ} (hc : ∀ j < 4, nth cd j 0 < P.verts.length) :
    candPoly (locParts P t) cd = pS (padd (ntP P t (XP P t (nth cd 0 0)))
      (psum [btP P t 0 (XP P t (nth cd 1 0)), btP P t 1 (XP P t (nth cd 2 0)),
        btP P t 3 (XP P t (nth cd 3 0))])) (subP P t) := by
  rw [locParts_eq]
  simp only [candPoly, pSum, List.map_cons, List.map_nil]
  rw [nth_map_map_range (hc 0 (by norm_num)), nth_map_range (show 0 < 4 by norm_num),
    nth_map_range (show 1 < 4 by norm_num), nth_map_range (show 3 < 4 by norm_num),
    nth_map_map_range (hc 1 (by norm_num)), nth_map_map_range (hc 2 (by norm_num)),
    nth_map_map_range (hc 3 (by norm_num))]

/-- The value of `candPoly` with the rotation entries `m` and `|q|² = Nqv`. -/
def candE (P : Prm) (t : Tube) (cd : List ℕ) (m : ℕ → ℝ) (Nqv : ℝ) (x : Fin 5 → ℝ) : ℝ :=
  ((4 * ((P.cden : ℤ) * P.kd) : ℤ) : ℝ) * s3 (fun i => nIv t x i * Xr P m (nth cd 0 0) i)
    + (bE P t x (Xr P m (nth cd 1 0)) 0 + bE P t x (Xr P m (nth cd 2 0)) 1 + bE P t x (Xr P m (nth cd 3 0)) 3)
    - sE P t x Nqv

theorem cand_PV (P : Prm) (t : Tube) (hV : ∀ v j, Len PS (vecGet (nth P.verts v []) j 2)) (hdl : 0 < t.dl)
    {cd : List ℕ} (hc : ∀ j < 4, nth cd j 0 < P.verts.length) {m : ℕ → ℝ}
    (hM : ∀ k < 9, PVN x (nth (MP t) k []) (m k)) {Nqv : ℝ} (hN : PVN x (NqP t) Nqv) :
    PVN x (candPoly (locParts P t) cd) (candE P t cd m Nqv x) := by
  rw [cand_eq P t hc]
  have hX := fun v => XP_val (x := x) P t v (hV v) hM
  exact ((ntP_val P t hdl (hX _)).add (PVN.psum3 (btP_val P t hdl 0 (hX _)) (btP_val P t hdl 1 (hX _))
    (btP_val P t hdl 3 (hX _)))).sub (subP_val P t hdl hN)

/-! ## 5. The value with a rotation -/

/-- The point `n = (tX, tY, 1)` of the tube. -/
def pE (t : Tube) (x : Fin 5 → ℝ) : E3 := !₂[tX t (x 0) (x 1), tY t (x 0) (x 1), 1]

/-- The vertices of the dual bound: `v₀ = cd₀`, `lf = (cd₁, cd₂, ·, cd₃)` (`lf₂` has weight 0). -/
def lfOf (cd : List ℕ) : Fin 4 → ℕ := ![nth cd 1 0, nth cd 2 0, nth cd 1 0, nth cd 3 0]

theorem Xr_rot (P : Prm) (hdv : 0 < P.dv) (R : M3) (Nq : ℝ) (v : ℕ) (i : Fin 3) :
    Xr P (fun k => Nq * OctFar.rN R (k / 3) (k % 3)) v i.val = Nq * P.dv * (mv R (VV (toProb P) v)) i := by
  have hd : (P.dv : ℝ) ≠ 0 := by exact_mod_cast hdv.ne'
  fin_cases i <;>
    simp [Xr, OctFar.rN, mv_apply, Fin.sum_univ_three, VV, FarAccept.vec_apply, FarAccept.ent, toProb] <;>
    field_simp

theorem cand_val_eq (P : Prm) (t : Tube) (hdv : 0 < P.dv) (hkd : 0 < P.kd) (hcd : 0 < P.cden)
    (cd : List ℕ) (R : M3) (Nq : ℝ) (x : Fin 5 → ℝ) :
    candE P t cd (fun k => Nq * OctFar.rN R (k / 3) (k % 3)) Nq x
      = 4 * P.cden * P.kd * t.dl * P.dv * Nq *
        (dualB (toProb P) (pE t x) R (nth cd 0 0) (lfOf cd)
          - kapV P (nth (kapForm P t.side 0) 0 0) (nth (kapForm P t.side 0) 1 0) (nth (kapForm P t.side 0) 2 0)
              (tX t (x 0) (x 1)) (tY t (x 0) (x 1))) := by
  have hkd' : (P.kd : ℝ) ≠ 0 := by exact_mod_cast hkd.ne'
  have hcd' : (P.cden : ℝ) ≠ 0 := by exact_mod_cast hcd.ne'
  have r0 : ∀ v, Xr P (fun k => Nq * OctFar.rN R (k / 3) (k % 3)) v 0
      = Nq * P.dv * (mv R (VV (toProb P) v)) 0 := fun v => Xr_rot P hdv R Nq v 0
  have r1 : ∀ v, Xr P (fun k => Nq * OctFar.rN R (k / 3) (k % 3)) v 1
      = Nq * P.dv * (mv R (VV (toProb P) v)) 1 := fun v => Xr_rot P hdv R Nq v 1
  have r2 : ∀ v, Xr P (fun k => Nq * OctFar.rN R (k / 3) (k % 3)) v 2
      = Nq * P.dv * (mv R (VV (toProb P) v)) 2 := fun v => Xr_rot P hdv R Nq v 2
  simp only [candE, bE, sE, wv, s3, r0, r1, r2]
  simp [nIv, BV, BTOP, nth, dualB, dot, Fin.sum_univ_three, Fin.sum_univ_four, c0r, lfOf, pE, bT, kapV,
    DTBase.toProb_c0, DTBase.toProb_ps, fvalI, -mv_apply]
  field_simp
  ring

theorem getD_mem_or {α : Type*} (l : List α) (i : ℕ) (d : α) : l.getD i d ∈ l ∨ l.getD i d = d := by
  by_cases h : i < l.length
  · left; rw [List.getD_eq_getElem _ _ h]; exact List.getElem_mem h
  · right; exact List.getD_eq_default _ _ (by omega)

/-- The vertex entries are field elements of length 2 (from `WF (toProb P)`). -/
theorem lenV_all {P : Prm} (h0 : dtExtraOk P = true) : ∀ v j, Len PS (vecGet (nth P.verts v []) j 2) := by
  have hwf := toProb_wf h0
  have hl : Len PS (fzero 2) := rfl
  intro v j
  unfold vecGet nth
  rcases getD_mem_or P.verts v [] with hv | hv
  · have hL := hwf.verts _ hv
    rcases getD_mem_or (P.verts.getD v []) j (fzero 2) with hj | hj
    · exact hL.2 _ hj
    · rw [hj]; exact hl
  · rw [hv, List.getD_nil]; exact hl

/-- The components of the centre quaternion are field elements of length 2 (from `tubeWfB`). -/
theorem hq_of {t : Tube} (ht : tubeWfB t = true) : ∀ i, Len PS (nth t.q i fz) := by
  simp only [tubeWfB, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq, List.all_eq_true] at ht
  intro i
  unfold nth
  rcases getD_mem_or t.q i fz with hm | hm
  · have := ht.2 _ hm
    simpa [Len, PS] using this
  · rw [hm]; rfl

theorem dl_of {t : Tube} (ht : tubeWfB t = true) : 0 < t.dl := by
  simp only [tubeWfB, Bool.and_eq_true, decide_eq_true_eq] at ht
  exact ht.1.1.2

/-- **The value of the candidate polynomial** (`cand_valT`). At `x = (u, w, p₁, p₂, p₃)` and a rotation
`R` of `q = qcT t p₁ p₂ p₃` (`Rq(q) = |q|²·R`), `candPoly (locParts P t) cd` has the value
`4·cden·kd·dl·dv·|q|²·(dualB(n, R) − κ_t(n))` with `n = (tX, tY, 1)`. -/
theorem cand_valT {P : Prm} {t : Tube} (h0 : dtExtraOk P = true) (hkd : 0 < P.kd) (ht : tubeWfB t = true)
    {cd : List ℕ} (hc : ∀ j < 4, nth cd j 0 < P.verts.length) (x : Fin 5 → ℝ) {R : M3}
    (hR : QRotT R (qcT t (x 2) (x 3) (x 4))) :
    WFN 5 PS (candPoly (locParts P t) cd) ∧
    pEvalN 5 PS (candPoly (locParts P t) cd) x
      = 4 * P.cden * P.kd * t.dl * P.dv *
        ((qcT t (x 2) (x 3) (x 4)).1 ^ 2 + (qcT t (x 2) (x 3) (x 4)).2.1 ^ 2
          + (qcT t (x 2) (x 3) (x 4)).2.2.1 ^ 2 + (qcT t (x 2) (x 3) (x 4)).2.2.2 ^ 2) *
        (dualB (toProb P) (pE t x) R (nth cd 0 0) (lfOf cd)
          - kapV P (nth (kapForm P t.side 0) 0 0) (nth (kapForm P t.side 0) 1 0) (nth (kapForm P t.side 0) 2 0)
              (tX t (x 0) (x 1)) (tY t (x 0) (x 1))) := by
  have hwf := toProb_wf h0
  have hdl := dl_of ht
  obtain ⟨q0, q1, q2, q3⟩ := Q_val (x := x) t (hq_of ht)
  obtain ⟨hM, hN⟩ := mkM_val q0 q1 q2 q3
  have hM' : ∀ k < 9, PVN x (nth (MP t) k [])
      ((fun k => ((qcT t (x 2) (x 3) (x 4)).1 ^ 2 + (qcT t (x 2) (x 3) (x 4)).2.1 ^ 2
          + (qcT t (x 2) (x 3) (x 4)).2.2.1 ^ 2 + (qcT t (x 2) (x 3) (x 4)).2.2.2 ^ 2)
        * OctFar.rN R (k / 3) (k % 3)) k) :=
    fun k hk => (hM k hk).congr (hR.2 k hk)
  have h := cand_PV P t (lenV_all h0) hdl hc hM' hN
  exact ⟨h.1, h.2.trans (cand_val_eq P t hwf.dv hkd hwf.c0d cd R _ x)⟩

/-- The invariant of the candidate polynomial (for `splitE0_spec`). -/
theorem cand_WF {P : Prm} {t : Tube} (h0 : dtExtraOk P = true) (ht : tubeWfB t = true)
    {cd : List ℕ} (hc : ∀ j < 4, nth cd j 0 < P.verts.length) : WFN 5 PS (candPoly (locParts P t) cd) := by
  obtain ⟨q0, q1, q2, q3⟩ := Q_val (x := (0 : Fin 5 → ℝ)) t (hq_of ht)
  obtain ⟨hM, hN⟩ := mkM_val q0 q1 q2 q3
  exact (cand_PV P t (lenV_all h0) (dl_of ht) hc hM hN).1

#assert_std_axioms PackLean.Formal.DTLocalVal.cand_valT PackLean.Formal.DTLocalVal.cand_WF

/-! ## 6. The weights on the parallelogram (`weightsOk`) -/

open PackLean.D45DT (Rat2 weightsOk)
open PackLean.Formal.DTLocalBox (ratR ratR_neg aff2)

/-- `n·dl·U.den·W.den` at the corner `(u, w) = (U, W)` (the list of `weightsOk`). -/
def nW (t : Tube) (U W : Rat2) : List ℤ :=
  [nth t.p0 0 0 * U.2 * W.2 + U.1 * nth t.d 0 0 * W.2 + W.1 * nth t.w 0 0 * U.2,
   nth t.p0 1 0 * U.2 * W.2 + U.1 * nth t.d 1 0 * W.2 + W.1 * nth t.w 1 0 * U.2,
   (t.dl : Int) * U.2 * W.2]

/-- The integer tested by `weightsOk` at a corner and a face. -/
def sW (t : Tube) (U W : Rat2) (bf : List ℤ) : ℤ :=
  (List.zip (List.zipWith (· - ·) (nth BV BTOP []) bf) (nW t U W)).foldl
    (fun acc (x : Int × Int) => acc + x.1 * x.2) 0

theorem weights_all {t : Tube} (h : weightsOk t = true) :
    ∀ U ∈ [t.ulo, t.uhi], ∀ W ∈ [((-t.r0.1, t.r0.2) : Rat2), t.r0], ∀ bf ∈ BV, 0 ≤ sW t U W bf := by
  intro U hU W hW bf hbf
  simp only [weightsOk, List.all_eq_true, decide_eq_true_eq] at h
  exact h U hU W hW bf hbf

/-- `n·dl·(b₂ − b_f)` at `(u, w)` (real). -/
def Gr (t : Tube) (bf : List ℤ) (u w : ℝ) : ℝ :=
  ((nth (nth BV BTOP []) 0 0 - nth bf 0 0 : ℤ) : ℝ) *
      (((nth t.p0 0 0 : ℤ) : ℝ) + u * ((nth t.d 0 0 : ℤ) : ℝ) + w * ((nth t.w 0 0 : ℤ) : ℝ))
    + ((nth (nth BV BTOP []) 1 0 - nth bf 1 0 : ℤ) : ℝ) *
      (((nth t.p0 1 0 : ℤ) : ℝ) + u * ((nth t.d 1 0 : ℤ) : ℝ) + w * ((nth t.w 1 0 : ℤ) : ℝ))
    + ((nth (nth BV BTOP []) 2 0 - nth bf 2 0 : ℤ) : ℝ) * t.dl

theorem sW_val (t : Tube) (bf : List ℤ) (hbf : bf.length = 3) (U W : Rat2) (hU : 0 < U.2) (hW : 0 < W.2) :
    (sW t U W bf : ℝ) = U.2 * W.2 * Gr t bf (ratR U) (ratR W) := by
  have hU' : (U.2 : ℝ) ≠ 0 := by exact_mod_cast hU.ne'
  have hW' : (W.2 : ℝ) ≠ 0 := by exact_mod_cast hW.ne'
  match bf, hbf with
  | [a, b, c], _ =>
    simp [sW, nW, Gr, BV, BTOP, nth, ratR]
    field_simp

theorem Gr_nonneg {t : Tube} (hw : weightsOk t = true) (ht : tubeWfB t = true) {bf : List ℤ} (hbf : bf ∈ BV)
    {u w : ℝ} (hu1 : ratR t.ulo ≤ u) (hu2 : u ≤ ratR t.uhi) (hw' : |w| ≤ ratR t.r0) : 0 ≤ Gr t bf u w := by
  simp only [tubeWfB, Bool.and_eq_true, decide_eq_true_eq] at ht
  obtain ⟨⟨⟨⟨⟨hlo, hhi⟩, hr0⟩, _⟩, _⟩, _⟩ := ht
  have hlen : bf.length = 3 := by
    simp only [BV, List.mem_cons, List.not_mem_nil, or_false] at hbf
    rcases hbf with rfl | rfl | rfl | rfl <;> rfl
  refine aff2 (Gr t bf) (fun X Y => by simp only [Gr]; ring) ⟨hu1, hu2⟩ (abs_le.1 hw') ?_
  intro a b ha hb
  obtain ⟨U, hU, hUp, rfl⟩ : ∃ U ∈ [t.ulo, t.uhi], 0 < U.2 ∧ a = ratR U := by
    rcases ha with rfl | rfl
    · exact ⟨t.ulo, by simp, hlo, rfl⟩
    · exact ⟨t.uhi, by simp, hhi, rfl⟩
  obtain ⟨W, hW, hWp, rfl⟩ : ∃ W ∈ [((-t.r0.1, t.r0.2) : Rat2), t.r0], 0 < W.2 ∧ b = ratR W := by
    rcases hb with rfl | rfl
    · exact ⟨(-t.r0.1, t.r0.2), by simp, hr0, by rw [ratR_neg]⟩
    · exact ⟨t.r0, by simp, hr0, rfl⟩
  have h1 := weights_all hw U hU W hW bf hbf
  have h2 := sW_val t bf hlen U W hUp hWp
  have hk : (0 : ℝ) < U.2 * W.2 := by positivity
  have h3 : (0 : ℝ) ≤ U.2 * W.2 * Gr t bf (ratR U) (ratR W) := by
    rw [← h2]; exact_mod_cast h1
  exact (mul_nonneg_iff_of_pos_left hk).1 h3

/-- **The weights** (`weightsOk`): on the parallelogram of the tube, `n·b_f ≤ n·b₂` for every face
(the left branch of `Low` with `μ = n·b₂`). -/
theorem weights_spec {t : Tube} (hw : weightsOk t = true) (ht : tubeWfB t = true) {u w : ℝ}
    (hu1 : ratR t.ulo ≤ u) (hu2 : u ≤ ratR t.uhi) (hw' : |w| ≤ ratR t.r0) (f : Fin 4) :
    dot !₂[tX t u w, tY t u w, 1] (bT f) ≤ dot !₂[tX t u w, tY t u w, 1] (bT 2) := by
  have hdl := dl_of ht
  have hd : (t.dl : ℝ) ≠ 0 := by exact_mod_cast hdl.ne'
  have hdl' : (0 : ℝ) < t.dl := by exact_mod_cast hdl
  have hmem : nth BV f.val [] ∈ BV := by fin_cases f <;> decide
  have hG := Gr_nonneg hw ht hmem hu1 hu2 hw'
  have e : (t.dl : ℝ) * (dot !₂[tX t u w, tY t u w, 1] (bT 2) - dot !₂[tX t u w, tY t u w, 1] (bT f))
      = Gr t (nth BV f.val []) u w := by
    fin_cases f <;> simp [dot, Fin.sum_univ_three, bT, BV, BTOP, nth, Gr, tX, tY] <;> field_simp <;> ring
  rw [← e] at hG
  have := (mul_nonneg_iff_of_pos_left hdl').1 hG
  linarith

#assert_std_axioms PackLean.Formal.DTLocalVal.weights_spec

end

end PackLean.Formal.DTLocalVal
