import PackLean.Formal.NatLeafEq
import PackLean.Formal.DTFar
import PackLean.D45DT.LeafN

/-!
# E3f stage 1: the Nat-pair leaves of D45DT have the values of `farLbT` and `discLbT`

Design: `plan/E3f_nat_leaf.md` §3 (layer 3 and the assembly).

* `farValN_eq`: `(farValN (ctxN P sig nb [k₀, k₁, k₂]) d rb (vtx P v0) …).toInt` is
  `farLbT { P with den := d } sig nb [k₀, k₁, k₂] rb v0 [f0, f1, f2, f3]`.
* `discValN_eq`: `(discValN (sqOf P.sqb) P.dk (nth P.rots m []) d rb).toInt` is `discLbT { P with den := d } rb m`.

The conditions are the lengths of `TetFar.WF (toProb P)` (vertices and rotations, from `dtExtraOk P`), the bracket
`sqOk P.sqb` (two pairs, all `≥ 0`) and `l ≤ h` on the three axes of the R box (from `rboxWf`).  So the Nat-pair
judge only computes faster: the check functions of `D45DT.Core` and the Formal statements about them do not change.
-/

namespace PackLean.Formal.DTLeafN

open PackLean.D28 (FE fadd fsub fsmul fzero Quad RBox rboxQ rboxWf rotQ combine nth vecGet monoLb loHi
  quadKind lbOf)
open PackLean.D45DT (Prm NB BV BTOP fI toProb farLbT discLbT PS)
open PackLean.Kernel.NatLeaf
open PackLean.D45DT.LN
open PackLean.Formal.NatLeafEq
open PackLean.Formal.DTBase (coET coNT termsT farLbT_eq pNT nNT dotE)
open PackLean.Formal.DTFar (pp nn dotE_pN dotE_nN)
open PackLean.Formal.FieldSem (Len)
open PackLean.Formal.FarAccept (LenV len_get)

/-! ## Field elements of length two -/

theorem fe2 {a : FE} (h : Len PS a) : ∃ α β : ℤ, a = [α, β] := by
  unfold Len at h
  match a, h with
  | [α, β], _ => exact ⟨α, β, rfl⟩

@[simp] theorem toFE_ofFE2 (α β : ℤ) : toFE (F.ofFE [α, β]) = [α, β] := by
  simp [toFE, F.ofFE, nth]

theorem lenV_rot {P : Prm} (hwf : PackLean.Formal.TetFar.WF (toProb P)) (m : ℕ) :
    ∀ v ∈ nth P.rots m [], LenV PS v := by
  intro v hv
  unfold nth at hv
  rcases lt_or_ge m P.rots.length with hm | hm
  · rw [List.getD_eq_getElem _ _ hm] at hv
    exact (hwf.rots _ (List.getElem_mem hm)).2 v hv
  · rw [List.getD_eq_default _ _ hm] at hv
    simp at hv

theorem len_vert {P : Prm} (hwf : PackLean.Formal.TetFar.WF (toProb P)) (l j : ℕ) :
    Len PS (vecGet (nth P.verts l []) j 2) :=
  len_get (ps := PS) rfl hwf.verts l j

theorem len_rot {P : Prm} (hwf : PackLean.Formal.TetFar.WF (toProb P)) (m j i : ℕ) :
    Len PS (vecGet (nth (nth P.rots m []) j []) i 2) :=
  len_get (ps := PS) rfl (lenV_rot hwf m) j i

/-! ## Layer 3: the coefficients of `farLbT` -/

section Coef

variable (P : Prm) (sig : ℕ) (nb : NB)

/-- `coET` written out (the first half of `DTFar.coET_val`). -/
theorem coET_expl (v0 f0 f1 f2 f3 i j e : ℕ) :
    coET P sig nb v0 [f0, f1, f2, f3] i j e =
      fsmul ((P.cden : ℤ) * P.kd) (fadd (fsmul (4 * pp P sig nb i e)
        (vecGet (nth P.verts v0 []) j 2))
        (fadd (fadd (fadd (fzero 2)
          (fsmul ((2 * pp P sig nb 0 e + 2 * pp P sig nb 2 e) * nth [-1, -1, -1] i 0)
            (vecGet (nth P.verts f0 []) j 2)))
          (fsmul ((2 * pp P sig nb 0 e - 2 * pp P sig nb 1 e) * nth [-1, 1, 1] i 0)
            (vecGet (nth P.verts f1 []) j 2)))
          (fsmul ((-2 * pp P sig nb 1 e + 2 * pp P sig nb 2 e) * nth [1, 1, -1] i 0)
            (vecGet (nth P.verts f3 []) j 2)))) := by
  unfold coET
  simp only [BV, BTOP, show List.range 4 = [0, 1, 2, 3] from rfl, List.foldl_cons,
    List.foldl_nil]
  simp only [nth, List.getD_cons_zero, List.getD_cons_succ, List.zipWith_cons_cons,
    List.zipWith_nil_left, beq_iff_eq, show (0 : ℕ) ≠ 2 from by norm_num,
    show (1 : ℕ) ≠ 2 from by norm_num, show (3 : ℕ) ≠ 2 from by norm_num, ite_false, ite_true,
    dotE_pN]
  simp only [pp, nth]
  ring_nf

