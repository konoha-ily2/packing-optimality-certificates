/-! Shared parts for re-checking in Lean the **arithmetic** of the certificate of D40 (tetintet_n02: the smallest edge of a regular
tetrahedron that holds 2 regular tetrahedra of unit edge, route Y) (2026-11-14, A8). The claim is 1.953564244 = s̄ ≤ s* ≤ s_up
(s_up is rational, s₀ + 3.3e−22).

The same checks as in Python (`verifier/d40_common.py`, `d40_far.py`, `d40_local.py`, `d40_upper.py`), rewritten independently
with **integers only** (built like the D31 Core; all D40 data — R̂ and the centres as quaternions with denominator 2⁷⁰, s̄, the κ
coefficients, k_N — are rational). No Mathlib (only Bool checks are evaluated). The arguments (the reduction T1–T4 of D28 section 2,
the leaf claims of types F, M and S, the reading of the lemma whose degree-0 part is an inequality, the use of T4, the meaning of
the cover) are not formalised.

* Far: n box (chart (h, k′) ∈ [0,1]² of side A) × R box (4 quaternion charts), one R tree per side A and B.
  Accept A: for a candidate c (type F, M(μ) or S; top and a vertex per face), Lean builds the expression |q|²·(G̃_c,μ ∓ κ_N)
  (for S, |q|²·Š_c) from the definition of G̃ (n·Rṽ_top + ¼Σ_f (n·(b₂ − b_f) + μ)·b_f·Rṽ_{v_f} − (s̄/2)n·b₂ − μs̄/2 ∓ κ_N) as a
  quadratic form of the R box at each corner of the n box; lower bound on [−1,1]³ ≥ 0 (> 0 for S). Discard D: lower bound of
  tr(Rk) − tr(R) > 0. L: the n box lies in N₁ (for a point, [0, r₀]²) and at the 8 vertices of the R box w = q̄_c ⊗ q satisfies
  |w_i| ≤ r₀·w₀. n boxes that meet N₁ have k_N = 0.
* Local: for each centre q_c, Lean builds P_c = |q|²·(candidate expression ∓ κ̃₁) from q = q_c ⊗ (1, p) as a polynomial in
  (h, k′, p₁, p₂, p₃), splits it into the degree-0 part e₀ in the transverse coordinates ζ (for a tube (k′, p), for a point
  (h, k′, p)) and Λ_c, obtained by putting ζ = r·ζ̂ and dividing by r, and checks for each leaf "e₀ ≥ 0 on the base range (for a
  tube a linear function of h, at both ends; for a point a constant)" and "lower bound of Λ_c > 0" (the same rules as d40_local.py).
* The region constants (h_max, r₀), s̄, κ and the centres live in one place, `Prm`; both the far L and the local root boxes read them from there.
-/

namespace PackLean.D40

def nth (l : List α) (i : Nat) (d : α) : α := l.getD i d

def iabs (x : Int) : Int := (x.natAbs : Int)

/-- Rational (numerator, denominator) -/
abbrev RatI := Int × Nat

/-- Local centre: numerators of the quaternion (denominator `Prm.qd`), side (0 = A, 1 = B), tube or point. -/
structure Cen where
  q : List Int
  side : Nat
  tube : Bool

/-- Constants of the problem (exported from Python) -/
structure Prm where
  nd : Int                  -- denominator of n box coordinates (2^30)
  den : Int                 -- denominator of R box coordinates (2^30)
  du : Int                  -- denominator of local leaf coordinates
  qd : Int                  -- denominator of the centre quaternions (2^70)
  hmax : RatI               -- upper limit of h of the tubes
  r0 : RatI                 -- transverse width
  sbar : RatI               -- s̄
  kap : List Int            -- [A0, A1, B] of κ̃₁(h, k′) = (A0 + A1·h + B·k′)/kd
  kd : Int
  msign : Int               -- sign of μ (1 in the main version; −1 only in an injected-error version)
  mus : List Int            -- μ of type M
  rots : List (List (List Int))   -- piece rotations (identity excluded, same order as d40_common.PROT_NONID)
  cens : List Cen

/-- Twice the piece vertices 2ṽ (d40_common.VT) -/
def vt : List (List Int) := [[1, 1, 1], [1, -1, -1], [-1, 1, -1], [-1, -1, 1]]
/-- Container normals b_f (D28 2.4, d40_common.BS) -/
def bvec : List (List Int) := [[-1, -1, -1], [-1, 1, 1], [1, -1, 1], [1, 1, -1]]

def dotI (a b : List Int) : Int := (List.zipWith (· * ·) a b).foldl (· + ·) 0
def vsub (a b : List Int) : List Int := List.zipWith (· - ·) a b

/-! ## Candidates -/

/-- Candidate: type (0 = F, 1 = M, 2 = S), μ, top vertex, a vertex for each face b₀..b₃. -/
structure Cand where
  typ : Nat
  mu : Int
  top : Nat
  vs : List Nat

/-- Candidate code ((type·16 + μ)·4 + top)·256 + (v₀·64 + v₁·16 + v₂·4 + v₃). -/
def decCand (code : Nat) : Cand :=
  let vc := code % 256
  let r := code / 256
  ⟨r / 64, ((r / 4 % 16 : Nat) : Int), r % 4, [vc / 64 % 4, vc / 16 % 4, vc / 4 % 4, vc % 4]⟩

/-- Candidate shape: F has μ = 0; M is on side A with μ in the table; S has μ = 0 and top = 0 (normal form of the code). -/
def candOk (P : Prm) (side : Nat) (code : Nat) : Bool :=
  let c := decCand code
  decide (code < 3 * 64 * 256) &&
  (match c.typ with
   | 0 => c.mu == 0
   | 1 => side == 0 && P.mus.contains c.mu
   | _ => c.mu == 0 && c.top == 0)

