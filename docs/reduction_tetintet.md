# Tetrahedra in a tetrahedron: `tetintet_n02`

Case: `tetintet_n02` (two unit-edge regular tetrahedra in a regular tetrahedron). Tool: `d40_*`.

**Claim (an enclosure, not an exact value).** The minimal edge $s^{\ast}$ satisfies

$$\bar s=\frac{1953564244}{10^9}\ \le\ s^{\ast}\ \le\ s_{\rm up},$$

where $s_{\rm up}$ is an explicit rational number (numerator and denominator of 42 and 41 digits, listed in `certificates/d40_upper.json`) with $s_{\rm up}-\bar s\approx5.6\times10^{-10}$. Both ends are rational numbers checked exactly; the claim does not depend on any irrational number. The recorded configuration has $s_0=1.9535642445615807029\ldots$, a root of the irreducible quintic

$$576s^5-2112s^4+2528s^3-1296s^2+231s+19,$$

and numerically $\bar s<s_0<s_{\rm up}$ with $s_0-\bar s=5.6\times10^{-10}$ and $s_{\rm up}-s_0\approx3.3\times10^{-22}$ (40-digit arithmetic; this comparison with $s_0$ is numerical, not exact). So the certificate determines $s^{\ast}$ to 9 decimal places, $s^{\ast}=1.953564244\ldots$ (more precisely, $s^{\ast}\in[\bar s,\,\bar s+5.7\times10^{-10}]$). **That $s^{\ast}=s_0$ exactly is not claimed.**

This case uses the separation argument T1–T4 of [reduction_tetrahedron.md](reduction_tetrahedron.md). Unlike `icointet`, `cubintet` and `octintet`, it needs the restriction $s_1(R)\le s$ of the original statement of T4, and the optimal rotation of one piece is irrational (degree 5). The certificate therefore differs in three ways: (i) each box may add a nonnegative multiple of the constraint $s_1(R)\le\bar s$ ("types" M and S below); (ii) the local lemma requires only that the zero-order part be **nonnegative**, not identically zero, so the local centres can be rational approximations of the true minimisers; (iii) $\kappa$ has a linear part that may change from box to box.

Everything here is a prose argument. The application of T1–T4 and the local/far arguments were read once by a reviewer model (see [review_log.md](review_log.md)); nothing is formalized. Lean checks only the arithmetic.

## 1. Notation and scale

As in [reduction_tetrahedron.md §5](reduction_tetrahedron.md#square-root-free-form-used-by-the-tools): $b_f\in\{(-1,-1,-1),(-1,1,1),(1,-1,1),(1,1,-1)\}$ ($f=0,1,2,3$) are the container normals scaled by $\sqrt3$. The piece is scaled by $\sqrt2$, so its vertices are

$$\tilde v_0=\tfrac12(1,1,1),\quad\tilde v_1=\tfrac12(1,-1,-1),\quad\tilde v_2=\tfrac12(-1,1,-1),\quad\tilde v_3=\tfrac12(-1,-1,1)$$

and all data are rational. With $\tilde H_f(R)=\max_v b_f\cdot R\tilde v$, the condition "one piece in orientation $R$ fits in the container of edge $s$" (T2) reads

$$\check S(R):=\sum_f\tilde H_f(R)-2s\ \le\ 0\qquad(\text{equivalently }s_1(R)\le s).$$

On $D_n=\{n=(x,y,1):\lvert y\rvert\le x\le1\}$ one has $\tilde m(n)=n\cdot b_2$. For $\mu\ge0$ define

$$\tilde G_\mu(n,R):=\max_v n\cdot R\tilde v+\tfrac14\sum_f\big(n\cdot(b_2-b_f)+\mu\big)\tilde H_f(R)-\tfrac s2\,n\cdot b_2-\tfrac{\mu s}2-\tilde\kappa(n).$$

$\tilde G_0$ is a positive multiple of the left side of (K) minus $\kappa$, and $\tilde G_\mu=\tilde G_0+\tfrac\mu4\check S$. Rotations are $R=M(q)/\lvert q\rvert^2$ with a quaternion $q$, so $\lvert q\rvert^2\tilde G_\mu$ is a polynomial.

**Coordinates on $D_n$.** $h:=1-x$, $k':=x-y$, so $n_A(h,k')=(1-h,\,1-h-k',\,1)$. The half $y\ge0$ of $D_n$ is $T=\{h,k'\ge0,\ h+k'\le1\}$. The map $-n\mapsto\sigma n=(x,-y,1)$ (by $g_0=\operatorname{diag}(-1,1,-1)\in T_d$, a rotation) sends $n_A(h,k')$ to $n_B(h,k')=(1-h,\,-(1-h-k'),\,1)$, the point of the other half with the same coordinates.