/-- `coNT` written out (the first half of `DTFar.coNT_val`). -/
theorem coNT_expl (k0 k1 k2 : ℤ) (e : ℕ) :
    coNT P sig nb [k0, k1, k2] e = fI (-(4 * (P.dv : ℤ)) * ((P.kd : ℤ) * P.cnum
          * (pp P sig nb 0 e - pp P sig nb 1 e + pp P sig nb 2 e)
          + (P.cden : ℤ) * (k0 * nn P nb 0 e + k1 * nn P nb 1 e + k2 * nn P nb 2 e))) := by
  unfold coNT
  simp only [BV, BTOP, nth, List.getD_cons_zero, List.getD_cons_succ, dotE_pN, dotE_nN]
  ring_nf

/-- The tree constants `ceOf` in terms of `pp` and `nn`. -/
theorem ceOf_eq (k0 k1 k2 : ℤ) (e : ℕ) :
    ceOf P sig nb [k0, k1, k2] e =
      ⟨Z.ofInt ((P.cden : ℤ) * P.kd * (4 * pp P sig nb 0 e)),
       Z.ofInt ((P.cden : ℤ) * P.kd * (4 * pp P sig nb 1 e)),
       Z.ofInt ((P.cden : ℤ) * P.kd * (4 * pp P sig nb 2 e)),
       Z.ofInt ((P.cden : ℤ) * P.kd * (2 * pp P sig nb 0 e + 2 * pp P sig nb 2 e)),
       Z.ofInt ((P.cden : ℤ) * P.kd * (2 * pp P sig nb 0 e - 2 * pp P sig nb 1 e)),
       Z.ofInt ((P.cden : ℤ) * P.kd * (-2 * pp P sig nb 1 e + 2 * pp P sig nb 2 e)),
       Z.ofInt (-(4 * (P.dv : ℤ)) * ((P.kd : ℤ) * P.cnum
          * (pp P sig nb 0 e - pp P sig nb 1 e + pp P sig nb 2 e)
          + (P.cden : ℤ) * (k0 * nn P nb 0 e + k1 * nn P nb 1 e + k2 * nn P nb 2 e)))⟩ := rfl

variable {P}

/-- The column `j` of `col` is the column `j` of `coET`. -/
theorem col_eq (hwf : PackLean.Formal.TetFar.WF (toProb P)) (k0 k1 k2 : ℤ) (v0 f0 f1 f2 f3 j e : ℕ) :
    let C := col (ceOf P sig nb [k0, k1, k2] e) (F.ofFE (vecGet (nth P.verts v0 []) j 2))
      (F.ofFE (vecGet (nth P.verts f0 []) j 2)) (F.ofFE (vecGet (nth P.verts f1 []) j 2))
      (F.ofFE (vecGet (nth P.verts f3 []) j 2))
    toFE C.c0 = coET P sig nb v0 [f0, f1, f2, f3] 0 j e ∧
    toFE C.c1 = coET P sig nb v0 [f0, f1, f2, f3] 1 j e ∧
    toFE C.c2 = coET P sig nb v0 [f0, f1, f2, f3] 2 j e := by
  intro C
  obtain ⟨a0, b0, hv⟩ := fe2 (len_vert hwf v0 j)
  obtain ⟨a1, b1, h0⟩ := fe2 (len_vert hwf f0 j)
  obtain ⟨a2, b2, h1⟩ := fe2 (len_vert hwf f1 j)
  obtain ⟨a3, b3, h3⟩ := fe2 (len_vert hwf f3 j)
  simp only [C, coET_expl, ceOf_eq, hv, h0, h1, h3]
  simp only [col, toFE, F.ofFE, nth, List.getD_cons_zero, List.getD_cons_succ, F.add_a, F.add_b, F.sub_a,
    F.sub_b, F.smul_a, F.smul_b, Z.toInt_add, Z.toInt_sub, Z.toInt_mul, Z.toInt_ofInt, fsmul, fadd, fzero,
    List.replicate, List.map_cons, List.map_nil, List.zipWith_cons_cons, List.zipWith_nil_left,
    List.cons.injEq, and_true]
  refine ⟨⟨?_, ?_⟩, ⟨?_, ?_⟩, ⟨?_, ?_⟩⟩ <;> ring

