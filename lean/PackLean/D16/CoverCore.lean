import PackLean.D16.Core

/-! Parts for re-checking in Lean the arithmetic of the D16 cubinoct_n02 certificate (`verifier/d16_cover_*`) (2026-11-12).

Kept separate because the tool differs from d16d. Coordinates (b, γ, τ), q = (1, τ, −b + γτ, γ + bτ), domain 0 ≤ b ≤ γ, b² + (γ+1)² ≤ 2, 0 ≤ τ ≤ 1.
* Far (field Q; √2 enters only through the rational upper bound S̄): per box, takes multipliers λ_σ (8, σ ∈ {±1}³), μ and signs ε_σj of the absolute values,
  and Lean builds and checks that the lower bounds of the 6 quartics base − sg·T1·E_i (i = 1..3, sg = ±1) are ≥ 0 (d16_cover_far.check_box).
  Boxes outside the domain (not recorded by Python) are checked by Lean with the same integer conditions. Both τ root boxes [0, ½] and [½, 1] are walked.
* Local (Q(√2), τ = τ* + η, τ* = √2 − 1): identities of the multipliers Λ_σ for c = ±1, zero-order identity of F_c, the 4 folds,
  lower bound of H_c + Σ ε_f Λ_f Q_f > 0 on the boxes of the 4 faces (d16_cover_local.check_box), m > 0 and Λ ≥ 0 on all of L.
-/

namespace PackLean.D16C
open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign loHi monoLb RBox rboxWf split3 nth
  Mono Poly padd psum pmul psmulZ psmulF incAt pmulAff)
open PackLean.D16 (z3 pconst pvar pneg psub constTerm faceSub LBox lsplit)

structure CProb where
  den : Int                 -- denominator of box coordinates 2^44
  qlam : Nat                -- denominator of the multipliers 2^24
  sbar : Int × Nat          -- S̄ (rational upper bound of S* = 1 + √2/2)
  t1 : Int × Nat            -- T1
  tmax : Int × Nat          -- upper end of τ (1)
  lbx : Int × Nat           -- far L: b ≤ lbx, γ ≤ lgx, ltlo ≤ τ ≤ lthi
  lgx : Int × Nat
  ltlo : Int × Nat
  lthi : Int × Nat
  rho0 : Int × Nat          -- upper end of the local ρ
  sqb2 : List (Int × Int)   -- [(2^120, 2^120), enclosure of √2·2^120]
  sqk : Nat
  sst : FE                  -- S*·sstd (Q(√2), S* = 1 + √2/2)
  sstd : Nat

/-- In the order of itertools.product([-1, 1], repeat=3) -/
def sigmas : List (List Int) :=
  [[-1, -1, -1], [-1, -1, 1], [-1, 1, -1], [-1, 1, 1], [1, -1, -1], [1, -1, 1], [1, 1, -1], [1, 1, 1]]

/-- General Rq and N (w, x, y, z are polynomials) -/
def rotOf (ps : List Nat) (w x y z : Poly) : List Poly × Poly :=
  let mul := pmul ps
  let two (a : Poly) : Poly := psmulZ 2 a
  let ww := mul w w; let xx := mul x x; let yy := mul y y; let zz := mul z z
  ([psub (psub (padd ww xx) yy) zz, two (psub (mul x y) (mul w z)), two (padd (mul x z) (mul w y)),
    two (padd (mul x y) (mul w z)), psub (psub (padd ww yy) xx) zz, two (psub (mul y z) (mul w x)),
    two (psub (mul x z) (mul w y)), two (padd (mul y z) (mul w x)), psub (psub (padd ww zz) xx) yy],
   padd (padd ww xx) (padd yy zz))

def pIsZero (p : Poly) : Bool := p.all (fun (x : Mono × FE) => fIsZero x.2)

def pEq (p q : Poly) : Bool := pIsZero (psub p q)

