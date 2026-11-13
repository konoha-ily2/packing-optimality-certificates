/-! Shared parts for re-checking in Lean the **arithmetic** of the D31 certificate (octintet_n02: the smallest edge of a regular
tetrahedron holding 2 unit-edge regular octahedra is s* = 3) (2026-11-13, Q57).

The same decisions as the Python code (`verifier/d31_common.py`, `d31_far.py`, `d31_local.py`), rewritten independently with integers only.
In D31 all data of the g form are rational, so the field elements Q(√p) of D28/D16 are not used. No Mathlib either (only Bool checks are evaluated).
The reasoning (the reduction T1-T4 of D28 §2, that the formula for g represents the problem, the meaning of the box decisions, the meaning of the cover) is not formalized.

* Far part: on (box of n = (1−h, 1−h−k′, 1)) × (R box, 4 quaternion charts),
  accept A: lower bound of 2·ND·DEN²·|q|²·G_c of a candidate c (component and sign for each of n, b0, b1, b3) ≥ 0 (minimum over the 4 corners of the n box).
  discard D: lower bound of tr(Rk) − tr(R) > 0 for a piece rotation k. L: (n box, R box) lies in the range of local J or C.
  Lean builds the polynomials from the definition of g (G_c = h/2 + (s_n(Rᵀn)_i − 1) + (1−h/2)(s₀(Rᵀb₀)_j − 1) + (k′/2)(…) + ((k′+h)/2)(…)).
  The R trees and the n tree come as preorder sequences of "split / leaf", and Lean makes the boxes with the same split rule as Python.
* Local part (J band, circle tube C): Lean makes 2|q|²G_c as a polynomial in (h, k′, u, p1, p2) from q = (1, u+p1, u+p2, u−p1−p2),
  checks the part T at ζ = 0 (of the form k′u(e₀ + e₁u) for J, 0 for C), puts ζ = scale·r·ζ̂ face by face in the rest and divides by r,
  and checks lower bound > 0 in each box (for J also the sign of E) (the same rules as d31_local.py).
* The region constants (R_J, U_J, K_J, R_C, U_1, U_C_MAX) are in one place, `Prm`, and both the far L test and the local root boxes read them from there.
-/

namespace PackLean.D31

def nth (l : List α) (i : Nat) (d : α) : α := l.getD i d

def iabs (x : Int) : Int := (x.natAbs : Int)

/-- a rational (numerator, denominator) -/
abbrev RatI := Int × Nat

/-- constants of the problem (exported from Python) -/
structure Prm where
  nd : Int                  -- denominator of n-box coordinates (2^30)
  den : Int                 -- denominator of R-box coordinates (2^30)
  du : Int                  -- denominator of local-box coordinates (2^30)
  rJ : RatI
  uJ : RatI
  kJ : RatI
  rC : RatI
  u1 : RatI
  uC : RatI
  rots : List (List (List Int))   -- piece rotations (identity excluded, same order as ROT_NONID in Python)

/-- container normals b_f (D28 2.4, d31_common.BS) -/
def bvec : List (List Int) := [[-1, -1, -1], [-1, 1, 1], [1, -1, 1], [1, 1, -1]]

/-! ## Far part: quadratic forms on an R box (s ∈ [−1,1]³) -/

/-- affine form c + w₁s₁ + w₂s₂ + w₃s₃ -/
structure Aff where
  c : Int
  w1 : Int
  w2 : Int
  w3 : Int

/-- coefficients of a quadratic form [1, s1, s2, s3, s1², s2², s3², s1s2, s1s3, s2s3] (same order as d31_common) -/
abbrev Quad := List Int

def affMul (a b : Aff) : Quad :=
  [a.c * b.c, a.c * b.w1 + a.w1 * b.c, a.c * b.w2 + a.w2 * b.c, a.c * b.w3 + a.w3 * b.c,
   a.w1 * b.w1, a.w2 * b.w2, a.w3 * b.w3,
   a.w1 * b.w2 + a.w2 * b.w1, a.w1 * b.w3 + a.w3 * b.w1, a.w2 * b.w3 + a.w3 * b.w2]

def qadd (a b : Quad) : Quad := List.zipWith (· + ·) a b
def qsub (a b : Quad) : Quad := List.zipWith (· - ·) a b
def qsmul (c : Int) (a : Quad) : Quad := a.map (fun x => c * x)
def qzero : Quad := List.replicate 10 0

