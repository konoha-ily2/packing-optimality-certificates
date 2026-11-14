import PackLean.D28.Core

/-! Re-check of the arithmetic of the dodintet_n02 certificate (D45, route Y: 2√2·c̄ ≤ s* ≤ 2√2·u_up), 2026-11-14.

Written independently of the Python checkers (`d45_dodintet_*.py`); the field is Q(√5) and the field elements, the
interval bound of √5, the R-box quadratics and the sparse polynomials are taken from `PackLean.D28.Core` (unchanged).
No Mathlib: Bool checks evaluated by `native_decide`. The reasoning (reduction T1-T4 of D28, the meaning of the leaf
tests, the meaning of the covers) is not formalised.

* Far (`boxRun`): one upper n box N (NDEN units) and its mirror σN, the pair type (I = (B, A), II = (A, B),
  III = (B, B)), the two offsets, and the two R trees as preorder strings. Lean builds the κ of each tree from k̂, the
  form and the offset, checks the pair sum κ_U + κ_L ≥ 0 at the four corners (and k_U + k_L = 0 for I and II), and
  for every leaf rebuilds the same lower bound as `d45_dodintet_far.box_lb` (accepted), `discard_lb` (discarded)
  and `r_in_cube` plus the parallelogram test (L), up to a positive factor.
* Local (`tubeRun`): from the tube constants (base point, direction, side direction, centre quaternion) Lean builds
  P_c = |q|²·F_c of every candidate as a polynomial in (u, w, p1, p2, p3), splits it into e0 (degree 0 in ζ) and Λ,
  and for every leaf checks e0 ≥ 0 at both ends of u and the lower bound of Λ > 0 (the rule of
  `d45_dodintet_local.lam_lb`, √5 bracketed at 2^-100).
* Constants (`constsOk`, `upperOk`): the piece, the 60 rotations, the weights on the tube corners, the upper-bound
  configuration and the sandwich.

Token alphabet (no backslash, no quote): digits "0-9A-Za-z" with values 0..61.
  R tree: '.' split, 'L' leaf handed to the local lemma, 'D' d discarded with rotation d, 'A' v f0 f1 f3 accepted.
  n tree: '.' split, 'o' pair box (next in the list), 'x' outside D_n (y > x on the whole box).
  local tree: '.' split, 'a' c accepted with candidate c.
-/

namespace PackLean.D45DT
open PackLean.D28

def PS : List Nat := [5]
def fm (a b : FE) : FE := fmul PS a b
def fsg (a : FE) : Int := fsign PS a
def fz : FE := [0, 0]
def fI (c : Int) : FE := [c, 0]

/-- container normals b_f and the face of m(n) on D_n -/
def BV : List (List Int) := [[-1, -1, -1], [-1, 1, 1], [1, -1, 1], [1, 1, -1]]
def BTOP : Nat := 2

def dval (c : Char) : Option Nat :=
  let n := c.toNat
  if 48 ≤ n ∧ n ≤ 57 then some (n - 48)
  else if 65 ≤ n ∧ n ≤ 90 then some (n - 55)
  else if 97 ≤ n ∧ n ≤ 122 then some (n - 61)
  else none

/-- a rational (num, den), den > 0 -/
abbrev Rat2 := Int × Nat

/-- one tube of the local lemma -/
structure Tube where
  side : Nat            -- 0 = A (kappa_A), 1 = B (kappa_B)
  ulo : Rat2
  uhi : Rat2
  r0 : Rat2
  dl : Nat              -- common denominator of p0, d, w
  p0 : List Int         -- base point (2 coordinates of the chart)
  d : List Int          -- direction of the base line
  w : List Int          -- side direction (ws = 1)
  q : List FE           -- centre quaternion (a positive multiple of q_c, integer field elements)
  deriving Inhabited

structure Prm where
  nd : Int                    -- NDEN = 2^30
  den : Int                   -- DEN = 2^44
  sqb : List (Int × Int)      -- far: [√1, √5]·2^120 bracketed
  sqk : Nat
  sqbL : List (Int × Int)     -- local: [√1, √5]·2^100 bracketed
  sqkL : Nat
  dv : Nat                    -- vertices times dv are integer field elements
  verts : List (List FE)
  cnum : Int                  -- c̄ = cnum / cden
  cden : Nat
  kd : Nat                    -- k̂ = kh / kd
  kh : List Int
  koff : Nat                  -- offsets of the far trees are integers over koff
  dk : Nat                    -- rotations times dk
  rots : List (List (List FE))
  tA : Tube
  tB : Tube
  deriving Inhabited

def tubeOf (P : Prm) (side : Nat) : Tube := if side == 0 then P.tA else P.tB

/-- κ of the form (0 = A, 1 = B) at the point p = σ^sig n, as a linear form in the n coordinates (x, y, 1), over kd.
  B: κ_B(p) = k̂·p; A: κ_A(p) = −k̂·σp. -/
def kapForm (P : Prm) (form sig : Nat) : List Int :=
  let k0 := nth P.kh 0 0; let k1 := nth P.kh 1 0; let k2 := nth P.kh 2 0
  if form == 1 then [k0, if sig == 0 then k1 else -k1, k2]
  else [-k0, if sig == 0 then k1 else -k1, -k2]