end Coef

/-! ## The accepted leaf -/

theorem range9 : List.range 9 = [0, 1, 2, 3, 4, 5, 6, 7, 8] := rfl

section Far

variable {P : Prm} (sig : ℕ) (nb : NB)

/-- The columns of the accepted leaf. -/
def colN (k0 k1 k2 : ℤ) (v0 f0 f1 f3 j e : ℕ) : C3 :=
  col (ceOf P sig nb [k0, k1, k2] e) (F.ofFE (vecGet (nth P.verts v0 []) j 2))
    (F.ofFE (vecGet (nth P.verts f0 []) j 2)) (F.ofFE (vecGet (nth P.verts f1 []) j 2))
    (F.ofFE (vecGet (nth P.verts f3 []) j 2))

theorem termsT_eq (hwf : PackLean.Formal.TetFar.WF (toProb P)) (d : ℕ) (k0 k1 k2 : ℤ) (rb : RBox)
    (v0 f0 f1 f2 f3 e : ℕ) :
    termsT { P with den := (d : ℤ) } sig nb [k0, k1, k2] rb v0 [f0, f1, f2, f3] e
      = termsQ (colN (P := P) sig nb k0 k1 k2 v0 f0 f1 f3 0 e) (colN (P := P) sig nb k0 k1 k2 v0 f0 f1 f3 1 e)
          (colN (P := P) sig nb k0 k1 k2 v0 f0 f1 f3 2 e) (F.ofZ (ceOf P sig nb [k0, k1, k2] e).cn)
          (rotQ (rboxQ (d : ℤ) rb)) := by
  have c0 := col_eq sig nb hwf k0 k1 k2 v0 f0 f1 f2 f3 0 e
  have c1 := col_eq sig nb hwf k0 k1 k2 v0 f0 f1 f2 f3 1 e
  have c2 := col_eq sig nb hwf k0 k1 k2 v0 f0 f1 f2 f3 2 e
  simp only at c0 c1 c2
  have hn : toFE (F.ofZ (ceOf P sig nb [k0, k1, k2] e).cn) = coNT P sig nb [k0, k1, k2] e := by
    rw [coNT_expl, ceOf_eq]
    simp [toFE, fI]
  simp only [termsT, termsQ, colN, range9, List.map_cons, List.map_nil, List.cons_append, List.nil_append,
    Nat.reduceDiv, Nat.reduceMod, c0.1, c0.2.1, c0.2.2, c1.1, c1.2.1, c1.2.2, c2.1, c2.2.1, c2.2.2, hn]
  rfl

/-- **The accepted leaf**: the Nat-pair value is `farLbT` with the denominator `d`. -/
theorem farValN_eq (hwf : PackLean.Formal.TetFar.WF (toProb P)) (hsq : sqOk P.sqb = true) (d : ℕ)
    (k0 k1 k2 : ℤ) {rb : RBox} (hrb : rboxWf rb = true) (v0 f0 f1 f2 f3 : ℕ) :
    (farValN (ctxN P sig nb [k0, k1, k2]) d rb (vtx P v0) (vtx P f0) (vtx P f1) (vtx P f3)).toInt
      = farLbT { P with den := (d : ℤ) } sig nb [k0, k1, k2] rb v0 [f0, f1, f2, f3] := by
  have hw := hrb
  simp only [rboxWf, Bool.and_eq_true, decide_eq_true_eq] at hw
  obtain ⟨⟨⟨⟨⟨⟨hl0, hl1⟩, hl2⟩, -⟩, -⟩, -⟩, -⟩ := hw
  obtain ⟨a0, b0, a1, b1, hsqb, h0, h1, h2, h3⟩ := sqb_of_ok hsq
  rw [farLbT_eq]
  unfold lbOf
  rw [termsT_eq sig nb hwf, termsT_eq sig nb hwf, termsT_eq sig nb hwf,
    combine_quadF _ _ _ _ _ _ hl0.le hl1.le hl2.le, combine_quadF _ _ _ _ _ _ hl0.le hl1.le hl2.le,
    combine_quadF _ _ _ _ _ _ hl0.le hl1.le hl2.le]
  show _ = (List.zip (List.range 3) _).foldl (fun acc (eg : ℕ × List FE) =>
      (List.zip (List.range 10) eg.2).foldl (fun acc2 (mc : ℕ × FE) =>
        acc2 + monoLb (quadKind eg.1 mc.1) (loHi P.sqb mc.2)) acc) 0
  rw [hsqb, lb3_eq h0 h1 h2 h3]
  simp only [farValN, ctxN, hsqb]
  rfl

end Far

/-! ## The discarded leaf -/