/-- Lower bound on [−1,1]³ (Python's lower_bound / lower_bound_q2). -/
def lbPoly (sqb : List (Int × Int)) (p : Poly) : Int :=
  p.foldl (fun acc (x : Mono × FE) =>
    let kind := if x.1.all (· == 0) then 0 else if x.1.all (· % 2 == 0) then 1 else 2
    acc + monoLb kind (loHi sqb x.2)) 0

/-! ## Far region (field Q: FE has length 1, ps = []) -/

def q1 (c : Int) : FE := [c]
def affP (c w : Int) (i : Nat) : Poly := padd [(z3, q1 c)] [(incAt z3 i, q1 w)]

/-- Rq (times D^4) and N as polynomials in s ∈ [−1,1]³, from the box centre and half-width. -/
def boxRot (P : CProb) (b : RBox) : List Poly × Poly :=
  let bb := affP ((b.l0 + b.h0) / 2) ((b.h0 - b.l0) / 2) 0
  let gg := affP ((b.l1 + b.h1) / 2) ((b.h1 - b.l1) / 2) 1
  let tt := affP ((b.l2 + b.h2) / 2) ((b.h2 - b.l2) / 2) 2
  let dd : Poly := [(z3, q1 P.den)]
  let mul := pmul []
  rotOf [] (mul dd dd) (mul tt dd) (padd (pneg (mul bb dd)) (mul gg tt)) (padd (mul gg dd) (mul bb tt))

def epsAt (eps : Nat) (si j : Nat) : Int := if eps / 2 ^ (3 * si + j) % 2 == 1 then 1 else -1

/-- Accept A: the lower bounds of the 6 polynomials (times 2·qlam·den(S̄)·den(T1)) are all ≥ 0. -/
def farAccept (P : CProb) (b : RBox) (lam : List Nat) (mu : Nat) (eps : Nat) : Bool :=
  let (Rq, N) := boxRot P b
  let sn := P.sbar.1; let sd : Int := P.sbar.2; let tn := P.t1.1; let td : Int := P.t1.2
  let Q : Int := P.qlam; let M : Int := mu
  let Pj (si j : Nat) : Poly :=
    let s := nth sigmas si []
    psum ((List.range 3).map (fun i => psmulZ (nth s i 0) (nth Rq (3 * i + j) [])))
  let base := psum ([psmulZ (M * sd * td - 2 * Q * sn * td) N] ++
    (List.range 8).foldr (fun si acc =>
      let l : Int := ((nth lam si 0 : Nat) : Int)
      if l == 0 then acc else
      (List.range 3).map (fun j => psmulZ (l * epsAt eps si j * sd * td) (Pj si j)) ++ acc) [])
  let E (i : Nat) : Poly :=
    let ls : Int := (List.range 8).foldl (fun s si => s + ((nth lam si 0 : Nat) : Int) * nth (nth sigmas si []) i 0) 0
    psmulZ (2 * tn * sd) (padd (psmulZ ls N) (psmulZ M (nth Rq (3 * i) [])))
  lam.length == 8 && lam.foldl (· + ·) 0 == P.qlam && decide (eps < 2 ^ 24) &&
  (List.range 3).all (fun i => [1, -1].all (fun (sg : Int) =>
    decide (lbPoly [(1, 1)] (padd base (psmulZ (-sg) (E i))) ≥ 0)))

/-- Outside the domain (at every point of the box b > γ, or b² + (γ+1)² > 2, or τ > tmax). -/
def outsideD (P : CProb) (b : RBox) : Bool :=
  decide (b.l0 > b.h1) || decide (b.l0 * b.l0 + (b.l1 + P.den) * (b.l1 + P.den) > 2 * P.den * P.den) ||
  decide (b.l2 * (P.tmax.2 : Int) > P.tmax.1 * P.den)

def insideL (P : CProb) (b : RBox) : Bool :=
  ratLeI b.h0 P.den P.lbx && ratLeI b.h1 P.den P.lgx && ratGeI b.l2 P.den P.ltlo && ratLeI b.h2 P.den P.lthi
where
  ratLeI (x d : Int) (r : Int × Nat) : Bool := decide (x * r.2 ≤ r.1 * d)
  ratGeI (x d : Int) (r : Int × Nat) : Bool := decide (x * r.2 ≥ r.1 * d)

inductive CTok where
  | split
  | out
  | L
  | A (lam : List Nat) (mu : Nat) (eps : Nat)

structure CState where
  stack : List RBox
  ok : Bool
  nA : Nat
  nL : Nat
  nOut : Nat

def cstep (P : CProb) (s : CState) (t : CTok) : CState :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    match t with
    | .split =>
      let (c1, c2) := split3 b
      { s with stack := c1 :: c2 :: rest,
               ok := s.ok && rboxWf b && decide (b.h0 - b.l0 > 2 ∨ b.h1 - b.l1 > 2 ∨ b.h2 - b.l2 > 2) }
    | .out => { s with stack := rest, ok := s.ok && outsideD P b, nOut := s.nOut + 1 }
    | .L => { s with stack := rest, ok := s.ok && rboxWf b && insideL P b, nL := s.nL + 1 }
    | .A lam mu eps => { s with stack := rest, ok := s.ok && rboxWf b && farAccept P b lam mu eps, nA := s.nA + 1 }

/-- Tree of the τ root box [tlo, thi] (units of den) × b, γ ∈ [0, ½]. -/
def farRun (P : CProb) (tlo thi : Int) (toks : List CTok) : Bool × Nat × Nat :=
  let s := toks.foldl (cstep P) ⟨[⟨0, 0, 0, tlo, P.den / 2, P.den / 2, thi⟩], true, 0, 0, 0⟩
  (s.ok && s.stack.isEmpty, s.nA, s.nL)

/-- Whole far region: the 2 τ roots [0, ½] and [½, 1] cover [0, tmax] = [0, 1] and both trees close. Returns (pass, accepted, L). -/
def farAll (P : CProb) (toks0 toks1 : List CTok) : Bool × Nat × Nat :=
  let h := P.den / 2
  let (o0, a0, l0) := farRun P 0 h toks0
  let (o1, a1, l1) := farRun P h P.den toks1
  (o0 && o1 && P.den % 2 == 0 && P.tmax == (1, 1), a0 + a1, l0 + l1)

/-- S̄ ≥ S* = 1 + √2/2 (S̄ > 1, 2(S̄ − 1)² > 1), T1 ≥ S̄ − √3/2 (S̄ − T1 ≤ 0 or (S̄ − T1)² ≤ 3/4),
  and the root box [0, ½] in b, γ contains the domain ((½ + 1)² > 2, so γ ≤ √2 − 1 < ½). -/
def farConstsOk (P : CProb) : Bool :=
  let sn := P.sbar.1; let sd : Int := P.sbar.2; let tn := P.t1.1; let td : Int := P.t1.2
  let an := sn * td - tn * sd; let ad := sd * td
  decide (0 < sd) && decide (0 < td) && decide (sn > sd) && decide (2 * (sn - sd) * (sn - sd) > sd * sd) &&
  (decide (an ≤ 0) || decide (4 * an * an ≤ 3 * ad * ad)) && decide (2 * 2 * 2 < 3 * 3) &&
  fsmul 2 P.sst == fsmul (P.sstd : Int) [2, 1] && decide (0 < P.sstd)

/-! ## Local region (Q(√2): FE has length 2, ps = [2]) -/

def ps2 : List Nat := [2]
def c2 (a b : Int) : Poly := [(z3, [a, b])]
def v2 (i : Nat) : Poly := pvar 2 i

def sig4 : List (List Int) := [[-1, 1, 1], [-1, 1, -1], [-1, -1, 1], [-1, -1, -1]]

/-- Basic local polynomials (variables b, γ, η): Rq, N, m, τ = √2 − 1 + η. -/
def locBase : List Poly × Poly × Poly × Poly :=
  let b := v2 0; let g := v2 1
  let tau := padd (c2 (-1) 1) (v2 2)
  let mul := pmul ps2
  let (Rq, N) := rotOf ps2 (c2 1 0) tau (padd (pneg b) (mul g tau)) (padd g (mul b tau))
  let m := psub (c2 1 0) (padd (mul b b) (mul g g))
  (Rq, N, m, tau)

def lamPoly (c : Int) (s : List Int) (m : Poly) : Poly :=
  let b := v2 0; let g := v2 1
  let s2 := nth s 1 0; let s3 := nth s 2 0
  let inner := psub (psub m (psmulZ 2 g)) (psmulZ 2 b)
  psum [m, psmulZ (-2 * s2) g, psmulZ (-2 * s3) b, psmulZ (c * s2 * s3) inner]

/-- Identities: N = (1+τ²)(1+b²+γ²), column R e1 = (1+τ²)(m, 2γ, 2b), for c = ±1 ΣΛ = 4m and ΣΛσ + 4(m, 2γ, 2b) = 0. -/
def identsOk : Bool :=
  let (Rq, N, m, tau) := locBase
  let mul := pmul ps2
  let b := v2 0; let g := v2 1
  let t2 := padd (c2 1 0) (mul tau tau)
  let r2 := padd (c2 1 0) (padd (mul b b) (mul g g))
  let u := [m, psmulZ 2 g, psmulZ 2 b]
  pEq N (mul t2 r2) && (List.range 3).all (fun i => pEq (nth Rq (3 * i) []) (mul t2 (nth u i []))) &&
  [1, -1].all (fun (c : Int) =>
    let L := sig4.map (fun s => lamPoly c s m)
    pEq (psum L) (psmulZ 4 m) &&
    (List.range 3).all (fun i =>
      pIsZero (padd (psum ((List.zip sig4 L).map (fun (x : List Int × Poly) => psmulZ (nth x.1 i 0) x.2)))
                    (psmulZ 4 (nth u i [])))))

/-- F per c (times sstd: sstd·(4N(1+b²+γ²) + Σ Λ sg P) − 8·sst·mN) and the folds (index of σ, P). -/
def locF (P : CProb) (c : Int) : Poly × List (Nat × Poly) :=
  let (Rq, N, m, _) := locBase
  let mul := pmul ps2
  let b := v2 0; let g := v2 1
  let r2 := padd (c2 1 0) (padd (mul b b) (mul g g))
  let sd : Int := P.sstd
  let base := psub (psmulZ (4 * sd) (mul N r2)) (psmulF ps2 (fsmul 8 P.sst) (mul m N))
  let items := (List.range 4).foldr (fun si acc =>
    (List.range 3).map (fun j => (si, psum ((List.range 3).map (fun i => psmulZ (nth (nth sig4 si []) i 0) (nth Rq (3 * i + j) []))))) ++ acc) []
  let lam := sig4.map (fun s => lamPoly c s m)
  let F := items.foldl (fun acc (x : Nat × Poly) =>
    let sg := fsign ps2 (constTerm 2 x.2)
    if sg == 0 then acc else padd acc (psmulZ (sg * sd) (mul (nth lam x.1 []) x.2))) base
  let folds := items.filter (fun (x : Nat × Poly) => fIsZero (constTerm 2 x.2))
  (F, folds)

/-- Lower bound × h^2 of a rational polynomial (in b, γ only, integer coefficients, degree ≤ 2) on 0 ≤ b, γ ≤ 1/h: constant + Σ min(0, coefficient)·h^{2−degree}. -/
def lbNonneg (h : Int) (p : Poly) : Option Int :=
  if p.all (fun (x : Mono × FE) => nth x.1 2 0 == 0 && x.1.foldl (· + ·) 0 ≤ 2 && nth x.2 1 0 == 0) then
    some (p.foldl (fun acc (x : Mono × FE) =>
      let c := nth x.2 0 0; let d := x.1.foldl (· + ·) 0
      if d == 0 then acc + c * h ^ 2 else acc + min 0 c * h ^ (2 - d)) 0)
  else none

/-- On L (0 ≤ b, γ ≤ ρ₀ = 1/h): m > 0 and Λ_σ ≥ 0 for c = ±1. -/
def lamGlobalOk (P : CProb) : Bool :=
  let (_, _, m, _) := locBase
  P.rho0.1 == 1 &&
  (let h : Int := P.rho0.2
   (match lbNonneg h m with | some v => decide (v > 0) | none => false) &&
   [1, -1].all (fun (c : Int) => sig4.all (fun s =>
     match lbNonneg h (lamPoly c s m) with | some v => decide (v ≥ 0) | none => false)))

def shiftLbD (sqb : List (Int × Int)) (hdeg : Nat) (D : Int) (H : Poly) (lo hi : List Int) : Option Int :=
  let Cc := List.zipWith (fun l h => (l + h) / 2) lo hi
  let W := List.zipWith (fun l h => (h - l) / 2) lo hi
  if H.any (fun (x : Mono × FE) => decide (x.1.foldl (· + ·) 0 > hdeg)) then none else
  let S := psum (H.map (fun (x : Mono × FE) =>
    let m := x.1
    let tot := m.foldl (· + ·) 0
    let base : Poly := [(z3, fsmul (D ^ (hdeg - tot)) x.2)]
    (List.zip (List.range 3) m).foldl (fun acc (y : Nat × Nat) =>
      (List.range y.2).foldl (fun acc2 _ => pmulAff acc2 (nth Cc y.1 0) (nth W y.1 0) y.1) acc) base))
  some (lbPoly sqb S)

inductive LTok where
  | split
  | acc (c : Int) (eps : Nat)

structure LState where
  stack : List LBox
  ok : Bool
  nAcc : Nat

/-- Polynomials per face: c ↦ (H_c, [Λ_f·Q_f]) -/
abbrev FaceP := List (Int × Poly × List Poly)

def lstep (P : CProb) (Hs : FaceP) (s : LState) (t : LTok) : LState :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    match t with
    | .split =>
      let (c1, c2) := lsplit b
      { s with stack := c1 :: c2 :: rest,
               ok := s.ok && (List.zipWith (fun l h => decide (h - l > 2)) b.lo b.hi).any id }
    | .acc c eps =>
      let r := match Hs.find? (fun (x : Int × Poly × List Poly) => x.1 == c) with
        | some (_, H, prods) =>
          let A := (List.zip (List.range 4) prods).foldl (fun acc (y : Nat × Poly) =>
            padd acc (psmulZ (if eps / 2 ^ y.1 % 2 == 1 then 1 else -1) y.2)) H
          (match shiftLbD P.sqb2 12 P.den A b.lo b.hi with | some v => decide (v > 0) | none => false)
        | none => false
      { s with stack := rest, nAcc := s.nAcc + 1,
               ok := s.ok && decide (eps < 16) && b.lo.length == 3 && b.hi.length == 3 &&
                 (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id && r }

/-- The 4 faces (in the order of FACES in Python): (axis of ρ, sign, range of a1, range of a2). -/
def faces4 : List (Nat × Int × (Int × Int) × (Int × Int)) :=
  [(1, 1, (0, 1), (-1, 1)), (0, 1, (0, 1), (-1, 1)), (2, 1, (0, 1), (0, 1)), (2, -1, (0, 1), (0, 1))]

/-- Whole local region: identities, the 4 folds, zero-order term of F = 0, m > 0 and Λ ≥ 0 on L, L ⊂ {ρ ≤ ρ₀}, trees of the 4 faces. -/
def localOk (P : CProb) (faces : List (List LTok)) : Bool × Nat :=
  let D := P.den
  let Fs := [1, -1].map (fun (c : Int) => (c, locF P c))
  let (_, _, m, _) := locBase
  let fOk := Fs.all (fun (x : Int × Poly × List (Nat × Poly)) =>
    fIsZero (constTerm 2 x.2.1) && x.2.2.length == 4)
  -- L ⊂ {ρ ≤ ρ₀}: τ* − ltlo < ρ₀ ⟺ √2 < 1 + ltlo + ρ₀, lthi − τ* < ρ₀ ⟺ √2 > 1 + lthi − ρ₀
  let r := P.rho0; let lo := P.ltlo; let hi := P.lthi
  let u1n : Int := r.2 * lo.2 + lo.1 * r.2 + r.1 * lo.2; let u1d : Int := r.2 * lo.2
  let u2n : Int := r.2 * hi.2 + hi.1 * r.2 - r.1 * hi.2; let u2d : Int := r.2 * hi.2
  let inRho := decide (u1n * u1n > 2 * u1d * u1d) && decide (u2n ≥ 0) && decide (u2n * u2n < 2 * u2d * u2d) &&
    decide (P.lbx.1 * r.2 ≤ r.1 * P.lbx.2) && decide (P.lgx.1 * r.2 ≤ r.1 * P.lgx.2) &&
    decide (0 ≤ P.lbx.1) && decide (0 ≤ P.lgx.1)
  let r0 : Int := P.den * r.1 / r.2
  let res := (List.zip faces4 faces).foldl (fun (acc : Bool × Nat) (x : (Nat × Int × (Int × Int) × (Int × Int)) × List LTok) =>
    let ((i, sg, a1r, a2r), toks) := x
    let Hs : FaceP := Fs.map (fun (y : Int × Poly × List (Nat × Poly)) =>
      let lam := sig4.map (fun s => lamPoly y.1 s m)
      (y.1, faceSub i sg 1 y.2.1,
       y.2.2.map (fun (z : Nat × Poly) =>
         psmulZ (P.sstd : Int) (pmul ps2 (faceSub i sg 0 (nth lam z.1 [])) (faceSub i sg 1 z.2)))))
    let root : LBox := ⟨[0, a1r.1 * D, a2r.1 * D], [r0, a1r.2 * D, a2r.2 * D]⟩
    let s := toks.foldl (lstep P Hs) ⟨[root], true, 0⟩
    (acc.1 && s.ok && s.stack.isEmpty, acc.2 + s.nAcc)) (true, 0)
  (identsOk && fOk && lamGlobalOk P && inRho && (P.den * r.1 % r.2 == 0) && decide (0 < P.sstd) && faces.length == 4 && res.1, res.2)

end PackLean.D16C
