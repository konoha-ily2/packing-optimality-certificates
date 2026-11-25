import PackLean.Formal.DTLeafN
import PackLean.E3f.LeafN

/-!
# E3f stage 1: the Nat-pair walk of the far R trees is the walk of `E3h.rcharR`

Design: `plan/E3f_nat_leaf.md` §3.3.  The walk with the reduced box (`E3h.rleafR`, `rcharR`, `segTR`, the form that
E3i writes out) is the reference; the Nat-pair walk `E3f.segN` only replaces its two leaf tests by the equal
Nat-pair values (`DTLeafN.farValN_eq`, `discValN_eq`).

* `rleafG_eq`, `rcharG_eq` (`funext`): one step of the two walks is the same function.
* `segN_eq`: a segment checked by the Nat-pair walk is the same Bool as the reference segment.

Conditions: `WF (toProb P2)` and `sqOk P2.sqb` for the leaf constants `P2`, `0 ≤ P.den`, and `c2.kap` a list of
three (true for `treeKap`).
-/

namespace PackLean.Formal.E3fSeg

open PackLean.D28 (RBox rboxWf nth)
open PackLean.D45DT (Prm TreeCtx RS farLbT discLbT toProb)
open PackLean.E3h (rleafR rcharR segTR redG redOk redBox rsInit)
open PackLean.E3f (rleafG rcharG segG segN leafAN leafDN)
open PackLean.D45DT.LN (ctxN)
open PackLean.Kernel.NatLeaf
open PackLean.Formal.NatLeafEq (sqb_of_ok)
open PackLean.Formal.DTLeafN (farValN_eq discValN_eq)

theorem ble_ge (r : Z) : Nat.ble r.n r.p = decide (r.toInt ≥ 0) := by
  unfold Z.toInt
  by_cases h : r.n ≤ r.p
  · rw [Nat.ble_eq_true_of_le h]; symm; simp; omega
  · rw [show Nat.ble r.n r.p = false from Bool.eq_false_iff.mpr (fun h' => h (Nat.ble_eq.mp h'))]
    symm; simp; omega

theorem ble_gt (r : Z) : Nat.ble (Nat.succ r.n) r.p = decide (r.toInt > 0) := by
  unfold Z.toInt
  by_cases h : Nat.succ r.n ≤ r.p
  · rw [Nat.ble_eq_true_of_le h]; symm; simp; omega
  · rw [show Nat.ble (Nat.succ r.n) r.p = false from Bool.eq_false_iff.mpr (fun h' => h (Nat.ble_eq.mp h'))]
    symm; simp; omega

theorem and_congr_r {a b c : Bool} (h : a = true → b = c) : (a && b) = (a && c) := by
  cases a
  · rfl
  · simp only [Bool.true_and]; exact h rfl

variable {P P2 : Prm} {c2 : TreeCtx}

theorem leafAN_eq (hwf : PackLean.Formal.TetFar.WF (toProb P2)) (hsq : sqOk P2.sqb = true) {k0 k1 k2 : ℤ}
    (hk : c2.kap = [k0, k1, k2]) (dn : ℕ) {rb : RBox} (hrb : rboxWf rb = true) (v0 f0 f1 f3 : ℕ) :
    leafAN P2 (ctxN P2 c2.sig c2.nb c2.kap) dn rb v0 f0 f1 f3
      = decide (farLbT { P2 with den := (dn : ℤ) } c2.sig c2.nb c2.kap rb v0 [f0, f1, 0, f3] ≥ 0) := by
  unfold leafAN
  rw [ble_ge, hk, farValN_eq c2.sig c2.nb hwf hsq dn k0 k1 k2 hrb v0 f0 f1 0 f3]

theorem leafDN_eq (hwf : PackLean.Formal.TetFar.WF (toProb P2)) (hsq : sqOk P2.sqb = true)
    (K : PackLean.D45DT.LN.CtxN) (hK : K.sq = sqOf P2.sqb) (dn : ℕ) {rb : RBox} (hrb : rboxWf rb = true) (m : ℕ) :
    leafDN P2 K dn rb m = decide (discLbT { P2 with den := (dn : ℤ) } rb m > 0) := by
  unfold leafDN
  rw [ble_gt, hK, discValN_eq hwf hsq dn hrb m]

