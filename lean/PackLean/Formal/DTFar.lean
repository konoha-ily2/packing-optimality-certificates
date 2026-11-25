import PackLean.Formal.DTBase

/-!
# A9k stage 7c-1: the accepted far leaves of D45DT (dodintet_n02)

Design: `plan/A9k_dodintet_design.md` §2 (the row `farLbT`), §3 (7c-1).  Written after
`TetFar.accept_low` (copied and changed in three places):

1. κ is a linear form `(k₀ x + k₁ y + k₂) / kd` in the n coordinates (with an x term), not `k + β y`;
2. the point of the dual bound is `p = σ^sig n`: for `sig = 1` the y row of `p` changes sign (`sgn sig`);
3. `c̄ = cnum / cden` is rational (`fI cnum`, `toProb P` has `c0 = ⟨fI cnum, cden⟩`).

* `accept_lowT` (token `A v0 f0 f1 f3` of `rchar`, with `f2 = 0` unused since `BTOP = 2`): `farLbT ≥ 0`
  gives, at every n of the box (`n = (x, y, 1)`) and every rotation `R` of the R box, `κ(n) ≤ dualB(p, R)`
  with `p = (x, sgn·y, 1)`.
-/

namespace PackLean.Formal.DTFar

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign QF Quad RBox rboxQ rboxWf
  rotQ combine nth vecGet monoLb loHi quadKind Prob lbOf)
open PackLean.D45DT (Prm NB BV BTOP fI toProb farLbT PS)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.QuadSem
  PackLean.Formal.FarAccept PackLean.Formal.TetFar PackLean.Formal.DTBase
open PackLean.Formal.PolySemG (BracketG maskOf)
open PackLean.Formal.Polytope (dot)

noncomputable section

variable (P : Prm) (sig : ℕ) (nb : NB)

/-- The integer entries of `pNT` and `nNT`. -/
def pp (i e : ℕ) : ℤ := nth (nth (pNT P sig nb) i []) e 0
def nn (i e : ℕ) : ℤ := nth (nth (nNT P nb) i []) e 0

theorem dotE_pN (a b c : ℤ) (e : ℕ) :
    dotE [a, b, c] (pNT P sig nb) e = a * pp P sig nb 0 e + b * pp P sig nb 1 e + c * pp P sig nb 2 e := by
  simp [dotE, pp, pNT, nth]

theorem dotE_nN (a b c : ℤ) (e : ℕ) :
    dotE [a, b, c] (nNT P nb) e = a * nn P nb 0 e + b * nn P nb 1 e + c * nn P nb 2 e := by
  simp [dotE, nn, nNT, nth]

/-- The value of an entry of a vertex (no denominator). -/
def ev (l j : ℕ) : ℝ := ent PS 2 (nth P.verts l []) j

variable {P}

