import PackLean.D28.Core

/-! Shared parts for re-checking in Lean the arithmetic of the D16 n=2 global-optimality certificates (`verifier/d16d_*`: icoinoct, dodinico, icoincub)
(2026-11-12). Field elements, quadratic forms, sparse polynomials and the lower bounds with √ enclosures are taken unchanged from the D28 Core.

Independently of the Python code (`d16d_far.py`, `d16d_local.py`), the same decisions are rebuilt with integers and elements of Q(√5).
Mathlib is not used. The reasoning (the reduction of Lemma R, the meaning of the box decisions, the meaning of the coverage) is not formalized.

* Far: boxes of the 4 quaternion charts × accept A (per-face multipliers λ_f and vertices v_f, μ; for each vertex w of P = {n_f·x ≤ 1}
  the lower bound of the quadratic form times N is ≥ 0), discard D (for a symmetry pair (g, k) the lower bound of tr(gRk) − tr(R) is > 0), L (|·| ≤ ρ₀ in chart 0).
  Lean builds the polynomials from the box coordinates, vertices, face normals, n0, D0, S̄ and T.
* Local: for each candidate (J, α, M_J⁻¹) Lean builds A = −M_J⁻¹ Rq n0 and F = D0 N² − S* N ΣA + Σ A_j (n_j·Rq v_j);
  F(0) = 0, and on the 6 cube faces with p = ρ(±1, a1, a2), box lower bounds of G = F/ρ and H_j = A_j (A_j/ρ if it vanishes at R*).
* Constants: enclosure of √5, piece (unit edges, centrally symmetric, n0 a supporting plane, the insphere r_in = D0/|n0| lies in the piece), container (centrally symmetric, face offset C0,
  complete vertex list of P), symmetry pairs (orthogonal, preserving faces or vertices, product of dets 1), the T condition, S̄ ≥ S*, the optimal configuration t* fits (upper bound).
-/

namespace PackLean.D16
open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign QF loHi monoLb Quad
  quadKind RBox rboxQ rboxWf rotQ combine nth vecGet split3 ratLe Mono Poly padd psum pmul psmulZ psmulF incAt pmulAff)

/-! ## Vectors of field elements -/

def fdot (ps : List Nat) (nb : Nat) (u v : List FE) : FE :=
  (List.zip u v).foldl (fun acc (x : FE × FE) => fadd acc (fmul ps x.1 x.2)) (fzero nb)

/-- a ≥ 0 -/
def fnn (ps : List Nat) (a : FE) : Bool := decide (fsign ps a ≥ 0)
/-- a > 0 -/
def fpos (ps : List Nat) (a : FE) : Bool := decide (fsign ps a > 0)

def vsub (u v : List FE) : List FE := List.zipWith fsub u v
def vsmul (c : Int) (u : List FE) : List FE := u.map (fsmul c)

def cross (ps : List Nat) (a b : List FE) : List FE :=
  let g (v : List FE) (i : Nat) : FE := nth v i []
  [fsub (fmul ps (g a 1) (g b 2)) (fmul ps (g a 2) (g b 1)),
   fsub (fmul ps (g a 2) (g b 0)) (fmul ps (g a 0) (g b 2)),
   fsub (fmul ps (g a 0) (g b 1)) (fmul ps (g a 1) (g b 0))]

def det3 (ps : List Nat) (M : List (List FE)) : FE :=
  fdot ps (2 ^ ps.length) (nth M 0 []) (cross ps (nth M 1 []) (nth M 2 []))

def matVec (ps : List Nat) (nb : Nat) (K : List (List FE)) (v : List FE) : List FE :=
  K.map (fun row => fdot ps nb row v)

def col (nb : Nat) (K : List (List FE)) (j : Nat) : List FE := K.map (fun row => vecGet row j nb)

/-- All triples (a < b < c) -/
def triples (n : Nat) : List (Nat × Nat × Nat) :=
  (List.range n).foldr (fun a acc =>
    ((List.range n).filter (· > a)).foldr (fun b acc2 =>
      ((List.range n).filter (· > b)).map (fun c => (a, b, c)) ++ acc2) acc) []

/-! ## Problem constants (exported from Python) -/

