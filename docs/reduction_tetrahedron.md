# Reduction for the tetrahedral container

Cases: `icointet_n02` (icosahedra in a tetrahedron) and `cubintet_n02` (cubes in a tetrahedron). Tool: `d28_*`.

T1–T4 below are also the basis of `octintet_n02` (octahedra in a tetrahedron), which uses a different certificate (one linear $\kappa$ everywhere and a local region around two curves of minimisers) and its own tool `d31_*`; see [reduction_octintet.md](reduction_octintet.md). The cases $n=3,4,5$ in a tetrahedron are in [plateau.md](plateau.md).

The regular tetrahedron is not centrally symmetric, so Lemma R of [reduction_symmetric.md](reduction_symmetric.md) does not apply. Instead the two pieces are separated by a plane with normal $n$, and the translations available to one piece form a tetrahedron that can be written down explicitly. This removes the translations and the separating height from the problem and leaves an inequality in $(n,R)$ only.

Everything here is a prose argument, re-derived once by a reviewer model (see [review_log.md](review_log.md)) and not formalized; Lean checks only the arithmetic built on top of it.

## 1. Notation

- Container $C$: the unit-edge regular tetrahedron with centroid at the origin, $C=\{x:\ a_f\cdot x\le r\}$, $f=1,\dots,4$, with outward unit normals $a_f$ ($\sum_f a_f=0$, $a_f\cdot a_g=-1/3$ for $f\ne g$) and inradius $r=1/(2\sqrt6)$. The container of edge $s$ is $sC$.
- Piece $K$: a unit-edge regular solid (closed, convex, origin in its interior). Placements are $RK+t$ with $R\in SO(3)$. Both pieces used here are centrally symmetric and mirror-symmetric, so allowing reflections gives the same answer.
- $h_f(R):=\max_{v\in K}a_f\cdot Rv$, $h_K(R^{\mathsf T}n):=\max_{v\in K}n\cdot Rv$, $m(n):=\max_j n\cdot a_j$.
- Two pieces "fit" if they are closed placements in $sC$ with disjoint interiors (touching allowed).

## 2. T1 – separation by a plane

Two closed convex sets $K_1,K_2$ have disjoint interiors iff there are a unit vector $n$ and $h\in\mathbb{R}$ with $K_1\subset\{n\cdot x\le h\}$ and $K_2\subset\{n\cdot x\ge h\}$.

## 3. T2 – the admissible translations form a tetrahedron

Fix $R$. The set of $t$ with $RK+t\subset sC$ is

$$\mathcal{T}(R,s)=\{t:\ a_f\cdot t\le sr-h_f(R),\ f=1..4\}.$$

- It is nonempty iff $s\ge s_1(R):=\sum_f h_f(R)/(4r)$ (adding the four inequalities and using $\sum a_f=0$; conversely the centre below lies in it). $s_1(R)$ is the smallest scale admitting one piece in orientation $R$.
- When nonempty it is a tetrahedron similar to $C$: incentre $c(R)=-\tfrac34\sum_f h_f(R)\,a_f$, inradius $\rho=r\,(s-s_1(R))$, vertices $c-3\rho\,a_j$.
- The minimum of a linear form over it is attained at a vertex: $\min_{t\in\mathcal T}n\cdot t=n\cdot c(R)-3\rho\,m(n)$.

This is where the tetrahedral container replaces central symmetry.

## 4. T3 – the separated problem

Define (independent of $s$; all coefficients $m(n)-n\cdot a_f\ge0$)

$$\Phi(n,R):=h_K(R^{\mathsf T}n)+\tfrac34\sum_f\big(m(n)-n\cdot a_f\big)\,h_f(R),$$
$$g(n,s):=\min\{\Phi(n,R)-3rs\,m(n):\ R\in SO(3),\ s_1(R)\le s\}.$$