theorem den_toNat {den g : ℤ} (hden : 0 ≤ den) (hg : 0 < g) : (((den / g).toNat : ℕ) : ℤ) = den / g :=
  Int.toNat_of_nonneg (Int.ediv_nonneg hden hg.le)

/-- One leaf of the two walks. -/
theorem rleafG_eq (hwf : PackLean.Formal.TetFar.WF (toProb P2)) (hsq : sqOk P2.sqb = true) (hden : 0 ≤ P.den)
    {k0 k1 k2 : ℤ} (hk : c2.kap = [k0, k1, k2]) (c : TreeCtx) :
    rleafG P (leafAN P2 (ctxN P2 c2.sig c2.nb c2.kap)) (leafDN P2 (ctxN P2 c2.sig c2.nb c2.kap)) c
      = rleafR P P2 c c2 := by
  funext s kind args
  obtain ⟨st, ok, nA, nD, nL, pend, knd, acc⟩ := s
  unfold rleafG rleafR
  rcases st with _ | ⟨b, rest⟩
  · rfl
  · simp only []
    split_ifs
    · rfl
    · congr 1
      apply and_congr_r
      intro h
      have hg : 0 < redG P.den b := by
        revert h; simp only [Bool.and_eq_true, redOk, decide_eq_true_eq]; tauto
      have hrb : rboxWf (redBox (redG P.den b) b) = true := by
        revert h; simp only [Bool.and_eq_true]; tauto
      rw [leafDN_eq hwf hsq _ rfl _ hrb, den_toNat hden hg]
    · congr 1
      apply and_congr_r
      intro h
      have hg : 0 < redG P.den b := by
        revert h; simp only [Bool.and_eq_true, redOk, decide_eq_true_eq]; tauto
      have hrb : rboxWf (redBox (redG P.den b) b) = true := by
        revert h; simp only [Bool.and_eq_true]; tauto
      rw [leafAN_eq hwf hsq hk _ hrb, den_toNat hden hg]

/-- One character of the two walks. -/
theorem rcharG_eq (hwf : PackLean.Formal.TetFar.WF (toProb P2)) (hsq : sqOk P2.sqb = true) (hden : 0 ≤ P.den)
    {k0 k1 k2 : ℤ} (hk : c2.kap = [k0, k1, k2]) (c : TreeCtx) :
    rcharG P (leafAN P2 (ctxN P2 c2.sig c2.nb c2.kap)) (leafDN P2 (ctxN P2 c2.sig c2.nb c2.kap)) c
      = rcharR P P2 c c2 := by
  funext s ch
  unfold rcharG rcharR
  rw [rleafG_eq hwf hsq hden hk c]
  obtain ⟨st, ok, nA, nD, nL, pend, knd, acc⟩ := s
  simp only []
  split_ifs
  · rcases PackLean.D45DT.dval ch with _ | v <;> rfl
  · rcases st with _ | ⟨b, rest⟩ <;> rfl
  all_goals rfl

/-- **A segment**: the Nat-pair walk accepts exactly when the reference walk `segTR` does. -/
theorem segN_eq (hwf : PackLean.Formal.TetFar.WF (toProb P2)) (hsq : sqOk P2.sqb = true) (hden : 0 ≤ P.den)
    {k0 k1 k2 : ℤ} (hk : c2.kap = [k0, k1, k2]) (c : TreeCtx) (ks : List RBox) (toks : List Char)
    (ke : List RBox) :
    segN P P2 (ctxN P2 c2.sig c2.nb c2.kap) c ks toks ke = segTR P P2 c c2 ks toks ke := by
  unfold segN segG segTR
  rw [rcharG_eq hwf hsq hden hk c]

end PackLean.Formal.E3fSeg
