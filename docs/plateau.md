# Three to five pieces in a tetrahedron: icosahedra and octahedra

Cases: `icointet_n03`, `icointet_n04`, `octintet_n03`, `octintet_n04` (the "plateau": the minimal edge does not grow from $n=2$ to $n=4$), and `icointet_n05`, `octintet_n05` (the first value above the plateau). Tools: `d28_plateau_n34.py`, `d31_plateau_n34.py`, `plateau_n05_upper.py`, `plateau_end_check.py`.

These claims are elementary compared with the $n=2$ cases: the upper bounds are exact substitutions of explicit configurations, the lower bound for $n=3,4$ is the $n=2$ result, and the lower bound for $n=5$ is a pigeonhole argument with inscribed balls. Everything is a prose argument, read once by a reviewer model ([review_log.md](review_log.md)); the arithmetic is re-checked in Lean with `decide +kernel` (no `native_decide`).

## 1. Claims

| id | $s^{\ast}$ (closed form) | decimal | lower bound from | upper bound |
|---|---|---|---|---|
| `icointet_n03`, `icointet_n04` | $2\sqrt2\,(1+2/\sqrt5)$ | 5.358249252… | `icointet_n02` + monotonicity | exact substitution, $n=4$ |
| `octintet_n03`, `octintet_n04` | $3$ | 3 | `octintet_n02` + monotonicity | exact substitution, $n=4$ |
| `icointet_n05` | $\tfrac53\sqrt{3\sqrt5+7}=\tfrac{5\sqrt2}{3}\varphi^2$ | 6.170765289… | §4 (pigeonhole) | exact substitution, $n=5$ |
| `octintet_n05` | $10/3$ | 3.333333333… | §4 (pigeonhole) | exact substitution, $n=5$ |

Same conventions as for $n=2$ (unit edge, closed pieces, touching allowed; minimum, or infimum if touching is forbidden; reflections do not change the value since both pieces are centrally symmetric). Only the **value** of the minimal edge is claimed: not the uniqueness of the configuration, and nothing for $n\ge6$ (the lower bound of §4 holds for all $n\ge5$ but is not shown to be attained for $n\ge6$).

## 2. Lower bound for $n=3,4$

Removing pieces preserves feasibility, so $s^{\ast}(2)\le s^{\ast}(3)\le s^{\ast}(4)$. With the $n=2$ lower bounds (`icointet_n02` in [reduction_tetrahedron.md](reduction_tetrahedron.md), `octintet_n02` in [reduction_octintet.md](reduction_octintet.md)), $s^{\ast}(3),s^{\ast}(4)\ge s^{\ast}(2)$. The lower bounds for $n=3,4$ therefore depend on everything the $n=2$ proofs depend on.

## 3. Upper bounds by exact substitution ($n=2,3,4,5$)

Container: the tetrahedron $\{x:\ b_f\cdot x\le c\}$ with $b_f\in\{(-1,-1,-1),(-1,1,1),(1,-1,1),(1,1,-1)\}$; its edge is $s=2\sqrt2\,c$, i.e. $s^2=8c^2$. For each piece, the exact coordinates of its vertices (in $\mathbb{Q}(\sqrt5)$ for icosahedra, $\mathbb{Q}(\sqrt2)$ for octahedra) are read from a certificate file `certificates/plateau_<solid>_n<N>.json` (integers and fractions as strings, no floating point), and three checks are made with exact arithmetic only:

1. **Congruence.** The squared distances between all pairs of vertices of each piece equal those of the standard unit-edge solid (66 pairs for the icosahedron, 15 for the octahedron). Since the vertices span $\mathbb{R}^3$, the piece is the image of the standard solid under an isometry; if the isometry contains a reflection, the image is still the same solid because both solids are centrally symmetric.
2. **Containment.** Every vertex satisfies $b_f\cdot v\le c$ for all four $f$. The container is convex, so the convex hull, i.e. the piece, is inside.
3. **Separation.** For every pair of pieces $i<j$ there are a normal $n\ne0$ and a height $h$ with all vertices of piece $i$ satisfying $n\cdot v\le h$ and all vertices of piece $j$ satisfying $n\cdot v\ge h$. Then the two convex hulls lie in opposite closed half-spaces and their interiors are disjoint.

