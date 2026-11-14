# Five tetrahedra in a tetrahedron: `tetintet_n05`

Case: `tetintet_n05` (five unit-edge regular tetrahedra in a regular tetrahedron). Tool: `d37_tet_n05_*`.

**Claim.** The minimal edge is $s^{\ast}=2$ exactly. The upper bound is an explicit placement of five pieces at $s=2$; the lower bound $s^{\ast}\ge2$ comes from a pigeonhole step (two of the five centroids lie in the same quarter of the container) and a two-piece separation certificate for that restricted problem, in the form of T1–T4 of [reduction_tetrahedron.md](reduction_tetrahedron.md). Because $s_0=2$ is rational, the certificate is checked at $s_0$ itself (no enclosure is needed, unlike [reduction_tetintet.md](reduction_tetintet.md)).

Everything here is a prose argument. The restricted forms of T2–T4 (§2) were read once by a reviewer model, and the local and far arguments (§3–§5) once more; both reviews found nothing fatal and their remarks are reflected (summaries: [review_log.md, Review 14](review_log.md#review-14-tetintet_n05-the-restricted-reduction-fable-11-13) and [Review 15](review_log.md#review-15-tetintet_n05-local-and-far-regions-fable-11-14-morning)). **There is no human review and nothing is formalized.** Lean checks only the arithmetic (§7).

## 1. Notation and scale

As in [reduction_tetintet.md §1](reduction_tetintet.md#1-notation-and-scale), but with the normals in the order used by the tools:

$$b_0=(1,1,-1),\ b_1=(1,-1,1),\ b_2=(-1,1,1),\ b_3=(-1,-1,-1),$$

piece vertices $\tilde v=\tfrac12(\pm1,\pm1,\pm1)$ (an even number of minus signs), container $\{b_f\cdot x\le s/2\}$ (at $s=1$ it is the piece itself; Lean checks this), $\tilde H_f(R)=\max_v b_f\cdot R\tilde v$, rotations $R=M(q)/\lvert q\rvert^2$.

## 2. The cell, and T2–T4 restricted to it

**Cell.** $R_j(s):=\{x\in sC:\ b_j\cdot x\le0\}$, $j=0,\dots,3$. Since $\sum_jb_j=0$ the four cells cover the container, so among five centroids two lie in the same cell. The rotations of the container permute the cells, so $j=3$ may be assumed: the cell $R_3$ is the corner of the vertex $(1,1,1)$ direction. Fixing the cell leaves only the stabiliser of $b_3$, the group $C_{3v}$ of coordinate permutations, as a symmetry of the restricted problem.

**T2 restricted.** A piece $RK+t$ lies in $sC$ with $t\in R_3$ iff $b_f\cdot t\le s/2-\tilde H'_f$ for all $f$, where $\tilde H'_f=\tilde H_f$ for $f\ne3$ and $\tilde H'_3=\max(\tilde H_3,\,s/2)$. This is the same linear system as in T2 with one height raised, so the rest of T2 holds verbatim: the set of $t$ is non-empty iff $\check S(R):=\sum_f\tilde H'_f(R)-2s\le0$, and the minimum of $n\cdot t$ has the same closed form with $\tilde H'$ in place of $\tilde H$.

**(K̃) and T4 restricted.** With $\tilde m(n)=\max_fn\cdot b_f$ and

$$\tilde F(n,R):=\max_vn\cdot R\tilde v+\tfrac14\sum_f\big(\tilde m(n)-n\cdot b_f\big)\tilde H'_f(R)-\tfrac{s_0}2\,\tilde m(n),$$

the inequality to show is

$$\text{(K̃)}\qquad\tilde F(n,R)\ge\kappa(n)\ \text{ for all }n\text{ and all }R\text{ with }\check S(R)\le0,\qquad\kappa(n)+\kappa(-n)\ge0 .$$

*T4 restricted.* If (K̃) holds then for $s<s_0$ no two pieces $R_iK+t_i$ fit in $sC$ with disjoint interiors and both centroids in $R_3$; hence five pieces do not fit for $s<s_0$. *Proof (enlarge and separate).* Suppose they do and put $\lambda=s_0/s>1$. The pieces $K'_i:=R_iK+\lambda t_i$ lie in the interiors of $\lambda(R_iK+t_i)$, so they are disjoint compact convex sets in $s_0C$ with centroids $\lambda t_i\in R_3(s_0)$, and each $R_i$ satisfies $\check S(R_i)\le0$ at $s_0$. Strictly separating them by a plane $n\cdot x=h$ with a margin $\varepsilon>0$ and using the closed form of T2 gives a sum $<0$ for $(n,R_1)$ and $(-n,R_2)$, against (K̃) and $\kappa(n)+\kappa(-n)\ge0$. ∎ This form does not use monotonicity of the heights in $s$.

**Multiplier and types.** For a face $j$ and $\mu\ge0$ put

$$G_{j,\mu}(n,R):=\max_vn\cdot R\tilde v+\tfrac14\sum_f\big(n\cdot(b_j-b_f)+\mu\big)\tilde H'_f-\tfrac{s_0}2\,n\cdot b_j-\tfrac{\mu s_0}2 .$$

The identity $\tilde F=G_{j,0}+(\tilde m-n\cdot b_j)\,\check S/4$ shows: if $D_j:=\max_fn\cdot(b_f-b_j)\le\mu$ on the $n$-region, then all weights are $\ge0$, $0\le\tilde m-n\cdot b_j\le\mu$, and at every $R$ with $\check S\le0$, $\tilde F\ge G_{j,\mu}$. As in [reduction_tetintet.md §2](reduction_tetintet.md#2-t4-with-the-restriction-s_1rlebar-s), a leaf replaces each maximum by a chosen vertex (and $\tilde H'_3$ may be replaced by the constant $s_0/2=1$, a valid lower bound), and is accepted as type F ($\mu=0$, $D_j\le0$), type M($\mu$) ($\mu>0$, $D_j\le\mu$; the conclusion holds where $\check S\le0$), or type S ($\check S_c>0$ strictly: no $R$ of the box is needed).

## 3. The $n$ chart and $\kappa$

$C_{3v}$ has the chamber $\{y\ge x\ge z\}$. The map $\sigma(x,y,z)=(-x,-z,-y)$ ($n\mapsto-n$ followed by the reflection $y\leftrightarrow z$ back into the chamber) splits it into the halves $A=\{x\ge0\}$ and $B=\sigma(A)$. Half A is a triangle in the plane $n\cdot b_0=1$:

$$n_A(a,b)=(1-a-b,\,1-b,\,1-a-2b),\qquad (a,b)\in T=\{a,b\ge0,\ a+b\le1\},$$

and $n_B(a,b):=\sigma(n_A(a,b))=(a+b-1,\,a+2b-1,\,b-1)$. On $A$, $\tilde m=n\cdot b_0$. On $B$, $\tilde m=n\cdot b_3$ for $2a+3b\le2$ and $n\cdot b_0$ beyond. The arc of optima is $b=0$, $a\in[0,4/5]$.

$\kappa$ is $\tilde\kappa(a,b)+k_N$ on each $n$-box $N$, with $\tilde\kappa=1-a-\tfrac74b$ (the $a$-part is $\tilde F(n_A(a,0),R_1^{\ast})=1-a$ on the arc, exactly; $\beta=-7/4$ is chosen from a floating-point LP and is not part of the proof) and a rational $k_N$ ($k_N=0$ on boxes meeting the local $n$-range). Per box the checker shows side A: $\tilde F(n_A,R)\ge\kappa_N$ and side B: $\tilde F(n_B,R)\ge-\kappa_N$; with $\kappa(n_A):=\kappa_N$, $\kappa(n_B):=-\kappa_N$ the sum is $0$. Outside the chamber $\kappa$ is defined by $C_{3v}$; $\tilde F$ is homogeneous of degree 1 in $n$, so the chart of one plane section suffices; at box boundaries one box is chosen per point (for $n$ and $\sigma n$ together); on $a+b=1$ (where $\sigma$ maps the boundary to itself) $\kappa(n):=\max(\kappa_N(q),-\kappa_N(q^{\ast}))$ with $q^{\ast}=(1-a,a)$, and both inequalities give the sum $\ge0$.

## 4. Local lemma

Same form as [reduction_tetintet.md §4](reduction_tetintet.md#4-local-lemma-with-a-nonnegative-zero-order-part), at $s_0=2$ exactly (the zero-order part is identically $0$ on the arc). Centres (integer quaternions):

| centre | side | kind | quaternion |
|---|---|---|---|
| $T_S$ (stuck piece of the optimum P1) | A | tube $a\in[0,7/8]$ | $(3,1,-1,1)$ |
| $P1_{g021}$, $P1_{g102}$ (its other $C_{3v}$ images) | A | point $(a,b)\in[0,r_0]^2$ | $(3,-1,-1,1)$, $(3,1,-1,-1)$ |
| $P2$ (inverted piece of the second optimum) | A | point | $(2,-1,0,1)$ |
| $T_C$ (corner piece) | B | tube | $(1,0,0,0)$ |

Transverse coordinates $\zeta$: $(b,p)$ for tubes, $(a,b,p)$ for points, $\zeta=r\hat\zeta$, $r\in[0,r_0]$, $r_0=1/16$. A leaf is accepted if $e_c\ge0$ on the base range and the lower bound of $\Lambda_c$ is $>0$. The local candidates use the face $j=0$ on side A and $j=3$ on side B; this is valid only where $\tilde m=n\cdot b_j$ on the whole $n$-range, which the checker asserts (`region_check`: the range lies in $T$ and the weights are $\ge0$ at its four corners; also $2a_{\max}+3r_0\le2$). With $r_0=1/8$ this assertion fails for $T_C$, and indeed the sample tests showed violations there; the record uses $r_0=1/16$.

Local record: 5 centres, 6,734 leaves ($T_S$ 3,045, $P1_{g021}$ 310, $P1_{g102}$ 1,087, $P2$ 1,049, $T_C$ 1,243), split limit 0; type S is not used.

## 5. Far region

As in [reduction_tetintet.md §5](reduction_tetintet.md#5-far-region), with three changes. (i) Each F/M leaf carries a face $j$ ($j=0$ on side A, $j\in\{3,0\}$ on side B) and $\mu$; the checker verifies $D_j\le\mu$ exactly at every vertex of $(n\text{-box})\cap T$ (boxes crossing $2a+3b=2$ use M leaves with $\mu=\lceil64D_j\rceil/64$ and similar). (ii) Leaves may use the constant 1 for $\tilde H'_3$. (iii) L leaves: the $R$-box lies in the local cube of a centre **after a piece rotation $k$** ($w=\bar q_c\otimes q\otimes\bar q_k$, $\lvert w_i\rvert\le r_0w_0$ at the 8 vertices); this is needed because the orbit of a centre has two (P2: three) representatives of maximal trace, which the discard rule cannot remove. $\tilde F$ and $\check S$ are unchanged under $R\mapsto Rk$.

Far record: $n$-boxes 594 ok, 31 out, split limit 0; $R$-leaves 777,383 accepted (S 216,775 among them), 286,744 discarded by symmetry, 987 to local; 3,117,761 boxes evaluated. All 987 L leaves have their centres in leaves of the local record (test L1, exact). Test X compares the far candidate forms with an independent exact evaluation of $\tilde F$ and $\check S$ (192,320 equalities, 384,640 inequalities, 0 violations); `d37_tet_n05_replay_both.py --r0 1/16` replays the local and far records and the upper bound in one run.

## 6. Upper bound

Four pieces in the corners $c\in\{(1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)\}$ of the container at $s=2$ (translation $c/2$, orientation unchanged) and the inverted piece $R_{P2}$ with translation $(1,1,1)/6$ (vertices $(1,0,0)$, $(0,1,0)$, $(0,0,1)$, $(-\tfrac13,-\tfrac13,-\tfrac13)$). All vertices satisfy $b_f\cdot x\le1$; for each corner $c$ the corner piece lies in $c\cdot x\ge1$ and the other four in $c\cdot x\le1$, so the planes $c\cdot x=1$ separate them. Exact rationals; this does not depend on the reduction.

## 7. What Lean checks, and what it does not

`lean/PackLean/D37N05/` (exported by `lean/tools/export_d37n05.py`, integers only, no Mathlib, `native_decide`) re-checks, independently of the Python code: the far record (the $n$ tree, both $R$ trees of every $n$-box, every A/S/D/L leaf including $D_j\le\mu$ on $(n\text{-box})\cap T$ and $k_N=0$ on boxes meeting $N_1$), the local record (every face tree of the five centres; Lean builds the candidate polynomials from the centre quaternions), and the constants (piece rotations and the 12 quaternions of the L check, the local regions and $2a_{\max}+3r_0\le2$, the centres as images of $R_1^{\ast}$ and $R_{P2}$, the coefficients of $\tilde\kappa$, and the upper-bound placement). The leaf counts in the theorems are those of the Python records.

Lean does **not** check:
1. the reasoning: the pigeonhole step, T2–T4 restricted to the cell (§2), the identity behind types F/M/S and $D_j\le\mu$, the choice and extension of $\kappa$ (§3), the reading of the local lemma, and the covering meaning (quaternion charts, $n$-boxes and out boxes, local faces, the agreement of the far L cube with the local region);
2. that the constants mean what they should (that $R_1^{\ast}$, $R_{P2}$ are the optima; the centres affect only whether boxes close);
3. the compiler: `native_decide` trusts it (and `Lean.ofReduceBool`).

## 8. Not used in the proof

- The floating-point LPs (window of $\beta$, first-order sharpness), the floating-point choice of candidates and of $k_N$ (from a multistart estimate of $\min_R\tilde F$): they only choose the certificate.
- Uniqueness of the optimal configuration is not claimed.
