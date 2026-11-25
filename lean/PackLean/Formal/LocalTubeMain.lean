import PackLean.Formal.LocalTube

/-!
# D45 stage 5b (part 2): the local check of the tube (`D30S3.localOkT`)

* `ltrun_cover`: the box tree of one face of the tube covers its root box (`LocalG.lrun_cover` with
  the leaves `single` and `mix`);
* `faceX_spec`: the values of the substituted coordinates `faceX` (`K·p` on the face `(j, sg)`);
* `orth_decomp`: three nonzero orthogonal vectors give `x = Σ_b (x·b)/|b|² · b`;
* `tube_face_point`: every point of the tube is `faceX/K` at a point `w` of the root box of a face
  (`0 ≤ ρ ≤ ρ₀`, `|a₁|, |a₂| ≤ 1`);
* `sub_spec`: `sub P c p` at `w` is `K⁴ · p(x)`.
-/

namespace PackLean.Formal.LocalTubeMain

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign Mono Poly padd psum pmul
  psmulZ psmulF nth vecGet)
open PackLean.D16 (Prob Cand LBox lsplit lbPos candOk candPolys rotPoly constTerm z3)
open PackLean.D30S3 (S3 tubeOk idot subst homScale divRho degLe LTokT FCtx LStateT lstepT singleOk
  mixOk faceX tubeFaces kScale sub tauLo tauHi candsOk defCand localOkT faceIdentOk)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.LocalG (Ss)
open PackLean.Formal.PolySemG (pEval BracketG maskOf)
open PackLean.Formal.PolySem (monoEval monoEval_three)
open PackLean.Formal.LocalG (InL lsplit_cover)
open PackLean.Formal.LocalTube

noncomputable section

/-! ## The box tree of one face -/

/-- What an accepted leaf of the tube certifies. -/
def LGoodT (P : Prob) (X : S3) (D : ℤ) (cands : List Cand) (c : FCtx) (b : LBox) : Prop :=
  b.lo.length = 3 ∧ b.hi.length = 3 ∧
  (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id = true ∧
  ((∃ ci, singleOk P D cands c b ci = true) ∨
   (∃ al ws cs, mixOk P X D cands c b al ws cs = true))

theorem lstepT_ok_false (P : Prob) (X : S3) (D : ℤ) (cands : List Cand) (c : FCtx) (s : LStateT)
    (t : LTokT) (h : s.ok = false) : (lstepT P X D cands c s t).ok = false := by
  rcases hst : s.stack with _ | ⟨b, rest⟩ <;> cases t <;> simp [lstepT, hst, h]

theorem lfoldlT_ok_false (P : Prob) (X : S3) (D : ℤ) (cands : List Cand) (c : FCtx) :
    ∀ (toks : List LTokT) (s : LStateT), s.ok = false →
      (toks.foldl (lstepT P X D cands c) s).ok = false := by
  intro toks
  induction toks with
  | nil => intro s h; simpa using h
  | cons t toks ih => intro s h; exact ih _ (lstepT_ok_false P X D cands c s t h)

/-- **Tree soundness** of one face of the tube. -/
theorem ltrun_cover (P : Prob) (X : S3) (D : ℤ) (cands : List Cand) (c : FCtx) :
    ∀ (toks : List LTokT) (s : LStateT), (toks.foldl (lstepT P X D cands c) s).ok = true →
      (toks.foldl (lstepT P X D cands c) s).stack = [] →
      ∀ z, (∃ B ∈ s.stack, InL B z) → ∃ B, LGoodT P X D cands c B ∧ InL B z := by
  intro toks
  induction toks with
  | nil =>
    intro s _ hst z ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hok hst z ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst
    have hok' : (lstepT P X D cands c s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [lfoldlT_ok_false P X D cands c toks _ hc] at hok
      exact Bool.false_ne_true hok
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (lstepT P X D cands c s .split).stack = (lsplit B).1 :: (lsplit B).2 :: rest := by
            simp [lstepT, hs]
          refine ih _ hok hst z ?_
          rw [hs']
          rcases lsplit_cover B z hz with h | h
          · exact ⟨_, by simp, h⟩
          · exact ⟨_, by simp, h⟩
        | single ci =>
          have : (lstepT P X D cands c s (.single ci)).ok = (s.ok && (B.lo.length == 3 &&
              B.hi.length == 3 && (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0)
                B.lo B.hi).all id) && singleOk P D cands c B ci) := by
            simp only [lstepT, hs]
          rw [this] at hok'
          simp only [Bool.and_eq_true, beq_iff_eq] at hok'
          obtain ⟨⟨_, ⟨hl, hh⟩, hw⟩, hr⟩ := hok'
          exact ⟨B, ⟨hl, hh, hw, Or.inl ⟨ci, hr⟩⟩, hz⟩
        | mix al ws cs =>
          have : (lstepT P X D cands c s (.mix al ws cs)).ok = (s.ok && (B.lo.length == 3 &&
              B.hi.length == 3 && (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0)
                B.lo B.hi).all id) && mixOk P X D cands c B al ws cs) := by
            simp only [lstepT, hs]
          rw [this] at hok'
          simp only [Bool.and_eq_true, beq_iff_eq] at hok'
          obtain ⟨⟨_, ⟨hl, hh⟩, hw⟩, hr⟩ := hok'
          exact ⟨B, ⟨hl, hh, hw, Or.inr ⟨al, ws, cs, hr⟩⟩, hz⟩
      · have hsub : ∀ C ∈ rest, C ∈ (lstepT P X D cands c s t).stack := by
          intro C hC; cases t <;> simp [lstepT, hs, hC]
        exact ih _ hok hst z ⟨B, hsub B hBr, hz⟩

/-! ## The substituted coordinates `faceX` -/

