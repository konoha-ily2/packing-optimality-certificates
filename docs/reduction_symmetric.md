# Reduction for a centrally symmetric container and piece

Cases: `cubinoct_n02`, `icoincub_n02`, `dodinico_n02`, `icoinoct_n02`, `icoindod_n02`, `octindod_n02`, `cubinico_n02`.

This document states the reduction from "two pieces fit" to a minimisation over rotations of a small linear program, the symmetry reduction of the rotation domain, the bound on the translation used by the box certificates, and the local lemma. `cubinoct_n02` uses its own coordinates and its own checker (`d16_cover_*`), described in the last part. The other six use the general tool `d16d_*`, or its extension `d16e_*` to two square roots (`octindod_n02`); `cubinico_n02` uses `d16e_*` through a thin wrapper `d30_*` that adds the problem and stores the local certificate (§6b).

Everything here is a prose argument. It has been re-derived once by a reviewer model (see [review_log.md](review_log.md)) but has not been formalized; Lean checks only the arithmetic built on top of it.

## 1. Setting

- (P1) The container $C$ is centrally symmetric about the origin: $C=-C$. The container of edge $s$ is $sC$.
- (P2) The piece $K$ is a compact convex set with nonempty interior.
- (P3) Placements are either "rotations and translations" or "rotations, reflections and translations", and $-K$ is a placement of $K$.
- (P4) "Two pieces fit" means there are closed placements $K_1,K_2\subset sC$ with $\operatorname{int}K_1\cap\operatorname{int}K_2=\emptyset$ (touching allowed).

All Platonic pieces used here (cube, octahedron, icosahedron, dodecahedron) satisfy $K=-K$ about their centre, so (P3) holds with rotations and translations only, and allowing reflections does not change the answer.

## 2. Lemma R

**Lemma R.** Under (P1)–(P4) the following are equivalent:

1. there are placements $K_1,K_2\subset sC$ with disjoint interiors;
2. there is a placement $K'\subset sC$ with $0\notin\operatorname{int}K'$.

*(1 ⇒ 2).* The interiors are disjoint, so the origin cannot lie in both; take $K'$ to be one whose interior misses the origin. No hypothesis is used.

