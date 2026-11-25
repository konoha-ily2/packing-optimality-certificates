import Mathlib

/-!
# The packing problem and the claim "`s` is the minimal container edge" (statement only)

This file *states* the claims of `packing-optimality-certificates` for two pieces (`n = 2`) as Lean
propositions.  **Nothing here is a proof of any claim**: the claims at the end (thirteen minimal edges in
§5 and six enclosures in §6) are `def … : Prop`, not theorems.  The only theorems are small sanity
checks of the definitions.

Conventions (the same as the README of the certificates repository):

* space: `E3 = EuclideanSpace ℝ (Fin 3)`;
* a solid is the convex hull of its vertices; every solid has edge length 1 and is centred at the origin;
* the container of edge `s` is `s • C` (scaling about the centre);
* a placement is an isometry of `E3`; it is *proper* (a rotation followed by a translation) when its
  linear part has determinant 1;
* `n` pieces fit when each placed piece is contained in the container and the interiors of two different
  placed pieces are disjoint (the pieces are closed, touching is allowed);
* `s` is the minimal edge when `n` pieces fit for `s`, and for no smaller `s' ≥ 0`.

Design notes and the checklist for reviewers: `plan/D45_s0_spec.md`.
-/

namespace PackLean.Formal

open scoped Pointwise

noncomputable section

/-- Euclidean 3-space. -/
abbrev E3 : Type := EuclideanSpace ℝ (Fin 3)

/-- The golden ratio `(1 + √5) / 2`. -/
def φ : ℝ := (1 + √5) / 2

/-! ## 1. The five Platonic solids (edge 1, centred at the origin) -/

/-- Tetrahedron: 4 vertices `(√2/4)·(1,1,1), (1,-1,-1), (-1,1,-1), (-1,-1,1)`. -/
def tetV : Set E3 :=
  {!₂[√2 / 4, √2 / 4, √2 / 4], !₂[√2 / 4, -(√2 / 4), -(√2 / 4)],
   !₂[-(√2 / 4), √2 / 4, -(√2 / 4)], !₂[-(√2 / 4), -(√2 / 4), √2 / 4]}

/-- Cube: 8 vertices `(±1/2, ±1/2, ±1/2)`. -/
def cubeV : Set E3 := {x | ∀ i, |x i| = 1 / 2}

/-- Octahedron: 6 vertices `±(√2/2)·e_k`. -/
def octV : Set E3 := {x | ∃ k, |x k| = √2 / 2 ∧ ∀ j, j ≠ k → x j = 0}

/-- Icosahedron: 12 vertices, the cyclic permutations of `(0, ±1/2, ±φ/2)`.
(`k + 1`, `k + 2` are taken in `Fin 3`, i.e. modulo 3.) -/
def icoV : Set E3 := {x | ∃ k : Fin 3, x k = 0 ∧ |x (k + 1)| = 1 / 2 ∧ |x (k + 2)| = φ / 2}

/-- Dodecahedron: 20 vertices, `(±φ/2, ±φ/2, ±φ/2)` and the cyclic permutations of
`(0, ±1/2, ±φ²/2)`. -/
def dodV : Set E3 :=
  {x | ∀ i, |x i| = φ / 2} ∪
  {x | ∃ k : Fin 3, x k = 0 ∧ |x (k + 1)| = 1 / 2 ∧ |x (k + 2)| = φ ^ 2 / 2}

/-- The regular tetrahedron of edge 1 (closed, solid). -/
def tet : Set E3 := convexHull ℝ tetV
/-- The cube of edge 1. -/
def cube : Set E3 := convexHull ℝ cubeV
/-- The regular octahedron of edge 1. -/
def oct : Set E3 := convexHull ℝ octV
/-- The regular icosahedron of edge 1. -/
def ico : Set E3 := convexHull ℝ icoV
/-- The regular dodecahedron of edge 1. -/
def dod : Set E3 := convexHull ℝ dodV

/-! ## 2. Placements -/