/-! ## far: the accepted bound -/

/-- n box (NDEN units) -/
structure NB where
  l0 : Int
  l1 : Int
  h0 : Int
  h1 : Int
  deriving Inhabited

/-- the lower bound of `box_lb` times a positive constant: S = 4·dv·cden·kd·NDEN·DEN²·2^120.
  sig = 0: point p = n; sig = 1: p = σn (n in N). kap: κ of the tree over kd (n coordinates). -/
def farLbT (P : Prm) (sig : Nat) (nb : NB) (kap : List Int) (rb : RBox) (v0 : Nat) (vf : List Nat) : Int :=
  let k := 2
  let Xc := (nb.l0 + nb.h0) / 2; let Xw := (nb.h0 - nb.l0) / 2
  let Yc := (nb.l1 + nb.h1) / 2; let Yw := (nb.h1 - nb.l1) / 2
  let s : Int := if sig == 0 then 1 else -1
  let pN : List (List Int) := [[Xc, Xw, 0], [s * Yc, 0, s * Yw], [P.nd, 0, 0]]
  let nN : List (List Int) := [[Xc, Xw, 0], [Yc, 0, Yw], [P.nd, 0, 0]]
  let bt := nth BV BTOP []
  let dotE (b : List Int) (rows : List (List Int)) (e : Nat) : Int :=
    (List.zip b rows).foldl (fun acc (x : Int × List Int) => acc + x.1 * nth x.2 e 0) 0
  let V0 := nth P.verts v0 []
  let L : Int := (P.cden : Int) * P.kd
  let coE (i j e : Nat) : FE :=
    let base := fsmul (4 * nth (nth pN i []) e 0) (vecGet V0 j k)
    let rest := (List.range 4).foldl (fun acc f =>
      if f == BTOP then acc else
        let bf := nth BV f []
        let wf := dotE (List.zipWith (· - ·) bt bf) pN e
        fadd acc (fsmul (wf * nth bf i 0) (vecGet (nth P.verts (nth vf f 0) []) j k))) (fzero k)
    fsmul L (fadd base rest)
  let coN (e : Nat) : FE :=
    let mN := dotE bt pN e
    let kN := dotE kap nN e
    fI (-(4 * (P.dv : Int)) * ((P.kd : Int) * P.cnum * mN + (P.cden : Int) * kN))
  let (Rq, N) := rotQ (rboxQ P.den rb)
  let G := (List.range 3).map (fun e =>
    combine k (((List.range 9).map (fun ij => (coE (ij / 3) (ij % 3) e, nth Rq ij []))) ++ [(coN e, N)]))
  (List.zip (List.range 3) G).foldl (fun acc (eg : Nat × List FE) =>
    (List.zip (List.range 10) eg.2).foldl (fun acc2 (mc : Nat × FE) =>
      acc2 + monoLb (quadKind eg.1 mc.1) (loHi P.sqb mc.2)) acc) 0

/-- discarded: tr(R K) − tr(R) times a positive constant -/
def discLbT (P : Prm) (rb : RBox) (m : Nat) : Int :=
  let K := nth P.rots m []
  let (Rq, _) := rotQ (rboxQ P.den rb)
  let terms := (List.range 9).map (fun ij =>
    let i := ij / 3; let j := ij % 3
    let kji := vecGet (nth K j []) i 2
    (if i == j then fsub kji (fI P.dk) else kji, nth Rq ij []))
  let G := combine 2 terms
  (List.zip (List.range 10) G).foldl (fun acc (mc : Nat × FE) =>
    acc + monoLb (quadKind 0 mc.1) (loHi P.sqb mc.2)) 0

/-- quaternion product of field-element quaternions -/
def qmulF (p q : List FE) : List FE :=
  let w1 := nth p 0 fz; let x1 := nth p 1 fz; let y1 := nth p 2 fz; let z1 := nth p 3 fz
  let w2 := nth q 0 fz; let x2 := nth q 1 fz; let y2 := nth q 2 fz; let z2 := nth q 3 fz
  [fsub (fsub (fsub (fm w1 w2) (fm x1 x2)) (fm y1 y2)) (fm z1 z2),
   fsub (fadd (fadd (fm w1 x2) (fm x1 w2)) (fm y1 z2)) (fm z1 y2),
   fadd (fadd (fsub (fm w1 y2) (fm x1 z2)) (fm y1 w2)) (fm z1 x2),
   fadd (fsub (fadd (fm w1 z2) (fm x1 y2)) (fm y1 x2)) (fm z1 w2)]

