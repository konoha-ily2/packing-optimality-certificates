/-! Common parts for re-checking in Lean the arithmetic of the plateau upper-bound substitutions for n = 2, 3, 4
(icointet: `verifier/d28_plateau_n34.py`, octintet: `verifier/d31_plateau_n34.py`) (2026-11-13, written by Claude. No third-party review).

The same three decisions as in Python, rewritten independently with integers only. Mathlib is not used (the Bool checks are only evaluated by `decide`).
The reasoning (that passing the three decisions means the pieces fit in the container without overlapping, and the lower bound "removing pieces keeps a packing") is not formalized.

* Element `QD` of the field Q(√d): a + b√d (a, b integers). Vertex coordinates are (a + b√d)/L (L is the common denominator of the export).
* The sign is decided by integer expressions with denominators cleared: if a and b have the same sign, that sign; otherwise compare |a| with |b|√d by the sign of a² − d b².
* Lean builds the standard pieces itself (vertex order as in Python):
  - icosahedron ×4: (0, ±2, ±(1+√5)) and its cyclic shifts (same order as ICO in `d28_plateau_n34.py`)
  - octahedron ×2: ±√2 e_i (same order as solids.py)
* Decisions (all exact):
  (1) congruence: for all pairs of vertices of each piece, sden²·|P_i − P_j|² = L²·|S_i − S_j|² (S is the standard piece ×sden)
  (2) containment: for each vertex and the 4 container normals b, cden·(b·P) ≤ L·cnum (container {b·x ≤ cnum/cden}). The equalities (contacts) are counted too
  (3) separating planes: the pairs (i, j) equal all pairs with i < j in this order, normal ≠ 0,
      all vertices of piece i have n·P ≤ h, all vertices of piece j have n·P ≥ h (h in units of 1/L)
-/

namespace PackLean.Plateau

structure QD where
  a : Int
  b : Int
  deriving Repr, DecidableEq, Inhabited

def QD.add (x y : QD) : QD := ⟨x.a + y.a, x.b + y.b⟩
def QD.sub (x y : QD) : QD := ⟨x.a - y.a, x.b - y.b⟩
def QD.mul (d : Int) (x y : QD) : QD := ⟨x.a * y.a + d * x.b * y.b, x.a * y.b + x.b * y.a⟩
def QD.smul (c : Int) (x : QD) : QD := ⟨c * x.a, c * x.b⟩
def QD.ofInt (c : Int) : QD := ⟨c, 0⟩

/-- Sign (same rule as `sign` in Python). -/
def QD.sign (d : Int) (x : QD) : Int :=
  let sa := Int.sign x.a; let sb := Int.sign x.b
  if sb == 0 then sa else if sa == 0 then sb else if sa == sb then sa else
    let t := Int.sign (x.a * x.a - d * x.b * x.b)
    if t > 0 then sa else if t < 0 then sb else 0

structure V3 where
  x : QD
  y : QD
  z : QD
  deriving Repr, DecidableEq, Inhabited

def V3.sub (u v : V3) : V3 := ⟨u.x.sub v.x, u.y.sub v.y, u.z.sub v.z⟩
def V3.dot (d : Int) (u v : V3) : QD := ((u.x.mul d v.x).add (u.y.mul d v.y)).add (u.z.mul d v.z)
def V3.idot (b : Int × Int × Int) (u : V3) : QD :=
  ((u.x.smul b.1).add (u.y.smul b.2.1)).add (u.z.smul b.2.2)
def V3.isZero (u : V3) : Bool := u.x == ⟨0, 0⟩ && u.y == ⟨0, 0⟩ && u.z == ⟨0, 0⟩

/-- Separating plane: piece i and piece j (i < j), normal nv, height h (units of 1/L). -/
structure Plane where
  i : Nat
  j : Nat
  nv : V3
  h : QD
  deriving Repr

/-- Data of a problem (exported). -/
structure Prob where
  d : Int                  -- d of √d (5 or 2)
  L : Int                  -- common denominator of the coordinates (> 0)
  pieces : List (List V3)  -- vertices of each piece (integer pairs, ×L)
  planes : List Plane

/-! ## Standard pieces -/

/-- The icosahedron ×4 (same order as ICO in `d28_plateau_n34.py`). -/
def icoStd : List V3 :=
  let z : QD := ⟨0, 0⟩
  [(1, 1), (1, -1), (-1, 1), (-1, -1)].flatMap fun (s : Int × Int) =>
    let b0 := z; let b1 : QD := ⟨2 * s.1, 0⟩; let b2 : QD := ⟨s.2, s.2⟩
    [⟨b0, b1, b2⟩, ⟨b2, b0, b1⟩, ⟨b1, b2, b0⟩]