structure Prob where
  ps : List Nat               -- [5]
  nb : Nat                    -- 2
  sqb : List (Int × Int)      -- integer enclosures of √(maskp[m])·2^120
  maskp : List Nat
  sqk : Nat
  verts : List (List FE)      -- piece vertices (rotated by R*) × dv
  dv : Nat
  n0 : List FE                -- piece face normal (rotated by R*) × dn0
  dn0 : Nat
  d0 : QF                     -- piece face n0·x ≤ D0
  normals : List (List FE)    -- container face normals × dn ({n_f·x ≤ S})
  dn : Nat
  cverts : List (List FE)     -- container vertices (in the representation with edge² = cedge2) × dcv
  dcv : Nat
  c0 : QF                     -- container face offset (s = √cedge2·S/C0)
  cedge2 : Int × Nat
  sstar : QF                  -- S*
  sbar : Int × Nat            -- S̄ (rational, ≥ S*)
  tt : Int × Nat              -- T
  pv : List (List FE)         -- vertices of P = {n_f·x ≤ 1} × dp
  dp : Nat
  gs : List (List (List FE))  -- container symmetries (3×3, × dg)
  dg : Nat
  ks : List (List (List FE))  -- piece symmetries fixing n0 (× dk)
  dk : Nat
  pairs : List (Nat × Nat)    -- indices of pairs (g, k) (same order as PAIRS in Python)
  qlam : Nat                  -- denominator of the multipliers 2^24
  rden : Int                  -- denominator of box coordinates 2^44
  rho0 : Int × Nat            -- half-width ρ₀ of the local box L
  r0 : Int                    -- ρ₀·rden
  tstar : List FE             -- optimal translation t* × dt
  dt : Nat

/-! ## Far region -/

/-- One term of the acceptance multipliers: face f, numerator of λ_f (denominator qlam), vertex v_f. -/
structure Term where
  f : Nat
  lam : Nat
  v : Nat

inductive Tok where
  | split
  | L
  | D (m : Nat)
  | A (mu : Nat) (ts : List Term)

def lbQuad (P : Prob) (G : List FE) : Int :=
  (List.zip (List.range 10) G).foldl (fun acc (mc : Nat × FE) =>
    acc + monoLb (quadKind 0 mc.1) (loHi P.sqb mc.2)) 0

/-- Lower bound for accept A (one vertex w of P). The same polynomial as Python's check_box,
  Σλ_f n_f·Rq v_f + N(μD0 − S̄) + N·T Σλ_f n_f·w + μT (Rq n0)·w, built multiplied by the positive integer K·qlam
  (K = dn·dv·dn0·dp·den(D0)·den(S̄)·den(T)). -/
def farLbW (P : Prob) (Rq : List Quad) (N : Quad) (mu : Nat) (ts : List Term) (w : List FE) : Int :=
  let k := P.nb; let ps := P.ps
  let d0d : Int := P.d0.den
  let sn := P.sbar.1; let sd : Int := P.sbar.2
  let tn := P.tt.1; let td : Int := P.tt.2
  let dn : Int := P.dn; let dv : Int := P.dv; let dn0 : Int := P.dn0; let dp : Int := P.dp
  let a1 := dn0 * dp * d0d * sd * td
  let kD := dn * dv * dn0 * dp * sd * td
  let kS := dn * dv * dn0 * dp * d0d * td
  let kT := dv * dn0 * d0d * sd
  let kU := dn * dv * d0d * sd
  let muI : Int := mu
  let coef (t : Nat) : FE :=
    let i := t / 3; let j := t % 3
    let c1 := ts.foldl (fun acc (tm : Term) =>
      let n := nth P.normals tm.f []; let v := nth P.verts tm.v []
      fadd acc (fsmul ((tm.lam : Int) * a1) (fmul ps (vecGet n i k) (vecGet v j k)))) (fzero k)
    fadd c1 (fsmul (muI * tn * kU) (fmul ps (vecGet w i k) (vecGet P.n0 j k)))
  let nw : FE := ts.foldl (fun acc (tm : Term) =>
    fadd acc (fsmul (tm.lam : Int) (fdot ps k (nth P.normals tm.f []) w))) (fzero k)
  let cN : FE := fadd (fsub (fsmul (muI * kD) P.d0.num) (fofInt k ((P.qlam : Int) * sn * kS))) (fsmul (tn * kT) nw)
  let terms := ((List.range 9).map (fun t => (coef t, nth Rq t []))) ++ [(cN, N)]
  lbQuad P (combine k terms)