/-- lower bound on [−1,1]³: constant + min(0, c) of the square terms − |c| of the odd terms. −1 (fail) if the shape is wrong. -/
def quadLb (v : Quad) : Int :=
  match v with
  | [c, a1, a2, a3, s1, s2, s3, x12, x13, x23] =>
    c + min 0 s1 + min 0 s2 + min 0 s3 - iabs a1 - iabs a2 - iabs a3 - iabs x12 - iabs x13 - iabs x23
  | _ => -1

/-- R box: chart ch, coordinates lo, hi (DEN units). -/
structure RBox where
  ch : Nat
  l0 : Int
  l1 : Int
  l2 : Int
  h0 : Int
  h1 : Int
  h2 : Int

/-- the 4 quaternion components (DEN inserted at chart ch) as affine forms. -/
def rboxQ (den : Int) (b : RBox) : List Aff :=
  let u0 : Aff := ⟨(b.l0 + b.h0) / 2, (b.h0 - b.l0) / 2, 0, 0⟩
  let u1 : Aff := ⟨(b.l1 + b.h1) / 2, 0, (b.h1 - b.l1) / 2, 0⟩
  let u2 : Aff := ⟨(b.l2 + b.h2) / 2, 0, 0, (b.h2 - b.l2) / 2⟩
  let d : Aff := ⟨den, 0, 0, 0⟩
  match b.ch with
  | 0 => [d, u0, u1, u2]
  | 1 => [u0, d, u1, u2]
  | 2 => [u0, u1, d, u2]
  | _ => [u0, u1, u2, d]

/-- box widths are positive even numbers and the chart index is 0..3. -/
def rboxWf (b : RBox) : Bool :=
  decide (b.l0 < b.h0) && decide (b.l1 < b.h1) && decide (b.l2 < b.h2) &&
  (b.h0 - b.l0) % 2 == 0 && (b.h1 - b.l1) % 2 == 0 && (b.h2 - b.l2) % 2 == 0 && decide (b.ch < 4)

/-- M(q) (9 entries, row order, the rotation times |q|²) and |q|². M = [[ww+xx−yy−zz, 2(xy−wz), 2(xz+wy)], …]. -/
def rotQ (q : List Aff) : List Quad × Quad :=
  match q with
  | [w, x, y, z] =>
    let ww := affMul w w; let xx := affMul x x; let yy := affMul y y; let zz := affMul z z
    let xy := affMul x y; let wz := affMul w z; let xz := affMul x z; let wy := affMul w y
    let yz := affMul y z; let wx := affMul w x
    ([qsub (qsub (qadd ww xx) yy) zz, qsmul 2 (qsub xy wz), qsmul 2 (qadd xz wy),
      qsmul 2 (qadd xy wz), qsub (qsub (qadd ww yy) xx) zz, qsmul 2 (qsub yz wx),
      qsmul 2 (qsub xz wy), qsmul 2 (qadd yz wx), qsub (qsub (qadd ww zz) xx) yy],
     qadd (qadd ww xx) (qadd yy zz))
  | _ => ([], [])

/-! ## Far part: candidates and acceptance A -/

/-- candidate: (component, sign) for each of n, b0, b1, b3 -/
structure Cand where
  i : Nat
  sn : Int
  j : Nat
  s0 : Int
  j1 : Nat
  s1 : Int
  j3 : Nat
  s3 : Int

/-- the exported digit d = 2·component + (1 if the sign is −) as (component, sign). -/
def decPair (d : Nat) : Nat × Int := (d / 2, if d % 2 == 0 then 1 else -1)

/-- candidate code (4 base-6 digits, from the top digit: n, b0, b1, b3). -/
def decCand (code : Nat) : Cand :=
  let a := decPair (code / 216 % 6); let b := decPair (code / 36 % 6)
  let c := decPair (code / 6 % 6); let d := decPair (code % 6)
  ⟨a.1, a.2, b.1, b.2, c.1, c.2, d.1, d.2⟩

/-- At a corner (hv, k′v) of the n box (ND units), the lower bound on the R box of 2·ND·|q|²·G_c (times DEN²) for candidate c.
  2·ND·|q|²·G_c = Σ_l M_{l,i}·s_n·2ND·n_l + Σ_{f=0,1,3} W_f·s_f·Σ_l b_{f,l} M_{l,j_f} + |q|²·(hv − 4ND − 2k′v),
  2ND·n = (2ND − 2hv, 2ND − 2hv − 2k′v, 2ND), W_0 = 2ND − hv (= 2ND(1 − h/2)), W_1 = k′v, W_3 = k′v + hv. -/
