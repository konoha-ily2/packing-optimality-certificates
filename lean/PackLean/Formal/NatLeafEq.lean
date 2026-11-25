import Mathlib
import PackLean.Kernel.NatLeaf

/-!
# E3f stage 1: the Nat-pair leaf judge has the values of the D28 leaf judge (the common layers)

Design: `plan/E3f_nat_leaf.md` §3.2 (layers 1 and 2).

* Layer 1 (`Z.toInt_*`, `loHi_toFE`, `k0_toInt`, `k1_toInt`, `k2_toInt`, `fold0_eq`, `foldE_eq`): `toInt` is a ring
  map on the pairs, `norm` keeps the value, and the √ bracket bounds `loZ`, `hiZ`, `k0`–`k2`, `lbE0`, `lbE` are the
  folds of `loHi` and `monoLb` that `lbOf` / `farLbT` / `discLbT` compute.
* Layer 2 (`combine_quadF`): `combine 2` of the nine `C_ij ⊗ Rq_ij` and `cN ⊗ N` of `rotQ (rboxQ d rb)` is the
  quadratic form `quadF (permS ch (symOf C cN))` at the centre and half widths of the box (an integer identity,
  `ring`, for each chart).

Nothing here is specific to D45DT; the coefficients `C_ij` of each case are its own layer 3.
-/

namespace PackLean.Formal.NatLeafEq

open PackLean.D28 (FE fadd fsub fsmul fzero Quad Aff affMul qadd qsub qsmul rotQ rboxQ combine RBox loHi
  monoLb quadKind nth)
open PackLean.Kernel.NatLeaf

/-! ## Layer 1: the pairs -/

namespace Z

@[simp] theorem toInt_mk (p n : ℕ) : Z.toInt ⟨p, n⟩ = (p : ℤ) - n := rfl

@[simp] theorem toInt_add (a b : Z) : (a.add b).toInt = a.toInt + b.toInt := by
  simp only [Z.add, Z.toInt, Nat.add_eq]; push_cast; ring

@[simp] theorem toInt_sub (a b : Z) : (a.sub b).toInt = a.toInt - b.toInt := by
  simp only [Z.sub, Z.toInt, Nat.add_eq]; push_cast; ring

@[simp] theorem toInt_mul (a b : Z) : (a.mul b).toInt = a.toInt * b.toInt := by
  simp only [Z.mul, Z.toInt, Nat.add_eq, Nat.mul_eq]; push_cast; ring

@[simp] theorem toInt_mulN (c : ℕ) (a : Z) : (Z.mulN c a).toInt = (c : ℤ) * a.toInt := by
  simp only [Z.mulN, Z.toInt, Nat.mul_eq]; push_cast; ring

theorem norm_p (a : Z) : (a.norm).p = a.toInt.toNat := by
  unfold Z.norm Z.toInt
  cases h : Nat.ble a.n a.p
  · rw [← Bool.not_eq_true, Nat.ble_eq] at h
    simp only [Bool.cond_false, Nat.sub_eq]; omega
  · simp only [Nat.ble_eq] at h
    simp only [Bool.cond_true, Nat.sub_eq]; omega

theorem norm_n (a : Z) : (a.norm).n = (-a.toInt).toNat := by
  unfold Z.norm Z.toInt
  cases h : Nat.ble a.n a.p
  · rw [← Bool.not_eq_true, Nat.ble_eq] at h
    simp only [Bool.cond_false, Nat.sub_eq]; omega
  · simp only [Nat.ble_eq] at h
    simp only [Bool.cond_true, Nat.sub_eq]; omega

@[simp] theorem toInt_norm (a : Z) : (a.norm).toInt = a.toInt := by
  rw [Z.toInt, norm_p, norm_n]; omega

theorem abs_eq (a : Z) : (a.abs : ℤ) = (a.toInt.natAbs : ℤ) := by
  unfold Z.abs Z.toInt
  cases h : Nat.ble a.n a.p
  · rw [← Bool.not_eq_true, Nat.ble_eq] at h
    simp only [Bool.cond_false, Nat.sub_eq]; omega
  · simp only [Nat.ble_eq] at h
    simp only [Bool.cond_true, Nat.sub_eq]; omega

@[simp] theorem toInt_ofInt (z : ℤ) : (Z.ofInt z).toInt = z := by
  cases z with
  | ofNat k => simp [Z.ofInt, Z.toInt]
  | negSucc k => simp [Z.ofInt, Z.toInt, Int.negSucc_eq]