/-- The octahedron ×2 (same order as solids.py). -/
def octStd : List V3 :=
  let z : QD := ⟨0, 0⟩
  [0, 1, 2].flatMap fun (k : Nat) => [(1 : Int), -1].map fun s =>
    let c : QD := ⟨0, s⟩
    if k == 0 then ⟨c, z, z⟩ else if k == 1 then ⟨z, c, z⟩ else ⟨z, z, c⟩

/-- Normals of the container (regular tetrahedron). -/
def bvecs : List (Int × Int × Int) := [(-1, -1, -1), (-1, 1, 1), (1, -1, 1), (1, 1, -1)]

/-! ## Decisions -/

/-- f on all pairs (x, y) of the list (x first). Structural recursion. -/
def allPairs {α : Type} (f : α → α → Bool) : List α → Bool
  | [] => true
  | x :: xs => xs.all (f x) && allPairs f xs

/-- (1) Congruence: pair the vertices with the standard vertices and compare the squared distances of all pairs. -/
def congruent (d L sden : Int) (std P : List V3) : Bool :=
  P.length == std.length &&
  allPairs (fun (u v : V3 × V3) =>
      let dp := (u.1.sub v.1); let ds := (u.2.sub v.2)
      (dp.dot d dp).smul (sden * sden) == (ds.dot d ds).smul (L * L))
    (P.zip std)

/-- (2) Containment: L·cnum − cden·(b·P) ≥ 0 for all vertices and normals. Returns (count, number of contacts) (none if something sticks out). -/
def contained (d L : Int) (cnum : QD) (cden : Int) (pieces : List (List V3)) : Option (Nat × Nat) :=
  pieces.foldl (fun acc P => P.foldl (fun acc p => bvecs.foldl (fun acc b =>
      match acc with
      | none => none
      | some (cnt, con) =>
        let s := QD.sign d ((cnum.smul L).sub ((p.idot b).smul cden))
        if s < 0 then none else some (cnt + 1, if s == 0 then con + 1 else con)) acc) acc) (some (0, 0))

/-- The pairs i < j in the order of Python's itertools.combinations ((0,1),(0,2),…,(1,2),…). -/
def combs (n : Nat) : List (Nat × Nat) :=
  (List.range n).flatMap fun i => ((List.range n).filter (fun j => i < j)).map fun j => (i, j)

/-- (3) Separating planes. -/
def planeOk (d : Int) (pieces : List (List V3)) (pl : Plane) : Bool :=
  !pl.nv.isZero &&
  (pieces.getD pl.i []).all (fun p => QD.sign d (pl.h.sub (pl.nv.dot d p)) ≥ 0) &&
  (pieces.getD pl.j []).all (fun p => QD.sign d ((pl.nv.dot d p).sub pl.h) ≥ 0)

/-- Everything. Returns (containment count, number of contacts, number of planes); none if any check fails. -/
def check (P : Prob) (std : List V3) (sden : Int) (cnum : QD) (cden : Int) (n : Nat) : Option (Nat × Nat × Nat) :=
  if P.L > 0 && cden > 0 && P.pieces.length == n &&
     P.pieces.all (congruent P.d P.L sden std) &&
     P.planes.map (fun pl => (pl.i, pl.j)) == combs n &&
     P.planes.all (planeOk P.d P.pieces) then
    match contained P.d P.L cnum cden P.pieces with
    | some (cnt, con) => some (cnt, con, P.planes.length)
    | none => none
  else none

/-- Check of the standard pieces themselves: for the icosahedron 30 of the 66 pairs are edges of length 1 (16 because of ×4),
    for the octahedron 12 of the 15 pairs are edges of length 1 (4 because of ×2); the others are longer than an edge. -/
def countEq (d : Int) (std : List V3) (e2 : QD) : Nat :=
  let rec go : List V3 → Nat
    | [] => 0
    | x :: xs => (xs.filter (fun y => (x.sub y).dot d (x.sub y) == e2)).length + go xs
  go std

def minOk (d : Int) (std : List V3) (e2 : QD) : Bool :=
  allPairs (fun x y => QD.sign d (((x.sub y).dot d (x.sub y)).sub e2) ≥ 0) std

end PackLean.Plateau