Signs of elements $a+b\sqrt d$ are decided exactly ($a$ and $b$ of opposite signs: the sign of $a^2-db^2$). The input configurations were taken from public numerical records (floating point) and rounded to exact values in the field; the floats only propose the candidates, and acceptance uses only the exact coordinates now stored in the certificate files. (The rounding step is kept as `--from-records DIR` for when the records are available; the certificate files were written by it and agree with the values used in the original runs.)

| case | container $c$ | containment inequalities | contacts with walls | separating planes |
|---|---|---|---|---|
| icointet $n=2$ (cross-check) | $1+\tfrac{2\sqrt5}5$ | 96 | 18 | 1 |
| icointet $n=3$ | same | 144 | 27 | 3 |
| icointet $n=4$ | same | 192 | 36 | 6 |
| icointet $n=5$ | $\tfrac54+\tfrac{5}{12}\sqrt5$ | 240 | 36 | 10 |
| octintet $n=2$ (cross-check) | $\tfrac{3\sqrt2}4$ | 48 | 18 | 1 |
| octintet $n=3$ | same | 72 | 27 | 3 |
| octintet $n=4$ | same | 96 | 36 | 6 |
| octintet $n=5$ | $\tfrac{5\sqrt2}6$ | 120 | 36 | 10 |

The $n=4$ substitution alone gives the upper bound for $n=2,3,4$ (removing pieces); the $n=2,3$ substitutions are cross-checks of the tool against stage 0 of the $n=2$ proofs. For octintet $n=2$ the recorded numerical configuration sits at a non-rational orientation on the plateau and cannot be rounded into $\mathbb{Q}(\sqrt2)$; the configuration of test U of `octintet_n02` (both pieces with $R=I$) is used instead.

*Hand cross-check (not part of the proof).* octintet $n=4$: the centres are $\tfrac{\sqrt2}4(\pm1,\pm1,\pm1)$ with an even number of minus signs — the four octahedra of the tiling of the edge-3 tetrahedron by tetrahedra and octahedra. icointet $n=4$: the centres are $a(\pm1,\pm1,\pm1)$ (same sign pattern), $a=\tfrac14+\tfrac{3\sqrt5}{20}$; each piece touches three walls with a face, and the separating planes pass through the origin tangent to the inscribed spheres, consistent with $c^{\ast}=\sqrt3\,r(1+1/\sqrt5)=1+2\sqrt5/5$.

## 4. Lower bound for $n\ge5$: $L\ge20r/\sqrt6$

Let $r$ be the inradius of the unit-edge piece ($r^2=1/6$ for the octahedron, $r^2=(7+3\sqrt5)/24$ for the icosahedron) and $L$ the edge of the container.