/-- A placement: an isometry of `E3` (a rotation or a rotation-reflection, then a translation). -/
abbrev Motion : Type := E3 ≃ᵃⁱ[ℝ] E3

/-- A placement is *proper* (rotation + translation, no reflection): its linear part has determinant 1. -/
def IsProper (g : Motion) : Prop :=
  LinearMap.det (g.linearIsometryEquiv.toLinearEquiv : E3 →ₗ[ℝ] E3) = 1

/-! ## 3. "`n` pieces fit" and "minimal edge" -/

/-- `n` copies of the piece `K`, placed by motions from the class `G`, fit in the container `C` scaled
to edge `s`: every placed copy lies in `s • C`, and two different copies have disjoint interiors. -/
def FitsWith (G : Set Motion) (K C : Set E3) (n : ℕ) (s : ℝ) : Prop :=
  ∃ g : Fin n → Motion,
    (∀ i, g i ∈ G) ∧
    (∀ i, g i '' K ⊆ s • C) ∧
    (∀ i j, i ≠ j → Disjoint (interior (g i '' K)) (interior (g j '' K)))

/-- Fits with rotations and translations only (the convention of the claims). -/
def Fits (K C : Set E3) (n : ℕ) (s : ℝ) : Prop := FitsWith {g | IsProper g} K C n s

/-- Fits when reflections are allowed as well. -/
def FitsRefl (K C : Set E3) (n : ℕ) (s : ℝ) : Prop := FitsWith Set.univ K C n s

/-- **The claim.** `s` is the minimal edge of a container `C` holding `n` copies of the piece `K`
(rotations and translations): `s ≥ 0`, the copies fit at `s`, and they fit at no `s'` with `0 ≤ s' < s`. -/
def IsMinEdge (K C : Set E3) (n : ℕ) (s : ℝ) : Prop := IsLeast {s | 0 ≤ s ∧ Fits K C n s} s

/-- The same claim when reflections are allowed. -/
def IsMinEdgeRefl (K C : Set E3) (n : ℕ) (s : ℝ) : Prop := IsLeast {s | 0 ≤ s ∧ FitsRefl K C n s} s

/-- **The enclosure claim** (for the cases without a closed form): the copies fit at no edge `s ≥ 0`
below `a`, and they fit at `b` (rotations and translations).  It does not assert that a minimal edge
exists; when it does, it lies in `[a, b]` (`IsMinEdge.mem_of_edgeBetween`). -/
def EdgeBetween (K C : Set E3) (n : ℕ) (a b : ℝ) : Prop :=
  (∀ s, 0 ≤ s → Fits K C n s → a ≤ s) ∧ Fits K C n b

/-! ## 4. Sanity checks of the definitions (these are *not* the claims) -/

/-- `IsMinEdge` spelled out. -/
theorem isMinEdge_iff (K C : Set E3) (n : ℕ) (s : ℝ) :
    IsMinEdge K C n s ↔ (0 ≤ s ∧ Fits K C n s) ∧ ∀ s', 0 ≤ s' → Fits K C n s' → s ≤ s' :=
  ⟨fun h => ⟨h.1, fun _ h0 hf => h.2 ⟨h0, hf⟩⟩, fun h => ⟨h.1, fun _ hs => h.2 _ hs.1 hs.2⟩⟩

/-- A larger class of motions can only make fitting easier. -/
theorem FitsWith.mono {G G' : Set Motion} (h : G ⊆ G') {K C : Set E3} {n : ℕ} {s : ℝ}
    (hf : FitsWith G K C n s) : FitsWith G' K C n s := by
  obtain ⟨g, hG, hin, hdis⟩ := hf
  exact ⟨g, fun i => h (hG i), hin, hdis⟩

/-- Fitting by rotations implies fitting when reflections are allowed. -/
theorem Fits.fitsRefl {K C : Set E3} {n : ℕ} {s : ℝ} (hf : Fits K C n s) : FitsRefl K C n s :=
  FitsWith.mono (Set.subset_univ _) hf