/-- Shape of local candidates (make_cands of d40_local: side B has type F only). -/
def candOkLoc (P : Prm) (side : Nat) (code : Nat) : Bool :=
  candOk P side code && (side == 0 || (decCand code).typ == 0)

/-! ## Far: quadratic forms of the R box (s ∈ [−1,1]³) -/

structure Aff where
  c : Int
  w1 : Int
  w2 : Int
  w3 : Int

/-- Coefficients of a quadratic form [1, s1, s2, s3, s1², s2², s3², s1s2, s1s3, s2s3] (same order as d31_common) -/
abbrev Quad := List Int

def affMul (a b : Aff) : Quad :=
  [a.c * b.c, a.c * b.w1 + a.w1 * b.c, a.c * b.w2 + a.w2 * b.c, a.c * b.w3 + a.w3 * b.c,
   a.w1 * b.w1, a.w2 * b.w2, a.w3 * b.w3,
   a.w1 * b.w2 + a.w2 * b.w1, a.w1 * b.w3 + a.w3 * b.w1, a.w2 * b.w3 + a.w3 * b.w2]

def qadd (a b : Quad) : Quad := List.zipWith (· + ·) a b
def qsub (a b : Quad) : Quad := List.zipWith (· - ·) a b
def qsmul (c : Int) (a : Quad) : Quad := a.map (fun x => c * x)
def qzero : Quad := List.replicate 10 0

/-- Lower bound on [−1,1]³: constant + min(0, c) of the square terms − |c| of the odd terms (d31_common.quad_lb). −1 for a wrong shape. -/
def quadLb (v : Quad) : Int :=
  match v with
  | [c, a1, a2, a3, s1, s2, s3, x12, x13, x23] =>
    c + min 0 s1 + min 0 s2 + min 0 s3 - iabs a1 - iabs a2 - iabs a3 - iabs x12 - iabs x13 - iabs x23
  | _ => -1

/-- R box: chart ch, coordinates lo and hi (in units of DEN). -/
structure RBox where
  ch : Nat
  l0 : Int
  l1 : Int
  l2 : Int
  h0 : Int
  h1 : Int
  h2 : Int

/-- The 4 quaternion components (DEN inserted at chart ch) as affine forms (d31_common.chart_q_aff). -/
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

def rboxWf (b : RBox) : Bool :=
  decide (b.l0 < b.h0) && decide (b.l1 < b.h1) && decide (b.l2 < b.h2) &&
  (b.h0 - b.l0) % 2 == 0 && (b.h1 - b.l1) % 2 == 0 && (b.h2 - b.l2) % 2 == 0 && decide (b.ch < 4)

/-- M(q) (9 entries, row order, rotation times |q|²) and |q|². -/
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

/-! ## Far: candidate expressions and acceptance A -/

/-- n of the side times ND at the corner (hv, k′v) (in units of ND): A is (1−h, 1−h−k′, 1), B is (1−h, −(1−h−k′), 1). -/
def nAt (nd : Int) (side : Nat) (hv kv : Int) : List Int :=
  if side == 0 then [nd - hv, nd - hv - kv, nd] else [nd - hv, -(nd - hv - kv), nd]

/-- A positive constant multiple of the candidate expression (T = 16·ND·sd·KD·kd, for S 2·sd), as integer coefficients of the 9 entries of M and of |q|².
  Types F and M: n·Mṽ_top + ¼Σ_f (n·(b₂−b_f) + μ)·b_f·Mṽ_{v_f} − ((s̄/2)·n·b₂ + μs̄/2 ∓ κ_N)·|q|² (side A −κ_N, side B +κ_N),
  κ_N = (A0 + A1·h + B·k′)/KD + k_N. Type S: Σ_f b_f·Mṽ_{v_f} − 2s̄·|q|². -/
def farCoefs (P : Prm) (side : Nat) (c : Cand) (kN : RatI) (hv kv : Int) : List Int × Int :=
  let sn := P.sbar.1; let sd : Int := P.sbar.2
  let N := nAt P.nd side hv kv
  let KD := P.kd; let kd : Int := kN.2; let kn := kN.1
  let b2 := nth bvec 2 []
  let vx (v i : Nat) : Int := nth (nth vt v []) i 0
  if c.typ == 2 then
    ((List.range 9).map (fun li =>
      let l := li / 3; let i := li % 3
      (List.range 4).foldl (fun acc f => acc + sd * nth (nth bvec f []) l 0 * vx (nth c.vs f 0) i) 0),
     -4 * sn)
  else
    let mue := P.msign * c.mu
    let cf := (List.range 9).map (fun li =>
      let l := li / 3; let i := li % 3
      let t0 := nth N l 0 * vx c.top i * 8 * sd * KD * kd
      let tf := (List.range 4).foldl (fun acc f =>
        let bf := nth bvec f []
        acc + (dotI N (vsub b2 bf) + mue * P.nd) * nth bf l 0 * vx (nth c.vs f 0) i * 2 * sd * KD * kd) 0
      t0 + tf)
    let sg : Int := if side == 0 then -1 else 1
    let A0 := nth P.kap 0 0; let A1 := nth P.kap 1 0; let B := nth P.kap 2 0
    let cq := -8 * sn * dotI N b2 * KD * kd - 8 * mue * sn * P.nd * KD * kd
              + sg * 16 * sd * (kd * (A0 * P.nd + A1 * hv + B * kv) + KD * kn * P.nd)
    (cf, cq)

