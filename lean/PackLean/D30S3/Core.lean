import PackLean.D16.Core

/-! Parts for re-checking in Lean the arithmetic of the global-optimality certificate of D30 stage 3 (octinico_n02, tube) (2026-11-14, A8).

The D16 Core (`PackLean.D16.Core`, published in v0.2.0) is **not changed**. Field elements, quadratic forms, sparse polynomials,
bracketing of square roots, far acceptance `acceptOk`, discarding `discLb`, candidate polynomials `candPolys`, box lower bounds
`shiftLb3` and `lbPos`, and `lsplit` are used as they are; only what D16 lacks is written here (rebuilt independently of Python's
`d30_s3_*` and `d30_local.check_mix`; no Mathlib).

* Tube: in chart 0, p = τ·n + y1·e1 + y2·e2 (n, e1, e2 mutually orthogonal, rational); tube = {τ ∈ [TC − TW, TC + TW], |y1|, |y2| ≤ ρ₀}.
  The constants live in one place, `S3`; both the far "inside the tube" test and the local substitution and root boxes read them from there.
* Far: the same tree walk as D16's `farRun`; only the test of an L leaf is replaced by "the tube coordinates of the 8 corners of
  the box are inside the tube" (`insideTube`).
* Local: on each of the 4 tube edges (y1 = ±1, y2 = ±1) Lean builds p = τ(a1)·n + ρ·θ(a2), τ = TC + TW·a1, substitutes it, and
  checks that F is divisible by ρ (degree-0 identity) and that F(t·n) ≡ 0 (as a polynomial in t).
  A leaf is either a single candidate (G > 0 and the conditions on A_j) or weights w + pair lifting c (Lemma W (i)(ii), the same
  formula as `d30_local.check_mix`):
    G = Σ w_k G_{(J_k, α)} + Σ c_f·2(n_f·Rq v_{α(f)} − S*·N) (the lifting loss, built by Lean itself),
    a_f = Σ w_k A^k_f + c_f ρ (faces positive at R*), a_f/ρ = Σ w_k A^k_f/ρ + c_f (faces zero at R*).
  Lower bound of G > 0, lower bound of a ≥ 0.
* Constants: the tube basis, agreement of ρ₀, R* = spin(τ₀) (Lean rotates the unrotated octahedron and compares with the vertices
  and n0 of P), S* = C0·s*.
-/

namespace PackLean.D30S3
open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign QF RBox rboxWf split3 nth vecGet
  Mono Poly padd psum pmul psmulZ psmulF incAt)
open PackLean.D16

/-! ## Tube and stage-3 constants -/

structure S3 where
  tc : Int × Nat              -- TC
  tw : Int × Nat              -- TW
  rho0 : Int × Nat            -- ρ₀
  ed : Nat                    -- common denominator of n, e1, e2
  n : List Int                -- direction of the family × ed
  e1 : List Int
  e2 : List Int
  tau0 : Int × Nat            -- R* = spin(τ₀): quaternion (1, τ₀ n)
  act : List Nat              -- faces active at R* (f0 and the faces g of the edges of T*)
  bverts : List (List FE)     -- unrotated piece vertices × dbv
  dbv : Nat
  bn0 : List FE               -- unrotated n0 × dbn0
  dbn0 : Nat
  sst : QF                    -- s* (edge length)

def idot (a b : List Int) : Int := (List.zipWith (· * ·) a b).foldl (· + ·) 0

/-- The basis is orthogonal and nonzero, the denominators are positive, TW and ρ₀ are positive. -/
def tubeOk (X : S3) : Bool :=
  X.n.length == 3 && X.e1.length == 3 && X.e2.length == 3 &&
  idot X.n X.e1 == 0 && idot X.n X.e2 == 0 && idot X.e1 X.e2 == 0 &&
  decide (idot X.n X.n > 0) && decide (idot X.e1 X.e1 > 0) && decide (idot X.e2 X.e2 > 0) &&
  decide (0 < X.ed) && decide (0 < X.tc.2) && decide (0 < X.tw.2) && decide (0 < X.rho0.2) &&
  decide (0 < X.tw.1) && decide (0 < X.rho0.1)