/-- Shape of the multipliers: face indices increasing, λ > 0, Σλ = qlam, vertex indices in range. -/
def termsOk (P : Prob) (ts : List Term) : Bool :=
  let nf := P.normals.length; let nv := P.verts.length
  ts.all (fun tm => decide (tm.f < nf) && decide (tm.v < nv) && decide (0 < tm.lam)) &&
  (List.zip ts (ts.drop 1)).all (fun (x : Term × Term) => decide (x.1.f < x.2.f)) &&
  ts.foldl (fun s tm => s + tm.lam) 0 == P.qlam

def acceptOk (P : Prob) (rb : RBox) (mu : Nat) (ts : List Term) : Bool :=
  termsOk P ts &&
  (let (Rq, N) := rotQ (rboxQ P.rden rb)
   P.pv.all (fun w => decide (farLbW P Rq N mu ts w ≥ 0)))

/-- Matrix of pair m, M = (k g)ᵀ (× dg·dk): M_ij = Σ_l k_jl g_li. tr(gRk) = Σ M_ij R_ij. -/
def pairM (P : Prob) (m : Nat) : List FE :=
  let (gi, ki) := nth P.pairs m (0, 0)
  let g := nth P.gs gi []; let kk := nth P.ks ki []
  (List.range 9).map (fun t =>
    let i := t / 3; let j := t % 3
    (List.range 3).foldl (fun acc l =>
      fadd acc (fmul P.ps (vecGet (nth kk j []) l P.nb) (vecGet (nth g l []) i P.nb))) (fzero P.nb))

/-- Discard D: lower bound of Σ (M_ij − δ_ij) Rq_ij (times N·dg·dk). -/
def discLb (P : Prob) (rb : RBox) (m : Nat) : Int :=
  let M := pairM P m
  let (Rq, _) := rotQ (rboxQ P.rden rb)
  let d : Int := (P.dg : Int) * P.dk
  let terms := (List.range 9).map (fun t =>
    (if t % 4 == 0 then fsub (nth M t (fzero P.nb)) (fofInt P.nb d) else nth M t (fzero P.nb), nth Rq t []))
  lbQuad P (combine P.nb terms)

def insideL (P : Prob) (rb : RBox) : Bool :=
  rb.ch == 0 && decide (-P.r0 ≤ rb.l0) && decide (-P.r0 ≤ rb.l1) && decide (-P.r0 ≤ rb.l2) &&
  decide (rb.h0 ≤ P.r0) && decide (rb.h1 ≤ P.r0) && decide (rb.h2 ≤ P.r0)

def leafOk (P : Prob) (rb : RBox) : Tok → Bool
  | .split => false
  | .L => insideL P rb
  | .D m => decide (m < P.pairs.length) && decide (discLb P rb m > 0)
  | .A mu ts => acceptOk P rb mu ts

structure WState where
  stack : List RBox
  ok : Bool
  nA : Nat
  nD : Nat
  nL : Nat

def wstep (P : Prob) (s : WState) (t : Tok) : WState :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    match t with
    | .split =>
      let (c1, c2) := split3 b
      { s with stack := c1 :: c2 :: rest,
               ok := s.ok && rboxWf b && decide (b.h0 - b.l0 > 2 ∨ b.h1 - b.l1 > 2 ∨ b.h2 - b.l2 > 2) }
    | .L => { s with stack := rest, ok := s.ok && rboxWf b && leafOk P b t, nL := s.nL + 1 }
    | .D _ => { s with stack := rest, ok := s.ok && rboxWf b && leafOk P b t, nD := s.nD + 1 }
    | .A .. => { s with stack := rest, ok := s.ok && rboxWf b && leafOk P b t, nA := s.nA + 1 }

def rRoots (den : Int) : List RBox :=
  (List.range 4).map (fun ch => ⟨ch, -den, -den, -den, den, den, den⟩)