def farLbAt (nd : Int) (M : List Quad) (Q : Quad) (c : Cand) (hv kv : Int) : Int :=
  let Mget (l i : Nat) : Quad := nth M (3 * l + i) qzero
  let n2 : List Int := [2 * nd - 2 * hv, 2 * nd - 2 * hv - 2 * kv, 2 * nd]
  let tN := (List.range 3).foldl (fun acc l => qadd acc (qsmul (c.sn * nth n2 l 0) (Mget l c.i))) qzero
  let tB (f jj : Nat) (s W : Int) : Quad :=
    (List.range 3).foldl (fun acc l => qadd acc (qsmul (W * s * nth (nth bvec f []) l 0) (Mget l jj))) qzero
  let tot := qadd (qadd tN (tB 0 c.j c.s0 (2 * nd - hv)))
               (qadd (qadd (tB 1 c.j1 c.s1 kv) (tB 3 c.j3 c.s3 (kv + hv))) (qsmul (hv - 4 * nd - 2 * kv) Q))
  quadLb tot

/-- n box [l0,h0]×[l1,h1] ((h, k′), ND units) -/
structure NBox where
  l0 : Int
  l1 : Int
  h0 : Int
  h1 : Int

/-- lower bound for acceptance A: minimum over the 4 corners of the n box (G_c is affine in (h, k′)). -/
def farLb (P : Prm) (nb : NBox) (rb : RBox) (c : Cand) : Int :=
  let MQ := rotQ (rboxQ P.den rb)
  let f := farLbAt P.nd MQ.1 MQ.2 c
  min (min (f nb.l0 nb.l1) (f nb.l0 nb.h1)) (min (f nb.h0 nb.l1) (f nb.h0 nb.h1))

/-- discard D: lower bound of tr(Rk) − tr(R) (times |q|²·DEN²). (Rk)_ii = Σ_j R_ij k_ji. -/
def discLb (P : Prm) (rb : RBox) (K : List (List Int)) : Int :=
  let M := (rotQ (rboxQ P.den rb)).1
  quadLb ((List.range 9).foldl (fun acc ij =>
    let i := ij / 3; let j := ij % 3
    let kji := nth (nth K j []) i 0
    qadd acc (qsmul (kji - (if i == j then 1 else 0)) (nth M ij qzero))) qzero)

/-! ## Far part: the local range L (same constants as the local lemmas) -/

/-- x ≤ (num/den)·S in integers: x·den ≤ num·S -/
def leR (x : Int) (r : RatI) (S : Int) : Bool := decide (x * (r.2 : Int) ≤ r.1 * S)
/-- (num/den)·S ≤ x -/
def geR (x : Int) (r : RatI) (S : Int) : Bool := decide (r.1 * S ≤ x * (r.2 : Int))

def nInJ (P : Prm) (nb : NBox) : Bool := leR nb.h0 P.rJ P.nd && leR nb.h1 P.kJ P.nd
def nInC (P : Prm) (nb : NBox) : Bool := leR nb.h0 P.rC P.nd && leR nb.h1 P.rC P.nd

def rVerts (b : RBox) : List (Int × Int × Int) :=
  [b.l0, b.h0].foldr (fun a acc => [b.l1, b.h1].foldr (fun bb acc2 => [b.l2, b.h2].foldr (fun c acc3 => (a, bb, c) :: acc3) acc2) acc) []

/-- the 8 vertices of an R box of chart 0 lie in the R range of J {|u| ≤ U_J, |p1|, |p2| ≤ R_J}
  (q = (1, a, b, c), u = (a+b+c)/3, p1 = a − u, p2 = b − u). -/
def rInJ (P : Prm) (b : RBox) : Bool :=
  b.ch == 0 && (rVerts b).all (fun v =>
    let (a, bb, c) := v
    leR (iabs (a + bb + c)) P.uJ (3 * P.den) && leR (iabs (2 * a - bb - c)) P.rJ (3 * P.den) &&
    leR (iabs (2 * bb - a - c)) P.rJ (3 * P.den))

/-- the 8 vertices lie in one side of the R range of C {U_1 ≤ ±u ≤ U_C_MAX, |p1|, |p2| ≤ R_C}. -/
def rInC (P : Prm) (b : RBox) : Bool :=
  b.ch == 0 && [1, -1].any (fun (sg : Int) => (rVerts b).all (fun v =>
    let (a, bb, c) := v
    geR (sg * (a + bb + c)) P.u1 (3 * P.den) && leR (sg * (a + bb + c)) P.uC (3 * P.den) &&
    leR (iabs (2 * a - bb - c)) P.rC (3 * P.den) && leR (iabs (2 * bb - a - c)) P.rC (3 * P.den)))

/-! ## Far part: R trees -/

