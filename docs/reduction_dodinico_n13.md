# Thirteen dodecahedra in an icosahedron: `dodinico_n13`

Case: `dodinico_n13` (thirteen unit-edge regular dodecahedra in a regular icosahedron). Tool: `d87_dod_*` with `d87_common.py`.

**Claim.** Let $s^{\ast}(13)$ be the least $s$ such that thirteen closed regular dodecahedra of edge 1 fit, with pairwise disjoint interiors, in a regular icosahedron of edge $s$. Then $s^{\ast}(13)=s_0=(25+7\sqrt5)/10=4.0652475\ldots$, the larger root of $5x^2-25x+19$, and the record `dodinico_n13` is optimal. The upper bound is an exact substitution in $\mathbb Q(\sqrt5)$ (§8). The lower bound $s^{\ast}(13)\ge s_0$ comes from a pigeonhole step over the twelve vertex cones of the container (two of the thirteen centroids lie in one cone), a table of points on 1,920 spherical triangles, and box certificates for one-piece inequalities (§2–§7). Uniqueness of the optimal configuration is not claimed.

This is a **computer-assisted** result and it is **not formally verified**. The argument and all code were written by Claude; they were read in two reviews by other Claude models (Opus and Fable, both without a fatal gap; summary in [review_log.md, Timeline (v1.0.0)](review_log.md#timeline-v100), Reviews 25 and 26). **There is no human or third-party review.** Lean checks only the arithmetic of the upper bound (§9); the lower bound rests on the prose below and on the Python replays.

## 1. Notation and scale

The piece $K$ is the regular dodecahedron of edge 1 with centroid at the origin; $K=-K$. The container is $sC$ with $C=\{x:\ a_f\cdot x\le1,\ f=1,\dots,20\}$ the regular icosahedron of edge 1. Coordinates are the canonical ones (icosahedron vertices the cyclic permutations of $\tfrac12(0,\pm1,\pm\varphi)$, dodecahedron vertices $\tfrac\varphi2(\pm1,\pm1,\pm1)$ and the cyclic permutations of $\tfrac\varphi2(0,\pm1/\varphi,\pm\varphi)$); the face normals are computed from the vertices exactly. A placed piece is $X=RK+t$ with $R$ a rotation (a reflection $R$ becomes the rotation $-R$ because $K=-K$), and $h_X(n)=h_K(R^{\top}n)+n\cdot t$. The inradius $\rho$ of $K$ has $\rho^2=5/8+11\sqrt5/40$. Rotations are written $R=M(q)/\lvert q\rvert^2$ for quaternions $q$. All acceptance tests use integers and rationals; $\sqrt5$ is enclosed by integers scaled by $2^{60}$.

## 2. Vertex cones and pigeonhole

For each container vertex $v_j$ let $Q_j$ be the closed cone of points whose maximal $v_i\cdot t$ is attained at $i=j$. The twelve cones cover space, so two of the thirteen centroids lie in the same cone. The rotation group of $C$ is transitive on vertices and preserves the container and the set of pieces $\{RK\}$, so the cone may be taken to be $Q$ of the vertex $v=(0,\tfrac12,\tfrac\varphi2)$. The eleven inequalities of $Q$ reduce to the five of the neighbouring vertices $v_k$: $g_k\cdot t\ge0$ with $g_k=v-v_k$ (`d87_dod_step0.py`, part a, checks with the five generators of $Q$ exactly). The dual cone $Q^{\ast}$ contains $Q$.

## 3. Widen and split

Suppose two pieces $X_i=R_iK+t_i$ with $t_i\in Q$ fit in $sC$ for some $s<s_0$, with disjoint interiors. Put $\lambda=s_0/s>1$ and $X_i'=R_iK+\lambda t_i\subset\operatorname{int}(\lambda X_i)\subset s_0C$. Then $X_1',X_2'$ are disjoint compact convex sets in $s_0C$ with centroids in $Q$, so some $n$ gives $h_{X_1'}(n)+h_{X_2'}(-n)<0$. From here on only the container at $s=s_0$ is used.

## 4. The table of points

Take 1,920 spherical triangles $T$ (§6, C1) and for each a point $w_T$, with **the same point for $T$ and $-T$**. It suffices to show, for every $T$,

$$(\star)\qquad X\subset s_0C,\ t\in Q\ \Longrightarrow\ h_X(n)\ge n\cdot w_T\quad\text{for all }n\in\operatorname{cone}(T).$$

Indeed, choosing $T\ni n$ gives $h_{X_1'}(n)+h_{X_2'}(-n)\ge n\cdot w_T-n\cdot w_T=0$, against §3. The triangles fall into three kinds (§6, C2):

- $T\subset Q^{\ast}$ (340 triangles): point $w_0=(\rho/\lvert v\rvert)\,v=(0,\tfrac14+\tfrac{3\sqrt5}{20},\tfrac12+\tfrac{\sqrt5}5)\in\mathbb Q(\sqrt5)^3$, claim (I); then $-T\subset-Q^{\ast}$ is claim (II).
- $T\subset-Q^{\ast}$ (340): claim (II); $-T$ is (I).
- the band (the other 1,240): $T=\sigma(\pm N_r)$ with $\sigma$ in the stabiliser of $v$ (10 elements, including 5 reflections) and $N_r$ one of 62 representatives of the table `d87_dod_table.json`; the point is $\sigma w_r$ with $w_r$ rational (denominator 1000).

**Symmetry.** $h_X(\sigma n')=h_{\sigma^{-1}X}(n')$; $\sigma^{-1}$ preserves $C$ and $Q$, and if $\sigma^{-1}R$ is a reflection then $(-\sigma^{-1}R)(-K)=(-\sigma^{-1}R)K$ is a rotation again. So each claim is needed only on the representatives.

## 5. How $t$ is eliminated; (I), (II) and the band

**Weak duality.** For fixed $R$ the admissible $t$ satisfy the 25 linear inequalities $a_f\cdot t\le s_0-H_f(R)$ (the **20 container faces**, $H_f(R)=\max_u a_f\cdot Ru$ over the vertices $u$ of $K$) and $-g_k\cdot t\le0$ (the **5 cone faces**). If $y\ge0$ and $\sum_ky_k(\text{row}_k)=-n$, then $\min_t n\cdot t\ge\sum_{f\in\text{container}}y_f\,(H_f(R)-s_0)$. Only this lower bound is used (no strong duality); if the set of $t$ is empty the claim is void. Writing $G(n,R):=h_K(R^{\top}n)+\min_t n\cdot t$, each of (II) and the band is the statement $G(n,R)\ge n\cdot w$ for all $R$ and all $n$ in a region.

**(I)** needs no computation: for $n\in Q^{\ast}$ and $t\in Q$, $n\cdot t\ge0$, and $h_K(R^{\top}n)\ge\rho\lvert n\rvert\ge n\cdot w_0$ since $\lvert w_0\rvert^2=\rho^2$ exactly.

**(II).** $G(n,R)\ge n\cdot w_0$ for all $n\in-Q^{\ast}$ and all $R$, with equality at $n=-v$ and $R=R^{\ast}$ (a corner piece of the record, centroid $2w_0$). The duality uses **all 20 container faces and all 5 cone faces**; in the record the cone faces 2 and 3 do work (test B4b). It is not claimed that (II) holds without the cone. The section of $-Q^{\ast}$ by the plane $n\cdot v=-\lvert v\rvert^2$ is the regular pentagon $\operatorname{conv}(P_k)$, $P_k=-2\lvert v\rvert^2g_k$; the stabiliser of $v$ reduces it to the fundamental triangle $(-v,\ P_{k_0},\ \text{edge midpoint})$ (`check_map` checks the 10 images exactly). Since $G$ and $n\cdot w$ are positively homogeneous of degree 1 in $n$, a plane section suffices.

**Band.** For each representative, $G(n,R)\ge n\cdot w_r$ on $\operatorname{cone}(N_r)$ and on $-\operatorname{cone}(N_r)$ (the far record T, 124 charts $2r$ and $2r+1$).

## 6. Covering lemmas

Test C of `d87_dod_tests.py`, re-run by the entry point every time:

- **C1.** The fundamental domain of the icosahedral group (vertex $v$, an edge midpoint, a face centre), subdivided twice into four (unnormalised midpoints) and mapped by the 120 symmetries, gives 1,920 flat triangles. Oriented consistently, all have $\det>0$, and each of the 2,880 oriented edges pairs with exactly one reversed edge: a closed 2-cycle. One generic ray meets it once with sign $+$, so its winding number about the origin is 1. If some direction missed every triangle, the cycle would lie in space minus that ray (contractible) and have winding number 0, a contradiction. Hence **every direction lies in the closed cone of some triangle**. $V-E+F=962-2{,}880+1{,}920=2$ and two further generic points are sentinels only.
- **C2.** The classification ($Q^{\ast}$ 340, $-Q^{\ast}$ 340, band 1,240) is done exactly with the five edges of $Q$.
- **C3.** The band is the disjoint union of the orbits of the 62 representatives under (stabiliser of $v$) $\times\{\pm1\}$, each of size 20.
- **C4.** For band $T$, $-T$ is also in the band with the same point; the far charts $2r$, $2r+1$ use $\pm N_r$ with the same $w_r$ (the header `charts` agree exactly with charts rebuilt from the table).

## 7. Box certificates and the local region $L_P$

**Local $L_P$** (`d87_dod_local.py`, record `d87_dod_local_P.*`). Coordinates $n=-v+\xi_1(1,0,0)+\xi_2(0,\tfrac\varphi2,-\tfrac12)$, $R=R^{\ast}M(1,p)/\lvert q\rvert^2$, with $\lvert\xi\rvert_\infty\le1/4$, $\lvert p\rvert_\infty\le1/8$; claim $G(n,R)\ge n\cdot w_0$. Candidates $P_c=\lvert q\rvert^2\,[\,n\cdot Ru_i+\sum_fy_f(a_f\cdot Ru_j-s_0)-n\cdot w_0\,]$ (a basis $B$, a top vertex $i$, a vertex $j$ per face; 200 candidates, all with zero-order part $0$ exactly in $\mathbb Q(\sqrt5)$). With $z=r\theta$ on the 10 faces of the 5-cube and $r\in[0,1]$, $P_c=r\Lambda_c$; a leaf is accepted when $y_B\ge0$ on the box and $\Lambda_c>0$. Record: 10 faces, 2,515 leaves, split limit 0.

**Far** (`d87_dod_far.py`, records `d87_dod_far_II.*` and `d87_dod_far_T.*`). $n$ runs over a tree of triangles (split at midpoints), $R$ over quaternion boxes (4 charts).

- *Type A.* At each triangle vertex $n_v$ a basis $B_v$ with $y_v=-A_{B_v}^{-\top}n_v\ge0$ and a vertex $j$ per face; the top vertex $i$ is shared. Since $m_R(n)=\min_tn\cdot t$ is concave in $n$, $E_v\ge0$ at the three vertices gives the whole triangle. $\lvert q\rvert^2E_v$ is linear in $M(q)$ and $\lvert q\rvert^2$ and is bounded below by `quad_lb`.
- *Type D.* A box is discarded if $\operatorname{tr}(Rk)>\operatorname{tr}(R)$ on all of it for one of the 59 nontrivial piece rotations $k$ (the image of maximal trace lies in a leaf that is not discarded).
- *Type L* ((II) only). The three vertices lie in the $\xi$-square of $L_P$, and at the 8 corners of the $R$-box $w=\bar q^{\ast}\otimes q\otimes\bar k$ has $\pm w_0>0$ and $\lvert w_m\rvert\le\tfrac18(\pm w_0)$ (a convex cone, a linear map). The identity $R(q)k^{-1}=R^{\ast}M(w)/\lvert w\rvert^2$ is checked by `check_map` as a polynomial identity (10 points of a quadratic form).

Records: (II) 70 $n$-triangles, $R$-leaves 11,662 accepted, 5,200 discarded, 41 to $L_P$, 49,487 boxes evaluated; T 124 charts, 331 $n$-triangles, 45,552 accepted, 26,163 discarded, 0 to $L_P$, 418,175 evaluated; split limit 0 in both. **Chain of coverage:** the far headers name the local record and its widths, and the entry point checks that they match.

## 8. Upper bound

The record (`dodinico_n13.json`, value `closed_form_dodinico_n13.json`) has one piece at the origin and, for each container vertex $v_j$, a corner piece with centroid $2\rho\hat v_j$; the rotations are the record's quaternions rounded into $\mathbb Q(\sqrt5)$ and checked to be exact rotations. All 13 pieces lie in $s_0C$ (120 vertices on the boundary), and each of the 78 pairs has a weakly separating plane (42 pairs touch: centre–corner 12, adjacent corners 30), so the interiors are disjoint. `d87_dod_step0.py` part a checks this exactly in $\mathbb Q(\sqrt5)$; with $s_0-1/1000$ the pieces do not fit.

## 9. What Lean and Python check, and what they do not

**Lean.** `lean/PackLean/D87Dod/Arith.lean` (core Lean, no Mathlib, numbers $a+b\sqrt5$ with integers $a,b$; exported by `verifier/d87_dod_lean_export.py`) checks with `decide +kernel`: `s0_ok` ($5s_0^2-25s_0+19=0$, $s_0>5/2$), `container_ok`, `piece_ok` ($K=-K$, inradius, $\lvert w_0\rvert^2=\rho^2$), `upper_ok` (13 orthogonal matrices of determinant $+1$, the centroids, containment in $s_0C$, and $\max\le\min$ along the given normal for all 78 pairs) and `broken_ok`. The separating normals are found in Python and only checked in Lean. `#print axioms` lists at most `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`.

**Python.** The entry point `verifier/d87_dod_replay_all.py` checks the constants, the table and the headers, the SHA-256 of the records and code (`d87_dod_manifest.json`), the upper bound (step 0 part a), replays the records of $L_P$, (II) and T without floating point, re-runs test C, and checks the stored test results `d87_dod_tests.json` (66 tests: C, X, P, W and B including B4b, 0 failures) against the code hashes.

Neither checks:
1. the reasoning: the pigeonhole step (§2), widen and split (§3), the reduction to the table (§4), weak duality and (I) (§5), the symmetry maps, and the meaning of the covering lemmas and of the chain of coverage between the far L leaves and $L_P$;
2. the lower bound in Lean at all;
3. the interpreter and libraries (Python, `flint`, `sympy`) and the Lean kernel.

## 10. Not used in the argument

- The points $w_r$ of the table come from a floating-point window LP (`d87_dod_step0.py` part c); the stored angles `angles_from_v_deg` are labels only (not true angles). Any choice of points is valid if the records pass.
- The strong duality "best basis = LP in $t$" and the floating-point $G$ are for orientation only; acceptance uses weak duality.
- The sharpness estimates of part b and the choice of candidates in floating point only choose the certificate.