/-- `r_in_cube`: the 8 corners q of the R box satisfy, for one sign sg, sg·w0 > 0 and |w_i| ≤ r0·sg·w0 (w = q̄_c ⊗ q) -/
def rInCube (P : Prm) (t : Tube) (rb : RBox) : Bool :=
  let qb : List FE := [nth t.q 0 fz, fneg (nth t.q 1 fz), fneg (nth t.q 2 fz), fneg (nth t.q 3 fz)]
  let ins (a b c : Int) : List Int := match rb.ch with
    | 0 => [P.den, a, b, c]
    | 1 => [a, P.den, b, c]
    | 2 => [a, b, P.den, c]
    | _ => [a, b, c, P.den]
  let corners : List (List Int) := [rb.l0, rb.h0].foldr (fun a acc =>
    [rb.l1, rb.h1].foldr (fun b acc2 => [rb.l2, rb.h2].foldr (fun c acc3 => ins a b c :: acc3) acc2) acc) []
  let ws := corners.map (fun q => qmulF qb (q.map fI))
  let rn := t.r0.1; let rd : Int := t.r0.2
  [1, -1].any (fun (sg : Int) => ws.all (fun w =>
    let w0 := fsmul sg (nth w 0 fz)
    decide (fsg w0 > 0) && [1, 2, 3].all (fun i =>
      let wi := fsmul rd (nth w i fz)
      decide (fsg (fsub (fsmul rn w0) wi) ≥ 0) && decide (fsg (fadd (fsmul rn w0) wi) ≥ 0))))

/-- lo ≤ num/den (den ≠ 0, any sign) -/
def geR (lo : Rat2) (num den : Int) : Bool :=
  if den > 0 then decide (lo.1 * den ≤ num * lo.2) else decide (lo.1 * den ≥ num * lo.2)
def leR (hi : Rat2) (num den : Int) : Bool :=
  if den > 0 then decide (num * hi.2 ≤ hi.1 * den) else decide (num * hi.2 ≥ hi.1 * den)

/-- the point box (corners xs × ys, NDEN units) lies in the parallelogram of the tube: u ∈ [ulo, uhi], |w| ≤ r0 -/
def inside (P : Prm) (t : Tube) (xs ys : List Int) : Bool :=
  let dl : Int := t.dl
  let p0x := nth t.p0 0 0; let p0y := nth t.p0 1 0
  let d0 := nth t.d 0 0; let d1 := nth t.d 1 0; let w0 := nth t.w 0 0; let w1 := nth t.w 1 0
  let det := d0 * w1 - w0 * d1
  decide (det ≠ 0) && xs.all (fun px => ys.all (fun py =>
    let rx := px * dl - p0x * P.nd; let ry := py * dl - p0y * P.nd
    let un := rx * w1 - w0 * ry; let wn := d0 * ry - d1 * rx
    let dd := det * P.nd
    geR t.ulo un dd && leR t.uhi un dd && geR (-t.r0.1, t.r0.2) wn dd && leR t.r0 wn dd))

/-! ## far: the R tree of one tree, read from a preorder string -/

structure RS where
  stack : List RBox
  ok : Bool
  nA : Nat
  nD : Nat
  nL : Nat
  pend : Nat
  kind : Nat          -- 1 = D, 2 = A
  acc : List Nat

structure TreeCtx where
  sig : Nat
  nb : NB
  kap : List Int
  allowL : Bool
  tube : Tube

def rleaf (P : Prm) (c : TreeCtx) (s : RS) (kind : Nat) (args : List Nat) : RS :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    let wf := rboxWf b
    if kind == 0 then { s with stack := rest, ok := s.ok && wf && c.allowL && rInCube P c.tube b, nL := s.nL + 1 }
    else if kind == 1 then
      let m := nth args 0 0
      { s with stack := rest, nD := s.nD + 1,
               ok := s.ok && wf && decide (m < P.rots.length) && decide (discLbT P b m > 0) }
    else
      let v0 := nth args 0 0; let f0 := nth args 1 0; let f1 := nth args 2 0; let f3 := nth args 3 0
      let nv := P.verts.length
      { s with stack := rest, nA := s.nA + 1,
               ok := s.ok && wf && decide (v0 < nv) && decide (f0 < nv) && decide (f1 < nv) && decide (f3 < nv) &&
                 decide (farLbT P c.sig c.nb c.kap b v0 [f0, f1, 0, f3] ≥ 0) }

def rchar (P : Prm) (c : TreeCtx) (s : RS) (ch : Char) : RS :=
  if s.pend > 0 then
    match dval ch with
    | none => { s with ok := false }
    | some v =>
      let acc := s.acc ++ [v]
      if s.pend == 1 then rleaf P c { s with pend := 0, acc := [] } s.kind acc
      else { s with pend := s.pend - 1, acc := acc }
  else if ch == '.' then
    match s.stack with
    | [] => { s with ok := false }
    | b :: rest =>
      let (c1, c2) := split3 b
      { s with stack := c1 :: c2 :: rest,
               ok := s.ok && rboxWf b && decide (b.h0 - b.l0 > 2 ∨ b.h1 - b.l1 > 2 ∨ b.h2 - b.l2 > 2) }
  else if ch == 'L' then rleaf P c s 0 []
  else if ch == 'D' then { s with pend := 1, kind := 1, acc := [] }
  else if ch == 'A' then { s with pend := 4, kind := 2, acc := [] }
  else { s with ok := false }

/-- one R tree: (closed and all leaves pass, accepted, discarded, L) -/
def rtreeT (P : Prm) (c : TreeCtx) (toks : String) : Bool × Nat × Nat × Nat :=
  let s := toks.foldl (rchar P c) ⟨rRoots P.den, true, 0, 0, 0, 0, 0, []⟩
  (s.ok && s.stack.isEmpty && s.pend == 0, s.nA, s.nD, s.nL)

