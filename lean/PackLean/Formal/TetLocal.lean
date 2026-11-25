import PackLean.Formal.TetLocalPoly
import PackLean.Formal.TetCover

/-!
# A9 stage 7b-3 (part 3): the local hypothesis `TetCover.HLoc` from `localRegionOk`

The local check of `D28.Core` builds, for each candidate `(v0, v_f …)`, the polynomial
`G_c(z) = candPQ` in `z = (ξ, y, p₁, p₂, p₃)` (`n = (x* + ξ, y, 1)`, quaternion `q` with `1` in the
chart and `center + p` elsewhere).  Here:

* `cand_val`: the value of `candPQ` is `N(q) · (dualB − β y)` with `Rq(q) = N(q) · R`;
* `local_low`: a point of a local box with `G_c ≥ 0` gives `Low … (β y)`;
* `hloc_of`: `localRegionOk` for every local region (and `rangesOk`, the extra checks `locExtraOk`)
  gives `TetCover.HLoc P`.
-/

namespace PackLean.Formal.TetLocal

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fone fIsZero fmul Mono Poly padd psum pmul
  psmulZ psmulF nth zeroMono constTerm PQ QF Prob Region LocalParts localParts candPQ identOk
  localRegionOk rangesOk nInsideL rInsideL NBox RBox nboxWf rboxWf vecGet LTok ratLe)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolySem5 PackLean.Formal.TetLocalPoly
  PackLean.Formal.FarAccept PackLean.Formal.QuadSem PackLean.Formal.PolyLP
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.TetFar (WF VV dualB c0r betar nx ny)
open PackLean.Formal.TetSep (bT)
open PackLean.Formal.TetReduction (Low)
open scoped Matrix

noncomputable section

/-! ## 1. The pieces of `localParts` (copied) -/

section Pieces

variable (P : Prob) (rg : Region)

def oneL : PQ := PQ.const P.nb (QF.ofInt P.nb 1)

def usL : List PQ := (List.range 3).map (fun i =>
  PQ.add (PQ.const P.nb (nth rg.center i (QF.ofInt P.nb 0))) (PQ.var P.nb (2 + i)))

def qL : List PQ := match rg.ch with
  | 0 => oneL P :: usL P rg
  | 1 => [nth (usL P rg) 0 (oneL P), oneL P, nth (usL P rg) 1 (oneL P), nth (usL P rg) 2 (oneL P)]
  | 2 => [nth (usL P rg) 0 (oneL P), nth (usL P rg) 1 (oneL P), oneL P, nth (usL P rg) 2 (oneL P)]
  | _ => usL P rg ++ [oneL P]

def negL (a : PQ) : PQ := PQ.scale P.ps (QF.ofInt P.nb (-1)) a
def subL (a b : PQ) : PQ := PQ.add a (negL P b)
def twoL (a : PQ) : PQ := PQ.scale P.ps (QF.ofInt P.nb 2) a

def RqOf (w x y z : PQ) : List PQ :=
  let mul := PQ.mul P.ps
  let ww := mul w w; let xx := mul x x; let yy := mul y y; let zz := mul z z
  [subL P (subL P (PQ.add ww xx) yy) zz, twoL P (subL P (mul x y) (mul w z)),
   twoL P (PQ.add (mul x z) (mul w y)),
   twoL P (PQ.add (mul x y) (mul w z)), subL P (subL P (PQ.add ww yy) xx) zz,
   twoL P (subL P (mul y z) (mul w x)),
   twoL P (subL P (mul x z) (mul w y)), twoL P (PQ.add (mul y z) (mul w x)),
   subL P (subL P (PQ.add ww zz) xx) yy]

def NOf (w x y z : PQ) : PQ :=
  let mul := PQ.mul P.ps
  PQ.add (PQ.add (mul w w) (mul x x)) (PQ.add (mul y y) (mul z z))

def RqL : List PQ := RqOf P (nth (qL P rg) 0 (oneL P)) (nth (qL P rg) 1 (oneL P)) (nth (qL P rg) 2 (oneL P))
  (nth (qL P rg) 3 (oneL P))
def NL : PQ := NOf P (nth (qL P rg) 0 (oneL P)) (nth (qL P rg) 1 (oneL P)) (nth (qL P rg) 2 (oneL P))
  (nth (qL P rg) 3 (oneL P))

def nL : List PQ := [PQ.add (PQ.const P.nb P.astar) (PQ.var P.nb 0), PQ.var P.nb 1, oneL P]
def vQ (v : Nat) (j : Nat) : QF := ⟨vecGet (nth P.verts v []) j P.nb, P.dv⟩
def bQ (f i : Nat) : QF := QF.ofInt P.nb (nth (nth P.bvec f []) i 0)

def formL (a : List PQ) (v : Nat) : PQ :=
  (List.range 3).foldl (fun acc i =>
    (List.range 3).foldl (fun acc2 kk =>
      PQ.add acc2 (PQ.mul P.ps (nth a i (oneL P)) (PQ.scale P.ps (vQ P v kk) (nth (RqL P rg) (3 * i + kk) (oneL P)))))
      acc) ⟨[], 1⟩

def wFL (f : Nat) : PQ := (List.range 3).foldl (fun acc i =>
  PQ.add acc (PQ.scale P.ps (QF.sub (bQ P P.btop i) (bQ P f i)) (nth (nL P) i (oneL P)))) ⟨[], 1⟩

def mL : PQ := (List.range 3).foldl (fun acc i =>
  PQ.add acc (PQ.scale P.ps (bQ P P.btop i) (nth (nL P) i (oneL P)))) ⟨[], 1⟩

def bconstL (f : Nat) : List PQ := (List.range 3).map (fun i => PQ.const P.nb (bQ P f i))

theorem localParts_eq : localParts P rg =
    { compV0 := (List.range P.verts.length).map (fun v => formL P rg (nL P) v)
      compF := (List.range 4).map (fun f => (List.range P.verts.length).map (fun v =>
        PQ.scale P.ps (QF.ofRat P.nb 1 4) (PQ.mul P.ps (wFL P f) (formL P rg (bconstL P f) v))))
      const := negL P (PQ.mul P.ps (PQ.add (PQ.scale P.ps P.c0 (mL P))
        (PQ.scale P.ps P.beta (nth (nL P) 1 (oneL P)))) (NL P rg)) } := rfl

end Pieces


/-! ## 2. Values of the pieces -/

section Values

variable {P : Prob} {rg : Region} (x : Fin 5 → ℝ)

theorem pqv_congr {A : PQ} {v w : ℝ} (h : PQv P.ps x A v) (e : v = w) : PQv P.ps x A w := e ▸ h

theorem qv_ofInt (hnb : P.nb = 2 ^ P.ps.length) (c : ℤ) : qv P.ps (QF.ofInt P.nb c) = c := by
  simp [qv, QF.ofInt, hnb, fval_fofInt]

theorem len_ofInt (hnb : P.nb = 2 ^ P.ps.length) (c : ℤ) : Len P.ps (QF.ofInt P.nb c).num := by
  simp only [QF.ofInt, hnb]; exact len_fofInt _ _

theorem pqv_scaleInt (hnb : P.nb = 2 ^ P.ps.length) (c : ℤ) {A : PQ} {a : ℝ} (hA : PQv P.ps x A a) :
    PQv P.ps x (PQ.scale P.ps (QF.ofInt P.nb c) A) (c * a) := by
  have := pqv_scale x (len_ofInt hnb c) (by simp [QF.ofInt]) hA
  rwa [qv_ofInt hnb] at this

theorem pqv_neg (hnb : P.nb = 2 ^ P.ps.length) {A : PQ} {a : ℝ} (hA : PQv P.ps x A a) :
    PQv P.ps x (negL P A) (-a) := pqv_congr x (pqv_scaleInt x hnb (-1) hA) (by push_cast; ring)

