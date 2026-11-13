# Octahedra in a tetrahedron: `octintet_n02`

Case: `octintet_n02` (two unit-edge regular octahedra in a regular tetrahedron), $s^{\ast}=3$. Tool: `d31_*`.

This case uses the separation argument T1–T4 of [reduction_tetrahedron.md](reduction_tetrahedron.md) with a single linear $\kappa$ on the whole domain. For the octahedron all data of the reduced inequality are rational, so the inequality can be rewritten as one function $\Gamma\ge0$ with integer data and checked without square roots. Unlike `icointet`/`cubintet`, the set where equality holds is not isolated: it contains two curves that meet in one point, and the local region is built around them.

Everything here is a prose argument. The application of T1–T4 to this case and the local/far arguments were each read once by a reviewer model (see [review_log.md](review_log.md)); nothing is formalized. Lean checks only the arithmetic.

## 1. The bridge from $\Gamma\ge0$ to $s^{\ast}\ge3$

Notation as in [reduction_tetrahedron.md §5](reduction_tetrahedron.md#5-t4--the-inequality-that-is-checked): $b_f\in\{(-1,-1,-1),(-1,1,1),(1,-1,1),(1,1,-1)\}$ ($f=0,1,2,3$), $\tilde m(n)=\max_f n\cdot b_f$, and the square-root-free left side $F(n,R;c)$ of (K) with $c=s/(2\sqrt2)$.

1. **Form and scale.** The unit-edge octahedron has vertices $\pm\tfrac{\sqrt2}2e_i$. Multiplying (K) by $\sqrt2$, the piece's vertices become $\pm e_i$, so $\max_v w\cdot Rv=\tfrac{\sqrt2}2\lVert R^{\mathsf T}w\rVert_\infty$, and with $s_0=3$ (i.e. $c=3/(2\sqrt2)$) the right side becomes $\sqrt2\,\kappa$. We take
$$\kappa(n)=\tfrac{\sqrt2}{4}\,y\qquad(n=(x,y,1)\in D_n),$$
so $\sqrt2\,\kappa=y/2$. There are no per-box constants ($k_N=0$ everywhere).
2. **Weights.** On $D_n=\{(x,y,1):\lvert y\rvert\le x\le1\}$ we have $\tilde m(n)=1+x-y$ (attained by $b_2$) and the weights $w_f=(b_2-b_f)\cdot n$ are $(2+2x,\ 2x-2y,\ 0,\ 2-2y)\ge0$.
3. **Extension of $\kappa$.** $\kappa=\tfrac{\sqrt2}4y$ is defined on $D_n$ and extended to the cube surface $\max_i\lvert n_i\rvert=1$ by $T_d$-invariance; $D_n$ is a fundamental domain ([reduction_tetrahedron.md §6](reduction_tetrahedron.md#6-domain-of-n-and-the-definition-of-kappa)). Test K0 checks the extension exactly at 200 points. $\kappa$ is the height of the plane separating the two pieces in the recorded optimal configuration.
4. **The T4 condition.** $g_0=\operatorname{diag}(-1,1,-1)$ maps $-n$ to $\sigma n=(x,-y,1)\in D_n$, so $\kappa(n)+\kappa(-n)=\tfrac{\sqrt2}4(y-y)=0$.
5. **Reflections.** For $g\in T_d$ with $\det g=-1$ the piece symmetry $k=-I$ is used (the octahedron is centrally symmetric), as in §6 of the tetrahedral reduction.

With these, (K) on $D_n\times SO(3)$ is equivalent to $\Gamma\ge0$ below, and T4 gives $s^{\ast}\ge3$. Only (K) for all $R\in SO(3)$ is used (the restriction $s_1(R)\le s_0$ of the original statement is not used).

*Note on names.* The internal notes and the code call this function `g`. It is **not** the function $g(n,s)$ of [reduction_tetrahedron.md §4](reduction_tetrahedron.md#4-t3--the-separated-problem); here it is called $\Gamma$.

## 2. The function $\Gamma$

Put $h:=1-x$ and $k':=x-y$ (from the corner $n_B=(1,1,1)$ of $D_n$, $h$ runs along the edge $y=x$ and $k'$ along the edge $x=1$), so $n=(1-h,\ 1-h-k',\ 1)$ and $D_n=\{h\ge0,\ k'\ge0,\ 2h+k'\le2\}$. With $N_R(w):=\lVert R^{\mathsf T}w\rVert_\infty$,

$$\Gamma(h,k',R):=\tfrac h2+\big(N_R(n)-1\big)+\big(1-\tfrac h2\big)\big(N_R(b_0)-1\big)+\tfrac{k'}2\big(N_R(b_1)-1\big)+\tfrac{k'+h}2\big(N_R(b_3)-1\big),$$

and $F-\tfrac{\sqrt2}4y=\tfrac{\sqrt2}2\,\Gamma$. This identity was checked symbolically (test F0: with $N(\cdot)$ as symbols, $F-\tfrac{\sqrt2}4y-\tfrac{\sqrt2}2\Gamma\equiv0$ as a polynomial identity) and exactly at 20 rational points. Since $N_R(b_f)\ge1$ always ($\lVert w\rVert_\infty\ge\lvert w\rvert/\sqrt3$), only the term $N_R(n)-1$ can be negative.

**Candidates.** $\Gamma$ is a sum of maxima. Choosing one coordinate and sign for each maximum (a *candidate* $c=(i,j,j_1,j_3)$ for $n,b_0,b_1,b_3$) gives a function $G_c\le\Gamma$ on $D_n$ (the weights are $\ge0$ there). $G_c$ is linear in $(h,k')$ and in the entries of $R$; with a quaternion $q$ and $R=R(q)/\lvert q\rvert^2$, $\lvert q\rvert^2G_c$ is a polynomial, quadratic in $q$, with coefficients in $\tfrac12\mathbb{Z}$. No number field is needed.

**Where equality holds.** With $R(u)$ the rotation with quaternion $(1,u,u,u)$ (about $n_B$),

$$Z=Z_E\cup Z_C,\qquad Z_E=\{h=0,\ k'\in[0,2]\}\times\{I\},\qquad Z_C=\{n_B\}\times\{R(u):\lvert u\rvert\le\tfrac13\}$$

(the edge $x=1$ of $D_n$ with $R=I$, and the circle of rotations about $n_B$), meeting at $(n_B,I)$. On the surface $C_0=\{h=0\}\times\{R(u)\}$ one has $\Gamma\ge3k'\rho(u)$ with $\rho(u)=2\lvert u\rvert(1-\lvert u\rvert)/(1+3u^2)$. The minimum is therefore not isolated, and the local lemma has to follow these curves.

## 3. Domains and symmetry reduction

- **$n$-domain.** Boxes in $(h,k')$ with root $[0,1]\times[0,2]$; a box with $2h_{\rm lo}+k'_{\rm lo}\ge2$ lies outside $D_n$ and is marked *out*. A box that sticks out of $D_n$ is still valid on its part inside $D_n$.
- **$R$-domain.** The four quaternion charts of [reduction_symmetric.md §4](reduction_symmetric.md#4-symmetry-reduction-and-the-discard-rule), each $[-1,1]^3$.
- **Discard rule.** $k$ runs over the 23 non-identity rotations of the octahedron (signed permutation matrices with $\det=1$; the checker verifies these properties and that they are distinct). A box on which $\operatorname{tr}(Rk)-\operatorname{tr}(R)>0$ everywhere is discarded; $\Gamma(n,Rk)=\Gamma(n,R)$, so in each orbit the representative of maximal trace survives (as in [reduction_tetrahedron.md §7](reduction_tetrahedron.md#7-domain-of-r-and-the-discard-rule)). Because the rule uses that $k$ is a rotation, the table is checked for $\det=1$ and orthogonality, not only through $\Gamma$ (test m6′: a table entry with $\det=-1$ is not detected by comparing $\Gamma$, but by the determinant check).

## 4. Local region $L=J\cup C$

Coordinates around $Z$: $q=(1,\ u+p_1,\ u+p_2,\ u-p_1-p_2)$ ($u$ along the circle, $(p_1,p_2)$ across it) and the transverse coordinates $\zeta=(h,p_1,p_2)$; $\zeta=0$ is the surface $C_0$. All region constants are defined once in `d31_common.py`: $R_J=1/32$, $U_J=5/16$, $K_J=2$, $R_C=1/64$, $U_1=5/32$, $U_{C,\max}=3/8$. The far region and both local lemmas read them from there.

**Band $J$** (around the edge and the junction): $k'\in[0,K_J]$, $\lvert u\rvert\le U_J$, $h\le R_J$, $\lvert p_i\rvert\le R_J$. Candidates: the family $S_E$ (54 candidates with $i\in\{1,3\}$), which vanish on both curves. For each of them, exactly,

$$\lvert q\rvert^2G_c=r\,\Lambda_c(\hat\zeta,r,k',u)+k'u\,E_c(u),\qquad \zeta=r\hat\zeta,\ \lVert\hat\zeta\rVert_\infty=1,\ \hat h\ge0,$$

where $T_c:=(\lvert q\rvert^2G_c)\rvert_{\zeta=0}=k'u(e_0+e_1u)$ and $E_c=e_0+e_1u$ is linear. The checker computes $T_c$ and $(e_0,e_1)$ itself and verifies this form for all 54 candidates. A box (in $\hat\zeta$ on one of the 5 faces with $\hat h\ge0$, and in $r,k',u$) is accepted if, for one candidate, $s\cdot E_c\ge0$ at both ends of the box's $u$-range (with $s$ the sign of $u$ on the box; the box does not straddle $u=0$) and the lower bound of $\Lambda_c$ is $>0$. Then $G_c\ge0$ on the box, with equality only where $r=0$ and $k'uE_c=0$.

**Tube $C$** (around the circle, away from the junction): $\lvert u\rvert\in[U_1,U_{C,\max}]$, $h,k'\le R_C$, $\lvert p_i\rvert\le R_C$. Candidates: the family $S_C$ (81 candidates), which vanish on the circle; $T_c=0$ is checked, so $\lvert q\rvert^2G_c=r\,H_c$ with all four transverse coordinates $(h,k',p_1,p_2)$ scaled by $r$, and a box is accepted if some candidate has lower bound of $H_c$ $>0$. The tube extends beyond the fundamental range $\lvert u\rvert\le1/3$ to $3/8$, so that far boxes straddling $u=1/3$ (where the discard rule does not act) can be handed to $C$. The circle identity holds as a polynomial in $u$, so extending is valid.

$J$ and $C$ overlap for $\lvert u\rvert\in[U_1,U_J]$; overlaps do no harm.

What is shown: $\Gamma\ge0$ on $L$, and inside $L$, $\Gamma=0$ only on $Z$. Equality outside $L$ is not excluded (the far region proves $\ge0$), and **uniqueness of the optimal configuration is not claimed.** The reading "equality in $L$ only on $Z$" relies on $E_c$ having no root in the interior of an accepted box's $u$-range away from $u=0$; this follows from the endpoint test on a linear function, and the roots of the $E_c$ in use ($1/3,1/5,1/2,1$) are not dyadic box ends, but this was not counted from the records.

## 5. Far region

For each $n$-box (in $(h,k')$) and each $R$-leaf, the far checker accepts if for one candidate the lower bound of a positive integer multiple of $\lvert q\rvert^2G_c$ over the box is $\ge0$, where $G_c$ is evaluated at the four corners of the $n$-box ($G_c$ is linear in $(h,k')$, so the corners suffice) and the $R$-box is mapped to $[-1,1]^3$ with the integer lower-bound rule of [verification.md §2](verification.md#2-box-lower-bounds-far-region). A leaf is *to local* if it lies in $J$ or in $C$, decided with exact rational comparisons at the $n$-box and at the 8 vertices of the $R$-box in chart 0 (on $\lvert u\rvert$, $\lvert p_1\rvert$, $\lvert p_2\rvert$, or $U_1\le\pm u\le U_{C,\max}$). Discarded leaves use §3. The $R$-tree and the $n$-tree are stored as leaf records and rebuilt by replay with the same split rule.

Counts: $n$-boxes 319 ok, 17 out; $R$-leaves 49,568 accepted, 10,325 discarded, 824 to local; 351,533 boxes evaluated; split limit 0.

**Seam check (test L1).** The centres of all 824 far leaves marked "to local" lie in accepted local leaves (789 in $J$, 35 in $C$), and at those points $G_c<0$ occurs 0 times and $\Gamma<G_c$ 0 times (exact).

## 6. Upper bound

Both pieces with $R=I$, centres $\tfrac{\sqrt2}4(-1,1,-1)$ and $\tfrac{\sqrt2}4(1,1,1)$, in the tetrahedron of edge 3: 48 containment inequalities and one separating plane, checked exactly (18 contacts). This does not use the reduction, so the upper bound stands even if the bridge of §1 were wrong. It is the same configuration as the plane height $\kappa$ above. The $n=3,4$ configurations in [plateau.md](plateau.md) also give this upper bound.

## 7. Not used in the proof

- Floating-point maps of $\min_R\Gamma$ (441 grid points) and LP estimates of the sharpness ($\lambda_J(0,0)\approx0.167$) were used only to choose the region constants.
- An alternative allowing $k_{\sigma N}=-k_N\ne0$ in the far region was considered during design and is not used.
