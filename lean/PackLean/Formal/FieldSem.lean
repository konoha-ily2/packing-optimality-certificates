import Mathlib
import PackLean.D28.Core
import PackLean.AxiomAudit

/-!
# D45 stage 4a: meaning of the number-field elements `FE` for any list of square roots

The checkers (`D28.Core`, `D16.Core`) represent a number of `ℚ(√p₁, …, √p_k)` with integer coefficients
as a list `FE` of `2^k` integers, split recursively: for `ps = p :: ps'` the first half is the part
without `√p`, the second half the coefficient of `√p` (both over `ℚ(√ps')`).  This is exactly the
recursion of `fmul` and `fsign`.

This file gives an `FE` a real value `fval ps a` by the same recursion and proves, for **every** `ps`
(with positive entries), that the operations of the checkers respect it:

* `fadd`, `fsub` (`fval_zipWith`), `fsmul`, `fneg`, `fzero`, `fofInt`, `fIsZero`;
* `fmul`: `fval_fmul` (the product);
* `fsign`: `fsign_spec` (the sign of the value; the rule "if the two halves have opposite signs, compare
  `a² − p b²`" is correct for any `p > 0`).

This replaces the ad-hoc `fv` (`ps = []`, `PolySem`) and `fv2` (`ps = [2]`, `PolySem2`) of the
`cubinoct_n02` proof; `fval_two` checks the agreement with `fv2`'s formula.  It is what the six cases of
`D16.Core` (`ps = [5]` and `ps = [5, 2]`) need.

Invariant: `a.length = 2 ^ ps.length`.
-/

namespace PackLean.Formal.FieldSem

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign)

/-- The value of `a ∈ ℚ(√ps)` (integer coefficients), by the recursion of `fmul`. -/
noncomputable def fval : List ℕ → FE → ℝ
  | [], a => ((a.headD 0 : ℤ) : ℝ)
  | p :: ps, a => fval ps (a.take (a.length / 2)) + √(p : ℝ) * fval ps (a.drop (a.length / 2))

/-- The length invariant. -/
def Len (ps : List ℕ) (a : FE) : Prop := a.length = 2 ^ ps.length

theorem fval_nil (a : FE) : fval [] a = ((a.headD 0 : ℤ) : ℝ) := rfl

theorem fval_cons (p : ℕ) (ps : List ℕ) (a : FE) :
    fval (p :: ps) a = fval ps (a.take (a.length / 2)) + √(p : ℝ) * fval ps (a.drop (a.length / 2)) := rfl

/-! ## Halves -/

theorem half_pow (k : ℕ) : 2 ^ (k + 1) / 2 = 2 ^ k := by
  rw [Nat.pow_succ, Nat.mul_div_cancel _ (by norm_num)]

theorem len_take {ps : List ℕ} {p : ℕ} {a : FE} (h : Len (p :: ps) a) :
    Len ps (a.take (a.length / 2)) := by
  unfold Len at *
  simp only [List.length_cons] at h
  rw [List.length_take, h, half_pow]
  have : 2 ^ ps.length ≤ 2 ^ (ps.length + 1) := Nat.pow_le_pow_right (by norm_num) (by omega)
  omega

theorem len_drop {ps : List ℕ} {p : ℕ} {a : FE} (h : Len (p :: ps) a) :
    Len ps (a.drop (a.length / 2)) := by
  unfold Len at *
  simp only [List.length_cons] at h
  rw [List.length_drop, h, half_pow, Nat.pow_succ]
  omega

theorem len_one {a : FE} (h : Len [] a) : ∃ x, a = [x] := by
  unfold Len at h
  match a, h with
  | [x], _ => exact ⟨x, rfl⟩

/-! ## Linear operations -/

/-- A list of zeros has value `0` (any length). -/
theorem fval_of_zero : ∀ (ps : List ℕ) (a : FE), (∀ x ∈ a, x = 0) → fval ps a = 0
  | [], a, h => by
    cases a with
    | nil => simp [fval]
    | cons x l => simp [fval, h x (List.mem_cons_self ..)]
  | p :: ps, a, h => by
    rw [fval_cons, fval_of_zero ps _ (fun x hx => h x (List.mem_of_mem_take hx)),
      fval_of_zero ps _ (fun x hx => h x (List.mem_of_mem_drop hx))]
    ring