end Z

/-- A field element as the D28 list `[a, b]`. -/
def toFE (x : F) : FE := [x.a.toInt, x.b.toInt]

@[simp] theorem F.add_a (x y : F) : (x.add y).a = x.a.add y.a := rfl
@[simp] theorem F.add_b (x y : F) : (x.add y).b = x.b.add y.b := rfl
@[simp] theorem F.sub_a (x y : F) : (x.sub y).a = x.a.sub y.a := rfl
@[simp] theorem F.sub_b (x y : F) : (x.sub y).b = x.b.sub y.b := rfl
@[simp] theorem F.smul_a (c : Z) (x : F) : (F.smul c x).a = c.mul x.a := rfl
@[simp] theorem F.smul_b (c : Z) (x : F) : (F.smul c x).b = c.mul x.b := rfl
@[simp] theorem F.mulN_a (c : ℕ) (x : F) : (F.mulN c x).a = Z.mulN c x.a := rfl
@[simp] theorem F.mulN_b (c : ℕ) (x : F) : (F.mulN c x).b = Z.mulN c x.b := rfl
@[simp] theorem F.norm_a (x : F) : (x.norm).a = x.a.norm := rfl
@[simp] theorem F.norm_b (x : F) : (x.norm).b = x.b.norm := rfl
@[simp] theorem F.ofZ_a (c : Z) : (F.ofZ c).a = c := rfl
@[simp] theorem F.ofZ_b (c : Z) : (F.ofZ c).b = ⟨0, 0⟩ := rfl

/-- The bracket of `sqOk`. -/
theorem sqb_of_ok {sqb : List (ℤ × ℤ)} (h : sqOk sqb = true) :
    ∃ a0 b0 a1 b1 : ℤ, sqb = [(a0, b0), (a1, b1)] ∧ 0 ≤ a0 ∧ 0 ≤ b0 ∧ 0 ≤ a1 ∧ 0 ≤ b1 := by
  unfold sqOk at h
  match sqb, h with
  | [(a0, b0), (a1, b1)], h =>
    simp only [Bool.and_eq_true, decide_eq_true_eq] at h
    exact ⟨a0, b0, a1, b1, rfl, h.1.1.1, h.1.1.2, h.1.2, h.2⟩

/-- `loHi` of a field element is the pair `(loZ, hiZ)`. -/
theorem loHi_toFE {a0 b0 a1 b1 : ℤ} (h0 : 0 ≤ a0) (h1 : 0 ≤ b0) (h2 : 0 ≤ a1) (h3 : 0 ≤ b1) (x : F) :
    loHi [(a0, b0), (a1, b1)] (toFE x)
      = ((loZ (sqOf [(a0, b0), (a1, b1)]) x).toInt, (hiZ (sqOf [(a0, b0), (a1, b1)]) x).toInt) := by
  simp only [loZ, hiZ, sqOf, nth, List.getD_cons_zero, List.getD_cons_succ, Z.toInt, Z.norm_p, Z.norm_n,
    Nat.add_eq, Nat.mul_eq]
  push_cast
  rw [Int.toNat_of_nonneg h0, Int.toNat_of_nonneg h1, Int.toNat_of_nonneg h2, Int.toNat_of_nonneg h3]
  simp only [loHi, toFE, Z.toInt, List.zip_cons_cons, List.zip_nil_left, List.foldl_cons, List.foldl_nil]
  generalize x.a.p = ap, x.a.n = an, x.b.p = bp, x.b.n = bn
  generalize hα : (ap : ℤ) - an = α
  generalize hβ : (bp : ℤ) - bn = β
  split_ifs <;>
  · first | rw [show (α.toNat : ℤ) = α by omega] | rw [show (α.toNat : ℤ) = 0 by omega]
    first | rw [show ((-α).toNat : ℤ) = -α by omega] | rw [show ((-α).toNat : ℤ) = 0 by omega]
    first | rw [show (β.toNat : ℤ) = β by omega] | rw [show (β.toNat : ℤ) = 0 by omega]
    first | rw [show ((-β).toNat : ℤ) = -β by omega] | rw [show ((-β).toNat : ℤ) = 0 by omega]
    first | (have : α = 0 := by omega); subst this | skip
    first | (have : β = 0 := by omega); subst this | skip
    ext <;> simp <;> ring

