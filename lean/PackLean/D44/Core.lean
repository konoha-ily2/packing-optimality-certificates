import PackLean.D16.Core

/-! A11 (2026-11-15): checking the arithmetic of the "sandwich" certificates of the four n = 2 problems without a closed
form (cubindod, icoinico, dodindod, octinoct; D44, NOTES_d44) in Lean.

Written by hand (Claude, Opus 5.5). It reuses the D16 Core unchanged (field elements, rotation quadratics, the far
region `farRun`, the candidate polynomials `candPolys`, the face substitution `faceSub`, the box lower bound
`shiftLb3`, the constants `pieceOk`/`containerOk`/`groupOk`/`boundsOk`/`upperOk`). What is new here:

* the local region of Lemma Q (D44 3.2, `d44_local.py`): a leaf carries positive integer weights w_k on candidates.
  For every candidate with w_k > 0 the three A_j have a lower bound ≥ 0 on the box; with
  Φ_k = e_k + ρ g_k(θ) + ρ² H_k(θ, ρ) on the face (the split is done here by the total degree of the monomials of Φ_k
  in the quaternion coordinates), e := Σ w_k e_k (exact field element, lower end of its enclosure),
  g := lb(Σ w_k g_k), h := lb(Σ w_k H_k) on the box, the quadratic e + gρ + hρ² is > 0 on [ρ_a, ρ_b]
  (both ends, and the vertex when h > 0 and the vertex lies strictly inside), all on the same positive scale.
* the "far-shaped" local leaf: an axis-parallel box of chart 0 (p coordinates) that contains the local box
  (checked on integers as in `d44_local.pbox_contains`) is accepted by the far rule `acceptOk` (constant multipliers,
  same S̄ and T; the multiplier denominator of these leaves is `qlamL`).
* the sandwich claim: S̄ = sstar (the local polynomials use S̄ in place of S*), S̄ ≥ C0·s̄, S_up ≤ C0·s_up (rational),
  s̄ < s_up, and the configuration R̂ (the identity here, the piece is stored already rotated) at t̂ fits into the
  container of offset S_up and is separated by the plane n0·x = 0 (`upperOk` with sstar := S_up).

Not formalised (as in D12 18–23): Lemma R, Lemma Q / Lemma W themselves (candidate expression ≤ φ when the multipliers
are ≥ 0), the meaning of the far leaf rules, the covering of SO(3) by the four charts and of L by the six faces, the
meaning of the constants (that the vertices are a rotated regular solid, that R̂ is close to optimal).
-/

namespace PackLean.D44
open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign QF loHi monoLb RBox rboxWf nth vecGet
  Mono Poly padd psum pmul psmulZ psmulF)
open PackLean.D16

/-- total degree of a monomial -/
def mdeg (m : Mono) : Nat := m.foldl (· + ·) 0

/-- the part of p of total degree exactly d, substituted on the face (gives a polynomial without ρ when the
  monomials of degree d are divided by ρ^d). -/
def faceSubEq (i : Nat) (sg : Int) (d : Nat) (p : Poly) : Poly :=
  faceSub i sg d (p.filter (fun (x : Mono × FE) => mdeg x.1 == d))

/-- a local leaf: split, weighted sum of candidates (index, positive integer weight), or far-shaped
  (p box of chart 0, μ, multiplier terms). -/
inductive QTok where
  | split
  | w (ws : List (Nat × Nat))
  | far (plo phi : List Int) (mu : Nat) (ts : List Term)

/-- per candidate on one face: (e_k, g_k, H_k, [A_1, A_2, A_3]) -/
abbrev QFace := List (FE × Poly × Poly × List Poly)

/-- e + gρ + hρ² > 0 for ρ = r/D, r ∈ [lo, hi] (everything multiplied by D²). -/
def quadPos (D e g h lo hi : Int) : Bool :=
  let v (r : Int) : Int := e * D * D + g * r * D + h * r * r
  decide (v lo > 0) && decide (v hi > 0) &&
  (if decide (h > 0) && decide (2 * h * lo < -g * D) && decide (-g * D < 2 * h * hi)
   then decide (4 * e * h - g * g > 0) else true)

