# Three tetrahedra in a tetrahedron: `tetintet_n03`

Case: `tetintet_n03` (three regular tetrahedra in a regular tetrahedron; with the plateau also $n=4$ and the upper bound for $n=5$). Tool: `d86_*`.

**Claim.** For three pieces the minimal container edge, in units of the piece edge, is $s^{\ast}=2$, the same value as for five pieces ([reduction_tetintet_n05.md](reduction_tetintet_n05.md)). The lower bound $s^{\ast}\ge2$ comes from a pigeonhole step over **two** cells (two of the three centroids lie both in the middle cell or both in the union of the corner cells) and two **one-piece** inequalities (★A), (★M), each checked by a box certificate with a local and a far record. The upper bound is an exact rational placement. Since fewer pieces always fit, $2\le s^{\ast}(3)\le s^{\ast}(4)\le s^{\ast}(5)=2$; the placements for $n=4,5$ are re-checked by the same tool.

This is computer-assisted, **not formally verified**: there is no Lean part for this case. The argument and the code were written by Claude and read twice by other Claude models (Opus, then Fable; 0 fatal and 0 important findings each, the remarks reflected; summary in [review_log.md, v1.0.0](review_log.md#v100), "Review 21" and "Review 22"). There is no third-party or human review.

## 1. Notation and scale

The container is taken at $s=2$ only (the case $s<2$ is brought there in §4). Normals and pieces:

$$b_0=(-1,-1,-1),\ b_1=(-1,1,1),\ b_2=(1,-1,1),\ b_3=(1,1,-1),\qquad C=\{x:\ b_f\cdot x\le1\},\qquad K=\{x:\ b_f\cdot x\le\tfrac12\}.$$

These are the normals of [reduction_tetintet_n05.md §1](reduction_tetintet_n05.md#1-notation-and-scale) in a different order ($b_0\leftrightarrow b_3$, $b_1\leftrightarrow b_2$). $\sum_fb_f=0$, $\sum_fb_fb_f^{\mathsf T}=4I$, $b_f\cdot b_g=-1$ ($f\ne g$). The piece vertices are $v_i=-b_i/2$ (edge $\sqrt2$, and $C=2K$). A placement is $X=RK+t$ ($R\in SO(3)$, $t$ the centroid); $h_K(n)=\max_in\cdot v_i$, $h_X(n)=h_K(R^{\mathsf T}n)+n\cdot t$, $H_f(R)=\max_ib_f\cdot Rv_i\in[\tfrac12,\tfrac32]$, $\tilde m(n)=\max_fn\cdot b_f$. $\Delta_i:=\operatorname{cone}\{-b_f:f\ne i\}$ is the set of $n$ for which $-n$ is in the normal cone of $K$ at $v_i$; the four $\Delta_i$ cover the sphere. Rotations are $R=M(q)/\lvert q\rvert^2$ as in [reduction_tetrahedron.md §7](reduction_tetrahedron.md#7-domain-of-r-and-the-discard-rule).

## 2. Two cells and the pigeonhole step

With a threshold $k$ (fixed to $k=1$ in §5), the corner cells and the middle cell are

$$A_j=\{t:\ b_j\cdot t\le-k\}\ (j=0..3),\qquad M=\{t:\ b_f\cdot t\ge-k\ \text{for all }f\}$$

(in the container of edge $s$, replace $k$ by $ks/2$). Every $t$ lies in $M$ or in some $A_j$, and the cells are closed (a boundary point may be counted in either cell; overlaps do no harm). Among three centroids, two lie on the same side: both in $M$ (case MM), or both in $A_0\cup\dots\cup A_3$, in the same corner (AA) or in two corners (AB). The union of corners is not convex, but (★A) below is a statement about **one** piece, so AA and AB both follow from it.

## 3. The one-piece inequalities

> **(★A)** If $X=RK+t\subset\operatorname{int}C$ and $b_0\cdot t\le-k$, then $h_X(n)\ge\kappa_A(n):=h_K(n)-h_K(-n)$ for all $n$.
>
> **(★M)** If $X=RK+t\subset\operatorname{int}C$ and $b_f\cdot t\ge-k$ for all $f$, then $h_X(n)\ge\kappa_M(n):=\eta(n)-\eta(-n)$ for all $n$, where $\eta:=(1-\theta)h_K+\theta\,h_{K\cap M}$.

- Both $\kappa$ are **odd**: $\kappa(n)+\kappa(-n)=0$ identically. Both are invariant under the 24 symmetries $T_d$ of the container, so (★A) for $A_0$ gives it for every $A_j$. Unlike [reduction_tetintet_n05.md §3](reduction_tetintet_n05.md#3-the-n-chart-and-kappa), there are no box constants $k_N$ and no pairing of boxes $n\leftrightarrow-n$.
- Geometrically, (★A) says $X-K\supseteq K$: the piece meets every translate $K+p$ ($p\in K$) of the corner piece.
- **Interior.** (★) is stated for $X\subset\operatorname{int}C$, and only this form is used (§4). It gives the strict inequalities the certificates rely on: in $A_0$, $\check S(R):=H_1+H_2+H_3-(3-k)<0$; in $M$, $\check S_M(R):=\sum_fH_f(R)-4<0$ (add the face inequalities $b_f\cdot t<1-H_f$). Boxes on which $\check S\ge0$ or $\check S_M>0$ (type S) need nothing.

## 4. Enlarge and separate: (★A), (★M) give $s^{\ast}(3)\ge2$

*Argument.* Suppose three pieces with disjoint interiors fit in the container of edge $s<2$, i.e. in $(s/2)C$. By §2, two of them, $X_i=R_iK+t_i$ ($i=1,2$), are on the same side. Put $\lambda=2/s>1$ and $X'_i:=R_iK+\lambda t_i$. Since the origin is interior to $K$, $X'_i\subset\operatorname{int}(\lambda X_i)\subset\operatorname{int}C$, and $X'_1,X'_2$ are disjoint. The cells are homogeneous in $t$, so $\lambda t_i$ lies in the corresponding cell at $s=2$ (the only place where the cells scaling with $s$ is used). Disjoint compact convex sets are strictly separated: $h_{X'_1}(n)+h_{X'_2}(-n)<0$ for some $n$. By (★) the left side is $\ge\kappa(n)+\kappa(-n)=0$ ($\kappa_M$ for MM, $\kappa_A$ for AA and AB; in AB both pieces may use the same $\kappa_A$ because it does not depend on the corner). Contradiction. ∎

This is the enlarge-and-separate step of [reduction_tetintet_n05.md §2](reduction_tetintet_n05.md#2-the-cell-and-t2t4-restricted-to-it) with an odd $\kappa$; no monotonicity in $s$ is used.

## 5. Constants $k=1$, $\theta=1/2$, $\beta=3/4$; the case AA by inscribed balls

- **$k\ge1/2$** makes the corner constraint $b_0\cdot t\le\min(1-H_0,-k)$ always equal to $-k$ (as $H_0\le3/2$), so the raised height is the constant $H'_0=1+k$. For $k<1/2$ the case AA has an equality configuration (a corner piece and an inverted piece on its face). For $k$ too large (MM at $k=1.4$, and (★M) at $k=9/8$ in a floating-point scan) the margin is lost. **$k=1$** is in between and makes everything small rationals: $M\cap C$ is the octahedron $\lvert x\rvert+\lvert y\rvert+\lvert z\rvert\le1$, and $A_j\cap C$ is the corner piece $K+v_j$.
- **$\theta=1/2$**: near the equality axis $\kappa_M=\beta y$ with $\beta=1-\theta/2=3/4$ (the same form $\kappa=\beta y$ as in [reduction_tetrahedron.md §6](reduction_tetrahedron.md#6-domain-of-n-and-the-definition-of-kappa); a floating-point LP gives the window $\beta\in(1/2,1)$, and $3/4$ is its middle). At $\theta=1$ ($\beta=1/2$) (★M) is false: test Xb finds an exact rational point $(n,R)$ with $\min_th_X(n)-\kappa_M(n)=-0.0416\ldots$.
- **AA by inscribed balls** (independent of (★A), a cross-check). A piece in $C$ has its inscribed ball (radius $\rho=1/(2\sqrt3)$) in $C$, so $b_f\cdot t\le1/2$. Two centroids in $A_0$ then lie in $T'=\{b_f\cdot t\le\tfrac12\ (f\ne0),\ b_0\cdot t\le-k\}$, a tetrahedron of edge $(3/2-k)/\sqrt2$, while disjoint pieces need $\lvert t_1-t_2\rvert\ge2\rho=1/\sqrt3$. At $k=1$: $\text{diam}^2=1/8<1/3$, one rational inequality.

## 6. (★A): the corner cell

**Formula.** Fix $R$. The admissible $t$ form $\{b_f\cdot t\le1-H_f\ (f\ne0),\ b_0\cdot t\le-k\}$, a tetrahedron similar to $C$, non-empty iff $\check S\le0$. This is T2 restricted to a cell as in [reduction_tetintet_n05.md §2](reduction_tetintet_n05.md#2-the-cell-and-t2t4-restricted-to-it), with $H'_0=1+k=2$, $H'_f=H_f$ ($f\ne0$), $s_0=2$:

$$\tilde F(n,R)=h_K(R^{\mathsf T}n)+\tfrac14\sum_f\big(\tilde m(n)-n\cdot b_f\big)H'_f-\tilde m(n)=\min_t h_X(n),\qquad G_A:=\tilde F-\kappa_A\ge0\ \text{ where }\check S<0.$$

Types F and M($j,\mu$) are those of [reduction_tetintet_n05.md §2](reduction_tetintet_n05.md#2-the-cell-and-t2t4-restricted-to-it) (type M needs only weak duality).

**Equality set.** $G_A(n,I)=\tfrac34\,[h_K(-n)+n\cdot v_0]$, which is $0$ exactly on $\Delta_0$: the corner piece in its corner is optimal for every $n\in\Delta_0$. In the chamber $\{x\ge y\ge z\}$ of $C_{3v}$ write $n=(1-h-k',\,-1+k',\,-1)$; then $\Delta_0\cap$ chamber is the triangle $\mathrm{Ch}=\{h\ge0,\ k'\ge0,\ h+2k'\le2\}$ and $h<0$ is the side of $\Delta_3$. In addition, at the vertex $n=-b_1$ there is an **arc** of rotations about $b_1$, $q=(1,u\,b_1)$, on which $G_A\equiv0$ (the corner piece turning with a face on the container face 1); it is admissible only for $\lvert u\rvert\le1/16$ (12.4°), beyond which $\check S>0$. On $\mathrm{Ch}\times\{\text{arc}\}$,

$$G_A=\tfrac{h_++k'}2\,\rho_2(u)+\tfrac{h_+}2\,\rho_3(u)+\tfrac34h_-,\qquad\rho_f=H_f-\tfrac12\ge0,$$

as long as $v_1$ is the top vertex (otherwise this is a lower bound).

**Local region J** (`d86_local.py`, region J). Base $(h,k',u)$, transverse $\zeta=(p_1,p_2)=r\hat\zeta$, $q=(1,\,u\,b_1+p_1e'+p_2e'')$, $e'=(0,1,-1)$, $e''=(2,1,1)$. For each candidate $c$ (top vertex $v_1$, one vertex for each of $H_1,H_2,H_3$; 27, or 9 for $h\le0$), exactly as polynomials,

$$\lvert q\rvert^2G_c=r\,\Lambda_c(\hat\zeta,r;h,k',u)+T_c(h,k',u),\qquad T_c=\tfrac{h_++k'}2\tau_2+\tfrac{h_+}2\tau_3+\tfrac34h_-\lvert q\rvert^2,$$

with $\tau_f$ quadratics in $u$. A leaf is accepted as type F (some $c$ with $\Lambda_c>0$ on the leaf and $\tau_2,\tau_3\ge0$ on its $u$-range, both exact), type S (lower bound of $\check S_c\ge0$), or type O (outside the chamber). Leaves do not cross $h=0$ or $u=0$. The region covers $\mathrm{Ch}$ widened to $h\ge-r_n$ (the band just outside $\Delta_0$, where the margin is only $\tfrac34\lvert h\rvert$), $\lvert u\rvert\le u_J=1/8$, $\lvert p_i\rvert\le r_J$, with $r_J=r_n=1/4$ in the record `d86_local_J_wide`. `region_check` asserts exactly, at the polygon vertices, which face gives $\tilde m$, that the weights are $\ge0$, and the vertex order of $\kappa_A$. **The widths are not constants of the code:** the replay of J reads them from the environment variables `D86_R_N` and `D86_U_J`; `d86_replay_all.py` and `d86_far.py` pass `1/4` and `1/8` themselves, and a manual replay must set the values from the record header.

**Far region A** (`d86_far.py`). The chamber is covered by two triangles in $(a,b)$ (side P, $y\ge0$; side Q, $y\le0$, containing Ch as $2a+3b\le2$), the $C_{3v}$ form of [reduction_tetintet_n05.md §3](reduction_tetintet_n05.md#3-the-n-chart-and-kappa) with $x\leftrightarrow y$; $\kappa_A$ is a formula, one $R$-tree per $n$-box. Leaf types: F and M($j,\mu$) ($D_j\le\mu$ checked at the vertices of the $n$-polygon), S ($\check S>0$), D (discard rule of [reduction_tetrahedron.md §7](reduction_tetrahedron.md#7-domain-of-r-and-the-discard-rule) with the 12 piece rotations), L (the $n$-polygon in the $n$-range of J and $Rk^{-1}$ in its $R$-range for some piece rotation $k$, linear tests at the 8 vertices).

## 7. (★M): the middle cell

**Multiplier.** Fix $R$; the constraints on $t$ are $b_f\cdot t\le1-H_f$ and $-b_f\cdot t\le k$. Because $\sum b_f=0$ and $\sum b_fb_f^{\mathsf T}=4I$, the dual multipliers reduce to one real $\tau$, and weak duality gives, for every $\tau$,

$$h_X(n)\ \ge\ G_\tau(n,R):=h_K(R^{\mathsf T}n)+\sum_f\big(\tau+\tfrac{n\cdot b_f}4\big)_-\big(H_f(R)-1\big)-k\sum_f\big(\tau+\tfrac{n\cdot b_f}4\big)_+ ,$$

with equality at the best $\tau$ (strong duality, checked at rational points in `d86_step0.part_a`). $\tau=-\tilde m/4$ is the form of [reduction_tetrahedron.md §5](reduction_tetrahedron.md#5-t4--the-inequality-that-is-checked); larger $\tau$ brings in the faces of $M$, which are needed even locally. In a box one uses $\tau=-(n\cdot b_j+\mu)/4$ only if every $x_f=(n\cdot(b_f-b_j)-\mu)/4$ has a fixed sign on the $n$-polygon (checked exactly at its vertices and stored in the record): $x_f\le0$ contributes a vertex lower bound of $H_f$, $x_f\ge0$ the constant $-k\,x_f$. Type S is $\check S_M>0$.

**Domain and equality.** $n\in D_n=\{(x,y,1):\lvert y\rvert\le x\le1\}$, a fundamental domain of $T_d$. On all of $D_n$, $\kappa_M=\beta y=\tfrac34y$ (piecewise-linear pieces fixed, checked at the three vertices). At $R=I$, $G-\kappa_M=\theta\,d(n)+(1-\theta)\,d(-n)$ with $d=h_K-h_{K\cap M}\ge0$, which vanishes only at the coordinate axes ($n=e_z$, the corner $(0,0)$ of $D_n$): two pieces in the original orientation touching edge to edge crosswise across a coordinate plane. Near it, with candidates from $\{v_0,v_3\}\times\{H_0\text{ vertex}\}\times\{H_3\text{ vertex}\}$ (18),

$$G_M=h_K(R^{\mathsf T}n)+\tfrac{1+y}2(H_0-1)+\tfrac{1-x}2(H_3-1)-\tfrac{k(x-y)}2-\beta y,\qquad G_M(x,y,I)=x/4 .$$

**Local region PM** (`d86_local.py`, region PM): $n\propto(x,y,1)$, $0\le x\le R_{PM}$, $\lvert y\rvert\le x$, $q=(1,p)$, $\lvert p_i\rvert\le R_{PM}=1/4$ (record `d86_local_PM_wide`). The zero-order part vanishes identically and a leaf is accepted if $\Lambda_c>0$, as in [reduction_tetrahedron.md §9](reduction_tetrahedron.md#9-local-lemma).

**Far region M** (`d86_far_m.py`): one chart $D_n$; leaf types F($j,\mu$) with the stored sign pattern, S, D, L ($x\le R_{PM}$ and $Rk^{-1}$ in the PM cube).

## 8. Upper bounds ($n=3,4,5$)

At $s=2$: the corner pieces $K+v_j$ lie in $C$, have disjoint interiors (separated by $(b_j-b_i)\cdot x=0$) and centroids with $b_j\cdot v_j=-3/2$. Three of them give $n=3$, all four $n=4$. For $n=5$ add $P_5=\operatorname{conv}\{e_x,e_y,e_z,(-\tfrac13,-\tfrac13,-\tfrac13)\}$ in the middle octahedron: congruent to $K$ (all six edges $\sqrt2$), inside $C$, separated from the corner piece $j$ by $b_j\cdot x=-1$ (the placement of [reduction_tetintet_n05.md §6](reduction_tetintet_n05.md#6-upper-bound) in these coordinates). Exact rationals; independent of §2–§7.

## 9. What is checked by which script

Entry point `d86_replay_all.py` (one run, about two minutes; exits non-zero on the first failure):

| step | script | what |
|---|---|---|
| 1 | `d86_replay_all.py` | constants $k=1$, $\theta=1/2$, $\beta=3/4$ in `d86_common.py` and in the headers of the four records; widths of far A = widths of `d86_local_J_wide` ($r_J=r_n=1/4$, $u_J=1/8$), $R_{PM}=1/4$ in far M and `d86_local_PM_wide`; no test-only breakage in the headers; split limit 0 |
| 2 | `d86_replay_all.py` | SHA-256 of the records and code against `certificates/d86_manifest.json` |
| 3 | `d86_step0.py` (`part_a`) | 31 exact-rational items: the upper bounds of §8 ($n=3,4,5$), the inequality of §5 (AA), and cross-checks of the formulas of §3, §6, §7 against an independent vertex enumeration of the $t$-LP at rational points (including the index map to the order of `d37_tet_n05_common.py` and of `../src/solids.json`); stored in `certificates/d86_step0.json` |
| 4 | `d86_local.py replay` | `d86_local_J_wide` (1,091 leaves: F 661, S 407, O 23; with `D86_R_N`, `D86_U_J` passed) and `d86_local_PM_wide` (850 leaves, all F) |
| 5 | `d86_far.py replay`, `d86_far_m.py replay` | `d86_far_A`: $n$-boxes 1,232 + 39 outside; $R$-leaves S 142,182, D 129,200, M($j=3$) 37,179, F($j=3$) 10,263, M($j=0$) 1,480, L 5,549. `d86_far_M`: $n$-boxes 302 + 44 outside; F 64,220, D 43,492, S 9,670, L 206; check of $\kappa_M=\beta y$ on $D_n$. Both replay their local record inside. |

Tests `d86_tests.py` (`certificates/d86_tests.json`, 54 checks, 0 failures): X (candidate forms against the $t$-LP, with sensitivity to wrong signs of $\kappa$, $k$ or face index), Xk ($k<1/2$), Xb ($\theta=0,1$), Xu (narrow J leaves an equality outside), W (broken records rejected), P (named points: arc, axis, edges of $\Delta_0$, mirror edges), L1 (far L leaves agree with the local leaves). See [verification.md §9](verification.md#9-additions-in-v100).

**Not checked by any script** (prose only, read in the two reviews): the pigeonhole step (§2), the enlarge-and-separate step (§4), the reduction of (★) to the stated box inequalities (T2 restricted, weak duality for $\tau$, the meaning of types F/M/S/D/L/O), the symmetry reductions to the chamber and to $D_n$ (checked only at random rational points), and the discard rule. Floating-point scans and LPs only chose $k$, $\theta$, $\beta$, the candidates and the widths; they are not part of the argument. Uniqueness of the optimal configurations is not claimed.