/-- preorder sequence of an R tree: split / L (J, C) / discard (rotation index) / accept (candidate code). -/
inductive Tok where
  | split
  | LJ
  | LC
  | D (m : Nat)
  | A (code : Nat)

/-- split3: halve the widest axis (the smaller index on ties) (d31_far.split3). -/
def split3 (b : RBox) : RBox × RBox :=
  let w0 := b.h0 - b.l0; let w1 := b.h1 - b.l1; let w2 := b.h2 - b.l2
  if w0 ≥ w1 && w0 ≥ w2 then
    let m := (b.l0 + b.h0) / 2
    ({ b with h0 := m }, { b with l0 := m })
  else if w1 ≥ w2 then
    let m := (b.l1 + b.h1) / 2
    ({ b with h1 := m }, { b with l1 := m })
  else
    let m := (b.l2 + b.h2) / 2
    ({ b with h2 := m }, { b with l2 := m })

def leafOk (P : Prm) (nb : NBox) (rb : RBox) : Tok → Bool
  | .split => false
  | .LJ => nInJ P nb && rInJ P rb
  | .LC => nInC P nb && rInC P rb
  | .D m => decide (m < P.rots.length) && decide (discLb P rb (nth P.rots m []) > 0)
  | .A code => decide (code < 1296) && decide (farLb P nb rb (decCand code) ≥ 0)

structure WState where
  stack : List RBox
  ok : Bool
  nA : Nat
  nD : Nat
  nL : Nat

def wstep (P : Prm) (nb : NBox) (s : WState) (t : Tok) : WState :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    match t with
    | .split =>
      let cc := split3 b
      { s with stack := cc.1 :: cc.2 :: rest, ok := s.ok && rboxWf b }
    | .LJ => { s with stack := rest, ok := s.ok && rboxWf b && leafOk P nb b t, nL := s.nL + 1 }
    | .LC => { s with stack := rest, ok := s.ok && rboxWf b && leafOk P nb b t, nL := s.nL + 1 }
    | .D _ => { s with stack := rest, ok := s.ok && rboxWf b && leafOk P nb b t, nD := s.nD + 1 }
    | .A _ => { s with stack := rest, ok := s.ok && rboxWf b && leafOk P nb b t, nA := s.nA + 1 }

def rRoots (den : Int) : List RBox :=
  (List.range 4).map (fun ch => ⟨ch, -den, -den, -den, den, den, den⟩)

def nboxWf (b : NBox) : Bool := decide (b.l0 < b.h0) && decide (b.l1 < b.h1)

/-- walk the whole R tree (4 charts) of one n box: (pass, accepted, discarded, L). -/
def nbRun (P : Prm) (nb : NBox) (toks : List Tok) : Bool × Nat × Nat × Nat :=
  let s := toks.foldl (wstep P nb) ⟨rRoots P.den, nboxWf nb, 0, 0, 0⟩
  (s.ok && s.stack.isEmpty, s.nA, s.nD, s.nL)

/-! ## Far part: the n tree (D_n = {h ∈ [0,1], k′ ∈ [0,2], 2h + k′ ≤ 2}, root [0,1]×[0,2]) -/

inductive NTok where
  | split
  | out
  | ok

/-- split2: halve the wider axis (h on ties) (d31_far.split2). -/
def split2 (b : NBox) : NBox × NBox :=
  let w0 := b.h0 - b.l0; let w1 := b.h1 - b.l1
  if w0 ≥ w1 then let m := (b.l0 + b.h0) / 2; ({ b with h0 := m }, { b with l0 := m })
  else let m := (b.l1 + b.h1) / 2; ({ b with h1 := m }, { b with l1 := m })

structure NState where
  stack : List NBox
  boxes : List (Int × Int × Int × Int)   -- ok boxes not yet matched (in sequence order)
  ok : Bool
  nOk : Nat
  nOut : Nat

def nstep (nd : Int) (s : NState) (t : NTok) : NState :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    match t with
    | .split =>
      let cc := split2 b
      { s with stack := cc.1 :: cc.2 :: rest, ok := s.ok && decide (b.h0 - b.l0 ≥ 2 ∨ b.h1 - b.l1 ≥ 2) }
    | .out => { s with stack := rest, ok := s.ok && decide (2 * b.l0 + b.l1 ≥ 2 * nd), nOut := s.nOut + 1 }
    | .ok =>
      match s.boxes with
      | [] => { s with ok := false }
      | (a0, a1, a2, a3) :: bs =>
        { s with stack := rest, boxes := bs, nOk := s.nOk + 1,
                 ok := s.ok && a0 == b.l0 && a1 == b.l1 && a2 == b.h0 && a3 == b.h1 }