/-- The face vectors: `b_j` (`e₁` for `j = 0`, else `e₂`) and the other one `b_o`. -/
def bj (X : S3) (j : ℕ) : List ℤ := if j == 0 then X.e1 else X.e2
def bo (X : S3) (j : ℕ) : List ℤ := if j == 0 then X.e2 else X.e1

/-- The value of `K·p_i` on the face `(j, sg)` at `w = (ρ, a₁, a₂)`. -/
def fxv (X : S3) (j : ℕ) (sg : ℤ) (i : ℕ) (w : Fin 3 → ℝ) : ℝ :=
  ((X.tc.1 * X.tw.2 * nth X.n i 0 : ℤ) : ℝ) + ((X.tw.1 * X.tc.2 * nth X.n i 0 : ℤ) : ℝ) * w 1 +
    ((sg * X.tc.2 * X.tw.2 * nth (bj X j) i 0 : ℤ) : ℝ) * w 0 +
    ((X.tc.2 * X.tw.2 * nth (bo X j) i 0 : ℤ) : ℝ) * (w 0 * w 2)

theorem faceX_length (nb : ℕ) (X : S3) (j : ℕ) (sg : ℤ) : (faceX nb X j sg).length = 3 := by
  simp [faceX]

theorem faceX_spec {ps : List ℕ} (X : S3) (j : ℕ) (sg : ℤ) (i : ℕ) (hi : i < 3) (w : Fin 3 → ℝ) :
    PolySemG.WF ps (nth (faceX (2 ^ ps.length) X j sg) i []) ∧
    pEval ps (nth (faceX (2 ^ ps.length) X j sg) i []) w = fxv X j sg i w := by
  have hnth : nth (faceX (2 ^ ps.length) X j sg) i [] =
      psum [[([0, 0, 0], fofInt (2 ^ ps.length) (X.tc.1 * X.tw.2 * nth X.n i 0))],
        [([0, 1, 0], fofInt (2 ^ ps.length) (X.tw.1 * X.tc.2 * nth X.n i 0))],
        [([1, 0, 0], fofInt (2 ^ ps.length) (sg * X.tc.2 * X.tw.2 * nth (bj X j) i 0))],
        [([1, 0, 1], fofInt (2 ^ ps.length) (X.tc.2 * X.tw.2 * nth (bo X j) i 0))]] := by
    unfold faceX
    rw [LocalG.nth_map_lt _ (by simpa using hi)]
    simp only [List.getElem_range]
    rfl
  have hall : ∀ p ∈ [[([0, 0, 0], fofInt (2 ^ ps.length) (X.tc.1 * X.tw.2 * nth X.n i 0))],
        [([0, 1, 0], fofInt (2 ^ ps.length) (X.tw.1 * X.tc.2 * nth X.n i 0))],
        [([1, 0, 0], fofInt (2 ^ ps.length) (sg * X.tc.2 * X.tw.2 * nth (bj X j) i 0))],
        [([1, 0, 1], fofInt (2 ^ ps.length) (X.tc.2 * X.tw.2 * nth (bo X j) i 0))]],
      PolySemG.WF ps p := by
    intro p hp
    simp only [List.mem_cons, List.not_mem_nil, or_false] at hp
    rcases hp with rfl | rfl | rfl | rfl <;>
      · intro e he; simp at he; subst he; exact ⟨rfl, len_fofInt _ _⟩
  rw [hnth]
  refine ⟨PolySemG.psum_WF hall, ?_⟩
  rw [PolySemG.pEval_psum w hall]
  simp [monoEval_three, fval_fofInt, fxv]
  ring

/-! ## Three orthogonal vectors -/

/-- `Σ_k a_k b_k` over `Fin 3`. -/
def d3 (a b : Fin 3 → ℝ) : ℝ := a 0 * b 0 + a 1 * b 1 + a 2 * b 2