theorem fval_of_isZero (ps : List ℕ) {a : FE} (h : fIsZero a = true) : fval ps a = 0 := by
  refine fval_of_zero ps a (fun x hx => ?_)
  have := List.all_eq_true.1 h x hx
  simpa using this

theorem fval_fzero (ps : List ℕ) (nb : ℕ) : fval ps (fzero nb) = 0 :=
  fval_of_zero ps _ (fun x hx => by simp [fzero] at hx; exact hx.2)

/-- `zipWith` of a linear integer map (both lists of the right length). -/
theorem fval_zipWith (f : ℤ → ℤ → ℤ) (α β : ℝ) (hf : ∀ x y, ((f x y : ℤ) : ℝ) = α * x + β * y) :
    ∀ (ps : List ℕ) (a b : FE), Len ps a → Len ps b →
      Len ps (List.zipWith f a b) ∧ fval ps (List.zipWith f a b) = α * fval ps a + β * fval ps b
  | [], a, b, ha, hb => by
    obtain ⟨x, rfl⟩ := len_one ha
    obtain ⟨y, rfl⟩ := len_one hb
    exact ⟨rfl, by simp [fval, hf]⟩
  | p :: ps, a, b, ha, hb => by
    have hl : (List.zipWith f a b).length = a.length := by
      rw [List.length_zipWith, ha, hb, Nat.min_self]
    have hab : b.length = a.length := by rw [ha, hb]
    obtain ⟨h0, e0⟩ := fval_zipWith f α β hf ps _ _ (len_take ha) (len_take hb)
    obtain ⟨h1, e1⟩ := fval_zipWith f α β hf ps _ _ (len_drop ha) (len_drop hb)
    refine ⟨by unfold Len at *; rw [hl, ha], ?_⟩
    rw [fval_cons, fval_cons, fval_cons, hl, List.take_zipWith, List.drop_zipWith]
    rw [hab] at e0 e1 ⊢
    rw [e0, e1]
    ring

theorem fval_fadd {ps : List ℕ} {a b : FE} (ha : Len ps a) (hb : Len ps b) :
    fval ps (fadd a b) = fval ps a + fval ps b := by
  have := (fval_zipWith (· + ·) 1 1 (fun x y => by push_cast; ring) ps a b ha hb).2
  simpa [fadd] using this

theorem len_fadd {ps : List ℕ} {a b : FE} (ha : Len ps a) (hb : Len ps b) : Len ps (fadd a b) :=
  (fval_zipWith (· + ·) 1 1 (fun x y => by push_cast; ring) ps a b ha hb).1

theorem fval_fsub {ps : List ℕ} {a b : FE} (ha : Len ps a) (hb : Len ps b) :
    fval ps (fsub a b) = fval ps a - fval ps b := by
  have := (fval_zipWith (· - ·) 1 (-1) (fun x y => by push_cast; ring) ps a b ha hb).2
  simp only [fsub]; rw [this]; ring

theorem len_fsub {ps : List ℕ} {a b : FE} (ha : Len ps a) (hb : Len ps b) : Len ps (fsub a b) :=
  (fval_zipWith (· - ·) 1 (-1) (fun x y => by push_cast; ring) ps a b ha hb).1

theorem headD_map_mul (c : ℤ) (a : FE) : (a.map (fun x => c * x)).headD 0 = c * a.headD 0 := by
  cases a <;> simp

/-- Scaling by an integer (no length condition). -/
theorem fval_fsmul : ∀ (ps : List ℕ) (c : ℤ) (a : FE), fval ps (fsmul c a) = c * fval ps a
  | [], c, a => by cases a <;> simp [fval, fsmul]
  | p :: ps, c, a => by
    simp only [fsmul] at *
    rw [fval_cons, fval_cons, List.length_map, ← List.map_take, ← List.map_drop]
    have e0 := fval_fsmul ps c (a.take (a.length / 2))
    have e1 := fval_fsmul ps c (a.drop (a.length / 2))
    simp only [fsmul] at e0 e1
    rw [e0, e1]; ring