/-- the n tree closes and the ok leaves match the box table in order: (pass, number of ok, number of out). -/
def ntreeRun (nd : Int) (toks : List NTok) (boxes : List (Int × Int × Int × Int)) : Bool × Nat × Nat :=
  let s := toks.foldl (nstep nd) ⟨[⟨0, 0, nd, 2 * nd⟩], boxes, true, 0, 0⟩
  (s.ok && s.stack.isEmpty && s.boxes.isEmpty, s.nOk, s.nOut)

/-! ## Checks of the constants -/

/-- every rotation is a signed permutation matrix (exactly one ±1 in each row and column) with det = 1, not the identity, pairwise distinct.
  The arithmetic part of: for the octahedral piece (vertices ±e_i), N(w) = ‖Rᵀw‖∞ is unchanged by R → Rk (g(n, Rk) = g(n, R)). -/
def rotsOk (P : Prm) : Bool :=
  let isSP (K : List (List Int)) : Bool :=
    K.length == 3 && K.all (fun row => row.length == 3 && row.all (fun x => x == 0 || x == 1 || x == -1) &&
      (row.filter (· != 0)).length == 1) &&
    (List.range 3).all (fun j => ((K.map (fun row => nth row j 0)).filter (· != 0)).length == 1)
  let g (K : List (List Int)) (i j : Nat) : Int := nth (nth K i []) j 0
  let det (K : List (List Int)) : Int :=
    g K 0 0 * (g K 1 1 * g K 2 2 - g K 1 2 * g K 2 1) - g K 0 1 * (g K 1 0 * g K 2 2 - g K 1 2 * g K 2 0) +
    g K 0 2 * (g K 1 0 * g K 2 1 - g K 1 1 * g K 2 0)
  P.rots.all (fun K => isSP K && det K == 1 && K != [[1, 0, 0], [0, 1, 0], [0, 0, 1]]) &&
  P.rots.eraseDups.length == P.rots.length

def posR (r : RatI) : Bool := decide (0 < r.1) && decide (0 < r.2)

/-- form of the constants: positive denominators, positive region constants, U_1 < U_C_MAX. -/
def prmOk (P : Prm) : Bool :=
  decide (0 < P.nd) && decide (0 < P.den) && decide (0 < P.du) &&
  posR P.rJ && posR P.uJ && posR P.kJ && posR P.rC && posR P.u1 && posR P.uC &&
  decide (P.u1.1 * (P.uC.2 : Int) < P.uC.1 * (P.u1.2 : Int))

/-! ## Local part: sparse polynomials (5 variables, integer coefficients) -/

abbrev Mono := List Nat
abbrev Poly := List (Mono × Int)

def zeroMono : Mono := [0, 0, 0, 0, 0]

def monoLt : Mono → Mono → Bool
  | [], [] => false
  | a :: as, b :: bs => if a == b then monoLt as bs else decide (a < b)
  | _, _ => false

/-- sum of polynomials sorted by increasing monomial (zero coefficients dropped; structural recursion with fuel). -/
def paddF : Nat → Poly → Poly → Poly
  | 0, p, q => p ++ q
  | _ + 1, [], q => q
  | _ + 1, p, [] => p
  | f + 1, (m, a) :: ps, (n, b) :: qs =>
    if m == n then (if a + b == 0 then paddF f ps qs else (m, a + b) :: paddF f ps qs)
    else if monoLt m n then (m, a) :: paddF f ps ((n, b) :: qs)
    else (n, b) :: paddF f ((m, a) :: ps) qs

def padd (p q : Poly) : Poly := paddF (p.length + q.length) p q
def psmul (c : Int) (p : Poly) : Poly := if c == 0 then [] else p.map (fun x => (x.1, c * x.2))
def psub (p q : Poly) : Poly := padd p (psmul (-1) q)
def psum (l : List Poly) : Poly := l.foldl padd []

def incAt : Mono → Nat → Mono
  | [], _ => []
  | a :: as, 0 => (a + 1) :: as
  | a :: as, i + 1 => a :: incAt as i

def pconst (c : Int) : Poly := if c == 0 then [] else [(zeroMono, c)]
def pvar (i : Nat) : Poly := [(incAt zeroMono i, 1)]

def pmul (p q : Poly) : Poly :=
  psum (p.map (fun x => psum (q.map (fun y => [(List.zipWith (· + ·) x.1 y.1, x.2 * y.2)]))))