/-! ## far: one pair box -/

/-- the record of one upper n box: mode 1 = I (B, A), 2 = II (A, B), 3 = III (B, B); offsets over koff -/
structure FBox where
  nb : NB
  mode : Nat
  offU : Int
  offL : Int
  tU : String
  tL : String

def nbWf (b : NB) : Bool :=
  decide (b.l0 < b.h0) && decide (b.l1 < b.h1) && (b.h0 - b.l0) % 2 == 0 && (b.h1 - b.l1) % 2 == 0 &&
  decide (0 ≤ b.l1)

def treeKap (P : Prm) (form sig : Nat) (off : Int) : List Int :=
  let a := kapForm P form sig
  [nth a 0 0, nth a 1 0, nth a 2 0 + off * ((P.kd / P.koff : Nat) : Int)]

/-- (all checks pass, [accepted, discarded, L] of U, [accepted, discarded, L] of L) -/
def boxRun (P : Prm) (r : FBox) : Bool × List Nat :=
  let b := r.nb
  let fU : Nat := if r.mode == 2 then 0 else 1
  let fL : Nat := if r.mode == 1 then 0 else 1
  let modeOk := decide (1 ≤ r.mode ∧ r.mode ≤ 3) && (r.mode == 3 || r.offU + r.offL == 0)
  let kU := treeKap P fU 0 r.offU
  let kL := treeKap P fL 1 r.offL
  let S := List.zipWith (· + ·) kU kL
  let sumOk := [b.l0, b.h0].all (fun x => [b.l1, b.h1].all (fun y =>
    decide (nth S 0 0 * x + nth S 1 0 * y + nth S 2 0 * P.nd ≥ 0)))
  let tU := tubeOf P fU; let tL := tubeOf P fL
  let aU := inside P tU [b.l0, b.h0] [b.l1, b.h1] && decide (r.offU ≤ 0)
  let aL := inside P tL [b.l0, b.h0] [-b.h1, -b.l1] && decide (r.offL ≤ 0)
  let (okU, a1, d1, l1) := rtreeT P ⟨0, b, kU, aU, tU⟩ r.tU
  let (okL, a2, d2, l2) := rtreeT P ⟨1, b, kL, aL, tL⟩ r.tL
  (nbWf b && modeOk && sumOk && decide (P.kd % P.koff = 0) && okU && okL, [a1, d1, l1, a2, d2, l2])

/-! ## n tree (upper half [0,1]², the lower half by the mirror of each pair) -/

structure NS where
  stack : List NB
  boxes : List (Int × Int × Int × Int)
  ok : Bool
  nOk : Nat
  nOut : Nat

def nsplit (b : NB) : NB × NB :=
  let w0 := b.h0 - b.l0; let w1 := b.h1 - b.l1
  if w0 ≥ w1 then let m := (b.l0 + b.h0) / 2; ({ b with h0 := m }, { b with l0 := m })
  else let m := (b.l1 + b.h1) / 2; ({ b with h1 := m }, { b with l1 := m })

def nchar (s : NS) (ch : Char) : NS :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    if ch == '.' then
      let (c1, c2) := nsplit b
      { s with stack := c1 :: c2 :: rest, ok := s.ok && decide (b.h0 - b.l0 > 2 ∨ b.h1 - b.l1 > 2) }
    else if ch == 'x' then { s with stack := rest, ok := s.ok && decide (b.l1 > b.h0), nOut := s.nOut + 1 }
    else if ch == 'o' then
      match s.boxes with
      | [] => { s with ok := false }
      | (a0, a1, a2, a3) :: bs =>
        { s with stack := rest, boxes := bs, nOk := s.nOk + 1,
                 ok := s.ok && a0 == b.l0 && a1 == b.l1 && a2 == b.h0 && a3 == b.h1 }
    else { s with ok := false }

/-- the n tree closes and its pair leaves are the records, in order: (ok, pair boxes, outside boxes) -/
def ntreeRun (nd : Int) (toks : String) (boxes : List (Int × Int × Int × Int)) : Bool × Nat × Nat :=
  let s := toks.foldl nchar ⟨[⟨0, 0, nd, nd⟩], boxes, true, 0, 0⟩
  (s.ok && s.stack.isEmpty && s.boxes.isEmpty, s.nOk, s.nOut)

def boxKey (r : FBox) : Int × Int × Int × Int := (r.nb.l0, r.nb.l1, r.nb.h0, r.nb.h1)

/-! ## local: the polynomial of a candidate -/

def pI (c : Int) : Poly := if c == 0 then [] else [([0, 0, 0, 0, 0], fI c)]
def pF (c : FE) : Poly := if fIsZero c then [] else [([0, 0, 0, 0, 0], c)]
def pV (i : Nat) (c : Int) : Poly := if c == 0 then [] else [(incAt [0, 0, 0, 0, 0] i, fI c)]
def pM (p q : Poly) : Poly := pmul PS p q
def pS (p q : Poly) : Poly := padd p (psmulZ (-1) q)
def pSum (l : List Poly) : Poly := psum l