def wsumP (ws : List (Nat × Nat)) (ps : List Poly) : Poly :=
  psum (ws.map (fun (x : Nat × Nat) => psmulZ (x.2 : Int) (nth ps x.1 [])))

def wsumE (nb : Nat) (ws : List (Nat × Nat)) (es : List FE) : FE :=
  ws.foldl (fun acc (x : Nat × Nat) => fadd acc (fsmul (x.2 : Int) (nth es x.1 (fzero nb)))) (fzero nb)

/-- weighted leaf (Lemma Q) -/
def wLeafOk (P : Prob) (D : Int) (cf : QFace) (b : LBox) (ws : List (Nat × Nat)) : Bool :=
  let es := cf.map (fun x => x.1)
  let gs := cf.map (fun x => x.2.1)
  let hs := cf.map (fun x => x.2.2.1)
  !ws.isEmpty && ws.all (fun (x : Nat × Nat) => decide (x.1 < cf.length) && decide (0 < x.2)) &&
  ws.all (fun (x : Nat × Nat) =>
    let (_, _, _, As) := nth cf x.1 (fzero P.nb, [], [], [])
    As.length == 3 && As.all (fun a => lbPos P D a b false)) &&
  (let E := wsumE P.nb ws es
   let e := (loHi P.sqb (fsmul (D ^ 8) E)).1
   match shiftLb3 P D (wsumP ws gs) b.lo b.hi, shiftLb3 P D (wsumP ws hs) b.lo b.hi with
   | some g, some h => quadPos D e g h (nth b.lo 0 0) (nth b.hi 0 0)
   | _, _ => false)

/-- the p box of chart 0 contains the local box of face (i, sg) (as `d44_local.pbox_contains`). -/
def pboxOk (D : Int) (i : Nat) (sg : Int) (lo hi plo phi : List Int) : Bool :=
  let r0 := nth lo 0 0; let r1 := nth hi 0 0
  let others := (List.range 3).filter (· != i)
  plo.length == 3 && phi.length == 3 && decide (0 ≤ r0) &&
  (if sg > 0 then decide (nth plo i 0 ≤ r0) && decide (r1 ≤ nth phi i 0)
   else decide (nth plo i 0 ≤ -r1) && decide (-r0 ≤ nth phi i 0)) &&
  (List.zip (List.range 2) others).all (fun (x : Nat × Nat) =>
    let (j, ax) := x
    [r0, r1].all (fun r => [nth lo (1 + j) 0, nth hi (1 + j) 0].all (fun a =>
      decide (nth plo ax 0 * D ≤ r * a) && decide (r * a ≤ nth phi ax 0 * D)))) &&
  (List.zip plo phi).all (fun (x : Int × Int) => decide (x.1 < x.2) && (x.2 - x.1) % 2 == 0)

def farLeafOk (P : Prob) (qlamL : Nat) (D : Int) (i : Nat) (sg : Int) (b : LBox)
    (plo phi : List Int) (mu : Nat) (ts : List Term) : Bool :=
  let rb : RBox := ⟨0, nth plo 0 0, nth plo 1 0, nth plo 2 0, nth phi 0 0, nth phi 1 0, nth phi 2 0⟩
  pboxOk D i sg b.lo b.hi plo phi && rboxWf rb && acceptOk { P with qlam := qlamL } rb mu ts

structure QState where
  stack : List LBox
  ok : Bool
  nW : Nat
  nF : Nat