/-- Lower bound on the R box of the candidate expression at the corner (hv, k′v). -/
def farLbAt (P : Prm) (side : Nat) (c : Cand) (kN : RatI) (MQ : List Quad × Quad) (hv kv : Int) : Int :=
  let cc := farCoefs P side c kN hv kv
  quadLb (qadd ((List.range 9).foldl (fun acc li => qadd acc (qsmul (nth cc.1 li 0) (nth MQ.1 li qzero))) qzero)
               (qsmul cc.2 MQ.2))

/-- n box [l0,h0]×[l1,h1] ((h, k′), in units of ND) -/
structure NBox where
  l0 : Int
  l1 : Int
  h0 : Int
  h1 : Int

/-- Accept A: S does not depend on n, so > 0 at the corner (lo, lo); F and M are linear in (h, k′), so the minimum over the 4 corners ≥ 0. -/
def farAccept (P : Prm) (side : Nat) (nb : NBox) (kN : RatI) (MQ : List Quad × Quad) (code : Nat) : Bool :=
  let c := decCand code
  candOk P side code &&
  (if c.typ == 2 then decide (farLbAt P side c kN MQ nb.l0 nb.l1 > 0)
   else
     let f := farLbAt P side c kN MQ
     decide (min (min (f nb.l0 nb.l1) (f nb.l0 nb.h1)) (min (f nb.h0 nb.l1) (f nb.h0 nb.h1)) ≥ 0))

/-- Discard D: lower bound of tr(Rk) − tr(R) (times |q|²·DEN²). (Rk)_ii = Σ_j R_ij k_ji. -/
def discLb (M : List Quad) (K : List (List Int)) : Int :=
  quadLb ((List.range 9).foldl (fun acc ij =>
    let i := ij / 3; let j := ij % 3
    let kji := nth (nth K j []) i 0
    qadd acc (qsmul (kji - (if i == j then 1 else 0)) (nth M ij qzero))) qzero)

/-! ## Far: the local region L (the same constants as the local lemma) -/

/-- x ≤ (num/den)·S in integers -/
def leR (x : Int) (r : RatI) (S : Int) : Bool := decide (x * (r.2 : Int) ≤ r.1 * S)
/-- x < (num/den)·S -/
def ltR (x : Int) (r : RatI) (S : Int) : Bool := decide (x * (r.2 : Int) < r.1 * S)

/-- n box ⊂ N₁ = [0, h_max] × [0, r₀] -/
def nInN1 (P : Prm) (nb : NBox) : Bool := leR nb.h0 P.hmax P.nd && leR nb.h1 P.r0 P.nd
/-- n box ⊂ [0, r₀]² (point boxes) -/
def nInP (P : Prm) (nb : NBox) : Bool := leR nb.h0 P.r0 P.nd && leR nb.h1 P.r0 P.nd
/-- the n box meets N₁ (d40_far.n_overlaps_N1) -/
def overlapsN1 (P : Prm) (nb : NBox) : Bool := ltR nb.l0 P.hmax P.nd && ltR nb.l1 P.r0 P.nd

def qmulI (p q : List Int) : List Int :=
  match p, q with
  | [w1, x1, y1, z1], [w2, x2, y2, z2] =>
    [w1*w2 - x1*x2 - y1*y2 - z1*z2, w1*x2 + x1*w2 + y1*z2 - z1*y2,
     w1*y2 - x1*z2 + y1*w2 + z1*x2, w1*z2 + x1*y2 - y1*x2 + z1*w2]
  | _, _ => [0, 0, 0, 0]

/-- The 8 vertices of the R box (quaternions, DEN at the chart position). -/
def rVerts (den : Int) (b : RBox) : List (List Int) :=
  [b.l0, b.h0].foldr (fun a acc => [b.l1, b.h1].foldr (fun bb acc2 => [b.l2, b.h2].foldr (fun c acc3 =>
    (match b.ch with
     | 0 => [den, a, bb, c]
     | 1 => [a, den, bb, c]
     | 2 => [a, bb, den, c]
     | _ => [a, bb, c, den]) :: acc3) acc2) acc) []

/-- The R box lies in the cube {w = q̄_c ⊗ q, |w_i| ≤ r₀·w₀} of the centre q_c (all 8 vertices with w₀ > 0, or all with w₀ < 0). -/
def rInCube (P : Prm) (b : RBox) (qc : List Int) : Bool :=
  let qbar := [nth qc 0 0, -nth qc 1 0, -nth qc 2 0, -nth qc 3 0]
  [1, -1].any (fun (sg : Int) => (rVerts P.den b).all (fun v =>
    let w := qmulI qbar v
    let w0 := sg * nth w 0 0
    decide (w0 > 0) && [1, 2, 3].all (fun i => decide (iabs (nth w i 0) * (P.r0.2 : Int) ≤ P.r0.1 * w0))))

/-! ## Far: R tree -/

/-- Preorder sequence of the R tree: split / L (centre number) / discard (rotation number) / accept (candidate code). -/
inductive Tok where
  | split
  | L (c : Nat)
  | D (m : Nat)
  | A (code : Nat)

/-- split3: halve the widest axis (the smallest index on ties) (d40_far.split3). -/
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

/-- L leaf: the n box lies in N₁ or in the point box (allowL), the centre has the same side, the n box ⊂ N₁ for a tube and ⊂ [0, r₀]² for a point, and the R box lies in the cube. -/
def lOk (P : Prm) (side : Nat) (nb : NBox) (rb : RBox) (c : Nat) : Bool :=
  (nInN1 P nb || nInP P nb) &&
  match P.cens[c]? with
  | some ce => ce.side == side && (if ce.tube then nInN1 P nb else nInP P nb) && rInCube P rb ce.q
  | none => false