$g(n,s)$ is how low the top of one piece in direction $n$ can be pushed inside $sC$ ($\min_{\text{placement}}\max_{x\in K'}n\cdot x$); this follows from T2.

**Theorem T3.** Two pieces fit in $sC$ iff there is a unit vector $n$ with $g(n,s)+g(-n,s)\le0$.

- (⇒) Take the plane $n\cdot x=h$ from T1. The top of $K_1$ in direction $n$ is $\le h$, so $g(n,s)\le h$; the top of $K_2$ in direction $-n$ is $\le -h$, so $g(-n,s)\le-h$. Add. This does not assume where the plane meets the container.
- (⇐) Take placements attaining the two minima (they exist by compactness). Then $\max_{K_1}n\cdot x=g(n,s)\le-g(-n,s)=\min_{K_2}n\cdot x$, and T1 gives disjoint interiors. ∎

For a centrally symmetric container $g(-n,s)=g(n,s)$ and T3 reduces to Lemma R.

## 5. T4 – the inequality that is checked

**Corollary T4.** Let $s_0$ be the candidate value (with an exactly substituted configuration as upper bound). Suppose there is a function $\kappa$ on directions with

$$\kappa(n)+\kappa(-n)\ge0$$

and

$$\text{(K)}\qquad \Phi(n,R)-3rs_0\,m(n)\ \ge\ \kappa(n)\qquad\text{for all directions }n\text{ and all }R\in SO(3).$$

Then the minimal scale satisfies $s^{\ast}\ge s_0$.

*Proof.* Suppose two pieces fit at $s<s_0$. By T3 there are $n$ and minimisers $R_1,R_2$ with $0\ge g(n,s)+g(-n,s)=[\Phi(n,R_1)-3rs\,m(n)]+[\Phi(-n,R_2)-3rs\,m(-n)]$. Since $m(\pm n)\ge1/3>0$, replacing $s$ by $s_0$ makes the right side strictly smaller: $0>[\Phi(n,R_1)-3rs_0m(n)]+[\Phi(-n,R_2)-3rs_0m(-n)]\ge\kappa(n)+\kappa(-n)\ge0$, a contradiction. ∎

Only the direction (⇒) of T3 is used. The original statement restricts (K) to $R$ with $s_1(R)\le s_0$; **the certificate checks (K) for all $R\in SO(3)$**, which is stronger, so this restriction is never used.

The function $\kappa$ is the certificate: it fixes in advance how the joint slack of the two pieces is split between $n$ and $-n$, so the two pieces can be checked separately by one inequality in $(n,R)$.

**Homogeneity.** (K) is homogeneous of degree 1 in $n$ ($\Phi$ and $m$ are), so $n$ need not be normalised.

### Square-root-free form used by the tools

With $b_f\in\{(-1,-1,-1),(-1,1,1),(1,-1,1),(1,1,-1)\}$ ($a_f=b_f/\sqrt3$), $\tilde m(n)=\max_j n\cdot b_j$, $H_f(R)=\max_v b_f\cdot Rv$ and $c=s/(2\sqrt2)$, the left side of (K) equals

$$F(n,R;c)=\max_v n\cdot Rv+\tfrac14\sum_f\big(\tilde m(n)-n\cdot b_f\big)H_f(R)-c\,\tilde m(n).$$

The tools check $F(n,R;c^{\ast})\ge\kappa(n)$ with $c^{\ast}=s^{\ast}/(2\sqrt2)$ as an exact element of the number field.

## 6. Domain of $n$ and the definition of $\kappa$

**Domain.** $\kappa$ is defined as a function on the surface of the cube $\max_i\lvert n_i\rvert=1$ and extended to all directions so as to be invariant under $T_d$ (coordinate permutations combined with an even number of sign changes; 24 elements). The six faces of the cube are equivalent under $T_d$, and

$$D_n=\{n=(x,y,1):\ \lvert y\rvert\le x\le1\}\quad(\text{on the face } z=1)$$

is a fundamental domain: every direction is mapped to exactly one point of $D_n$, boundary points included. On $D_n$, $\tilde m(n)=1+x-y$ and $\tilde m(-n)=1+x+y$ are linear, and the weights $w_f(n)=(b_{\rm top}-b_f)\cdot n$ (with $\tilde m(n)=b_{\rm top}\cdot n$) are $\ge0$.

**Invariance.** $F(gn,gRk)=F(n,R)$ for $g\in T_d$ and $k$ a symmetry of the piece, with determinants matched (for a reflection $g$ the piece's $-I$ is used; both pieces are centrally symmetric). The element $g_0=\operatorname{diag}(-1,1,-1)\in T_d$ (det $+1$) maps $-n$ to $\sigma n=(x,-y,1)$, which is again in $D_n$.

**Definition of $\kappa$.** $D_n$ is split into boxes $N$. On each box,

$$\kappa=k_N+\beta y,$$

with a rational constant $k_N$ per box and a fixed $\beta$ ($\beta=1/4+3\sqrt5/20$ for icointet, $\beta=11/49$ for cubintet). The subdivision is symmetric under $\sigma$, each box $N$ is split together with $\sigma N$, and $k_{\sigma N}=-k_N$. At a point on the boundary of several boxes, $\kappa$ is defined as the **maximum** of the values of the boxes covering it. Then $\kappa(n)+\kappa(-n)=\kappa(n)+\kappa(\sigma n)$ is "maximum minus minimum" of the same set of values, hence $\ge0$, so the T4 condition holds. (K) holds at boundary points because it holds for every covering box. The root is split at $y=0$, so no box straddles $y=0$. Replay checks for each pair $(N,\sigma N)$ that $k_N+k_{\sigma N}=0$.

## 7. Domain of $R$ and the discard rule

$R$ uses the same four quaternion charts as in [reduction_symmetric.md](reduction_symmetric.md#4-symmetry-reduction-and-the-discard-rule) (largest component normalised to 1, each chart $[-1,1]^3$), with the piece pre-rotated so that the optimum is at $R=I$.

**Discard rule.** Let $k$ be a genuine rotational symmetry of the piece (60 for the icosahedron, 24 for the cube). A box on which $\operatorname{tr}(Rk)>\operatorname{tr}(R)$ holds everywhere is discarded. In each orbit the representative with maximal $\operatorname{tr}(Rk)$ does not lie in a discarded box (the inequality is strict), so proving (K) on the remaining boxes suffices for all $R$. Moving $n$ into $D_n$ by $g\in T_d$ and then re-choosing $R$ within its piece-symmetry orbit do not interfere.

## 8. Box acceptance (far region)

For each box (in $n$, a box $N\subset D_n$; in $R$, a box in one chart) choose for every maximum in $F$ one vertex ($v_0$ for $\max_v n\cdot Rv$, $v_f$ for $H_f$). Since $w_f\ge0$ on $D_n$,

$$F-\kappa\ \ge\ G:=n\cdot Rv_0+\tfrac14\sum_f w_f(n)\,b_f\cdot Rv_f-c^{\ast}\tilde m(n)-(k_N+\beta y),$$

whatever vertices are chosen (the choice affects only whether the box closes). $N\cdot G$ ($N=\lvert q\rvert^2>0$) is a polynomial in five variables (linear in $(x,y)$, quadratic in the quaternion). It is mapped to $[-1,1]^5$; the constant term is kept, monomials with only even exponents are bounded with range $[0,1]$, other terms by $-\lvert\text{coefficient}\rvert$. Square roots are enclosed in integer intervals of width $2^{-120}$, the upper or lower end being chosen by the sign of the coefficient. Accept if the lower bound is $\ge0$ ((K) is a non-strict inequality); discard (§7) only if the bound for $\operatorname{tr}(Rk)-\operatorname{tr}(R)$ is $>0$. If an $n$-box extends outside $D_n$, the bound is still valid on its part inside $D_n$. Floating point is used only to choose $k_N$ and the vertex candidates.

## 9. Local lemma

Near the minimiser(s), write $z=(\delta n,\ \text{quaternion components})\in\mathbb{R}^5$ around $(n^{\ast},R^{\ast})$, scaled to the local box, and $z=r\theta$ with $\theta$ on the faces of the 5-dimensional cube and $r\in[0,1]$. For each choice $c$ of tied vertices ("candidate"), $G_c(0)=0$ is checked exactly in the number field, so $G_c=r\,H_c$; on boxes covering every face, some candidate has $H_c>0$ (integer-only acceptance). Hence $F-\beta y\ge G_c/N\ge0$ on the local box, with $k_N=0$ there.

| | icointet | cubintet |
|---|---|---|
| $n^{\ast}$ | $(1/\varphi^2,0,1)$ | $(1,0,1)$ (on the edge $x=1$ of $D_n$) |
| minimisers in $R$ | $I$ | $I$ and $R_2$ (see below) |
| local ranges | $x$: $\pm9/128$; $y$ and quaternion: $\pm1/16$ | one-sided $x-1\in[-1/16,0]$; others $\pm1/16$ |
| candidates | 81 | 32 per local box |
| faces of the 5-cube used | 10 | 9 per local box (the face $x=+1$ does not occur) |
| field | $\mathbb{Q}(\sqrt5)$ | $\mathbb{Q}(\sqrt2,\sqrt3)$ |

For cubintet, $n^{\ast}$ is fixed by a reflection $h\in T_d$ ($x\leftrightarrow z$), and $F(n^{\ast},R)=F(n^{\ast},-hRk)$; hence there are two orbits of minimisers at $n^{\ast}$, those of $I$ and of $-h$. The representative of the second orbit that survives the discard rule is

$$R_2=\begin{pmatrix}\tfrac12+\tfrac{\sqrt2}3&-\tfrac{\sqrt2}6&\tfrac12-\tfrac{\sqrt2}3\\ \tfrac{\sqrt2}6&\tfrac{2\sqrt2}3&-\tfrac{\sqrt2}6\\ \tfrac12-\tfrac{\sqrt2}3&\tfrac{\sqrt2}6&\tfrac12+\tfrac{\sqrt2}3\end{pmatrix},\qquad \operatorname{tr}R_2=1+\tfrac{4\sqrt2}3,$$

and $F=0$ is checked exactly at both. That there is no other minimiser follows from the far region closing (everything outside the local boxes is accepted); no separate argument is needed.

**Connection to the far region.** A far leaf marked "to local" is accepted only if replay confirms (i) its $n$-box lies in the local $n$-range, (ii) $k_N=0$, (iii) its $R$-box lies in a local box (compared exactly in the field when the centre, like $R_2$, is irrational). The local ranges contain the far region's local boxes, and both stages share the same constants and the same coordinates.

## 10. Upper bounds

The optimal configurations are substituted exactly (icointet: 96 containment inequalities and the separating plane, in $\mathbb{Q}(\sqrt5)$; cubintet: 64 inequalities and the separating plane, in $\mathbb{Q}(\sqrt2,\sqrt3)$). This check uses the vertices directly and does not go through T1–T4, so the upper bound stands even if the reduction were wrong.

## 11. Not used in the proof

- Floating-point maps of the slack $\psi(n)=\min_R F$, the "sharpness" values (0.303 and 0.289 in units of $s$), and the optimised value of $\beta$ were used only to choose certificates.
- A floating-point sample of $\max_R s_1(R)$ was computed during development; it plays no role, because (K) is checked for all $R$.

## 12. Consequence for $n=3,4$ (icointet)

Since removing pieces preserves feasibility, the minimal edge for 3 or 4 icosahedra in a tetrahedron is at least $s^{\ast}=2\sqrt2(1+2/\sqrt5)$, the $n=2$ value. In v0.1.0 only this lower bound was stated. From v0.2.0 on, configurations of 3 and 4 icosahedra in the tetrahedron of edge exactly $s^{\ast}$ are substituted exactly, so the minimum for $n=3,4$ equals $s^{\ast}$; see [plateau.md](plateau.md).