/-! ## Far: inside the tube -/

def corners (b : RBox) : List (List Int) :=
  [b.l0, b.h0].foldr (fun x acc =>
    [b.l1, b.h1].foldr (fun y acc2 => [b.l2, b.h2].map (fun z => [x, y, z]) ++ acc2) acc) []

/-- Is the coordinate (p·b)/|b|² = (Pt·b)·ed/(rden·|b|²) of the point p = Pt/rden along the basis vector b/ed in [lo, hi]? -/
def coordIn (rden : Int) (ed : Nat) (Pt b : List Int) (lo hi : Int × Nat) : Bool :=
  let v := idot Pt b * (ed : Int)
  let s := rden * idot b b
  decide (lo.1 * s ≤ v * (lo.2 : Int)) && decide (v * (hi.2 : Int) ≤ hi.1 * s)

def tauLo (X : S3) : Int × Nat := (X.tc.1 * X.tw.2 - X.tw.1 * X.tc.2, X.tc.2 * X.tw.2)
def tauHi (X : S3) : Int × Nat := (X.tc.1 * X.tw.2 + X.tw.1 * X.tc.2, X.tc.2 * X.tw.2)

/-- The box is inside the tube (chart 0; the tube coordinates of the 8 corners are exactly inside; the tube is convex, so the whole box is inside). -/
def insideTube (P : Prob) (X : S3) (rb : RBox) : Bool :=
  rb.ch == 0 && (corners rb).all (fun Pt =>
    coordIn P.rden X.ed Pt X.n (tauLo X) (tauHi X) &&
    coordIn P.rden X.ed Pt X.e1 (-X.rho0.1, X.rho0.2) X.rho0 &&
    coordIn P.rden X.ed Pt X.e2 (-X.rho0.1, X.rho0.2) X.rho0)

def leafOkT (P : Prob) (X : S3) (rb : RBox) : Tok → Bool
  | .split => false
  | .L => insideTube P X rb
  | .D m => decide (m < P.pairs.length) && decide (discLb P rb m > 0)
  | .A mu ts => acceptOk P rb mu ts

def wstepT (P : Prob) (X : S3) (s : WState) (t : Tok) : WState :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    match t with
    | .split =>
      let (c1, c2) := split3 b
      { s with stack := c1 :: c2 :: rest,
               ok := s.ok && rboxWf b && decide (b.h0 - b.l0 > 2 ∨ b.h1 - b.l1 > 2 ∨ b.h2 - b.l2 > 2) }
    | .L => { s with stack := rest, ok := s.ok && rboxWf b && leafOkT P X b t, nL := s.nL + 1 }
    | .D _ => { s with stack := rest, ok := s.ok && rboxWf b && leafOkT P X b t, nD := s.nD + 1 }
    | .A .. => { s with stack := rest, ok := s.ok && rboxWf b && leafOkT P X b t, nA := s.nA + 1 }

/-- Walk all 4 chart trees: (closed with every leaf passing, accepted, discarded, tube) -/
def farRunT (P : Prob) (X : S3) (toks : List Tok) : Bool × Nat × Nat × Nat :=
  let s := toks.foldl (wstepT P X) ⟨rRoots P.rden, true, 0, 0, 0⟩
  (s.ok && s.stack.isEmpty, s.nA, s.nD, s.nL)

/-! ## Local: polynomial parts -/

def monoDeg (m : Mono) : Nat := m.foldl (· + ·) 0

def degLe (d : Nat) (p : Poly) : Bool := p.all (fun (x : Mono × FE) => decide (monoDeg x.1 ≤ d))

/-- p(x/K)·K^d (the coefficients of a polynomial of degree ≤ d multiplied by K^{d−|m|}; the degree is checked separately by degLe). -/
def homScale (K : Int) (d : Nat) (p : Poly) : Poly :=
  p.map (fun (x : Mono × FE) => (x.1, fsmul (K ^ (d - monoDeg x.1)) x.2))