def leafOk (P : Prm) (side : Nat) (nb : NBox) (kN : RatI) (rb : RBox) : Tok → Bool
  | .split => false
  | .L c => lOk P side nb rb c
  | .D m => decide (m < P.rots.length) && decide (discLb (rotQ (rboxQ P.den rb)).1 (nth P.rots m []) > 0)
  | .A code => farAccept P side nb kN (rotQ (rboxQ P.den rb)) code

structure WState where
  stack : List RBox
  ok : Bool
  nA : Nat
  nD : Nat
  nL : Nat

def wstep (P : Prm) (side : Nat) (nb : NBox) (kN : RatI) (s : WState) (t : Tok) : WState :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    match t with
    | .split =>
      let cc := split3 b
      { s with stack := cc.1 :: cc.2 :: rest, ok := s.ok && rboxWf b }
    | .L _ => { s with stack := rest, ok := s.ok && rboxWf b && leafOk P side nb kN b t, nL := s.nL + 1 }
    | .D _ => { s with stack := rest, ok := s.ok && rboxWf b && leafOk P side nb kN b t, nD := s.nD + 1 }
    | .A _ => { s with stack := rest, ok := s.ok && rboxWf b && leafOk P side nb kN b t, nA := s.nA + 1 }

def rRoots (den : Int) : List RBox :=
  (List.range 4).map (fun ch => ⟨ch, -den, -den, -den, den, den, den⟩)

def nboxWf (b : NBox) : Bool := decide (b.l0 < b.h0) && decide (b.l1 < b.h1)

/-- Walk the whole R tree (4 charts) of one n box and one side: (pass, accepted, discarded, L).
  Preconditions: box shape, denominator of k_N > 0, k_N = 0 for boxes that meet N₁ (as in d40_far.replay). -/
def nbRun (P : Prm) (nb : NBox) (side : Nat) (kN : RatI) (toks : List Tok) : Bool × Nat × Nat × Nat :=
  let pre := nboxWf nb && decide (kN.2 > 0) && decide (side < 2) && (kN.1 == 0 || !(overlapsN1 P nb))
  let s := toks.foldl (wstep P side nb kN) ⟨rRoots P.den, pre, 0, 0, 0⟩
  (s.ok && s.stack.isEmpty, s.nA, s.nD, s.nL)

/-! ## Far: n tree (root [0,1]², out means h_lo + k′_lo ≥ 1) -/

inductive NTok where
  | split
  | out
  | ok

/-- split2: halve the wider axis (h on ties) (d40_far.split2). -/
def split2 (b : NBox) : NBox × NBox :=
  let w0 := b.h0 - b.l0; let w1 := b.h1 - b.l1
  if w0 ≥ w1 then let m := (b.l0 + b.h0) / 2; ({ b with h0 := m }, { b with l0 := m })
  else let m := (b.l1 + b.h1) / 2; ({ b with h1 := m }, { b with l1 := m })

structure NState where
  stack : List NBox
  boxes : List (Int × Int × Int × Int)
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
    | .out => { s with stack := rest, ok := s.ok && decide (b.l0 + b.l1 ≥ nd), nOut := s.nOut + 1 }
    | .ok =>
      match s.boxes with
      | [] => { s with ok := false }
      | (a0, a1, a2, a3) :: bs =>
        { s with stack := rest, boxes := bs, nOk := s.nOk + 1,
                 ok := s.ok && a0 == b.l0 && a1 == b.l1 && a2 == b.h0 && a3 == b.h1 }

/-- The n tree closes and its ok leaves match the box table in order: (pass, number of ok, number of out). -/
def ntreeRun (nd : Int) (toks : List NTok) (boxes : List (Int × Int × Int × Int)) : Bool × Nat × Nat :=
  let s := toks.foldl (nstep nd) ⟨[⟨0, 0, nd, nd⟩], boxes, true, 0, 0⟩
  (s.ok && s.stack.isEmpty && s.boxes.isEmpty, s.nOk, s.nOut)

/-! ## Local: sparse polynomials (integer coefficients, monomials as exponent lists) -/

abbrev Mono := List Nat
abbrev Poly := List (Mono × Int)

def monoLt : Mono → Mono → Bool
  | [], [] => false
  | a :: as, b :: bs => if a == b then monoLt as bs else decide (a < b)
  | _, _ => false

/-- Sum of polynomials sorted by increasing monomial (zero coefficients dropped; structural recursion with fuel). -/
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

/-- Constants and variables in the 5 variables (h, k′, p₁, p₂, p₃) -/
def zm5 : Mono := [0, 0, 0, 0, 0]
def pconst (c : Int) : Poly := if c == 0 then [] else [(zm5, c)]
def pvar (i : Nat) : Poly := [(incAt zm5 i, 1)]

def pmul (p q : Poly) : Poly :=
  psum (p.map (fun x => psum (q.map (fun y => [(List.zipWith (· + ·) x.1 y.1, x.2 * y.2)]))))

/-- p·(c + w·t_i) -/
def pmulAff (p : Poly) (c w : Int) (i : Nat) : Poly :=
  padd (psmul c p) (psmul w (p.map (fun x => (incAt x.1 i, x.2))))

def mdeg (m : Mono) : Nat := m.foldl (· + ·) 0

/-! ## Local: candidate polynomials of a centre -/

/-- Integer quaternion × polynomial quaternion -/
def qmulP (p : List Int) (q : List Poly) : List Poly :=
  match p, q with
  | [w1, x1, y1, z1], [w2, x2, y2, z2] =>
    [psum [psmul w1 w2, psmul (-x1) x2, psmul (-y1) y2, psmul (-z1) z2],
     psum [psmul w1 x2, psmul x1 w2, psmul y1 z2, psmul (-z1) y2],
     psum [psmul w1 y2, psmul (-x1) z2, psmul y1 w2, psmul z1 x2],
     psum [psmul w1 z2, psmul x1 y2, psmul (-y1) x2, psmul z1 w2]]
  | _, _ => []

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

