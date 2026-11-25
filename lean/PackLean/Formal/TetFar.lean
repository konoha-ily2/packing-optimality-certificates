import PackLean.Formal.FarAccept
import PackLean.Formal.FarG
import PackLean.Formal.TetSep
import PackLean.D28.Core

/-!
# A9 stage 7b (part 1): meaning of the far checks of `D28.Core` (icointet, cubintet)

Design: `plan/A9f_tet_design.md` §4.  The far checker of `D28.Core` works on a box `N` of directions
`p = (x, y, 1)` (box coordinates `σ = (sx, sy) ∈ [-1, 1]²`) times a box of rotations (the quaternion
charts, box coordinates `s ∈ [-1, 1]³`).  Its quadratics are linear in `(1, sx, sy)` and quadratic in
`s` (three `Quad`s of coefficients, `lbOf`).

* `WF P`: the lengths of the data and the container normals `b_f` of `TetSep.bT` (`wf_of_ok`);
* `lbOf_le`: `lbOf` is a lower bound of `K · (G₀ + sx G₁ + sy G₂)` on `[-1, 1]⁵`;
* `accept_low` (token `A`): `farLb ≥ 0` gives, at every direction of the box and every rotation of
  the box, the dual bound of `TetReduction.Low` (weights `μ = p · b₂`) at least `k + β y`;
* `disc_trace` (token `D`): `discLb > 0` gives `tr(R K) > tr(R)` for the symmetry `K` of the piece;
* `rots_krot`: `rotsOk` puts every listed symmetry in `Krot` (orthogonal, `det = 1`, vertices to
  vertices).
-/

namespace PackLean.Formal.TetFar

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign QF Quad RBox rboxQ rboxWf
  rotQ combine nth vecGet monoLb loHi quadKind Prob NBox nboxWf lbOf farLb discLb rotsOk)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.QuadSem
  PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.PolySemG (BracketG maskOf)
open PackLean.Formal.TetSep (bT)
open PackLean.Formal.FarG (mat three_of_len vecGet_three lenV_three fval_congr orth_of_ok mem_nth exists_nth
  mv_of_matVec det_mat)
open scoped Matrix

noncomputable section

/-! ## Lengths -/

/-- The lengths of the data that the far checks use, and the container of `TetSep`. -/
structure WF (P : Prob) : Prop where
  pos : ∀ p ∈ P.ps, 0 < p
  nb : P.nb = 2 ^ P.ps.length
  verts : ∀ v ∈ P.verts, LenV P.ps v
  rots : ∀ K ∈ P.rots, K.length = 3 ∧ ∀ r ∈ K, LenV P.ps r
  c0 : Len P.ps P.c0.num
  beta : Len P.ps P.beta.num
  bvec : P.bvec = [[-1, -1, -1], [-1, 1, 1], [1, -1, 1], [1, 1, -1]]
  btop : P.btop = 2
  dv : 0 < P.dv
  dk : 0 < P.dk
  c0d : 0 < P.c0.den
  bd : 0 < P.beta.den
  nden : 0 < P.nden
  rden : 0 < P.rden
  mask : P.maskp = maskOf P.ps

def wfOk (P : Prob) : Bool :=
  P.ps.all (fun p => decide (0 < p)) && P.nb == 2 ^ P.ps.length &&
  P.verts.all (lenVOk P.ps) && P.rots.all (fun K => K.length == 3 && K.all (lenVOk P.ps)) &&
  P.c0.num.length == 2 ^ P.ps.length && P.beta.num.length == 2 ^ P.ps.length &&
  P.bvec == [[-1, -1, -1], [-1, 1, 1], [1, -1, 1], [1, 1, -1]] && P.btop == 2 &&
  decide (0 < P.dv) && decide (0 < P.dk) && decide (0 < P.c0.den) && decide (0 < P.beta.den) &&
  decide (0 < P.nden) && decide (0 < P.rden) && P.maskp == maskOf P.ps

theorem wf_of_ok {P : Prob} (h : wfOk P = true) : WF P := by
  simp only [wfOk, Bool.and_eq_true, beq_iff_eq, List.all_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨hp, hnb⟩, hv⟩, hr⟩, hc0⟩, hbe⟩, hbv⟩, hbt⟩, hdv⟩, hdk⟩, hcd⟩, hbd⟩, hnd⟩, hrd⟩,
    hm⟩ := h
  exact ⟨hp, hnb, fun v hv' => lenV_of_ok (hv v hv'),
    fun K hK => ⟨(hr K hK).1, fun r hr' => lenV_of_ok ((hr K hK).2 r hr')⟩, hc0, hbe, hbv, hbt, hdv,
    hdk, hcd, hbd, hnd, hrd, hm⟩

