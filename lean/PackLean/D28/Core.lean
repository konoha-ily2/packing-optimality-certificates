/-! Shared parts for re-checking in Lean the arithmetic of the D28 global-optimality certificates (icointet_n02, cubintet_n02) (2026-11-12).

Independently of the Python code (`verifier/d28_*.py`), the same decisions are rewritten with integers and elements of the field Q(√p₁, √p₂).
Mathlib is not used (Bool checks are only evaluated with `decide`). The reasoning (reductions, meaning of the box decisions, meaning of the coverage) is not formalized.

* Field elements `FE`: lists of Int (length 2^k, same order as FE.c in Python: bit i of the index is √p_i).
  `ps` lists the primes "from the top" ([3, 2] for cubintet, [5] for icointet).
* Far: on n box × R box, Lean builds by itself from the box coordinates the same lower bounds as Python's `box_lb` (accept A), `discard_lb` (discard D) and `r_inside_L` (L)
  (quadratic forms of Rq, linear forms in the coefficients, lower bounds with √ enclosed by integers of width 2^-120).
  The R trees and the n tree are received as preorder "split / leaf" sequences, and Lean builds the boxes with the same split rule (also checking that the sequence closes as a tree).
* Local: zero-order identity at the centre and box lower bounds in (r, θ) per face (same rules as `d28_local.py`). Lean builds the polynomials
  from the centre, the vertices, c* and β.
-/

namespace PackLean.D28

/-! ## Elements of the field Q(√p₁, …) (integer coefficients) -/

abbrev FE := List Int

def fadd (a b : FE) : FE := List.zipWith (· + ·) a b
def fsub (a b : FE) : FE := List.zipWith (· - ·) a b
def fneg (a : FE) : FE := a.map (fun x => -x)
def fsmul (c : Int) (a : FE) : FE := a.map (fun x => c * x)
def fzero (nb : Nat) : FE := List.replicate nb 0
def fone (nb : Nat) : FE := 1 :: List.replicate (nb - 1) 0
def fofInt (nb : Nat) (c : Int) : FE := c :: List.replicate (nb - 1) 0
def fIsZero (a : FE) : Bool := a.all (· == 0)

/-- Multiplication. (a₀ + a₁√p)(b₀ + b₁√p) = (a₀b₀ + p a₁b₁) + (a₀b₁ + a₁b₀)√p, recursively in the subfield. -/
def fmul : List Nat → FE → FE → FE
  | [], a, b => [a.headD 0 * b.headD 0]
  | p :: ps, a, b =>
    let h := a.length / 2
    let a0 := a.take h; let a1 := a.drop h
    let b0 := b.take h; let b1 := b.drop h
    fadd (fmul ps a0 b0) (fsmul (p : Int) (fmul ps a1 b1)) ++ fadd (fmul ps a0 b1) (fmul ps a1 b0)