/-- Walk the trees of all 4 charts: (closed and every leaf passes, accepted, discarded, L) -/
def farRun (P : Prob) (toks : List Tok) : Bool × Nat × Nat × Nat :=
  let s := toks.foldl (wstep P) ⟨rRoots P.rden, true, 0, 0, 0⟩
  (s.ok && s.stack.isEmpty, s.nA, s.nD, s.nL)

/-! ## Local region -/

/-- Candidate: 3 container faces J active at R*, a vertex α on each face, M_J⁻¹ (× dm; the columns of M_J are n_j). -/
structure Cand where
  J : List Nat
  al : List Nat
  minv : List (List FE)
  dm : Nat

def z3 : Mono := [0, 0, 0]
def pconst (c : FE) : Poly := [(z3, c)]
def pvar (nb : Nat) (i : Nat) : Poly := [(incAt z3 i, fofInt nb 1)]
def pneg (p : Poly) : Poly := psmulZ (-1) p
def psub (p q : Poly) : Poly := padd p (pneg q)

def constTerm (nb : Nat) (p : Poly) : FE :=
  p.foldl (fun acc (x : Mono × FE) => if x.1 == z3 then fadd acc x.2 else acc) (fzero nb)

/-- Rq (9 entries in row order) and N = 1 + x² + y² + z² for q = (1, x, y, z). -/
def rotPoly (ps : List Nat) (nb : Nat) : List Poly × Poly :=
  let w := pconst (fofInt nb 1); let x := pvar nb 0; let y := pvar nb 1; let z := pvar nb 2
  let mul := pmul ps
  let two (a : Poly) : Poly := psmulZ 2 a
  let ww := mul w w; let xx := mul x x; let yy := mul y y; let zz := mul z z
  ([psub (psub (padd ww xx) yy) zz, two (psub (mul x y) (mul w z)), two (padd (mul x z) (mul w y)),
    two (padd (mul x y) (mul w z)), psub (psub (padd ww yy) xx) zz, two (psub (mul y z) (mul w x)),
    two (psub (mul x z) (mul w y)), two (padd (mul y z) (mul w x)), psub (psub (padd ww zz) xx) yy],
   padd (padd ww xx) (padd yy zz))

/-- F of a candidate (times K₂, K₂ = den(D0)·den(S*)·dm·dn0·dn·dv) and A_j (times dm·dn0). -/
def candPolys (P : Prob) (Rq : List Poly) (N : Poly) (c : Cand) : Poly × List Poly :=
  let k := P.nb; let ps := P.ps
  let Un : List Poly := (List.range 3).map (fun r =>
    psum ((List.range 3).map (fun l => psmulF ps (vecGet P.n0 l k) (nth Rq (3 * r + l) []))))
  let AI : List Poly := (List.range 3).map (fun j =>
    psum ((List.range 3).map (fun r => psmulF ps (fneg (vecGet (nth c.minv j []) r k)) (nth Un r []))))
  let BI : List Poly := (List.range 3).map (fun j =>
    let n := nth P.normals (nth c.J j 0) []; let v := nth P.verts (nth c.al j 0) []
    psum ((List.range 9).map (fun t => psmulF ps (fmul ps (vecGet n (t / 3) k) (vecGet v (t % 3) k)) (nth Rq t []))))
  let sA := psum AI
  let ssd : Int := P.sstar.den; let d0d : Int := P.d0.den
  let F := psum [psmulF ps (fsmul (ssd * c.dm * P.dn0 * P.dn * P.dv) P.d0.num) (pmul ps N N),
                 psmulF ps (fsmul (-(d0d * P.dn * P.dv)) P.sstar.num) (pmul ps N sA),
                 psmulZ (d0d * ssd) (psum ((List.range 3).map (fun j => pmul ps (nth AI j []) (nth BI j []))))]
  (F, AI)

/-- Shape of a candidate: J and α in range, M_J·M_J⁻¹ = I (the columns of M_J are n_j). -/
def candOk (P : Prob) (c : Cand) : Bool :=
  let k := P.nb; let ps := P.ps
  c.J.length == 3 && c.al.length == 3 && c.minv.length == 3 && decide (0 < c.dm) &&
  c.J.all (fun f => decide (f < P.normals.length)) && c.al.all (fun v => decide (v < P.verts.length)) &&
  (List.range 9).all (fun t =>
    let r := t / 3; let s := t % 3
    let e := (List.range 3).foldl (fun acc cc =>
      fadd acc (fmul ps (vecGet (nth P.normals (nth c.J cc 0) []) r k) (vecGet (nth c.minv cc []) s k))) (fzero k)
    e == (if r == s then fofInt k ((P.dn : Int) * c.dm) else fzero k))