/-- The identity is a proper placement. -/
theorem isProper_refl : IsProper (AffineIsometryEquiv.refl ℝ E3) := by
  have h : ((AffineIsometryEquiv.refl ℝ E3).linearIsometryEquiv.toLinearEquiv : E3 →ₗ[ℝ] E3)
      = LinearMap.id := by
    refine LinearMap.ext fun x => ?_
    change (AffineIsometryEquiv.refl ℝ E3).linearIsometryEquiv x = x
    calc (AffineIsometryEquiv.refl ℝ E3).linearIsometryEquiv x
        = (AffineIsometryEquiv.refl ℝ E3).linearIsometryEquiv (x -ᵥ (0 : E3)) := by simp
      _ = (AffineIsometryEquiv.refl ℝ E3) x -ᵥ (AffineIsometryEquiv.refl ℝ E3) 0 :=
          AffineIsometryEquiv.map_vsub _ _ _
      _ = x := by simp
  rw [IsProper, h, LinearMap.det_id]

/-- The definitions are not vacuous: one copy of any set fits in itself at scale 1. -/
theorem fits_one_self (K : Set E3) : Fits K K 1 1 := by
  refine ⟨fun _ => AffineIsometryEquiv.refl ℝ E3, fun _ => isProper_refl, fun _ => ?_, ?_⟩
  · simp
  · intro i j hij
    exact absurd (Subsingleton.elim i j) hij

/-- With fewer pieces it is no harder to fit. -/
theorem FitsWith.of_le {G : Set Motion} {K C : Set E3} {m n : ℕ} {s : ℝ} (hmn : m ≤ n)
    (hf : FitsWith G K C n s) : FitsWith G K C m s := by
  obtain ⟨g, hG, hin, hdis⟩ := hf
  refine ⟨fun i => g (Fin.castLE hmn i), fun i => hG _, fun i => hin _, fun i j hij => hdis _ _ ?_⟩
  exact fun h => hij (Fin.castLE_injective hmn h)

/-- An enclosure is consistent with a minimal edge: if `s` is the minimal edge and the copies fit at no
`s' ≥ 0` below `a` and fit at `b ≥ 0`, then `a ≤ s ≤ b`. -/
theorem IsMinEdge.mem_of_edgeBetween {K C : Set E3} {n : ℕ} {s a b : ℝ} (hs : IsMinEdge K C n s)
    (h : EdgeBetween K C n a b) (hb : 0 ≤ b) : a ≤ s ∧ s ≤ b :=
  ⟨h.1 s hs.1.1 hs.1.2, hs.2 ⟨hb, h.2⟩⟩

/-! ## 5. The thirteen exact claims for two pieces (propositions, **not proved here**)

Name `XinY_n02`: two copies of the piece `X` in the container `Y`.  The value is the edge `s*` of the
container in the table "Two pieces" of the README. -/

/-- cube → octahedron, `s* = 1 + √2`. -/
def cubinoct_n02 : Prop := IsMinEdge cube oct 2 (1 + √2)

/-- icosahedron → cube, `s* = 1 + 2√5/3`. -/
def icoincub_n02 : Prop := IsMinEdge ico cube 2 (1 + 2 * √5 / 3)

/-- dodecahedron → icosahedron, `s* = 2 + 2√5/5`. -/
def dodinico_n02 : Prop := IsMinEdge dod ico 2 (2 + 2 * √5 / 5)

/-- icosahedron → octahedron, `s* = √(9/2 + 2√5)`. -/
def icoinoct_n02 : Prop := IsMinEdge ico oct 2 √(9 / 2 + 2 * √5)

/-- icosahedron → dodecahedron, `s* = √5 − 1`. -/
def icoindod_n02 : Prop := IsMinEdge ico dod 2 (√5 - 1)

/-- octahedron → dodecahedron, `s* = (2√5 + √10 − √2 − 4)/3`. -/
def octindod_n02 : Prop := IsMinEdge oct dod 2 ((2 * √5 + √10 - √2 - 4) / 3)