/-- **Orthogonal decomposition**: for three nonzero, pairwise orthogonal vectors,
`x = Σ_b (x·b)/|b|² · b`. -/
theorem orth_decomp (n e f : Fin 3 → ℝ) (hn : 0 < d3 n n) (he : 0 < d3 e e) (hf : 0 < d3 f f)
    (hne : d3 n e = 0) (hnf : d3 n f = 0) (hef : d3 e f = 0) (x : Fin 3 → ℝ) (i : Fin 3) :
    x i = d3 x n / d3 n n * n i + d3 x e / d3 e e * e i + d3 x f / d3 f f * f i := by
  let V : Fin 3 → Fin 3 → ℝ := ![n, e, f]
  let Q : Fin 3 → ℝ := ![d3 n n, d3 e e, d3 f f]
  let M : Matrix (Fin 3) (Fin 3) ℝ := Matrix.of V
  let W : Matrix (Fin 3) (Fin 3) ℝ := Matrix.of fun k b => V b k / Q b
  have hen : d3 e n = 0 := by rw [← hne]; unfold d3; ring
  have hfn : d3 f n = 0 := by rw [← hnf]; unfold d3; ring
  have hfe : d3 f e = 0 := by rw [← hef]; unfold d3; ring
  have hent : ∀ a b, (M * W) a b = d3 (V a) (V b) / Q b := by
    intro a b
    simp only [M, W, Matrix.mul_apply, Fin.sum_univ_three, Matrix.of_apply]
    unfold d3; ring
  have hMW : M * W = 1 := by
    ext a b
    rw [hent]
    fin_cases a <;> fin_cases b <;>
      simp [V, Q, Matrix.one_apply, hne, hnf, hef, hen, hfn, hfe, hn.ne', he.ne', hf.ne']
  have hWM : W * M = 1 := mul_eq_one_comm.1 hMW
  have hx : x i = ∑ j, (W * M) i j * x j := by
    simp only [hWM, Matrix.one_apply, ite_mul, one_mul, zero_mul, Finset.sum_ite_eq,
      Finset.mem_univ, if_true]
  rw [hx]
  simp only [M, W, V, Q, Matrix.mul_apply, Fin.sum_univ_three, Matrix.of_apply, Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.cons_val_two, Matrix.head_cons, Matrix.tail_cons]
  unfold d3
  ring

/-! ## The faces of the tube -/

/-- A point `(y₁, y₂)` of the square `|y₁|, |y₂| ≤ r` lies on one of the four faces of `tubeFaces`:
`sg·ρ` on the fixed coordinate and `ρ·a₂` on the other, `0 ≤ ρ ≤ r`, `|a₂| ≤ 1`. -/
theorem sq_face {y1 y2 r : ℝ} (h1 : |y1| ≤ r) (h2 : |y2| ≤ r) :
    ∃ js ∈ tubeFaces, ∃ w0 w2 : ℝ, 0 ≤ w0 ∧ w0 ≤ r ∧ |w2| ≤ 1 ∧
      ∀ a b : ℝ, (js.2 : ℝ) * w0 * (if js.1 = 0 then a else b) + w0 * w2 * (if js.1 = 0 then b else a)
        = y1 * a + y2 * b := by
  have hm : ∀ js, js ∈ tubeFaces ↔ js = (0, 1) ∨ js = (0, -1) ∨ js = (1, 1) ∨ js = (1, -1) := by
    intro js; simp [tubeFaces]
  rcases le_total |y2| |y1| with hle | hle
  · rcases lt_trichotomy y1 0 with hneg | hz | hpos
    · refine ⟨(0, -1), (hm _).2 (by simp), -y1, y2 / (-y1), by linarith, ?_, ?_, ?_⟩
      · rw [abs_of_neg hneg] at h1; exact h1
      · rw [abs_div, abs_of_pos (by linarith : 0 < -y1), div_le_one (by linarith)]
        rw [abs_of_neg hneg] at hle; exact hle
      · intro a b; have := hneg.ne; simp only [if_true]; field_simp; push_cast; ring
    · have hy2 : y2 = 0 := by rw [hz, abs_zero] at hle; exact abs_nonpos_iff.1 hle
      refine ⟨(0, 1), (hm _).2 (by simp), 0, 0, le_refl _, (abs_nonneg _).trans h1, by simp, ?_⟩
      intro a b; rw [hz, hy2]; ring
    · refine ⟨(0, 1), (hm _).2 (by simp), y1, y2 / y1, hpos.le, ?_, ?_, ?_⟩
      · rw [abs_of_pos hpos] at h1; exact h1
      · rw [abs_div, abs_of_pos hpos, div_le_one hpos]
        rw [abs_of_pos hpos] at hle; exact hle
      · intro a b; simp only [if_true]; field_simp; push_cast; ring
  · rcases lt_trichotomy y2 0 with hneg | hz | hpos
    · refine ⟨(1, -1), (hm _).2 (by simp), -y2, y1 / (-y2), by linarith, ?_, ?_, ?_⟩
      · rw [abs_of_neg hneg] at h2; exact h2
      · rw [abs_div, abs_of_pos (by linarith : 0 < -y2), div_le_one (by linarith)]
        rw [abs_of_neg hneg] at hle; exact hle
      · intro a b; have := hneg.ne; simp only [one_ne_zero, if_false]; field_simp; push_cast; ring
    · have hy1 : y1 = 0 := by rw [hz, abs_zero] at hle; exact abs_nonpos_iff.1 hle
      refine ⟨(0, 1), (hm _).2 (by simp), 0, 0, le_refl _, (abs_nonneg _).trans h1, by simp, ?_⟩
      intro a b; rw [hz, hy1]; ring
    · refine ⟨(1, 1), (hm _).2 (by simp), y2, y1 / y2, hpos.le, ?_, ?_, ?_⟩
      · rw [abs_of_pos hpos] at h2; exact h2
      · rw [abs_div, abs_of_pos hpos, div_le_one hpos]
        rw [abs_of_pos hpos] at hle; exact hle
      · intro a b; simp only [one_ne_zero, if_false]; field_simp; push_cast; ring

/-- The real vector of an integer list. -/
def rv (b : List ℤ) : Fin 3 → ℝ := fun k => ((nth b k.val 0 : ℤ) : ℝ)

theorem d3_rv (b : List ℤ) (hb : b.length = 3) (c : List ℤ) (hc : c.length = 3) :
    d3 (rv b) (rv c) = (idot b c : ℝ) := by
  obtain ⟨b0, b1, b2, rfl⟩ := List.length_eq_three.1 hb
  obtain ⟨c0, c1, c2, rfl⟩ := List.length_eq_three.1 hc
  simp [d3, rv, nth, idot]

theorem lin_eq (b : List ℤ) (u : Fin 3 → ℝ) : lin b u = d3 (rv b) u := by
  simp [lin, d3, rv]

/-- The scale `K = tc.den · tw.den · ed` as a real. -/
theorem kScale_pos {X : S3} (hX : tubeOk X = true) : (0 : ℝ) < kScale X := by
  obtain ⟨-, -, -, -, -, -, htc, htw, -, -, -, -, hed, -, -⟩ := tubeOk_spec hX
  unfold kScale; push_cast; positivity

/-- **Every point of the tube is on a face.** For `u` in the tube (units of `rden`), there are a face
`(j, sg)` and `w = (ρ, a₁, a₂)` with `0 ≤ ρ ≤ ρ₀`, `|a₁|, |a₂| ≤ 1` and `K·(u/rden) = faceX(w)`. -/
theorem tube_face_point {X : S3} (hX : tubeOk X = true) {rden : ℤ} (hrd : 0 < rden)
    {u : Fin 3 → ℝ} (hu : InTube X rden u) :
    ∃ js ∈ tubeFaces, ∃ w : Fin 3 → ℝ, 0 ≤ w 0 ∧ w 0 ≤ qv2 X.rho0 ∧ |w 1| ≤ 1 ∧ |w 2| ≤ 1 ∧
      ∀ i : Fin 3, fxv X js.1 js.2 i.val w = (kScale X : ℝ) * (u i / rden) := by
  obtain ⟨hn, he1, he2, hnn, h11, h22, htc, htw, hr0, hne, hnf, hef, hed, htw1, -⟩ := tubeOk_spec hX
  obtain ⟨hlo, hhi, hy1, hy2⟩ := hu
  set τ := tco rden X.ed X.n u with hτ
  set y1 := tco rden X.ed X.e1 u with hy1d
  set y2 := tco rden X.ed X.e2 u with hy2d
  obtain ⟨js, hjs, w0, w2, hw0, hw0', hw2, hface⟩ := sq_face hy1 hy2
  have htcd : (0 : ℝ) < X.tc.2 := by exact_mod_cast htc
  have htwd : (0 : ℝ) < X.tw.2 := by exact_mod_cast htw
  have htw1' : (0 : ℝ) < X.tw.1 := by exact_mod_cast htw1
  have hedr : (0 : ℝ) < X.ed := by exact_mod_cast hed
  have hrdr : (0 : ℝ) < rden := by exact_mod_cast hrd
  set TC : ℝ := (X.tc.1 : ℝ) / X.tc.2
  set TW : ℝ := (X.tw.1 : ℝ) / X.tw.2
  have hTW : 0 < TW := by positivity
  have hlo' : qv2 (tauLo X) = TC - TW := by
    simp only [qv2, tauLo, TC, TW]; push_cast; field_simp
  have hhi' : qv2 (tauHi X) = TC + TW := by
    simp only [qv2, tauHi, TC, TW]; push_cast; field_simp
  refine ⟨js, hjs, ![w0, (τ - TC) / TW, w2], hw0, hw0', ?_, hw2, ?_⟩
  · show |(τ - TC) / TW| ≤ 1
    rw [abs_div, abs_of_pos hTW, div_le_one hTW, abs_le]
    constructor <;> linarith
  · intro i
    -- the decomposition of `x = u / rden`
    have hnn' : (0 : ℝ) < d3 (rv X.n) (rv X.n) := by rw [d3_rv _ hn _ hn]; exact_mod_cast hnn
    have h11' : (0 : ℝ) < d3 (rv X.e1) (rv X.e1) := by rw [d3_rv _ he1 _ he1]; exact_mod_cast h11
    have h22' : (0 : ℝ) < d3 (rv X.e2) (rv X.e2) := by rw [d3_rv _ he2 _ he2]; exact_mod_cast h22
    have hdec := orth_decomp (rv X.n) (rv X.e1) (rv X.e2) hnn' h11' h22'
      (by rw [d3_rv _ hn _ he1, hne]; simp) (by rw [d3_rv _ hn _ he2, hnf]; simp)
      (by rw [d3_rv _ he1 _ he2, hef]; simp) (fun k => u k / rden) i
    have hcoef : ∀ b : List ℤ, b.length = 3 → 0 < idot b b →
        d3 (fun k => u k / rden) (rv b) / d3 (rv b) (rv b) = tco rden X.ed b u / X.ed := by
      intro b hb hbb
      have hbb' : (0 : ℝ) < idot b b := by exact_mod_cast hbb
      rw [d3_rv _ hb _ hb]
      unfold tco
      rw [lin_eq]
      have : d3 (fun k => u k / rden) (rv b) = d3 (rv b) u / rden := by
        unfold d3; field_simp
      rw [this]
      field_simp
    rw [hcoef _ hn hnn, hcoef _ he1 h11, hcoef _ he2 h22] at hdec
    have hf := hface (rv X.e1 i) (rv X.e2 i)
    have hbj : rv (bj X js.1) i = if js.1 = 0 then rv X.e1 i else rv X.e2 i := by
      unfold bj
      by_cases h : js.1 = 0
      · have hb : (js.1 == 0) = true := by simp [h]
        rw [if_pos hb, if_pos h]
      · have hb : (js.1 == 0) = false := by simp [h]
        rw [if_neg (by rw [hb]; simp), if_neg h]
    have hbo : rv (bo X js.1) i = if js.1 = 0 then rv X.e2 i else rv X.e1 i := by
      unfold bo
      by_cases h : js.1 = 0
      · have hb : (js.1 == 0) = true := by simp [h]
        rw [if_pos hb, if_pos h]
      · have hb : (js.1 == 0) = false := by simp [h]
        rw [if_neg (by rw [hb]; simp), if_neg h]
    have hfx : (js.2 : ℝ) * (X.tc.2 * X.tw.2) * w0 * (if js.1 = 0 then rv X.e1 i else rv X.e2 i) +
        (X.tc.2 * X.tw.2) * w0 * w2 * (if js.1 = 0 then rv X.e2 i else rv X.e1 i) =
        (X.tc.2 * X.tw.2) * (y1 * rv X.e1 i + y2 * rv X.e2 i) := by
      rw [← hf]; ring
    have hτ' : (X.tc.1 : ℝ) * X.tw.2 + X.tw.1 * X.tc.2 * ((τ - TC) / TW) = X.tc.2 * X.tw.2 * τ := by
      simp only [TC, TW]; field_simp; ring
    have hR : ((X.tc.2 : ℝ) * X.tw.2 * X.ed) * (τ / X.ed * rv X.n i + y1 / X.ed * rv X.e1 i +
        y2 / X.ed * rv X.e2 i) = X.tc.2 * X.tw.2 * (τ * rv X.n i + y1 * rv X.e1 i + y2 * rv X.e2 i) := by
      field_simp
    have hcast : ∀ (a : ℤ) (b : List ℤ), ((a * nth b i.val 0 : ℤ) : ℝ) = (a : ℝ) * rv b i := by
      intro a b; push_cast; rfl
    unfold fxv
    simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
      Matrix.tail_cons]
    rw [hdec, hcast, hcast, hcast, hcast, hbj, hbo]
    unfold kScale
    push_cast
    linear_combination (rv X.n i) * hτ' + hfx - hR