theorem coET_val (hwf : WF (toProb P)) (v0 f0 f1 f2 f3 i j e : ℕ) :
    Len PS (coET P sig nb v0 [f0, f1, f2, f3] i j e) ∧
    fval PS (coET P sig nb v0 [f0, f1, f2, f3] i j e)
      = ((P.cden : ℤ) * P.kd : ℤ) * (
          ((4 * pp P sig nb i e : ℤ) : ℝ) * ev P v0 j
          + (((2 * pp P sig nb 0 e + 2 * pp P sig nb 2 e) * nth [-1, -1, -1] i 0 : ℤ) : ℝ) * ev P f0 j
          + (((2 * pp P sig nb 0 e - 2 * pp P sig nb 1 e) * nth [-1, 1, 1] i 0 : ℤ) : ℝ) * ev P f1 j
          + (((-2 * pp P sig nb 1 e + 2 * pp P sig nb 2 e) * nth [1, 1, -1] i 0 : ℤ) : ℝ)
            * ev P f3 j) := by
  have hnb : (2 : ℕ) = 2 ^ PS.length := rfl
  have lv : ∀ l, Len PS (vecGet (nth P.verts l []) j 2) := fun l => len_get hnb hwf.verts l j
  have lz : Len PS (fzero 2) := len_fzero PS
  have e1 : coET P sig nb v0 [f0, f1, f2, f3] i j e =
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
  rw [e1]
  have l0 := len_fsmul ((2 * pp P sig nb 0 e + 2 * pp P sig nb 2 e) * nth [-1, -1, -1] i 0) (lv f0)
  have l1 := len_fsmul ((2 * pp P sig nb 0 e - 2 * pp P sig nb 1 e) * nth [-1, 1, 1] i 0) (lv f1)
  have l3 := len_fsmul ((-2 * pp P sig nb 1 e + 2 * pp P sig nb 2 e) * nth [1, 1, -1] i 0) (lv f3)
  have lb := len_fsmul (4 * pp P sig nb i e) (lv v0)
  have la := len_fadd lz l0
  have lc := len_fadd la l1
  have ld := len_fadd lc l3
  refine ⟨len_fsmul _ (len_fadd lb ld), ?_⟩
  rw [fval_fsmul, fval_fadd lb ld, fval_fadd lc l3, fval_fadd la l1, fval_fadd lz l0, fval_fzero,
    fval_fsmul, fval_fsmul, fval_fsmul, fval_fsmul]
  simp only [ev, ent]
  ring

theorem fval_fI (c : ℤ) : Len PS (fI c) ∧ fval PS (fI c) = c :=
  ⟨len_fofInt PS c, fval_fofInt PS c⟩

theorem coNT_val (k0 k1 k2 : ℤ) (e : ℕ) :
    Len PS (coNT P sig nb [k0, k1, k2] e) ∧
    fval PS (coNT P sig nb [k0, k1, k2] e)
      = ((-(4 * (P.dv : ℤ)) * ((P.kd : ℤ) * P.cnum
          * (pp P sig nb 0 e - pp P sig nb 1 e + pp P sig nb 2 e)
          + (P.cden : ℤ) * (k0 * nn P nb 0 e + k1 * nn P nb 1 e + k2 * nn P nb 2 e)) : ℤ) : ℝ) := by
  have e1 : coNT P sig nb [k0, k1, k2] e = fI (-(4 * (P.dv : ℤ)) * ((P.kd : ℤ) * P.cnum
          * (pp P sig nb 0 e - pp P sig nb 1 e + pp P sig nb 2 e)
          + (P.cden : ℤ) * (k0 * nn P nb 0 e + k1 * nn P nb 1 e + k2 * nn P nb 2 e))) := by
    unfold coNT
    simp only [BV, BTOP, nth, List.getD_cons_zero, List.getD_cons_succ, dotE_pN, dotE_nN]
    ring_nf
  rw [e1]
  exact fval_fI _

/-! ## The bound at a point of the box -/

variable (P)

/-- The sign of the y row of `p = σ^sig n`. -/
def sgn : ℤ := if sig == 0 then 1 else -1

theorem pp_eq (e : ℕ) :
    pp P sig nb 0 e = nth [(nb.l0 + nb.h0) / 2, (nb.h0 - nb.l0) / 2, 0] e 0 ∧
    pp P sig nb 1 e = sgn sig * nth [(nb.l1 + nb.h1) / 2, 0, (nb.h1 - nb.l1) / 2] e 0 ∧
    pp P sig nb 2 e = nth [P.nd, 0, 0] e 0 := by
  refine ⟨rfl, ?_, rfl⟩
  rcases e with _ | _ | _ | e <;> simp [pp, pNT, sgn, nth]

/-- The direction of the box at the box coordinates `(sx, sy)` (in `nd` units). -/
def nx (sx : ℝ) : ℝ := (((nb.l0 + nb.h0) / 2 : ℤ) : ℝ) + (((nb.h0 - nb.l0) / 2 : ℤ) : ℝ) * sx
def ny (sy : ℝ) : ℝ := (((nb.l1 + nb.h1) / 2 : ℤ) : ℝ) + (((nb.h1 - nb.l1) / 2 : ℤ) : ℝ) * sy