/-- For the centre q_c (numerators), M(q) and |q|² of q = q_c ⊗ (1, p₁, p₂, p₃) (times the square of the denominator of q_c). -/
def centerMQ (ce : Cen) : List Poly × Poly :=
  rotP (qmulP ce.q [pconst 1, pvar 2, pvar 3, pvar 4])

/-- 2·Mṽ_v (3 entries) = M·(2ṽ_v) -/
def mv2 (M : List Poly) (v : Nat) : List Poly :=
  (List.range 3).map (fun l => psum ((List.range 3).map (fun i => psmul (nth (nth vt v []) i 0) (nth M (3 * l + i) []))))

def dotIP (w : List Int) (x : List Poly) : Poly := psum (List.zipWith psmul w x)
def dotPP (a b : List Poly) : Poly := psum (List.zipWith pmul a b)

/-- n of the side (polynomials in (h, k′)): A is (1−h, 1−h−k′, 1), B is (1−h, −1+h+k′, 1). -/
def nPoly (side : Nat) : List Poly :=
  let h := pvar 0; let k := pvar 1; let one := pconst 1
  if side == 0 then [psub one h, psub (psub one h) k, one] else [psub one h, padd (padd (pconst (-1)) h) k, one]

/-- A positive constant multiple of P_c (times 8·sd·KD, for S times 2·sd, and also times the square of the centre denominator):
  types F and M: |q|²·(n·Mṽ_top + ¼Σ_f (n·(b₂−b_f) + μ)·b_f·Mṽ_{v_f} − (s̄/2)(n·b₂ + μ) ∓ κ̃₁); type S: |q|²·(Σ_f b_f·Mṽ_{v_f} − 2s̄). -/
def locP (P : Prm) (side : Nat) (MQ : List Poly × Poly) (c : Cand) : Poly :=
  let sn := P.sbar.1; let sd : Int := P.sbar.2; let KD := P.kd
  let M := MQ.1; let Q := MQ.2
  if c.typ == 2 then
    psub (psmul sd (psum ((List.range 4).map (fun f => dotIP (nth bvec f []) (mv2 M (nth c.vs f 0))))))
         (psmul (4 * sn) Q)
  else
    let n := nPoly side
    let mue := P.msign * c.mu
    let b2 := nth bvec 2 []
    let nI (w : List Int) : Poly := psum (List.zipWith (fun x y => psmul x y) w n)
    let t0 := psmul (4 * sd * KD) (dotPP n (mv2 M c.top))
    let tf := psum ((List.range 4).map (fun f =>
      let bf := nth bvec f []
      pmul (padd (nI (vsub b2 bf)) (pconst mue)) (psmul (sd * KD) (dotIP bf (mv2 M (nth c.vs f 0))))))
    let kq := padd (pconst (nth P.kap 0 0)) (padd (psmul (nth P.kap 1 0) (pvar 0)) (psmul (nth P.kap 2 0) (pvar 1)))
    let sq := psmul (4 * sn * KD) (padd (nI b2) (pconst mue))
    let sg : Int := if side == 0 then -1 else 1
    psum [t0, tf, psmul (-1) (pmul sq Q), psmul (sg * 8 * sd) (pmul kq Q)]

/-- Degree in the transverse coordinates ζ (for a tube (k′, p), for a point (h, k′, p)) -/
def zdeg (tube : Bool) (m : Mono) : Nat :=
  if tube then nth m 1 0 + nth m 2 0 + nth m 3 0 + nth m 4 0 else mdeg m

/-- Split P into e₀ (degree 0 in ζ) and Λ (put ζ = r·ζ̂ and divide by r). The variables of Λ are
  for a tube (h, r, k̂′, p̂₁, p̂₂, p̂₃), for a point (r, ĥ, k̂′, p̂₁, p̂₂, p̂₃) (same order as d40_local.split_poly). -/
def splitP (tube : Bool) (p : Poly) : Poly × Poly :=
  let e0 := p.filter (fun x => zdeg tube x.1 == 0)
  let lam := psum ((p.filter (fun x => zdeg tube x.1 != 0)).map (fun x =>
    let m := x.1; let dz := zdeg tube m
    let key : Mono := if tube then [nth m 0 0, dz - 1, nth m 1 0, nth m 2 0, nth m 3 0, nth m 4 0]
                      else [dz - 1, nth m 0 0, nth m 1 0, nth m 2 0, nth m 3 0, nth m 4 0]
    [(key, x.2)]))
  (e0, lam)

/-- e₀ ≥ 0 on the base range: for a tube, check that the degree in h is ≤ 1 and test both ends (in units of DU); for a point, a constant. -/
def e0Ok (du : Int) (tube : Bool) (e0 : Poly) (lo hi : List Int) : Bool :=
  if tube then
    let c0 := (e0.filter (fun x => nth x.1 0 0 == 0)).foldl (fun a x => a + x.2) 0
    let c1 := (e0.filter (fun x => nth x.1 0 0 == 1)).foldl (fun a x => a + x.2) 0
    e0.all (fun x => decide (nth x.1 0 0 ≤ 1)) &&
    decide (c0 * du + c1 * nth lo 0 0 ≥ 0) && decide (c0 * du + c1 * nth hi 0 0 ≥ 0)
  else
    e0.all (fun x => x.1.all (· == 0)) && decide (e0.foldl (fun a x => a + x.2) 0 ≥ 0)

/-- On the box (lo and hi in units of DU), the lower bound on [−1,1]⁶ of DU^H·Λ(centre + half-width·t / DU) (the same rule as d40_local.lam_lb:
  constant + min(0, ·) of the terms with only even powers − |·| of the other terms). -/