theorem pqv_sub (hnb : P.nb = 2 ^ P.ps.length) {A B : PQ} {a b : ℝ} (hA : PQv P.ps x A a)
    (hB : PQv P.ps x B b) : PQv P.ps x (subL P A B) (a - b) :=
  pqv_congr x (pqv_add x hA (pqv_neg x hnb hB)) (by ring)

theorem pqv_two (hnb : P.nb = 2 ^ P.ps.length) {A : PQ} {a : ℝ} (hA : PQv P.ps x A a) :
    PQv P.ps x (twoL P A) (2 * a) := pqv_congr x (pqv_scaleInt x hnb 2 hA) (by push_cast; ring)

theorem pqv_one (hnb : P.nb = 2 ^ P.ps.length) : PQv P.ps x (oneL P) 1 := by
  have := pqv_const x P.nb (len_ofInt hnb 1) (by simp [QF.ofInt])
  rwa [qv_ofInt hnb, Int.cast_one] at this

theorem pqv_var' (hnb : P.nb = 2 ^ P.ps.length) (i : ℕ) (hi : i < 5) :
    PQv P.ps x (PQ.var P.nb i) (x ⟨i, hi⟩) := by
  rw [hnb]; exact pqv_var x i hi

/-- The rotation entries and `N` of a quaternion of pairs. -/
theorem rq_val (hnb : P.nb = 2 ^ P.ps.length) {w y1 y2 y3 : PQ} {W Y1 Y2 Y3 : ℝ}
    (hw : PQv P.ps x w W) (h1 : PQv P.ps x y1 Y1) (h2 : PQv P.ps x y2 Y2) (h3 : PQv P.ps x y3 Y3) :
    (∀ t < 9, PQv P.ps x (nth (RqOf P w y1 y2 y3) t (oneL P)) ((rqList W Y1 Y2 Y3).getD t 0)) ∧
    PQv P.ps x (NOf P w y1 y2 y3) (W ^ 2 + Y1 ^ 2 + Y2 ^ 2 + Y3 ^ 2) := by
  have m := fun {A B : PQ} {a b : ℝ} (hA : PQv P.ps x A a) (hB : PQv P.ps x B b) => pqv_mul x hA hB
  have s := fun {A B : PQ} {a b : ℝ} (hA : PQv P.ps x A a) (hB : PQv P.ps x B b) => pqv_sub x hnb hA hB
  have ad := fun {A B : PQ} {a b : ℝ} (hA : PQv P.ps x A a) (hB : PQv P.ps x B b) => pqv_add x hA hB
  have tw := fun {A : PQ} {a : ℝ} (hA : PQv P.ps x A a) => pqv_two x hnb hA
  refine ⟨fun t ht => ?_, pqv_congr x (ad (ad (m hw hw) (m h1 h1)) (ad (m h2 h2) (m h3 h3))) (by ring)⟩
  interval_cases t <;> simp only [RqOf, nth, List.getD_cons_zero, List.getD_cons_succ, rqList]
  · exact pqv_congr x (s (s (ad (m hw hw) (m h1 h1)) (m h2 h2)) (m h3 h3)) (by ring)
  · exact pqv_congr x (tw (s (m h1 h2) (m hw h3))) (by ring)
  · exact pqv_congr x (tw (ad (m h1 h3) (m hw h2))) (by ring)
  · exact pqv_congr x (tw (ad (m h1 h2) (m hw h3))) (by ring)
  · exact pqv_congr x (s (s (ad (m hw hw) (m h2 h2)) (m h1 h1)) (m h3 h3)) (by ring)
  · exact pqv_congr x (tw (s (m h2 h3) (m hw h1))) (by ring)
  · exact pqv_congr x (tw (s (m h1 h3) (m hw h2))) (by ring)
  · exact pqv_congr x (tw (ad (m h2 h3) (m hw h1))) (by ring)
  · exact pqv_congr x (s (s (ad (m hw hw) (m h3 h3)) (m h1 h1)) (m h2 h2)) (by ring)

/-- A fold of sums. -/
theorem pqv_foldl {α : Type} (F : α → PQ) (V : α → ℝ) :
    ∀ (l : List α) (A : PQ) (a : ℝ), PQv P.ps x A a → (∀ t ∈ l, PQv P.ps x (F t) (V t)) →
      PQv P.ps x (l.foldl (fun acc t => PQ.add acc (F t)) A) (a + (l.map V).sum) := by
  intro l
  induction l with
  | nil => intro A a hA _; simpa using hA
  | cons t l ih =>
    intro A a hA hl
    rw [List.foldl_cons]
    refine pqv_congr x (ih _ _ (pqv_add x hA (hl t (by simp))) (fun s hs => hl s (by simp [hs])))
      (by simp; ring)

/-- A fold of folds of sums (the shape of `formL`). -/
theorem pqv_foldl2 (F : ℕ → ℕ → PQ) (V : ℕ → ℕ → ℝ) (m : List ℕ) :
    ∀ (l : List ℕ) (A : PQ) (a : ℝ), PQv P.ps x A a → (∀ i ∈ l, ∀ k ∈ m, PQv P.ps x (F i k) (V i k)) →
      PQv P.ps x (l.foldl (fun acc i => m.foldl (fun acc2 k => PQ.add acc2 (F i k)) acc) A)
        (a + (l.map (fun i => (m.map (V i)).sum)).sum) := by
  intro l
  induction l with
  | nil => intro A a hA _; simpa using hA
  | cons i l ih =>
    intro A a hA hl
    rw [List.foldl_cons]
    have h1 := pqv_foldl x (F i) (V i) m A a hA (fun k hk => hl i (by simp) k hk)
    refine pqv_congr x (ih _ _ h1 (fun j hj k hk => hl j (by simp [hj]) k hk)) (by simp; ring)

end Values


/-! ## 3. The values of `localParts` -/

/-- The data of a local region are well formed (lengths, positive denominators). -/
structure RegWF (P : Prob) (rg : Region) : Prop where
  clen : rg.center.length = 3
  cen : ∀ c ∈ rg.center, Len P.ps c.num ∧ 0 < c.den
  astar : Len P.ps P.astar.num
  astard : 0 < P.astar.den

section Values2

variable {P : Prob} {rg : Region} (x : Fin 5 → ℝ)

/-- The center of the region, coordinate `i`. -/
def cv (P : Prob) (rg : Region) (i : ℕ) : ℝ := qv P.ps (nth rg.center i (QF.ofInt P.nb 0))

/-- The quaternion of the local point (`1` in the chart). -/
def Qv (P : Prob) (rg : Region) (x : Fin 5 → ℝ) : List ℝ :=
  chq rg.ch 1 (cv P rg 0 + x 2) (cv P rg 1 + x 3) (cv P rg 2 + x 4)

theorem nth_range_map {α : Type*} (f : ℕ → α) {n i : ℕ} (hi : i < n) (d : α) :
    nth ((List.range n).map f) i d = f i := by
  unfold nth
  rw [List.getD_eq_getElem _ _ (by simpa using hi)]
  simp

theorem cen_mem (hr : RegWF P rg) {i : ℕ} (hi : i < 3) :
    Len P.ps (nth rg.center i (QF.ofInt P.nb 0)).num ∧ 0 < (nth rg.center i (QF.ofInt P.nb 0)).den := by
  apply hr.cen
  unfold nth; rw [List.getD_eq_getElem _ _ (by rw [hr.clen]; exact hi)]; exact List.getElem_mem _