/-! ## The substitution on a face -/

/-- The context of the face `(j, sg)` (as `localOkT` builds it). -/
def ctx (P : Prob) (X : S3) (j : ℕ) (sg : ℤ) : FCtx :=
  ⟨(rotPoly P.ps P.nb).1, (rotPoly P.ps P.nb).2, faceX P.nb X j sg, kScale X⟩

theorem faceX_WF {ps : List ℕ} (X : S3) (j : ℕ) (sg : ℤ) :
    ∀ q ∈ faceX (2 ^ ps.length) X j sg, PolySemG.WF ps q := by
  intro q hq
  obtain ⟨i, hi, rfl⟩ := List.mem_iff_getElem.1 hq
  have hi3 : i < 3 := by simpa [faceX_length] using hi
  have := (faceX_spec (ps := ps) X j sg i hi3 (fun _ => 0)).1
  unfold nth at this
  rwa [List.getD_eq_getElem _ _ hi] at this

/-- **`sub` on a face**: at `w`, with `faceX(w) = K·x`, `sub P c p` is `K⁴ · p(x)`. -/
theorem sub_spec {P : Prob} (hwf : WF P) {X : S3} (hX : tubeOk X = true) (j : ℕ) (sg : ℤ)
    {p : Poly} (hp : PolySemG.WF P.ps p) (hdeg : degLe 4 p = true) (w : Fin 3 → ℝ)
    {x : Fin 3 → ℝ} (hx : ∀ i : Fin 3, fxv X j sg i.val w = (kScale X : ℝ) * x i) :
    PolySemG.WF P.ps (sub P (ctx P X j sg) p) ∧
      pEval P.ps (sub P (ctx P X j sg) p) w = (kScale X : ℝ) ^ 4 * pEval P.ps p x := by
  have hK := kScale_pos hX
  have hK0 : kScale X ≠ 0 := by
    intro h; rw [h] at hK; simp at hK
  have hs : sub P (ctx P X j sg) p = subst P.ps (faceX (2 ^ P.ps.length) X j sg)
      (homScale (kScale X) 4 p) := by
    simp only [sub, ctx]; rw [hwf.nb]
  obtain ⟨hw1, hv1⟩ := homScale_spec (ps := P.ps) (kScale X) hK0 4
    (subV P.ps (faceX (2 ^ P.ps.length) X j sg) w) p hp hdeg
  obtain ⟨hw2, hv2⟩ := subst_spec _ (faceX_WF X j sg) w _ hw1
  rw [hs]
  refine ⟨hw2, ?_⟩
  rw [hv2, hv1]
  congr 2
  funext i
  simp only [subV]
  rw [(faceX_spec X j sg i.val i.isLt w).2, hx i]
  field_simp