/-- p·(c + w·s_i) -/
def pmulAff (p : Poly) (c w : Int) (i : Nat) : Poly :=
  padd (psmul c p) (psmul w (p.map (fun x => (incAt x.1 i, x.2))))

def mdeg (m : Mono) : Nat := m.foldl (· + ·) 0

/-! ## Local part: 2|q|²G_c as a polynomial in (h, k′, u, p1, p2) (variable indices 0..4) -/

/-- q = (1, u+p1, u+p2, u−p1−p2) -/
def qJ : List Poly := [pconst 1, padd (pvar 2) (pvar 3), padd (pvar 2) (pvar 4), psub (pvar 2) (padd (pvar 3) (pvar 4))]

/-- M(q) (9 entries, row order) and |q|² (as polynomials). -/
def rotP (q : List Poly) : List Poly × Poly :=
  match q with
  | [w, x, y, z] =>
    let ww := pmul w w; let xx := pmul x x; let yy := pmul y y; let zz := pmul z z
    let xy := pmul x y; let wz := pmul w z; let xz := pmul x z; let wy := pmul w y
    let yz := pmul y z; let wx := pmul w x
    ([psub (psub (padd ww xx) yy) zz, psmul 2 (psub xy wz), psmul 2 (padd xz wy),
      psmul 2 (padd xy wz), psub (psub (padd ww yy) xx) zz, psmul 2 (psub yz wx),
      psmul 2 (psub xz wy), psmul 2 (padd yz wx), psub (psub (padd ww zz) xx) yy],
     padd (padd ww xx) (padd yy zz))
  | _ => ([], [])

/-- signs at I (SIG_N, SIG0, SIG1, SIG3 of d31_common) -/
def sigN : List Int := [1, 1, 1]
def sig0 : List Int := [-1, -1, -1]
def sig1 : List Int := [-1, 1, 1]
def sig3 : List Int := [1, 1, -1]

/-- code 27i + 9j + 3j1 + j3 of a local candidate (i, j, j1, j3) -/
def lcand (code : Nat) : Nat × Nat × Nat × Nat := (code / 27 % 3, code / 9 % 3, code / 3 % 3, code % 3)

/-- 2|q|²G_c: h·Q + 2(s_n(Mᵀn)_i − Q) + (2−h)(s₀(Mᵀb₀)_j − Q) + k′(s₁(Mᵀb₁)_{j1} − Q) + (k′+h)(s₃(Mᵀb₃)_{j3} − Q),
  n = (1−h, 1−h−k′, 1). -/
def twoPc (M : List Poly) (Q : Poly) (code : Nat) : Poly :=
  let c := lcand code
  let i := c.1; let j := c.2.1; let j1 := c.2.2.1; let j3 := c.2.2.2
  let h := pvar 0; let k := pvar 1; let one := pconst 1
  let n : List Poly := [psub one h, psub (psub one h) k, one]
  let col (w : List Poly) (ii : Nat) : Poly :=
    psum ((List.range 3).map (fun l => pmul (nth w l []) (nth M (3 * l + ii) [])))
  let colB (f ii : Nat) : Poly :=
    psum ((List.range 3).map (fun l => psmul (nth (nth bvec f []) l 0) (nth M (3 * l + ii) [])))
  psum [pmul h Q,
        psmul 2 (psub (psmul (nth sigN i 0) (col n i)) Q),
        pmul (psub (pconst 2) h) (psub (psmul (nth sig0 j 0) (colB 0 j)) Q),
        pmul k (psub (psmul (nth sig1 j1 0) (colB 1 j1)) Q),
        pmul (padd k h) (psub (psmul (nth sig3 j3 0) (colB 3 j3)) Q)]

/-- kind of region -/
inductive Kind where
  | J
  | C

/-- variables of ζ (J: h, p1, p2. C: h, k′, p1, p2) -/
def zetaIdx : Kind → List Nat
  | .J => [0, 3, 4]
  | .C => [0, 1, 3, 4]

/-- base variables (J: k′, u. C: u) -/
def baseIdx : Kind → List Nat
  | .J => [1, 2]
  | .C => [2]

/-- lower ends of ζ̂ (J: (0, −1, −1), C: (0, 0, −1, −1)) -/
def zlo : Kind → List Int
  | .J => [0, -1, -1]
  | .C => [0, 0, -1, -1]

/-- candidate families (J: S_E, the 54 with i ≠ 2 (1-based). C: the 81 of S_C) -/
def family : Kind → List Nat
  | .J => (List.range 81).filter (fun c => (lcand c).1 != 1)
  | .C => List.range 81

def zdeg (kd : Kind) (m : Mono) : Nat := (zetaIdx kd).foldl (fun acc i => acc + nth m i 0) 0

