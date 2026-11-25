/-
D48 stage O6 (L4'', octincub_n09): independent Lean check of the arithmetic of the upper bound and of s0.
2026-11-15, written by Claude (Opus 5.5). Not reviewed by a third party; not a formal proof of the theorem.

What is checked (integers only, no Mathlib; everything is evaluated by the kernel with `decide`):
* Units: the piece is scaled by sqrt 2 to K = {|x|+|y|+|z| <= 1} and the container is [-4/3, 4/3]^3 (edge 8/3).
  All coordinates below are multiplied by 3, so the container is [-4, 4]^3 and a rotation R is stored as 3R
  (integer columns).  Back in the original units the edge is (8/3)/sqrt 2 = 4 sqrt 2 / 3, the positive root of
  9 x^2 - 32 (`s0_ok`).
* Upper bound (`upper_ok`): the 9 pieces of the record (the origin piece with R = I, and 8 corner pieces with
  R = D R* D, centroid (+-2/3)^3, D a diagonal sign matrix) are congruent to K (R orthogonal; K = -K, so det -1 is
  fine), lie in the container, and each of the 36 pairs has a weakly separating plane, found here by the
  separating-axis candidates (face normals of both pieces and cross products of edge directions).  The plane is
  computed in Lean, independently of the Python code (d87_oct_step0.check_config).
* Broken versions (`broken_ok`): container shrunk by 1/200, or the corner piece (+,+,+) moved to centroid
  (1/3, 1/3, 1/3); both fail.
* Point table (`table_ok`): the 8 orthants get w_Q = (1/3,1/3,1/3) on (+++) and (---), and on the other 6 the point
  with 2/9 on the odd axis and 5/18 elsewhere; opposite orthants get the same point.
* Equality points (`equality_ok`): 18 (G(n, R) - n.w) = 0 at the four equality points of (I)-(IV), where
  G(n, R) = max_k |n.r_k| + sum_i (n_i)_- (e_i(R) - 4/3), e_i(R) = max_k |R_ik|.
What is not checked: the argument (pigeonhole, spreading apart, the inequalities (I)-(IV) for all n and R, the
local and far certificates).  Those are the Python records replayed by d87_oct_replay_all.py.
Build: from lean/, `lake env lean PackLean/D87Oct/Arith.lean` (core Lean only).
-/

namespace PackLean.D87Oct

abbrev V := List Int

def dot (a b : V) : Int := (List.zipWith (· * ·) a b).foldl (· + ·) 0
def vadd (a b : V) : V := List.zipWith (· + ·) a b
def vsub (a b : V) : V := List.zipWith (· - ·) a b
def vneg (a : V) : V := a.map (fun x => -x)
def smul (s : Int) (a : V) : V := a.map (fun x => s * x)
def cross : V → V → V
  | [a0, a1, a2], [b0, b1, b2] => [a1 * b2 - a2 * b1, a2 * b0 - a0 * b2, a0 * b1 - a1 * b0]
  | _, _ => []
def nth (l : List α) (i : Nat) (d : α) : α := l.getD i d
def maxL : List Int → Int
  | [] => 0
  | x :: xs => xs.foldl max x
def minL : List Int → Int
  | [] => 0
  | x :: xs => xs.foldl min x
def iabs (x : Int) : Int := if x < 0 then -x else x
def negPart (x : Int) : Int := if x < 0 then -x else 0

/-- a piece: columns of 3R and the centroid times 3 (times an extra scale `k` where needed) -/
structure Piece where
  cols : List V
  t : V

/-- 3 R* (columns), det -1, the orientation of the corner piece (+,+,+) -/
def rStar : List V := [[2, 2, -1], [2, -1, 2], [-1, 2, 2]]
/-- 3 R_III (columns), det +1, the equality piece of (III) and (IV) -/
def rIII : List V := [[2, 2, 1], [2, -1, -2], [-1, 2, -2]]
def ident3 : List V := [[3, 0, 0], [0, 3, 0], [0, 0, 3]]

def signs : List V :=
  [[1, 1, 1], [1, 1, -1], [1, -1, 1], [1, -1, -1], [-1, 1, 1], [-1, 1, -1], [-1, -1, 1], [-1, -1, -1]]

/-- column j of D M D is s_j * (D col_j) -/
def conjSign (s : V) (m : List V) : List V :=
  (List.range 3).map (fun j => smul (nth s j 0) (List.zipWith (· * ·) s (nth m j [])))

/-- the record (coordinates times 3): origin piece + 8 corner pieces with centroid 2 s (= 3 * (2/3) s) -/
def record : List Piece :=
  ⟨ident3, [0, 0, 0]⟩ :: signs.map (fun s => ⟨conjSign s rStar, smul 2 s⟩)

def verts (p : Piece) : List V := p.cols.flatMap (fun c => [vadd p.t c, vsub p.t c])

/-- (3R)^T (3R) = 9 I -/
def orthOk (p : Piece) : Bool :=
  p.cols.length == 3 && p.cols.all (fun c => c.length == 3) &&
  (List.range 3).all (fun i => (List.range 3).all (fun j =>
    dot (nth p.cols i []) (nth p.cols j []) == (if i == j then 9 else 0)))

def det3 (m : List V) : Int :=
  dot (nth m 0 []) (cross (nth m 1 []) (nth m 2 []))

/-- all vertices of the piece, scaled by `k`, satisfy |x_i| <= b -/
def insideOk (k b : Int) (p : Piece) : Bool :=
  (verts p).all (fun v => v.all (fun x => iabs (k * x) ≤ b))