def boxWf (b : LBox) : Bool :=
  b.lo.length == 3 && b.hi.length == 3 &&
  (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id

def qstep (P : Prob) (qlamL : Nat) (D : Int) (i : Nat) (sg : Int) (cf : QFace) (s : QState) (t : QTok) : QState :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    match t with
    | .split =>
      let (c1, c2) := lsplit b
      { s with stack := c1 :: c2 :: rest,
               ok := s.ok && (List.zipWith (fun l h => decide (h - l > 2)) b.lo b.hi).any id }
    | .w ws =>
      { s with stack := rest, nW := s.nW + 1, ok := s.ok && boxWf b && wLeafOk P D cf b ws }
    | .far plo phi mu ts =>
      { s with stack := rest, nF := s.nF + 1, ok := s.ok && boxWf b && farLeafOk P qlamL D i sg b plo phi mu ts }

/-- the local region of Lemma Q: candidates well formed with one common denominator dm (so that all Φ_k are on
  the same scale), ρ₀ > 0, the trees of the 6 faces close and every leaf passes.
  Returns (ok, weighted leaves, far-shaped leaves). -/
def localQ (P : Prob) (qlamL : Nat) (cands : List Cand) (faces : List (List QTok)) : Bool × Nat × Nat :=
  let k := P.nb
  let (Rq, N) := rotPoly P.ps k
  let polys := cands.map (candPolys P Rq N)
  let dm0 := (cands.headD ⟨[], [], [], 0⟩).dm
  let candsOk := !cands.isEmpty && cands.all (candOk P) && cands.all (fun c => c.dm == dm0)
  let D := P.rden
  let rhoOk := (P.r0 * (P.rho0.2 : Int) == P.rho0.1 * D) && decide (0 < P.r0)
  let res := (List.zip faceList faces).foldl (fun (acc : Bool × Nat × Nat) (x : (Nat × Int) × List QTok) =>
    let ((i, sg), toks) := x
    let cf : QFace := polys.map (fun (y : Poly × List Poly) =>
      (constTerm k y.1, faceSubEq i sg 1 y.1, faceSub i sg 2 y.1, y.2.map (faceSub i sg 0)))
    let s := toks.foldl (qstep P qlamL D i sg cf) ⟨[⟨[0, -D, -D], [P.r0, D, D]⟩], true, 0, 0⟩
    (acc.1 && s.ok && s.stack.isEmpty, acc.2.1 + s.nW, acc.2.2 + s.nF)) (true, 0, 0)
  (candsOk && rhoOk && faces.length == 6 && res.1, res.2.1, res.2.2)

/-! ## constants and the sandwich claim -/

/-- sstar is exactly the rational S̄ (the local polynomials are built with sstar). -/
def sstarIsSbar (P : Prob) : Bool :=
  P.sstar.num.length == P.nb && (P.sstar.num.drop 1).all (· == 0) &&
  (P.sstar.num.headD 0) * (P.sbar.2 : Int) == P.sbar.1 * (P.sstar.den : Int)

/-- S̄ ≥ C0·s̄, S_up ≤ C0·s_up (rational), 0 < s̄ < s_up, cedge2 = 1 (so s = S/C0). -/
def claimOk (P : Prob) (sbarS : Int × Nat) (sup : QF) (supRat : Int × Nat) : Bool :=
  let k := P.nb; let ps := P.ps
  let sbQ : QF := QF.ofRat k sbarS.1 sbarS.2
  let suQ : QF := QF.ofRat k supRat.1 supRat.2
  let SbQ : QF := QF.ofRat k P.sbar.1 P.sbar.2
  decide (0 < sbarS.2) && decide (0 < supRat.2) && decide (0 < P.c0.den) && decide (0 < sup.den) &&
  decide (0 < sbarS.1) && decide (sbarS.1 * (supRat.2 : Int) < supRat.1 * (sbarS.2 : Int)) &&
  QF.le ps (QF.mul ps P.c0 sbQ) SbQ && QF.le ps sup (QF.mul ps P.c0 suQ) &&
  P.cedge2 == (1, 1) && fpos ps P.c0.num

def constsQ (P : Prob) (sbarS : Int × Nat) (sup : QF) (supRat : Int × Nat) : Bool :=
  sqbOk P && pieceOk P && containerOk P && groupOk P && boundsOk P && sstarIsSbar P &&
  upperOk { P with sstar := sup } && claimOk P sbarS sup supRat &&
  decide (0 < P.dv) && decide (0 < P.dn) && decide (0 < P.dn0) && decide (0 < P.dp) && decide (0 < P.dg) &&
  decide (0 < P.dk) && decide (0 < P.dt) && decide (0 < P.dcv) && decide (0 < P.rden) &&
  (P.r0 * (P.rho0.2 : Int) == P.rho0.1 * P.rden)

end PackLean.D44