theorem len_fsmul {ps : List ℕ} (c : ℤ) {a : FE} (ha : Len ps a) : Len ps (fsmul c a) := by
  unfold Len at *; simpa [fsmul] using ha

theorem fval_fneg (ps : List ℕ) (a : FE) : fval ps (fneg a) = -fval ps a := by
  have h : fneg a = fsmul (-1) a := by simp [fneg, fsmul]
  rw [h, fval_fsmul]; push_cast; ring

theorem len_fneg {ps : List ℕ} {a : FE} (ha : Len ps a) : Len ps (fneg a) := by
  unfold Len at *; simpa [fneg] using ha

/-- A list whose tail is zero has the value of its head. -/
theorem fval_head : ∀ (ps : List ℕ) (a : FE), Len ps a → (∀ x ∈ a.tail, x = 0) →
    fval ps a = ((a.headD 0 : ℤ) : ℝ)
  | [], a, _, _ => rfl
  | p :: ps, a, ha, hz => by
    have hpos : 1 ≤ a.length / 2 := by
      unfold Len at ha; simp only [List.length_cons] at ha
      rw [ha, half_pow]; exact Nat.one_le_two_pow
    obtain ⟨x, l, rfl⟩ : ∃ x l, a = x :: l := by
      cases a with
      | nil => simp at hpos
      | cons x l => exact ⟨x, l, rfl⟩
    rw [fval_cons]
    have h1 := fval_head ps ((x :: l).take ((x :: l).length / 2)) (len_take ha) (by
      intro y hy
      obtain ⟨k, hk⟩ : ∃ k, (x :: l).length / 2 = k + 1 := ⟨_, (Nat.succ_pred_eq_of_pos hpos).symm⟩
      rw [hk, List.take_succ_cons, List.tail_cons] at hy
      exact hz y (List.mem_of_mem_take hy))
    have h2 := fval_of_zero ps ((x :: l).drop ((x :: l).length / 2)) (by
      intro y hy
      obtain ⟨k, hk⟩ : ∃ k, (x :: l).length / 2 = k + 1 := ⟨_, (Nat.succ_pred_eq_of_pos hpos).symm⟩
      rw [hk, List.drop_succ_cons] at hy
      exact hz y (List.mem_of_mem_drop hy))
    rw [h1, h2]
    obtain ⟨k, hk⟩ : ∃ k, (x :: l).length / 2 = k + 1 := ⟨_, (Nat.succ_pred_eq_of_pos hpos).symm⟩
    rw [hk, List.take_succ_cons]
    simp

theorem fval_fofInt (ps : List ℕ) (c : ℤ) : fval ps (fofInt (2 ^ ps.length) c) = c := by
  have h := fval_head ps (fofInt (2 ^ ps.length) c)
    (by unfold Len fofInt; simp only [List.length_cons, List.length_replicate]
        have := Nat.one_le_two_pow (n := ps.length); omega)
    (by intro x hx; simp [fofInt] at hx; exact hx.2)
  rw [h]; simp [fofInt]

theorem len_fofInt (ps : List ℕ) (c : ℤ) : Len ps (fofInt (2 ^ ps.length) c) := by
  unfold Len fofInt; simp only [List.length_cons, List.length_replicate]
  have := Nat.one_le_two_pow (n := ps.length); omega

theorem len_fzero (ps : List ℕ) : Len ps (fzero (2 ^ ps.length)) := by
  unfold Len fzero; simp

/-! ## Product -/