/-! ## The single leaves -/

theorem nth_lt {α : Type*} {l : List α} {k : ℕ} (hk : k < l.length) (d : α) : nth l k d = l[k] := by
  unfold nth; rw [List.getD_eq_getElem _ _ hk]

/-- The parts of `candsOk` that the leaves use. -/
theorem candsOk_spec {P : Prob} {X : S3} {cands : List Cand} (h : candsOk P X cands = true) :
    ∀ c ∈ cands, candOk P c = true ∧
      degLe 4 (LocalG.FP P c (rotPoly P.ps P.nb).1 (rotPoly P.ps P.nb).2) = true ∧
      ∀ a ∈ LocalG.AIL P c (rotPoly P.ps P.nb).1, degLe 4 a = true := by
  intro c hc
  unfold candsOk at h
  simp only [Bool.and_eq_true, List.all_eq_true] at h
  have := h.2 c hc
  simp only [LocalG.candPolys_eq, Bool.and_eq_true, List.all_eq_true] at this
  exact ⟨this.1.1.1.1.1.1.1, this.1.1.1.1.2, this.1.1.1.2⟩

theorem pos_of_mul_K {K v : ℝ} (hK : 0 < K) (h : 0 ≤ K * v) : 0 ≤ v := by
  by_contra hneg
  push Not at hneg
  have := mul_neg_of_pos_of_neg hK hneg
  linarith