/-- `discLbT` with the match on `rotQ` taken apart. -/
theorem discLbT_expl (P : Prm) (rb : RBox) (m : ℕ) : discLbT P rb m =
    (List.zip (List.range 10) (combine 2 ((List.range 9).map (fun ij =>
      let kji := vecGet (nth (nth P.rots m []) (ij % 3) []) (ij / 3) 2
      (if ij / 3 == ij % 3 then fsub kji (fI P.dk) else kji, nth (rotQ (rboxQ P.den rb)).1 ij []))))).foldl
      (fun acc (mc : ℕ × FE) => acc + monoLb (quadKind 0 mc.1) (loHi P.sqb mc.2)) 0 := rfl

/-- The columns of the discarded leaf. -/
def colD (dk : ℕ) (Kr : List (List FE)) : C3 × C3 × C3 :=
  let k (j i : ℕ) : F := F.ofFE (vecGet (nth Kr j []) i 2)
  let dkF : F := ⟨⟨dk, 0⟩, ⟨0, 0⟩⟩
  (⟨(k 0 0).sub dkF, k 0 1, k 0 2⟩, ⟨k 1 0, (k 1 1).sub dkF, k 1 2⟩, ⟨k 2 0, k 2 1, (k 2 2).sub dkF⟩)

/-- **The discarded leaf**: the Nat-pair value is `discLbT` with the denominator `d`. -/
theorem discValN_eq {P : Prm} (hwf : PackLean.Formal.TetFar.WF (toProb P)) (hsq : sqOk P.sqb = true)
    (d : ℕ) {rb : RBox} (hrb : rboxWf rb = true) (m : ℕ) :
    (discValN (sqOf P.sqb) P.dk (nth P.rots m []) d rb).toInt = discLbT { P with den := (d : ℤ) } rb m := by
  have hw := hrb
  simp only [rboxWf, Bool.and_eq_true, decide_eq_true_eq] at hw
  obtain ⟨⟨⟨⟨⟨⟨hl0, hl1⟩, hl2⟩, -⟩, -⟩, -⟩, -⟩ := hw
  obtain ⟨a0, b0, a1, b1, hsqb, h0, h1, h2, h3⟩ := sqb_of_ok hsq
  have ht : ((List.range 9).map (fun ij =>
      let kji := vecGet (nth (nth P.rots m []) (ij % 3) []) (ij / 3) 2
      (if ij / 3 == ij % 3 then fsub kji (fI P.dk) else kji, nth (rotQ (rboxQ (d : ℤ) rb)).1 ij [])))
      = termsQ9 (colD P.dk (nth P.rots m [])).1 (colD P.dk (nth P.rots m [])).2.1
          (colD P.dk (nth P.rots m [])).2.2 (rotQ (rboxQ (d : ℤ) rb)) := by
    have e : ∀ j i, ∃ α β : ℤ, vecGet (nth (nth P.rots m []) j []) i 2 = [α, β] :=
      fun j i => fe2 (len_rot hwf m j i)
    obtain ⟨x00, y00, e00⟩ := e 0 0
    obtain ⟨x01, y01, e01⟩ := e 0 1
    obtain ⟨x02, y02, e02⟩ := e 0 2
    obtain ⟨x10, y10, e10⟩ := e 1 0
    obtain ⟨x11, y11, e11⟩ := e 1 1
    obtain ⟨x12, y12, e12⟩ := e 1 2
    obtain ⟨x20, y20, e20⟩ := e 2 0
    obtain ⟨x21, y21, e21⟩ := e 2 1
    obtain ⟨x22, y22, e22⟩ := e 2 2
    simp only [termsQ9, colD, range9, List.map_cons, List.map_nil, Nat.reduceDiv, Nat.reduceMod,
      e00, e01, e02, e10, e11, e12, e20, e21, e22]
    simp [toFE, F.ofFE, nth, fsub, fI]
  rw [discLbT_expl]
  show _ = (List.zip (List.range 10) (combine 2 ((List.range 9).map (fun ij =>
      let kji := vecGet (nth (nth P.rots m []) (ij % 3) []) (ij / 3) 2
      (if ij / 3 == ij % 3 then fsub kji (fI P.dk) else kji, nth (rotQ (rboxQ (d : ℤ) rb)).1 ij []))))).foldl
      (fun acc (mc : ℕ × FE) => acc + monoLb (quadKind 0 mc.1) (loHi P.sqb mc.2)) 0
  rw [ht, combine_quadF9 _ _ _ _ _ hl0.le hl1.le hl2.le, hsqb, show (0 : ℤ) = Z.toInt ⟨0, 0⟩ from rfl,
    fold0_eq h0 h1 h2 h3]
  simp only [discValN, hsqb]
  rfl

end PackLean.Formal.DTLeafN