theorem k0_toInt (q : Sq) (acc : Z) (x : F) :
    (k0 q acc x).toInt = acc.toInt + monoLb 0 ((loZ q x).toInt, (hiZ q x).toInt) := by
  simp [k0, monoLb]

theorem k1_toInt (q : Sq) (acc : Z) (x : F) :
    (k1 q acc x).toInt = acc.toInt + monoLb 1 ((loZ q x).toInt, (hiZ q x).toInt) := by
  unfold k1 monoLb
  simp only []
  generalize loZ q x = l
  by_cases hle : l.n ≤ l.p
  · rw [show Nat.ble l.n l.p = true from Nat.ble_eq.mpr hle]
    simp only [Bool.cond_true, Z.toInt]; omega
  · rw [show Nat.ble l.n l.p = false from Bool.eq_false_iff.mpr (fun h => hle (Nat.ble_eq.mp h))]
    simp only [Bool.cond_false, Z.toInt, Nat.add_eq, Nat.sub_eq]; omega

theorem k2_toInt (q : Sq) (acc : Z) (x : F) :
    (k2 q acc x).toInt = acc.toInt + monoLb 2 ((loZ q x).toInt, (hiZ q x).toInt) := by
  unfold k2 monoLb natMax
  have ha := Z.abs_eq (loZ q x)
  have hb := Z.abs_eq (hiZ q x)
  generalize loZ q x = l at ha ⊢
  generalize hiZ q x = u at hb ⊢
  cases h : Nat.ble l.abs u.abs
  · rw [← Bool.not_eq_true, Nat.ble_eq] at h
    simp only [Bool.cond_false, Z.toInt, Nat.add_eq] at ha hb ⊢; omega
  · simp only [Nat.ble_eq] at h
    simp only [Bool.cond_true, Z.toInt, Nat.add_eq] at ha hb ⊢; omega

/-- The ten coefficients as D28 field elements. -/
def g10L (G : G10) : List FE :=
  [toFE G.g0, toFE G.g1, toFE G.g2, toFE G.g3, toFE G.g4, toFE G.g5, toFE G.g6, toFE G.g7, toFE G.g8,
    toFE G.g9]

theorem range10 : List.range 10 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] := rfl

/-- The inner fold of `lbOf` for `e = 0` is `lbE0`. -/
theorem fold0_eq {a0 b0 a1 b1 : ℤ} (h0 : 0 ≤ a0) (h1 : 0 ≤ b0) (h2 : 0 ≤ a1) (h3 : 0 ≤ b1) (acc : Z)
    (G : G10) :
    (List.zip (List.range 10) (g10L G)).foldl (fun acc2 (mc : ℕ × FE) =>
      acc2 + monoLb (quadKind 0 mc.1) (loHi [(a0, b0), (a1, b1)] mc.2)) acc.toInt
      = (lbE0 (sqOf [(a0, b0), (a1, b1)]) acc G).toInt := by
  simp only [range10, g10L, List.zip_cons_cons, List.zip_nil_left, List.foldl_cons, List.foldl_nil,
    loHi_toFE h0 h1 h2 h3]
  simp only [lbE0, k0_toInt, k1_toInt, k2_toInt]
  simp [quadKind]

/-- The inner fold of `lbOf` for `e ≠ 0` is `lbE`. -/
theorem foldE_eq {a0 b0 a1 b1 : ℤ} (h0 : 0 ≤ a0) (h1 : 0 ≤ b0) (h2 : 0 ≤ a1) (h3 : 0 ≤ b1) (acc : Z)
    (G : G10) {e : ℕ} (he : e ≠ 0) :
    (List.zip (List.range 10) (g10L G)).foldl (fun acc2 (mc : ℕ × FE) =>
      acc2 + monoLb (quadKind e mc.1) (loHi [(a0, b0), (a1, b1)] mc.2)) acc.toInt
      = (lbE (sqOf [(a0, b0), (a1, b1)]) acc G).toInt := by
  simp only [range10, g10L, List.zip_cons_cons, List.zip_nil_left, List.foldl_cons, List.foldl_nil,
    loHi_toFE h0 h1 h2 h3]
  simp only [lbE, k2_toInt]
  simp [quadKind, he]


/-! ## Layer 2: `combine` of the rotation quadratics is the quadratic form -/