/-- whether T of J (the part at ζ = 0) has the form k′u·e₀ + k′u²·e₁; if so (e₀, e₁). For C, T = 0 is required, giving (0, 0). -/
def tShape (kd : Kind) (T : Poly) : Option (Int × Int) :=
  match kd with
  | .J =>
    if T.all (fun x => x.1 == [0, 1, 1, 0, 0] || x.1 == [0, 1, 2, 0, 0]) then
      some (T.foldl (fun acc x => if x.1 == [0, 1, 1, 0, 0] then (acc.1 + x.2, acc.2) else (acc.1, acc.2 + x.2)) (0, 0))
    else none
  | .C => if T.isEmpty then some (0, 0) else none

/-- list of faces (faces in Python: +1 for each index of ζ, and −1 too if the lower end is −1) -/
def faceList (kd : Kind) : List (Nat × Int) :=
  (List.range (zlo kd).length).foldr (fun i acc =>
    (i, 1) :: (if nth (zlo kd) i 0 < 0 then [(i, -1)] else []) ++ acc) []

/-- change of coordinates for face (fi, fv): a monomial h^… of D (the part of degree ≥ 1 in ζ) becomes r^{z−1}·Π_{j≠fi} t_j^{…}·(base).
  ζ_i = (sn/sd)·r·ζ̂_i, ζ̂_fi = fv. The coefficient gets sn^z·sd^{Z−z}·fv^{e_fi} (Z is the largest ζ-degree in D; differs only by a positive constant factor). -/
def faceTrans (kd : Kind) (sc : RatI) (fi : Nat) (fv : Int) (D : Poly) : Poly :=
  let zs := zetaIdx kd
  let Z := D.foldl (fun acc x => max acc (zdeg kd x.1)) 0
  psum (D.map (fun x =>
    let m := x.1
    let z := zdeg kd m
    let ef := nth m (nth zs fi 0) 0
    let others := (List.range zs.length).filterMap (fun jj => if jj == fi then none else some (nth m (nth zs jj 0) 0))
    let bases := (baseIdx kd).map (fun b => nth m b 0)
    [((z - 1) :: others ++ bases, x.2 * sc.1 ^ z * (sc.2 : Int) ^ (Z - z) * fv ^ ef)]))

/-- on a box (lo, hi in DU units), the lower bound on [−1,1]^5 of DU^H·H(centre + W s / DU) (same rule as d31_local.lb_of). -/
def shiftLb (du : Int) (Hp : Poly) (lo hi : List Int) : Int :=
  let Cc := List.zipWith (fun l h => (l + h) / 2) lo hi
  let W := List.zipWith (fun l h => (h - l) / 2) lo hi
  let Hd := Hp.foldl (fun acc x => max acc (mdeg x.1)) 0
  let S := psum (Hp.map (fun x =>
    let base : Poly := [(zeroMono, x.2 * du ^ (Hd - mdeg x.1))]
    (List.range 5).foldl (fun acc i =>
      (List.range (nth x.1 i 0)).foldl (fun acc2 _ => pmulAff acc2 (nth Cc i 0) (nth W i 0) i) acc) base))
  S.foldl (fun acc x =>
    if x.1.all (· == 0) then acc + x.2
    else if x.1.all (· % 2 == 0) then acc + min 0 x.2
    else acc - iabs x.2) 0

/-- a rational × DU as an integer (also checks divisibility). -/
def ratToD (D : Int) (x : RatI) : Option Int :=
  if x.2 != 0 && (x.1 * D) % (x.2 : Int) == 0 then some (x.1 * D / x.2) else none

def neg (x : RatI) : RatI := (-x.1, x.2)

/-- local root box (variables (r, free components of ζ̂, base), DU units). side 0 is the u ≤ 0 side, 1 the u ≥ 0 side. -/
def rootBox (P : Prm) (kd : Kind) (fi : Nat) (side : Nat) : Option (List Int × List Int) :=
  let zl := (List.range (zlo kd).length).filterMap (fun i => if i == fi then none else some (nth (zlo kd) i 0))
  let baseR : List (RatI × RatI) := match kd with
    | .J => [((0, 1), P.kJ)]
    | .C => []
  let uS : RatI × RatI := match kd, side with
    | .J, 0 => (neg P.uJ, (0, 1))
    | .J, _ => ((0, 1), P.uJ)
    | .C, 0 => (neg P.uC, neg P.u1)
    | .C, _ => (P.u1, P.uC)
  let rngs := baseR ++ [uS]
  let los := rngs.map (fun r => ratToD P.du r.1)
  let his := rngs.map (fun r => ratToD P.du r.2)
  if los.all Option.isSome && his.all Option.isSome then
    some (0 :: zl.map (fun z => z * P.du) ++ los.map (fun o => o.getD 0),
          P.du :: zl.map (fun _ => P.du) ++ his.map (fun o => o.getD 0))
  else none

