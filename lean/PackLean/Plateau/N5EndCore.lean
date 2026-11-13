import PackLean.Plateau.Core

/-! Parts for re-checking in Lean the arithmetic of the lower bound L ≥ 20r/√6 at the end of the plateau (Q49, `verifier/plateau_end_check.py`)
(2026-11-13, written by hand by Claude. No third-party review).

Rewritten independently of Python with integers only. Mathlib is not used. The reasoning (replacement by balls, pigeonhole, "the diameter of a bounded
polyhedron is the maximum distance between its vertices") is not formalized. Only the arithmetic is checked here:

* Cells: the cell of vertex k of the regular tetrahedron tv (the 4 points (±1,±1,±1), edge² = 8) is the intersection of the half-spaces n·x ≤ c of
  "the 4 container faces + 3 bisector planes"; all intersection points of 3 planes (Cramer, integer numerator and denominator > 0) are solved and
  those satisfying all half-spaces are counted without duplicates. 8 vertices, distance² between vertices ≤ (3/8)·edge², with a pair attaining equality.
* Squared inradius: for the icosahedron (×4), the octahedron (×2) and the container tetrahedron tv, all triangles of edges (= faces) are counted,
  the plane of each face leaves the piece on one side (supporting plane), and the squared distance from the origin (centre) is the same value.
* Sign of the difference between the square of the lower bound L_b² = (400/6)·r² and the square of the plateau value (Q(√d), `QD.sign`).
-/

namespace PackLean.Plateau.End
open PackLean.Plateau

abbrev P3 := Int × Int × Int

def dot3 (a b : P3) : Int := a.1 * b.1 + a.2.1 * b.2.1 + a.2.2 * b.2.2
def add3 (a b : P3) : P3 := (a.1 + b.1, a.2.1 + b.2.1, a.2.2 + b.2.2)
def sub3 (a b : P3) : P3 := (a.1 - b.1, a.2.1 - b.2.1, a.2.2 - b.2.2)
def smul3 (c : Int) (a : P3) : P3 := (c * a.1, c * a.2.1, c * a.2.2)
def cross3 (u v : P3) : P3 :=
  (u.2.1 * v.2.2 - u.2.2 * v.2.1, u.2.2 * v.1 - u.1 * v.2.2, u.1 * v.2.1 - u.2.1 * v.1)

/-- Pairs and triples of a list (earlier elements first, same order as itertools.combinations). -/
def pairs {α : Type} : List α → List (α × α)
  | [] => []
  | x :: xs => xs.map (fun y => (x, y)) ++ pairs xs

def triples {α : Type} : List α → List (α × α × α)
  | [] => []
  | x :: xs => (pairs xs).map (fun p => (x, p.1, p.2)) ++ triples xs

/-! ## Cells -/

/-- The container tetrahedron (same as V in `plateau_end_check.py`). -/
def tv : List P3 := [(1, 1, 1), (1, -1, -1), (-1, 1, -1), (-1, -1, 1)]

def tvAt (j : Nat) : P3 := tv.getD j (0, 0, 0)

/-- edge² (vertices 0 and 1). -/
def edge2 : Int := dot3 (sub3 (tvAt 0) (tvAt 1)) (sub3 (tvAt 0) (tvAt 1))

/-- Half-spaces (n, c) of the cell of vertex k: n·x ≤ c. Container face i is x·v_i ≥ −1, the bisector plane is |x − v_k|² ≤ |x − v_j|²
    ⇔ 2(v_j − v_k)·x ≤ |v_j|² − |v_k|². `drop` is a j to leave out (for the versions with errors). -/
def halfspaces (k : Nat) (drop : Option Nat) : List (P3 × Int) :=
  tv.map (fun v => (smul3 (-1) v, (1 : Int))) ++
  ((List.range 4).filter (fun j => j != k && drop != some j)).map (fun j =>
    let vj := tvAt j; let vk := tvAt k
    (smul3 2 (sub3 vj vk), dot3 vj vj - dot3 vk vk))

/-- Intersection point of 3 planes a·x = r as (numerator, denominator) (denominator > 0). x = (r₁ b×c + r₂ c×a + r₃ a×b)/det. none if parallel. -/
def solve3 (h1 h2 h3 : P3 × Int) : Option (P3 × Int) :=
  let a := h1.1; let b := h2.1; let c := h3.1
  let det := dot3 a (cross3 b c)
  let num := add3 (add3 (smul3 h1.2 (cross3 b c)) (smul3 h2.2 (cross3 c a))) (smul3 h3.2 (cross3 a b))
  if det == 0 then none else if det > 0 then some (num, det) else some (smul3 (-1) num, -det)

def feasible (hs : List (P3 × Int)) (q : P3 × Int) : Bool :=
  hs.all (fun h => dot3 h.1 q.1 ≤ h.2 * q.2)

/-- Same point (p/D = q/E). -/
def same (p q : P3 × Int) : Bool := smul3 q.2 p.1 == smul3 p.2 q.1

def dedup (xs : List (P3 × Int)) : List (P3 × Int) :=
  xs.foldl (fun acc x => if acc.any (same x) then acc else acc ++ [x]) []

def cellVerts (k : Nat) (drop : Option Nat) : List (P3 × Int) :=
  let hs := halfspaces k drop
  dedup (((triples hs).filterMap (fun t => solve3 t.1 t.2.1 t.2.2)).filter (feasible hs))

/-- Numerator of the squared distance of 2 points (the denominator is (D·E)²). -/
def dist2num (p q : P3 × Int) : Int :=
  let w := sub3 (smul3 q.2 p.1) (smul3 p.2 q.1)
  dot3 w w

/-- Check of a cell: 8 vertices, distance²/edge² ≤ num/den for all pairs, and a pair attains equality. -/
def cellOk (k : Nat) (drop : Option Nat) (num den : Int) : Bool :=
  let vs := cellVerts k drop
  vs.length == 8 &&
  (pairs vs).all (fun pq => den * dist2num pq.1 pq.2 ≤ num * edge2 * (pq.1.2 * pq.2.2) ^ 2) &&
  (pairs vs).any (fun pq => den * dist2num pq.1 pq.2 == num * edge2 * (pq.1.2 * pq.2.2) ^ 2)

/-! ## Inradius (pieces in Q(√d)) -/

def cross (d : Int) (u v : V3) : V3 :=
  ⟨(u.y.mul d v.z).sub (u.z.mul d v.y), (u.z.mul d v.x).sub (u.x.mul d v.z), (u.x.mul d v.y).sub (u.y.mul d v.x)⟩

/-- Triangles of edges (all 3 sides with distance² = e2). -/
def faces (d : Int) (std : List V3) (e2 : QD) : List (V3 × V3 × V3) :=
  let isE := fun (u v : V3) => (u.sub v).dot d (u.sub v) == e2
  (triples std).filter (fun t => isE t.1 t.2.1 && isE t.1 t.2.2 && isE t.2.1 t.2.2)

/-- The plane of face (a, b, c) leaves the piece on one side (the side of the origin), and the squared distance from the origin = sc2·rnum/rden. -/
def faceOk (d : Int) (std : List V3) (rnum : QD) (rden sc2 : Int) (t : V3 × V3 × V3) : Bool :=
  let a := t.1; let b := t.2.1; let c := t.2.2
  let n := cross d (b.sub a) (c.sub a)
  let h := n.dot d a
  let s := QD.sign d h
  s != 0 &&
  std.all (fun p => QD.sign d (h.sub (n.dot d p)) * s ≥ 0) &&
  (QD.mul d h h).smul rden == (QD.mul d (n.dot d n) rnum).smul sc2

/-- Number of faces = nf, every face is a supporting plane, and the squared distance from the centre = sc2·r² (r² = rnum/rden). -/
def inradOk (d : Int) (std : List V3) (e2 : QD) (nf : Nat) (rnum : QD) (rden sc2 : Int) : Bool :=
  (faces d std e2).length == nf && (faces d std e2).all (faceOk d std rnum rden sc2)

/-- tv as V3. -/
def tvQ : List V3 := tv.map (fun v => ⟨⟨v.1, 0⟩, ⟨v.2.1, 0⟩, ⟨v.2.2, 0⟩⟩)

/-! ## Comparison of the lower bound with the plateau -/

/-- Sign of L_b² − p². L_b² = (400/6)·r², r² = rnum/rden, square of the plateau value p² = pnum/pden. With denominators cleared: 400·pden·rnum − 6·rden·pnum. -/
def lbSign (d : Int) (rnum : QD) (rden : Int) (pnum : QD) (pden : Int) : Int :=
  QD.sign d ((rnum.smul (400 * pden)).sub (pnum.smul (6 * rden)))

end PackLean.Plateau.End