/-- The ten terms `C_ij ⊗ Rq_ij` (row order, `X`, `Y`, `W` the columns `j = 0, 1, 2`) and `cN ⊗ N`. -/
def termsQ (X Y W : C3) (cn : F) (RN : List Quad × Quad) : List (FE × Quad) :=
  [(toFE X.c0, nth RN.1 0 []), (toFE Y.c0, nth RN.1 1 []), (toFE W.c0, nth RN.1 2 []),
   (toFE X.c1, nth RN.1 3 []), (toFE Y.c1, nth RN.1 4 []), (toFE W.c1, nth RN.1 5 []),
   (toFE X.c2, nth RN.1 6 []), (toFE Y.c2, nth RN.1 7 []), (toFE W.c2, nth RN.1 8 []), (toFE cn, RN.2)]

/-- The centre and half widths of the box, as `farValN` takes them. -/
def quadOf (M : S4) (d : ℕ) (rb : RBox) : G10 :=
  quadF (permS rb.ch M) d (Z.ofInt ((rb.l0 + rb.h0) / 2)) (Z.ofInt ((rb.l1 + rb.h1) / 2))
    (Z.ofInt ((rb.l2 + rb.h2) / 2)) ((rb.h0 - rb.l0) / 2).toNat ((rb.h1 - rb.l1) / 2).toNat
    ((rb.h2 - rb.l2) / 2).toNat

theorem combine_quadF (X Y W : C3) (cn : F) (d : ℕ) (rb : RBox)
    (h0 : rb.l0 ≤ rb.h0) (h1 : rb.l1 ≤ rb.h1) (h2 : rb.l2 ≤ rb.h2) :
    combine 2 (termsQ X Y W cn (rotQ (rboxQ (d : ℤ) rb))) = g10L (quadOf (symOf X Y W cn) d rb) := by
  obtain ⟨ch, l0, l1, l2, u0, u1, u2⟩ := rb
  simp only at h0 h1 h2
  have w0 : 0 ≤ (u0 - l0) / 2 := Int.ediv_nonneg (by omega) (by norm_num)
  have w1 : 0 ≤ (u1 - l1) / 2 := Int.ediv_nonneg (by omega) (by norm_num)
  have w2 : 0 ≤ (u2 - l2) / 2 := Int.ediv_nonneg (by omega) (by norm_num)
  simp only [quadOf, rboxQ]
  generalize (l0 + u0) / 2 = c1
  generalize (l1 + u1) / 2 = c2
  generalize (l2 + u2) / 2 = c3
  generalize (u0 - l0) / 2 = v1 at w0 ⊢
  generalize (u1 - l1) / 2 = v2 at w1 ⊢
  generalize (u2 - l2) / 2 = v3 at w2 ⊢
  rcases ch with _ | _ | _ | ch <;>
  · simp only [termsQ, rotQ, affMul, qadd, qsub, qsmul, nth, List.getD_cons_zero, List.getD_cons_succ,
      combine, List.foldl_cons, List.foldl_nil, fadd, fsmul, fzero, List.replicate, List.zipWith_cons_cons,
      List.zipWith_nil_left, List.map_cons, List.map_nil, permS, symOf, quadF, g10L, toFE, F.add_a, F.add_b,
      F.sub_a, F.sub_b, F.smul_a, F.smul_b, F.mulN_a, F.mulN_b, F.norm_a, F.norm_b, Z.toInt_add,
      Z.toInt_sub, Z.toInt_mul, Z.toInt_mulN, Z.toInt_norm, Z.toInt_ofInt, Nat.mul_eq]
    push_cast
    rw [Int.toNat_of_nonneg w0, Int.toNat_of_nonneg w1, Int.toNat_of_nonneg w2]
    simp only [List.cons.injEq, and_true]
    refine ⟨⟨?_, ?_⟩, ⟨?_, ?_⟩, ⟨?_, ?_⟩, ⟨?_, ?_⟩, ⟨?_, ?_⟩, ⟨?_, ?_⟩, ⟨?_, ?_⟩, ⟨?_, ?_⟩, ⟨?_, ?_⟩,
      ⟨?_, ?_⟩⟩ <;> ring

/-- The nine terms without `N` (the discarded leaf). -/
def termsQ9 (X Y W : C3) (RN : List Quad × Quad) : List (FE × Quad) :=
  [(toFE X.c0, nth RN.1 0 []), (toFE Y.c0, nth RN.1 1 []), (toFE W.c0, nth RN.1 2 []),
   (toFE X.c1, nth RN.1 3 []), (toFE Y.c1, nth RN.1 4 []), (toFE W.c1, nth RN.1 5 []),
   (toFE X.c2, nth RN.1 6 []), (toFE Y.c2, nth RN.1 7 []), (toFE W.c2, nth RN.1 8 [])]