/-- candidate polynomials of one tube: (top, [v0, v1, -, v3]) ↦ P̃ = S·|q|²·F_c, S = 4·cden·kd·dl·dv·Dq² -/
structure LocParts where
  nterm : List Poly                 -- per vertex
  bterm : List (List Poly)          -- per face, per vertex: wts_f·(b_f·X_v)
  sub : Poly

def locParts (P : Prm) (t : Tube) : LocParts :=
  let kap := kapForm P t.side 0
  -- n·dl = (p0 + u d + w ŵ, dl)
  let nI : List Poly := [padd (padd (pI (nth t.p0 0 0)) (pV 0 (nth t.d 0 0))) (pV 1 (nth t.w 0 0)),
                         padd (padd (pI (nth t.p0 1 0)) (pV 0 (nth t.d 1 0))) (pV 1 (nth t.w 1 0)),
                         pI t.dl]
  let qc : List Poly := t.q.map pF
  -- q = q_c ⊗ (1, p1, p2, p3)
  let one : Poly := pI 1
  let pq : List Poly := [one, pV 2 1, pV 3 1, pV 4 1]
  let w1 := nth qc 0 []; let x1 := nth qc 1 []; let y1 := nth qc 2 []; let z1 := nth qc 3 []
  let w2 := nth pq 0 []; let x2 := nth pq 1 []; let y2 := nth pq 2 []; let z2 := nth pq 3 []
  let w := pS (pS (pS (pM w1 w2) (pM x1 x2)) (pM y1 y2)) (pM z1 z2)
  let a := pS (padd (padd (pM w1 x2) (pM x1 w2)) (pM y1 z2)) (pM z1 y2)
  let b := padd (padd (pS (pM w1 y2) (pM x1 z2)) (pM y1 w2)) (pM z1 x2)
  let c := padd (pS (padd (pM w1 z2) (pM x1 y2)) (pM y1 x2)) (pM z1 w2)
  let two (p : Poly) : Poly := psmulZ 2 p
  let ww := pM w w; let aa := pM a a; let bb := pM b b; let cc := pM c c
  let M : List Poly :=
    [pS (pS (padd ww aa) bb) cc, two (pS (pM a b) (pM w c)), two (padd (pM a c) (pM w b)),
     two (padd (pM a b) (pM w c)), pS (padd (pS ww aa) bb) cc, two (pS (pM b c) (pM w a)),
     two (pS (pM a c) (pM w b)), two (padd (pM b c) (pM w a)), pS (pS (padd ww cc) aa) bb]
  let Nq := padd (padd ww aa) (padd bb cc)
  let X (v : Nat) : List Poly := (List.range 3).map (fun i =>
    pSum ((List.range 3).map (fun j => psmulF PS (vecGet (nth P.verts v []) j 2) (nth M (3 * i + j) []))))
  let nv := P.verts.length
  let Xs := (List.range nv).map X
  let L : Int := (P.cden : Int) * P.kd
  let bt := nth BV BTOP []
  { nterm := Xs.map (fun Xv => psmulZ (4 * L) (pSum ((List.range 3).map (fun i => pM (nth nI i []) (nth Xv i [])))))
    bterm := (List.range 4).map (fun f =>
      let bf := nth BV f []
      let wts := pSum ((List.range 3).map (fun i => psmulZ (nth bt i 0 - nth bf i 0) (nth nI i [])))
      Xs.map (fun Xv => psmulZ L (pM wts (pSum ((List.range 3).map (fun i => psmulZ (nth bf i 0) (nth Xv i [])))))))
    sub := psmulZ (4 * (P.dv : Int))
      (pM (padd (psmulZ ((P.kd : Int) * P.cnum) (pSum ((List.range 3).map (fun i => psmulZ (nth bt i 0) (nth nI i [])))))
                (psmulZ (P.cden : Int) (pSum ((List.range 3).map (fun i => psmulZ (nth kap i 0) (nth nI i []))))))
          Nq) }

def candPoly (L : LocParts) (cd : List Nat) : Poly :=
  let top := nth cd 0 0
  pS (padd (nth L.nterm top [])
    (pSum ([(0, 1), (1, 2), (3, 3)].map (fun (fj : Nat × Nat) => nth (nth L.bterm fj.1 []) (nth cd fj.2 0) []))))
    L.sub

/-- split into e0 = e00 + e01·u (degree 0 in ζ = (w, p)) and Λ in (u, r, ζ̂_w, ζ̂_1, ζ̂_2, ζ̂_3) -/
def splitE0 (p : Poly) : Option (FE × FE × Poly) :=
  let e0ok := p.all (fun (m, _) => nth m 1 0 + nth m 2 0 + nth m 3 0 + nth m 4 0 != 0 || nth m 0 0 ≤ 1)
  if !e0ok then none else
  let e00 := p.foldl (fun acc (m, a) => if m == [0, 0, 0, 0, 0] then fadd acc a else acc) fz
  let e01 := p.foldl (fun acc (m, a) => if m == [1, 0, 0, 0, 0] then fadd acc a else acc) fz
  let lam := psum (p.filterMap (fun (m, a) =>
    let z := nth m 1 0 + nth m 2 0 + nth m 3 0 + nth m 4 0
    if z == 0 then none else some [([nth m 0 0, z - 1, nth m 1 0, nth m 2 0, nth m 3 0, nth m 4 0], a)]))
  some (e00, e01, lam)