/-- Sign (same rule as Python's `_tsign`: if a and b√p have opposite signs, decided by the sign of a² − p b²). -/
def fsign : List Nat → FE → Int
  | [], a => Int.sign (a.headD 0)
  | p :: ps, x =>
    let h := x.length / 2
    let a := x.take h; let b := x.drop h
    let sa := fsign ps a; let sb := fsign ps b
    if sb == 0 then sa else if sa == 0 then sb else if sa == sb then sa else
      let d := fsign ps (fsub (fmul ps a a) (fsmul (p : Int) (fmul ps b b)))
      if d > 0 then sa else if d < 0 then sb else 0

/-- Field element with rational coefficients: num / den (den > 0). -/
structure QF where
  num : FE
  den : Nat
  deriving Repr, Inhabited

def QF.add (a b : QF) : QF := ⟨fadd (fsmul b.den a.num) (fsmul a.den b.num), a.den * b.den⟩
def QF.sub (a b : QF) : QF := ⟨fsub (fsmul b.den a.num) (fsmul a.den b.num), a.den * b.den⟩
def QF.mul (ps : List Nat) (a b : QF) : QF := ⟨fmul ps a.num b.num, a.den * b.den⟩
def QF.ofInt (nb : Nat) (c : Int) : QF := ⟨fofInt nb c, 1⟩
def QF.ofRat (nb : Nat) (n : Int) (d : Nat) : QF := ⟨fofInt nb n, d⟩
def QF.sign (ps : List Nat) (a : QF) : Int := fsign ps a.num
def QF.isZero (a : QF) : Bool := fIsZero a.num
def QF.wf (a : QF) : Bool := decide (0 < a.den)
/-- a ≤ b -/
def QF.le (ps : List Nat) (a b : QF) : Bool := decide (QF.sign ps (QF.sub b a) ≥ 0)

/-! ## Problem constants (exported from Python) -/

structure Region where
  ch : Nat
  center : List QF          -- 3 components (centre in the coordinates of chart ch)
  rlo : List QF             -- lower ends of ranges (3 components)
  rhi : List QF
  rho : QF
  deriving Inhabited

structure Prob where
  ps : List Nat             -- primes (from the top)
  nb : Nat                  -- 2^|ps|
  sqb : List (Int × Int)    -- integer enclosures [a, b] of √(MASKP[m])·2^120 ([2^120, 2^120] for m = 0)
  maskp : List Nat          -- MASKP[m]
  sqk : Nat                 -- 120
  verts : List (List FE)    -- vertices (integer field elements multiplied by the common denominator dv, 3 components)
  dv : Nat
  bvec : List (List Int)    -- container normals b_f (4)
  btop : Nat                -- m(n) = b_top·n (= 2)
  c0 : QF                   -- c*
  beta : QF                 -- β
  nden : Int                -- denominator of n coordinates 2^30
  rden : Int                -- denominator of R coordinates 2^44
  rots : List (List (List FE))   -- rotation group of the piece (integers multiplied by the common denominator dk, 3×3)
  dk : Nat
  regions : List Region
  lnx0 : Int × Nat          -- lower end of LN_X (rational)
  lnx1 : Int × Nat
  lny : Int × Nat
  -- local
  astar : QF                -- x*
  xi0 : Int × Nat           -- XI_RANGE
  xi1 : Int × Nat

/-! ## Lower and upper ends (integers) of Σ_m c_m √MASKP[m] with the 2^-120 enclosures -/

def loHi (sqb : List (Int × Int)) (c : FE) : Int × Int :=
  (List.zip c sqb).foldl (fun (acc : Int × Int) (x : Int × (Int × Int)) =>
    let (cm, (a, b)) := x
    if cm > 0 then (acc.1 + cm * a, acc.2 + cm * b)
    else if cm < 0 then (acc.1 + cm * b, acc.2 + cm * a)
    else acc) (0, 0)

/-- Contribution of one monomial to the lower bound (Python's `lower_bound`). kind 0: constant, 1: even powers only, 2: other. -/
def monoLb (kind : Nat) (lh : Int × Int) : Int :=
  match kind with
  | 0 => lh.1
  | 1 => min 0 lh.1
  | _ => -(max lh.1.natAbs lh.2.natAbs : Int)

/-! ## Far: quadratic forms on an R box -/

/-- Linear form c + w₁s₁ + w₂s₂ + w₃s₃ -/
structure Aff where
  c : Int
  w1 : Int
  w2 : Int
  w3 : Int

/-- Coefficients of a quadratic form [1, s1, s2, s3, s1², s1s2, s1s3, s2², s2s3, s3²] -/
abbrev Quad := List Int

def affMul (a b : Aff) : Quad :=
  [a.c * b.c, a.c * b.w1 + a.w1 * b.c, a.c * b.w2 + a.w2 * b.c, a.c * b.w3 + a.w3 * b.c,
   a.w1 * b.w1, a.w1 * b.w2 + a.w2 * b.w1, a.w1 * b.w3 + a.w3 * b.w1,
   a.w2 * b.w2, a.w2 * b.w3 + a.w3 * b.w2, a.w3 * b.w3]

def qadd (a b : Quad) : Quad := List.zipWith (· + ·) a b
def qsub (a b : Quad) : Quad := List.zipWith (· - ·) a b
def qsmul (c : Int) (a : Quad) : Quad := a.map (fun x => c * x)

/-- Kind of a monomial of the quadratic form (constant, square, other). If e is nonzero (contains sx or sy), all are "other". -/
def quadKind (e μ : Nat) : Nat :=
  if e == 0 then (if μ == 0 then 0 else if μ == 4 || μ == 7 || μ == 9 then 1 else 2) else 2

/-- R box: chart ch, coordinates lo and hi (units of 1/DEN). -/
structure RBox where
  ch : Nat
  l0 : Int
  l1 : Int
  l2 : Int
  h0 : Int
  h1 : Int
  h2 : Int

/-- The 4 quaternion components (with d = DEN inserted for chart ch) as linear forms. -/
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

/-- Whether the box widths are positive and even. -/
def rboxWf (b : RBox) : Bool :=
  decide (b.l0 < b.h0) && decide (b.l1 < b.h1) && decide (b.l2 < b.h2) &&
  (b.h0 - b.l0) % 2 == 0 && (b.h1 - b.l1) % 2 == 0 && (b.h2 - b.l2) % 2 == 0 && decide (b.ch < 4)

/-- Rq (9 entries, row order) and N. Same formula as rot_q. -/
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

/-- Σ_t coef_t ⊗ quad_t (coef field elements, quad integers) as 10 field elements. -/
def combine (nb : Nat) (terms : List (FE × Quad)) : List FE :=
  terms.foldl (fun acc (t : FE × Quad) => List.zipWith (fun a r => fadd a (fsmul r t.1)) acc t.2)
    (List.replicate 10 (fzero nb))

/-- Lower bound from the 10 coefficients of the three parts (e = 1, sx, sy). -/
def lbOf (P : Prob) (G : List (List FE)) : Int :=
  (List.zip (List.range 3) G).foldl (fun acc (eg : Nat × List FE) =>
    (List.zip (List.range 10) eg.2).foldl (fun acc2 (mc : Nat × FE) =>
      acc2 + monoLb (quadKind eg.1 mc.1) (loHi P.sqb mc.2)) acc) 0

/-! ## Far: n boxes and linear forms in the coefficients -/

/-- n box (units of 1/NDEN) and the constant of κ, k = knum/kden. -/
structure NBox where
  l0 : Int
  l1 : Int
  h0 : Int
  h1 : Int
  knum : Int
  kden : Nat

def nboxWf (b : NBox) : Bool :=
  decide (b.l0 < b.h0) && decide (b.l1 < b.h1) && (b.h0 - b.l0) % 2 == 0 && (b.h1 - b.l1) % 2 == 0 &&
  decide (0 < b.kden)

def nth (l : List α) (i : Nat) (d : α) : α := l.getD i d

def vecGet (v : List FE) (j : Nat) (nb : Nat) : FE := v.getD j (fzero nb)

/-- Lower bound for accept A (the same polynomial as Python's box_lb, up to a positive constant factor).
  Lower bound on [−1,1]^5 of G·N·(NDEN·4·dv·L·2^120·DEN²). L = cden·bden·kden. -/
def farLb (P : Prob) (nb : NBox) (rb : RBox) (v0 : Nat) (vf : List Nat) : Int :=
  let k := P.nb
  let Xc := (nb.l0 + nb.h0) / 2; let Xw := (nb.h0 - nb.l0) / 2
  let Yc := (nb.l1 + nb.h1) / 2; let Yw := (nb.h1 - nb.l1) / 2
  -- each component of n·NDEN as coefficients of (1, sx, sy)
  let nN : List (List Int) := [[Xc, Xw, 0], [Yc, 0, Yw], [P.nden, 0, 0]]
  let bt := nth P.bvec P.btop []
  let dotN (b : List Int) (e : Nat) : Int :=
    (List.zip b nN).foldl (fun s (x : Int × List Int) => s + x.1 * nth x.2 e 0) 0
  let L : Int := (P.c0.den : Int) * P.beta.den * nb.kden
  let V0 := nth P.verts v0 []
  -- co_ij[e]
  let coE (i j e : Nat) : FE :=
    let base := fsmul (4 * nth (nth nN i []) e 0) (vecGet V0 j k)
    let rest := (List.range 4).foldl (fun acc f =>
      if f == P.btop then acc else
        let bf := nth P.bvec f []
        let wf := dotN (List.zipWith (· - ·) bt bf) e
        fadd acc (fsmul (wf * nth bf i 0) (vecGet (nth P.verts (nth vf f 0) []) j k))) (fzero k)
    fsmul L (fadd base rest)
  let coN (e : Nat) : FE :=
    let mN := dotN bt e
    let t1 := fsmul (mN * P.beta.den * nb.kden) P.c0.num
    let t2 := if e == 0 then fofInt k (P.nden * nb.knum * P.c0.den * P.beta.den) else fzero k
    let t3 := fsmul (nth (nth nN 1 []) e 0 * P.c0.den * nb.kden) P.beta.num
    fsmul (-(4 * (P.dv : Int))) (fadd (fadd t1 t2) t3)
  let (Rq, N) := rotQ (rboxQ P.rden rb)
  let G := (List.range 3).map (fun e =>
    combine k (((List.range 9).map (fun ij => (coE (ij / 3) (ij % 3) e, nth Rq ij []))) ++ [(coN e, N)]))
  lbOf P G

/-- Discard D: lower bound of tr(R k) − tr(R) (times N, up to a positive constant factor). -/
def discLb (P : Prob) (rb : RBox) (m : Nat) : Int :=
  let K := nth P.rots m []
  let (Rq, _) := rotQ (rboxQ P.rden rb)
  -- Σ_ij (k_ji − δ_ij) Rq_ij (made integral: times dk)
  let terms := (List.range 9).map (fun ij =>
    let i := ij / 3; let j := ij % 3
    let kji := vecGet (nth K j []) i P.nb
    (if i == j then fsub kji (fofInt P.nb P.dk) else kji, nth Rq ij []))
  let G := combine P.nb terms
  (List.zip (List.range 10) G).foldl (fun acc (mc : Nat × FE) =>
    acc + monoLb (quadKind 0 mc.1) (loHi P.sqb mc.2)) 0

/-- Rational comparison a/ad ≤ b/bd -/
def ratLe (a : Int) (ad : Nat) (b : Int) (bd : Nat) : Bool := decide (a * bd ≤ b * ad)

/-- Whether an n box lies in the local n range LN. -/
def nInsideL (P : Prob) (nb : NBox) : Bool :=
  ratLe P.lnx0.1 P.lnx0.2 nb.l0 P.nden.toNat && ratLe nb.h0 P.nden.toNat P.lnx1.1 P.lnx1.2 &&
  ratLe (-P.lny.1) P.lny.2 nb.l1 P.nden.toNat && ratLe nb.h1 P.nden.toNat P.lny.1 P.lny.2

/-- Whether an R box lies in one of the local boxes (exact in the field even if the centre is irrational). -/
def rInsideL (P : Prob) (rb : RBox) : Bool :=
  P.regions.any (fun rg =>
    rg.ch == rb.ch &&
    (List.zip (List.range 3) [(rb.l0, rb.h0), (rb.l1, rb.h1), (rb.l2, rb.h2)]).all (fun (x : Nat × (Int × Int)) =>
      let i := x.1; let (lo, hi) := x.2
      let c := nth rg.center i (QF.ofInt P.nb 0)
      let a := QF.add c (QF.mul P.ps rg.rho (nth rg.rlo i (QF.ofInt P.nb 0)))
      let b := QF.add c (QF.mul P.ps rg.rho (nth rg.rhi i (QF.ofInt P.nb 0)))
      QF.le P.ps a (QF.ofRat P.nb lo P.rden.toNat) && QF.le P.ps (QF.ofRat P.nb hi P.rden.toNat) b))

/-! ## Tree sequences -/

/-- Preorder sequence of an R tree: split / L / discard (index of the rotation) / accept (v0 and the vertices of the 4 faces). -/
inductive Tok where
  | split
  | L
  | D (m : Nat)
  | A (v0 f0 f1 f2 f3 : Nat)

/-- split3: halve the axis of largest width (ties to the smaller index). -/
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

def leafOk (P : Prob) (nb : NBox) (inL : Bool) (rb : RBox) : Tok → Bool
  | .split => false
  | .L => inL && nb.knum == 0 && rInsideL P rb
  | .D m => decide (m < P.rots.length) && decide (discLb P rb m > 0)
  | .A v0 f0 f1 f2 f3 =>
    let nv := P.verts.length
    decide (v0 < nv) && decide (f0 < nv) && decide (f1 < nv) && decide (f2 < nv) && decide (f3 < nv) &&
    decide (farLb P nb rb v0 [f0, f1, f2, f3] ≥ 0)

/-- State (stack of remaining boxes, pass so far, counts of accept, discard and L). -/
structure WState where
  stack : List RBox
  ok : Bool
  nA : Nat
  nD : Nat
  nL : Nat

def wstep (P : Prob) (nb : NBox) (inL : Bool) (s : WState) (t : Tok) : WState :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    match t with
    | .split =>
      let (c1, c2) := split3 b
      { s with stack := c1 :: c2 :: rest, ok := s.ok && rboxWf b && decide (b.h0 - b.l0 > 2 ∨ b.h1 - b.l1 > 2 ∨ b.h2 - b.l2 > 2) }
    | .L => { s with stack := rest, ok := s.ok && rboxWf b && leafOk P nb inL b t, nL := s.nL + 1 }
    | .D _ => { s with stack := rest, ok := s.ok && rboxWf b && leafOk P nb inL b t, nD := s.nD + 1 }
    | .A .. => { s with stack := rest, ok := s.ok && rboxWf b && leafOk P nb inL b t, nA := s.nA + 1 }

def rRoots (den : Int) : List RBox :=
  (List.range 4).map (fun ch => ⟨ch, -den, -den, -den, den, den, den⟩)

/-- Walk the whole R tree (4 charts) of one n box. -/
def rtreeRun (P : Prob) (nb : NBox) (toks : List Tok) : WState :=
  let inL := nInsideL P nb
  let s := toks.foldl (wstep P nb inL) ⟨rRoots P.rden, nboxWf nb, 0, 0, 0⟩
  { s with ok := s.ok && s.stack.isEmpty }

/-- Pair (N, σN): σN is the box with y reflected; the k-sum is 0. -/
structure Pair where
  nb : NBox
  kmNum : Int        -- k of σN (Lean checks that the sum is 0)
  kmDen : Nat
  toksN : List Tok
  toksM : List Tok

def mirror (b : NBox) (knum : Int) (kden : Nat) : NBox := ⟨b.l0, -b.h1, b.h0, -b.l1, knum, kden⟩

def pairRuns (P : Prob) (p : Pair) : WState × WState :=
  (rtreeRun P p.nb p.toksN, rtreeRun P (mirror p.nb p.kmNum p.kmDen) p.toksM)

def pairOk (P : Prob) (p : Pair) : Bool :=
  let (a, b) := pairRuns P p
  decide (0 < p.kmDen) && decide (p.nb.knum * p.kmDen + p.kmNum * p.nb.kden = 0) && a.ok && b.ok

/-! ## The n tree (upper half [0,1]×[0,1]; the lower half via the mirror pairs) -/

inductive NTok where
  | split
  | out
  | ok

def split2 (b : NBox) : NBox × NBox :=
  let w0 := b.h0 - b.l0; let w1 := b.h1 - b.l1
  if w0 ≥ w1 then let m := (b.l0 + b.h0) / 2; ({ b with h0 := m }, { b with l0 := m })
  else let m := (b.l1 + b.h1) / 2; ({ b with h1 := m }, { b with l1 := m })

structure NState where
  stack : List NBox
  boxes : List (Int × Int × Int × Int)   -- pair boxes not yet matched (in sequence order)
  ok : Bool
  nOk : Nat
  nOut : Nat

def nstep (s : NState) (t : NTok) : NState :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    match t with
    | .split =>
      let (c1, c2) := split2 b
      { s with stack := c1 :: c2 :: rest, ok := s.ok && decide (b.h0 - b.l0 > 2 ∨ b.h1 - b.l1 > 2) }
    | .out => { s with stack := rest, ok := s.ok && decide (b.l1 > b.h0), nOut := s.nOut + 2 }
    | .ok =>
      match s.boxes with
      | [] => { s with ok := false }
      | (a0, a1, a2, a3) :: bs =>
        { s with stack := rest, boxes := bs, nOk := s.nOk + 2,
                 ok := s.ok && a0 == b.l0 && a1 == b.l1 && a2 == b.h0 && a3 == b.h1 }

/-- The n tree closes and its ok leaves agree in order with the pair boxes. -/
def ntreeOk (nden : Int) (toks : List NTok) (boxes : List (Int × Int × Int × Int)) : Bool :=
  let s := toks.foldl nstep ⟨[⟨0, 0, nden, nden, 0, 1⟩], boxes, true, 0, 0⟩
  s.ok && s.stack.isEmpty && s.boxes.isEmpty

/-! ## Checks of the constants (once) -/

/-- Enclosure of √p: a² ≤ p·4^k < b², b = a + 1 (exactly 2^k for m = 0). -/
def sqbOk (P : Prob) : Bool :=
  P.sqb.length == P.nb && P.maskp.length == P.nb &&
  (List.zip P.sqb P.maskp).all (fun (x : (Int × Int) × Nat) =>
    let (a, b) := x.1; let p : Int := x.2
    if p == 1 then a == 2 ^ P.sqk && b == 2 ^ P.sqk
    else decide (0 ≤ a) && b == a + 1 && decide (a * a ≤ p * 4 ^ P.sqk) && decide (p * 4 ^ P.sqk < b * b))

def matVec (ps : List Nat) (K : List (List FE)) (v : List FE) : List FE :=
  K.map (fun row => (List.zip row v).foldl (fun acc (x : FE × FE) => fadd acc (fmul ps x.1 x.2)) (fzero (2 ^ ps.length)))

/-- Every element K (times dk) of the rotation group satisfies KᵀK = dk²I, det K = dk³, and preserves the vertex set (K v ∈ dk·V). -/
def rotsOk (P : Prob) : Bool :=
  let d : Int := P.dk
  P.rots.all (fun K =>
    let col (j : Nat) : List FE := K.map (fun row => vecGet row j P.nb)
    let dotv (u v : List FE) : FE := (List.zip u v).foldl (fun acc (x : FE × FE) => fadd acc (fmul P.ps x.1 x.2)) (fzero P.nb)
    let orth := (List.range 9).all (fun ij =>
      let i := ij / 3; let j := ij % 3
      dotv (col i) (col j) == (if i == j then fofInt P.nb (d * d) else fzero P.nb))
    let g (i j : Nat) : FE := vecGet (nth K i []) j P.nb
    let det := fsub (fadd (fadd (fmul P.ps (g 0 0) (fsub (fmul P.ps (g 1 1) (g 2 2)) (fmul P.ps (g 1 2) (g 2 1))))
                        (fmul P.ps (g 0 2) (fsub (fmul P.ps (g 1 0) (g 2 1)) (fmul P.ps (g 1 1) (g 2 0))))) (fzero P.nb))
                    (fmul P.ps (g 0 1) (fsub (fmul P.ps (g 1 0) (g 2 2)) (fmul P.ps (g 1 2) (g 2 0))))
    let perm := P.verts.all (fun v =>
      let kv := matVec P.ps K v
      P.verts.any (fun w => kv == w.map (fsmul d)))
    orth && det == fofInt P.nb (d * d * d) && perm)

/-- Piece check: vertices distinct, minimal edge length² is 1 (compared times dv²), deg edges at each vertex. -/
def pieceOk (P : Prob) (nv deg : Nat) : Bool :=
  let d2 (u v : List FE) : FE :=
    (List.zip u v).foldl (fun acc (x : FE × FE) => let t := fsub x.1 x.2; fadd acc (fmul P.ps t t)) (fzero P.nb)
  let one := fofInt P.nb ((P.dv : Int) * P.dv)
  P.verts.length == nv && P.verts.eraseDups.length == nv &&
  P.verts.all (fun v => P.verts.all (fun w => v == w ||
    decide (fsign P.ps (fsub (d2 v w) one) ≥ 0))) &&
  P.verts.all (fun v => (P.verts.filter (fun w => d2 v w == one)).length == deg)

/-! ## Local: sparse polynomials (5 variables, field coefficients) -/

abbrev Mono := List Nat
abbrev Poly := List (Mono × FE)

def monoLt : Mono → Mono → Bool
  | [], [] => false
  | a :: as, b :: bs => if a == b then monoLt as bs else decide (a < b)
  | _, _ => false

/-- Sum of polynomials sorted by ascending monomials (lexicographic) (structural recursion with fuel). -/
def paddF : Nat → Poly → Poly → Poly
  | 0, p, q => p ++ q
  | _ + 1, [], q => q
  | _ + 1, p, [] => p
  | f + 1, (m, a) :: ps, (n, b) :: qs =>
    if m == n then (m, fadd a b) :: paddF f ps qs
    else if monoLt m n then (m, a) :: paddF f ps ((n, b) :: qs)
    else (n, b) :: paddF f ((m, a) :: ps) qs

def padd (p q : Poly) : Poly := paddF (p.length + q.length) p q

def psmulZ (c : Int) (p : Poly) : Poly := p.map (fun (m, a) => (m, fsmul c a))
def psmulF (ps : List Nat) (c : FE) (p : Poly) : Poly := p.map (fun (m, a) => (m, fmul ps c a))

def incAt : Mono → Nat → Mono
  | [], _ => []
  | a :: as, 0 => (a + 1) :: as
  | a :: as, i + 1 => a :: incAt as i

/-- p·(c + w·s_i) (c and w integers) -/
def pmulAff (p : Poly) (c w : Int) (i : Nat) : Poly :=
  padd (psmulZ c p) (psmulZ w (p.map (fun (m, a) => (incAt m i, a))))

def psum (l : List Poly) : Poly := l.foldl padd []

/-- p·q (field coefficients) -/
def pmul (ps : List Nat) (p q : Poly) : Poly :=
  psum (p.map (fun (m, a) => q.map (fun (n, b) => (List.zipWith (· + ·) m n, fmul ps a b))))

/-- Polynomial with a common denominator num / den -/
structure PQ where
  p : Poly
  d : Nat

def PQ.add (a b : PQ) : PQ := ⟨padd (psmulZ b.d a.p) (psmulZ a.d b.p), a.d * b.d⟩
def PQ.mul (ps : List Nat) (a b : PQ) : PQ := ⟨pmul ps a.p b.p, a.d * b.d⟩
def PQ.const (nb : Nat) (c : QF) : PQ := ⟨[([0, 0, 0, 0, 0], c.num)], c.den⟩
def PQ.var (nb : Nat) (i : Nat) : PQ := ⟨[(incAt [0, 0, 0, 0, 0] i, fone nb)], 1⟩
def PQ.scale (ps : List Nat) (c : QF) (a : PQ) : PQ := ⟨psmulF ps c.num a.p, c.den * a.d⟩

def zeroMono : Mono := [0, 0, 0, 0, 0]

def constTerm (nb : Nat) (p : Poly) : FE :=
  p.foldl (fun acc (m, a) => if m == zeroMono then fadd acc a else acc) (fzero nb)

/-- Local parts (polynomials in z = (ξ, y, p1, p2, p3)): per top vertex v0, per face f and vertex v, and the constant part. -/
structure LocalParts where
  compV0 : List PQ            -- per vertex
  compF : List (List PQ)      -- per face f (0..3), per vertex
  const : PQ

def localParts (P : Prob) (rg : Region) : LocalParts :=
  let k := P.nb; let ps := P.ps
  let us : List PQ := (List.range 3).map (fun i => PQ.add (PQ.const k (nth rg.center i (QF.ofInt k 0))) (PQ.var k (2 + i)))
  let one := PQ.const k (QF.ofInt k 1)
  let q : List PQ := match rg.ch with
    | 0 => one :: us
    | 1 => [nth us 0 one, one, nth us 1 one, nth us 2 one]
    | 2 => [nth us 0 one, nth us 1 one, one, nth us 2 one]
    | _ => us ++ [one]
  let w := nth q 0 one; let x := nth q 1 one; let y := nth q 2 one; let z := nth q 3 one
  let mul := PQ.mul ps
  let neg (a : PQ) : PQ := PQ.scale ps (QF.ofInt k (-1)) a
  let sub (a b : PQ) : PQ := PQ.add a (neg b)
  let two (a : PQ) : PQ := PQ.scale ps (QF.ofInt k 2) a
  let ww := mul w w; let xx := mul x x; let yy := mul y y; let zz := mul z z
  let Rq : List PQ :=
    [sub (sub (PQ.add ww xx) yy) zz, two (sub (mul x y) (mul w z)), two (PQ.add (mul x z) (mul w y)),
     two (PQ.add (mul x y) (mul w z)), sub (sub (PQ.add ww yy) xx) zz, two (sub (mul y z) (mul w x)),
     two (sub (mul x z) (mul w y)), two (PQ.add (mul y z) (mul w x)), sub (sub (PQ.add ww zz) xx) yy]
  let N := PQ.add (PQ.add ww xx) (PQ.add yy zz)
  let n : List PQ := [PQ.add (PQ.const k P.astar) (PQ.var k 0), PQ.var k 1, one]
  let vQ (v : Nat) (j : Nat) : QF := ⟨vecGet (nth P.verts v []) j k, P.dv⟩
  let bQ (f i : Nat) : QF := QF.ofInt k (nth (nth P.bvec f []) i 0)
  -- Σ_i a_i Σ_kk Rq_ikk v_kk
  let form (a : List PQ) (v : Nat) : PQ :=
    (List.range 3).foldl (fun acc i =>
      (List.range 3).foldl (fun acc2 kk =>
        PQ.add acc2 (mul (nth a i one) (PQ.scale ps (vQ v kk) (nth Rq (3 * i + kk) one)))) acc) ⟨[], 1⟩
  let bt := P.btop
  let wF (f : Nat) : PQ := (List.range 3).foldl (fun acc i =>
      PQ.add acc (PQ.scale ps (QF.sub (bQ bt i) (bQ f i)) (nth n i one))) ⟨[], 1⟩
  let m : PQ := (List.range 3).foldl (fun acc i => PQ.add acc (PQ.scale ps (bQ bt i) (nth n i one))) ⟨[], 1⟩
  let bconst (f : Nat) : List PQ := (List.range 3).map (fun i => PQ.const k (bQ f i))
  let nv := P.verts.length
  { compV0 := (List.range nv).map (fun v => form n v)
    compF := (List.range 4).map (fun f => (List.range nv).map (fun v =>
      PQ.scale ps (QF.ofRat k 1 4) (mul (wF f) (form (bconst f) v))))
    const := neg (mul (PQ.add (PQ.scale ps P.c0 m) (PQ.scale ps P.beta (nth n 1 one))) N) }

/-- Parts of G for a candidate (v0, v_f …). fs are the faces other than b_top (0, 1, 3). -/
def candPQ (L : LocalParts) (fs : List Nat) (cd : List Nat) : PQ :=
  (List.zip fs (cd.drop 1)).foldl (fun acc (x : Nat × Nat) => PQ.add acc (nth (nth L.compF x.1 []) x.2 ⟨[], 1⟩))
    (PQ.add L.const (nth L.compV0 (cd.headD 0) ⟨[], 1⟩))

/-- Zero-order identity: G_c(0) = 0 for every candidate. -/
def identOk (P : Prob) (L : LocalParts) (fs : List Nat) (cands : List (List Nat)) : Bool :=
  cands.all (fun cd => fIsZero (constTerm P.nb (candPQ L fs cd).p))

/-- Change to face coordinates: monomial z^α → r^{|α|−1}·Π_{j≠i} t^{α_j}, coefficient times Π scl_j^{α_j}·sg^{α_i}.
  scl are rationals (num, den). Denominators are cleared by multiplying by den_j^{3−α_j} (checking that each variable has degree ≤ 3). -/
def faceH (scl : List (Int × Nat)) (i : Nat) (sg : Int) (p : Poly) : Option Poly :=
  let terms := p.filterMap (fun (m, a) =>
    if m == zeroMono then none else
    let tot := m.foldl (· + ·) 0
    let f : Int := (List.zip (List.range 5) (List.zip m scl)).foldl (fun acc (x : Nat × (Nat × (Int × Nat))) =>
      let (j, (e, (sn, sd))) := x
      acc * sn ^ e * (sd : Int) ^ (3 - e) * (if j == i then sg ^ e else 1)) 1
    let others := (List.zip (List.range 5) m).filterMap (fun (x : Nat × Nat) => if x.1 == i then none else some x.2)
    some ((tot - 1) :: others, fsmul f a, decide (m.all (· ≤ 3))))
  if terms.all (fun t => t.2.2) then some (psum (terms.map (fun t => [(t.1, t.2.1)]))) else none

/-- Lower bound on [−1,1]^5 of D^6·H(centre + W s / D) on the box (r, t1..t4) (units of 1/D). -/
def shiftLb (P : Prob) (D : Int) (H : Poly) (lo hi : List Int) : Option Int :=
  let Cc := List.zipWith (fun l h => (l + h) / 2) lo hi
  let W := List.zipWith (fun l h => (h - l) / 2) lo hi
  if H.any (fun (m, _) => decide (m.foldl (· + ·) 0 > 6)) then none else
  let S := psum (H.map (fun (m, a) =>
    let tot := m.foldl (· + ·) 0
    let base : Poly := [(zeroMono, fsmul (D ^ (6 - tot)) a)]
    (List.zip (List.range 5) m).foldl (fun acc (x : Nat × Nat) =>
      (List.range x.2).foldl (fun acc2 _ => pmulAff acc2 (nth Cc x.1 0) (nth W x.1 0) x.1) acc) base))
  some (S.foldl (fun acc (m, a) =>
    let kind := if m.all (· == 0) then 0 else if m.all (· % 2 == 0) then 1 else 2
    acc + monoLb kind (loHi P.sqb a)) 0)

inductive LTok where
  | split
  | acc (c : Nat)

structure LBox where
  lo : List Int
  hi : List Int

/-- Split rule for local boxes (Python: largest axis with the r width doubled; ties to the smaller index). -/
def lsplit (b : LBox) : LBox × LBox :=
  let w := List.zipWith (fun l h => h - l) b.lo b.hi
  let ws := (List.zip (List.range 5) w).map (fun (x : Nat × Int) => if x.1 == 0 then 2 * x.2 else x.2)
  let mx := ws.foldl max (ws.headD 0)
  let ax := ((List.range 5).find? (fun a => nth ws a 0 == mx)).getD 0
  let mid := (nth b.lo ax 0 + nth b.hi ax 0) / 2
  (⟨b.lo, b.hi.set ax mid⟩, ⟨b.lo.set ax mid, b.hi⟩)

structure LState where
  stack : List LBox
  ok : Bool
  nAcc : Nat

/-- Tree of one face: Hs are the integer polynomials per candidate (looked up by candidate index). -/
def lstep (P : Prob) (D : Int) (Hs : List Poly) (s : LState) (t : LTok) : LState :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    match t with
    | .split =>
      let (c1, c2) := lsplit b
      { s with stack := c1 :: c2 :: rest,
               ok := s.ok && (List.zipWith (fun l h => decide (h - l > 2)) b.lo b.hi).any id }
    | .acc c =>
      let r := match shiftLb P D (nth Hs c []) b.lo b.hi with
        | some v => decide (v > 0)
        | none => false
      { s with stack := rest, nAcc := s.nAcc + 1,
               ok := s.ok && decide (c < Hs.length) &&
                 (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id && r }

/-- Rational (n, d) as an integer in units of 1/D (also checks divisibility). -/
def ratToD (D : Int) (x : Int × Nat) : Option Int :=
  if (x.1 * D) % (x.2 : Int) == 0 then some (x.1 * D / x.2) else none

/-- One local box: zero-order identity and the tree of each face. faces are in Python's face order (z_i = ±1), with the sequence of each face. -/
def localRegionOk (P : Prob) (rg : Region) (fs : List Nat) (cands : List (List Nat))
    (faces : List (List LTok)) (D : Int) : Bool × Nat :=
  let L := localParts P rg
  let ident := identOk P L fs cands
  -- range of z (rationals (num, den)) and scale
  let rx : Int × Nat := if -P.xi0.1 * P.xi1.2 ≥ P.xi1.1 * P.xi0.2 then (-P.xi0.1, P.xi0.2) else P.xi1
  -- (a/b)/(c/d) = a d / (b c), rx > 0
  let divR (a : Int × Nat) (b : Int × Nat) : Int × Nat := (a.1 * b.2 * (if b.1 > 0 then 1 else -1), (a.2 * b.1.natAbs))
  -- ranges and rho are rational (only the centre may be irrational), so the first component of num of rlo/rhi/rho is used
  let qr (q : QF) : Int × Nat := (q.num.headD 0, q.den)
  let ratOk (q : QF) : Bool := (q.num.drop 1).all (· == 0)
  let zr : List ((Int × Nat) × (Int × Nat)) :=
    [(divR P.xi0 rx, divR P.xi1 rx), ((-1, 1), (1, 1))] ++ (List.zip rg.rlo rg.rhi).map (fun (a, b) => (qr a, qr b))
  let scl : List (Int × Nat) := [rx, P.lny, qr rg.rho, qr rg.rho, qr rg.rho]
  let rngOk := rg.rlo.all ratOk && rg.rhi.all ratOk && ratOk rg.rho && decide (0 < rx.1) &&
    zr.all (fun (a, b) => ratLe (-1) 1 a.1 a.2 && ratLe a.1 a.2 0 1 && ratLe 0 1 b.1 b.2 && ratLe b.1 b.2 1 1)
  -- list of faces (Python's order)
  let isOne (x : Int × Nat) : Bool := x.1 == (x.2 : Int)
  let isMOne (x : Int × Nat) : Bool := x.1 == -(x.2 : Int)
  let faceList : List (Nat × Int) := (List.range 5).foldl (fun acc i =>
    let (a, b) := nth zr i ((0, 1), (0, 1))
    acc ++ (if isOne b then [(i, 1)] else []) ++ (if isMOne a then [(i, -1)] else [])) []
  let res := (List.zip faceList faces).foldl (fun (acc : Bool × Nat) (x : (Nat × Int) × List LTok) =>
    let ((i, sg), toks) := x
    let tr := (List.zip (List.range 5) zr).filterMap (fun (y : Nat × ((Int × Nat) × (Int × Nat))) => if y.1 == i then none else some y.2)
    let lo0 : List Int := 0 :: tr.map (fun (a, _) => (ratToD D a).getD 1)
    let hi0 : List Int := D :: tr.map (fun (_, b) => (ratToD D b).getD 0)
    let trOk := tr.all (fun (a, b) => (ratToD D a).isSome && (ratToD D b).isSome)
    let Hs : List (Option Poly) := cands.map (fun cd =>
      let G := candPQ L fs cd
      faceH scl i sg G.p)
    let HsOk := Hs.all Option.isSome
    let Hs' := Hs.map (fun h => h.getD [])
    let s := toks.foldl (lstep P D Hs') ⟨[⟨lo0, hi0⟩], true, 0⟩
    (acc.1 && trOk && HsOk && s.ok && s.stack.isEmpty, acc.2 + s.nAcc)) (true, 0)
  (ident && rngOk && faceList.length == faces.length && res.1, res.2)

/-- The local n range contains the far L and lies in D_n (the same 3 lines as Python's need). -/
def rangesOk (P : Prob) : Bool :=
  let k := P.nb
  let a0 := QF.add P.astar (QF.ofRat k P.xi0.1 P.xi0.2)
  let a1 := QF.add P.astar (QF.ofRat k P.xi1.1 P.xi1.2)
  ratLe P.xi0.1 P.xi0.2 0 1 && ratLe 0 1 P.xi1.1 P.xi1.2 &&
  QF.le P.ps a0 (QF.ofRat k P.lnx0.1 P.lnx0.2) && QF.le P.ps (QF.ofRat k P.lnx1.1 P.lnx1.2) a1 &&
  QF.le P.ps (QF.ofRat k P.lny.1 P.lny.2) a0 && QF.le P.ps a1 (QF.ofInt k 1)

end PackLean.D28