/-- cube → icosahedron, `s* = (49√5 − 53)/38`. -/
def cubinico_n02 : Prop := IsMinEdge cube ico 2 ((49 * √5 - 53) / 38)

/-- icosahedron → tetrahedron, `s* = 2√2·(1 + 2/√5)`. -/
def icointet_n02 : Prop := IsMinEdge ico tet 2 (2 * √2 * (1 + 2 / √5))

/-- cube → tetrahedron, `s* = 2 + √6/2 + 2√3/3`. -/
def cubintet_n02 : Prop := IsMinEdge cube tet 2 (2 + √6 / 2 + 2 * √3 / 3)

/-- octahedron → tetrahedron, `s* = 3`. -/
def octintet_n02 : Prop := IsMinEdge oct tet 2 3

/-- octahedron → icosahedron, `s* = 3√2 − √10` (v0.3.0). -/
def octinico_n02 : Prop := IsMinEdge oct ico 2 (3 * √2 - √10)

/-- dodecahedron → cube, `s* = (16 + 334√2 + 46√5 + 137√10)/267` (v0.3.0). -/
def dodincub_n02 : Prop := IsMinEdge dod cube 2 ((16 + 334 * √2 + 46 * √5 + 137 * √10) / 267)

/-- dodecahedron → octahedron, `s* = (411√2 + 157√10)/228` (v0.3.0). -/
def dodinoct_n02 : Prop := IsMinEdge dod oct 2 ((411 * √2 + 157 * √10) / 228)

/-! ## 6. The six enclosures for two pieces (propositions, **not proved here**)

For these cases no closed form of the minimal edge is claimed.  The claim is `EdgeBetween K C 2 a b`:
no fit below `a`, a fit at `b`.  `a` is the lower bound `s̄` of the certificate; `b` is a decimal
(ten places) rounded up from the certificate's upper bound `s_up` (for `dodintet`, `2√2` times a
rational rounded up from `u_up`), so `b − a ≤ 6·10⁻¹⁰` in every case.  `tetintet` and `dodintet` were
first published in v0.3.0 of the certificates; cubindod, icoinico, dodindod and octinoct (D44) in v1.0.0. -/

/-- tetrahedron → tetrahedron, `1.953564244 ≤ s* ≤ 1.9535642446` (v0.3.0). -/
def tetintet_n02 : Prop := EdgeBetween tet tet 2 (1953564244 / 10 ^ 9) (19535642446 / 10 ^ 10)

/-- dodecahedron → tetrahedron, `2√2 · 2.9973513058 ≤ s* ≤ 2√2 · 2.9973513060` (v0.3.0). -/
def dodintet_n02 : Prop :=
  EdgeBetween dod tet 2 (2 * √2 * (14986756529 / (5 * 10 ^ 9))) (2 * √2 * (14986756530 / (5 * 10 ^ 9)))

/-- cube → dodecahedron, `0.915543853 ≤ s* ≤ 0.9155438532` (v1.0.0). -/
def cubindod_n02 : Prop := EdgeBetween cube dod 2 (915543853 / 10 ^ 9) (9155438532 / 10 ^ 10)

/-- icosahedron → icosahedron, `1.963086047 ≤ s* ≤ 1.9630860472` (v1.0.0). -/
def icoinico_n02 : Prop := EdgeBetween ico ico 2 (1963086047 / 10 ^ 9) (19630860472 / 10 ^ 10)

/-- dodecahedron → dodecahedron, `1.9875980854 ≤ s* ≤ 1.9875980856` (v1.0.0). -/
def dodindod_n02 : Prop := EdgeBetween dod dod 2 (9937990427 / (5 * 10 ^ 9)) (19875980856 / 10 ^ 10)

/-- octahedron → octahedron, `1.933119581 ≤ s* ≤ 1.9331195812` (v1.0.0). -/
def octinoct_n02 : Prop := EdgeBetween oct oct 2 (1933119581 / 10 ^ 9) (19331195812 / 10 ^ 10)

end

end PackLean.Formal