def shiftLb (du : Int) (Hp : Poly) (lo hi : List Int) : Int :=
  let Cc := List.zipWith (fun l h => (l + h) / 2) lo hi
  let W := List.zipWith (fun l h => (h - l) / 2) lo hi
  let nv := lo.length
  let Hd := Hp.foldl (fun acc x => max acc (mdeg x.1)) 0
  let S := psum (Hp.map (fun x =>
    let base : Poly := [(List.replicate nv 0, x.2 * du ^ (Hd - mdeg x.1))]
    (List.range nv).foldl (fun acc i =>
      (List.range (nth x.1 i 0)).foldl (fun acc2 _ => pmulAff acc2 (nth Cc i 0) (nth W i 0) i) acc) base))
  S.foldl (fun acc x =>
    if x.1.all (· == 0) then acc + x.2
    else if x.1.all (· % 2 == 0) then acc + min 0 x.2
    else acc - iabs x.2) 0

/-- A rational times D as an integer (also checks divisibility). -/
def ratToD (D : Int) (x : RatI) : Option Int :=
  if x.2 != 0 && (x.1 * D) % (x.2 : Int) == 0 then some (x.1 * D / x.2) else none

/-- Lower ends of ζ̂ (tube (k̂′, p̂): (0, −1, −1, −1); point (ĥ, k̂′, p̂): (0, 0, −1, −1, −1)) -/
def zlo (tube : Bool) : List Int := if tube then [0, -1, -1, -1] else [0, 0, -1, -1, -1]

/-- List of faces (in the order of d40_local.root_leaves: +1 for each index of ζ̂, and −1 too if the lower end is −1) -/
def faceList (tube : Bool) : List (Nat × Int) :=
  (List.range (zlo tube).length).foldr (fun i acc =>
    (i, 1) :: (if nth (zlo tube) i 0 < 0 then [(i, -1)] else []) ++ acc) []

/-- Root box of face (fi, fv) (in units of DU): tube (h ∈ [0, h_max], r ∈ [0, r₀], ζ̂), point (r, ζ̂). -/
def rootBox (P : Prm) (tube : Bool) (fi : Nat) (fv : Int) : Option (List Int × List Int) :=
  let zl := zlo tube
  let zL := (List.range zl.length).map (fun j => if j == fi then fv * P.du else nth zl j 0 * P.du)
  let zH := (List.range zl.length).map (fun j => if j == fi then fv * P.du else P.du)
  match ratToD P.du P.hmax, ratToD P.du P.r0 with
  | some hm, some r =>
    if tube then some ([0, 0] ++ zL, [hm, r] ++ zH) else some ([0] ++ zL, [r] ++ zH)
  | _, _ => none

/-- Normalising widths of the splitting (d40_local.norm_widths: h_max for h, r₀ for r, 2 for ζ̂) -/
def fullW (P : Prm) (tube : Bool) : List Int :=
  let hm := (ratToD P.du P.hmax).getD 1; let r := (ratToD P.du P.r0).getD 1
  if tube then [hm, r, 2 * P.du, 2 * P.du, 2 * P.du, 2 * P.du] else [r, 2 * P.du, 2 * P.du, 2 * P.du, 2 * P.du, 2 * P.du]

inductive LTok where
  | split
  | acc (j : Nat)

structure LBox where
  lo : List Int
  hi : List Int

/-- Splitting (d40_local.split): halve the axis with the largest width / normalising width (the smallest index on ties). -/
def lsplit (full : List Int) (b : LBox) : LBox × LBox :=
  let w := List.zipWith (fun l h => h - l) b.lo b.hi
  let ax := (List.range w.length).foldl (fun a i =>
    if nth w i 0 * nth full a 1 > nth w a 0 * nth full i 1 then i else a) 0
  let mid := (nth b.lo ax 0 + nth b.hi ax 0) / 2
  (⟨b.lo, b.hi.set ax mid⟩, ⟨b.lo.set ax mid, b.hi⟩)

/-- Each entry of the candidate table: (shape ok, e₀, Λ) -/
def candItems (P : Prm) (ce : Cen) (tab : List Nat) : List (Bool × Poly × Poly) :=
  let MQ := centerMQ ce
  tab.map (fun code =>
    let sp := splitP ce.tube (locP P ce.side MQ (decCand code))
    (candOkLoc P ce.side code, sp.1, sp.2))

structure LState where
  stack : List LBox
  ok : Bool
  nAcc : Nat

def lstep (P : Prm) (tube : Bool) (full : List Int) (items : List (Bool × Poly × Poly)) (s : LState) (t : LTok) : LState :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    match t with
    | .split =>
      let cc := lsplit full b
      { s with stack := cc.1 :: cc.2 :: rest }
    | .acc j =>
      let r := match items[j]? with
        | some it =>
          let wf := (List.zipWith (fun l h => decide (l ≤ h) && (h - l) % 2 == 0) b.lo b.hi).all id &&
                    b.lo.length == 6 && b.hi.length == 6
          it.1 && wf && e0Ok P.du tube it.2.1 b.lo b.hi && decide (shiftLb P.du it.2.2 b.lo b.hi > 0)
        | none => false
      { s with stack := rest, nAcc := s.nAcc + 1, ok := s.ok && r }

