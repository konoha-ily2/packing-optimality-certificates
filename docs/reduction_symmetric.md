# Reduction for a centrally symmetric container and piece

Cases: `cubinoct_n02`, `icoincub_n02`, `dodinico_n02`, `icoinoct_n02`.

This document states the reduction from "two pieces fit" to a minimisation over rotations of a small linear program, the symmetry reduction of the rotation domain, the bound on the translation used by the box certificates, and the local lemma. `cubinoct_n02` uses its own coordinates and its own checker (`d16_cover_*`), described in the last part. The other three use the general tool `d16d_*`.

Everything here is a prose argument. It has been re-derived once by a reviewer model (see [review_log.md](review_log.md)) but has not been formalized; Lean checks only the arithmetic built on top of it.

## 1. Setting

- (P1) The container $C$ is centrally symmetric about the origin: $C=-C$. The container of edge $s$ is $sC$.
- (P2) The piece $K$ is a compact convex set with nonempty interior.
- (P3) Placements are either "rotations and translations" or "rotations, reflections and translations", and $-K$ is a placement of $K$.
- (P4) "Two pieces fit" means there are closed placements $K_1,K_2\subset sC$ with $\operatorname{int}K_1\cap\operatorname{int}K_2=\emptyset$ (touching allowed).

All Platonic pieces used here (cube, icosahedron, dodecahedron) satisfy $K=-K$ about their centre, so (P3) holds with rotations and translations only, and allowing reflections does not change the answer.

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

**Face orbit.** If every face normal is $n_f=h\,n_0$ for a *rotation* $h$ of the piece, replacing $R$ by $Rh$ moves face $f$ to the fixed face $n_0$ without changing the placed piece. Hence the minimum over all $R$ and all faces equals the minimum over all $R$ with face $n_0$ only. For the three pieces in `d16d_*` the rotation group (order 60) acts transitively on the faces (icosahedron: $20=60/3$; dodecahedron: $12=60/5$). The tool checks this exactly: the number of images of $n_0$ under the symmetries with $\det=+1$ equals the number of faces of the convex hull of the piece (counted separately from the vertices), and every image has support value $D_0$. For the cube, the rotation group (order 24) is transitive on the 6 faces.

**The LP.** With $h_g(R):=\max_{v\in\operatorname{vert}K} c_g\cdot Rv$,

$$\varphi(R):=\min\ S\quad\text{s.t.}\quad c_g\cdot t+h_g(R)\le S\ \ (\text{all container faces } g),\qquad (Rn_0)\cdot t\le -D_0 .$$

By Lemma R the minimal container is given by $S^{\ast}=\min_{R\in SO(3)}\varphi(R)$.

**Weak duality** (used by every lower bound). For $\lambda_g\ge0$ with $\sum\lambda_g=1$ and $\mu\ge0$, every feasible $(t,S)$ satisfies

$$S\ \ge\ \sum_g\lambda_g h_g(R)+\mu D_0+E\cdot t,\qquad E:=\sum_g\lambda_g c_g+\mu Rn_0 .$$

## 4. Symmetry reduction and the discard rule

**Invariance.** Let $g$ be a symmetry of the container and $k$ a symmetry of the piece fixing $n_0$, with $\det g\cdot\det k=1$. Then $gRk$ is a rotation and $\varphi(gRk)=\varphi(R)$: $g(RK+t)=(gRk)K+gt$ because $kK=K$, the container is invariant under $g$, and $(gRk\,n_0)\cdot(gt)=(Rn_0)\cdot t$.

**Discard rule** (`d16d_*`). A box is discarded if $\operatorname{tr}(gRk)>\operatorname{tr}(R)$ holds strictly on the whole box for one such pair $(g,k)$. In each orbit the representative of maximal trace cannot lie in a discarded box, and $\varphi$ is constant on orbits, so proving the bound on the remaining boxes suffices for all $R$. Each pair $(g,k)$ used is checked exactly, one by one, to be an orthogonal matrix mapping the relevant point set to itself. Therefore **completeness of the enumeration is not needed for correctness**: missing pairs only mean fewer discarded boxes (test m5a shows exactly this: halving the set of pairs either still closes or fails to close, never accepts falsely). The numbers of pairs are as expected: $48\times6/2=144$ (icoincub, icoinoct) and $120\times10/2=600$ (dodinico).

