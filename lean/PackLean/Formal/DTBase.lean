import PackLean.Formal.TetFar
import PackLean.D45DT.CoreL

/-!
# A9k stage 7c-0: the far leaves of D45DT (dodintet_n02) as D28 leaves

Design: `plan/A9k_dodintet_design.md` §0, §2, §3 (7c-0).

* `discLbT_eq`: the discarded leaf of `D45DT` is the discarded leaf of `D28` for `toProb P` (`rfl`), so
  `TetFar.disc_trace` applies as it is (`disc_traceT`).
* `farLbT_eq`: the accepted leaf `farLbT` is `lbOf (toProb P)` of three combined term lists (`rfl`); the
  coefficients `coET`, `coNT` are copied from `farLbT` (the meaning is stage 7c-1).
* `dtExtraOk P`: the Bool that puts `toProb P` under `TetFar` (`wfOk`, `sqbOk`, `rotsOk`), giving `WF`, the
  √5 bracket and the rotations (`toProb_wf`, `toProb_bracket`, `toProb_krot`).
-/

namespace PackLean.Formal.DTBase

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign QF Quad RBox rboxQ rboxWf
  rotQ combine nth vecGet monoLb loHi quadKind Prob lbOf discLb rotsOk sqbOk)
open PackLean.D45DT (Prm NB BV BTOP fI toProb farLbT discLbT PS)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.QuadSem
  PackLean.Formal.TetFar
open PackLean.Formal.PolySemG (BracketG maskOf)
open PackLean.Formal.FarG (mat)
open scoped Matrix

/-! ## The discarded leaf -/

theorem discLbT_eq (P : Prm) (rb : RBox) (m : ℕ) : discLbT P rb m = discLb (toProb P) rb m := rfl

/-! ## The accepted leaf: the coefficients of `farLbT` -/

section Far

variable (P : Prm) (sig : ℕ) (nb : NB)

/-- `p · NDEN` (`p = n` for `sig = 0`, `p = σn` for `sig = 1`) by coefficient of `(1, sx, sy)`. -/
def pNT : List (List ℤ) :=
  let s : ℤ := if sig == 0 then 1 else -1
  [[(nb.l0 + nb.h0) / 2, (nb.h0 - nb.l0) / 2, 0], [s * ((nb.l1 + nb.h1) / 2), 0, s * ((nb.h1 - nb.l1) / 2)],
   [P.nd, 0, 0]]

/-- `n · NDEN` by coefficient of `(1, sx, sy)`. -/
def nNT : List (List ℤ) :=
  [[(nb.l0 + nb.h0) / 2, (nb.h0 - nb.l0) / 2, 0], [(nb.l1 + nb.h1) / 2, 0, (nb.h1 - nb.l1) / 2], [P.nd, 0, 0]]

/-- `b · rows`, coefficient `e` (the `dotE` of `farLbT`). -/
def dotE (b : List ℤ) (rows : List (List ℤ)) (e : ℕ) : ℤ :=
  (List.zip b rows).foldl (fun acc (x : ℤ × List ℤ) => acc + x.1 * nth x.2 e 0) 0

/-- The coefficient of `Rq_ij` in the `e`-th quadratic of `farLbT` (copied). -/
def coET (v0 : ℕ) (vf : List ℕ) (i j e : ℕ) : FE :=
  let pN := pNT P sig nb
  let bt := nth BV BTOP []
  let V0 := nth P.verts v0 []
  let L : Int := (P.cden : Int) * P.kd
  let base := fsmul (4 * nth (nth pN i []) e 0) (vecGet V0 j 2)
  let rest := (List.range 4).foldl (fun acc f =>
    if f == BTOP then acc else
      let bf := nth BV f []
      let wf := dotE (List.zipWith (· - ·) bt bf) pN e
      fadd acc (fsmul (wf * nth bf i 0) (vecGet (nth P.verts (nth vf f 0) []) j 2))) (fzero 2)
  fsmul L (fadd base rest)

/-- The coefficient of `N` in the `e`-th quadratic of `farLbT` (copied); `kap` is κ over `kd` in the n
  coordinates. -/
def coNT (kap : List ℤ) (e : ℕ) : FE :=
  let mN := dotE (nth BV BTOP []) (pNT P sig nb) e
  let kN := dotE kap (nNT P nb) e
  fI (-(4 * (P.dv : Int)) * ((P.kd : Int) * P.cnum * mN + (P.cden : Int) * kN))