/-- κ of the linear form `kap = [k₀, k₁, k₂]` over `kd` at `n = (x, y, 1)`. -/
def kapV (k0 k1 k2 : ℤ) (x y : ℝ) : ℝ := ((k0 : ℝ) * x + k1 * y + k2) / P.kd

variable {P}

/-- **An accepted far leaf** (token `A v0 f0 f1 f3`, `f2` unused): at every n of the box
`nb` (`n = (x, y, 1)`, box coordinates `(sx, sy)`) and every rotation `R` of the box `rb`
(`Rq = Nv · R`, `Nv > 0`), the dual bound of `TetReduction.Low` at `p = (x, sgn·y, 1)` (weights
`μ = p · b₂`, the vertices `v0`, `f_f`, `c̄ = cnum / cden`) is at least `κ(n)`. -/
theorem accept_lowT (hwf : WF (toProb P)) {K : ℝ} (hb : BracketG P.sqb (maskOf PS) K) (hK : 0 < K)
    {k0 k1 k2 : ℤ} {rb : RBox} {v0 f0 f1 f2 f3 : ℕ}
    (hA : farLbT P sig nb [k0, k1, k2] rb v0 [f0, f1, f2, f3] ≥ 0)
    {s : Fin 3 → ℝ} (hs : ∀ i, |s i| ≤ 1) {sx sy : ℝ} (hsx : |sx| ≤ 1) (hsy : |sy| ≤ 1)
    (hkd0 : 0 < P.kd) {R : M3} {Nv : ℝ} (hNv : 0 < Nv)
    (hR : ∀ i j : Fin 3, qEval (nth (rotQ (rboxQ P.den rb)).1 (3 * i.val + j.val) []) s = Nv * R i j)
    (hN : qEval (rotQ (rboxQ P.den rb)).2 s = Nv) :
    kapV P k0 k1 k2 (nx nb sx / P.nd) (ny nb sy / P.nd)
      ≤ dualB (toProb P) !₂[nx nb sx / P.nd, sgn sig * (ny nb sy / P.nd), 1] R v0
          ![f0, f1, f2, f3] := by
  rw [farLbT_eq] at hA
  have hnb : (2 : ℕ) = 2 ^ PS.length := rfl
  have tok : ∀ e, TermsOk PS (termsT P sig nb [k0, k1, k2] rb v0 [f0, f1, f2, f3] e) := by
    intro e x hx
    simp only [termsT, List.mem_append, List.mem_map, List.mem_range, List.mem_singleton] at hx
    rcases hx with ⟨t, ht, rfl⟩ | rfl
    · exact ⟨(coET_val sig nb hwf v0 f0 f1 f2 f3 _ _ e).1, mem_rq (P := toProb P) ht⟩
    · refine ⟨(coNT_val sig nb k0 k1 k2 e).1, ?_⟩
      obtain ⟨wq, xq, yq, zq, hq⟩ := rboxQ_four P.den rb
      obtain ⟨_, _, hlN⟩ := rotQ_length wq xq yq zq
      rw [← hq] at hlN
      exact hlN
  obtain ⟨a0, g0⟩ := gEval_combine (ps := PS) s (tok 0)
  obtain ⟨a1, g1⟩ := gEval_combine (ps := PS) s (tok 1)
  obtain ⟨a2, g2⟩ := gEval_combine (ps := PS) s (tok 2)
  rw [← hnb] at a0 g0 a1 g1 a2 g2
  have hL := lbOf_le (toProb P) hb hs hsx hsy a0 a1 a2
  simp only [toProb_ps] at hL
  rw [g0, g1, g2] at hL
  have h0 : (0 : ℝ) ≤ (lbOf (toProb P) [combine 2 (termsT P sig nb [k0, k1, k2] rb v0 [f0, f1, f2, f3] 0),
      combine 2 (termsT P sig nb [k0, k1, k2] rb v0 [f0, f1, f2, f3] 1),
      combine 2 (termsT P sig nb [k0, k1, k2] rb v0 [f0, f1, f2, f3] 2)] : ℝ) := by exact_mod_cast hA
  have e00 := hR 0 0; have e01 := hR 0 1; have e02 := hR 0 2
  have e10 := hR 1 0; have e11 := hR 1 1; have e12 := hR 1 2
  have e20 := hR 2 0; have e21 := hR 2 1; have e22 := hR 2 2
  simp only [Fin.val_zero, Fin.val_one, Fin.val_two] at e00 e01 e02 e10 e11 e12 e20 e21 e22
  norm_num at e00 e01 e02 e10 e11 e12 e20 e21 e22
  simp only [termsT, show List.range 9 = [0, 1, 2, 3, 4, 5, 6, 7, 8] from rfl, List.map_cons,
    List.map_nil, List.map_append, List.sum_append, List.sum_cons, List.sum_nil, add_zero,
    Nat.reduceDiv, Nat.reduceMod, e00, e01, e02, e10, e11, e12, e20, e21, e22, hN,
    (coET_val sig nb hwf v0 f0 f1 f2 f3 _ _ _).2, (coNT_val sig nb k0 k1 k2 _).2] at hL
  simp only [(pp_eq P sig nb _).1, (pp_eq P sig nb _).2.1, (pp_eq P sig nb _).2.2, nn, nNT, nth,
    List.getD_cons_zero, List.getD_cons_succ] at hL
  have hdv0 : 0 < P.dv := hwf.dv
  have hc00 : 0 < P.cden := hwf.c0d
  have hnd0 : 0 < P.nd := hwf.nden
  have hdv : (0 : ℝ) < P.dv := by exact_mod_cast hdv0
  have hc0 : (0 : ℝ) < P.cden := by exact_mod_cast hc00
  have hnd : (0 : ℝ) < P.nd := by exact_mod_cast hnd0
  have hkd : (0 : ℝ) < P.kd := by exact_mod_cast hkd0
  set D := dualB (toProb P) !₂[nx nb sx / P.nd, sgn sig * (ny nb sy / P.nd), 1] R v0 ![f0, f1, f2, f3]
    - kapV P k0 k1 k2 (nx nb sx / P.nd) (ny nb sy / P.nd) with hD
  have hC : 0 < K * (Nv * ((P.cden : ℝ) * P.kd) * P.nd * 4 * P.dv) := by positivity
  have hfin : ∀ X : ℝ, (lbOf (toProb P)
      [combine 2 (termsT P sig nb [k0, k1, k2] rb v0 [f0, f1, f2, f3] 0),
      combine 2 (termsT P sig nb [k0, k1, k2] rb v0 [f0, f1, f2, f3] 1),
      combine 2 (termsT P sig nb [k0, k1, k2] rb v0 [f0, f1, f2, f3] 2)] : ℝ) ≤ X →
      X = K * (Nv * ((P.cden : ℝ) * P.kd) * P.nd * 4 * P.dv) * D → 0 ≤ D := by
    intro X h1 h2
    have h3 := le_trans h0 (h2 ▸ h1)
    by_contra hneg
    push Not at hneg
    have := mul_neg_of_pos_of_neg hC hneg
    linarith
  have hDn : 0 ≤ D := by
    refine hfin _ hL ?_
    rw [hD]
    simp only [dualB, VV, c0r, kapV, nx, ny, dot, mv_apply, Fin.sum_univ_three, Fin.sum_univ_four,
      TetSep.bT, vec_apply, ent, ev, toProb_c0, toProb_ps, toProb_nb, toProb_verts, toProb_dv,
      (fval_fI P.cnum).2]
    simp
    field_simp
    ring
  linarith

end

end PackLean.Formal.DTFar