/-- p(X_0, X_1, X_2) (X_i are polynomials in (ρ, a1, a2)). -/
def subst (ps : List Nat) (X : List Poly) (p : Poly) : Poly :=
  psum (p.map (fun (x : Mono × FE) =>
    (List.zip (List.range 3) x.1).foldl (fun acc (y : Nat × Nat) =>
      (List.range y.2).foldl (fun acc2 _ => pmul ps acc2 (nth X y.1 [])) acc) [(z3, x.2)]))

def decHead : Mono → Mono
  | [] => []
  | a :: as => (a - 1) :: as

/-- Divide by ρ (the first variable), only when every term without ρ is 0. -/
def divRho (p : Poly) : Option Poly :=
  if p.all (fun (x : Mono × FE) => decide (x.1.headD 0 > 0) || fIsZero x.2) then
    some (p.filterMap (fun (x : Mono × FE) => if fIsZero x.2 then none else some (decHead x.1, x.2)))
  else none

/-- The 4 tube edges (in the order of Python's FACES: y1=+1, y1=−1, y2=+1, y2=−1). (fixed coordinate, sign). -/
def tubeFaces : List (Nat × Int) := [(0, 1), (0, -1), (1, 1), (1, -1)]

/-- K = tc.den·tw.den·ed (the factor that makes K·p a polynomial in (ρ, a1, a2) with integer coefficients). -/
def kScale (X : S3) : Int := (X.tc.2 : Int) * X.tw.2 * X.ed

/-- K·p_i on the edge (j, sg): K·(TC + TW·a1)·n_i/ed + K·ρ·(sg·b_j + a2·b_o)_i/ed (b_0 = e1, b_1 = e2, b_o the other one). -/
def faceX (nb : Nat) (X : S3) (j : Nat) (sg : Int) : List Poly :=
  let bj := if j == 0 then X.e1 else X.e2
  let bo := if j == 0 then X.e2 else X.e1
  let tcd : Int := X.tc.2; let twd : Int := X.tw.2
  (List.range 3).map (fun i =>
    let ni := nth X.n i 0
    psum [[([0, 0, 0], fofInt nb (X.tc.1 * twd * ni))], [([0, 1, 0], fofInt nb (X.tw.1 * tcd * ni))],
          [([1, 0, 0], fofInt nb (sg * tcd * twd * nth bj i 0))], [([1, 0, 1], fofInt nb (tcd * twd * nth bo i 0))]])

/-- The lifting loss 2(n_f·Rq v − S*·N) times K₂ (K₂ = den(D0)·den(S*)·dm·dn0·dn·dv, the same factor as the F of candPolys). -/
def liftPoly (P : Prob) (Rq : List Poly) (N : Poly) (dm : Nat) (f v : Nat) : Poly :=
  let k := P.nb; let ps := P.ps
  let n := nth P.normals f []; let vv := nth P.verts v []
  let B := psum ((List.range 9).map (fun t =>
    psmulF ps (fmul ps (vecGet n (t / 3) k) (vecGet vv (t % 3) k)) (nth Rq t [])))
  let ssd : Int := P.sstar.den
  let L := psub (psmulZ ssd B) (psmulF ps (fsmul ((P.dn : Int) * P.dv) P.sstar.num) N)
  psmulZ (2 * (P.d0.den : Int) * dm * P.dn0) L

def defCand : Cand := { J := [], al := [], minv := [], dm := 1 }

/-- The vertex of face f (α is in the order of act). -/
def alOf (X : S3) (al : List Nat) (f : Nat) : Nat :=
  match (List.zip X.act al).find? (fun (x : Nat × Nat) => x.1 == f) with
  | some x => x.2
  | none => 0

def idxOf (l : List Nat) (f : Nat) : Nat := ((List.range l.length).find? (fun i => nth l i 0 == f)).getD 0

/-! ## Local: leaves -/

inductive LTokT where
  | split
  | single (c : Nat)
  /-- Weights + lifting: α (vertices in the order of act), (candidate, numerator of w), (face, numerator of c). w and c share the denominator 2^24. -/
  | mix (al : List Nat) (ws : List (Nat × Nat)) (cs : List (Nat × Nat))

/-- Context of one edge -/
structure FCtx where
  Rq : List Poly
  N : Poly
  X : List Poly     -- K·p as polynomials in (ρ, a1, a2)
  K : Int

def sub (P : Prob) (c : FCtx) (p : Poly) : Poly := subst P.ps c.X (homScale c.K 4 p)

/-- Single candidate: lower bound of G = F/ρ > 0; lower bound of A_j (A_j/ρ if it is 0 at R*) ≥ 0 (> 0 if it is positive at R*). -/
def singleOk (P : Prob) (D : Int) (cands : List Cand) (c : FCtx) (b : LBox) (ci : Nat) : Bool :=
  let k := P.nb
  let cd := nth cands ci defCand
  let (F, AI) := candPolys P c.Rq c.N cd
  decide (ci < cands.length) &&
  (match divRho (sub P c F) with
   | some G => lbPos P D G b true
   | none => false) &&
  AI.all (fun a =>
    let z := fIsZero (constTerm k a)
    let A := sub P c a
    if z then (match divRho A with | some H => lbPos P D H b false | none => false)
    else lbPos P D A b true)

/-- Weights + pair lifting (Lemma W (i)(ii), the same formula as `d30_local.check_mix`). -/
def mixOk (P : Prob) (X : S3) (D : Int) (cands : List Cand) (c : FCtx) (b : LBox)
    (al : List Nat) (ws : List (Nat × Nat)) (cs : List (Nat × Nat)) : Bool :=
  let k := P.nb
  let dm := (nth cands 0 defCand).dm
  let shape := al.length == X.act.length && al.all (fun v => decide (v < P.verts.length)) &&
    !ws.isEmpty && ws.all (fun (x : Nat × Nat) => decide (0 < x.2) && decide (x.1 < cands.length)) &&
    cs.all (fun (x : Nat × Nat) => decide (0 < x.2) && X.act.contains x.1) &&
    (ws.map (·.1)).eraseDups.length == ws.length && (cs.map (·.1)).eraseDups.length == cs.length
  -- per candidate: J from the candidate, α from the box (as in d30_local.g_int)
  let parts : List (Nat × Option Poly × List Nat × List Poly) := ws.map (fun (x : Nat × Nat) =>
    let cd := nth cands x.1 defCand
    let cd' : Cand := { cd with al := cd.J.map (alOf X al) }
    let (F, AI) := candPolys P c.Rq c.N cd'
    (x.2, divRho (sub P c F), cd.J, AI))
  let gOk := parts.all (fun (x : Nat × Option Poly × List Nat × List Poly) => x.2.1.isSome)
  let G := padd (psum (parts.map (fun (x : Nat × Option Poly × List Nat × List Poly) =>
      psmulZ (x.1 : Int) (x.2.1.getD []))))
    (psum (cs.map (fun (x : Nat × Nat) =>
      psmulZ (x.2 : Int) (sub P c (liftPoly P c.Rq c.N dm x.1 (alOf X al x.1))))))
  let unit : Int := c.K ^ 4 * dm * P.dn0
  let aOk := X.act.all (fun f =>
    let terms := parts.filterMap (fun (x : Nat × Option Poly × List Nat × List Poly) =>
      if x.2.2.1.contains f then some (x.1, nth x.2.2.2 (idxOf x.2.2.1 f) []) else none)
    let cf : Int := ((cs.find? (fun (y : Nat × Nat) => y.1 == f)).map (·.2)).getD 0
    if terms.isEmpty && cf == 0 then true else
    let pos0 := terms.any (fun (y : Nat × Poly) => !fIsZero (constTerm k y.2))
    if pos0 then
      let ap := padd (psum (terms.map (fun (y : Nat × Poly) => psmulZ (y.1 : Int) (sub P c y.2))))
        [([1, 0, 0], fofInt k (cf * unit))]
      lbPos P D ap b false
    else
      let hs := terms.map (fun (y : Nat × Poly) => (divRho (sub P c y.2)).map (psmulZ (y.1 : Int)))
      hs.all (·.isSome) &&
      lbPos P D (padd (psum (hs.map (·.getD []))) [(z3, fofInt k (cf * unit))]) b false)
  shape && gOk && lbPos P D G b true && aOk

structure LStateT where
  stack : List LBox
  ok : Bool
  nAcc : Nat
  nS : Nat
  nM : Nat

def lstepT (P : Prob) (X : S3) (D : Int) (cands : List Cand) (c : FCtx) (s : LStateT) (t : LTokT) : LStateT :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    match t with
    | .split =>
      let (c1, c2) := lsplit b
      { s with stack := c1 :: c2 :: rest,
               ok := s.ok && (List.zipWith (fun l h => decide (h - l > 2)) b.lo b.hi).any id }
    | _ =>
      let wf := b.lo.length == 3 && b.hi.length == 3 &&
        (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id
      match t with
      | .single ci => { s with stack := rest, nAcc := s.nAcc + 1, nS := s.nS + 1,
                               ok := s.ok && wf && singleOk P D cands c b ci }
      | .mix al ws cs => { s with stack := rest, nAcc := s.nAcc + 1, nM := s.nM + 1,
                                  ok := s.ok && wf && mixOk P X D cands c b al ws cs }
      | .split => s

/-- Candidate shapes and degree-0 identities (the part independent of the edge): candOk, common dm, J ⊂ act, A_j(R*) ≥ 0, F(R*) = 0,
  F(t·n) ≡ 0 (as a polynomial in t, identically 0 on the family), degree ≤ 4. -/
def candsOk (P : Prob) (X : S3) (cands : List Cand) : Bool :=
  let k := P.nb; let ps := P.ps
  let (Rq, N) := rotPoly ps k
  let dm := (nth cands 0 defCand).dm
  let Xt : List Poly := (List.range 3).map (fun i => [([0, 1, 0], fofInt k (nth X.n i 0))])
  !cands.isEmpty && cands.all (fun cd =>
    let (F, AI) := candPolys P Rq N cd
    candOk P cd && cd.dm == dm && cd.J.all (fun f => X.act.contains f) &&
    degLe 4 F && AI.all (degLe 4) &&
    fIsZero (constTerm k F) && AI.all (fun a => decide (fsign ps (constTerm k a) ≥ 0)) &&
    (subst ps Xt (homScale (X.ed : Int) 4 F)).all (fun (x : Mono × FE) => fIsZero x.2))

/-- Degree-0 identities per edge: for every candidate F is divisible by ρ, and so is every A_j that is 0 at R*. -/
def faceIdentOk (P : Prob) (cands : List Cand) (c : FCtx) : Bool :=
  let k := P.nb
  cands.all (fun cd =>
    let (F, AI) := candPolys P c.Rq c.N cd
    (divRho (sub P c F)).isSome &&
    AI.all (fun a => !fIsZero (constTerm k a) || (divRho (sub P c a)).isSome))

/-- The whole local part: (closed, accepted per edge, single, weighted). -/
def localOkT (P : Prob) (X : S3) (cands : List Cand) (faces : List (List LTokT)) : Bool × List Nat × Nat × Nat :=
  let k := P.nb
  let (Rq, N) := rotPoly P.ps k
  let D := P.rden
  let r0n := X.rho0.1 * D
  let r0 := r0n / (X.rho0.2 : Int)
  let rhoOk := r0 * (X.rho0.2 : Int) == r0n && decide (0 < r0)
  let res := (List.zip tubeFaces faces).foldl
    (fun (acc : Bool × List Nat × Nat × Nat) (x : (Nat × Int) × List LTokT) =>
      let ((j, sg), toks) := x
      let c : FCtx := ⟨Rq, N, faceX k X j sg, kScale X⟩
      let s := toks.foldl (lstepT P X D cands c) ⟨[⟨[0, -D, -D], [r0, D, D]⟩], true, 0, 0, 0⟩
      (acc.1 && faceIdentOk P cands c && s.ok && s.stack.isEmpty, acc.2.1 ++ [s.nAcc],
       acc.2.2.1 + s.nS, acc.2.2.2 + s.nM)) (true, [], 0, 0)
  (candsOk P X cands && tubeOk X && rhoOk && faces.length == 4 && res.1, res.2.1, res.2.2.1, res.2.2.2)

/-! ## Stage-3 constants -/

/-- The unrotated piece is the unit-edge octahedron ±(√2/2)·e_i (6 vertices, one per axis and sign). -/
def octOk (P : Prob) (X : S3) : Bool :=
  let k := P.nb; let ps := P.ps
  let d : Int := X.dbv
  X.bverts.length == 6 && X.bverts.all (fun v => v.length == 3) &&
  (List.range 3).all (fun i => [1, -1].all (fun (s : Int) => X.bverts.any (fun v =>
    (List.range 3).all (fun j => if j == i then fsign ps (vecGet v j k) == s else fIsZero (vecGet v j k)) &&
    fmul ps (fsmul 2 (vecGet v i k)) (vecGet v i k) == fofInt k (d * d))))

/-- R* = spin(τ₀): the rotation of the quaternion q = (τ₀.den·ed, τ₀.num·n) (same formula as rot_q, times |q|²) maps the
  unrotated vertices and n0 to the vertices and n0 of P (in the same order). -/
def rstarOk (P : Prob) (X : S3) : Bool :=
  let k := P.nb; let ps := P.ps
  let w : Int := (X.tau0.2 : Int) * X.ed
  let x := X.tau0.1 * nth X.n 0 0; let y := X.tau0.1 * nth X.n 1 0; let z := X.tau0.1 * nth X.n 2 0
  let R : List Int := [w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y),
                       2*(x*y + w*z), w*w + y*y - x*x - z*z, 2*(y*z - w*x),
                       2*(x*z - w*y), 2*(y*z + w*x), w*w + z*z - x*x - y*y]
  let Nq := w*w + x*x + y*y + z*z
  let rot (v : List FE) : List FE := (List.range 3).map (fun i =>
    (List.range 3).foldl (fun acc j => fadd acc (fsmul (nth R (3 * i + j) 0) (vecGet v j k))) (fzero k))
  X.bverts.length == P.verts.length &&
  (List.zip X.bverts P.verts).all (fun (x : List FE × List FE) =>
    x.2.map (fsmul (Nq * X.dbv)) == (rot x.1).map (fsmul (P.dv : Int))) &&
  P.n0.map (fsmul (Nq * X.dbn0)) == (rot X.bn0).map (fsmul (P.dn0 : Int)) &&
  decide (0 < X.tau0.2) && decide (0 < X.dbv) && decide (0 < X.dbn0)

/-- S* = C0·s*; ρ₀ is the same in P (the D16 form) and in the tube; the faces of act are in range and distinct. -/
def s3ConstsOk (P : Prob) (X : S3) : Bool :=
  let ps := P.ps
  tubeOk X && octOk P X && rstarOk P X &&
  fmul ps (fsmul (P.sstar.den : Int) P.c0.num) X.sst.num == fsmul ((P.c0.den : Int) * X.sst.den) P.sstar.num &&
  decide (0 < X.sst.den) &&
  P.rho0 == X.rho0 && P.r0 * (X.rho0.2 : Int) == X.rho0.1 * P.rden &&
  X.act.all (fun f => decide (f < P.normals.length)) && X.act.eraseDups.length == X.act.length

end PackLean.D30S3