/-- D^dmax·Λ(centre + W t / D) on [−1, 1]^6, lower bound (the rule of lam_lb, √5 bracketed by sqbL) -/
def lamLb (P : Prm) (D : Int) (dmax : Nat) (H : Poly) (lo hi : List Int) : Option Int :=
  let Cc := List.zipWith (fun l h => (l + h) / 2) lo hi
  let W := List.zipWith (fun l h => (h - l) / 2) lo hi
  if H.any (fun (m, _) => decide (m.foldl (· + ·) 0 > dmax)) then none else
  let S := psum (H.map (fun (m, a) =>
    let tot := m.foldl (· + ·) 0
    let base : Poly := [([0, 0, 0, 0, 0, 0], fsmul (D ^ (dmax - tot)) a)]
    (List.zip (List.range 6) m).foldl (fun acc (x : Nat × Nat) =>
      (List.range x.2).foldl (fun acc2 _ =>
        let c := nth Cc x.1 0; let w := nth W x.1 0
        if w == 0 then psmulZ c acc2 else pmulAff acc2 c w x.1) acc) base))
  some (S.foldl (fun acc (m, a) =>
    let kind := if m.all (· == 0) then 0 else if m.all (· % 2 == 0) then 1 else 2
    acc + monoLb kind (loHi P.sqbL a)) 0)

structure LB where
  lo : List Int
  hi : List Int

/-- the split of d45_dodintet_local.split: the widest axis after normalising by [uhi − ulo, r0, 2, 2, 2, 2] -/
def lsplitT (U : List Int) (b : LB) : Option (LB × LB) :=
  let w := List.zipWith (fun l h => h - l) b.lo b.hi
  -- ax is maximal if w_ax·U_j ≥ w_j·U_ax for all j and strictly greater for j < ax
  let better (i j : Nat) : Bool := decide (nth w i 0 * nth U j 1 > nth w j 0 * nth U i 1)
  let ax := (List.range 6).foldl (fun best i => if better i best then i else best) 0
  let l := nth b.lo ax 0; let h := nth b.hi ax 0
  if (l + h) % 2 != 0 || h - l < 2 then none else
  let mid := (l + h) / 2
  some (⟨b.lo, b.hi.set ax mid⟩, ⟨b.lo.set ax mid, b.hi⟩)

structure LS where
  stack : List LB
  ok : Bool
  nAcc : Nat
  pend : Bool

structure LCtx where
  D : Int
  U : List Int
  cands : List (FE × FE × Poly)

def lleaf (P : Prm) (c : LCtx) (s : LS) (ci : Nat) : LS :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    let wf := (List.zipWith (fun l h => decide (l ≤ h) && (h - l) % 2 == 0) b.lo b.hi).all id
    let (e00, e01, lam) := nth c.cands ci (fz, fz, [])
    let e0at (u : Int) : Bool := decide (fsg (fadd (fsmul c.D e00) (fsmul u e01)) ≥ 0)
    let lamOk := match lamLb P c.D 6 lam b.lo b.hi with
      | some v => decide (v > 0)
      | none => false
    { s with stack := rest, nAcc := s.nAcc + 1,
             ok := s.ok && wf && decide (ci < c.cands.length) && e0at (nth b.lo 0 0) && e0at (nth b.hi 0 0) && lamOk }

def lchar (P : Prm) (c : LCtx) (s : LS) (ch : Char) : LS :=
  if s.pend then
    match dval ch with
    | none => { s with ok := false }
    | some v => lleaf P c { s with pend := false } v
  else if ch == '.' then
    match s.stack with
    | [] => { s with ok := false }
    | b :: rest =>
      match lsplitT c.U b with
      | none => { s with ok := false }
      | some (b1, b2) => { s with stack := b1 :: b2 :: rest }
  else if ch == 'a' then { s with pend := true }
  else { s with ok := false }

/-- ratio a/d in units 1/D (must be exact) -/
def toD (D : Int) (x : Rat2) : Option Int :=
  if (x.1 * D) % (x.2 : Int) == 0 then some (x.1 * D / x.2) else none

/-- the root leaves of a tube (faces ζ̂_ax = ±1, Python order) -/
def lroots (D ulo uhi r0 : Int) : List LB :=
  (List.range 4).foldr (fun ax acc =>
    [1, -1].foldr (fun (sg : Int) acc2 =>
      let lo : List Int := [ulo, 0, -D, -D, -D, -D]
      let hi : List Int := [uhi, r0, D, D, D, D]
      ⟨lo.set (2 + ax) (sg * D), hi.set (2 + ax) (sg * D)⟩ :: acc2) acc) []

/-- one tube: candidates (top, v0, v1, ·, v3), the face strings in root order; D = 2^K units of the leaves.
  Returns (ok, leaves per face). -/