/-- Substitution on face i = sg (p = ρθ): x^e → ρ^{|e|−drop}·(the other two)^e·sg^{e_i}. Terms with |e| < drop are dropped
  (the caller checks that the dropped terms are 0). -/
def faceSub (i : Nat) (sg : Int) (drop : Nat) (p : Poly) : Poly :=
  psum (p.filterMap (fun (x : Mono × FE) =>
    let m := x.1
    let tot := m.foldl (· + ·) 0
    if tot < drop then none else
    let others := (List.zip (List.range 3) m).filterMap (fun (y : Nat × Nat) => if y.1 == i then none else some y.2)
    some [((tot - drop) :: others, fsmul (sg ^ (nth m i 0)) x.2)]))

/-- Lower bound on [−1,1]³ of D^8·H(centre + W s / D) on the box (ρ, a1, a2) (units of 1/D) (same as to_int_h and shift_h of d16d_local). -/
def shiftLb3 (P : Prob) (D : Int) (H : Poly) (lo hi : List Int) : Option Int :=
  let Cc := List.zipWith (fun l h => (l + h) / 2) lo hi
  let W := List.zipWith (fun l h => (h - l) / 2) lo hi
  if H.any (fun (x : Mono × FE) => decide (x.1.foldl (· + ·) 0 > 8)) then none else
  let S := psum (H.map (fun (x : Mono × FE) =>
    let m := x.1
    let tot := m.foldl (· + ·) 0
    let base : Poly := [(z3, fsmul (D ^ (8 - tot)) x.2)]
    (List.zip (List.range 3) m).foldl (fun acc (y : Nat × Nat) =>
      (List.range y.2).foldl (fun acc2 _ => pmulAff acc2 (nth Cc y.1 0) (nth W y.1 0) y.1) acc) base))
  some (S.foldl (fun acc (x : Mono × FE) =>
    let kind := if x.1.all (· == 0) then 0 else if x.1.all (· % 2 == 0) then 1 else 2
    acc + monoLb kind (loHi P.sqb x.2)) 0)

inductive LTok where
  | split
  | acc (c : Nat)

structure LBox where
  lo : List Int
  hi : List Int

/-- Split rule for local boxes (Python: largest axis with the ρ width multiplied by 16; ties to the smaller index). -/
def lsplit (b : LBox) : LBox × LBox :=
  let w := List.zipWith (fun l h => h - l) b.lo b.hi
  let ws := (List.zip (List.range 3) w).map (fun (x : Nat × Int) => if x.1 == 0 then 16 * x.2 else x.2)
  let mx := ws.foldl max (ws.headD 0)
  let ax := ((List.range 3).find? (fun a => nth ws a 0 == mx)).getD 0
  let mid := (nth b.lo ax 0 + nth b.hi ax 0) / 2
  (⟨b.lo, b.hi.set ax mid⟩, ⟨b.lo.set ax mid, b.hi⟩)

structure LState where
  stack : List LBox
  ok : Bool
  nAcc : Nat

/-- One face, per candidate (G, [(vanishes at R*, H_j)]) -/
abbrev FacePolys := List (Poly × List (Bool × Poly))

def lbPos (P : Prob) (D : Int) (H : Poly) (b : LBox) (strict : Bool) : Bool :=
  match shiftLb3 P D H b.lo b.hi with
  | some v => if strict then decide (v > 0) else decide (v ≥ 0)
  | none => false