## 2. T4 with the restriction $s_1(R)\le\bar s$

**What is used.** For any rational $\bar s$: if there is $\kappa$ with $\kappa(n)+\kappa(-n)\ge0$ and

$$\text{(K}_{\bar s}\text{)}\qquad\Phi(n,R)-3r\bar s\,m(n)\ \ge\ \kappa(n)\quad\text{for all directions }n\text{ and all }R\text{ with }s_1(R)\le\bar s,$$

then $s^{\ast}\ge\bar s$. *Proof.* As in [reduction_tetrahedron.md §5](reduction_tetrahedron.md#5-t4--the-inequality-that-is-checked): if two pieces fit at $s<\bar s$, the two minimisers $R_1,R_2$ of T3 satisfy $s_1(R_i)\le s<\bar s$, so (K$_{\bar s}$) applies to both, and replacing $s$ by $\bar s$ strictly lowers the sum because $m(\pm n)>0$; contradiction. ∎ The proof does not use that $\bar s$ is close to any particular value; it only needs $\bar s$ to be the scale used in (K$_{\bar s}$).

**Types of leaves.** For a box of $(n,R)$ and one choice $c$ of vertices for the maxima ($c=(t;v_0,v_1,v_2,v_3)$, top vertex and one vertex per container face), let $\tilde G_{c,\mu}$ and $\check S_c$ be $\tilde G_\mu$ and $\check S$ with every maximum replaced by the chosen vertex. A leaf is accepted with one of:

| type | checked on the whole leaf | conclusion |
|---|---|---|
| F | $\tilde G_{c,0}\ge0$ | $\tilde G_0\ge0$ |
| M($\mu$), $\mu\in\{1,2,3,4,6,12\}$ | $\tilde G_{c,\mu}\ge0$ | $\tilde G_0\ge0$ at every point with $\check S\le0$ |
| S | $\check S_c>0$ | no point with $s_1(R)\le\bar s$ (nothing to show) |

*Why M is valid.* When all weights $\tfrac14(n\cdot(b_2-b_f)+\mu)$ are $\ge0$, $\tilde G_{c,\mu}\le\tilde G_\mu$, and $\check S_c\le\check S$. At a point with $\check S\le0$: $\tilde G_0=\tilde G_\mu-\tfrac\mu4\check S\ge\tilde G_\mu\ge\tilde G_{c,\mu}\ge0$. The multiplier $\mu$ may differ from leaf to leaf, because the statement is pointwise and the leaves cover the domain. Type F is M with $\mu=0$; type S is the limit $\mu\to\infty$.

The sign matters: the term added is $+\tfrac\mu4\check S$, i.e. $+\lambda\,(s_1(R)-\bar s)$ with $\lambda\ge0$, which is $\le0$ exactly where the restriction holds. (Test t1 reverses the sign and finds violations at 3,318 of 3,318 sample points.)

**Why the restriction is needed.** At the optimum one piece (the "stuck" piece) has $s_1(R_1^{\ast})=s_0$: it touches all four faces of the container. Along a one-parameter direction of rotations that keeps its two edge contacts, (K) without the restriction has first-order slope of opposite signs on the two sides, so it cannot hold for all $R$; with a fixed $\mu$ the best first-order sharpness is exactly $0$ (attained at $\mu^{\ast}\approx3.0$–$3.5$). Choosing the type per leaf avoids this. These numbers come from floating-point LPs and are not part of the proof.

## 3. $\kappa$ and the two halves of $D_n$

$\kappa$ is defined on $D_n$ and extended to all directions by $T_d$-invariance (the extension is unique: $D_n$ is a closed chamber of the reflection group $T_d$ and meets every orbit in exactly one point, boundary included). On each $n$-box $N\subset[0,1]^2$ (coordinates $(h,k')$),

$$\kappa_N(h,k')=\tilde\kappa_1(h,k')+k_N,\qquad\tilde\kappa_1=a_0+a_1h+\beta k',$$

with $\beta=-25/32$, rational $a_0,a_1$ fixed once (the half-difference of the zero-order values of the two pieces along the arc of optima, computed exactly at $\bar s$), and a rational constant $k_N$ per box ($k_N=0$ on boxes meeting the local $n$-range $N_1=[0,3/8]\times[0,1/32]$; elsewhere chosen from a floating-point estimate of the slack, denominator $2^{24}$). For each box the checker checks two inequalities:

- side A (the stuck piece looks at $n_A$): $\tilde G(n_A,R)-\kappa_N\ge0$;
- side B (the corner piece looks at $\sigma(-n)=n_B$): $\tilde G(n_B,R)+\kappa_N\ge0$.

Set $\kappa(n_A):=\kappa_N$ and $\kappa(n_B):=-\kappa_N$. Then $\kappa(n)+\kappa(-n)=\kappa(n_A)+\kappa(n_B)=0$. On $y=0$ the two halves meet ($n_A=n_B$); there both inequalities hold at the same point, so $\tilde G\ge\lvert\kappa_N\rvert$ and $\kappa:=\lvert\kappa_N\rvert$ gives a sum $2\lvert\kappa_N\rvert\ge0$. At boundaries between boxes one box is chosen per point (the same box for $n$ and $\sigma n$); (K) holds there because it holds on every closed box. Replay checks $k_N=0$ on every box meeting $N_1$.

**Weights.** On $T$ all weights of side A ($2x+2$, $2k'$, $2(h+k')$, and $0$ for $b_2$) and of side B are $\ge0$. The $n$-boxes are squares in $[0,1]^2$, so a box straddling $h+k'=1$ sticks out of $T$, where one weight of side B, $n_B\cdot(b_2-b_1)=2(2-2h-k')$, can become negative (for $2h+k'>2$). This does not matter: the checker shows "candidate polynomial $\ge0$ on the whole box", which is true regardless of signs; it is read as $\tilde G\ge\dots$ only on the part inside $T$, where $2h+k'\le1+h\le2$ and all weights are $\ge0$.

**Symmetry.** $\tilde G(gn,gRk)=\tilde G(n,R)$ for $g\in T_d$ and $k$ a symmetry of the piece, with determinants matched. The tetrahedron is **not** centrally symmetric, so for $g$ with $\det g=-1$ the piece's mirror symmetry $P$ (swap of the first two coordinates) is used: $(-g)R(-P)\in SO(3)$. The discard rule uses the 12 rotations of the tetrahedron (signed permutation matrices with $\det=1$ preserving the vertex set; checked).

## 4. Local lemma with a nonnegative zero-order part

**Centres.** Seven rational quaternions $q_c$ (the rotation is $R=R(q_c\otimes(1,p))$, $p=(p_1,p_2,p_3)$ small):

| centre | side | kind | meaning |
|---|---|---|---|
| $T_S$ | A | tube along $h\in[0,3/8]$ | the stuck piece, $\hat R\approx R_1^{\ast}$ |
| $T_S'$ | A | tube | its mirror image across the edge $y=x$ of $D_n$ |
| $P_{23},P_{13},P_{\rm cyc1},P_{\rm cyc2}$ | A | point at $n_B$-corner $(h,k')=(0,0)$ | the other four images of $\hat R$ under the stabiliser of $(1,1,1)$ |
| $T_C$ | B | tube | the corner piece, $R=I$ |

$\hat R$ is the exact optimal quaternion (found from three quadratic equations, see `d40_step0.py`) normalised and rounded to denominator $2^{70}$; $\lvert\hat R-R_1^{\ast}\rvert\le5.8\times10^{-22}$. The six images are $g\hat Rk$ over the permutation matrices $g$ fixing $(1,1,1)$ (for $\det g=-1$ paired with the mirror $P$); each is replaced by the representative of maximal $\operatorname{tr}(Rk)$ in its piece-rotation orbit, so that it survives the far region's discard rule. The choice of centres affects only whether boxes close, not correctness: the lemma below assumes nothing about $q_c$.

**Coordinates.** Tubes: base parameter $u=h\in[0,3/8]$, transverse $\zeta=(k',p_1,p_2,p_3)$ with $k'\ge0$; points: no base, $\zeta=(h,k',p_1,p_2,p_3)$ with $h,k'\ge0$. Write $\zeta=r\hat\zeta$ with $r\in[0,1/32]$ and $\lVert\hat\zeta\rVert_\infty=1$ (7 faces for a tube, 8 for a point, the faces $\hat k'=-1$, $\hat h=-1$ being absent).

**Lemma (zero order as an inequality).** For a candidate $c$ (type F, M($\mu$) or S) let $P_c:=\lvert q\rvert^2\cdot(\text{candidate expression})$, a polynomial. Split $P_c(u,r\hat\zeta)=e_c(u)+r\,\Lambda_c(u,\hat\zeta,r)$, where $e_c$ collects the terms of degree 0 in $\zeta$ (an exact polynomial identity). A leaf (a $u$-interval × a box on one face of $\hat\zeta$ × an $r$-interval) is accepted if

1. $e_c(u)\ge0$ on the leaf's $u$-interval ($e_c$ is affine in $u$, so both ends are checked; the checker asserts the degree), and
2. the lower bound of $\Lambda_c$ on the leaf is $>0$.

Then $P_c\ge0$ on the leaf, hence the candidate expression is $\ge0$ (as $\lvert q\rvert^2>0$), and the type gives the conclusion of §2. Because the centre is a rational approximation, $e_c$ is small and positive rather than zero: with $\delta=s_0-\bar s$ the two zero-order values along the arc add up to $(\delta/2)(4-2h)>0$. (For type S the lemma gives $\check S_c\ge0$ at $r=0$; type S is never used in the local record, and T4 needs only $s_1(R)<\bar s$, so this is harmless.)

**Lower bound.** Each variable is replaced by centre $+$ half-width $\cdot t$, $t\in[-1,1]$; after expansion the constant is kept, monomials with only even exponents contribute $\min(0,\text{coefficient})$, others $-\lvert\text{coefficient}\rvert$. All in `fractions.Fraction`.

**Local record.** 7 centres, 28,946 accepted leaves, 57,839 boxes evaluated, split limit 0 ($r_0=1/32$). Leaves by type: M12 24,556, F 2,480, M6 1,446, M4 464 (type S is not used locally).

## 5. Far region

For each $n$-box in $[0,1]^2$ (boxes with $h_{\rm lo}+k'_{\rm lo}\ge1$ are *out*: they meet $T$ at most in one corner point, which belongs to a neighbouring box), and for each side, an $R$-tree over the four quaternion charts. Leaves:

- **A** (accepted, type F or M($\mu$)): the lower bound of a positive integer multiple of $\lvert q\rvert^2\tilde G_{c,\mu}$ is $\ge0$; $\tilde G_{c,\mu}$ is affine in $(h,k')$, so the four corners of the $n$-box are used, and the $R$-box is mapped to $[-1,1]^3$ with the integer rule of [verification.md §2](verification.md#2-box-lower-bounds-far-region);
- **S** (discarded by the constraint): the lower bound of $\lvert q\rvert^2\check S_c$ is $>0$;
- **D** (discarded by symmetry): $\operatorname{tr}(Rk)-\operatorname{tr}(R)>0$ on the box for a piece rotation $k$;
- **L** (to local): the $n$-box lies in $N_1$ (for the point centres in $[0,1/32]^2$), $k_N=0$, and the $R$-box lies in the local cube of a centre of the right side: with $w=\bar q_c\otimes q$ (linear in $q$), $w_0>0$ and $\lvert w_i\rvert\le w_0/32$ at the 8 vertices of the $R$-box (a convex cone, so the vertices suffice; exact rationals).

Counts: $n$-boxes 236 ok, 18 out, split limit 0; $R$-leaves 154,232 accepted (F 99,673, S 49,364, M6 3,315, M12 1,880 — here "S" counts leaves discarded by the constraint), 72,810 discarded by symmetry, 223 to local; 3,779,147 boxes evaluated.

**Seam (test L1).** The centres of all 223 far leaves marked "to local" lie in leaves of the local record (exact).

**Consistency of the two implementations (test R3).** The local stage builds its polynomials with sympy; the far stage builds them by hand. Test R3 compares, at random rational points and for all centres and candidates of types F, M and S, the value of the local polynomial, of $\lvert q\rvert^2$ times the direct formula, and of the far formula (with $k_N=0$), exactly.

**The claim needs three checks together:** local replay, far replay (which checks only that "to local" leaves lie in the local region, not that the local region is closed), and the upper bound. `d40_tests.py --only chain` runs the three in order and prints one verdict.

## 6. Upper bound

The stuck piece in orientation $\hat R$ (rational), the corner piece in orientation $\operatorname{diag}(-1,1,-1)$ (the image of $I$ in the $D_n$ coordinates), separating direction $n=(99/100,99/100,1)$: $s_{\rm up}$ is the larger of the scale $s(n)$ given by T3 (⇐) and $s_1(\hat R)$, the translations are built from vertices of the tetrahedra of T2, and `d40_upper.py` checks with rationals that all 8 vertices lie in the container of edge $s_{\rm up}$ and that the two pieces lie on the two sides of a plane $n\cdot x=c$. This check uses the vertices directly and does not depend on the reduction.

## 7. Not used in the proof

- The quintic for $s_0$, its root, and the comparison $\bar s<s_0<s_{\rm up}$ (40-digit arithmetic). The enclosure uses only the rationals $\bar s$ and $s_{\rm up}$.
- Floating-point LPs for the window of $\beta$ ($[-0.977,-0.591]$), first-order sharpness (0.19–0.47 in the units of $\tilde G$), the best fixed $\mu$, and the one-sided slack map (minimum $0.019$ outside $N_1$); these chose the certificate.
- Uniqueness of the optimal configuration is not claimed.