def tubeRun (P : Prm) (t : Tube) (cands : List (List Nat)) (D : Int) (faces : List String) : Bool × List Nat :=
  let L := locParts P t
  let sp := cands.map (fun cd => splitE0 (candPoly L cd))
  let spOk := sp.all Option.isSome && cands.all (fun cd => cd.length == 4 && cd.all (· < P.verts.length))
  let cs := sp.map (fun o => o.getD (fz, fz, []))
  match toD D t.ulo, toD D t.uhi, toD D t.r0 with
  | some ulo, some uhi, some r0 =>
    let U : List Int := [uhi - ulo, r0, 2 * D, 2 * D, 2 * D, 2 * D]
    let roots := lroots D ulo uhi r0
    let ctx : LCtx := ⟨D, U, cs⟩
    let res := (List.zip roots faces).map (fun (x : LB × String) =>
      let s := x.2.foldl (lchar P ctx) ⟨[x.1], true, 0, false⟩
      (s.ok && s.stack.isEmpty && !s.pend, s.nAcc))
    (spOk && decide (ulo < uhi) && decide (0 < r0) && faces.length == 8 && res.all (·.1), res.map (·.2))
  | _, _, _ => (false, [])

/-! ## constants -/

def sqbOk5 (sqb : List (Int × Int)) (k : Nat) : Bool :=
  match sqb with
  | [(a0, b0), (a, b)] => a0 == 2 ^ k && b0 == 2 ^ k && decide (0 ≤ a) && b == a + 1 &&
      decide (a * a ≤ 5 * 4 ^ k) && decide (5 * 4 ^ k < b * b)
  | _ => false

def dotF (u v : List FE) : FE := (List.zip u v).foldl (fun acc (x : FE × FE) => fadd acc (fm x.1 x.2)) fz
def matVecF (K : List (List FE)) (v : List FE) : List FE := K.map (fun row => dotF row v)
def transF (K : List (List FE)) : List (List FE) := (List.range 3).map (fun j => K.map (fun row => nth row j fz))
def matMulF (A B : List (List FE)) : List (List FE) := A.map (fun row => (transF B).map (fun col => dotF row col))
def detF (K : List (List FE)) : FE :=
  let g (i j : Nat) : FE := nth (nth K i []) j fz
  fadd (fsub (fm (g 0 0) (fsub (fm (g 1 1) (g 2 2)) (fm (g 1 2) (g 2 1))))
             (fm (g 0 1) (fsub (fm (g 1 0) (g 2 2)) (fm (g 1 2) (g 2 0)))))
       (fm (g 0 2) (fsub (fm (g 1 0) (g 2 1)) (fm (g 1 1) (g 2 0))))
/-- K/d is a rotation: KᵀK = d²I, det K = d³ -/
def isRot (K : List (List FE)) (d : Int) : Bool :=
  let KtK := matMulF (transF K) K
  (List.range 9).all (fun ij => nth (nth KtK (ij / 3) []) (ij % 3) fz == (if ij / 3 == ij % 3 then fI (d * d) else fz)) &&
  detF K == fI (d * d * d)

/-- the piece: 20 distinct vertices, centrally symmetric, all squared distances ≥ 1 and = 1 for exactly 3 per vertex -/
def pieceOkT (P : Prm) : Bool :=
  let d2 (u v : List FE) : FE := (List.zip u v).foldl (fun acc (x : FE × FE) => let t := fsub x.1 x.2; fadd acc (fm t t)) fz
  let one := fI ((P.dv : Int) * P.dv)
  P.verts.length == 20 && P.verts.eraseDups.length == 20 && P.verts.all (fun v => v.length == 3) &&
  P.verts.all (fun v => P.verts.any (fun w => w == v.map fneg)) &&
  P.verts.all (fun v => P.verts.all (fun w => v == w || decide (fsg (fsub (d2 v w) one) ≥ 0))) &&
  P.verts.all (fun v => (P.verts.filter (fun w => d2 v w == one)).length == 3)

/-- the 60 rotations: rotations, distinct, each permutes the vertices (K v ∈ dk·V) -/
def rotsOkT (P : Prm) : Bool :=
  let d : Int := P.dk
  P.rots.length == 60 && P.rots.eraseDups.length == 60 &&
  P.rots.all (fun K => isRot K d && P.verts.all (fun v => P.verts.any (fun w => matVecF K v == w.map (fsmul d))))

/-- the weights n·(b₂ − b_f) ≥ 0 at the four corners of the tube's parallelogram (u = ulo, uhi; w = ±r0) -/
def weightsOk (t : Tube) : Bool :=
  let bt := nth BV BTOP []
  [t.ulo, t.uhi].all (fun u => [(-t.r0.1, t.r0.2), t.r0].all (fun (w : Rat2) =>
    -- n·dl·u.den·w.den
    let n : List Int := [nth t.p0 0 0 * u.2 * w.2 + u.1 * nth t.d 0 0 * w.2 + w.1 * nth t.w 0 0 * u.2,
                         nth t.p0 1 0 * u.2 * w.2 + u.1 * nth t.d 1 0 * w.2 + w.1 * nth t.w 1 0 * u.2,
                         (t.dl : Int) * u.2 * w.2]
    BV.all (fun bf => decide ((List.zip (List.zipWith (· - ·) bt bf) n).foldl (fun acc (x : Int × Int) => acc + x.1 * x.2) 0 ≥ 0))))