/-- Walk the whole tree of face fidx (index in faceList) of centre ci: (pass, number accepted). tab is the table of candidate codes; the leaves hold indices into it. -/
def faceRun (P : Prm) (ci fidx : Nat) (tab : List Nat) (toks : List LTok) : Bool × Nat :=
  match P.cens[ci]? with
  | none => (false, 0)
  | some ce =>
    match (faceList ce.tube)[fidx]? with
    | none => (false, 0)
    | some (fi, fv) =>
      match rootBox P ce.tube fi fv with
      | none => (false, 0)
      | some (lo, hi) =>
        let items := candItems P ce tab
        let s := toks.foldl (lstep P ce.tube (fullW P ce.tube) items) ⟨[⟨lo, hi⟩], true, 0⟩
        (s.ok && s.stack.isEmpty, s.nAcc)

/-! ## Constant checks (a small rational toolkit) -/

/-- Rationals (denominator > 0 kept by construction) -/
structure Rt where
  n : Int
  d : Int

def rI (a : Int) : Rt := ⟨a, 1⟩
def rR (x : RatI) : Rt := ⟨x.1, (x.2 : Int)⟩
def radd (a b : Rt) : Rt := ⟨a.n * b.d + b.n * a.d, a.d * b.d⟩
def rmul (a b : Rt) : Rt := ⟨a.n * b.n, a.d * b.d⟩
def rneg (a : Rt) : Rt := ⟨-a.n, a.d⟩
def rsub (a b : Rt) : Rt := radd a (rneg b)
def rle (a b : Rt) : Bool := decide (a.n * b.d ≤ b.n * a.d)
def rlt (a b : Rt) : Bool := decide (a.n * b.d < b.n * a.d)
def req (a b : Rt) : Bool := a.n * b.d == b.n * a.d
def rpos (a : Rt) : Bool := decide (a.d > 0)
def rsum (l : List Rt) : Rt := l.foldl radd (rI 0)
def rdot (a b : List Rt) : Rt := rsum (List.zipWith rmul a b)

/-- M(q) of an integer quaternion (rotation times |q|², integers) -/
def mqI (q : List Int) : List (List Int) :=
  match q with
  | [w, a, b, c] =>
    [[w*w + a*a - b*b - c*c, 2*(a*b - w*c), 2*(a*c + w*b)],
     [2*(a*b + w*c), w*w - a*a + b*b - c*c, 2*(b*c - w*a)],
     [2*(a*c - w*b), 2*(b*c + w*a), w*w - a*a - b*b + c*c]]
  | _ => []

def nq (q : List Int) : Int := dotI q q

/-- Rotation R = M(q)/|q|² (rational) -/
def rotR (q : List Int) : List (List Rt) := (mqI q).map (fun row => row.map (fun x => ⟨x, nq q⟩))

def matVecI (M : List (List Int)) (v : List Int) : List Int := M.map (fun row => dotI row v)
def matVecR (M : List (List Rt)) (v : List Rt) : List Rt := M.map (fun row => rdot row v)

def det3 (K : List (List Int)) : Int :=
  let g (i j : Nat) : Int := nth (nth K i []) j 0
  g 0 0 * (g 1 1 * g 2 2 - g 1 2 * g 2 1) - g 0 1 * (g 1 0 * g 2 2 - g 1 2 * g 2 0) +
  g 0 2 * (g 1 0 * g 2 1 - g 1 1 * g 2 0)

def isSignedPerm (K : List (List Int)) : Bool :=
  K.length == 3 && K.all (fun row => row.length == 3 && row.all (fun x => x == 0 || x == 1 || x == -1) &&
    (row.filter (· != 0)).length == 1) &&
  (List.range 3).all (fun j => ((K.map (fun row => nth row j 0)).filter (· != 0)).length == 1)

/-- The 11 piece rotations (identity excluded) are signed permutations with det = 1, not the identity, distinct, and keep the
  vertex set of the piece (the arithmetic part of "G̃ and Š do not change under R → Rk", used by the discarding rule). -/
def rotsOk (P : Prm) : Bool :=
  P.rots.all (fun K => isSignedPerm K && det3 K == 1 && K != [[1, 0, 0], [0, 1, 0], [0, 0, 1]] &&
    vt.all (fun v => vt.contains (matVecI K v))) &&
  P.rots.eraseDups.length == P.rots.length

def posR (r : RatI) : Bool := decide (0 < r.1) && decide (0 < r.2)

/-- Shape of the constants: positive denominators, h_max, r₀ and s̄ positive, KD > 0, sign of μ is +1, the μ table positive. -/
def prmOk (P : Prm) : Bool :=
  decide (0 < P.nd) && decide (0 < P.den) && decide (0 < P.du) && decide (0 < P.qd) && decide (0 < P.kd) &&
  posR P.hmax && posR P.r0 && posR P.sbar && P.msign == 1 && P.mus.all (fun m => decide (0 < m)) &&
  P.kap.length == 3 && (ratToD P.du P.hmax).isSome && (ratToD P.du P.r0).isSome

/-- The container {b_f·x ≤ s/2} at s = 1 is the piece itself: b_f·(2ṽ_v) is −3 for f = v and 1 otherwise (face f is opposite vertex f).
  Also n·(b₂ − b_f) ≥ 0 at the 3 vertices of D_n = {|y| ≤ x ≤ 1} (on D_n, m̃(n) = n·b₂ and the weights are ≥ 0). -/
def shapeOk : Bool :=
  (List.range 4).all (fun f => (List.range 4).all (fun v =>
    dotI (nth bvec f []) (nth vt v []) == (if f == v then -3 else 1))) &&
  [[1, 1, 1], [1, -1, 1], [0, 0, 1]].all (fun n => (List.range 4).all (fun f =>
    decide (dotI n (vsub (nth bvec 2 []) (nth bvec f [])) ≥ 0)))

/-- The centre is an image of R̂: the vertex set {M(q_c)·2ṽ / |q_c|²} of the piece at centre c equals {G·M(q̂)·2ṽ / |q̂|²} (G a
  permutation matrix fixing n_B = (1,1,1); when det G = −1, a rotation paired with the reflection of the piece). -/
