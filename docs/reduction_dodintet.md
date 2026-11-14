# Dodecahedra in a tetrahedron: `dodintet_n02`

Case: `dodintet_n02` (two unit-edge regular dodecahedra in a regular tetrahedron). Tool: `d45_dodintet_*` (it uses the integer lower-bound tools of `d28_common.py`).

**Claim (an enclosure, not an exact value).** The minimal edge $s^{\ast}$ satisfies

$$\bar s:=2\sqrt2\,\bar c\ \le\ s^{\ast}\ \le\ s_{\rm up}:=2\sqrt2\,u_{\rm up},\qquad \bar c=\frac{14986756529}{5\cdot10^{9}},$$

where $u_{\rm up}=a+b\sqrt5$ with explicit rationals $a,b$ (denominators of 208 digits, listed in `certificates/d45_dodintet_upper.json`). Here $\bar s=8.4777897357\ldots$ and $s_{\rm up}-\bar s=2\sqrt2\,(u_{\rm up}-\bar c)\approx3.86\times10^{-10}$; $u_{\rm up}-\bar c>0$ is checked exactly in $\mathbb Q(\sqrt5)$. A rational lower bound is $s^{\ast}\ge 4238894867859/(5\cdot10^{11})$ (checked as $x^2\le8\bar c^2$). So the certificate determines $s^{\ast}=8.477789736\ldots$ to 9 decimal places.

The recorded configuration has $s_0=8.4777897361038792480591483617\ldots$, an algebraic number of degree 16: $u_0=s_0/(2\sqrt2)$ is a root of the irreducible octic

$$7340898713600u^8-45258428416000u^7-87280023552000u^6+469121578649600u^5+8374317326080u^4-12298477164800u^3-298747520080u^2+47781610620u-847451401,$$

and numerically $\bar s<s_0<s_{\rm up}$ with $s_0-\bar s\approx3.86\times10^{-10}$ and $s_{\rm up}-s_0\approx2.26\times10^{-21}$ (this comparison with $s_0$ is numerical). **That $s^{\ast}=s_0$ exactly is not claimed** (an attempt at the equality, in the degree-16 field, is separate work and is not part of this release).

This case uses the separation argument T1–T4 of [reduction_tetrahedron.md](reduction_tetrahedron.md) and the "route Y" of [reduction_tetintet.md](reduction_tetintet.md) (a rational scale below the optimum, a local lemma whose zero-order part is only required to be nonnegative). It differs from `tetintet_n02` as follows:

1. **No restriction $s_1(R)\le s$.** One dodecahedron fits in a container of edge at most $6.87<\bar s$ in every orientation, so T4 is used in its strong form (all $R$) and every leaf is of type F (no multipliers, no type S).
2. **Field $\mathbb Q(\sqrt5)$.** Vertices, rotations and centres have entries in $\mathbb Q(\sqrt5)$. Lower bounds bracket $\sqrt5$ by rationals of width $2^{-120}$ (far region, the integer rule of `d28_common.py`) or $2^{-100}$ (local region); signs of $a+b\sqrt5$ are decided exactly.
3. **Interior optimum.** The separating normal of the recorded configuration is an interior point $\hat P$ of $D_n$ (no arc of optima, no mirror centres, no corner images). Instead, on each side there is a line in $D_n$ along which the zero-order value stays $0$ (line A, line B, at $64.5^\circ$), and the local region consists of two **tubes** around these lines.
4. **$\kappa$ is linear and fixed by the two lines**, and the far region has three pair types (below).

Everything here is a prose argument. The application of T1–T4 and the local/far arguments were read once by a reviewer model (Fable; no fatal findings, one important finding about the description of the $y=0$ seam, fixed in the text of the notes; see [review_log.md](review_log.md)); **there was no human review** and nothing is formalized. Lean re-checks only the arithmetic (§7).

## 1. Notation