def constsOk (P : Prm) : Bool :=
  sqbOk5 P.sqb P.sqk && sqbOk5 P.sqbL P.sqkL && pieceOkT P && rotsOkT P &&
  P.tA.side == 0 && P.tB.side == 1 && weightsOk P.tA && weightsOk P.tB &&
  decide (0 < P.cden) && decide (0 < P.kd) && decide (0 < P.koff) && decide (P.kd % P.koff = 0) &&
  P.kh.length == 3 && decide (0 < P.cnum)

/-! ## upper bound and the sandwich -/

structure Upper where
  qd : Nat                  -- q̂ = qh / qd (rational quaternion)
  qh : List Int
  g : List (List Int)       -- R̂₁ = g·R̂₀·k
  kk : List (List FE)       -- k times kden
  kden : Nat
  dt : Nat                  -- t0, t1, u_up times dt
  t0 : List FE
  t1 : List FE
  uup : FE
  nh : List FE              -- normal of the separating plane
  top0 : Nat                -- vertex of piece 0 that is highest along nh
  -- the reference check: the minimal polynomial of u changes sign between c̄ and u_up
  minpoly : List Int        -- coefficients, highest degree first
  xs : Int                  -- a rational s̄_rat = xs / xd with s̄_rat² ≤ 8 c̄²
  xd : Nat

def matI (A : List (List Int)) : List (List FE) := A.map (fun r => r.map fI)

/-- (container check, separation check, sandwich 0 < 2√2 (u_up − c̄) < 4·10^-10, s̄_rat ≤ 2√2·c̄, minpoly sign change) -/
def upperRun (P : Prm) (U : Upper) : List Bool :=
  let w := nth U.qh 0 0; let a := nth U.qh 1 0; let b := nth U.qh 2 0; let c := nth U.qh 3 0
  let N0 := w * w + a * a + b * b + c * c
  let M : List (List Int) := [[w*w + a*a - b*b - c*c, 2*(a*b - w*c), 2*(a*c + w*b)],
                              [2*(a*b + w*c), w*w - a*a + b*b - c*c, 2*(b*c - w*a)],
                              [2*(a*c - w*b), 2*(b*c + w*a), w*w - a*a - b*b + c*c]]
  let R0 := matI M                                  -- N0·R̂₀
  let R1 := matMulF (matMulF (matI U.g) R0) U.kk    -- N0·kden·R̂₁
  let kd : Int := U.kden; let dv : Int := P.dv; let dt : Int := U.dt
  -- positions times Dt·N0·kden·dv
  let sc : Int := dt * N0 * kd * dv
  let pos0 := P.verts.map (fun v => List.zipWith fadd ((matVecF R0 v).map (fsmul (dt * kd))) (U.t0.map (fsmul (N0 * kd * dv))))
  let pos1 := P.verts.map (fun v => List.zipWith fadd ((matVecF R1 v).map (fsmul dt)) (U.t1.map (fsmul (N0 * kd * dv))))
  let uS := fsmul (N0 * kd * dv) U.uup
  let contain := (pos0 ++ pos1).all (fun x => BV.all (fun bf => decide (fsg (fsub uS (dotF (bf.map fI) x)) ≥ 0)))
  let h (x : List FE) : FE := dotF U.nh x
  let cpl := h (nth pos0 U.top0 [])
  let sep := decide (U.nh.any (fun e => !fIsZero e)) &&
    pos0.all (fun x => decide (fsg (fsub cpl (h x)) ≥ 0)) && pos1.all (fun x => decide (fsg (fsub (h x) cpl) ≥ 0))
  let rots := isRot R0 N0 && isRot R1 (N0 * kd) && decide (N0 > 0) && decide (sc > 0)
  -- d = u_up − c̄ in units 1/(dt·cden)
  let dI := fsub (fsmul (P.cden : Int) U.uup) (fI (P.cnum * dt))
  let den2 : Int := dt * P.cden
  let sand := decide (fsg dI > 0) && decide (fsg (fsub (fsmul (8 * 10 ^ 20) (fm dI dI)) (fI (16 * den2 * den2))) < 0)
  let sbarOk := decide (U.xs > 0) && decide (U.xs * U.xs * ((P.cden : Int) * P.cden) ≤ 8 * P.cnum * P.cnum * ((U.xd : Int) * U.xd))
  -- minimal polynomial Σ m_i u^(deg − i): sign at c̄ (scaled by cden^deg) and at u_up (scaled by dt^deg)
  let deg := U.minpoly.length - 1
  let atC : Int := (List.zip (List.range (deg + 1)) U.minpoly).foldl (fun acc (x : Nat × Int) =>
    acc + x.2 * P.cnum ^ (deg - x.1) * (P.cden : Int) ^ x.1) 0
  let pw (e : Nat) : FE := (List.range e).foldl (fun acc _ => fm acc U.uup) (fI 1)
  let atU : FE := (List.zip (List.range (deg + 1)) U.minpoly).foldl (fun acc (x : Nat × Int) =>
    fadd acc (fsmul (x.2 * dt ^ x.1) (pw (deg - x.1)))) fz
  let mp := decide (atC.sign * fsg atU < 0)
  [rots, contain, sep, sand, sbarOk, mp]

end PackLean.D45DT