def faceNormals (p : Piece) : List V :=
  signs.map (fun s => (List.range 3).foldl (fun acc k => vadd acc (smul (nth s k 0) (nth p.cols k []))) [0, 0, 0])

def edgeDirs (p : Piece) : List V :=
  [(0, 1), (0, 2), (1, 2)].flatMap (fun (i, j) =>
    [vadd (nth p.cols i []) (nth p.cols j []), vsub (nth p.cols i []) (nth p.cols j [])])

def candidates (a b : Piece) : List V :=
  faceNormals a ++ faceNormals b ++
    ((edgeDirs a).flatMap (fun ea => (edgeDirs b).map (fun eb => cross ea eb))).filter (fun c => c.any (· != 0))

/-- weakly separated: some candidate c with max_A c.x <= min_B c.x or the other way round -/
def separated (a b : Piece) : Bool :=
  let va := verts a
  let vb := verts b
  (candidates a b).any (fun c =>
    let pa := va.map (dot c)
    let pb := vb.map (dot c)
    maxL pa ≤ minL pb || maxL pb ≤ minL pa)

def pairs (n : Nat) : List (Nat × Nat) :=
  (List.range n).flatMap (fun i => ((List.range n).filter (fun j => i < j)).map (fun j => (i, j)))

def upperOk (k b : Int) (cfg : List Piece) : Bool :=
  cfg.all orthOk && cfg.all (insideOk k b) &&
  (pairs cfg.length).all (fun (i, j) => separated (nth cfg i ⟨[], []⟩) (nth cfg j ⟨[], []⟩))

def nSeparated (cfg : List Piece) : Nat :=
  ((pairs cfg.length).filter (fun (i, j) => separated (nth cfg i ⟨[], []⟩) (nth cfg j ⟨[], []⟩))).length

/-- s0: the container edge is 8/3 in the scaled units, i.e. 8 / (3 sqrt 2) = 4 sqrt 2 / 3 in the original ones.
  (8/3)^2 = 2 * (32/9), so x = (8/3)/sqrt 2 > 0 has 9 x^2 = 32; the half edge 4/3 is 4 in the coordinates times 3. -/
theorem s0_ok : (8 : Int) ^ 2 * 9 = 2 * 32 * 3 ^ 2 ∧ (2 : Int) * 4 = 8 := by decide +kernel

/-- the upper bound: 9 pieces, all congruent (orthogonal), inside [-4, 4]^3 (= [-4/3, 4/3]^3 times 3), 36 pairs
  weakly separated; R* has det -1 (times 27) and R_III det +1. -/
theorem upper_ok : record.length = 9 ∧ upperOk 1 4 record = true ∧ nSeparated record = 36 ∧
    (pairs record.length).length = 36 ∧ det3 rStar = -27 ∧ det3 rIII = 27 ∧
    orthOk ⟨rIII, [0, 0, 0]⟩ = true := by decide +kernel

/-- broken versions fail: container half 4/3 - 1/200 (times 600: 800 - 3 = 797, coordinates times 200), and the
  corner piece (+,+,+) at centroid (1/3, 1/3, 1/3) (times 3: 1) overlapping the origin piece. -/
theorem broken_ok : upperOk 200 797 record = false ∧
    upperOk 1 4 (record.set 1 ⟨conjSign [1, 1, 1] rStar, [1, 1, 1]⟩) = false := by decide +kernel

/-- the point table times 18: w_Q = (6,6,6); otherwise 4 on the odd axis and 5 elsewhere -/
def table (s : V) : V :=
  if s.all (· == nth s 0 0) then [6, 6, 6]
  else (List.range 3).map (fun i =>
    if ((s.filter (· == nth s i 0)).length == 1) then 4 else 5)

/-- 8 orthants, opposite orthants get the same point; w_A = (5,5,4)/18 on (+,+,-) and (-,-,+) -/
theorem table_ok : signs.all (fun s => table s == table (vneg s)) = true ∧ signs.length = 8 ∧
    table [1, 1, -1] = [5, 5, 4] ∧ table [-1, -1, 1] = [5, 5, 4] ∧ table [1, 1, 1] = [6, 6, 6] ∧
    table [1, -1, 1] = [5, 4, 5] := by decide +kernel

/-- 3 G(n, R) with R stored as 3R: max_k |n.(3 r_k)| + sum_i (n_i)_- (3 e_i(R) - 4) -/
def g3 (n : V) (m : List V) : Int :=
  maxL (m.map (fun c => iabs (dot n c))) +
  (List.range 3).foldl (fun acc i => acc + negPart (nth n i 0) * (maxL (m.map (fun c => iabs (nth c i 0))) - 4)) 0

/-- 18 (G(n, R) - n.w) with w given times 18 -/
def gap18 (n : V) (m : List V) (w18 : V) : Int := 6 * g3 n m - dot n w18

/-- the four equality points: (I) n = (1,1,1), R = I; (II) n = -(1,1,1), R = R*; (III) n = (1,1,-1), R = R_III;
  (IV) n = (-1,-1,1), R = R_III. -/
theorem equality_ok : gap18 [1, 1, 1] ident3 [6, 6, 6] = 0 ∧ gap18 [-1, -1, -1] rStar [6, 6, 6] = 0 ∧
    gap18 [1, 1, -1] rIII [5, 5, 4] = 0 ∧ gap18 [-1, -1, 1] rIII [5, 5, 4] = 0 := by decide +kernel

end PackLean.D87Oct
