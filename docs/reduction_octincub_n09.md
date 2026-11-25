# Nine octahedra in a cube: `octincub_n09`

Case: `octincub_n09` (nine unit-edge regular octahedra in an axis-parallel cube). Tool: `d87_cub_common.py`, `d87_oct_*`.

**Claim.** Let $s^{\ast}(9)$ be the least edge $s$ of an axis-parallel cube that holds nine closed regular octahedra of edge 1 with pairwise disjoint interiors. Then $s^{\ast}(9)=4\sqrt2/3$ (the positive root of $9x^2-32$), and the record `octincub_n09` is optimal; uniqueness of the optimal configuration is not claimed. The upper bound is an exact rational placement (§6). The lower bound comes from a pigeonhole step over the eight octants (two of the nine centres lie in one closed octant), a table of points that turns the two-piece problem into one-piece inequalities (§2), and box certificates for three of those inequalities (§3–§5).

Everything here is a prose argument together with computer checks. The argument, the code and the tests were written by Claude and read by two reviews by other Claude models (Opus, then Fable; 0 fatal findings each; see [review_log.md, v1.0.0 timeline, Reviews 23 and 24](review_log.md#timeline-v100)). **There is no human or third-party review, and the lower bound is not formally verified.** Lean checks only the arithmetic of the upper bound, of $\hat s_0$, of the table and of the equality points (§7).

## 1. Units and notation

Scale by $\sqrt2$: the piece is $\hat K=\{\lvert x\rvert+\lvert y\rvert+\lvert z\rvert\le1\}$ (vertices $\pm e_i$) and the container is $C_0=[-\tfrac43,\tfrac43]^3$ of edge $\hat s_0=8/3$, which is $8/(3\sqrt2)=4\sqrt2/3$ in the original unit. A placement is $X=R\hat K+t$ with $R$ orthogonal (columns $r_k$); since $\hat K=-\hat K$, $\det R=-1$ gives a congruent piece too. Its support function is $h_X(n)=\max_k\lvert n\cdot r_k\rvert+n\cdot t$, and $e_i(R):=\max_k\lvert R_{ik}\rvert\le1$ is the half-width of $R\hat K$ along axis $i$. We write $(x)_-:=\max(-x,0)$.

## 2. The reduction (no computation)

**Pigeonhole.** The eight closed octants cover space, so two of the nine centres $t_i$ lie in the same octant. A sign change $D=\mathrm{diag}(\pm1,\pm1,\pm1)$ preserves $C_0$ and $\hat K$, and $D(R\hat K+t)=(\pm DR)\hat K+Dt$, so we may take the octant $Q=\{t\ge0\}$.

**Widen and split.** Suppose two pieces $X_1,X_2$ fit in the cube of edge $s<\hat s_0$ with disjoint interiors and $t_i\in Q$. Put $\lambda=\hat s_0/s>1$ and $X'_i:=R_i\hat K+\lambda t_i$. Then $X'_i\subset\operatorname{int}(\lambda X_i)\subset C_0$, the $X'_i$ are disjoint compact convex sets, and $\lambda t_i\in Q$. Strict separation gives a direction $n$ with $h_{X'_1}(n)+h_{X'_2}(-n)<0$. Only the container at $\hat s_0$ is used; no monotonicity in $s$ and no limit is needed.

**Table of points.** To each octant $N$ of directions (one is chosen on boundaries) and to $-N$ we attach the same point $w(N)$: $w_Q=(\tfrac13,\tfrac13,\tfrac13)$ for $(+,+,+)$ and $(-,-,-)$; for the six octants with exactly one axis $j$ of different sign, the point with $2/9$ at $j$ and $5/18$ elsewhere (for $(+,+,-)$ and $(-,-,+)$ this is $w_A=(\tfrac5{18},\tfrac5{18},\tfrac29)$). If for every octant $N$

$$(\star)\qquad X\subset C_0,\ t\in Q\ \Longrightarrow\ h_X(n)\ge n\cdot w(N)\quad\text{for all }n\in N\cup(-N),$$

then $h_{X'_1}(n)+h_{X'_2}(-n)\ge n\cdot w-n\cdot w=0$, a contradiction. The entry point builds this table and checks that opposite octants carry the same point and that axis permutations map it onto itself (`step_premises` in `d87_oct_replay_all.py`).

**How $t$ is eliminated.** For fixed $R$ the admissible $t$ form the box $0\le t_i\le\tfrac43-e_i(R)$ (non-empty since $e_i\le1<\tfrac43$). Taking $t_i=0$ where $n_i\ge0$ and $t_i$ maximal where $n_i<0$,

$$\min_t h_X(n)\ \ge\ G(n,R):=\max_k\lvert n\cdot r_k\rvert+\sum_i(n_i)_-\big(e_i(R)-\tfrac43\big).$$

Only this lower bound is used (strong duality of the $t$-LP motivated the formula but is not needed).

**Four cases.** Axis permutations preserve $Q$, $C_0$, $\hat K$ and the table, so $(\star)$ reduces to four inequalities (representatives $(+,+,-)$ and $(-,-,+)$ for the six mixed octants):

- **(I)** $n\ge0$: $G(n,R)\ge\lVert R^{\mathsf T}n\rVert_\infty\ge\lvert n\rvert/\sqrt3\ge(n_1+n_2+n_3)/3=n\cdot w_Q$. One line by hand; the container is not used.
- **(II)** $n=-m$, $m\ge0$: $F(m,R):=G(-m,R)+m\cdot w_Q=\max_k\lvert m\cdot r_k\rvert+\sum_im_i\big(e_i(R)-1\big)\ge0$.
- **(III)** $n=(a,b,-c)$, $a,b,c\ge0$: $G(n,R)-n\cdot w_A\ge0$.
- **(IV)** $n=(-a,-b,c)$, $a,b,c\ge0$: $G(n,R)-n\cdot w_A\ge0$.

Equality points (substitution by hand, value $0$): (I) $n=(1,1,1)$, $R=I$; (II) $m=(1,1,1)$, $R=R^{\ast}$; (III) $n=(1,1,-1)$, $R=R_{III}$ ($1-\tfrac23-\tfrac13$); (IV) $n=(-1,-1,1)$, $R=R_{III}$ ($1-\tfrac43+\tfrac13$). Here $R^{\ast}$ has columns $(2,2,-1)/3$, $(2,-1,2)/3$, $(-1,2,2)/3$ ($\det=-1$), and $R_{III}$ has columns $(2,2,1)/3$, $(2,-1,-2)/3$, $(-1,2,-2)/3$ ($\det=+1$). (II)–(IV) are not one-line facts; they are shown by the certificates below.

*Motivation, not used.* $w_A$ is the point where the forces on the equality piece of (III) balance (the separating plane and the wall $z$; the rational KKT system has the unique solution with face weights $(2/9,7/18,7/18)$, all $\ge0$; `solve_wA` in `d87_oct_step0.py`).

## 3. Symmetry and the maps (far region)

$G$ and $F$ are invariant under $R\mapsto Rg$ for the 24 rotations $g$ of $\hat K$ and under $R\mapsto-R$. For a coordinate permutation $P$, $F(Pm,R)=F(m,\pm P^{\mathsf T}R)$.

- (II): the room $\{m_1\ge m_2\ge m_3\ge0\}$ with the map $6m=(6-3a-4b,\ 3a+2b,\ 2b)$ on $T=\{a,b\ge0,\ a+b\le1\}$. The vertices of $T$ map to positive multiples of $(1,0,0)$, $(1,1,0)$, $(1,1,1)$, which generate the room ($m=(m_1-m_2)(1,0,0)+(m_2-m_3)(1,1,0)+m_3(1,1,1)$); $F$ is homogeneous of degree 1 in $m$, so $T$ suffices. This is a hand argument; the 300 random points of `check_map` are only a guard. The equality point is $(a,b)=(0,1)$.
- (III): $x\leftrightarrow y$ reduces to the room $\{a\ge b\ge0,\ c\ge0\}$; the map $n=(2-A-2B,\ A,\ -2B)$ sends the vertices of $T$ to multiples of the generators $(1,0,0)$, $(1,1,0)$, $(0,0,-1)$. (IV) uses $-n$. The sign pattern assumed in $(n_i)_-$ (wall axes $\le0$, others $\ge0$) is checked exactly at the vertices (`check_map3`). The equality point is $(A,B)=(2/3,1/3)$.

## 4. Far region: types A, D, L

`d87_oct_far.py`: $n$ runs over boxes of $T$, $R$ over a tree of quaternion boxes ($R=M(q)/\lvert q\rvert^2$).

- **Type A.** A candidate (the top column $k$ with a sign, and for each wall axis a column with a sign) gives $F_c\le F$. $\lvert q\rvert^2F_c$ (for (III), (IV): $18\lvert q\rvert^2F_c$, `cand_poly3`) is linear in the entries of $M(q)$ and $\lvert q\rvert^2$ and linear in $n$, so it is bounded at each vertex of the $n$-polygon with a quadratic lower bound on the $R$-box ($\ge0$ required).
- **Type D.** The leaf is discarded if for some $g$ the trace of $Rg$ is strictly larger than that of $R$ on the whole box; the copy of maximal trace lies in a leaf of the same tree (same $n$-box), which cannot be discarded.
- **Type L.** The box lies inside the region of a local lemma (§5). Every condition of the local coordinates is the sign of a linear form in $M(q)$, $\lvert q\rvert^2$ (`L_conds`, `L_conds_R`), so membership is decided exactly ($n$ at the vertices, $R$ by the quadratic lower bound). (II) uses $R'=R\,(-g)$ (because $\det R^{\ast}=-1$); (III), (IV) use $R'=Rg$.

Records (split limit 0 in all three): (II) $n$-boxes 136 ok, 15 out (outside $T$); $R$-leaves A 12,068, D 4,409, L 63. (III) 536 ok, 31 out; A 71,764, D 24,341, L 2,494. (IV) 529 ok, 31 out; A 53,470, D 18,176, L 550. Files `certificates/d87_oct_far_{II,III,IV}.{json,boxes.jsonl.gz,replay.json}`.

## 5. Local lemmas P2, J3, J4

`d87_oct_local.py`. The direction is written in body coordinates, $n=R\nu$ with $\nu^+:=(1+z_1+z_2,\ 1-z_1+z_2,\ 1-2z_2)$, so that ties of the top vertices become ties of the entries of $\nu$ ($z=0$). Each lemma states $G-n\cdot w\ge0$ for the points of its box **whose $n$ lies in the relevant octant** ($-Q$ for P2, $(+,+,-)$ for J3, $(-,-,+)$ for J4); the far region only hands over $n$ in its room, a subset of that octant (exact by the maps).

- **P2** (II, isolated point): $R=R^{\ast}M(1,p)/\lvert q\rvert^2$, $q=(1,p)$, $m=R\nu^+$; region $\lvert z_i\rvert\le\tfrac18$, $\lvert p_i\rvert\le\tfrac18$. $P_c=\lvert q\rvert^4G_c=r\Lambda_c$ ($P_c(0)\equiv0$ is checked when the candidates are built); type F: some candidate has a lower bound of $\Lambda_c$ $>0$. 537 leaves.
- **J3** (III, a two-dimensional family): $R=R_z(u)\,B(\alpha,\beta)\,R_{III}$, $R_z(u)=M(1,0,0,u)/(1+u^2)$, $B=M(1,-\alpha,-\beta,0)/(1+\alpha^2+\beta^2)$, $\alpha=s+y$, $\beta=y-s$, $n=R\nu^+$; region $u\in[-\tfrac14,\tfrac14]$, $s\in[-\tfrac18,\tfrac14]$, $\lvert y\rvert\le\tfrac1{32}$, $\lvert z_i\rvert\le\tfrac18$. On the family $\{y=0,\ z_1=z_2=0\}$ the six candidates share the value $T(u,s)$ (second order $\tfrac{10}9u^2+4s^2$). Type F: $T\ge0$ on the base box (a lower bound, or positive definiteness of the $2\times2$ form in $T=u^2A+usB+s^2C$) and $\Lambda_c>0$, so $P_c=T+r\Lambda_c\ge0$; type D: a lower bound of $P_c$ itself $\ge0$. 2,415 leaves (F 1,739, D 676).
- **J4** (IV, a one-dimensional base): $R=R_{III}M(1,p)/\lvert q\rvert^2$, $p=\varphi(\tau)+l_1e_1+l_2e_2$, $\varphi(\tau)=(-5\tau,\ \tau+18\tau^2,\ \tau-18\tau^2)$, $e_1=(0,1,-1)$, $e_2=(-2,-5,-5)$, $n=-R\nu^+$; region $\tau\in[-\tfrac3{64},\tfrac3{64}]$, $\lvert l_1\rvert\le\tfrac1{16}$, $\lvert l_2\rvert\le\tfrac1{80}$, $\lvert z_i\rvert\le\tfrac18$. $\varphi$ only approximates the tie curve; only "$P_c\ge0$ in these coordinates" is used. Type F: $T_c=\tau^2A_c$ with $A_c\ge0$ and $\Lambda_c>0$; type D as above. 1,438 leaves (F 1,290, D 148).

The $2L$ faces of a box together are exactly $\lVert\text{transverse}/\text{scale}\rVert_\infty\le r_{\max}$; the denominators ($1+\sigma_z$, $w''$, $W$, $\sum\nu$) are checked strictly positive. Files `certificates/d87_oct_local_{P2,J3,J4}.{json,leaves.jsonl.gz}`.

**Who covers what.** The far header names each local lemma and its widths, the local header records its widths, and the entry point checks that they agree; this blocks a far region that assumes a wider local region than was certified. Test B3 narrows the local regions to $1/4$ of their width and checks that every L leaf of the far records is then rejected.

## 6. Upper bound

`record_config` in `d87_cub_common.py`: the origin piece ($R=I$, $t=0$) and eight corner pieces $R=DR^{\ast}D$, $t=(\pm\tfrac23,\pm\tfrac23,\pm\tfrac23)$ with $D$ the matching sign matrix. With exact rationals, all nine are orthogonal placements inside $C_0$, and each of the 36 pairs has a weakly separating plane (found among face normals and cross products of edge directions), so the interiors are disjoint (`check_config` in `d87_oct_step0.py`; `part_exact` also counts 9 pieces and 36 separated pairs). Broken versions (container shrunk by $1/100$; a corner centre moved to $\tfrac35(1,1,1)$) fail. This does not depend on the reduction.

## 7. What is checked, and by what

- **Python** (exact integers and rationals in every acceptance): `d87_oct_replay_all.py` checks the premises (constants, $\det R^{\ast}=-1$, $\det R_{III}=+1$, the table), the SHA-256 of records and code against `certificates/d87_oct_manifest.json`, the upper bound and the equality points (`d87_oct_step0.py`, compare `certificates/d87_oct_step0_exact.json`), and replays the three far records, each of which re-checks its local record. `d87_oct_tests.py` runs 86 tests (result `certificates/d87_oct_tests.json`): X (candidate formulas against an exact evaluation of $G$, $F$), P (special points traced to their leaves), W (tampered records are rejected), B (broken versions: $w_Q$ in place of $w_A$, $\hat s_0+\tfrac1{1000}$, narrowed local regions, J4 without its quadratic treatment).
- **Lean** (`lean/PackLean/D87Oct/Arith.lean`, integers only, core Lean, `decide +kernel`): `s0_ok`, `upper_ok` (the nine pieces, containment, 36 separated pairs, with the separating planes searched inside Lean independently of `check_config`), `broken_ok`, `table_ok`, `equality_ok` (the four equality points).

**Where constants enter.** $w_A$ and the half-edge $4/3$ are written by hand in three places: `W_A`, `S_HALF` in `d87_cub_common.py`; `WA` and the local `S43` in `d87_oct_local.py`; the coefficients $5,5,4,24$ in `cand_poly3` of `d87_oct_far.py`. The entry point compares the headers with `d87_cub_common`, and test X ties the three places together (a mismatch makes X fail).

Not checked by Lean or by any formal system: the reasoning of §2 (pigeonhole, widening and separation, the table, the elimination of $t$, the reduction to (I)–(IV)), the maps of §3, the meaning of types A/D/L and of the local lemmas, and the covering argument; these are prose, and the far and local records are checked only by the Python replay. The floating-point scans and LPs of the design stage only chose the certificate and are not part of the argument.