*(2 ⇒ 1).* Let $K'=RK+t\subset sC$ with $0\notin\operatorname{int}K'$. Since $\operatorname{int}K'$ is an open convex set not containing $0$, there is $v\ne0$ with $v\cdot x>0$ on $\operatorname{int}K'$. Because $K=-K$, we have $-K'=R(-K)-t=RK-t$, which is a placement using only a rotation and a translation, and $C=-C$ gives $-K'\subset sC$. On $\operatorname{int}(-K')$ we have $v\cdot x<0$, so $\operatorname{int}K'$ and $\operatorname{int}(-K')$ are disjoint. The same formula is valid whether or not reflections are allowed. ∎

**Minimum is attained.** "$K'\subset sC$" is a closed condition in (placement, $s$), "$0\in\operatorname{int}K'$" is open, so its negation is closed; placements are confined to a bounded set. Hence the minimal $s$ exists for the "touching allowed" definition. If touching is forbidden the same value is an infimum and is not attained.

## 3. One face of the piece, and the LP $\varphi(R)$

Write the piece as $K=\{x:\ n_f\cdot x\le D_f\}$ and the container as $\{x:\ c_g\cdot x\le S\}$ (normals scaled so that all container offsets are equal; $S$ is proportional to $s$, see the table in §7). Since a polyhedron's interior is the intersection of open half-spaces,

$$0\notin\operatorname{int}(RK+t)\iff\text{for some face } f:\ (Rn_f)\cdot t\le -D_f .$$

**Face orbit.** If every face normal is $n_f=h\,n_0$ for a *rotation* $h$ of the piece, replacing $R$ by $Rh$ moves face $f$ to the fixed face $n_0$ without changing the placed piece. Hence the minimum over all $R$ and all faces equals the minimum over all $R$ with face $n_0$ only. For the three pieces in `d16d_*` the rotation group (order 60) acts transitively on the faces (icosahedron: $20=60/3$; dodecahedron: $12=60/5$). The tool checks this exactly: the number of images of $n_0$ under the symmetries with $\det=+1$ equals the number of faces of the convex hull of the piece (counted separately from the vertices), and every image has support value $D_0$. For the cube, the rotation group (order 24) is transitive on the 6 faces; for the octahedron (also order 24) on the 8 faces ($8=24/3$). The same exact check is run for `octindod_n02` (`d16e_*`) and `cubinico_n02`.

**The LP.** With $h_g(R):=\max_{v\in\operatorname{vert}K} c_g\cdot Rv$,

$$\varphi(R):=\min\ S\quad\text{s.t.}\quad c_g\cdot t+h_g(R)\le S\ \ (\text{all container faces } g),\qquad (Rn_0)\cdot t\le -D_0 .$$

By Lemma R the minimal container is given by $S^{\ast}=\min_{R\in SO(3)}\varphi(R)$.

**Weak duality** (used by every lower bound). For $\lambda_g\ge0$ with $\sum\lambda_g=1$ and $\mu\ge0$, every feasible $(t,S)$ satisfies

$$S\ \ge\ \sum_g\lambda_g h_g(R)+\mu D_0+E\cdot t,\qquad E:=\sum_g\lambda_g c_g+\mu Rn_0 .$$

## 4. Symmetry reduction and the discard rule

**Invariance.** Let $g$ be a symmetry of the container and $k$ a symmetry of the piece fixing $n_0$, with $\det g\cdot\det k=1$. Then $gRk$ is a rotation and $\varphi(gRk)=\varphi(R)$: $g(RK+t)=(gRk)K+gt$ because $kK=K$, the container is invariant under $g$, and $(gRk\,n_0)\cdot(gt)=(Rn_0)\cdot t$.

**Discard rule** (`d16d_*`). A box is discarded if $\operatorname{tr}(gRk)>\operatorname{tr}(R)$ holds strictly on the whole box for one such pair $(g,k)$. In each orbit the representative of maximal trace cannot lie in a discarded box, and $\varphi$ is constant on orbits, so proving the bound on the remaining boxes suffices for all $R$. Each pair $(g,k)$ used is checked exactly, one by one, to be an orthogonal matrix mapping the relevant point set to itself. Therefore **completeness of the enumeration is not needed for correctness**: missing pairs only mean fewer discarded boxes (test m5a shows exactly this: halving the set of pairs either still closes or fails to close, never accepts falsely). The numbers of pairs are as expected: $48\times6/2=144$ (icoincub, icoinoct), $120\times10/2=600$ (dodinico), $120\times6/2=360$ (icoindod, octindod) and $120\times8/2=480$ (cubinico). (Pairs that act as the identity, $gRk=R$ for all $R$, cannot discard anything and are left out of the far runs: 354 pairs are used for icoindod and octindod, 478 for cubinico.)

**Charts.** Rotations are written as quaternions $q=(w,x,y,z)$ with the component of largest absolute value normalised to $1$; this gives four charts, each the cube $[-1,1]^3$, which together cover $SO(3)$. The rotation matrix is $R(q)/\lvert q\rvert^2$ with $R(q)$ quadratic in $q$, so after multiplying by $N=\lvert q\rvert^2>0$ all expressions are polynomials. Before starting, the piece is rotated by the optimal rotation $R^{\ast}$, so the optimum sits at $R=I$, i.e. $q=(1,0,0,0)$ in chart 0.

## 5. Range of the translation

Since the faces of the piece form a single orbit, every face is at distance $D_0/\lvert n_0\rvert$ from the centre, so the piece contains the ball of radius $r_{\rm in}=D_0/\lvert n_0\rvert$ around its centre. Hence $h_g(R)\ge r_{\rm in}\lvert c_g\rvert$, and every solution with $S<\bar S$ ($\bar S$ a rational upper bound of $S^{\ast}$) satisfies

$$c_g\cdot t\ \le\ \bar S-r_{\rm in}\lvert c_g\rvert\ \le\ T\quad\text{for all }g,\qquad\text{i.e.}\quad t\in T\cdot P,\ \ P=\{x:\ c_g\cdot x\le1\}.$$

$P$ is a bounded polytope, so the linear form $E\cdot t$ attains its minimum at a vertex $w$ of $P$: $E\cdot t\ge T\min_w E\cdot w$. The tool checks $T>0$ and $(\bar S-T)^2\le r_{\rm in}^2\lvert c_g\rvert^2$ for every face, exactly in the number field. The vertex list of $P$ is generated as all triple intersections of faces that satisfy all face inequalities (Lean additionally checks that this list is complete).

$T$ values: icoincub $1/2$, dodinico $121/64$, icoinoct $53/64$, icoindod $77/64$, octindod $13/16$, cubinico $71/64$. These are bounds on solutions with $S<\bar S$ only, which is all the argument uses.

## 6. The local lemma (`d16d_*`)

Let $J$ be three container faces active at $R^{\ast}=I$ with $M_J=[c_j]_{j\in J}$ invertible, and $\alpha$ a choice of one maximising vertex $v_j$ for each $j\in J$. Set

$$A=-M_J^{-1}\,R(q)\,n_0,\qquad \lambda_j=A_j\big/\textstyle\sum A,\qquad \mu=N\big/\textstyle\sum A .$$

Then $E=\sum_j\lambda_j c_j+\mu Rn_0=0$ identically and $\sum\lambda=1$. If $\lambda\ge0$, weak duality gives $\varphi\ge B_{J,\alpha}$ (using $h_j\ge c_j\cdot Rv_j$), and $F:=N\sum A\,(B_{J,\alpha}-S^{\ast})$ is a polynomial in $p=(x,y,z)$ (chart 0, $q=(1,p)$).

- **Zero-order identity:** $F(0)=0$ is checked exactly in the number field for each candidate $(J,\alpha)$.
- **Cube faces:** write $p=\rho\theta$ with $\rho=\lVert p\rVert_\infty\in[0,\rho_0]$, $\rho_0=1/16$, and $\theta$ on one of the 6 faces of $[-1,1]^3$. Then $F=\rho\,G$, and the checker shows $G>0$ on boxes covering each face × $[0,\rho_0]$ (integer-only acceptance).
- **$\lambda\ge0$:** components $A_j$ positive at $R^{\ast}$ are bounded below by a positive number on the box; components that vanish at $R^{\ast}$ are first checked to be divisible by $\rho$, and then $A_j/\rho\ge0$ is checked.
- Each box may use a different candidate $(J,\alpha)$, since every $B_{J,\alpha}$ with $\lambda\ge0$ is a lower bound of $\varphi$. The choice of $J$ and $\alpha$ only affects whether the box closes, not correctness.

Conclusion: on $\lVert p\rVert_\infty\le\rho_0$, $\varphi>S^{\ast}$ except at $p=0$. The far region's "to local" leaves are checked by replay (with integers) to lie inside this cube of chart 0, with the same constant $\rho_0=1/16$ and the same coordinates.

## 6a. The tool `d16e_*`: two square roots

The optimal rotation of `octindod_n02` does not lie in $\mathbb{Q}(\sqrt5)$: the octahedron's vertices $\pm(\sqrt2/2)e_k$ bring in $\sqrt2$, which mixes with the $\sqrt5$ of the dodecahedral container, and $R^{\ast}$, $S^{\ast}$ and $s^{\ast}$ lie in $\mathbb{Q}(\sqrt2,\sqrt5)$. `d16e_*` is a copy of `d16d_*` in which only the number field was generalised:

- A number is $\sum_m c_m\sqrt m$ over the products $m$ of generators, i.e. four rational components $1,\sqrt2,\sqrt5,\sqrt{10}$ for $\mathbb{Q}(\sqrt2,\sqrt5)$; a polynomial is a tuple of such components.
- Box lower bounds enclose each of $\sqrt2,\sqrt5,\sqrt{10}$ between integers divided by $2^{120}$ and are decided with integers only, exactly as before. **Acceptance inequalities are decided by these integer bounds.** The premises ($\bar S\ge S^{\ast}$, the check of $T$, the vertices of $P$, the symmetry matrices, $\varphi(I)=S^{\ast}$, the inverse matrices of the local stage) are checked with exact signs, equalities and divisions in the field; every division and every inverse is self-checked on each run (quotient × divisor = dividend, $M\cdot M^{-1}=I$). Signs are decided by enclosing with increasing precision; zero means all components are zero.
- With one generator, `d16e_*` makes the same decisions as `d16d_*`: on icoincub ($T=1/2$), icoinoct, icoindod and dodinico the far counts (evaluated, accepted, discarded, to local, split limit) and the local box counts per face are identical. This regression shows agreement in the one-generator case only. The parts specific to two generators (products such as $\sqrt2\cdot\sqrt{10}$, the division by two successive conjugates, the enclosure of $\sqrt{10}$) are supported by the exact zero-order identities (8 candidates, all components $0$), the first-order terms (48 pairs) compared independently with sympy, the tests of `octindod_n02` (U, S, V, C, P, W, X and m1–m5, see tests/README.md), and by the Lean re-check, whose field arithmetic is a separate implementation.
- Fields with more than two generators have not been tried.

`icoindod_n02` is proved with `d16d_*` (field $\mathbb{Q}(\sqrt5)$); running it through `d16e_*` is the regression above, not the proof.

## 6b. `cubinico_n02`: the same checks, with a stored local certificate

`cubinico_n02` (cubes in an icosahedron) is set up by `d30_problems.py`, which adds the problem to `d16e_common` without changing it; the field is $\mathbb{Q}(\sqrt5)$. The far region is `d16e_far` unchanged ($\rho_0=1/16$, $T=71/64$). The local region uses exactly the single-candidate check of §6 (`check_single` in `d30_local.py`, the same test as in `d16e_local`), but, unlike `d16d_*`/`d16e_*`, it **stores the certificate**: for each of the 6 cube faces, the leaves of a binary tree over face × $[0,\rho_0]$, each with its candidate $(J,\alpha)$.

- `d30_local.py --verify <record>` re-checks every stored leaf from scratch and checks that the leaves are the leaves of a binary tree on each face whose volumes add up to face × $[0,\rho_0]$; a branch that is not an ancestor of a recorded leaf is reported as a hole immediately.
- `d30_claim.py cubinico` combines: local verify; a coverage check of the far record (`d30_far.cover_check`, which rejects missing branches immediately); far replay; equality of the problem, $\rho_0$, the denominator exponent, scale 1, no injected fault or shifted $S^{\ast}$ in either record; both closed; the far "to local" boxes have total volume $(2\rho_0)^3$. Its output is `certificates/d30_cubinico_claim_nolp.json`.
- **The claim rests on the record without weights** (`d30_cubinico_local_r16_nolp.json`, run with `--no-lp`): 142 boxes evaluated, 74 accepted leaves, all of kind `single`. The development notes also contain a second local certificate using a weighted combination of candidates ("Lemma W", 50 accepted leaves); it is not needed and not part of this repository's claim.
- At $R^{\ast}$ all multipliers $A_j$ are positive (no active face has multiplier 0), so the difficulty that motivated weights for other pairs does not arise here.

## 7. Case data (`d16d_*`, `d16e_*`)

| | icoincub | dodinico | icoinoct |
|---|---|---|---|
| container, piece | cube, icosahedron | icosahedron, dodecahedron | octahedron (vertices $\pm e_k$), icosahedron |
| tool scale | $S=s/2$ | $S=(\varphi^2/2)\,s$ | $S=s/\sqrt2$ |
| $S^{\ast}$ | $1/2+\sqrt5/3$ | $2+4\sqrt5/5$ | $1+\sqrt5/2$ |
| $s^{\ast}$ | $1+2\sqrt5/3$ | $2+2\sqrt5/5$ | $\sqrt{9/2+2\sqrt5}$ |
| field | $\mathbb{Q}(\sqrt5)$ | $\mathbb{Q}(\sqrt5)$ | $\mathbb{Q}(\sqrt5)$ ($S^{\ast}$ and $R^{\ast}$ are in it; $s^{\ast}$ is not) |
| container faces active at $R^{\ast}$ | 3 | 5 | 4 |
| contacts at the optimum | 6 (2 per axis) | 10 (5 faces × 2 tied vertices) | 12 (4 faces × 3 tied vertices) |
| local candidates $(J,\alpha)$ | 8 | 40 | 54 |
| symmetry pairs $(g,k)$ | 144 | 600 | 144 |

Here $\varphi=(1+\sqrt5)/2$. For dodinico $R^{\ast}=\begin{pmatrix}-1&0&0\\0&-2\sqrt5/5&\sqrt5/5\\0&\sqrt5/5&2\sqrt5/5\end{pmatrix}$ (piece face $n_0=(0,\varphi,1)$); for icoinoct the entries of $R^{\ast}$ lie in $\{0,\pm\tfrac12,\pm\tfrac\varphi2,\pm\tfrac{\varphi-1}2\}$ (piece face $n_0=(1,1,1)$, $D_0=\varphi^2/2$). In each case $\varphi(I)=S^{\ast}$ is verified exactly (primal and dual) at stage 0.

| | icoindod | octindod | cubinico |
|---|---|---|---|
| container, piece | dodecahedron, icosahedron | dodecahedron, octahedron (vertices $\pm\tfrac{\sqrt2}2e_k$) | icosahedron, cube $(\pm\tfrac12)^3$ |
| tool | `d16d_*` | `d16e_*` | `d16e_*` via `d30_*` |
| tool scale | $S=(\varphi^3/2)\,s$ | $S=(\varphi^3/2)\,s$ | $S=(\varphi^2/2)\,s$ |
| $S^{\ast}$ | $(3+\sqrt5)/2$ | $1/3+\sqrt2/2+\sqrt{10}/6$ | $(43+47\sqrt5)/76$ |
| $s^{\ast}$ | $\sqrt5-1$ | $(2\sqrt5+\sqrt{10}-\sqrt2-4)/3$ | $(49\sqrt5-53)/38$ |
| field | $\mathbb{Q}(\sqrt5)$ | $\mathbb{Q}(\sqrt2,\sqrt5)$ | $\mathbb{Q}(\sqrt5)$ |
| container faces active at $R^{\ast}$ | 3 | 3 | 5 |
| contacts at the optimum | 6 (3 faces × 2 tied vertices) | 6 (3 faces × 2 tied vertices) | 6 (5 faces, one with 2 tied vertices) |
| local candidates $(J,\alpha)$ | 8 | 8 | 8 ($J$: 4 choices × $\alpha$: 2) |
| symmetry pairs $(g,k)$ | 360 | 360 | 480 |

The dodecahedron's normals are the cyclic permutations of $(0,\pm\varphi,\pm1)$ with offset $\varphi^3/2$ (the unit-edge dodecahedron). Piece face $n_0=(1,1,1)$ for icoindod and octindod, $D_0=\varphi^2/2$ (icosahedron) and $D_0=\sqrt2/2$ (octahedron); for cubinico $n_0=(0,0,-1)$, $D_0=1/2$. For icoindod and octindod $R^{\ast}n_0$ points to a vertex of the container (a 3-fold axis): $(-(\varphi-1),\varphi,0)$ and $(1,1,-1)$. For icoindod the entries of $R^{\ast}$ are in $\mathbb{Q}(\sqrt5)$ with denominator 12, e.g. the first row is $\big(-\tfrac{1+2\sqrt5}{6},\ \tfrac{1-\sqrt5}{12},\ \tfrac{7-\sqrt5}{12}\big)$. For octindod $R^{\ast}=\begin{pmatrix}a&b&c\\b&c&a\\-c&-a&-b\end{pmatrix}$ with $a=\tfrac{2-\sqrt{10}}{6}$, $b=\tfrac{4-3\sqrt2+\sqrt{10}}{12}$, $c=\tfrac{4+3\sqrt2+\sqrt{10}}{12}$. For cubinico $R^{\ast}=\begin{pmatrix}-1&0&0\\0&-2/3&\sqrt5/3\\0&\sqrt5/3&2/3\end{pmatrix}$ and $t^{\ast}=\big(0,\tfrac{-13+26\sqrt5}{114},\tfrac{41+13\sqrt5}{228}\big)$. All three rotations were found numerically and read off with PSLQ; how they were found does not matter, because stage 0 checks exactly in the field that $R^{\ast}$ is orthogonal with determinant 1 and that $\varphi(I)=S^{\ast}$ (primal and dual).

Equivalent forms: icoindod $s^{\ast2}=6-2\sqrt5$. For octindod, $\sqrt{3-\sqrt5}=(\sqrt{10}-\sqrt2)/2$ (square both sides; $\sqrt{10}-\sqrt2>0$), so $s^{\ast}$ equals the closed form $-\tfrac43+\tfrac{2\sqrt{3-\sqrt5}+2\sqrt5}{3}$ found in external records exactly, not only numerically.


## 8. `cubinoct_n02`: dedicated coordinates

Container: the octahedron of edge $s$, $\{\lVert x\rVert_1\le S\}$ with $S=s/\sqrt2$. Piece: the unit cube $[-\tfrac12,\tfrac12]^3$, fixed face $e_1$, $u:=Re_1$. For $\sigma\in\{\pm1\}^3$ the support function is $g_\sigma(R)=\tfrac12\sum_j\lvert\sigma\cdot Re_j\rvert$, and

$$\varphi(R)=\min S\quad\text{s.t.}\quad\sigma\cdot t+g_\sigma(R)\le S\ (8\text{ rows}),\qquad u\cdot t\le-\tfrac12 .$$

$S^{\ast}=1+\sqrt2/2$, i.e. $s^{\ast}=1+\sqrt2$.

**Domain.** The rotation is represented by $u=Re_1$ (the cube's face normal) and the spin $\psi$ about $u$. Using $O_h$ (48 elements) and the symmetries of the cube fixing face $e_1$ (with matching determinants; 192 pairs), $u$ is moved into the fundamental triangle $u_1\ge u_2\ge u_3\ge0$ and $\psi$ into $[0,\pi/2]$. Coordinates are $(b,\gamma,\tau)$ with $\tau=\tan(\psi/2)$ and quaternion $q=(1,\tau,-b+\gamma\tau,\gamma+b\tau)$. The domain is

$$D=\{\,0\le b\le\gamma,\ \ b^2+(\gamma+1)^2\le2,\ \ 0\le\tau\le1\,\}.$$

Since $\psi$ is only defined modulo $\pi/2$, $\tau=\tan(\psi/2)$ needs the whole range $[0,1]$. The optimal rotation is $R^{\ast}=(b,\gamma,\tau)=(0,0,\sqrt2-1)$, in the interior of the $\tau$-range. The local box is $L=[0,1/16]^2\times[3/8,7/16]$.

**Far region.** Multipliers $\lambda\ge0$ ($\sum\lambda=1$) and $\mu\ge0$ are rational. Assume a feasible solution with $S<\bar S$, where $\bar S$ is a rational upper bound of $S^{\ast}$ ($\bar S-S^{\ast}<2^{-120}$). From $g_\sigma\ge\sqrt3/2$ one gets $\lVert t\rVert_1<T_1=27/32$ (checked as $(\bar S-T_1)^2\le3/4$); this is a bound for solutions with $S<\bar S$ only. Remove absolute values by $\lvert P\rvert\ge\varepsilon P$ ($\varepsilon=\pm1$, either sign is valid) and split $\lVert E\rVert_\infty$ into the six cases $\pm E_i$. This yields six polynomial inequalities "$\ge0$ on the box". Each polynomial is homogenised to degree 4 and expanded about the box centre; with the box mapped to $[-1,1]^3$, the constant term is kept, a monomial with only even exponents is bounded using its range $[0,1]$, and every other term by $-\lvert\text{coefficient}\rvert$ — integers only. If all six are $\ge0$, the box contains no solution with $S<\bar S$, so $\varphi\ge\bar S>S^{\ast}$ there. The domain is split at the $\tau$-root into two trees, $[0,\tfrac12]$ and $[\tfrac12,1]$.

**Local lemma.** Let $x=(b,\gamma,\eta)$ with $\eta=\tau-\tau^{\ast}$, and write $x=\rho\theta$ with $\rho=\lVert x\rVert_\infty$ and $\theta$ on one of the four cube faces $\gamma=1$, $b=1$, $\eta=\pm1$ (no faces with $b<0$ or $\gamma<0$ are needed). Multipliers on the four $\sigma$ with $\sigma_1=-1$ are $\lambda_\sigma=\Lambda_\sigma/(4m)$, $\Lambda_\sigma=m-2\sigma_2\gamma-2\sigma_3b+c\,\sigma_2\sigma_3(m-2\gamma-2b)$, $c=\pm1$, $m=1-b^2-\gamma^2$, and $\mu=1/u_1$; $\sum\lambda=1$ and $\sum\lambda_\sigma\sigma+\mu u=0$ hold identically, and $\Lambda\ge0$, $m>0$ are checked on all of $L$. Terms $P$ that are not creases are bounded by $\lvert P\rvert\ge\varepsilon P$ with $\varepsilon$ the sign at $R^{\ast}$; the four crease terms (which vanish at $R^{\ast}$) by $\lvert P\rvert\ge\varepsilon'P$ with either $\varepsilon'=\pm1$. A zero-order identity, checked exactly in $\mathbb{Q}(\sqrt2)$, gives $F_c\ge\rho\,G_c(\rho,\theta)$, and on each of the four faces the lower bound of $G_c$ is $>0$ (with $\sqrt2$ enclosed by rationals of width $2^{-120}$, decided with integers). Hence $\varphi\ge B_c>S^{\ast}$ on $L$ for $\rho>0$, and $\rho=0$ is $R^{\ast}$ itself. In the record, faces $\gamma=1$, $b=1$ use $c=-1$ and faces $\eta=\pm1$ use $c=+1$, each with one box.

What is shown is $\varphi\ge S^{\ast}$ on $L$ with equality only at $R^{\ast}$ (an isolated minimum). **No growth constant (rate of linear increase away from $R^{\ast}$) is proved.**

**Root bookkeeping.** `d16_cover_check_roots.py` checks mechanically that the two $\tau$-trees join to $[0,1]$, that $\tau_{\max}=1$, that the local box $L$ in the records equals the constant in the code, and that the split-limit count and the LP-failure count are 0, together with the four local faces.

### Supplement: the optimal configuration of `cubinoct_n02` (hand argument)

*This is a hand argument outside the checker and not part of the claim.* As sets, there are 6 optimal single placements (the centre of a cube face at the origin, face normal $\pm e_x,\pm e_y,\pm e_z$, rotated by 45°). A two-piece configuration consists of an opposite pair only (3 pairs, one up to symmetry). Two adjacent ones cannot both be placed: e.g. $\{-1\le x\le0,\ \lvert y\rvert+\lvert z\rvert\le1/\sqrt2\}$ and $\{0\le y\le1,\ \lvert x\rvert+\lvert z\rvert\le1/\sqrt2\}$ share the interior point $(-0.2,0.2,0)$.

## 9. Not used in the proof

- Floating-point estimates of the "sharpness" of the minimum (linear growth rates such as 0.292, 0.293, 0.447 in units of $s$) were used only to decide whether to proceed. They are not part of any proof.
- The first-order growth rates of icoindod and octindod ($0.149$ in units of $s$ for both) and of cubinico ($0.080$), and the floating-point classification of the type of the minimum used to choose the method for cubinico, are estimates only.
- A directional-derivative formula for the V-shaped minimum of `cubinoct_n02` was compared only with numerical samples; it is not used.