theorem fmul_spec : ∀ (ps : List ℕ) (a b : FE), Len ps a → Len ps b →
    Len ps (fmul ps a b) ∧ fval ps (fmul ps a b) = fval ps a * fval ps b
  | [], a, b, _, _ => ⟨rfl, by simp [fmul, fval]⟩
  | p :: ps, a, b, ha, hb => by
    have hab : b.length / 2 = a.length / 2 := by rw [ha, hb]
    obtain ⟨l00, e00⟩ := fmul_spec ps _ _ (len_take ha) (len_take hb)
    obtain ⟨l11, e11⟩ := fmul_spec ps _ _ (len_drop ha) (len_drop hb)
    obtain ⟨l01, e01⟩ := fmul_spec ps _ _ (len_take ha) (len_drop hb)
    obtain ⟨l10, e10⟩ := fmul_spec ps _ _ (len_drop ha) (len_take hb)
    rw [hab] at l00 e00 l11 e11 l01 e01 l10 e10
    simp only [fmul]
    set A0 := a.take (a.length / 2)
    set A1 := a.drop (a.length / 2)
    set B0 := b.take (a.length / 2)
    set B1 := b.drop (a.length / 2)
    have hL := len_fadd l00 (len_fsmul (p : ℤ) l11)
    have hM := len_fadd l01 l10
    have hLM : (fadd (fmul ps A0 B0) (fsmul (p : ℤ) (fmul ps A1 B1)) ++
        fadd (fmul ps A0 B1) (fmul ps A1 B0)).length / 2 = 2 ^ ps.length := by
      rw [List.length_append, hL, hM, ← two_mul, Nat.mul_div_cancel_left _ (by norm_num)]
    refine ⟨?_, ?_⟩
    · unfold Len at *; rw [List.length_append, hL, hM, List.length_cons, Nat.pow_succ]; ring
    · rw [fval_cons, hLM, List.take_left' hL, List.drop_left' hL, fval_fadd l00 (len_fsmul _ l11),
        fval_fsmul, fval_fadd l01 l10, e00, e11, e01, e10, fval_cons, fval_cons, hab]
      have hp : √(p : ℝ) * √(p : ℝ) = p := Real.mul_self_sqrt (Nat.cast_nonneg p)
      push_cast
      linear_combination (-(fval ps A1 * fval ps B1)) * hp

theorem fval_fmul {ps : List ℕ} {a b : FE} (ha : Len ps a) (hb : Len ps b) :
    fval ps (fmul ps a b) = fval ps a * fval ps b := (fmul_spec ps a b ha hb).2

theorem len_fmul {ps : List ℕ} {a b : FE} (ha : Len ps a) (hb : Len ps b) : Len ps (fmul ps a b) :=
  (fmul_spec ps a b ha hb).1

/-! ## Sign -/

/-- The sign of a real number as an integer. -/
noncomputable def sgn (r : ℝ) : ℤ := if 0 < r then 1 else if r < 0 then -1 else 0

theorem sgn_pos {r : ℝ} (h : 0 < r) : sgn r = 1 := by simp [sgn, h]
theorem sgn_neg {r : ℝ} (h : r < 0) : sgn r = -1 := by simp [sgn, h, not_lt.2 h.le]
theorem sgn_zero : sgn 0 = 0 := by simp [sgn]

theorem sgn_int (n : ℤ) : Int.sign n = sgn (n : ℝ) := by
  rcases lt_trichotomy n 0 with h | rfl | h
  · rw [Int.sign_eq_neg_one_of_neg h, sgn_neg (by exact_mod_cast h)]
  · simp [sgn]
  · rw [Int.sign_eq_one_of_pos h, sgn_pos (by exact_mod_cast h)]

theorem sgn_mul_pos {c r : ℝ} (hc : 0 < c) : sgn (c * r) = sgn r := by
  rcases lt_trichotomy r 0 with h | rfl | h
  · rw [sgn_neg (mul_neg_of_pos_of_neg hc h), sgn_neg h]
  · simp
  · rw [sgn_pos (mul_pos hc h), sgn_pos h]