def imageOk (qh qc : List Int) (G : List (List Int)) : Bool :=
  isSignedPerm G && G.all (fun row => row.all (fun x => decide (x ≥ 0))) &&
  vt.all (fun v => vt.any (fun w =>
    (matVecI (mqI qc) v).map (· * nq qh) == (matVecI G (matVecI (mqI qh) w)).map (· * nq qc)))

/-- G̃_c (μ = 0, without κ, rational): n·Rṽ_top + ¼Σ_f n·(b₂ − b_f)·b_f·Rṽ_{v_f} − (s/2)·n·b₂ (d40_common.gtilde_cand_exact). -/
def gtc (n : List Rt) (R : List (List Rt)) (s : Rt) (c : List Nat) : Rt :=
  let X (v : Nat) : List Rt := matVecR R ((nth vt v []).map (fun x => ⟨x, 2⟩))
  let b2 := nth bvec 2 []
  let nb (w : List Int) : Rt := rdot n (w.map rI)
  rsum ([rdot n (X (nth c 0 0)), rmul (rneg (rmul s ⟨1, 2⟩)) (nb b2)] ++
    (List.range 4).map (fun f =>
      rmul (rmul (nb (vsub b2 (nth bvec f []))) ⟨1, 4⟩) (rdot ((nth bvec f []).map rI) (X (nth c (f + 1) 0)))))

/-- The κ̃₁ coefficients follow the definition (d40_common.kappa_coefs): (L̂₁ − L̂₂)/2 at h = 0 and 1/10 on the arc, computed in
  rationals from the centre of T_S with candidate cA and the corner piece (I) with candidate cB, equal to a0 and a1. β = B/KD. -/
def kappaOk (P : Prm) (qS : List Int) (cA0 cA1 cB0 cB1 : List Nat) (beta : RatI) : Bool :=
  let s := rR P.sbar
  let RS := rotR qS
  let I3 : List (List Rt) := [[rI 1, rI 0, rI 0], [rI 0, rI 1, rI 0], [rI 0, rI 0, rI 1]]
  let nA (h : Rt) : List Rt := [rsub (rI 1) h, rsub (rI 1) h, rI 1]
  let nB (h : Rt) : List Rt := [rsub (rI 1) h, rneg (rsub (rI 1) h), rI 1]
  let h1 : Rt := ⟨1, 10⟩
  let d0 := rmul (rsub (gtc (nA (rI 0)) RS s cA0) (gtc (nB (rI 0)) I3 s cB0)) ⟨1, 2⟩
  let d1 := rmul (rsub (gtc (nA h1) RS s cA1) (gtc (nB h1) I3 s cB1)) ⟨1, 2⟩
  let a1 := rmul (rsub d1 d0) (rI 10)
  req d0 ⟨nth P.kap 0 0, P.kd⟩ && req a1 ⟨nth P.kap 1 0, P.kd⟩ && req (rR beta) ⟨nth P.kap 2 0, P.kd⟩

/-! ## Upper bound (d40_upper.py: the rational placement substituted exactly) -/

/-- Upper-bound placement: the stuck piece R̂ = M(q̂)/|q̂|² (numerators of q̂) with translation t1, the corner piece
  τ = diag(−1,1,−1) with t2, and the normal n of the separating plane. Checked: R̂ is a rotation (M·Mᵀ = |q|⁴·I, det M = |q|⁶),
  the 8 vertices of the 2 pieces lie in the container {b_f·x ≤ s_up/2}, and max n·x of the stuck piece ≤ min n·x of the corner piece
  (separated by the plane n·x = c; touching is allowed). -/
def upperOk (qh : List Int) (sup : Rt) (n t1 t2 : List Rt) : Bool :=
  let M := mqI qh; let N2 := nq qh
  let mmT := M.map (fun row => M.map (fun r2 => dotI row r2))
  let orth := mmT == [[N2 * N2, 0, 0], [0, N2 * N2, 0], [0, 0, N2 * N2]] && det3 M == N2 * N2 * N2
  let R1 := rotR qh
  let tau : List (List Rt) := [[rI (-1), rI 0, rI 0], [rI 0, rI 1, rI 0], [rI 0, rI 0, rI (-1)]]
  let half (v : List Int) : List Rt := v.map (fun x => ⟨x, 2⟩)
  let P1 := vt.map (fun v => List.zipWith radd (matVecR R1 (half v)) t1)
  let P2 := vt.map (fun v => List.zipWith radd (matVecR tau (half v)) t2)
  let inside := (P1 ++ P2).all (fun x => bvec.all (fun b => rle (rdot (b.map rI) x) (rmul sup ⟨1, 2⟩)))
  let sep := P1.all (fun x => P2.all (fun y => rle (rdot n x) (rdot n y)))
  orth && rpos sup && n.all rpos && t1.all rpos && t2.all rpos && inside && sep

/-- Value at a rational of a polynomial (integer coefficients, highest degree first) -/
def polyR (cs : List Int) (x : Rt) : Rt := cs.foldl (fun acc c => radd (rmul acc x) (rI c)) (rI 0)

/-- Shape of the bracketing: s̄ < s_up, s_up − s̄ < 10⁻⁹, and the signs of the minimal polynomial of s₀ at s̄ and s_up are opposite (a root in the interval; for reference). -/
def bracketOk (sbar sup : Rt) (minpoly : List Int) : Bool :=
  rlt sbar sup && rlt (rsub sup sbar) ⟨1, 1000000000⟩ &&
  decide ((polyR minpoly sbar).n * (polyR minpoly sup).n < 0)

end PackLean.D40