/-- **A single leaf.** At a point `w` of an accepted single leaf on the face `(j, sg)` (`ρ = w 0 ≥ 0`),
with `faceX(w) = K·x` and `R` the rotation at `x`, every feasible `(R, t, S)` has `S ≥ S*`. -/
theorem single_leaf {P : Prob} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hKb : 0 < Kb)
    (hwf : WF P) (hd : Dens P) (hsd : 0 < P.sstar.den) (hD0 : 0 < D0r P) (hrden : 0 < P.rden)
    {X : S3} (hX : tubeOk X = true) {cands : List Cand} (hcands : candsOk P X cands = true)
    (hcw : ∀ c ∈ cands, ∀ v ∈ c.minv, LenV P.ps v) {j : ℕ} {sg : ℤ} {b : LBox} {ci : ℕ}
    (hl : b.lo.length = 3) (hh : b.hi.length = 3)
    (hzw : (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id = true)
    (hs : singleOk P P.rden cands (ctx P X j sg) b ci = true)
    {w : Fin 3 → ℝ} (hzb : InL b (fun k => (P.rden : ℝ) * w k)) (hw0 : 0 ≤ w 0)
    {x : Fin 3 → ℝ} (hx : ∀ i : Fin 3, fxv X j sg i.val w = (kScale X : ℝ) * x i)
    {R : M3} (hNv : 0 < pEval P.ps (rotPoly P.ps P.nb).2 x)
    (he : ∀ a b : Fin 3, pEval P.ps (nth (rotPoly P.ps P.nb).1 (3 * a.val + b.val) []) x =
      pEval P.ps (rotPoly P.ps P.nb).2 x * R a b)
    {t : E3} {S : ℝ}
    (hLP : polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S) :
    Ss P ≤ S := by
  have hK := kScale_pos hX
  have h4 : (0 : ℝ) < (kScale X : ℝ) ^ 4 := by positivity
  have hden : (0 : ℝ) < P.rden := by exact_mod_cast hrden
  have hzy : (fun k => (fun k => (P.rden : ℝ) * w k) k / (P.rden : ℝ)) = w := by
    funext k; field_simp
  obtain ⟨hRqW, hNW, -, -⟩ := LocalG.rotPoly_spec P.ps x
  rw [← hwf.nb] at hRqW hNW
  -- unpack the leaf
  unfold singleOk at hs
  simp only [LocalG.candPolys_eq, Bool.and_eq_true, decide_eq_true_eq, List.all_eq_true] at hs
  obtain ⟨⟨hci, hG⟩, hA⟩ := hs
  have hcdm : cands[ci] ∈ cands := List.getElem_mem hci
  rw [nth_lt hci] at hG hA
  have hctxR : (ctx P X j sg).Rq = (rotPoly P.ps P.nb).1 := rfl
  have hctxN : (ctx P X j sg).N = (rotPoly P.ps P.nb).2 := rfl
  simp only [hctxR, hctxN] at hG hA
  obtain ⟨hcand, hdegF, hdegA⟩ := candsOk_spec hcands _ hcdm
  obtain ⟨hFev, hAev⟩ := LocalG.cand_eval hwf (hcw _ hcdm) hRqW hNW x
  -- `F ≥ 0`
  have hFx : 0 ≤ pEval P.ps (LocalG.FP P cands[ci] (rotPoly P.ps P.nb).1 (rotPoly P.ps P.nb).2) x := by
    obtain ⟨hsw, hsv⟩ := sub_spec hwf hX j sg hFev.1 hdegF w hx
    rcases hdv : divRho (sub P (ctx P X j sg)
        (LocalG.FP P cands[ci] (rotPoly P.ps P.nb).1 (rotPoly P.ps P.nb).2)) with _ | G
    · rw [hdv] at hG; simp at hG
    · rw [hdv] at hG
      simp only at hG
      obtain ⟨hGw, hGv⟩ := divRho_spec w _ G hsw hdv
      have hG0 := LocalG.lbPos_nonneg hb hKb hrden hGw hl hh hzw hG hzb
      rw [hzy] at hG0
      refine pos_of_mul_K h4 ?_
      rw [← hsv, hGv]; exact mul_nonneg hw0 hG0
  -- `A_j ≥ 0`
  have hAx : ∀ a ∈ LocalG.AIL P cands[ci] (rotPoly P.ps P.nb).1, 0 ≤ pEval P.ps a x := by
    intro a ha
    have haw : PolySemG.WF P.ps a := by
      unfold LocalG.AIL at ha
      simp only [List.mem_map, List.mem_range] at ha
      obtain ⟨j', _, rfl⟩ := ha
      exact (hAev j').1
    obtain ⟨hsw, hsv⟩ := sub_spec hwf hX j sg haw (hdegA a ha) w hx
    have hp := hA a ha
    refine pos_of_mul_K h4 ?_
    rw [← hsv]
    by_cases hz : fIsZero (constTerm P.nb a) = true
    · rw [if_pos hz] at hp
      rcases hdv : divRho (sub P (ctx P X j sg) a) with _ | H
      · rw [hdv] at hp; simp at hp
      · rw [hdv] at hp
        simp only at hp
        obtain ⟨hHw, hHv⟩ := divRho_spec w _ H hsw hdv
        have h0 := LocalG.lbPos_nonneg hb hKb hrden hHw hl hh hzw hp hzb
        rw [hzy] at h0
        rw [hHv]; exact mul_nonneg hw0 h0
    · rw [if_neg hz] at hp
      have h0 := LocalG.lbPos_nonneg hb hKb hrden hsw hl hh hzw hp hzb
      rw [hzy] at h0
      exact h0
  have hA' : ∀ j' < 3, 0 ≤ LocalG.AV P cands[ci]
      (fun t => pEval P.ps (nth (rotPoly P.ps P.nb).1 t []) x) j' := by
    intro j' hj
    have := hAx _ (List.mem_map_of_mem (f := LocalG.AIP P cands[ci] (rotPoly P.ps P.nb).1)
      (List.mem_range.2 hj))
    rw [(hAev j').2] at this
    exact this
  have hF : 0 ≤ LocalG.FV P cands[ci] (fun t => pEval P.ps (nth (rotPoly P.ps P.nb).1 t []) x)
      (pEval P.ps (rotPoly P.ps P.nb).2 x) := by
    rw [hFev.2] at hFx; exact hFx
  exact LocalG.cand_bound hwf hd hsd hD0 hcand (hcw _ hcdm) hNv he hLP hA' hF

/-! ## Unpacking `localOkT` -/

/-- The root box of a face of the tube (units of `rden`): `0 ≤ ρ ≤ r0`, `|a₁|, |a₂| ≤ 1`. -/
def rootT (P : Prob) (X : S3) : LBox :=
  ⟨[0, -P.rden, -P.rden], [X.rho0.1 * P.rden / (X.rho0.2 : ℤ), P.rden, P.rden]⟩

def runT (P : Prob) (X : S3) (cands : List Cand) (x : (ℕ × ℤ) × List LTokT) : LStateT :=
  x.2.foldl (lstepT P X P.rden cands (ctx P X x.1.1 x.1.2)) ⟨[rootT P X], true, 0, 0, 0⟩

def stepT (P : Prob) (X : S3) (cands : List Cand) (acc : Bool × List ℕ × ℕ × ℕ)
    (x : (ℕ × ℤ) × List LTokT) : Bool × List ℕ × ℕ × ℕ :=
  (acc.1 && faceIdentOk P cands (ctx P X x.1.1 x.1.2) && (runT P X cands x).ok &&
      (runT P X cands x).stack.isEmpty,
    acc.2.1 ++ [(runT P X cands x).nAcc], acc.2.2.1 + (runT P X cands x).nS,
    acc.2.2.2 + (runT P X cands x).nM)

def resT (P : Prob) (X : S3) (cands : List Cand) (faces : List (List LTokT)) :
    Bool × List ℕ × ℕ × ℕ :=
  (List.zip tubeFaces faces).foldl (stepT P X cands) (true, [], 0, 0)

theorem localOkT_eq (P : Prob) (X : S3) (cands : List Cand) (faces : List (List LTokT)) :
    (localOkT P X cands faces).1 =
      (candsOk P X cands && tubeOk X &&
        ((X.rho0.1 * P.rden / (X.rho0.2 : ℤ)) * (X.rho0.2 : ℤ) == X.rho0.1 * P.rden &&
          decide (0 < X.rho0.1 * P.rden / (X.rho0.2 : ℤ))) &&
        faces.length == 4 && (resT P X cands faces).1) := rfl

theorem stepT_false (P : Prob) (X : S3) (cands : List Cand) :
    ∀ (l : List ((ℕ × ℤ) × List LTokT)) (k0 : List ℕ) (k1 k2 : ℕ),
      (l.foldl (stepT P X cands) (false, k0, k1, k2)).1 = false := by
  intro l; induction l with
  | nil => intro k0 k1 k2; rfl
  | cons y l ih2 =>
    intro k0 k1 k2; rw [List.foldl_cons]
    exact ih2 _ _ _

theorem foldl_stepT (P : Prob) (X : S3) (cands : List Cand) :
    ∀ (l : List ((ℕ × ℤ) × List LTokT)) (b : Bool) (k0 : List ℕ) (k1 k2 : ℕ),
    (l.foldl (stepT P X cands) (b, k0, k1, k2)).1 = true →
    ∀ x ∈ l, (runT P X cands x).ok = true ∧ (runT P X cands x).stack.isEmpty = true := by
  intro l
  induction l with
  | nil => intro b k0 k1 k2 _; simp
  | cons a l ih =>
    intro b k0 k1 k2 hb
    rw [List.foldl_cons] at hb
    have hst : stepT P X cands (b, k0, k1, k2) a = ((b && faceIdentOk P cands (ctx P X a.1.1 a.1.2) &&
        (runT P X cands a).ok && (runT P X cands a).stack.isEmpty),
        k0 ++ [(runT P X cands a).nAcc], k1 + (runT P X cands a).nS,
        k2 + (runT P X cands a).nM) := rfl
    rw [hst] at hb
    have h1 : (b && faceIdentOk P cands (ctx P X a.1.1 a.1.2) && (runT P X cands a).ok &&
        (runT P X cands a).stack.isEmpty) = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [hc, stepT_false] at hb
      exact Bool.false_ne_true hb
    rw [Bool.and_eq_true, Bool.and_eq_true] at h1
    intro x hx
    rcases List.mem_cons.1 hx with rfl | hx
    · exact ⟨h1.1.2, h1.2⟩
    · exact ih _ _ _ _ hb x hx

theorem localOkT_unpack {P : Prob} {X : S3} {cands : List Cand} {faces : List (List LTokT)}
    (h : (localOkT P X cands faces).1 = true) :
    candsOk P X cands = true ∧ tubeOk X = true ∧
    (X.rho0.1 * P.rden / (X.rho0.2 : ℤ)) * (X.rho0.2 : ℤ) = X.rho0.1 * P.rden ∧
    faces.length = 4 ∧
    ∀ x ∈ List.zip tubeFaces faces, (runT P X cands x).ok = true ∧ (runT P X cands x).stack = [] := by
  rw [localOkT_eq] at h
  rw [Bool.and_eq_true, Bool.and_eq_true, Bool.and_eq_true, Bool.and_eq_true] at h
  obtain ⟨⟨⟨⟨hc, hX⟩, hrr⟩, hlen⟩, hres⟩ := h
  rw [Bool.and_eq_true, beq_iff_eq] at hrr
  rw [beq_iff_eq] at hlen
  refine ⟨hc, hX, hrr.1, hlen, ?_⟩
  intro x hx
  have := foldl_stepT P X cands (List.zip tubeFaces faces) true [] 0 0 hres x hx
  exact ⟨this.1, List.isEmpty_iff.1 this.2⟩

/-! ## The local region of the tube -/

/-- **The mixed leaves are sound** (the statement of Lemma W (i)(ii) for one mixed leaf; D45_s4_design
8.7, the remaining part of stage 5b). -/
def MixSound (P : Prob) (X : S3) (cands : List Cand) : Prop :=
  ∀ (j : ℕ) (sg : ℤ) (b : LBox) (al : List ℕ) (ws cs : List (ℕ × ℕ)),
    b.lo.length = 3 → b.hi.length = 3 →
    (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id = true →
    mixOk P X P.rden cands (ctx P X j sg) b al ws cs = true →
    ∀ (w x : Fin 3 → ℝ), InL b (fun k => (P.rden : ℝ) * w k) → 0 ≤ w 0 →
    (∀ i : Fin 3, fxv X j sg i.val w = (kScale X : ℝ) * x i) →
    ∀ (R : M3), 0 < pEval P.ps (rotPoly P.ps P.nb).2 x →
    (∀ a b : Fin 3, pEval P.ps (nth (rotPoly P.ps P.nb).1 (3 * a.val + b.val) []) x =
      pEval P.ps (rotPoly P.ps P.nb).2 x * R a b) →
    ∀ (t : E3) (S : ℝ),
    polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S → Ss P ≤ S

/-- **The local region of octinico.** If `localOkT` passes and the mixed leaves are sound, every
feasible `(R, t, S)` with `R` a point `u` of chart 0 in the tube has `S ≥ S*`. -/
theorem local_mainT {P : Prob} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hKb : 0 < Kb)
    (hwf : WF P) (hd : Dens P) (hsd : 0 < P.sstar.den) (hD0 : 0 < D0r P) (hrden : 0 < P.rden)
    {X : S3} {cands : List Cand} {faces : List (List LTokT)}
    (hloc : (localOkT P X cands faces).1 = true) (hmix : MixSound P X cands)
    (hcw : ∀ c ∈ cands, ∀ v ∈ c.minv, LenV P.ps v)
    {R : M3} {u : Fin 3 → ℝ} (hc : Charts.ChartPt R P.rden 0 u) (hu : InTube X P.rden u)
    {t : E3} {S : ℝ}
    (hLP : polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S) :
    Ss P ≤ S := by
  obtain ⟨hcands, hX, hr, hlen, hruns⟩ := localOkT_unpack hloc
  have hden : (0 : ℝ) < P.rden := by exact_mod_cast hrden
  set x : Fin 3 → ℝ := fun i => u i / P.rden with hxdef
  have hx : ∀ i, x i = u i / P.rden := fun i => rfl
  -- the rotation at `x`
  have hrq := LocalG.chart_local hden hc hx
  obtain ⟨_, _, hmap, hNv⟩ := LocalG.rotPoly_spec P.ps x
  rw [← hwf.nb] at hmap hNv
  have hNx0 : 0 < pEval P.ps (rotPoly P.ps P.nb).2 x := by rw [hNv]; positivity
  have hlenRq : (rotPoly P.ps P.nb).1.length = 9 := by
    have := congrArg List.length hmap; simpa [QuadSem.rqList] using this
  have he : ∀ a b : Fin 3, pEval P.ps (nth (rotPoly P.ps P.nb).1 (3 * a.val + b.val) []) x =
      pEval P.ps (rotPoly P.ps P.nb).2 x * R a b := by
    intro a b
    have hab : 3 * a.val + b.val < (rotPoly P.ps P.nb).1.length := by rw [hlenRq]; omega
    have := LocalG.map_getD hmap hab
    rw [hrq] at this
    rw [this, hNv]
    fin_cases a <;> fin_cases b <;> rfl
  -- the face and the point
  obtain ⟨js, hjs, w, hw0, hw0', hw1, hw2, hfx⟩ := tube_face_point hX hrden hu
  obtain ⟨toks, htm⟩ := LocalG.zip_mem (by rw [hlen]; rfl) hjs
  obtain ⟨hok, hst⟩ := hruns _ htm
  obtain ⟨-, -, -, -, -, -, -, -, hr0d, -, -, -, -, -, -⟩ := tubeOk_spec hX
  have hroot : InL (rootT P X) (fun k => (P.rden : ℝ) * w k) := by
    have hrd2 : (0 : ℝ) < X.rho0.2 := by exact_mod_cast hr0d
    have hr' : ((X.rho0.1 * P.rden / (X.rho0.2 : ℤ) : ℤ) : ℝ) = X.rho0.1 * P.rden / X.rho0.2 := by
      have : ((X.rho0.1 * P.rden / (X.rho0.2 : ℤ) : ℤ) : ℝ) * X.rho0.2 = X.rho0.1 * P.rden := by
        exact_mod_cast hr
      field_simp; linarith
    have hw0'' : (P.rden : ℝ) * w 0 ≤ X.rho0.1 * P.rden / X.rho0.2 := by
      have := mul_le_mul_of_nonneg_left hw0' hden.le
      unfold qv2 at this
      calc (P.rden : ℝ) * w 0 ≤ P.rden * (X.rho0.1 / X.rho0.2) := this
        _ = X.rho0.1 * P.rden / X.rho0.2 := by ring
    have a1 := abs_le.1 hw1
    have a2 := abs_le.1 hw2
    intro k
    fin_cases k <;> simp [rootT, nth] <;> first
      | (rw [hr']; exact ⟨by positivity, hw0''⟩)
      | (constructor <;> nlinarith)
  obtain ⟨B, ⟨hl3, hh3, hzw, hleaf⟩, hzB⟩ :=
    ltrun_cover P X P.rden cands (ctx P X js.1 js.2) toks _ hok hst _
      ⟨rootT P X, List.mem_singleton_self _, hroot⟩
  rcases hleaf with ⟨ci, hs⟩ | ⟨al, ws, cs, hm⟩
  · exact single_leaf hb hKb hwf hd hsd hD0 hrden hX hcands hcw hl3 hh3 hzw hs hzB hw0 hfx hNx0 he hLP
  · exact hmix js.1 js.2 B al ws cs hl3 hh3 hzw hm w x hzB hw0 hfx R hNx0 he t S hLP

end

#assert_std_axioms PackLean.Formal.LocalTubeMain.local_mainT PackLean.Formal.LocalTubeMain.single_leaf
  PackLean.Formal.LocalTubeMain.tube_face_point

end PackLean.Formal.LocalTubeMain