1. The inscribed ball of radius $r$ lies in the piece (the piece is the intersection of the half-spaces of its faces, and all faces are at distance $r$ from the centre). The pieces do not overlap, so neither do the balls: **centres are at distance $\ge2r$**.
2. Each ball lies in the container, so its centre is at distance $\ge r$ from each face: the centres lie in the tetrahedron $T'$ of edge $L'=L-2\sqrt6\,r$ (for a regular tetrahedron, edge $=2\sqrt6\times$ inradius). If $L'<0$ no ball fits; if $L'=0$ all centres coincide, contradicting 1 for two or more pieces.
3. Split $T'$ into four closed cells by nearest vertex. The four cells cover $T'$. Each cell is a bounded convex polyhedron with 8 vertices (a vertex of $T'$, three edge midpoints, three face centroids, the centroid), so its diameter is the largest distance between two of its vertices, which is **$(\sqrt6/4)\,L'$** (vertex to centroid).
4. Five centres in four closed cells: two share a cell, so $2r\le(\sqrt6/4)L'$. The inequality is non-strict, so points on cell boundaries need no special treatment.
5. Hence $L\ge2\sqrt6\,r+8r/\sqrt6=20r/\sqrt6$. For $n\ge5$ pieces apply the argument to any five of them.

Values: octintet $20/(6)=10/3$; icointet $\tfrac{20}{\sqrt6}\cdot\tfrac{\varphi^2}{2\sqrt3}=\tfrac{5\sqrt2}3\varphi^2$. Both exceed the plateau values (3 and 5.358…), so the plateau ends at $n=4$, and both equal the edge of the $n=5$ containers in §3, which gives the minimum for $n=5$.

**Exact checks** (`plateau_end_check.py`). The tetrahedron is placed at the rational points $(\pm1,\pm1,\pm1)$ (edge$^2=8$); each cell is the intersection of the 4 face half-spaces and 3 bisector half-spaces; all triple intersections of these planes are solved with `Fraction` and the cell's vertices enumerated: 8 vertices in each of the 4 cells and **diameter$^2$/edge$^2=3/8$** exactly. The comparisons are made on squares: octintet $100/9>9$ (rational), icointet $L_b^2-s^{\ast2}=\tfrac{227}{45}+\tfrac{29}{15}\sqrt5>0$ (exact sign in $\mathbb{Q}(\sqrt5)$). **The values of $r^2$ are typed into the Python script; Python alone would not detect a wrong $r$.** They are derived from the pieces in Lean (`inrad_*_ok`: every face plane of the standard solid is at the same squared distance from the centre) and cross-checked against a floating-point computation from the face equations of the standard solids.

## 5. What Lean checks here

`lean/PackLean/Plateau/` (no Mathlib, `decide +kernel` only):

- upper bounds $n=2,3,4,5$: for every piece, all pairwise squared distances equal those of the standard solid (built by Lean itself), all vertices satisfy the container inequalities, every pair has a separating plane; the counts (containment, contacts, planes) on the right-hand sides equal the Python counts; $8c^2$ equals the claimed $s^2$;
- lower bound $n=5$: the 6 edges of the rational tetrahedron, the 4 cells (vertices from Cramer's rule, all pairwise squared distances $\le\tfrac38$ edge$^2$ with equality attained), the inradii of the container and of both pieces from their face planes, the identity $(2\sqrt6+8/\sqrt6)^2=400/6$, the sign of $L_b^2-(\text{plateau})^2$, and $L_b^2=8c^2$ for the $n=5$ containers.

Lean does not check: that the three checks of §3 imply a packing (congruence ⇒ isometry, convexity, separation), that the cells cover $T'$ and that the diameter of a bounded polyhedron is attained at vertices, the ball argument of §4, or the monotonicity in $n$.

## 6. Injected errors

Python: for each case $n=2,3,4,5$ and both solids, (a) shrink the container by $1/1000$, (b) move one vertex of piece 0 by $1/1000$, (c) raise the first separating plane above the lowest vertex of the upper piece, plus further variants (move a piece towards its neighbour, drop a separating pair, zero normal) — all rejected. For icointet $n=5$ the same 7 variants (`inject_d28`) are run in addition to the shrunken container (in v0.2.0; before, only the shrunken container was tried on the Python side): all 8 rejected. Each script stops with an error if any injected variant is accepted. For the lower bound: drop one bisector plane, confuse the plateau value with $10/3$, scale $r$ by $0.8$, flip the sign of the $\sqrt5$ coefficient of $r^2$, plateau $6.1708$ — all rejected.

Lean: 12 injected certificates for the $n=3,4$ upper bounds (3 kinds × $n=3,4$ × two solids), 6 for the $n=5$ upper bounds, 6 for the $n=5$ lower bound; all fail to build (either "`decide` proved that the proposition … is false" or, when the shrunken container makes the checker return `none`, a type mismatch of the `decide` term).