def lstep (P : Prob) (D : Int) (Hs : FacePolys) (s : LState) (t : LTok) : LState :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    match t with
    | .split =>
      let (c1, c2) := lsplit b
      { s with stack := c1 :: c2 :: rest,
               ok := s.ok && (List.zipWith (fun l h => decide (h - l > 2)) b.lo b.hi).any id }
    | .acc c =>
      let (G, H) := nth Hs c ([], [])
      let r := lbPos P D G b true && H.all (fun (x : Bool × Poly) => lbPos P D x.2 b (!x.1))
      { s with stack := rest, nAcc := s.nAcc + 1,
               ok := s.ok && decide (c < Hs.length) && b.lo.length == 3 && b.hi.length == 3 &&
                 (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id && r }

/-- The 6 cube faces (in the order of FACES in Python). -/
def faceList : List (Nat × Int) := [(0, 1), (0, -1), (1, 1), (1, -1), (2, 1), (2, -1)]

/-- Whole local region: shape of the candidates, zero-order identity F(0) = 0, trees of the 6 faces. Returns (closed, number accepted). -/
def localOk (P : Prob) (cands : List Cand) (faces : List (List LTok)) : Bool × Nat :=
  let k := P.nb
  let (Rq, N) := rotPoly P.ps k
  let polys := cands.map (candPolys P Rq N)
  let ident := cands.all (candOk P) && polys.all (fun (x : Poly × List Poly) => fIsZero (constTerm k x.1))
  let D := P.rden
  let rhoOk := (P.r0 * (P.rho0.2 : Int) == P.rho0.1 * D) && decide (0 < P.r0)
  let res := (List.zip faceList faces).foldl (fun (acc : Bool × Nat) (x : (Nat × Int) × List LTok) =>
    let ((i, sg), toks) := x
    let Hs : FacePolys := polys.map (fun (y : Poly × List Poly) =>
      (faceSub i sg 1 y.1, y.2.map (fun a =>
        let z := fIsZero (constTerm k a)
        (z, faceSub i sg (if z then 1 else 0) a))))
    let s := toks.foldl (lstep P D Hs) ⟨[⟨[0, -D, -D], [P.r0, D, D]⟩], true, 0⟩
    (acc.1 && s.ok && s.stack.isEmpty, acc.2 + s.nAcc)) (true, 0)
  (ident && rhoOk && faces.length == 6 && res.1, res.2)

/-! ## Checks of the constants (once) -/

def sqbOk (P : Prob) : Bool :=
  P.sqb.length == P.nb && P.maskp.length == P.nb && P.nb == 2 ^ P.ps.length &&
  (List.zip P.sqb P.maskp).all (fun (x : (Int × Int) × Nat) =>
    let (a, b) := x.1; let p : Int := x.2
    if p == 1 then a == 2 ^ P.sqk && b == 2 ^ P.sqk
    else decide (0 ≤ a) && b == a + 1 && decide (a * a ≤ p * 4 ^ P.sqk) && decide (p * 4 ^ P.sqk < b * b))

def d2 (ps : List Nat) (nb : Nat) (u v : List FE) : FE := let t := vsub u v; fdot ps nb t t

/-- Piece: vertices distinct with 3 components, centrally symmetric, minimal edge² is 1, at least 3 vertices with equality in n0·v ≤ D0,
  and every face of the piece (a plane through 3 vertices with all vertices on one side) is at distance ≥ r_in = D0/|n0| from the origin (the insphere lies in the piece). -/
def pieceOk (P : Prob) : Bool :=
  let k := P.nb; let ps := P.ps; let V := P.verts
  let dv : Int := P.dv
  let one := fofInt k (dv * dv)
  -- n0·v ≤ D0: n0I·vI·d0den ≤ d0num·dn0·dv
  let sup (v : List FE) : FE := fsub (fsmul (dv * P.dn0) P.d0.num) (fsmul P.d0.den (fdot ps k P.n0 v))
  let n02 := fdot ps k P.n0 P.n0
  let facetOk (t : Nat × Nat × Nat) : Bool :=
    let (a, b, c) := t
    let va := nth V a []
    let nr := cross ps (vsub (nth V b []) va) (vsub (nth V c []) va)
    let side := V.map (fun v => fsign ps (fdot ps k nr (vsub v va)))
    if fIsZero (nth nr 0 []) && fIsZero (nth nr 1 []) && fIsZero (nth nr 2 []) then true
    else if side.all (· ≤ 0) || side.all (· ≥ 0) then
      -- (nr·va)²·den(D0)²·|n0|² ≥ num(D0)²·dn0²·dv²·|nr|²
      let h := fdot ps k nr va
      let lhs := fmul ps (fmul ps (fmul ps h h) (fofInt k ((P.d0.den : Int) * P.d0.den))) n02
      let rhs := fmul ps (fmul ps (fmul ps P.d0.num P.d0.num) (fofInt k ((P.dn0 : Int) * P.dn0 * dv * dv))) (fdot ps k nr nr)
      fnn ps (fsub lhs rhs)
    else true
  V.all (fun v => v.length == 3) && V.eraseDups.length == V.length && decide (0 < P.d0.den) &&
  V.all (fun v => V.any (fun w => w == vsmul (-1) v)) &&
  V.all (fun v => V.all (fun w => v == w || fnn ps (fsub (d2 ps k v w) one))) &&
  V.any (fun v => V.any (fun w => d2 ps k v w == one)) &&
  V.all (fun v => fnn ps (sup v)) && decide ((V.filter (fun v => fIsZero (sup v))).length ≥ 3) &&
  (triples V.length).all facetOk

/-- Container: normals centrally symmetric and spanning R³, the vertex list pv of P = {n_f·x ≤ 1} is complete (every intersection of 3 faces lying in P
  is in pv, and every point of pv lies in P), container vertices = C0·pv (same number), minimal edge² = cedge2. -/
def containerOk (P : Prob) : Bool :=
  let k := P.nb; let ps := P.ps; let Nr := P.normals
  let dn : Int := P.dn; let dp : Int := P.dp
  let inP (w : List FE) : Bool := Nr.all (fun n => fnn ps (fsub (fofInt k (dn * dp)) (fdot ps k n w)))
  let vtxOk (t : Nat × Nat × Nat) : Bool :=
    let (a, b, c) := t
    let M := [nth Nr a [], nth Nr b [], nth Nr c []]
    let det := det3 ps M
    if fIsZero det then true else
    -- x = adj(M)·(dn,dn,dn)/det: the columns of adj are cross products of rows
    let c0 := cross ps (nth M 1 []) (nth M 2 []); let c1 := cross ps (nth M 2 []) (nth M 0 []); let c2 := cross ps (nth M 0 []) (nth M 1 [])
    let y := (List.range 3).map (fun i => fsmul dn (fadd (fadd (nth c0 i []) (nth c1 i [])) (nth c2 i [])))
    let feas := Nr.all (fun n => fnn ps (fsub (fsmul dn (fmul ps det det)) (fmul ps (fdot ps k n y) det)))
    if feas then P.pv.any (fun w => w.map (fmul ps det) == y.map (fsmul dp)) else true
  let spans := (triples Nr.length).any (fun (t : Nat × Nat × Nat) =>
    let (a, b, c) := t; !fIsZero (det3 ps [nth Nr a [], nth Nr b [], nth Nr c []]))
  let c0den : Int := P.c0.den; let dcv : Int := P.dcv
  let CV := P.cverts
  let e2 := fofInt k (P.cedge2.1 * dcv * dcv)
  let cvd := fofInt k ((P.cedge2.2 : Int))
  Nr.all (fun n => n.length == 3 && Nr.any (fun m => m == vsmul (-1) n)) && spans &&
  P.pv.all inP && P.pv.eraseDups.length == P.pv.length && (triples Nr.length).all vtxOk &&
  CV.length == P.pv.length && CV.eraseDups.length == CV.length &&
  CV.all (fun cv => P.pv.any (fun w =>
    cv.map (fsmul (c0den * dp)) == w.map (fun x => fsmul dcv (fmul ps P.c0.num x)))) &&
  CV.all (fun v => CV.all (fun w => v == w || fnn ps (fsub (fmul ps (d2 ps k v w) cvd) e2))) &&
  CV.any (fun v => CV.any (fun w => fmul ps (d2 ps k v w) cvd == e2)) && decide (0 < P.cedge2.2)

def orthOk (ps : List Nat) (nb : Nat) (d : Int) (K : List (List FE)) : Bool :=
  K.length == 3 && K.all (fun r => r.length == 3) &&
  (List.range 9).all (fun t =>
    let i := t / 3; let j := t % 3
    fdot ps nb (col nb K i) (col nb K j) == (if i == j then fofInt nb (d * d) else fzero nb))

/-- Symmetry pairs: g orthogonal preserving the set of container normals, k orthogonal preserving the set of piece vertices and fixing n0, det g·det k = 1. -/
def groupOk (P : Prob) : Bool :=
  let k := P.nb; let ps := P.ps
  let dg : Int := P.dg; let dk : Int := P.dk
  P.gs.all (fun g => orthOk ps k dg g &&
    P.normals.all (fun n => P.normals.any (fun m => matVec ps k g n == vsmul dg m))) &&
  P.ks.all (fun kk => orthOk ps k dk kk &&
    P.verts.all (fun v => P.verts.any (fun w => matVec ps k kk v == vsmul dk w)) &&
    matVec ps k kk P.n0 == vsmul dk P.n0) &&
  P.pairs.all (fun (x : Nat × Nat) =>
    decide (x.1 < P.gs.length) && decide (x.2 < P.ks.length) &&
    fmul ps (det3 ps (nth P.gs x.1 [])) (det3 ps (nth P.ks x.2 [])) == fofInt k (dg * dg * dg * dk * dk * dk))

/-- S̄ ≥ S*, T > 0, and for each face S̄ − T ≤ 0 or (S̄ − T)² ≤ r_in²|n_f|² (r_in² = D0²/|n0|²). -/
def boundsOk (P : Prob) : Bool :=
  let k := P.nb; let ps := P.ps
  let sn := P.sbar.1; let sd : Int := P.sbar.2
  let tn := P.tt.1; let td : Int := P.tt.2
  -- S̄ − S* ≥ 0: sn·ssden − ssnum·sd
  let sbarOk := fnn ps (fsub (fofInt k (sn * P.sstar.den)) (fsmul sd P.sstar.num))
  -- a = S̄ − T = (sn·td − tn·sd)/(sd·td)
  let an := sn * td - tn * sd; let ad := sd * td
  let n02 := fdot ps k P.n0 P.n0
  let tOk := P.normals.all (fun n =>
    decide (an ≤ 0) ||
    -- a²·|n0|²·d0den²·dn² ≤ d0num²·dn0²·|nI|²·ad²
    fnn ps (fsub (fmul ps (fmul ps (fmul ps P.d0.num P.d0.num) (fofInt k ((P.dn0 : Int) * P.dn0 * ad * ad))) (fdot ps k n n))
                 (fmul ps n02 (fofInt k (an * an * P.d0.den * P.d0.den * P.dn * P.dn)))))
  decide (0 < sd) && decide (0 < td) && decide (0 < tn) && sbarOk && tOk && decide (0 < P.sstar.den)

/-- Upper bound: K' (the piece rotated by R* placed at t*) and −K' lie in the container {n_f·x ≤ S*} and are separated by the plane n0·x = 0 (φ(I) ≤ S*). -/
def upperOk (P : Prob) : Bool :=
  let k := P.nb; let ps := P.ps
  let dv : Int := P.dv; let dt : Int := P.dt
  let pts := P.verts.map (fun v => List.zipWith fadd (vsmul dt v) (vsmul dv P.tstar))   -- × dv·dt
  -- n·p ≤ S*: ssnum·dn·dv·dt − ssden·nI·pI ≥ 0
  let inC (p : List FE) : Bool := P.normals.all (fun n =>
    fnn ps (fsub (fsmul ((P.dn : Int) * dv * dt) P.sstar.num) (fsmul P.sstar.den (fdot ps k n p))))
  P.tstar.length == 3 && pts.all inC && pts.all (fun p => inC (vsmul (-1) p)) &&
  pts.all (fun p => decide (fsign ps (fdot ps k P.n0 p) ≤ 0))

def constsOk (P : Prob) : Bool :=
  sqbOk P && pieceOk P && containerOk P && groupOk P && boundsOk P && upperOk P &&
  decide (0 < P.dv) && decide (0 < P.dn) && decide (0 < P.dn0) && decide (0 < P.dp) && decide (0 < P.dg) &&
  decide (0 < P.dk) && decide (0 < P.dt) && decide (0 < P.dcv) && decide (0 < P.rden) &&
  (P.r0 * (P.rho0.2 : Int) == P.rho0.1 * P.rden)

end PackLean.D16