theorem us_val (hwf : WF P) (hr : RegWF P rg) (i : ℕ) (hi : i < 3) :
    PQv P.ps x (nth (usL P rg) i (oneL P)) (cv P rg i + x ⟨2 + i, by omega⟩) := by
  rw [usL, nth_range_map _ hi]
  exact pqv_add x (pqv_const x _ (cen_mem hr hi).1 (cen_mem hr hi).2) (pqv_var' x hwf.nb _ _)

theorem q_val (hwf : WF P) (hr : RegWF P rg) (j : ℕ) (hj : j < 4) :
    PQv P.ps x (nth (qL P rg) j (oneL P)) ((Qv P rg x).getD j 0) := by
  have u0 := us_val x hwf hr 0 (by norm_num)
  have u1 := us_val x hwf hr 1 (by norm_num)
  have u2 := us_val x hwf hr 2 (by norm_num)
  have o := pqv_one x hwf.nb
  have hl : usL P rg = [nth (usL P rg) 0 (oneL P), nth (usL P rg) 1 (oneL P), nth (usL P rg) 2 (oneL P)] := by
    simp [usL, nth, show List.range 3 = [0, 1, 2] from rfl]
  unfold qL Qv
  rcases h : rg.ch with _ | _ | _ | c
  · rw [hl]; interval_cases j <;> first | simpa [nth, chq] using u0 | simpa [nth, chq] using u1 | simpa [nth, chq] using u2 | simpa [nth, chq] using o
  · interval_cases j <;> first | simpa [nth, chq] using u0 | simpa [nth, chq] using u1 | simpa [nth, chq] using u2 | simpa [nth, chq] using o
  · interval_cases j <;> first | simpa [nth, chq] using u0 | simpa [nth, chq] using u1 | simpa [nth, chq] using u2 | simpa [nth, chq] using o
  · rw [hl]; interval_cases j <;> first | simpa [nth, chq] using u0 | simpa [nth, chq] using u1 | simpa [nth, chq] using u2 | simpa [nth, chq] using o

theorem n_val (hwf : WF P) (hr : RegWF P rg) :
    PQv P.ps x (nth (nL P) 0 (oneL P)) (qv P.ps P.astar + x 0) ∧ PQv P.ps x (nth (nL P) 1 (oneL P)) (x 1) ∧
    PQv P.ps x (nth (nL P) 2 (oneL P)) 1 := by
  refine ⟨?_, ?_, ?_⟩
  · exact pqv_add x (pqv_const x _ hr.astar hr.astard) (pqv_var' x hwf.nb 0 (by norm_num))
  · exact pqv_var' x hwf.nb 1 (by norm_num)
  · exact pqv_one x hwf.nb

theorem qv_vQ (hwf : WF P) (v k : ℕ) :
    Len P.ps (vQ P v k).num ∧ 0 < (vQ P v k).den ∧ qv P.ps (vQ P v k) = VV P v ⟨k % 3, Nat.mod_lt _ (by norm_num)⟩ ∨ 3 ≤ k := by
  rcases lt_or_ge k 3 with hk | hk
  · left
    refine ⟨len_get hwf.nb hwf.verts v k, hwf.dv, ?_⟩
    simp only [qv, vQ, VV, vec_apply, ent, Nat.mod_eq_of_lt hk]
  · right; exact hk

theorem bQ_len (hwf : WF P) (f i : ℕ) : Len P.ps (bQ P f i).num ∧ (bQ P f i).den = 1 :=
  ⟨len_ofInt hwf.nb _, rfl⟩

theorem qv_bQ (hwf : WF P) (f i : ℕ) : qv P.ps (bQ P f i) = (nth (nth P.bvec f []) i 0 : ℤ) :=
  qv_ofInt hwf.nb _

theorem qv_sub' {ps : List ℕ} {a b : QF} (ha : Len ps a.num) (hb : Len ps b.num) (had : 0 < a.den)
    (hbd : 0 < b.den) : qv ps (QF.sub a b) = qv ps a - qv ps b := by
  simp only [qv, QF.sub]
  rw [fval_fsub (len_fsmul _ ha) (len_fsmul _ hb), fval_fsmul, fval_fsmul]
  have : (0 : ℝ) < a.den := by exact_mod_cast had
  have : (0 : ℝ) < b.den := by exact_mod_cast hbd
  push_cast
  field_simp

/-- The values of `formL a v`: `Σ_i a_i Σ_k V_k Rq_{3i+k}`. -/
theorem form_val (hwf : WF P) {a : List PQ} {Av : ℕ → ℝ} (ha : ∀ i < 3, PQv P.ps x (nth a i (oneL P)) (Av i))
    {Rv : ℕ → ℝ} (hR : ∀ t < 9, PQv P.ps x (nth (RqL P rg) t (oneL P)) (Rv t)) (v : ℕ) :
    PQv P.ps x (formL P rg a v) (((List.range 3).map (fun i => ((List.range 3).map (fun k =>
      Av i * (qv P.ps (vQ P v k) * Rv (3 * i + k)))).sum)).sum) := by
  unfold formL
  have h := pqv_foldl2 x (fun i k => PQ.mul P.ps (nth a i (oneL P)) (PQ.scale P.ps (vQ P v k)
      (nth (RqL P rg) (3 * i + k) (oneL P))))
    (fun i k => Av i * (qv P.ps (vQ P v k) * Rv (3 * i + k))) (List.range 3) (List.range 3) ⟨[], 1⟩ 0
    (pqv_zero x) (by
      intro i hi k hk
      simp only [List.mem_range] at hi hk
      rcases qv_vQ hwf v k with ⟨hl, hd, _⟩ | h3
      · exact pqv_mul x (ha i hi) (pqv_scale x hl hd (hR _ (by omega)))
      · omega)
  simpa using h

theorem wF_val (hwf : WF P) (hr : RegWF P rg) (f : ℕ) :
    PQv P.ps x (wFL P f) (((List.range 3).map (fun i =>
      ((nth (nth P.bvec P.btop []) i 0 : ℤ) - (nth (nth P.bvec f []) i 0 : ℤ) : ℝ) *
        ![qv P.ps P.astar + x 0, x 1, 1] ⟨i % 3, Nat.mod_lt _ (by norm_num)⟩)).sum) := by
  obtain ⟨n0, n1, n2⟩ := n_val x hwf hr
  unfold wFL
  have h := pqv_foldl x (fun i => PQ.scale P.ps (QF.sub (bQ P P.btop i) (bQ P f i)) (nth (nL P) i (oneL P)))
    (fun i => ((nth (nth P.bvec P.btop []) i 0 : ℤ) - (nth (nth P.bvec f []) i 0 : ℤ) : ℝ) *
        ![qv P.ps P.astar + x 0, x 1, 1] ⟨i % 3, Nat.mod_lt _ (by norm_num)⟩) (List.range 3) ⟨[], 1⟩ 0
    (pqv_zero x) (by
      intro i hi
      simp only [List.mem_range] at hi
      have hs : Len P.ps (QF.sub (bQ P P.btop i) (bQ P f i)).num :=
        len_fsub (len_fsmul _ (bQ_len hwf _ _).1) (len_fsmul _ (bQ_len hwf _ _).1)
      have hsd : 0 < (QF.sub (bQ P P.btop i) (bQ P f i)).den := by simp [QF.sub, bQ, QF.ofInt]
      have hq := pqv_scale x hs hsd (show PQv P.ps x (nth (nL P) i (oneL P))
          (![qv P.ps P.astar + x 0, x 1, 1] ⟨i % 3, Nat.mod_lt _ (by norm_num)⟩) by
        interval_cases i <;> first | simpa using n0 | simpa using n1 | simpa using n2)
      rw [qv_sub' (bQ_len hwf _ _).1 (bQ_len hwf _ _).1 (by simp [bQ, QF.ofInt]) (by simp [bQ, QF.ofInt]),
        qv_bQ hwf, qv_bQ hwf] at hq
      exact hq)
  simpa using h

theorem m_val (hwf : WF P) (hr : RegWF P rg) :
    PQv P.ps x (mL P) (((List.range 3).map (fun i => ((nth (nth P.bvec P.btop []) i 0 : ℤ) : ℝ) *
        ![qv P.ps P.astar + x 0, x 1, 1] ⟨i % 3, Nat.mod_lt _ (by norm_num)⟩)).sum) := by
  obtain ⟨n0, n1, n2⟩ := n_val x hwf hr
  unfold mL
  have h := pqv_foldl x (fun i => PQ.scale P.ps (bQ P P.btop i) (nth (nL P) i (oneL P)))
    (fun i => ((nth (nth P.bvec P.btop []) i 0 : ℤ) : ℝ) *
        ![qv P.ps P.astar + x 0, x 1, 1] ⟨i % 3, Nat.mod_lt _ (by norm_num)⟩) (List.range 3) ⟨[], 1⟩ 0
    (pqv_zero x) (by
      intro i hi
      simp only [List.mem_range] at hi
      have hq := pqv_scale x (bQ_len hwf P.btop i).1 (by simp [bQ, QF.ofInt])
        (show PQv P.ps x (nth (nL P) i (oneL P))
          (![qv P.ps P.astar + x 0, x 1, 1] ⟨i % 3, Nat.mod_lt _ (by norm_num)⟩) by
        interval_cases i <;> first | simpa using n0 | simpa using n1 | simpa using n2)
      rwa [qv_bQ hwf] at hq)
  simpa using h

theorem bconst_val (hwf : WF P) (f i : ℕ) (hi : i < 3) :
    PQv P.ps x (nth (bconstL P f) i (oneL P)) ((nth (nth P.bvec f []) i 0 : ℤ) : ℝ) := by
  rw [bconstL, nth_range_map _ hi]
  have := pqv_const x P.nb (bQ_len hwf f i).1 (by simp [bQ, QF.ofInt])
  rwa [qv_bQ hwf] at this

end Values2


/-! ## 4. The value of a candidate -/

section Cand

variable {P : Prob} {rg : Region} (x : Fin 5 → ℝ)

/-- **The value of `candPQ`** (faces `[0, 1, 3]`, candidate `[a, b, c, d]`): `N · (dualB − β y)`, where the
rotation entries of the local quaternion are `Rq = N · R`. -/
theorem cand_val (hwf : WF P) (hr : RegWF P rg) {a b c d : ℕ} (ha : a < P.verts.length)
    (hb : b < P.verts.length) (hc : c < P.verts.length) (hd : d < P.verts.length)
    {Rv : ℕ → ℝ} (hR : ∀ t < 9, PQv P.ps x (nth (RqL P rg) t (oneL P)) (Rv t)) {Nv : ℝ}
    (hN : PQv P.ps x (NL P rg) Nv) {R : M3} (hRR : ∀ i j : Fin 3, Rv (3 * i.val + j.val) = Nv * R i j) :
    PQv P.ps x (candPQ (localParts P rg) [0, 1, 3] [a, b, c, d])
      (Nv * (dualB P !₂[qv P.ps P.astar + x 0, x 1, 1] R a ![b, c, a, d] - betar P * x 1)) := by
  obtain ⟨n0, n1, n2⟩ := n_val x hwf hr
  have hnv : ∀ i < 3, PQv P.ps x (nth (nL P) i (oneL P))
      (![qv P.ps P.astar + x 0, x 1, 1] ⟨i % 3, Nat.mod_lt _ (by norm_num)⟩) := by
    intro i hi; interval_cases i <;> first | simpa using n0 | simpa using n1 | simpa using n2
  have hV0 := form_val x hwf hnv hR a
  have hF := fun f v =>
    pqv_scale (c := QF.ofRat P.nb 1 4) x (len_ofInt hwf.nb 1) (by norm_num [QF.ofRat])
      (pqv_mul x (wF_val x hwf hr f) (form_val x hwf (fun i hi => bconst_val x hwf f i hi) hR v))
  have hC := pqv_neg x hwf.nb (pqv_mul x (pqv_add x (pqv_scale x hwf.c0 hwf.c0d (m_val x hwf hr))
    (pqv_scale x hwf.beta hwf.bd n1)) hN)
  rw [localParts_eq]
  simp only [candPQ, List.drop_succ_cons, List.drop_zero, List.zip_cons_cons, List.zip_nil_left,
    List.foldl_cons, List.foldl_nil, List.headD_cons]
  rw [nth_range_map _ ha, nth_range_map _ (show 0 < 4 by norm_num), nth_range_map _ hb,
    nth_range_map _ (show 1 < 4 by norm_num), nth_range_map _ hc, nth_range_map _ (show 3 < 4 by norm_num),
    nth_range_map _ hd]
  refine pqv_congr x (pqv_add x (pqv_add x (pqv_add x (pqv_add x hC hV0) (hF 0 b)) (hF 1 c)) (hF 3 d)) ?_
  have e00 : Rv 0 = Nv * R 0 0 := hRR 0 0
  have e01 : Rv 1 = Nv * R 0 1 := hRR 0 1
  have e02 : Rv 2 = Nv * R 0 2 := hRR 0 2
  have e10 : Rv 3 = Nv * R 1 0 := hRR 1 0
  have e11 : Rv 4 = Nv * R 1 1 := hRR 1 1
  have e12 : Rv 5 = Nv * R 1 2 := hRR 1 2
  have e20 : Rv 6 = Nv * R 2 0 := hRR 2 0
  have e21 : Rv 7 = Nv * R 2 1 := hRR 2 1
  have e22 : Rv 8 = Nv * R 2 2 := hRR 2 2
  simp only [show List.range 3 = [0, 1, 2] from rfl, List.map_cons, List.map_nil, List.sum_cons,
    List.sum_nil, hwf.bvec, hwf.btop, nth, List.getD_cons_zero, List.getD_cons_succ, Nat.reduceMul,
    Nat.reduceAdd, e00, e01, e02, e10, e11, e12, e20, e21, e22]
  simp only [dualB, VV, vec_apply, ent, dot, mv_apply, Fin.sum_univ_three, Fin.sum_univ_four, bT,
    c0r, betar, qv, vQ, QF.ofRat, fval_fofInt, hwf.nb]
  simp
  ring

end Cand


/-! ## 5. The chart and the comparisons -/

/-- The quaternion `chq ch 1 (u / den)` of a chart point: `Rq = N · R` with `N > 0`. -/
theorem chart_rq {R : M3} {den : ℝ} (hden : 0 < den) {ch : ℕ} {u : Fin 3 → ℝ}
    (hc : Charts.ChartPt R den ch u) :
    ∃ Nv : ℝ, 0 < Nv ∧
      (chq ch 1 (u 0 / den) (u 1 / den) (u 2 / den)).getD 0 0 ^ 2 +
        (chq ch 1 (u 0 / den) (u 1 / den) (u 2 / den)).getD 1 0 ^ 2 +
        (chq ch 1 (u 0 / den) (u 1 / den) (u 2 / den)).getD 2 0 ^ 2 +
        (chq ch 1 (u 0 / den) (u 1 / den) (u 2 / den)).getD 3 0 ^ 2 = Nv ∧
      ∀ i j : Fin 3, (rqList ((chq ch 1 (u 0 / den) (u 1 / den) (u 2 / den)).getD 0 0)
        ((chq ch 1 (u 0 / den) (u 1 / den) (u 2 / den)).getD 1 0)
        ((chq ch 1 (u 0 / den) (u 1 / den) (u 2 / den)).getD 2 0)
        ((chq ch 1 (u 0 / den) (u 1 / den) (u 2 / den)).getD 3 0)).getD (3 * i.val + j.val) 0
          = Nv * R i j := by
  obtain ⟨_, hN, hl⟩ := hc
  set q := chq ch den (u 0) (u 1) (u 2) with hq
  set k := 1 / den with hk
  have hne : den ≠ 0 := hden.ne'
  have hQ : ∀ t, (chq ch 1 (u 0 / den) (u 1 / den) (u 2 / den)).getD t 0 = k * q.getD t 0 := by
    intro t
    have h1 : (1 : ℝ) = k * den := by rw [hk]; field_simp
    have hu : ∀ a : ℝ, a / den = k * a := fun a => by rw [hk]; ring
    rw [hq]
    rcases ch with _ | _ | _ | c <;>
      (rcases t with _ | _ | _ | _ | t <;> simp [chq, hu, ← h1])
  simp only [hQ]
  refine ⟨k ^ 2 * (q.getD 0 0 ^ 2 + q.getD 1 0 ^ 2 + q.getD 2 0 ^ 2 + q.getD 3 0 ^ 2),
    by positivity, by ring, fun i j => ?_⟩
  rw [Charts.rqList_smul, hl]
  fin_cases i <;> fin_cases j <;> simp <;> ring

theorem sgn_nonneg {r : ℝ} (h : 0 ≤ sgn r) : 0 ≤ r := by
  unfold sgn at h
  split_ifs at h with h1 h2
  · exact h1.le
  · norm_num at h
  · linarith [not_lt.1 h1]

/-- `QF.le` means `≤` of the values. -/
theorem qf_le {ps : List ℕ} (hpos : ∀ p ∈ ps, 0 < p) {a b : QF} (ha : Len ps a.num)
    (hb : Len ps b.num) (had : 0 < a.den) (hbd : 0 < b.den) (h : QF.le ps a b = true) :
    qv ps a ≤ qv ps b := by
  simp only [QF.le, QF.sign, QF.sub, ge_iff_le, decide_eq_true_eq] at h
  have hl := len_fsub (len_fsmul (a.den : ℤ) hb) (len_fsmul (b.den : ℤ) ha)
  rw [fsign_spec ps hpos _ hl] at h
  have h0 := sgn_nonneg h
  rw [fval_fsub (len_fsmul _ hb) (len_fsmul _ ha), fval_fsmul, fval_fsmul] at h0
  unfold qv
  have : (0 : ℝ) < a.den := by exact_mod_cast had
  have : (0 : ℝ) < b.den := by exact_mod_cast hbd
  rw [div_le_div_iff₀ (by assumption) (by assumption)]
  push_cast at h0
  linarith

theorem qv_add {ps : List ℕ} {a b : QF} (ha : Len ps a.num) (hb : Len ps b.num) (had : 0 < a.den)
    (hbd : 0 < b.den) : qv ps (QF.add a b) = qv ps a + qv ps b := by
  simp only [qv, QF.add]
  rw [fval_fadd (len_fsmul _ ha) (len_fsmul _ hb), fval_fsmul, fval_fsmul]
  have : (0 : ℝ) < a.den := by exact_mod_cast had
  have : (0 : ℝ) < b.den := by exact_mod_cast hbd
  push_cast
  field_simp

theorem qv_mul {ps : List ℕ} {a b : QF} (ha : Len ps a.num) (hb : Len ps b.num) :
    qv ps (QF.mul ps a b) = qv ps a * qv ps b := by
  simp only [qv, QF.mul, fval_fmul ha hb]
  push_cast
  rw [mul_div_mul_comm]

theorem qv_ofRat (ps : List ℕ) (n : ℤ) (d : ℕ) : qv ps (QF.ofRat (2 ^ ps.length) n d) = (n : ℝ) / d := by
  simp only [qv, QF.ofRat, fval_fofInt]

theorem len_add {ps : List ℕ} {a b : QF} (ha : Len ps a.num) (hb : Len ps b.num) : Len ps (QF.add a b).num :=
  len_fadd (len_fsmul _ ha) (len_fsmul _ hb)

theorem len_mul {ps : List ℕ} {a b : QF} (ha : Len ps a.num) (hb : Len ps b.num) :
    Len ps (QF.mul ps a b).num := len_fmul ha hb

/-- A rational element (`ratOk`) has the value of its head. -/
theorem qv_rat {ps : List ℕ} {a : QF} (ha : Len ps a.num) (h : ratOk a = true) : qv ps a = ratv (qr a) := by
  unfold qv ratv qr
  rw [fval_head ps a.num ha]
  intro y hy
  simp only [ratOk, List.all_eq_true, beq_iff_eq] at h
  have : a.num.tail = a.num.drop 1 := by cases a.num <;> rfl
  rw [this] at hy
  exact h y hy

theorem ratLe_spec {a b : ℤ} {ad bd : ℕ} (had : 0 < ad) (hbd : 0 < bd) (h : ratLe a ad b bd = true) :
    ratv (a, ad) ≤ ratv (b, bd) := by
  simp only [ratLe, decide_eq_true_eq] at h
  unfold ratv
  have : (0 : ℝ) < ad := by exact_mod_cast had
  have : (0 : ℝ) < bd := by exact_mod_cast hbd
  rw [div_le_div_iff₀ (by assumption) (by assumption)]
  exact_mod_cast h

/-- A coordinate of a box with even width. -/
theorem box_coord {l h : ℤ} (hlh : l < h) (he : (h - l) % 2 = 0) {s : ℝ} (hs : |s| ≤ 1) :
    (l : ℝ) ≤ (((l + h) / 2 : ℤ) : ℝ) + (((h - l) / 2 : ℤ) : ℝ) * s ∧
      (((l + h) / 2 : ℤ) : ℝ) + (((h - l) / 2 : ℤ) : ℝ) * s ≤ h := by
  obtain ⟨k, hk⟩ : ∃ k, h - l = 2 * k := ⟨(h - l) / 2, by omega⟩
  have e1 : (l + h) / 2 = l + k := by omega
  have e2 : (h - l) / 2 = k := by omega
  have hk0 : (0 : ℝ) ≤ k := by have : 0 ≤ k := by omega
                               exact_mod_cast this
  have hh : (h : ℝ) = l + 2 * k := by
    have : h = l + 2 * k := by omega
    rw [this]; push_cast; ring
  rw [e1, e2, abs_le] at *
  push_cast
  constructor <;> nlinarith [hs.1, hs.2]


/-! ## 6. The local hypothesis -/

/-- The extra checks of the constants (positive denominators, lengths). -/
def probExtraOk (P : Prob) : Bool :=
  decide (0 < P.lnx0.2) && decide (0 < P.lnx1.2) && decide (0 < P.lny.2) && decide (0 < P.lny.1) &&
    decide (0 < P.xi0.2) && decide (0 < P.xi1.2) && P.astar.num.length == 2 ^ P.ps.length &&
    decide (0 < P.astar.den)

def qfOk (P : Prob) (c : QF) : Bool := c.num.length == 2 ^ P.ps.length && decide (0 < c.den)

/-- The extra checks of one local region (the ends of the ranges, lengths, the candidates). -/
def regExtraOk (P : Prob) (rg : Region) (cands : List (List Nat)) : Bool :=
  endsOk (zrOf P rg) && (sclOf P rg).all (fun x => decide (0 < x.2)) && !cands.isEmpty &&
    cands.all (fun cd => cd.length == 4 && cd.all (· < P.verts.length)) &&
    rg.center.length == 3 && rg.rlo.length == 3 && rg.rhi.length == 3 &&
    rg.center.all (qfOk P) && rg.rlo.all (qfOk P) && rg.rhi.all (qfOk P) && qfOk P rg.rho &&
    decide (0 < (qr rg.rho).1)

theorem qfOk_spec {P : Prob} {c : QF} (h : qfOk P c = true) : Len P.ps c.num ∧ 0 < c.den := by
  simp only [qfOk, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at h
  exact h

theorem ratv_divR {a b : ℤ × ℕ} (hb : 0 < b.1) (hb2 : 0 < b.2) (ha2 : 0 < a.2) :
    ratv (divR a b) = ratv a / ratv b := by
  obtain ⟨a1, a2⟩ := a
  obtain ⟨b1, b2⟩ := b
  simp only at hb hb2 ha2
  have : b1.natAbs = b1.toNat := by omega
  simp only [ratv, divR, hb, ite_true, mul_one]
  have hb1 : ((b1.natAbs : ℕ) : ℝ) = (b1 : ℝ) := by
    rw [Nat.cast_natAbs, Int.cast_abs, abs_of_pos (by exact_mod_cast hb)]
  push_cast
  rw [hb1]
  have : (0 : ℝ) < b1 := by exact_mod_cast hb
  have : (0 : ℝ) < b2 := by exact_mod_cast hb2
  have : (0 : ℝ) < a2 := by exact_mod_cast ha2
  field_simp

theorem len3 {α : Type*} {l : List α} (h : l.length = 3) : ∃ a b c, l = [a, b, c] := by
  match l, h with
  | [a, b, c], _ => exact ⟨a, b, c, rfl⟩

theorem len4 {α : Type*} {l : List α} (h : l.length = 4) : ∃ a b c d, l = [a, b, c, d] := by
  match l, h with
  | [a, b, c, d], _ => exact ⟨a, b, c, d, rfl⟩

theorem toNat_cast {n : ℤ} (h : 0 < n) : ((n.toNat : ℕ) : ℝ) = (n : ℝ) := by
  have : ((n.toNat : ℕ) : ℤ) = n := Int.toNat_of_nonneg h.le
  rw [← this]; norm_cast

/-- One coordinate of an R box inside a local box (`rInsideL`). -/
theorem coord {P : Prob} (hwf : WF P) {c rho rl rh : QF} (Lc : Len P.ps c.num) (dc : 0 < c.den)
    (Lrho : Len P.ps rho.num) (drho : 0 < rho.den) (Lrl : Len P.ps rl.num) (drl : 0 < rl.den)
    (Lrh : Len P.ps rh.num) (drh : 0 < rh.den) {lo hi : ℤ} {ui : ℝ}
    (ha : QF.le P.ps (QF.add c (QF.mul P.ps rho rl)) (QF.ofRat P.nb lo P.rden.toNat) = true)
    (hb : QF.le P.ps (QF.ofRat P.nb hi P.rden.toNat) (QF.add c (QF.mul P.ps rho rh)) = true)
    (hlo : (lo : ℝ) ≤ ui) (hhi : ui ≤ hi) :
    qv P.ps c + qv P.ps rho * qv P.ps rl ≤ ui / P.rden ∧ ui / P.rden ≤ qv P.ps c + qv P.ps rho * qv P.ps rh := by
  have hden : (0 : ℝ) < P.rden := by exact_mod_cast hwf.rden
  have htn : 0 < P.rden.toNat := by have := hwf.rden; omega
  rw [hwf.nb] at ha hb
  have lr : Len P.ps (QF.ofRat (2 ^ P.ps.length) lo P.rden.toNat).num := len_fofInt _ _
  have lr' : Len P.ps (QF.ofRat (2 ^ P.ps.length) hi P.rden.toNat).num := len_fofInt _ _
  have e1 := qf_le hwf.pos (len_add Lc (len_mul Lrho Lrl)) lr (Nat.mul_pos dc (Nat.mul_pos drho drl)) htn ha
  have e2 := qf_le hwf.pos lr' (len_add Lc (len_mul Lrho Lrh)) htn (Nat.mul_pos dc (Nat.mul_pos drho drh)) hb
  rw [qv_add Lc (len_mul Lrho Lrl) dc (Nat.mul_pos drho drl), qv_mul Lrho Lrl, qv_ofRat,
    toNat_cast hwf.rden] at e1
  rw [qv_add Lc (len_mul Lrho Lrh) dc (Nat.mul_pos drho drh), qv_mul Lrho Lrh, qv_ofRat,
    toNat_cast hwf.rden] at e2
  exact ⟨e1.trans (div_le_div_of_nonneg_right hlo hden.le), (div_le_div_of_nonneg_right hhi hden.le).trans e2⟩

theorem ratv_neg (a : ℤ) (d : ℕ) : ratv (-a, d) = -ratv (a, d) := by simp [ratv, neg_div]

theorem ratv_nden {P : Prob} (hwf : WF P) (l : ℤ) : ratv (l, P.nden.toNat) = (l : ℝ) / P.nden := by
  simp only [ratv, toNat_cast hwf.nden]

/-- **The local hypothesis.** The local check of every local region (with `rangesOk` and the extra
checks) gives `TetCover.HLoc P`. -/
theorem hloc_of {P : Prob} (hc : TetCover.FarConsts P) (hrng : rangesOk P = true)
    (hpx : probExtraOk P = true) {D : ℤ} (hD : 0 < D)
    (hreg : ∀ rg ∈ P.regions, ∃ cands faces, (localRegionOk P rg [0, 1, 3] cands faces D).1 = true ∧
      regExtraOk P rg cands = true) : TetCover.HLoc P := by
  intro nb hnw hnin rb hrw hrin sx sy hsx hsy R hR u hcu hinb
  have hwf := hc.wf
  have hb := TetFar.bracket_of_sqbOk hwf hc.sqb
  have hK : (0 : ℝ) < 2 ^ P.sqk := by positivity
  have hnb := hwf.nb
  simp only [probExtraOk, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hpx
  obtain ⟨⟨⟨⟨⟨⟨⟨hx0d, hx1d⟩, hyd⟩, hyn⟩, hxi0⟩, hxi1⟩, hal⟩, had⟩ := hpx
  -- the region of the R box
  obtain ⟨rg, hrg, hrgt⟩ := List.any_eq_true.1 hrin
  obtain ⟨cands, faces, hok, hex⟩ := hreg rg hrg
  simp only [regExtraOk, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq, List.all_eq_true,
    Bool.not_eq_true', List.isEmpty_eq_false_iff] at hex
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨hends, hscl⟩, hne⟩, hcd⟩, hclen⟩, hllen⟩, hhlen⟩, hcen⟩, hrlo⟩, hrhi⟩, hrho⟩, hrhop⟩ := hex
  have hok' := hok
  rw [TetLocalPoly.localRegionOk_eq] at hok'
  simp only [Bool.and_eq_true] at hok'
  have hrngOk := hok'.1.1.2
  simp only [rngOkOf, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq] at hrngOk
  obtain ⟨⟨⟨⟨hrlor, hrhir⟩, hrhor⟩, hrx⟩, _⟩ := hrngOk
  obtain ⟨Lrho, drho⟩ := qfOk_spec hrho
  have hr : RegWF P rg := ⟨hclen, fun c h => qfOk_spec (hcen c h), hal, had⟩
  obtain ⟨c0, c1, c2, hcl⟩ := len3 hclen
  obtain ⟨r0, r1, r2, hrl⟩ := len3 hllen
  obtain ⟨h0, h1, h2, hrh⟩ := len3 hhlen
  obtain ⟨Lc0, dc0⟩ := qfOk_spec (hcen c0 (by rw [hcl]; simp))
  obtain ⟨Lc1, dc1⟩ := qfOk_spec (hcen c1 (by rw [hcl]; simp))
  obtain ⟨Lc2, dc2⟩ := qfOk_spec (hcen c2 (by rw [hcl]; simp))
  obtain ⟨Lr0, dr0⟩ := qfOk_spec (hrlo r0 (by rw [hrl]; simp))
  obtain ⟨Lr1, dr1⟩ := qfOk_spec (hrlo r1 (by rw [hrl]; simp))
  obtain ⟨Lr2, dr2⟩ := qfOk_spec (hrlo r2 (by rw [hrl]; simp))
  obtain ⟨Lh0, dh0⟩ := qfOk_spec (hrhi h0 (by rw [hrh]; simp))
  obtain ⟨Lh1, dh1⟩ := qfOk_spec (hrhi h1 (by rw [hrh]; simp))
  obtain ⟨Lh2, dh2⟩ := qfOk_spec (hrhi h2 (by rw [hrh]; simp))
  have Rr0 := hrlor r0 (by rw [hrl]; simp)
  have Rr1 := hrlor r1 (by rw [hrl]; simp)
  have Rr2 := hrlor r2 (by rw [hrl]; simp)
  have Rh0 := hrhir h0 (by rw [hrh]; simp)
  have Rh1 := hrhir h1 (by rw [hrh]; simp)
  have Rh2 := hrhir h2 (by rw [hrh]; simp)
  -- the rotation box inside the local box
  simp only [Bool.and_eq_true, beq_iff_eq, hcl, hrl, hrh, show List.range 3 = [0, 1, 2] from rfl,
    List.zip_cons_cons, List.zip_nil_left, List.all_cons, List.all_nil, Bool.and_true, nth,
    List.getD_cons_zero, List.getD_cons_succ] at hrgt
  obtain ⟨hch, ⟨a0, b0⟩, ⟨a1, b1⟩, ⟨a2, b2⟩⟩ := hrgt
  obtain ⟨_, hinb⟩ := hinb
  have u0 := hinb 0
  have u1 := hinb 1
  have u2 := hinb 2
  simp only [bLo, bHi, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two] at u0 u1 u2
  obtain ⟨k0, k0'⟩ := coord hwf Lc0 dc0 Lrho drho Lr0 dr0 Lh0 dh0 a0 b0 u0.1 u0.2
  obtain ⟨k1, k1'⟩ := coord hwf Lc1 dc1 Lrho drho Lr1 dr1 Lh1 dh1 a1 b1 u1.1 u1.2
  obtain ⟨k2, k2'⟩ := coord hwf Lc2 dc2 Lrho drho Lr2 dr2 Lh2 dh2 a2 b2 u2.1 u2.2
  have hrhov : qv P.ps rg.rho = ratv (qr rg.rho) := qv_rat Lrho hrhor
  have hrhop' : 0 < qv P.ps rg.rho := by
    rw [hrhov, ratv]
    have : (0 : ℝ) < (qr rg.rho).1 := by exact_mod_cast hrhop
    have : (0 : ℝ) < ((qr rg.rho).2 : ℝ) := by simp only [qr]; exact_mod_cast drho
    positivity
  -- the direction box inside the local range
  set X := nx nb sx / P.nden with hX
  set Y := ny nb sy / P.nden with hY
  have hnd : (0 : ℝ) < P.nden := by exact_mod_cast hwf.nden
  have hndt : 0 < P.nden.toNat := by have := hwf.nden; omega
  simp only [nboxWf, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hnw
  obtain ⟨⟨⟨⟨w0, w1⟩, e0⟩, e1⟩, _⟩ := hnw
  obtain ⟨bx0, bx1⟩ := box_coord w0 e0 hsx
  obtain ⟨by0, by1⟩ := box_coord w1 e1 hsy
  simp only [nInsideL, Bool.and_eq_true] at hnin
  obtain ⟨⟨⟨n1, n2⟩, n3⟩, n4⟩ := hnin
  have m1 := ratLe_spec hx0d hndt n1
  have m2 := ratLe_spec hndt hx1d n2
  have m3 := ratLe_spec hyd hndt n3
  have m4 := ratLe_spec hndt hyd n4
  rw [ratv_nden hwf] at m1 m2 m3 m4
  rw [ratv_neg] at m3
  have hX1 : ratv P.lnx0 ≤ X := m1.trans (div_le_div_of_nonneg_right bx0 hnd.le)
  have hX2 : X ≤ ratv P.lnx1 := (div_le_div_of_nonneg_right bx1 hnd.le).trans m2
  have hY1 : -ratv P.lny ≤ Y := m3.trans (div_le_div_of_nonneg_right by0 hnd.le)
  have hY2 : Y ≤ ratv P.lny := (div_le_div_of_nonneg_right by1 hnd.le).trans m4
  -- rangesOk
  simp only [rangesOk, Bool.and_eq_true] at hrng
  obtain ⟨⟨⟨⟨⟨g1, g2⟩, g3⟩, g4⟩, g5⟩, g6⟩ := hrng
  rw [hnb] at g3 g4 g5 g6
  have q1 := ratLe_spec hxi0 (by norm_num) g1
  have q2 := ratLe_spec (by norm_num) hxi1 g2
  have lof : ∀ (n : ℤ) (d : ℕ), Len P.ps (QF.ofRat (2 ^ P.ps.length) n d).num := fun n d => len_fofInt _ _
  have q3 := qf_le hwf.pos (len_add hal (lof _ _)) (lof _ _) (Nat.mul_pos had hxi0) hx0d g3
  have q4 := qf_le hwf.pos (lof _ _) (len_add hal (lof _ _)) hx1d (Nat.mul_pos had hxi1) g4
  have q5 := qf_le hwf.pos (lof _ _) (len_add hal (lof _ _)) hyd (Nat.mul_pos had hxi0) g5
  have q6 := qf_le hwf.pos (len_add hal (lof _ _)) (len_ofInt hnb 1) (Nat.mul_pos had hxi1)
    (by simp [QF.ofInt]) (by rw [hnb]; exact g6)
  rw [qv_add hal (lof _ _) had hxi0, qv_ofRat, qv_ofRat] at q3 q5
  rw [qv_add hal (lof _ _) had hxi1, qv_ofRat, qv_ofRat] at q4
  rw [qv_add hal (lof _ _) had hxi1, qv_ofRat, qv_ofInt hnb] at q6
  simp only [ratv] at q1 q2 hX1 hX2 hY1 hY2
  push_cast at q1 q2 q6
  -- the point of the normalized box
  set rx := rxOf P with hrxd
  have hrx2 : 0 < rx.2 := by rw [hrxd]; unfold rxOf; split_ifs <;> assumption
  have hrxv : 0 < ratv rx := by
    unfold ratv
    have : (0 : ℝ) < rx.1 := by exact_mod_cast hrx
    have : (0 : ℝ) < (rx.2 : ℝ) := by exact_mod_cast hrx2
    positivity
  have hlyv : 0 < ratv P.lny := by
    unfold ratv
    have : (0 : ℝ) < P.lny.1 := by exact_mod_cast hyn
    have : (0 : ℝ) < (P.lny.2 : ℝ) := by exact_mod_cast hyd
    positivity
  set ξ := X - qv P.ps P.astar with hξ
  set p0 := u 0 / P.rden - qv P.ps c0 with hp0
  set p1 := u 1 / P.rden - qv P.ps c1 with hp1
  set p2 := u 2 / P.rden - qv P.ps c2 with hp2
  set ζ : Fin 5 → ℝ := ![ξ / ratv rx, Y / ratv P.lny, p0 / qv P.ps rg.rho, p1 / qv P.ps rg.rho,
    p2 / qv P.ps rg.rho] with hζd
  set zc : Fin 5 → ℝ := ![ξ, Y, p0, p1, p2] with hzc
  have hzr : zrOf P rg = [(divR P.xi0 rx, divR P.xi1 rx), ((-1, 1), (1, 1)), (qr r0, qr h0), (qr r1, qr h1),
      (qr r2, qr h2)] := by simp [zrOf, hrl, hrh, hrxd]
  have hd0 := ratv_divR (a := P.xi0) hrx hrx2 hxi0
  have hd1 := ratv_divR (a := P.xi1) hrx hrx2 hxi1
  have hζ : ∀ j : Fin 5, ratv (nth (zrOf P rg) j d00).1 ≤ ζ j ∧ ζ j ≤ ratv (nth (zrOf P rg) j d00).2 := by
    rw [hzr]
    intro j
    have lhs : ∀ (a b : ℝ) (q : QF), qv P.ps q = a → (qv P.ps rg.rho * a ≤ b ↔ a ≤ b / qv P.ps rg.rho) :=
      fun a b q _ => by rw [le_div_iff₀ hrhop', mul_comm]
    have rhs : ∀ (a b : ℝ) (q : QF), qv P.ps q = a → (b ≤ qv P.ps rg.rho * a ↔ b / qv P.ps rg.rho ≤ a) :=
      fun a b q _ => by rw [div_le_iff₀ hrhop', mul_comm]
    fin_cases j
    · simp only [nth, List.getD_cons_zero, hζd, Matrix.cons_val_zero, Fin.zero_eta, Fin.isValue]
      rw [hd0, hd1]
      exact ⟨div_le_div_of_nonneg_right (by simp only [ratv]; linarith) hrxv.le,
        div_le_div_of_nonneg_right (by simp only [ratv]; linarith) hrxv.le⟩
    · show ratv (-1, 1) ≤ Y / ratv P.lny ∧ Y / ratv P.lny ≤ ratv (1, 1)
      have e1 : -ratv P.lny ≤ Y := hY1
      have e2 : Y ≤ ratv P.lny := hY2
      rw [show ratv (-1, 1) = -1 by simp [ratv], show ratv (1, 1) = 1 by simp [ratv]]
      constructor
      · rw [le_div_iff₀ hlyv]; linarith
      · rw [div_le_iff₀ hlyv]; linarith
    · simp only [nth, List.getD_cons_succ, List.getD_cons_zero, hζd]
      simp
      rw [← qv_rat Lr0 Rr0, ← qv_rat Lh0 Rh0]
      exact ⟨(lhs _ _ r0 rfl).1 (by linarith), (rhs _ _ h0 rfl).1 (by linarith)⟩
    · simp only [nth, List.getD_cons_succ, List.getD_cons_zero, hζd]
      simp
      rw [← qv_rat Lr1 Rr1, ← qv_rat Lh1 Rh1]
      exact ⟨(lhs _ _ r1 rfl).1 (by linarith), (rhs _ _ h1 rfl).1 (by linarith)⟩
    · simp only [nth, List.getD_cons_succ, List.getD_cons_zero, hζd]
      simp
      rw [← qv_rat Lr2 Rr2, ← qv_rat Lh2 Rh2]
      exact ⟨(lhs _ _ r2 rfl).1 (by linarith), (rhs _ _ h2 rfl).1 (by linarith)⟩
  have hz : (fun j : Fin 5 => sclv (sclOf P rg) j * ζ j) = zc := by
    funext j
    have hrhov' : ((qr rg.rho).1 : ℝ) / ((qr rg.rho).2 : ℝ) = qv P.ps rg.rho := by rw [hrhov]; rfl
    fin_cases j <;> simp [sclv, sclOf, nth, hζd, hzc, ← hrxd] <;>
      first
      | (rw [show ((rx.1 : ℝ) / (rx.2 : ℝ)) = ratv rx from rfl]; field_simp)
      | (rw [show ((P.lny.1 : ℝ) / (P.lny.2 : ℝ)) = ratv P.lny from rfl]; field_simp)
      | (rw [hrhov']; field_simp)
  -- the chart of the local point
  have hden : (0 : ℝ) < P.rden := by exact_mod_cast hwf.rden
  obtain ⟨Nv, hNv, hNs, hNR⟩ := chart_rq hden hcu
  have hQ : Qv P rg zc = chq rb.ch 1 (u 0 / P.rden) (u 1 / P.rden) (u 2 / P.rden) := by
    simp [Qv, cv, hcl, nth, hzc, hch, hp0, hp1, hp2]
  have qq := fun j hj => q_val zc hwf hr j hj
  rw [hQ] at qq
  obtain ⟨hRq, hNq⟩ := rq_val zc hnb (qq 0 (by norm_num)) (qq 1 (by norm_num)) (qq 2 (by norm_num))
    (qq 3 (by norm_num))
  have hN : PQv P.ps zc (NL P rg) Nv := pqv_congr zc hNq hNs
  have hval : ∀ cd ∈ cands, ∃ a b c d, cd = [a, b, c, d] ∧ a < P.verts.length ∧
      PQv P.ps zc (candPQ (localParts P rg) [0, 1, 3] cd)
        (Nv * (dualB P !₂[qv P.ps P.astar + zc 0, zc 1, 1] R a ![b, c, a, d] - betar P * zc 1)) := by
    intro cd hcdm
    obtain ⟨hl4, hall⟩ := hcd cd hcdm
    obtain ⟨a, b, c, d, rfl⟩ := len4 hl4
    have ha := hall a (by simp)
    have hb' := hall b (by simp)
    have hc' := hall c (by simp)
    have hd' := hall d (by simp)
    exact ⟨a, b, c, d, rfl, ha, cand_val zc hwf hr ha hb' hc' hd' hRq hN hNR⟩
  have hG : ∀ cd ∈ cands, WF5 P.ps (candPQ (localParts P rg) [0, 1, 3] cd).p := by
    intro cd hcdm
    obtain ⟨_, _, _, _, _, _, h⟩ := hval cd hcdm
    exact h.1
  have hscl' : ∀ x ∈ sclOf P rg, x.2 ≠ 0 := fun x hx => (hscl x hx).ne'
  have hzl : (zrOf P rg).length = 5 := by rw [hzr]; rfl
  obtain ⟨cd, hcdm, hpos⟩ := region_pos hb hK hnb hD hok hends hzl hscl' hne hG ζ hζ
  rw [hz] at hpos
  obtain ⟨a, b, c, d, rfl, ha, hv⟩ := hval cd hcdm
  obtain ⟨_, hd0', he⟩ := hv
  have hdpos : (0 : ℝ) < (candPQ (localParts P rg) [0, 1, 3] [a, b, c, d]).d := by exact_mod_cast hd0'
  rw [he] at hpos
  have h1 := (mul_nonneg_iff_of_pos_left hdpos).1 hpos
  have h2 := (mul_nonneg_iff_of_pos_left hNv).1 h1
  have hp : qv P.ps P.astar + zc 0 = X := by simp [hzc, hξ]
  have hz1 : zc 1 = Y := by simp [hzc]
  rw [hp, hz1] at h2
  have hmx1 : -X ≤ Y := by simp only [ratv] at hlyv; linarith
  have hmx2 : Y ≤ X := by linarith
  have hmx3 : X ≤ 1 := by linarith
  left
  refine ⟨dot !₂[X, Y, 1] (bT 2), a, ha, ![b, c, a, d], fun f => ?_,
    fun f => TetCover.mu_max hmx1 hmx2 hmx3 f, ?_⟩
  · obtain ⟨hl4, hall⟩ := hcd _ hcdm
    fin_cases f <;> simp <;> exact hall _ (by simp)
  · have : betar P * Y ≤ dualB P !₂[X, Y, 1] R a ![b, c, a, d] := by linarith
    simpa [dualB] using this

end

#assert_std_axioms PackLean.Formal.TetLocal.hloc_of PackLean.Formal.TetLocal.cand_val

end PackLean.Formal.TetLocal