theorem combine_quadF9 (X Y W : C3) (d : ℕ) (rb : RBox)
    (h0 : rb.l0 ≤ rb.h0) (h1 : rb.l1 ≤ rb.h1) (h2 : rb.l2 ≤ rb.h2) :
    combine 2 (termsQ9 X Y W (rotQ (rboxQ (d : ℤ) rb))) = g10L (quadOf (symOf X Y W ⟨⟨0, 0⟩, ⟨0, 0⟩⟩) d rb) := by
  obtain ⟨ch, l0, l1, l2, u0, u1, u2⟩ := rb
  simp only at h0 h1 h2
  have w0 : 0 ≤ (u0 - l0) / 2 := Int.ediv_nonneg (by omega) (by norm_num)
  have w1 : 0 ≤ (u1 - l1) / 2 := Int.ediv_nonneg (by omega) (by norm_num)
  have w2 : 0 ≤ (u2 - l2) / 2 := Int.ediv_nonneg (by omega) (by norm_num)
  simp only [quadOf, rboxQ]
  generalize (l0 + u0) / 2 = c1
  generalize (l1 + u1) / 2 = c2
  generalize (l2 + u2) / 2 = c3
  generalize (u0 - l0) / 2 = v1 at w0 ⊢
  generalize (u1 - l1) / 2 = v2 at w1 ⊢
  generalize (u2 - l2) / 2 = v3 at w2 ⊢
  rcases ch with _ | _ | _ | ch <;>
  · simp only [termsQ9, rotQ, affMul, qadd, qsub, qsmul, nth, List.getD_cons_zero, List.getD_cons_succ,
      combine, List.foldl_cons, List.foldl_nil, fadd, fsmul, fzero, List.replicate, List.zipWith_cons_cons,
      List.zipWith_nil_left, List.map_cons, List.map_nil, permS, symOf, quadF, g10L, toFE, F.add_a, F.add_b,
      F.sub_a, F.sub_b, F.smul_a, F.smul_b, F.mulN_a, F.mulN_b, F.norm_a, F.norm_b, Z.toInt_add,
      Z.toInt_sub, Z.toInt_mul, Z.toInt_mulN, Z.toInt_norm, Z.toInt_ofInt, Z.toInt_mk, Nat.mul_eq]
    push_cast
    rw [Int.toNat_of_nonneg w0, Int.toNat_of_nonneg w1, Int.toNat_of_nonneg w2]
    simp only [List.cons.injEq, and_true]
    refine ⟨⟨?_, ?_⟩, ⟨?_, ?_⟩, ⟨?_, ?_⟩, ⟨?_, ?_⟩, ⟨?_, ?_⟩, ⟨?_, ?_⟩, ⟨?_, ?_⟩, ⟨?_, ?_⟩, ⟨?_, ?_⟩,
      ⟨?_, ?_⟩⟩ <;> ring

/-! ## The three quadratics of an accepted leaf -/

theorem range3 : List.range 3 = [0, 1, 2] := rfl

theorem lb3_eq {a0 b0 a1 b1 : ℤ} (h0 : 0 ≤ a0) (h1 : 0 ≤ b0) (h2 : 0 ≤ a1) (h3 : 0 ≤ b1) (G0 G1 G2 : G10) :
    (List.zip (List.range 3) [g10L G0, g10L G1, g10L G2]).foldl (fun acc (eg : ℕ × List FE) =>
      (List.zip (List.range 10) eg.2).foldl (fun acc2 (mc : ℕ × FE) =>
        acc2 + monoLb (quadKind eg.1 mc.1) (loHi [(a0, b0), (a1, b1)] mc.2)) acc) 0
      = (lbE (sqOf [(a0, b0), (a1, b1)]) (lbE (sqOf [(a0, b0), (a1, b1)])
          (lbE0 (sqOf [(a0, b0), (a1, b1)]) ⟨0, 0⟩ G0) G1) G2).toInt := by
  simp only [range3, List.zip_cons_cons, List.zip_nil_left, List.foldl_cons, List.foldl_nil]
  rw [show (0 : ℤ) = Z.toInt ⟨0, 0⟩ from rfl, fold0_eq h0 h1 h2 h3, foldE_eq h0 h1 h2 h3 _ _ one_ne_zero,
    foldE_eq h0 h1 h2 h3 _ _ two_ne_zero]

end PackLean.Formal.NatLeafEq
