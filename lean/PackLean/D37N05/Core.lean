/-! D37 n = 5 (tetintet_n05: five unit regular tetrahedra in a regular tetrahedron, s* = 2): shared parts of the
Lean re-check of the **arithmetic** of the certificate (2026-11-14, A8').

The claim: s*(tetintet_n05) = 2. The lower bound s* >= 2 comes from the local record (5 centres, R0 = 1/16) and the
far record (n boxes over the triangle T, two R trees per box); the upper bound from an explicit placement of 5 pieces
at s = 2.

This is an independent re-implementation, with **integers only**, of the same checks as the Python code
(`d37_tet_n05_common.py`, `d37_tet_n05_far.py`, `d37_tet_n05_local.py`, and the upper bound of
`d37_tet_n05_replay_both.py`). All data (centre quaternions, s0, kappa coefficients, k_N, mu) are rational.
No Mathlib (only Bool checks are evaluated). The reasoning (the reduction T2-T4 of NOTES_d37 6.1, the meaning of the
leaf types F, M(mu), S, the zeroth-order local lemma, the choice of kappa, the covering meaning) is not formalised.

Coordinates (as in d37_tet_n05_common): 2*v = vt (integers), b_f = bvec, container {b_f . x <= s/2}, s0 = 2,
cell R_3 = {b_3 . x <= 0}, H'_3 = max(H_3, s0/2). The n chart: (a, b) in T = {a, b >= 0, a + b <= 1};
side A n_A(a, b) = (1 - a - b, 1 - b, 1 - a - 2b), side B n_B(a, b) = (a + b - 1, a + 2b - 1, b - 1).

* Far: n box x R box (four quaternion charts), one R tree per side. Accepted leaf A: candidate c = (type F / M / S,
  face j, mu, top vertex, per-face vertex or the constant 1 for f = 3). Lean builds |q|^2 * (G_c minus/plus kappa_N) from the
  definition G_c = n.R v_top + 1/4 sum_f (n.(b_j - b_f) + mu) L_f - (s0/2) n.b_j - mu s0/2 minus/plus kappa_N
  (L_f = b_f . R v_{v_f} or 1), at each corner of the n box, as a quadratic form in the R box, and checks the lower bound
  on [-1,1]^3 >= 0 (S: sum_f L_f - 2 s0 > 0). For F / M it also checks D_j := max_f n.(b_f - b_j) <= mu at every vertex
  of (n box) /\ T. Discard D: lower bound of tr(Rk) - tr(R) > 0. L: the n box lies in N1 (tube) or [0, r0]^2 (point) and
  the 8 vertices of the R box satisfy |w_i| <= r0 w_0 for w = conj(q_c) * q * conj(q_k), k a piece rotation.
  n boxes meeting N1 have k_N = 0.
* Local: for each centre q_c Lean builds P_c = |q|^2 * (candidate minus/plus kappa) as a polynomial in (a, b, p1, p2, p3) with
  q = q_c * (1, p), splits it into the degree-0 part e0 in the transverse coordinates zeta (tube: (b, p), point:
  (a, b, p)) and Lambda (zeta = r zeta-hat, divided by r), and checks per leaf e0 >= 0 (tube: linear in a, both ends;
  point: constant) and a lower bound of Lambda > 0 (same rule as d37_tet_n05_local.lam_lb).
* The region constants (a_max, r0), s0, kappa and the centres are in one place (`Prm`); the far L check and the local
  root boxes both read them.
-/

namespace PackLean.D37N05

def nth (l : List α) (i : Nat) (d : α) : α := l.getD i d

def iabs (x : Int) : Int := (x.natAbs : Int)

/-- rational (numerator, denominator) -/
abbrev RatI := Int × Nat

/-- local centre: integer quaternion, side (0 = A, 1 = B), tube or point -/
structure Cen where
  q : List Int
  side : Nat
  tube : Bool

/-- problem constants (exported from Python) -/
structure Prm where
  nd : Int                  -- denominator of the n box coordinates (2^30)
  den : Int                 -- denominator of the R box coordinates (2^30)
  du : Int                  -- denominator of the local leaf coordinates
  amax : RatI               -- upper end of a on the tube
  r0 : RatI                 -- transverse width
  s0 : RatI                 -- s0
  kap : List Int            -- kappa(a, b) = (A0 + A1 a + B b)/kd as [A0, A1, B]
  kd : Int
  msign : Int               -- sign of mu (1 in the main certificate; -1 only in an injected-error version)
  musLoc : List Int         -- 64 * mu of the local type M
  rots : List (List (List Int))   -- piece rotations without the identity (order of d37_tet_n05_far.PROT_NONID)
  kqs : List (List Int)     -- conjugate quaternions of the 12 piece rotations (d37_tet_n05_far.piece_quats)
  cens : List Cen

/-- 2 * piece vertices (d37_tet_n05_common.VT) -/
def vt : List (List Int) := [[1, 1, 1], [1, -1, -1], [-1, 1, -1], [-1, -1, 1]]
/-- container normals b_f (d37_tet_n05_common.BS) -/
def bvec : List (List Int) := [[1, 1, -1], [1, -1, 1], [-1, 1, 1], [-1, -1, -1]]

def dotI (a b : List Int) : Int := (List.zipWith (· * ·) a b).foldl (· + ·) 0
def vsub (a b : List Int) : List Int := List.zipWith (· - ·) a b

/-- the face of m(n) used on each side by the local lemma (d37_tet_n05_common.MF) -/
def mfOf (side : Nat) : Nat := if side == 0 then 0 else 3

/-- faces j allowed on each side in the far part (d37_tet_n05_far.FACES) -/
def facesOf (side : Nat) : List Nat := if side == 0 then [0] else [3, 0]

/-! ## Candidates -/

/-- candidate: type (0 = F, 1 = M, 2 = S), face j, 64 * mu, top vertex, per-face vertex (4 = the constant 1). -/
structure Cand where
  typ : Nat
  j : Nat
  mu : Int
  top : Nat
  vs : List Nat

/-- code ((((type * 4 + j) * 1024 + 64 mu) * 4 + top) * 625 + v0 * 125 + v1 * 25 + v2 * 5 + v3 -/
def decCand (code : Nat) : Cand :=
  let vc := code % 625
  let r := code / 625
  let r2 := r / 4
  let r3 := r2 / 1024
  ⟨r3 / 4, r3 % 4, ((r2 % 1024 : Nat) : Int), r % 4, [vc / 125 % 5, vc / 25 % 5, vc / 5 % 5, vc % 5]⟩

/-- shape of the vertex choices: the constant 1 (code 4) only for f = 3 -/
def vsOk (c : Cand) : Bool :=
  c.vs.length == 4 && decide (nth c.vs 0 0 < 4) && decide (nth c.vs 1 0 < 4) && decide (nth c.vs 2 0 < 4) &&
  decide (nth c.vs 3 0 ≤ 4)

/-- far candidate shape: F has mu = 0, M has mu > 0, both with j in the faces of the side; S has j = mu = top = 0. -/
def candOk (side : Nat) (code : Nat) : Bool :=
  let c := decCand code
  decide (code < 3 * 4 * 1024 * 4 * 625) && vsOk c &&
  (match c.typ with
   | 0 => c.mu == 0 && (facesOf side).contains c.j
   | 1 => decide (c.mu > 0) && (facesOf side).contains c.j
   | _ => c.mu == 0 && c.j == 0 && c.top == 0)

/-- local candidate shape (d37_tet_n05_local.make_cands): j is the face mf of the side; side A has F, M (mu in the
  table) and S; side B has only F. -/
def candOkLoc (P : Prm) (side : Nat) (code : Nat) : Bool :=
  let c := decCand code
  decide (code < 3 * 4 * 1024 * 4 * 625) && vsOk c &&
  (match c.typ with
   | 0 => c.mu == 0 && c.j == mfOf side
   | 1 => side == 0 && c.j == mfOf side && P.musLoc.contains c.mu
   | _ => side == 0 && c.mu == 0 && c.j == 0 && c.top == 0)

/-! ## Far: quadratic forms on the R box (s in [-1,1]^3) -/

structure Aff where
  c : Int
  w1 : Int
  w2 : Int
  w3 : Int

/-- coefficients [1, s1, s2, s3, s1^2, s2^2, s3^2, s1s2, s1s3, s2s3] (same order as d31_common) -/
abbrev Quad := List Int

def affMul (a b : Aff) : Quad :=
  [a.c * b.c, a.c * b.w1 + a.w1 * b.c, a.c * b.w2 + a.w2 * b.c, a.c * b.w3 + a.w3 * b.c,
   a.w1 * b.w1, a.w2 * b.w2, a.w3 * b.w3,
   a.w1 * b.w2 + a.w2 * b.w1, a.w1 * b.w3 + a.w3 * b.w1, a.w2 * b.w3 + a.w3 * b.w2]

def qadd (a b : Quad) : Quad := List.zipWith (· + ·) a b
def qsub (a b : Quad) : Quad := List.zipWith (· - ·) a b
def qsmul (c : Int) (a : Quad) : Quad := a.map (fun x => c * x)
def qzero : Quad := List.replicate 10 0

/-- lower bound on [-1,1]^3: constant + min(0, c) of the squares - |c| of the odd terms (d31_common.quad_lb). -/
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

/-- the four quaternion components (DEN in the chart position) as affine forms (d31_common.chart_q_aff). -/
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

/-- M(q) (9 entries, row order, |q|^2 times the rotation) and |q|^2. -/
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

/-! ## Far: n, faces and mu -/

/-- ND * n of the side at (av, bv) (ND units): A (ND - a - b, ND - b, ND - a - 2b), B (a + b - ND, a + 2b - ND, b - ND). -/
def nAt (nd : Int) (side : Nat) (av bv : Int) : List Int :=
  if side == 0 then [nd - av - bv, nd - bv, nd - av - 2 * bv] else [av + bv - nd, av + 2 * bv - nd, bv - nd]

/-- n box [l0,h0] x [l1,h1] ((a, b), ND units) -/
structure NBox where
  l0 : Int
  l1 : Int
  h0 : Int
  h1 : Int

/-- vertices of (n box) /\ T in ND units (d37_tet_n05_far.poly_T): the box corners with a + b <= ND and the points of
  a + b = ND inside the edges. -/
def polyT (nd : Int) (nb : NBox) : List (Int × Int) :=
  let cs := [(nb.l0, nb.l1), (nb.l0, nb.h1), (nb.h0, nb.l1), (nb.h0, nb.h1)].filter (fun p => decide (p.1 + p.2 ≤ nd))
  let ea := [nb.l0, nb.h0].filterMap (fun x => if decide (nb.l1 < nd - x) && decide (nd - x < nb.h1) then some (x, nd - x) else none)
  let eb := [nb.l1, nb.h1].filterMap (fun y => if decide (nb.l0 < nd - y) && decide (nd - y < nb.h0) then some (nd - y, y) else none)
  cs ++ ea ++ eb

/-- D_j <= mu on (n box) /\ T: at every vertex and every face f, 64 * ND n.(b_f - b_j) <= (64 mu) * ND; the set is
  not empty (d37_tet_n05_far.valid_opt). -/
def faceMuOk (P : Prm) (side : Nat) (nb : NBox) (j : Nat) (mu64 : Int) : Bool :=
  let pts := polyT P.nd nb
  !pts.isEmpty && decide (mu64 ≥ 0) &&
  pts.all (fun p => (List.range 4).all (fun f =>
    decide (64 * dotI (nAt P.nd side p.1 p.2) (vsub (nth bvec f []) (nth bvec j [])) ≤ mu64 * P.nd)))

/-! ## Far: the candidate form and accepted leaves -/

/-- a positive multiple of the candidate form (F / M: 512 * sd * KD * kd * ND, S: 2 * sd) as coefficients of the 9
  entries of M and of |q|^2 (integers), at the n corner (av, bv).
  F / M: n.M v_top + 1/4 sum_f (n.(b_j - b_f) + mu) L_f - ((s0/2) n.b_j + mu s0/2 minus/plus kappa_N) |q|^2
  (side A: - kappa_N, side B: + kappa_N), kappa_N = (A0 + A1 a + B b)/KD + k_N, L_f = b_f . M v_{v_f} or |q|^2.
  S: sum_f L_f - 2 s0 |q|^2. -/
def farCoefs (P : Prm) (side : Nat) (c : Cand) (kN : RatI) (av bv : Int) : List Int × Int :=
  let sn := P.s0.1; let sd : Int := P.s0.2
  let N := nAt P.nd side av bv
  let KD := P.kd; let kd : Int := kN.2; let kn := kN.1
  let vx (v i : Nat) : Int := nth (nth vt v []) i 0
  if c.typ == 2 then
    ((List.range 9).map (fun li =>
      let l := li / 3; let i := li % 3
      (List.range 4).foldl (fun acc f =>
        let v := nth c.vs f 0
        if v == 4 then acc else acc + sd * nth (nth bvec f []) l 0 * vx v i) 0),
     (if nth c.vs 3 0 == 4 then 2 * sd else 0) - 4 * sn)
  else
    let mue := P.msign * c.mu
    let bj := nth bvec c.j []
    let W (f : Nat) : Int := 64 * dotI N (vsub bj (nth bvec f [])) + mue * P.nd
    let cf := (List.range 9).map (fun li =>
      let l := li / 3; let i := li % 3
      let t0 := nth N l 0 * vx c.top i * 256 * sd * KD * kd
      let tf := (List.range 4).foldl (fun acc f =>
        let v := nth c.vs f 0
        if v == 4 then acc else acc + W f * nth (nth bvec f []) l 0 * vx v i * sd * KD * kd) 0
      t0 + tf)
    let cst := (List.range 4).foldl (fun acc f => if nth c.vs f 0 == 4 then acc + 2 * W f * sd * KD * kd else acc) 0
    let sg : Int := if side == 0 then -1 else 1
    let A0 := nth P.kap 0 0; let A1 := nth P.kap 1 0; let B := nth P.kap 2 0
    let cq := cst - 256 * sn * KD * kd * dotI N bj - 4 * sn * KD * kd * P.nd * mue
              + sg * 512 * sd * (kd * (A0 * P.nd + A1 * av + B * bv) + KD * kn * P.nd)
    (cf, cq)

/-- lower bound of the candidate form on the R box at the n corner (av, bv). -/
def farLbAt (P : Prm) (side : Nat) (c : Cand) (kN : RatI) (MQ : List Quad × Quad) (av bv : Int) : Int :=
  let cc := farCoefs P side c kN av bv
  quadLb (qadd ((List.range 9).foldl (fun acc li => qadd acc (qsmul (nth cc.1 li 0) (nth MQ.1 li qzero))) qzero)
               (qsmul cc.2 MQ.2))

/-- accepted leaf A: S does not depend on n, so > 0 at the corner (lo, lo); F / M are affine in (a, b), so the minimum
  over the 4 corners >= 0, and D_j <= mu on (n box) /\ T. -/
def farAccept (P : Prm) (side : Nat) (nb : NBox) (kN : RatI) (MQ : List Quad × Quad) (code : Nat) : Bool :=
  let c := decCand code
  candOk side code &&
  (if c.typ == 2 then decide (farLbAt P side c kN MQ nb.l0 nb.l1 > 0)
   else
     let f := farLbAt P side c kN MQ
     faceMuOk P side nb c.j c.mu &&
     decide (min (min (f nb.l0 nb.l1) (f nb.l0 nb.h1)) (min (f nb.h0 nb.l1) (f nb.h0 nb.h1)) ≥ 0))

/-- discard D: lower bound of tr(Rk) - tr(R) (times |q|^2 DEN^2). (Rk)_ii = sum_j R_ij k_ji. -/
def discLb (M : List Quad) (K : List (List Int)) : Int :=
  quadLb ((List.range 9).foldl (fun acc ij =>
    let i := ij / 3; let j := ij % 3
    let kji := nth (nth K j []) i 0
    qadd acc (qsmul (kji - (if i == j then 1 else 0)) (nth M ij qzero))) qzero)

/-! ## Far: the local region L (same constants as the local lemma) -/

/-- x <= (num/den) * S in integers -/
def leR (x : Int) (r : RatI) (S : Int) : Bool := decide (x * (r.2 : Int) ≤ r.1 * S)
/-- x < (num/den) * S -/
def ltR (x : Int) (r : RatI) (S : Int) : Bool := decide (x * (r.2 : Int) < r.1 * S)

/-- n box inside N1 = [0, a_max] x [0, r0] -/
def nInN1 (P : Prm) (nb : NBox) : Bool := leR nb.h0 P.amax P.nd && leR nb.h1 P.r0 P.nd
/-- n box inside [0, r0]^2 (point boxes) -/
def nInP (P : Prm) (nb : NBox) : Bool := leR nb.h0 P.r0 P.nd && leR nb.h1 P.r0 P.nd
/-- n box meets N1 (d37_tet_n05_far.n_overlaps_N1) -/
def overlapsN1 (P : Prm) (nb : NBox) : Bool := ltR nb.l0 P.amax P.nd && ltR nb.l1 P.r0 P.nd

def qmulI (p q : List Int) : List Int :=
  match p, q with
  | [w1, x1, y1, z1], [w2, x2, y2, z2] =>
    [w1*w2 - x1*x2 - y1*y2 - z1*z2, w1*x2 + x1*w2 + y1*z2 - z1*y2,
     w1*y2 - x1*z2 + y1*w2 + z1*x2, w1*z2 + x1*y2 - y1*x2 + z1*w2]
  | _, _ => [0, 0, 0, 0]

/-- the 8 vertices of the R box (quaternions, DEN in the chart position). -/
def rVerts (den : Int) (b : RBox) : List (List Int) :=
  [b.l0, b.h0].foldr (fun a acc => [b.l1, b.h1].foldr (fun bb acc2 => [b.l2, b.h2].foldr (fun c acc3 =>
    (match b.ch with
     | 0 => [den, a, bb, c]
     | 1 => [a, den, bb, c]
     | 2 => [a, bb, den, c]
     | _ => [a, bb, c, den]) :: acc3) acc2) acc) []

/-- the R box lies in the cube of centre q_c after the piece rotation k: w = conj(q_c) * q * conj(q_k),
  |w_i| <= r0 w_0 at all 8 vertices, all with w_0 > 0 or all with w_0 < 0 (d37_tet_n05_far.r_in_cube). -/
def rInCube (P : Prm) (b : RBox) (qc qkbar : List Int) : Bool :=
  let qbar := [nth qc 0 0, -nth qc 1 0, -nth qc 2 0, -nth qc 3 0]
  [1, -1].any (fun (sg : Int) => (rVerts P.den b).all (fun v =>
    let w := qmulI (qmulI qbar v) qkbar
    let w0 := sg * nth w 0 0
    decide (w0 > 0) && [1, 2, 3].all (fun i => decide (iabs (nth w i 0) * (P.r0.2 : Int) ≤ P.r0.1 * w0))))

/-! ## Far: the R tree -/

/-- preorder sequence of the R tree: split / L (centre * 12 + piece rotation) / discard (rotation) / accept (code). -/
inductive Tok where
  | split
  | L (c : Nat)
  | D (m : Nat)
  | A (code : Nat)

/-- split3: halve the widest axis (smallest index on ties) (d37_tet_n05_far.split3). -/
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

/-- L leaf: the n box lies in N1 or in the point box (allowL), the centre has the same side, a tube centre needs the
  n box inside N1, a point centre inside [0, r0]^2, and the R box lies in the cube after the piece rotation k. -/
def lOk (P : Prm) (side : Nat) (nb : NBox) (rb : RBox) (c : Nat) : Bool :=
  (nInN1 P nb || nInP P nb) &&
  match P.cens[c / 12]?, P.kqs[c % 12]? with
  | some ce, some kq => ce.side == side && (if ce.tube then nInN1 P nb else nInP P nb) && rInCube P rb ce.q kq
  | _, _ => false

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

/-- the R tree (four charts) of one n box and one side: (pass, accepted, discarded, L).
  Preconditions: box shape, k_N denominator > 0, k_N = 0 on boxes meeting N1 (as d37_tet_n05_far.replay). -/
def nbRun (P : Prm) (nb : NBox) (side : Nat) (kN : RatI) (toks : List Tok) : Bool × Nat × Nat × Nat :=
  let pre := nboxWf nb && decide (kN.2 > 0) && decide (side < 2) && (kN.1 == 0 || !(overlapsN1 P nb))
  let s := toks.foldl (wstep P side nb kN) ⟨rRoots P.den, pre, 0, 0, 0⟩
  (s.ok && s.stack.isEmpty, s.nA, s.nD, s.nL)

/-! ## Far: the n tree (root [0,1]^2, out means a_lo + b_lo >= 1) -/

inductive NTok where
  | split
  | out
  | ok

/-- split2: halve the wider axis (a on ties) (d37_tet_n05_far.split2). -/
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

/-- the n tree closes and its ok leaves equal the box table in order: (pass, ok count, out count). -/
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

/-- sum of polynomials sorted by monomial (zero coefficients dropped; structural recursion with fuel). -/
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

/-- constants and variables in the 5 variables (a, b, p1, p2, p3) -/
def zm5 : Mono := [0, 0, 0, 0, 0]
def pconst (c : Int) : Poly := if c == 0 then [] else [(zm5, c)]
def pvar (i : Nat) : Poly := [(incAt zm5 i, 1)]

def pmul (p q : Poly) : Poly :=
  psum (p.map (fun x => psum (q.map (fun y => [(List.zipWith (· + ·) x.1 y.1, x.2 * y.2)]))))

/-- p * (c + w t_i) -/
def pmulAff (p : Poly) (c w : Int) (i : Nat) : Poly :=
  padd (psmul c p) (psmul w (p.map (fun x => (incAt x.1 i, x.2))))

def mdeg (m : Mono) : Nat := m.foldl (· + ·) 0

/-! ## Local: candidate polynomials of a centre -/

/-- integer quaternion times polynomial quaternion -/
def qmulP (p : List Int) (q : List Poly) : List Poly :=
  match p, q with
  | [w1, x1, y1, z1], [w2, x2, y2, z2] =>
    [psum [psmul w1 w2, psmul (-x1) x2, psmul (-y1) y2, psmul (-z1) z2],
     psum [psmul w1 x2, psmul x1 w2, psmul y1 z2, psmul (-z1) y2],
     psum [psmul w1 y2, psmul (-x1) z2, psmul y1 w2, psmul z1 x2],
     psum [psmul w1 z2, psmul x1 y2, psmul (-y1) x2, psmul z1 w2]]
  | _, _ => []

/-- M(q) (9 entries, row order) and |q|^2 as polynomials. -/
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

/-- M(q) and |q|^2 for q = q_c * (1, p1, p2, p3). -/
def centerMQ (ce : Cen) : List Poly × Poly :=
  rotP (qmulP ce.q [pconst 1, pvar 2, pvar 3, pvar 4])

/-- 2 M v_v (3 entries) = M (2 v_v) -/
def mv2 (M : List Poly) (v : Nat) : List Poly :=
  (List.range 3).map (fun l => psum ((List.range 3).map (fun i => psmul (nth (nth vt v []) i 0) (nth M (3 * l + i) []))))

def dotIP (w : List Int) (x : List Poly) : Poly := psum (List.zipWith psmul w x)
def dotPP (a b : List Poly) : Poly := psum (List.zipWith pmul a b)

/-- n of the side as polynomials in (a, b): A (1 - a - b, 1 - b, 1 - a - 2b), B (a + b - 1, a + 2b - 1, b - 1). -/
def nPoly (side : Nat) : List Poly :=
  let a := pvar 0; let b := pvar 1; let one := pconst 1
  if side == 0 then [psub (psub one a) b, psub one b, psub (psub one a) (psmul 2 b)]
  else [padd (padd a b) (pconst (-1)), padd (padd a (psmul 2 b)) (pconst (-1)), psub b one]

/-- a positive multiple of P_c (F / M: 512 * sd * KD, S: 2 * sd):
  F / M: |q|^2 (n.M v_top + 1/4 sum_f (n.(b_mf - b_f) + mu) L_f - (s0/2)(n.b_mf + mu) minus/plus kappa),
  S: |q|^2 (sum_f L_f - 2 s0), with L_f = b_f . M v_{v_f} or 1 (|q|^2). -/
def locP (P : Prm) (side : Nat) (MQ : List Poly × Poly) (c : Cand) : Poly :=
  let sn := P.s0.1; let sd : Int := P.s0.2; let KD := P.kd
  let M := MQ.1; let Q := MQ.2
  let Lf (f : Nat) : Poly :=
    let v := nth c.vs f 0
    if v == 4 then psmul 2 Q else dotIP (nth bvec f []) (mv2 M v)
  if c.typ == 2 then
    psub (psmul sd (psum ((List.range 4).map Lf))) (psmul (4 * sn) Q)
  else
    let n := nPoly side
    let mue := P.msign * c.mu
    let bm := nth bvec (mfOf side) []
    let nI (w : List Int) : Poly := psum (List.zipWith (fun x y => psmul x y) w n)
    let t0 := psmul (256 * sd * KD) (dotPP n (mv2 M c.top))
    let tf := psum ((List.range 4).map (fun f =>
      pmul (padd (psmul 64 (nI (vsub bm (nth bvec f [])))) (pconst mue)) (psmul (sd * KD) (Lf f))))
    let kq := padd (pconst (nth P.kap 0 0)) (padd (psmul (nth P.kap 1 0) (pvar 0)) (psmul (nth P.kap 2 0) (pvar 1)))
    let sq := padd (psmul (256 * sn * KD) (nI bm)) (pconst (4 * sn * KD * mue))
    let sg : Int := if side == 0 then -1 else 1
    psum [t0, tf, psmul (-1) (pmul sq Q), psmul (sg * 512 * sd) (pmul kq Q)]

/-- degree in the transverse coordinates zeta (tube: (b, p), point: (a, b, p)) -/
def zdeg (tube : Bool) (m : Mono) : Nat :=
  if tube then nth m 1 0 + nth m 2 0 + nth m 3 0 + nth m 4 0 else mdeg m

/-- split P into e0 (zeta degree 0) and Lambda (zeta = r zeta-hat, divided by r). Variables of Lambda:
  tube (a, r, b-hat, p-hat1, p-hat2, p-hat3), point (r, a-hat, b-hat, p-hat1, p-hat2, p-hat3)
  (same order as d37_tet_n05_local.split_poly). -/
def splitP (tube : Bool) (p : Poly) : Poly × Poly :=
  let e0 := p.filter (fun x => zdeg tube x.1 == 0)
  let lam := psum ((p.filter (fun x => zdeg tube x.1 != 0)).map (fun x =>
    let m := x.1; let dz := zdeg tube m
    let key : Mono := if tube then [nth m 0 0, dz - 1, nth m 1 0, nth m 2 0, nth m 3 0, nth m 4 0]
                      else [dz - 1, nth m 0 0, nth m 1 0, nth m 2 0, nth m 3 0, nth m 4 0]
    [(key, x.2)]))
  (e0, lam)

/-- e0 >= 0 on the base range: tube checks degree in a <= 1 and both ends (DU units), point a constant. -/
def e0Ok (du : Int) (tube : Bool) (e0 : Poly) (lo hi : List Int) : Bool :=
  if tube then
    let c0 := (e0.filter (fun x => nth x.1 0 0 == 0)).foldl (fun a x => a + x.2) 0
    let c1 := (e0.filter (fun x => nth x.1 0 0 == 1)).foldl (fun a x => a + x.2) 0
    e0.all (fun x => decide (nth x.1 0 0 ≤ 1)) &&
    decide (c0 * du + c1 * nth lo 0 0 ≥ 0) && decide (c0 * du + c1 * nth hi 0 0 ≥ 0)
  else
    e0.all (fun x => x.1.all (· == 0)) && decide (e0.foldl (fun a x => a + x.2) 0 ≥ 0)

/-- lower bound on [-1,1]^6 of DU^H * Lambda(centre + half width * t / DU) on the box (lo, hi in DU units)
  (same rule as d37_tet_n05_local.lam_lb: constant + min(0, .) of the terms with only even powers - |.| of the others). -/
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

/-- rational times D as an integer (checks divisibility). -/
def ratToD (D : Int) (x : RatI) : Option Int :=
  if x.2 != 0 && (x.1 * D) % (x.2 : Int) == 0 then some (x.1 * D / x.2) else none

/-- lower ends of zeta-hat (tube (b-hat, p-hat): (0, -1, -1, -1), point (a-hat, b-hat, p-hat): (0, 0, -1, -1, -1)) -/
def zlo (tube : Bool) : List Int := if tube then [0, -1, -1, -1] else [0, 0, -1, -1, -1]

/-- the faces (order of d37_tet_n05_local.root_leaves: per zeta-hat index +1, and -1 if the lower end is -1) -/
def faceList (tube : Bool) : List (Nat × Int) :=
  (List.range (zlo tube).length).foldr (fun i acc =>
    (i, 1) :: (if nth (zlo tube) i 0 < 0 then [(i, -1)] else []) ++ acc) []

/-- root box of face (fi, fv) (DU units): tube (a in [0, a_max], r in [0, r0], zeta-hat), point (r, zeta-hat). -/
def rootBox (P : Prm) (tube : Bool) (fi : Nat) (fv : Int) : Option (List Int × List Int) :=
  let zl := zlo tube
  let zL := (List.range zl.length).map (fun j => if j == fi then fv * P.du else nth zl j 0 * P.du)
  let zH := (List.range zl.length).map (fun j => if j == fi then fv * P.du else P.du)
  match ratToD P.du P.amax, ratToD P.du P.r0 with
  | some hm, some r =>
    if tube then some ([0, 0] ++ zL, [hm, r] ++ zH) else some ([0] ++ zL, [r] ++ zH)
  | _, _ => none

/-- normalising widths of the split (d37_tet_n05_local.norm_widths: a by a_max, r by r0, zeta-hat by 2) -/
def fullW (P : Prm) (tube : Bool) : List Int :=
  let hm := (ratToD P.du P.amax).getD 1; let r := (ratToD P.du P.r0).getD 1
  if tube then [hm, r, 2 * P.du, 2 * P.du, 2 * P.du, 2 * P.du] else [r, 2 * P.du, 2 * P.du, 2 * P.du, 2 * P.du, 2 * P.du]

inductive LTok where
  | split
  | acc (j : Nat)

structure LBox where
  lo : List Int
  hi : List Int

/-- split (d37_tet_n05_local.split): halve the axis with the largest width / normalising width (smallest index on ties). -/
def lsplit (full : List Int) (b : LBox) : LBox × LBox :=
  let w := List.zipWith (fun l h => h - l) b.lo b.hi
  let ax := (List.range w.length).foldl (fun a i =>
    if nth w i 0 * nth full a 1 > nth w a 0 * nth full i 1 then i else a) 0
  let mid := (nth b.lo ax 0 + nth b.hi ax 0) / 2
  (⟨b.lo, b.hi.set ax mid⟩, ⟨b.lo.set ax mid, b.hi⟩)

/-- the candidate table: (shape ok, e0, Lambda) -/
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

/-- the tree of face fidx (index in faceList) of centre ci: (pass, accepted). tab is the candidate code table,
  leaves refer to its indices. -/
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

/-- rational (the constructions keep the denominator > 0) -/
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
def rmax (a b : Rt) : Rt := if rle a b then b else a
/-- maximum of a non-empty list (the head for the empty tail) -/
def rmaxL (l : List Rt) : Rt := match l with
  | [] => rI 0
  | x :: xs => xs.foldl rmax x

/-- integer M(q) (|q|^2 times the rotation) -/
def mqI (q : List Int) : List (List Int) :=
  match q with
  | [w, a, b, c] =>
    [[w*w + a*a - b*b - c*c, 2*(a*b - w*c), 2*(a*c + w*b)],
     [2*(a*b + w*c), w*w - a*a + b*b - c*c, 2*(b*c - w*a)],
     [2*(a*c - w*b), 2*(b*c + w*a), w*w - a*a - b*b + c*c]]
  | _ => []

def nq (q : List Int) : Int := dotI q q

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

def isPieceRot (K : List (List Int)) : Bool :=
  isSignedPerm K && det3 K == 1 && vt.all (fun v => vt.contains (matVecI K v))

/-- the 11 piece rotations (identity excluded) are signed permutations with det 1 that keep the vertex set of the
  piece, are not the identity and are distinct (the discard rule uses that G and S are unchanged under R -> Rk). -/
def rotsOk (P : Prm) : Bool :=
  P.rots.all (fun K => isPieceRot K && K != [[1, 0, 0], [0, 1, 0], [0, 0, 1]]) &&
  P.rots.eraseDups.length == P.rots.length

/-- the 12 quaternions q_k of the L check: M(q_k) / |q_k|^2 is an integer piece rotation, and the 12 are distinct
  (so they are the whole rotation group of the piece). -/
def kqsOk (P : Prm) : Bool :=
  let mats := P.kqs.map (fun q => (mqI q).map (fun row => row.map (fun x => x / nq q)))
  P.kqs.all (fun q => decide (nq q > 0) && (mqI q).all (fun row => row.all (fun x => x % nq q == 0))) &&
  mats.all isPieceRot && mats.eraseDups.length == 12 && P.kqs.length == 12

def posR (r : RatI) : Bool := decide (0 < r.1) && decide (0 < r.2)

/-- shape of the constants: positive denominators, a_max, r0, s0 > 0, KD > 0, mu sign +1, local mu table positive. -/
def prmOk (P : Prm) : Bool :=
  decide (0 < P.nd) && decide (0 < P.den) && decide (0 < P.du) && decide (0 < P.kd) &&
  posR P.amax && posR P.r0 && posR P.s0 && P.msign == 1 && P.musLoc.all (fun m => decide (0 < m)) &&
  P.kap.length == 3 && (ratToD P.du P.amax).isSome && (ratToD P.du P.r0).isSome

/-- the container {b_f . x <= s/2} is the piece itself at s = 1: b_f . (2 v_v) is -3 for v = 3 - f and 1 otherwise. -/
def shapeOk : Bool :=
  (List.range 4).all (fun f => (List.range 4).all (fun v =>
    dotI (nth bvec f []) (nth vt v []) == (if v == 3 - f then -3 else 1)))

/-- the n range of each centre (tube: a in [0, a_max], b in [0, r0]; point: [0, r0]^2) lies in T (a + b <= 1) and the
  weights n.(b_mf - b_f) are >= 0 at its 4 corners (d37_tet_n05_local.region_check); and 2 a_max + 3 r0 <= 2
  (d37_tet_n05_far.consts). -/
def regionOk (P : Prm) : Bool :=
  let am := rR P.amax; let r := rR P.r0
  rle (radd (rmul (rI 2) am) (rmul (rI 3) r)) (rI 2) &&
  P.cens.all (fun ce =>
    let atop := if ce.tube then am else r
    [rI 0, atop].all (fun av => [rI 0, r].all (fun bv =>
      let n : List Rt := if ce.side == 0 then [rsub (rsub (rI 1) av) bv, rsub (rI 1) bv, rsub (rsub (rI 1) av) (rmul (rI 2) bv)]
                         else [radd (radd av bv) (rI (-1)), radd (radd av (rmul (rI 2) bv)) (rI (-1)), rsub bv (rI 1)]
      rle (radd av bv) (rI 1) &&
      (List.range 4).all (fun f => rle (rI 0) (rdot n ((vsub (nth bvec (mfOf ce.side) []) (nth bvec f [])).map rI))))))

/-- a centre is an image: the vertex set {M(q_c) 2v / |q_c|^2} of the centre equals {G R 2v} with R = R3 / 3 (R3 an
  integer matrix) and G a permutation matrix. -/
def imageOk (R3 : List (List Int)) (qc : List Int) (G : List (List Int)) : Bool :=
  isSignedPerm G && G.all (fun row => row.all (fun x => decide (x ≥ 0))) &&
  vt.all (fun v => vt.any (fun w =>
    (matVecI (mqI qc) v).map (· * 3) == (matVecI G (matVecI R3 w)).map (· * nq qc)))

/-- R3 / 3 is a rotation: R3 R3^T = 9 I, det R3 = 27 -/
def rot3Ok (R3 : List (List Int)) : Bool :=
  R3.map (fun row => R3.map (fun r2 => dotI row r2)) == [[9, 0, 0], [0, 9, 0], [0, 0, 9]] && det3 R3 == 27

/-- exact F(N, R) with R = R3 / 3 (d37_tet_n05_common.Ft_exact): max_v N.R v + 1/4 sum_f (m - N.b_f) H'_f - (s/2) m,
  H_f = max_v b_f . R v, H'_3 = max(H_3, s/2), m = max_f N.b_f. -/
def ftExact (N : List Rt) (R3 : List (List Int)) (s : Rt) : Rt :=
  let X := vt.map (fun v => (matVecI R3 v).map (fun x => (⟨x, 6⟩ : Rt)))
  let H0 := bvec.map (fun b => rmaxL (X.map (fun x => rdot (b.map rI) x)))
  let H := H0.set 3 (rmax (nth H0 3 (rI 0)) (rmul s ⟨1, 2⟩))
  let nb := bvec.map (fun b => rdot N (b.map rI))
  let m := rmaxL nb
  rsum ([rmaxL (X.map (fun x => rdot N x)), rneg (rmul (rmul s ⟨1, 2⟩) m)] ++
    (List.range 4).map (fun f => rmul (rmul (rsub m (nth nb f (rI 0))) ⟨1, 4⟩) (nth H f (rI 0))))

/-- the kappa coefficients are as defined (d37_tet_n05_common.kappa_coefs): a0 = F(n_A(0, 0), R1*),
  a1 = 2 (F(n_A(1/2, 0), R1*) - a0), and beta = B / KD. -/
def kappaOk (P : Prm) (R13 : List (List Int)) (beta : RatI) : Bool :=
  let s := rR P.s0
  let nA (a : Rt) : List Rt := [rsub (rI 1) a, rI 1, rsub (rI 1) a]
  let v0 := ftExact (nA (rI 0)) R13 s
  let v1 := ftExact (nA ⟨1, 2⟩) R13 s
  req v0 ⟨nth P.kap 0 0, P.kd⟩ && req (rmul (rsub v1 v0) (rI 2)) ⟨nth P.kap 1 0, P.kd⟩ &&
  req (rR beta) ⟨nth P.kap 2 0, P.kd⟩

/-! ## Upper bound (d37_tet_n05_replay_both.upper: five pieces at s = 2, exact rationals) -/

/-- the placement: four pieces in the corners c in vt of the container (translation c/2, orientation unchanged) and a
  central piece R = RP3 / 3 with translation t5. Checks: R is a rotation; all 20 vertices satisfy b_f . x <= s_up / 2;
  for each corner c the corner piece has c.x >= 1 and the other four have c.x <= 1 (the planes c.x = 1 separate them). -/
def upperOk (RP3 : List (List Int)) (sUp : Rt) (t5 : List Rt) : Bool :=
  let half (v : List Int) : List Rt := v.map (fun x => ⟨x, 2⟩)
  let corner (c : List Int) : List (List Rt) := vt.map (fun v => List.zipWith radd (half c) (half v))
  let central := vt.map (fun v => List.zipWith radd ((matVecI RP3 v).map (fun x => (⟨x, 6⟩ : Rt))) t5)
  let pcs := vt.map corner ++ [central]
  let dotc (c : List Int) (x : List Rt) : Rt := rdot (c.map rI) x
  rot3Ok RP3 && rpos sUp && t5.all rpos &&
  pcs.all (fun p => p.all (fun x => bvec.all (fun b => rle (dotc b x) (rmul sUp ⟨1, 2⟩)))) &&
  (List.range 4).all (fun k =>
    let c := nth vt k []
    (nth pcs k []).all (fun x => rle (rI 1) (dotc c x)) &&
    (List.range 5).all (fun m => m == k || (nth pcs m []).all (fun x => rle (dotc c x) (rI 1))))

end PackLean.D37N05