As in [reduction_tetrahedron.md §5](reduction_tetrahedron.md#square-root-free-form-used-by-the-tools), without the $\sqrt2$ scaling of the piece (all data are already in $\mathbb Q(\sqrt5)$): the container of edge $s$ is $\{x: b_f\cdot x\le c\}$, $c=s/(2\sqrt2)$, with $b_f\in\{(-1,-1,-1),(-1,1,1),(1,-1,1),(1,1,-1)\}$. For a direction $n$ and $R\in SO(3)$,

$$F(n,R;c)=\max_v n\cdot Rv+\tfrac14\sum_f\big(m(n)-n\cdot b_f\big)H_f(R)-c\,m(n),\quad H_f(R)=\max_v b_f\cdot Rv,\quad m(n)=\max_f n\cdot b_f,$$

over the 20 vertices $v$ of the unit-edge dodecahedron (coordinates $\pm\varphi/2$, $\pm1/2$, $\pm\varphi^2/2$, $0$). On $D_n=\{n=(x,y,1):\lvert y\rvert\le x\le1\}$, $m(n)=n\cdot b_2$, and $-n$ is mapped to $\sigma n=(x,-y,1)$ by $\operatorname{diag}(-1,1,-1)\in T_d$. The dodecahedron is centrally symmetric, so reflections of $T_d$ can be paired with $-I$.

**What is shown** (T4 with the rational scale $\bar c$, as in [reduction_tetintet.md §2](reduction_tetintet.md#2-t4-with-the-restriction-s_1rlebar-s) but without the restriction): there is a function $\kappa$ on $D_n$ with

$$F(n,R;\bar c)\ \ge\ \kappa(n)\ \ \text{for all }n\in D_n,\ R\in SO(3),\qquad \kappa(n)+\kappa(\sigma n)\ge0 .$$

If two pieces fit at some $s<\bar s$, T3 gives $n$, $R_1,R_2$ with $F(n,R_1;c)+F(\sigma n,R_2;c)\le0$ at $c=s/(2\sqrt2)<\bar c$; raising $c$ to $\bar c$ lowers the sum strictly (as $m>0$), contradicting the two inequalities. Hence $s^{\ast}\ge\bar s$.

**Candidates.** For a choice $c=(t;v_0,v_1,\cdot,v_3)$ of a top vertex and one vertex per face $f\ne2$, $F_c:=n\cdot Rv_t+\tfrac14\sum_{f\ne2}n\cdot(b_2-b_f)\,b_f\cdot Rv_f-\bar c\,n\cdot b_2\le F$ wherever the weights $n\cdot(b_2-b_f)$ are $\ge0$ (on $D_n$; for the tubes checked exactly at the corners of each parallelogram).

## 2. $\kappa$ and the two sides

Let $\hat k\in\mathbb Q^3$ (denominator $2^{80}$). Two linear forms are used:

$$\kappa_B(p)=\hat k\cdot p\quad(\text{side B, near }\hat P),\qquad \kappa_A(p)=-\hat k\cdot\sigma p\quad(\text{side A, near }\sigma\hat P),$$

so that $\kappa_A(\sigma n)+\kappa_B(n)=0$ identically. $\hat k$ is the exact solution (in $\mathbb Q(\sqrt5)$) of three linear equations — the zero-order value is constant along line B on side B and along line A on side A, and equal on both sides at the base points — rounded to $2^{-80}$. Its value matters only for whether boxes close: the same $\hat k$ is used in the local and the far region, and the pair conditions below are checked for the rounded value. With this $\hat k$ the zero-order margin is $e\approx2.29\times10^{-10}$ on both sides (in units of $F$), consistent with $(\bar c_0-\bar c)\cdot m$.

## 3. Local lemma on two tubes

**Tubes.** For side $X\in\{A,B\}$: a base point $P_0$ and direction $d$ of the line (rounded to $2^{-64}$), a side direction $\hat w$ ($\lvert\hat w\rvert\approx1$), and a centre $q_X$ (an exact $\mathbb Q(\sqrt5)$ quaternion: the image of the rational $\hat R_0$ of §5 under the $T_d$ element that maps the separating normal into $D_n$, replaced by the representative of maximal trace in its orbit under the 60 rotations of the piece). The tube is

$$\{(n,R):\ n=P_0+u\,d+w\,\hat w,\ u\in[u_{\rm lo},u_{\rm hi}],\ \lvert w\rvert\le r_0;\ R=R(q_X\otimes(1,p)),\ \lVert p\rVert_\infty\le r_0\},\quad r_0=1/32,$$

with $u\in[-1/8,1/8]$ for $T_A$ and $u\in[-7/16,1/8]$ for $T_B$ ($T_B$ is longer, towards the shallow valley of line B, and crosses $y=0$). Unlike `tetintet`, $w$ takes both signs (the line is interior).

**Lemma.** With $\zeta=(w,p_1,p_2,p_3)=r\hat\zeta$, $\lVert\hat\zeta\rVert_\infty=1$, $r\in[0,r_0]$ (8 faces), and $P_c:=\lvert q\rvert^2(F_c-\kappa_X)$ a polynomial in $(u,\zeta)$ with coefficients in $\mathbb Q(\sqrt5)$, split $P_c(u,r\hat\zeta)=e_c(u)+r\,\Lambda_c(u,r,\hat\zeta)$ ($e_c$ is affine in $u$). A leaf is accepted if $e_c\ge0$ at both ends of its $u$-interval (exact sign in $\mathbb Q(\sqrt5)$) and the lower bound of $\Lambda_c$ on the leaf is $>0$ (each variable replaced by centre $+$ half-width $\cdot t$; constant kept, even monomials $\min(0,\cdot)$, others $-\lvert\cdot\rvert$, with $\sqrt5$ bracketed per monomial). Then $F-\kappa_X\ge F_c-\kappa_X\ge0$ on the leaf.

**Records.** $T_A$: 50 candidates, 2,670 leaves; $T_B$: 20 candidates, 1,002 leaves; split limit 0 in both.

## 4. Far region

Upper $n$-boxes $N\subset[0,1]^2$ (coordinates $(x,y)$, denominator $2^{30}$) are paired with their mirror $\sigma N$. For each pair there are two $R$-trees: the U tree (point $p=n\in N$, inequality $F(p,R)\ge\kappa_U(n)$) and the L tree (point $p=\sigma n$, inequality $F(p,R)\ge\kappa_L(n)$, both written in the coordinates of $N$). The pair has a type giving the forms of $\kappa_U,\kappa_L$ and an offset per tree (denominator $2^{24}$):

| type | U tree | L tree | condition checked |
|---|---|---|---|
| I | $\kappa_B+k$ | $\kappa_A-k$ | $\kappa_U+\kappa_L\equiv0$ |
| II | $\kappa_A+k$ | $\kappa_B-k$ | $\kappa_U+\kappa_L\equiv0$ |
| III | $\kappa_B+k_U$ | $\kappa_B+k_L$ | $\kappa_U+\kappa_L\ge0$ at the 4 corners of $N$ (affine) |

Type III is used near $y=0$ where both $N$ and $\sigma N$ meet $T_B$. **Seam $y=0$** (the point of review): a point with $y=0$ belongs to an upper box and to the mirror of the same box, and both inequalities hold there, so $\kappa:=\max(\kappa_U,\kappa_L)\ge\tfrac12(\kappa_U+\kappa_L)\ge0$ and $\kappa(n)+\kappa(\sigma n)=2\kappa(n)\ge0$. At other box boundaries one box is chosen per point (the same pair for $n$ and $\sigma n$).

Leaves of an $R$-tree (four quaternion charts, as in the other cases): **A** accepted (the integer lower bound of $\lvert q\rvert^2(F_c-\kappa)$ on the box $\times$ $N$ is $\ge0$), **D** discarded by symmetry ($\operatorname{tr}(Rk)-\operatorname{tr}(R)>0$ for one of the 60 rotations $k$ of the piece), **L** handed to the local lemma: the point box ($N$ or $\sigma N$) lies in the parallelogram of the tube of the tree's form, the tree's offset is $\le0$ (the lemma gives $F\ge\kappa_X\ge\kappa_X+{\rm offset}$), and with $w=\bar q_X\otimes q$ one has $\pm w_0>0$, $\lvert w_i\rvert\le r_0\lvert w_0\rvert$ at the 8 corners of the $R$-box (exact in $\mathbb Q(\sqrt5)$). Boxes entirely outside $D_n$ ($y>x$) need no record.

**Record.** 5,477 pair boxes (types I 5,446, II 5, III 26; widths $2^{-6}$ to $2^{-13}$), 114 unrecorded boxes outside $D_n$; $R$-leaves: 2,717,927 accepted, 1,314,967 discarded, 18,816 to local; split limit 0. The record is in two files: the main part (5,475 boxes) and a continuation `part1` (2 boxes around $\hat P$ that were redone after a fix of the pruning rule; their rows had been removed from the main part by hand). The claim rests only on the replay of the union, which re-checks the $n$-tree cover, every pair condition and every leaf exactly. The main part cannot be regenerated by the current code (the pruning heuristic of `try_pair` was changed during the run; this affects only which boxes are tried, not any acceptance test); the continuation can (§8).

**Seam with the local lemma (test L1).** 400 sampled far leaves marked L lie inside the tube parallelograms and cubes (exact).

## 5. Upper bound

$\hat q$ is the recorded quaternion of piece 0, re-solved from its contact equations to 40 digits and rounded to denominator $2^{70}$; $\hat R_0=M(\hat q)/\lvert\hat q\rvert^2$ (rational), $\hat R_1=g\hat R_0k$ with $g\in T_d$ and $k$ a symmetry of the dodecahedron (entries in $\mathbb Q(\sqrt5)$). Each piece is pushed against the three walls it touches in the record (linear equations in $u=s/(2\sqrt2)$), the separating normal is $\hat n=(\text{edge }\{3,15\}\text{ of piece 0})\times(\text{edge }\{4,16\}\text{ of piece 1})$, and $u_{\rm up}$ makes the gap along $\hat n$ zero. `d45_dodintet_upper.py` checks exactly in $\mathbb Q(\sqrt5)$ that all 40 vertices satisfy the 4 wall inequalities at $u_{\rm up}$ (160 checks) and that the plane $\hat n\cdot x=\text{const}$ separates the pieces (40 checks). This uses only the vertices, not the reduction.

## 6. Tests (`d45_dodintet_tests.py`)

W (random points: $F-\kappa-{\rm offset}\ge0$ in the far boxes, min $+1.9\times10^{-6}$; in the tubes, min $+6.5\times10^{-3}$), t5 ($\bar c+10^{-6}$ fails at the zero order in both tubes), t6 (a negative pair sum or an offset $+1/2$ fails), t4 (setting $k_L=0$ in the 26 type-III boxes fails all 26), L1, R3 (far formula against the direct candidate formula), W2 (an independently written $F$), and **chain** (local replay of both tubes, far replay, upper-bound check, one verdict). Not done: the analogue of t3 of `tetintet` (removing a tube makes the far region fail), which would need a new far run.

## 7. What Lean checks, and what it does not

`lean/PackLean/D45DT/` (written from `lean/tools/export_d45dt.py`; decisions in the hand-written `Core.lean`, field elements and polynomials from `PackLean.D28.Core`; all by `native_decide`):

- **Far** (`far_all`): the $n$-tree closes and its pair leaves are the 5,477 recorded boxes; for every pair, Lean builds $\kappa_U,\kappa_L$ from $\hat k$, the type and the offsets, checks the pair condition, and for every leaf rebuilds the same lower bound as the Python checker (accepted, discarded, L with the parallelogram and the cone, exact in $\mathbb Q(\sqrt5)$); the counts equal the record.
- **Local** (`localA_ok`, `localB_ok`): Lean builds every candidate polynomial $\lvert q\rvert^2(F_c-\kappa)$ from the tube constants (base point, direction, side direction, centre, $\bar c$, $\hat k$), splits it into $e_c$ and $\Lambda_c$ itself, and checks every leaf; the trees close from the 8 root faces with the Python split rule.
- **Constants** (`consts_ok`): the $\sqrt5$ brackets; the piece is a centrally symmetric polyhedron with 20 vertices, unit minimal distance and 3 edges per vertex; the 60 matrices are distinct rotations permuting the vertices; the weights are $\ge0$ at the tube corners. **Upper and sandwich** (`upper_ok`): both placed pieces are rotations of that piece, lie in the container of parameter $u_{\rm up}$ and are separated by a plane; $0<2\sqrt2(u_{\rm up}-\bar c)<4\times10^{-10}$; the rational lower bound of $\bar s$; (reference) the octic above changes sign between $\bar c$ and $u_{\rm up}$.

The same constants ($\bar c$, $\hat k$, tubes, centres) are used by the local and the far parts and by the sandwich, because they are read from one structure. Lean does **not** check: the reduction T1–T4 and that $F$ represents the problem; the meaning of the leaf tests (that $F_c\le F$ with nonnegative weights, the discard rule, the local lemma "$e_c\ge0$, $\Lambda_c>0$, $r\ge0$ ⇒ $P_c\ge0$", the lower-bound rule on $[-1,1]^k$); the seam argument at $y=0$ and at box boundaries; the meaning of the covers (the quaternion charts cover $SO(3)$, the $n$-tree and the mirror cover $D_n$, the tube faces cover the tube, the far cone test and the local cube describe the same set); that the centres and $\hat k$ are close to the optimum (not needed for soundness); that $s_0$ satisfies the octic. `native_decide` trusts the Lean compiler.

## 8. Not used in the proof

- The octic, $s_0$ and its comparison with $\bar s$ and $s_{\rm up}$ (numerical); the floating-point estimates that chose $\hat k$'s equations, the tubes, the offsets and the candidates; the sharpness and slack maps of stage 0.
- Uniqueness of the optimal configuration is not claimed.