/-- `sqbOk` gives the bracket with `K = 2 ^ sqk` (as `PolySemG.bracket_of_sqbOk` for `D16`). -/
theorem bracket_of_sqbOk {P : Prob} (hwf : WF P) (h : PackLean.D28.sqbOk P = true) :
    BracketG P.sqb (maskOf P.ps) ((2 : ℝ) ^ P.sqk) := by
  rw [← hwf.mask]
  simp only [PackLean.D28.sqbOk, Bool.and_eq_true, beq_iff_eq, List.all_eq_true] at h
  obtain ⟨⟨h1, h2⟩, h4⟩ := h
  refine ⟨by rw [h1, h2], ?_⟩
  intro x hx
  obtain ⟨⟨a, b⟩, p⟩ := x
  have hx' := h4 _ hx
  simp only at hx' ⊢
  have hK : (0 : ℝ) ≤ 2 ^ P.sqk := by positivity
  have hsq : (2 : ℝ) ^ P.sqk * √(p : ℝ) = √((p : ℝ) * 4 ^ P.sqk) := by
    rw [Real.sqrt_mul (Nat.cast_nonneg p), show (4 : ℝ) ^ P.sqk = ((2 : ℝ) ^ P.sqk) ^ 2 by
      rw [← pow_mul, mul_comm, pow_mul]; norm_num, Real.sqrt_sq hK]
    ring
  split_ifs at hx' with hp1
  · have hp : (p : ℤ) = 1 := hp1
    simp only [Bool.and_eq_true, beq_iff_eq] at hx'
    obtain ⟨rfl, rfl⟩ := hx'
    have : (p : ℝ) = 1 := by exact_mod_cast hp
    rw [this, Real.sqrt_one]
    push_cast
    simp
  · simp only [Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at hx'
    obtain ⟨⟨⟨ha0, rfl⟩, hlo⟩, hhi⟩ := hx'
    have hlo' : (a : ℝ) * a ≤ (p : ℝ) * 4 ^ P.sqk := by exact_mod_cast hlo
    have hhi' : (p : ℝ) * 4 ^ P.sqk < ((a + 1 : ℤ) : ℝ) * ((a + 1 : ℤ) : ℝ) := by exact_mod_cast hhi
    have ha0' : (0 : ℝ) ≤ a := by exact_mod_cast ha0
    rw [hsq]
    constructor
    · exact Real.le_sqrt_of_sq_le (by nlinarith)
    · rw [Real.sqrt_le_left]
      · nlinarith
      · push_cast; linarith

/-! ## `lbOf` -/

theorem foldl_add_eq {α : Type*} (f : α → ℤ) :
    ∀ (L : List α) (a : ℤ), L.foldl (fun acc x => acc + f x) a = a + (L.map f).sum
  | [], a => by simp
  | x :: L, a => by
    simp only [List.foldl_cons, List.map_cons, List.sum_cons]
    rw [foldl_add_eq f L]
    ring

/-- A monomial of kind 2 ("any sign"): a lower bound of `K · c · t` for every `|t| ≤ 1`. -/
theorem kind2_lb {ps : List ℕ} {sqb : List (ℤ × ℤ)} {K : ℝ} (hb : BracketG sqb (maskOf ps) K)
    {g : FE} (hg : Len ps g) {t : ℝ} (ht : |t| ≤ 1) :
    ((monoLb 2 (loHi sqb g) : ℤ) : ℝ) ≤ K * (fval ps g * t) := by
  obtain ⟨hlo, hhi⟩ := PolySemG.loHi_spec hb hg
  set lo := (loHi sqb g).1
  set hi := (loHi sqb g).2
  set v := K * fval ps g
  have hm : (max lo.natAbs hi.natAbs : ℤ) = max |lo| |hi| := by
    push_cast [Nat.cast_max, Int.natCast_natAbs]; rfl
  have hv : |v| ≤ max (|lo| : ℝ) |hi| := by
    rw [abs_le]
    constructor
    · have : -(max (|lo| : ℝ) |hi|) ≤ lo := by
        have := neg_abs_le (lo : ℝ); have := le_max_left (|lo| : ℝ) |hi|; linarith
      linarith
    · have : (hi : ℝ) ≤ max (|lo| : ℝ) |hi| := (le_abs_self _).trans (le_max_right _ _)
      linarith
  have hvt : -|v| ≤ v * t := by
    have := abs_mul v t
    have h1 : |v * t| ≤ |v| := by rw [abs_mul]; exact mul_le_of_le_one_right (abs_nonneg _) ht
    linarith [neg_abs_le (v * t)]
  simp only [monoLb]
  rw [← mul_assoc]
  have : ((-(max lo.natAbs hi.natAbs : ℤ) : ℤ) : ℝ) = -(max (|lo| : ℝ) |hi|) := by
    rw [hm]; push_cast; rfl
  rw [this]
  linarith

theorem qmono_abs {s : Fin 3 → ℝ} (hs : ∀ i, |s i| ≤ 1) (i : ℕ) : |(qmono s).getD i 0| ≤ 1 := by
  have h0 := hs 0; have h1 := hs 1; have h2 := hs 2
  have m : ∀ a b : ℝ, |a| ≤ 1 → |b| ≤ 1 → |a * b| ≤ 1 := fun a b ha hb => by
    rw [abs_mul]; exact mul_le_one₀ ha (abs_nonneg _) hb
  rcases i with _ | _ | _ | _ | _ | _ | _ | _ | _ | _ | i <;>
    simp only [qmono, List.getD_cons_zero, List.getD_cons_succ, List.getD_nil, abs_one, abs_zero,
      le_refl, zero_le_one, pow_two] <;>
    (first | exact h0 | exact h1 | exact h2 | exact m _ _ h0 h0 | exact m _ _ h0 h1 | exact m _ _ h0 h2 | exact m _ _ h1 h1 | exact m _ _ h1 h2 | exact m _ _ h2 h2 | simp)

/-- The inner sum of `lbOf` for the coefficient `e` of `(1, sx, sy)`. -/
theorem inner_lb {ps : List ℕ} {sqb : List (ℤ × ℤ)} {K : ℝ} (hb : BracketG sqb (maskOf ps) K)
    {s : Fin 3 → ℝ} (hs : ∀ i, |s i| ≤ 1) {e : ℕ} {σ : ℝ} (hσ : e = 0 → σ = 1) (hσ1 : |σ| ≤ 1)
    {G : List FE} (hG : AccOk ps G) :
    (((List.zip (List.range 10) G).map (fun mc : ℕ × FE => monoLb (quadKind e mc.1)
        (loHi sqb mc.2))).sum : ℝ) ≤ K * (σ * gEval ps G s) := by
  obtain ⟨hl, ha⟩ := hG
  have key : ∀ i < 10, ∀ g : FE, Len ps g →
      ((monoLb (quadKind e i) (loHi sqb g) : ℤ) : ℝ) ≤ K * (fval ps g * (σ * (qmono s).getD i 0)) := by
    intro i hi g hg
    rcases Nat.eq_zero_or_pos e with he | he
    · have := qterm_lb s hb hs i hi g hg
      rw [hσ he, one_mul]
      subst he; exact this
    · have hk : quadKind e i = 2 := by
        unfold quadKind; simp [show (e == 0) = false by simpa using he.ne']
      rw [hk]
      refine kind2_lb hb hg ?_
      rw [abs_mul]; exact mul_le_one₀ hσ1 (abs_nonneg _) (qmono_abs hs i)
  match G, hl, ha with
  | [g0, g1, g2, g3, g4, g5, g6, g7, g8, g9], _, ha =>
    have h0 := key 0 (by norm_num) g0 (ha _ (by simp))
    have h1 := key 1 (by norm_num) g1 (ha _ (by simp))
    have h2 := key 2 (by norm_num) g2 (ha _ (by simp))
    have h3 := key 3 (by norm_num) g3 (ha _ (by simp))
    have h4 := key 4 (by norm_num) g4 (ha _ (by simp))
    have h5 := key 5 (by norm_num) g5 (ha _ (by simp))
    have h6 := key 6 (by norm_num) g6 (ha _ (by simp))
    have h7 := key 7 (by norm_num) g7 (ha _ (by simp))
    have h8 := key 8 (by norm_num) g8 (ha _ (by simp))
    have h9 := key 9 (by norm_num) g9 (ha _ (by simp))
    simp only [qmono, List.getD_cons_zero, List.getD_cons_succ] at h0 h1 h2 h3 h4 h5 h6 h7 h8 h9
    simp only [show List.range 10 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] from rfl, List.zip_cons_cons,
      List.zip_nil_left, List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, gEval, qmono,
      List.zipWith_cons_cons, List.zipWith_nil_left]
    push_cast
    linarith

/-- **`lbOf`** is a lower bound of `K · (G₀ + sx G₁ + sy G₂)` on `[-1, 1]⁵`. -/
theorem lbOf_le (P : Prob) {K : ℝ} (hb : BracketG P.sqb (maskOf P.ps) K) {s : Fin 3 → ℝ}
    (hs : ∀ i, |s i| ≤ 1) {sx sy : ℝ} (hsx : |sx| ≤ 1) (hsy : |sy| ≤ 1) {G0 G1 G2 : List FE}
    (h0 : AccOk P.ps G0) (h1 : AccOk P.ps G1) (h2 : AccOk P.ps G2) :
    (lbOf P [G0, G1, G2] : ℝ)
      ≤ K * (gEval P.ps G0 s + sx * gEval P.ps G1 s + sy * gEval P.ps G2 s) := by
  have i0 := inner_lb hb hs (e := 0) (σ := 1) (fun _ => rfl) (by norm_num) h0
  have i1 := inner_lb hb hs (e := 1) (σ := sx) (fun h => absurd h (by norm_num)) hsx h1
  have i2 := inner_lb hb hs (e := 2) (σ := sy) (fun h => absurd h (by norm_num)) hsy h2
  unfold lbOf
  simp only [show List.range 3 = [0, 1, 2] from rfl, List.zip_cons_cons, List.zip_nil_left,
    List.foldl_cons, List.foldl_nil]
  rw [foldl_add_eq (fun mc : ℕ × FE => monoLb (quadKind 2 mc.1) (loHi P.sqb mc.2)),
    foldl_add_eq (fun mc : ℕ × FE => monoLb (quadKind 1 mc.1) (loHi P.sqb mc.2)),
    foldl_add_eq (fun mc : ℕ × FE => monoLb (quadKind 0 mc.1) (loHi P.sqb mc.2))]
  simp only [Int.cast_add, Int.cast_zero, zero_add]
  linarith

/-! ## The accepted far boxes (`farLb`) -/

section Accept

variable (P : Prob) (nb : NBox)

/-- `n · NDEN` by coefficient of `(1, sx, sy)` (as in `farLb`). -/
def nNL : List (List ℤ) :=
  [[(nb.l0 + nb.h0) / 2, (nb.h0 - nb.l0) / 2, 0], [(nb.l1 + nb.h1) / 2, 0, (nb.h1 - nb.l1) / 2],
   [P.nden, 0, 0]]

/-- `b · (n · NDEN)`, coefficient `e` (as in `farLb`). -/
def dotN (nN : List (List ℤ)) (b : List ℤ) (e : ℕ) : ℤ :=
  (List.zip b nN).foldl (fun s (x : ℤ × List ℤ) => s + x.1 * nth x.2 e 0) 0

/-- The coefficient of `Rq_ij` in the `e`-th quadratic of `farLb` (copied). -/
def coE (v0 : ℕ) (vf : List ℕ) (i j e : ℕ) : FE :=
  let k := P.nb
  let nN := nNL P nb
  let bt := nth P.bvec P.btop []
  let L : Int := (P.c0.den : Int) * P.beta.den * nb.kden
  let V0 := nth P.verts v0 []
  let base := fsmul (4 * nth (nth nN i []) e 0) (vecGet V0 j k)
  let rest := (List.range 4).foldl (fun acc f =>
    if f == P.btop then acc else
      let bf := nth P.bvec f []
      let wf := dotN nN (List.zipWith (· - ·) bt bf) e
      fadd acc (fsmul (wf * nth bf i 0) (vecGet (nth P.verts (nth vf f 0) []) j k))) (fzero k)
  fsmul L (fadd base rest)

/-- The coefficient of `N` in the `e`-th quadratic of `farLb` (copied). -/
def coN (e : ℕ) : FE :=
  let k := P.nb
  let nN := nNL P nb
  let bt := nth P.bvec P.btop []
  let mN := dotN nN bt e
  let t1 := fsmul (mN * P.beta.den * nb.kden) P.c0.num
  let t2 := if e == 0 then fofInt k (P.nden * nb.knum * P.c0.den * P.beta.den) else fzero k
  let t3 := fsmul (nth (nth nN 1 []) e 0 * P.c0.den * nb.kden) P.beta.num
  fsmul (-(4 * (P.dv : Int))) (fadd (fadd t1 t2) t3)

/-- The terms of the `e`-th quadratic. -/
def termsE (rb : RBox) (v0 : ℕ) (vf : List ℕ) (e : ℕ) : List (FE × Quad) :=
  ((List.range 9).map (fun ij => (coE P nb v0 vf (ij / 3) (ij % 3) e,
    nth (rotQ (rboxQ P.rden rb)).1 ij []))) ++ [(coN P nb e, (rotQ (rboxQ P.rden rb)).2)]

theorem farLb_eq (rb : RBox) (v0 : ℕ) (vf : List ℕ) :
    farLb P nb rb v0 vf = lbOf P [combine P.nb (termsE P nb rb v0 vf 0),
      combine P.nb (termsE P nb rb v0 vf 1), combine P.nb (termsE P nb rb v0 vf 2)] := rfl

/-- The integer entries of `nNL`. -/
def nn (i e : ℕ) : ℤ := nth (nth (nNL P nb) i []) e 0

theorem dotN_eq (a b c : ℤ) (e : ℕ) :
    dotN (nNL P nb) [a, b, c] e = a * nn P nb 0 e + b * nn P nb 1 e + c * nn P nb 2 e := by
  simp [dotN, nNL, nn, nth]

/-- The value of an entry of a vertex (no denominator). -/
def ev (l j : ℕ) : ℝ := ent P.ps P.nb (nth P.verts l []) j

variable {P}

theorem coE_val (hwf : WF P) (v0 f0 f1 f2 f3 i j e : ℕ) :
    Len P.ps (coE P nb v0 [f0, f1, f2, f3] i j e) ∧
    fval P.ps (coE P nb v0 [f0, f1, f2, f3] i j e)
      = ((P.c0.den : ℤ) * P.beta.den * nb.kden : ℤ) * (
          ((4 * nn P nb i e : ℤ) : ℝ) * ev P v0 j
          + (((2 * nn P nb 0 e + 2 * nn P nb 2 e) * nth [-1, -1, -1] i 0 : ℤ) : ℝ) * ev P f0 j
          + (((2 * nn P nb 0 e - 2 * nn P nb 1 e) * nth [-1, 1, 1] i 0 : ℤ) : ℝ) * ev P f1 j
          + (((-2 * nn P nb 1 e + 2 * nn P nb 2 e) * nth [1, 1, -1] i 0 : ℤ) : ℝ) * ev P f3 j) := by
  have lv : ∀ l, Len P.ps (vecGet (nth P.verts l []) j P.nb) := fun l => len_get hwf.nb hwf.verts l j
  have lz : Len P.ps (fzero P.nb) := by rw [hwf.nb]; exact len_fzero _
  have e1 : coE P nb v0 [f0, f1, f2, f3] i j e =
      fsmul ((P.c0.den : ℤ) * P.beta.den * nb.kden) (fadd (fsmul (4 * nn P nb i e)
        (vecGet (nth P.verts v0 []) j P.nb))
        (fadd (fadd (fadd (fzero P.nb)
          (fsmul ((2 * nn P nb 0 e + 2 * nn P nb 2 e) * nth [-1, -1, -1] i 0)
            (vecGet (nth P.verts f0 []) j P.nb)))
          (fsmul ((2 * nn P nb 0 e - 2 * nn P nb 1 e) * nth [-1, 1, 1] i 0)
            (vecGet (nth P.verts f1 []) j P.nb)))
          (fsmul ((-2 * nn P nb 1 e + 2 * nn P nb 2 e) * nth [1, 1, -1] i 0)
            (vecGet (nth P.verts f3 []) j P.nb)))) := by
    unfold coE
    simp only [hwf.bvec, hwf.btop, show List.range 4 = [0, 1, 2, 3] from rfl, List.foldl_cons,
      List.foldl_nil]
    simp only [nth, List.getD_cons_zero, List.getD_cons_succ, List.zipWith_cons_cons,
      List.zipWith_nil_left, beq_iff_eq, show (0 : ℕ) ≠ 2 from by norm_num,
      show (1 : ℕ) ≠ 2 from by norm_num, show (3 : ℕ) ≠ 2 from by norm_num, if_false, if_true,
      dotN_eq]
    simp only [nn, nth]
    ring_nf
  rw [e1]
  have l0 := len_fsmul ((2 * nn P nb 0 e + 2 * nn P nb 2 e) * nth [-1, -1, -1] i 0) (lv f0)
  have l1 := len_fsmul ((2 * nn P nb 0 e - 2 * nn P nb 1 e) * nth [-1, 1, 1] i 0) (lv f1)
  have l3 := len_fsmul ((-2 * nn P nb 1 e + 2 * nn P nb 2 e) * nth [1, 1, -1] i 0) (lv f3)
  have lb := len_fsmul (4 * nn P nb i e) (lv v0)
  have la := len_fadd lz l0
  have lc := len_fadd la l1
  have ld := len_fadd lc l3
  refine ⟨len_fsmul _ (len_fadd lb ld), ?_⟩
  rw [fval_fsmul, fval_fadd lb ld, fval_fadd lc l3, fval_fadd la l1, fval_fadd lz l0, fval_fzero,
    fval_fsmul, fval_fsmul, fval_fsmul, fval_fsmul]
  simp only [ev, ent]
  ring

variable (P)

/-- The values of the constants. -/
def c0r : ℝ := fval P.ps P.c0.num / P.c0.den
def betar : ℝ := fval P.ps P.beta.num / P.beta.den

variable {P}

theorem coN_val (hwf : WF P) (e : ℕ) :
    Len P.ps (coN P nb e) ∧
    fval P.ps (coN P nb e)
      = (-(4 * (P.dv : ℤ)) : ℤ) * (
          (((nn P nb 0 e - nn P nb 1 e + nn P nb 2 e) * P.beta.den * nb.kden : ℤ) : ℝ)
            * fval P.ps P.c0.num
          + (if e = 0 then (((P.nden * nb.knum * P.c0.den * P.beta.den : ℤ)) : ℝ) else 0)
          + ((nn P nb 1 e * P.c0.den * nb.kden : ℤ) : ℝ) * fval P.ps P.beta.num) := by
  have lz : Len P.ps (fzero P.nb) := by rw [hwf.nb]; exact len_fzero _
  have lo : Len P.ps (fofInt P.nb (P.nden * nb.knum * P.c0.den * P.beta.den)) := by
    rw [hwf.nb]; exact len_fofInt _ _
  have l1 := len_fsmul ((nn P nb 0 e - nn P nb 1 e + nn P nb 2 e) * P.beta.den * nb.kden) hwf.c0
  have l3 := len_fsmul (nn P nb 1 e * P.c0.den * nb.kden) hwf.beta
  have e1 : coN P nb e = fsmul (-(4 * (P.dv : Int))) (fadd (fadd
      (fsmul ((nn P nb 0 e - nn P nb 1 e + nn P nb 2 e) * P.beta.den * nb.kden) P.c0.num)
      (if e == 0 then fofInt P.nb (P.nden * nb.knum * P.c0.den * P.beta.den) else fzero P.nb))
      (fsmul (nn P nb 1 e * P.c0.den * nb.kden) P.beta.num)) := by
    unfold coN
    simp only [hwf.bvec, hwf.btop, nth, List.getD_cons_zero, List.getD_cons_succ, dotN_eq]
    simp only [nn, nth]
    ring_nf
  rw [e1]
  by_cases he : e = 0
  · subst he
    simp only [beq_self_eq_true, if_true]
    refine ⟨len_fsmul _ (len_fadd (len_fadd l1 lo) l3), ?_⟩
    rw [fval_fsmul, fval_fadd (len_fadd l1 lo) l3, fval_fadd l1 lo, fval_fsmul, fval_fsmul]
    have := fval_fofInt P.ps (P.nden * nb.knum * P.c0.den * P.beta.den)
    rw [← hwf.nb] at this
    rw [this]
    all_goals first | rfl | (push_cast; ring) | push_cast
  · have : (e == 0) = false := by simpa using he
    simp only [this, he, Bool.false_eq_true, if_false]
    refine ⟨len_fsmul _ (len_fadd (len_fadd l1 lz) l3), ?_⟩
    rw [fval_fsmul, fval_fadd (len_fadd l1 lz) l3, fval_fadd l1 lz, fval_fsmul, fval_fsmul,
      fval_fzero]
    all_goals first | rfl | (push_cast; ring) | push_cast

/-! ### The bound at a point of the box -/

variable (P)

/-- The direction of the box at the box coordinates `(sx, sy)` (in `nden` units). -/
def nx (sx : ℝ) : ℝ := (((nb.l0 + nb.h0) / 2 : ℤ) : ℝ) + (((nb.h0 - nb.l0) / 2 : ℤ) : ℝ) * sx
def ny (sy : ℝ) : ℝ := (((nb.l1 + nb.h1) / 2 : ℤ) : ℝ) + (((nb.h1 - nb.l1) / 2 : ℤ) : ℝ) * sy

/-- The real vertex `l` of the piece. -/
def VV (l : ℕ) : E3 := vec P.ps P.nb P.dv (nth P.verts l [])

/-- The dual bound of `TetReduction.Low` with the weights `μ = p · b₂`. -/
def dualB (p : E3) (R : M3) (v0 : ℕ) (lf : Fin 4 → ℕ) : ℝ :=
  dot p (mv R (VV P v0)) + 1 / 4 * ∑ f, (dot p (bT 2) - dot p (bT f)) * dot (bT f) (mv R (VV P (lf f)))
    - c0r P * dot p (bT 2)

variable {P}

theorem mem_rq {rb : RBox} {t : ℕ} (ht : t < 9) :
    (nth (rotQ (rboxQ P.rden rb)).1 t []).length = 10 := by
  obtain ⟨wq, xq, yq, zq, hq⟩ := rboxQ_four P.rden rb
  obtain ⟨hl9, hl10, _⟩ := rotQ_length wq xq yq zq
  rw [← hq] at hl9 hl10
  apply hl10
  unfold nth; rw [List.getD_eq_getElem _ _ (by omega)]; exact List.getElem_mem _

theorem termsE_ok (hwf : WF P) (rb : RBox) (v0 f0 f1 f2 f3 e : ℕ) :
    TermsOk P.ps (termsE P nb rb v0 [f0, f1, f2, f3] e) := by
  intro x hx
  simp only [termsE, List.mem_append, List.mem_map, List.mem_range, List.mem_singleton] at hx
  rcases hx with ⟨t, ht, rfl⟩ | rfl
  · exact ⟨(coE_val nb hwf v0 f0 f1 f2 f3 _ _ e).1, mem_rq ht⟩
  · refine ⟨(coN_val nb hwf e).1, ?_⟩
    obtain ⟨wq, xq, yq, zq, hq⟩ := rboxQ_four P.rden rb
    obtain ⟨_, _, hlN⟩ := rotQ_length wq xq yq zq
    rw [← hq] at hlN
    exact hlN

theorem gEval_termsE (hwf : WF P) (rb : RBox) (v0 f0 f1 f2 f3 e : ℕ) (s : Fin 3 → ℝ) :
    AccOk P.ps (combine P.nb (termsE P nb rb v0 [f0, f1, f2, f3] e)) ∧
    gEval P.ps (combine P.nb (termsE P nb rb v0 [f0, f1, f2, f3] e)) s
      = ((termsE P nb rb v0 [f0, f1, f2, f3] e).map fun t => fval P.ps t.1 * qEval t.2 s).sum := by
  have := gEval_combine (ps := P.ps) s (termsE_ok nb hwf rb v0 f0 f1 f2 f3 e)
  rw [← hwf.nb] at this
  exact this

/-- **An accepted far box** (token `A v0 f0 f1 f2 f3`): at every direction `p = (x, y, 1)` of the box
`nb` and every rotation `R` of the box `rb` (`Rq = Nv · R`, `Nv > 0`), the dual bound with the
weights `μ = p · b₂` and the vertices `v0`, `f_f` is at least `k + β y`. -/
theorem accept_low (hwf : WF P) {K : ℝ} (hb : BracketG P.sqb (maskOf P.ps) K) (hK : 0 < K)
    {rb : RBox} {v0 f0 f1 f2 f3 : ℕ} (hA : farLb P nb rb v0 [f0, f1, f2, f3] ≥ 0)
    {s : Fin 3 → ℝ} (hs : ∀ i, |s i| ≤ 1) {sx sy : ℝ} (hsx : |sx| ≤ 1) (hsy : |sy| ≤ 1)
    (hkd0 : 0 < nb.kden) {R : M3} {Nv : ℝ} (hNv : 0 < Nv)
    (hR : ∀ i j : Fin 3, qEval (nth (rotQ (rboxQ P.rden rb)).1 (3 * i.val + j.val) []) s = Nv * R i j)
    (hN : qEval (rotQ (rboxQ P.rden rb)).2 s = Nv) :
    (nb.knum : ℝ) / nb.kden + betar P * (ny nb sy / P.nden)
      ≤ dualB P !₂[nx nb sx / P.nden, ny nb sy / P.nden, 1] R v0 ![f0, f1, f2, f3] := by
  rw [farLb_eq] at hA
  obtain ⟨a0, g0⟩ := gEval_termsE nb hwf rb v0 f0 f1 f2 f3 0 s
  obtain ⟨a1, g1⟩ := gEval_termsE nb hwf rb v0 f0 f1 f2 f3 1 s
  obtain ⟨a2, g2⟩ := gEval_termsE nb hwf rb v0 f0 f1 f2 f3 2 s
  have hL := lbOf_le P hb hs hsx hsy a0 a1 a2
  rw [g0, g1, g2] at hL
  have h0 : (0 : ℝ) ≤ (lbOf P [combine P.nb (termsE P nb rb v0 [f0, f1, f2, f3] 0),
      combine P.nb (termsE P nb rb v0 [f0, f1, f2, f3] 1),
      combine P.nb (termsE P nb rb v0 [f0, f1, f2, f3] 2)] : ℝ) := by exact_mod_cast hA
  have e00 := hR 0 0; have e01 := hR 0 1; have e02 := hR 0 2
  have e10 := hR 1 0; have e11 := hR 1 1; have e12 := hR 1 2
  have e20 := hR 2 0; have e21 := hR 2 1; have e22 := hR 2 2
  simp only [Fin.val_zero, Fin.val_one, Fin.val_two] at e00 e01 e02 e10 e11 e12 e20 e21 e22
  norm_num at e00 e01 e02 e10 e11 e12 e20 e21 e22
  simp only [termsE, show List.range 9 = [0, 1, 2, 3, 4, 5, 6, 7, 8] from rfl, List.map_cons,
    List.map_nil, List.map_append, List.sum_append, List.sum_cons, List.sum_nil, add_zero,
    Nat.reduceDiv, Nat.reduceMod, e00, e01, e02, e10, e11, e12, e20, e21, e22, hN,
    (coE_val nb hwf v0 f0 f1 f2 f3 _ _ _).2, (coN_val nb hwf _).2] at hL
  simp only [nn, nNL, nth, List.getD_cons_zero, List.getD_cons_succ, List.getD_nil,
    if_true, show (1 : ℕ) ≠ 0 from by norm_num, show (2 : ℕ) ≠ 0 from by norm_num, if_false] at hL
  have hdv : (0 : ℝ) < P.dv := by exact_mod_cast hwf.dv
  have hc0 : (0 : ℝ) < P.c0.den := by exact_mod_cast hwf.c0d
  have hbd : (0 : ℝ) < P.beta.den := by exact_mod_cast hwf.bd
  have hnd : (0 : ℝ) < P.nden := by exact_mod_cast hwf.nden
  have hkd : (0 : ℝ) < nb.kden := by exact_mod_cast hkd0
  set D := dualB P !₂[nx nb sx / P.nden, ny nb sy / P.nden, 1] R v0 ![f0, f1, f2, f3]
    - ((nb.knum : ℝ) / nb.kden + betar P * (ny nb sy / P.nden)) with hD
  have hC : 0 < K * (Nv * ((P.c0.den : ℝ) * P.beta.den * nb.kden) * P.nden * 4 * P.dv) := by
    positivity
  have hfin : ∀ X : ℝ, (lbOf P [combine P.nb (termsE P nb rb v0 [f0, f1, f2, f3] 0),
      combine P.nb (termsE P nb rb v0 [f0, f1, f2, f3] 1),
      combine P.nb (termsE P nb rb v0 [f0, f1, f2, f3] 2)] : ℝ) ≤ X →
      X = K * (Nv * ((P.c0.den : ℝ) * P.beta.den * nb.kden) * P.nden * 4 * P.dv) * D → 0 ≤ D := by
    intro X h1 h2
    have h3 := le_trans h0 (h2 ▸ h1)
    by_contra hneg
    push Not at hneg
    have := mul_neg_of_pos_of_neg hC hneg
    linarith
  have hDn : 0 ≤ D := by
    refine hfin _ hL ?_
    rw [hD]
    simp only [dualB, VV, c0r, betar, nx, ny, dot, mv_apply, Fin.sum_univ_three, Fin.sum_univ_four,
      bT, vec_apply, ent, ev]
    simp
    field_simp
    ring
  linarith

end Accept

/-! ## The discarded far boxes (`discLb`) -/

section Disc


variable {P : Prob}

/-- The coefficient of `Rq_ij` in `discLb` (copied). -/
def dco (P : Prob) (m ij : ℕ) : FE :=
  let K := nth P.rots m []
  let i := ij / 3; let j := ij % 3
  let kji := vecGet (nth K j []) i P.nb
  if i == j then fsub kji (fofInt P.nb P.dk) else kji

theorem discLb_eq0 (P : Prob) (rb : RBox) (m : ℕ) :
    discLb P rb m = (List.zip (List.range 10) (combine P.nb ((List.range 9).map fun ij =>
      (dco P m ij, nth (rotQ (rboxQ P.rden rb)).1 ij [])))).foldl (fun acc (mc : ℕ × FE) =>
        acc + monoLb (quadKind 0 mc.1) (loHi P.sqb mc.2)) 0 := rfl

theorem discLb_eq (P : Prob) (rb : RBox) (m : ℕ) :
    discLb P rb m = ((List.zip (List.range 10) (combine P.nb ((List.range 9).map fun ij =>
      (dco P m ij, nth (rotQ (rboxQ P.rden rb)).1 ij [])))).map (fun mc : ℕ × FE =>
        monoLb (quadKind 0 mc.1) (loHi P.sqb mc.2))).sum := by
  rw [discLb_eq0, foldl_add_eq (fun mc : ℕ × FE => monoLb (quadKind 0 mc.1) (loHi P.sqb mc.2)),
    zero_add]

/-- The entry `K_ji` of the symmetry `m` (no denominator). -/
def kv (P : Prob) (m i j : ℕ) : ℝ := ent P.ps P.nb (nth (nth P.rots m []) i []) j

theorem dco_spec (hwf : WF P) (m ij : ℕ) :
    Len P.ps (dco P m ij) ∧ fval P.ps (dco P m ij)
      = kv P m (ij % 3) (ij / 3) - (if ij / 3 = ij % 3 then (P.dk : ℝ) else 0) := by
  have hl : Len P.ps (vecGet (nth (nth P.rots m []) (ij % 3) []) (ij / 3) P.nb) := by
    unfold vecGet nth
    rcases lt_or_ge m P.rots.length with hm | hm
    · rw [List.getD_eq_getElem _ _ hm]
      have hK := hwf.rots _ (List.getElem_mem hm)
      rcases lt_or_ge (ij % 3) (P.rots[m]).length with hj | hj
      · rw [List.getD_eq_getElem _ _ hj]
        exact len_get1 hwf.nb (hK.2 _ (List.getElem_mem hj)) _
      · rw [List.getD_eq_default _ _ hj]; simp only [List.getD_nil, hwf.nb]; exact len_fzero _
    · rw [List.getD_eq_default _ _ hm]; simp only [List.getD_nil, hwf.nb]; exact len_fzero _
  have lo : Len P.ps (fofInt P.nb (P.dk : ℤ)) := by rw [hwf.nb]; exact len_fofInt _ _
  unfold dco
  by_cases h : ij / 3 = ij % 3
  · have hb : (ij / 3 == ij % 3) = true := by simpa using h
    simp only [hb, ite_true, h, beq_self_eq_true]
    rw [h] at hl
    refine ⟨len_fsub hl lo, ?_⟩
    have hf := fval_fofInt P.ps (P.dk : ℤ)
    rw [← hwf.nb] at hf
    rw [fval_fsub hl lo, hf, kv, ent]
    push_cast; rfl
  · have : (ij / 3 == ij % 3) = false := by simpa using h
    simp only [this, h, ite_false, Bool.false_eq_true]
    exact ⟨hl, by rw [kv, ent]; simp⟩

/-- **A discarded box** (token `D m`): at a rotation `R` of the box (`Rq = Nv · R`, `Nv > 0`),
`tr(R K) > tr(R)` for the symmetry `K = rots[m] / dk`. -/
theorem disc_trace (hwf : WF P) {K : ℝ} (hb : BracketG P.sqb (maskOf P.ps) K) (hK : 0 < K)
    {rb : RBox} {m : ℕ} (hD : discLb P rb m > 0) {s : Fin 3 → ℝ} (hs : ∀ i, |s i| ≤ 1)
    {R : M3} {Nv : ℝ} (hNv : 0 < Nv)
    (hR : ∀ i j : Fin 3, qEval (nth (rotQ (rboxQ P.rden rb)).1 (3 * i.val + j.val) []) s = Nv * R i j) :
    R.trace < (R * mat P.ps P.nb P.dk (nth P.rots m [])).trace := by
  have hterms : TermsOk P.ps ((List.range 9).map fun ij =>
      (dco P m ij, nth (rotQ (rboxQ P.rden rb)).1 ij [])) := by
    intro x hx
    simp only [List.mem_map, List.mem_range] at hx
    obtain ⟨t, ht, rfl⟩ := hx
    exact ⟨(dco_spec hwf m t).1, mem_rq ht⟩
  obtain ⟨hacc, hg⟩ := gEval_combine (ps := P.ps) s hterms
  rw [← hwf.nb] at hacc hg
  have h1 := inner_lb hb hs (e := 0) (σ := 1) (fun _ => rfl) (by norm_num) hacc
  rw [← discLb_eq, one_mul, hg] at h1
  have h0 : (0 : ℝ) < discLb P rb m := by exact_mod_cast hD
  have hk : (0 : ℝ) < P.dk := by exact_mod_cast hwf.dk
  have e00 := hR 0 0; have e01 := hR 0 1; have e02 := hR 0 2
  have e10 := hR 1 0; have e11 := hR 1 1; have e12 := hR 1 2
  have e20 := hR 2 0; have e21 := hR 2 1; have e22 := hR 2 2
  simp only [Fin.val_zero, Fin.val_one, Fin.val_two] at e00 e01 e02 e10 e11 e12 e20 e21 e22
  norm_num at e00 e01 e02 e10 e11 e12 e20 e21 e22
  simp only [show List.range 9 = [0, 1, 2, 3, 4, 5, 6, 7, 8] from rfl, List.map_cons, List.map_nil,
    List.sum_cons, List.sum_nil, add_zero, (dco_spec hwf m _).2, Nat.reduceDiv, Nat.reduceMod,
    e00, e01, e02, e10, e11, e12, e20, e21, e22] at h1
  set X := (R * mat P.ps P.nb P.dk (nth P.rots m [])).trace - R.trace with hXdef
  have hfin : ∀ Y : ℝ, (discLb P rb m : ℝ) ≤ K * Y → Y = Nv * P.dk * X → 0 < X := by
    intro Y h2 h3
    rw [h3] at h2
    have : 0 < K * (Nv * P.dk * X) := lt_of_lt_of_le h0 h2
    have hpos : 0 < K * (Nv * P.dk) := by positivity
    by_contra hc
    push Not at hc
    nlinarith
  have hX := hfin _ h1 (by
    rw [hXdef]
    simp only [Matrix.trace, Matrix.diag, Matrix.mul_apply, Fin.sum_univ_three, mat, kv, ent]
    norm_num
    field_simp
    ring)
  linarith

end Disc

/-! ## The symmetries of the piece (`rotsOk`) -/

theorem det_expr {ps : List ℕ} {nb : ℕ} (hnb : nb = 2 ^ ps.length) {K : List (List FE)}
    (hK : K.length = 3 ∧ ∀ r ∈ K, LenV ps r) :
    let g (i j : ℕ) : FE := vecGet (nth K i []) j nb
    fval ps (fsub (fadd (fadd (fmul ps (g 0 0) (fsub (fmul ps (g 1 1) (g 2 2)) (fmul ps (g 1 2) (g 2 1))))
        (fmul ps (g 0 2) (fsub (fmul ps (g 1 0) (g 2 1)) (fmul ps (g 1 1) (g 2 0))))) (fzero nb))
        (fmul ps (g 0 1) (fsub (fmul ps (g 1 0) (g 2 2)) (fmul ps (g 1 2) (g 2 0)))))
      = (mat ps nb 1 K).det := by
  dsimp only
  subst hnb
  obtain ⟨r0, r1, r2, rfl⟩ := three_of_len hK.1
  have h0 := hK.2 r0 (by simp); have h1 := hK.2 r1 (by simp); have h2 := hK.2 r2 (by simp)
  obtain ⟨a0, a1, a2, rfl⟩ := three_of_len h0.1
  obtain ⟨b0, b1, b2, rfl⟩ := three_of_len h1.1
  obtain ⟨c0, c1, c2, rfl⟩ := three_of_len h2.1
  have la0 := h0.2 a0 (by simp); have la1 := h0.2 a1 (by simp); have la2 := h0.2 a2 (by simp)
  have lb0 := h1.2 b0 (by simp); have lb1 := h1.2 b1 (by simp); have lb2 := h1.2 b2 (by simp)
  have lc0 := h2.2 c0 (by simp); have lc1 := h2.2 c1 (by simp); have lc2 := h2.2 c2 (by simp)
  have lz := len_fzero ps
  simp only [nth, vecGet, List.getD_cons_zero, List.getD_cons_succ]
  rw [Matrix.det_fin_three]
  simp only [mat, FarAccept.ent, nth, vecGet, List.getD_cons_zero, List.getD_cons_succ, Nat.cast_one,
    div_one, Fin.isValue]
  simp only [Fin.val_zero, Fin.val_one, Fin.val_two, List.getD_cons_zero, List.getD_cons_succ]
  simp (config := { maxDischargeDepth := 12 }) only [fval_fsub, fval_fadd, fval_fmul, len_fsub, len_fadd,
    len_fmul, fval_fzero, la0, la1, la2, lb0, lb1, lb2, lc0, lc1, lc2, lz]
  ring

/-- **`rotsOk`**: every listed symmetry `K / dk` is a rotation of the piece (orthogonal, `det = 1`,
vertices to vertices), i.e. a member of `TetReduction.Krot (VV P) nv`. -/
theorem rots_krot {P : Prob} (hwf : WF P) (h : rotsOk P = true) {m : ℕ} (hm : m < P.rots.length) :
    (mat P.ps P.nb P.dk (nth P.rots m []))ᵀ * mat P.ps P.nb P.dk (nth P.rots m []) = 1 ∧
      (mat P.ps P.nb P.dk (nth P.rots m [])).det = 1 ∧
      ∀ l < P.verts.length, ∃ l' < P.verts.length,
        mv (mat P.ps P.nb P.dk (nth P.rots m [])) (VV P l) = VV P l' := by
  set K := nth P.rots m [] with hKdef
  have hKm : K ∈ P.rots := mem_nth hm _
  have hKw := hwf.rots K hKm
  have hK := List.all_eq_true.1 h K hKm
  simp only [Bool.and_eq_true] at hK
  obtain ⟨⟨horth, hdet⟩, hperm⟩ := hK
  refine ⟨?_, ?_, ?_⟩
  · refine orth_of_ok hwf.nb hwf.dk hKw ?_
    unfold PackLean.D16.orthOk
    simp only [Bool.and_eq_true]
    refine ⟨⟨by simp [hKw.1], ?_⟩, horth⟩
    rw [List.all_eq_true]
    intro r hr
    simp [(hKw.2 r hr).1]
  · have hv := det_expr hwf.nb hKw
    have hdv := fval_congr (ps := P.ps) (beq_iff_eq.1 hdet)
    rw [hv, hwf.nb, fval_fofInt, ← hwf.nb] at hdv
    rw [det_mat _ _ _ _ hwf.dk, hdv]
    have : (0 : ℝ) < P.dk := by exact_mod_cast hwf.dk
    push_cast
    field_simp
  · intro l hl
    have hvm : nth P.verts l [] ∈ P.verts := mem_nth hl _
    have hp := List.all_eq_true.1 hperm _ hvm
    obtain ⟨w, hw, hwe⟩ := List.any_eq_true.1 hp
    obtain ⟨l', hl', rfl⟩ := exists_nth hw []
    refine ⟨l', hl', ?_⟩
    have e1 : PackLean.D28.matVec P.ps K (nth P.verts l [])
        = PackLean.D16.matVec P.ps (2 ^ P.ps.length) K (nth P.verts l []) := rfl
    have e2 : (nth P.verts l' []).map (fsmul (P.dk : ℤ)) = PackLean.D16.vsmul P.dk (nth P.verts l' []) := rfl
    have hwe' := beq_iff_eq.1 hwe
    rw [e1, e2] at hwe'
    have := mv_of_matVec rfl hwf.dk hwf.dv hKw (lenV_nth hwf.verts hl)
      (lenV_nth hwf.verts hl') hwe'
    unfold VV
    rw [hwf.nb]
    exact this

end

#assert_std_axioms PackLean.Formal.TetFar.lbOf_le PackLean.Formal.TetFar.wf_of_ok
  PackLean.Formal.TetFar.bracket_of_sqbOk PackLean.Formal.TetFar.accept_low
  PackLean.Formal.TetFar.disc_trace PackLean.Formal.TetFar.rots_krot

end PackLean.Formal.TetFar