/-- The combination rule of `fsign` is correct for real numbers `u`, `w`. -/
theorem sgn_combo (u w : ℝ) :
    (if sgn w == 0 then sgn u else if sgn u == 0 then sgn w else if sgn u == sgn w then sgn u else
      if sgn (u * u - w * w) > 0 then sgn u else if sgn (u * u - w * w) < 0 then sgn w else 0)
      = sgn (u + w) := by
  rcases lt_trichotomy u 0 with hu | rfl | hu <;> rcases lt_trichotomy w 0 with hw | rfl | hw
  · rw [sgn_neg hu, sgn_neg hw, sgn_neg (show u + w < 0 by linarith)]; simp
  · simp [sgn_neg hu, sgn_zero]
  · rw [sgn_neg hu, sgn_pos hw]
    simp only [show ((-1 : ℤ) == 0) = false from rfl, show ((1 : ℤ) == 0) = false from rfl,
      show ((-1 : ℤ) == 1) = false from rfl, Bool.false_eq_true, ite_false]
    rcases lt_trichotomy (u * u - w * w) 0 with hd | hd | hd
    · rw [sgn_neg hd, sgn_pos (by nlinarith)]; decide
    · rw [hd, sgn_zero, show u + w = 0 by nlinarith, sgn_zero]; decide
    · rw [sgn_pos hd, sgn_neg (by nlinarith)]; decide
  · simp [sgn_neg hw, sgn_zero]
  · simp [sgn_zero]
  · simp [sgn_pos hw, sgn_zero]
  · rw [sgn_pos hu, sgn_neg hw]
    simp only [show ((-1 : ℤ) == 0) = false from rfl, show ((1 : ℤ) == 0) = false from rfl,
      show ((1 : ℤ) == -1) = false from rfl, Bool.false_eq_true, ite_false]
    rcases lt_trichotomy (u * u - w * w) 0 with hd | hd | hd
    · rw [sgn_neg hd, sgn_neg (by nlinarith)]; decide
    · rw [hd, sgn_zero, show u + w = 0 by nlinarith, sgn_zero]; decide
    · rw [sgn_pos hd, sgn_pos (by nlinarith)]; decide
  · simp [sgn_pos hu, sgn_zero]
  · rw [sgn_pos hu, sgn_pos hw, sgn_pos (show 0 < u + w by linarith)]; simp

/-- **`fsign` is the sign of the value** (all primes positive, lengths `2^k`). -/
theorem fsign_spec : ∀ (ps : List ℕ), (∀ p ∈ ps, 0 < p) → ∀ a : FE, Len ps a →
    fsign ps a = sgn (fval ps a)
  | [], _, a, _ => by simp only [fsign, fval]; exact sgn_int _
  | p :: ps, hps, a, ha => by
    have hp : 0 < p := hps p (List.mem_cons_self ..)
    have hps' : ∀ q ∈ ps, 0 < q := fun q hq => hps q (List.mem_cons_of_mem _ hq)
    have hA := len_take ha
    have hB := len_drop ha
    have hsp : 0 < √(p : ℝ) := Real.sqrt_pos.2 (by exact_mod_cast hp)
    have hsa := fsign_spec ps hps' _ hA
    have hsb := fsign_spec ps hps' _ hB
    have hd := fsign_spec ps hps' _ (len_fsub (len_fmul hA hA) (len_fsmul (p : ℤ) (len_fmul hB hB)))
    rw [fval_fsub (len_fmul hA hA) (len_fsmul _ (len_fmul hB hB)), fval_fsmul, fval_fmul hA hA,
      fval_fmul hB hB] at hd
    set u := fval ps (a.take (a.length / 2))
    set v := fval ps (a.drop (a.length / 2))
    have hw : sgn (√(p : ℝ) * v) = sgn v := sgn_mul_pos hsp
    have hpp : ((p : ℤ) : ℝ) * (v * v) = (√(p : ℝ) * v) * (√(p : ℝ) * v) := by
      have := Real.mul_self_sqrt (Nat.cast_nonneg (α := ℝ) p)
      push_cast; linear_combination (-(v * v)) * this
    rw [hpp] at hd
    rw [fval_cons, ← sgn_combo u (√(p : ℝ) * v), hw]
    simp only [fsign]
    rw [hsa, hsb, hd]

/-! ## Agreement with the `ps = [2]` value of the `cubinoct_n02` proof -/

theorem fval_two (a0 a1 : ℤ) : fval [2] [a0, a1] = a0 + a1 * √2 := by
  simp [fval]; ring

#assert_std_axioms PackLean.Formal.FieldSem.fmul_spec PackLean.Formal.FieldSem.fsign_spec
  PackLean.Formal.FieldSem.fval_zipWith PackLean.Formal.FieldSem.fval_fofInt PackLean.Formal.FieldSem.fval_two

end PackLean.Formal.FieldSem