def scaleOf (P : Prm) : Kind → RatI
  | .J => P.rJ
  | .C => P.rC

/-! ## Local part: box trees -/

inductive LTok where
  | split
  | acc (c : Nat)

structure LBox where
  lo : List Int
  hi : List Int

/-- split rule (d31_local.split): halve the axis with the largest width / root width (the smaller index on ties). -/
def lsplit (full : List Int) (b : LBox) : LBox × LBox :=
  let w := List.zipWith (fun l h => h - l) b.lo b.hi
  let ax := (List.range 5).foldl (fun a i =>
    if nth w i 0 * nth full a 1 > nth w a 0 * nth full i 1 then i else a) 0
  let mid := (nth b.lo ax 0 + nth b.hi ax 0) / 2
  (⟨b.lo, b.hi.set ax mid⟩, ⟨b.lo.set ax mid, b.hi⟩)

/-- face data: per candidate (code, face polynomial Λ_c or H_c, e₀, e₁), and whether the shape of T is right -/
structure FaceData where
  items : List (Nat × Poly × Int × Int)
  identOk : Bool

def faceData (P : Prm) (kd : Kind) (fi : Nat) (fv : Int) : FaceData :=
  let MQ := rotP qJ
  let res := (family kd).map (fun c =>
    let F := twoPc MQ.1 MQ.2 c
    let T := F.filter (fun x => zdeg kd x.1 == 0)
    let D := F.filter (fun x => zdeg kd x.1 != 0)
    let e := tShape kd T
    ((c, faceTrans kd (scaleOf P kd) fi fv D, (e.getD (0, 0)).1, (e.getD (0, 0)).2), e.isSome))
  ⟨res.map (·.1), res.all (·.2)⟩

/-- zero-order identities (for all candidates of the family: T = k′u(e₀ + e₁u) for J, T = 0 for C). -/
def identOk (kd : Kind) : Bool :=
  let MQ := rotP qJ
  (family kd).all (fun c =>
    let F := twoPc MQ.1 MQ.2 c
    (tShape kd (F.filter (fun x => zdeg kd x.1 == 0))).isSome)

/-- sign of E (J): the u box does not straddle 0, and s·(e₀·DU + e₁·u) ≥ 0 at both ends (s is the sign of the u side). -/
def eOk (du e0 e1 ulo uhi : Int) : Bool :=
  let sg : Int := if ulo ≥ 0 then 1 else -1
  decide (sg == 1 ∨ uhi ≤ 0) && decide (sg * (e0 * du + e1 * ulo) ≥ 0) && decide (sg * (e0 * du + e1 * uhi) ≥ 0)

structure LState where
  stack : List LBox
  ok : Bool
  nAcc : Nat

def lstep (P : Prm) (kd : Kind) (full : List Int) (FD : FaceData) (s : LState) (t : LTok) : LState :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    match t with
    | .split =>
      let cc := lsplit full b
      { s with stack := cc.1 :: cc.2 :: rest }
    | .acc c =>
      let r := match FD.items.find? (fun x => x.1 == c) with
        | some it =>
          let wf := (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id && b.lo.length == 5
          let eok := match kd with
            | .J => eOk P.du it.2.2.1 it.2.2.2 (nth b.lo 4 0) (nth b.hi 4 0)
            | .C => true
          wf && eok && decide (shiftLb P.du it.2.1 b.lo b.hi > 0)
        | none => false
      { s with stack := rest, nAcc := s.nAcc + 1, ok := s.ok && r }

/-- walk the whole tree of face fidx (index in faceList) and side side: (pass, number accepted). -/
def faceRun (P : Prm) (kd : Kind) (fidx side : Nat) (toks : List LTok) : Bool × Nat :=
  match (faceList kd)[fidx]?, rootBox P kd (nth (faceList kd) fidx (0, 1)).1 side with
  | some (fi, fv), some (lo, hi) =>
    let FD := faceData P kd fi fv
    let full := List.zipWith (fun l h => h - l) lo hi
    let s := toks.foldl (lstep P kd full FD) ⟨[⟨lo, hi⟩], true, 0⟩
    (FD.identOk && decide (side < 2) && s.ok && s.stack.isEmpty, s.nAcc)
  | _, _ => (false, 0)

end PackLean.D31