/-- The terms of the `e`-th quadratic. -/
def termsT (kap : List ℤ) (rb : RBox) (v0 : ℕ) (vf : List ℕ) (e : ℕ) : List (FE × Quad) :=
  ((List.range 9).map (fun ij => (coET P sig nb v0 vf (ij / 3) (ij % 3) e,
    nth (rotQ (rboxQ P.den rb)).1 ij []))) ++ [(coNT P sig nb kap e, (rotQ (rboxQ P.den rb)).2)]

theorem farLbT_eq (kap : List ℤ) (rb : RBox) (v0 : ℕ) (vf : List ℕ) :
    farLbT P sig nb kap rb v0 vf = lbOf (toProb P) [combine 2 (termsT P sig nb kap rb v0 vf 0),
      combine 2 (termsT P sig nb kap rb v0 vf 1), combine 2 (termsT P sig nb kap rb v0 vf 2)] := rfl

end Far

/-! ## `toProb P` under `TetFar` -/

/-- The Bool of the case that puts `toProb P` under `TetFar`. -/
def dtExtraOk (P : Prm) : Bool := wfOk (toProb P) && sqbOk (toProb P) && rotsOk (toProb P)

theorem maskOf_PS : maskOf PS = [1, 5] := rfl

theorem toProb_ps (P : Prm) : (toProb P).ps = PS := rfl
theorem toProb_nb (P : Prm) : (toProb P).nb = 2 := rfl
theorem toProb_sqb (P : Prm) : (toProb P).sqb = P.sqb := rfl
theorem toProb_verts (P : Prm) : (toProb P).verts = P.verts := rfl
theorem toProb_rots (P : Prm) : (toProb P).rots = P.rots := rfl
theorem toProb_rden (P : Prm) : (toProb P).rden = P.den := rfl
theorem toProb_nden (P : Prm) : (toProb P).nden = P.nd := rfl
theorem toProb_dv (P : Prm) : (toProb P).dv = P.dv := rfl
theorem toProb_c0 (P : Prm) : (toProb P).c0 = ⟨fI P.cnum, P.cden⟩ := rfl

theorem toProb_wf {P : Prm} (h : dtExtraOk P = true) : WF (toProb P) := by
  simp only [dtExtraOk, Bool.and_eq_true] at h
  exact wf_of_ok h.1.1

/-- The √5 bracket of the far leaves (`K = 2 ^ sqk`). -/
theorem toProb_bracket {P : Prm} (h : dtExtraOk P = true) :
    BracketG P.sqb (maskOf PS) ((2 : ℝ) ^ P.sqk) := by
  simp only [dtExtraOk, Bool.and_eq_true] at h
  exact bracket_of_sqbOk (wf_of_ok h.1.1) h.1.2

/-- The listed rotations (as `TetFar.rots_krot`). -/
theorem toProb_krot {P : Prm} (h : dtExtraOk P = true) {m : ℕ} (hm : m < P.rots.length) :
    (mat PS 2 P.dk (nth P.rots m []))ᵀ * mat PS 2 P.dk (nth P.rots m []) = 1 ∧
      (mat PS 2 P.dk (nth P.rots m [])).det = 1 ∧
      ∀ l < P.verts.length, ∃ l' < P.verts.length,
        mv (mat PS 2 P.dk (nth P.rots m [])) (VV (toProb P) l) = VV (toProb P) l' := by
  have h' := h
  simp only [dtExtraOk, Bool.and_eq_true] at h'
  exact rots_krot (P := toProb P) (wf_of_ok h'.1.1) h'.2 hm

/-- **A discarded leaf** (token `D m` of `rchar`): at a rotation `R` of the box (`Rq = Nv · R`, `Nv > 0`),
`tr(R K) > tr(R)` for the symmetry `K = rots[m] / dk` (`TetFar.disc_trace` through `discLbT_eq`). -/
theorem disc_traceT {P : Prm} (h : dtExtraOk P = true) {rb : RBox} {m : ℕ} (hD : discLbT P rb m > 0)
    {s : Fin 3 → ℝ} (hs : ∀ i, |s i| ≤ 1) {R : M3} {Nv : ℝ} (hNv : 0 < Nv)
    (hR : ∀ i j : Fin 3, qEval (nth (rotQ (rboxQ P.den rb)).1 (3 * i.val + j.val) []) s = Nv * R i j) :
    R.trace < (R * mat PS 2 P.dk (nth P.rots m [])).trace := by
  have hwf := toProb_wf h
  have hb := toProb_bracket h
  rw [discLbT_eq] at hD
  exact disc_trace (P := toProb P) hwf hb (by positivity) hD hs hNv hR

end PackLean.Formal.DTBase