**Charts.** Rotations are written as quaternions $q=(w,x,y,z)$ with the component of largest absolute value normalised to $1$; this gives four charts, each the cube $[-1,1]^3$, which together cover $SO(3)$. The rotation matrix is $R(q)/\lvert q\rvert^2$ with $R(q)$ quadratic in $q$, so after multiplying by $N=\lvert q\rvert^2>0$ all expressions are polynomials. Before starting, the piece is rotated by the optimal rotation $R^{\ast}$, so the optimum sits at $R=I$, i.e. $q=(1,0,0,0)$ in chart 0.

## 5. Range of the translation

Since the faces of the piece form a single orbit, every face is at distance $D_0/\lvert n_0\rvert$ from the centre, so the piece contains the ball of radius $r_{\rm in}=D_0/\lvert n_0\rvert$ around its centre. Hence $h_g(R)\ge r_{\rm in}\lvert c_g\rvert$, and every solution with $S<\bar S$ ($\bar S$ a rational upper bound of $S^{\ast}$) satisfies

$$c_g\cdot t\ \le\ \bar S-r_{\rm in}\lvert c_g\rvert\ \le\ T\quad\text{for all }g,\qquad\text{i.e.}\quad t\in T\cdot P,\ \ P=\{x:\ c_g\cdot x\le1\}.$$

$P$ is a bounded polytope, so the linear form $E\cdot t$ attains its minimum at a vertex $w$ of $P$: $E\cdot t\ge T\min_w E\cdot w$. The tool checks $T>0$ and $(\bar S-T)^2\le r_{\rm in}^2\lvert c_g\rvert^2$ for every face, exactly in the number field. The vertex list of $P$ is generated as all triple intersections of faces that satisfy all face inequalities (Lean additionally checks that this list is complete).

$T$ values: icoincub $1/2$, dodinico $121/64$, icoinoct $53/64$. These are bounds on solutions with $S<\bar S$ only, which is all the argument uses.

## 6. The local lemma (`d16d_*`)

Let $J$ be three container faces active at $R^{\ast}=I$ with $M_J=[c_j]_{j\in J}$ invertible, and $\alpha$ a choice of one maximising vertex $v_j$ for each $j\in J$. Set

$$A=-M_J^{-1}\,R(q)\,n_0,\qquad \lambda_j=A_j\big/\textstyle\sum A,\qquad \mu=N\big/\textstyle\sum A .$$

Then $E=\sum_j\lambda_j c_j+\mu Rn_0=0$ identically and $\sum\lambda=1$. If $\lambda\ge0$, weak duality gives $\varphi\ge B_{J,\alpha}$ (using $h_j\ge c_j\cdot Rv_j$), and $F:=N\sum A\,(B_{J,\alpha}-S^{\ast})$ is a polynomial in $p=(x,y,z)$ (chart 0, $q=(1,p)$).

- **Zero-order identity:** $F(0)=0$ is checked exactly in the number field for each candidate $(J,\alpha)$.
- **Cube faces:** write $p=\rho\theta$ with $\rho=\lVert p\rVert_\infty\in[0,\rho_0]$, $\rho_0=1/16$, and $\theta$ on one of the 6 faces of $[-1,1]^3$. Then $F=\rho\,G$, and the checker shows $G>0$ on boxes covering each face × $[0,\rho_0]$ (integer-only acceptance).
- **$\lambda\ge0$:** components $A_j$ positive at $R^{\ast}$ are bounded below by a positive number on the box; components that vanish at $R^{\ast}$ are first checked to be divisible by $\rho$, and then $A_j/\rho\ge0$ is checked.
- Each box may use a different candidate $(J,\alpha)$, since every $B_{J,\alpha}$ with $\lambda\ge0$ is a lower bound of $\varphi$. The choice of $J$ and $\alpha$ only affects whether the box closes, not correctness.

Conclusion: on $\lVert p\rVert_\infty\le\rho_0$, $\varphi>S^{\ast}$ except at $p=0$. The far region's "to local" leaves are checked by replay (with integers) to lie inside this cube of chart 0, with the same constant $\rho_0=1/16$ and the same coordinates.

## 7. Case data (`d16d_*`)

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
- A directional-derivative formula for the V-shaped minimum of `cubinoct_n02` was compared only with numerical samples; it is not used.
