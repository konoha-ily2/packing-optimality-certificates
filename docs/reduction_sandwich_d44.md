# Enclosures without a known closed form: `cubindod`, `icoinico`, `dodindod`, `octinoct` ($n=2$)

Cases: `cubindod_n02`, `icoinico_n02`, `dodindod_n02`, `octinoct_n02`. Tools: `d44_*` on top of `d16e_*` (and `d30_local.py` for the coverage check).

**Claim.** For each of the four cases there is a rational $\bar s$ and an exactly computed upper bound $s_{\rm up}$ with

$$\bar s\ \le\ s^{\ast}\ \le\ s_{\rm up},$$

and $\bar s$ and $s_{\rm up}$ agree in nine decimal places. This is an **enclosure, not an equality**: the certificates in this document do not identify $s^{\ast}$. The lower bound is a box certificate for "$\varphi(R)\ge\bar S$ for all $R$" with a rational target $\bar S$; the upper bound is the exact substitution of one placement built from a rational rotation $\hat R$. Neither side uses the value of $s^{\ast}$ or of the optimal rotation $R^{\ast}$.

| case | field | $\bar s$ | $s_{\rm up}$ (rounded down) | width |
|---|---|---|---|---|
| cubindod | $\mathbb Q(\sqrt5)$ | $0.915543853$ | $0.91554385317940023$ | $1.8\times10^{-10}$ |
| icoinico | $\mathbb Q(\sqrt5)$ | $1.963086047$ | $1.96308604713429280$ | $1.3\times10^{-10}$ |
| dodindod | $\mathbb Q(\sqrt5)$ | $1.9875980854$ | $1.98759808550499661$ | $1.05\times10^{-10}$ |
| octinoct | $\mathbb Q$ | $1.933119581$ | $1.93311958116060367$ | $1.6\times10^{-10}$ |

($\bar s$ is $s_{\rm up}$ truncated at the $10^{-10}$ place minus $10^{-10}$, i.e. `sbar_of_k(pair, 10)` in `d44_far.py`; the exact values are in the records.)

Everything here is computer-assisted: Python certificates with exact (integer and rational, or $\mathbb Q(\sqrt5)$) acceptance, and prose arguments checked by reading. The arguments, code and tests were written by Claude and were read by another Claude model (Fable): the first enclosures in Review 17 and the local regions with Lemma Q in Review 18 (see [review_log.md, Timeline (v1.0.0)](review_log.md#timeline-v100)). **There is no third-party review.** The $n=2$ claims of these four cases are, separately, formally verified in Lean (see the [README](../README.md) and [verification.md §8](verification.md#8-formal-proofs-in-lean-v10)); this document describes only the Python certificate side.

## 1. Frame: lower bound only $\bar S$, upper bound by substituting $\hat R$

Both container and piece are centrally symmetric, so [Lemma R](reduction_symmetric.md#2-lemma-r) applies and $S^{\ast}=\min_R\varphi(R)$ with the LP $\varphi$ of [reduction_symmetric.md §3](reduction_symmetric.md#3-one-face-of-the-piece-and-the-lp-varphir); the notation ($c_g$, $n_0$, $D_0$, $h_g$, charts, $N=\lvert q\rvert^2$, candidates $(J,\alpha)$, $A=-M_J^{-1}R(q)n_0$) is that of §3–§6 there.

- **Target.** $S=C_0\,s$ for these cases (`d44_far.S_of_sbar`, which requires `cedge2 = 1`). Put $\bar S:=\lceil C_0\bar s\cdot2^{80}\rceil/2^{80}$ (rational) and check $\bar S\ge C_0\bar s$ exactly in the field.
- **Lower bound.** Cover the rotation domain (four quaternion charts, minus boxes removed by the discard rule of [§4](reduction_symmetric.md#4-symmetry-reduction-and-the-discard-rule)) by boxes and show $\varphi(R)\ge\bar S$ on each. Then $S^{\ast}\ge\bar S\ge C_0\bar s$, so $s^{\ast}\ge\bar s$. The proof does not use what $\bar S$ is: if $\bar S>S^{\ast}$ some box simply fails. In `d16e_far.check_box` the field `P.SSTAR` appears only in a watchdog `need`, and the `d44_*` tools set it to $\bar S$; the translation bound $T$ ([§5](reduction_symmetric.md#5-range-of-the-translation)) is `default_T(S̄)` and depends only on $\bar S$ and the inradius.
- **Upper bound** (`d44_upper.py`, a direct check that does not go through Lemma R). The piece is pre-rotated by $\hat R=R(\hat q)$, $\hat q$ a rational quaternion with denominator $2^{70}$ (`certificates/d44_rhat.json`). Piece A $=\hat RK+\hat t$ with $\hat t$ rational (denominator $2^{60}$, shifted by $2^{-50}$ along $u=\hat Rn_0$), piece B $=-A$. The script checks exactly: all vertices of A and B satisfy $c_g\cdot x\le S_{\rm up}:=\max_{g,x}c_g\cdot x$; the plane $u\cdot x=0$ separates A from B; B is a congruent copy of A. So two pieces fit at $s_{\rm up}=S_{\rm up}/C_0$ (a field number; `s_up_rat` is a rational rounding up). Records: `certificates/d44_upper.json`.

## 2. Lemma Q (weighted local certificate)

Centre $\hat R$ ($p=0$ in chart 0), local region $L=\{\lVert p\rVert_\infty\le\rho_0\}$, $p=\rho\theta$ with $\theta$ on one of the six faces of $[-1,1]^3$ (`d16e_local.FACES`); a box is a box in $(\rho,a_1,a_2)\in[0,\rho_0]\times[-1,1]^2$. For a candidate $k=(J_k,\alpha_k)$ ($M_J$ regular) put

$$\Phi_k:=\sum_{j\in J_k}A^{(k)}_j\,c_j\cdot R(q)v_j+N^2D_0-\bar S\,N\sum_jA^{(k)}_j\;=\;N\Big(\sum_jA^{(k)}_j\Big)\big(B_k-\bar S\big),$$

where $B_k$ is the weak-duality bound of [§6](reduction_symmetric.md#6-the-local-lemma-d16d_) with $\lambda=A/\sum A$, $\mu=N/\sum A$.

**Lemma Q.** Let a box carry rational weights $w_k\ge0$, not all zero, such that $A^{(k)}_j\ge0$ ($j=1,2,3$) on the whole box for every $k$ with $w_k>0$, and $\sum_kw_k\Phi_k>0$ on the box. Then $\varphi(R)>\bar S$ on the box.

*Proof.* For each $k$ with $w_k>0$: $A^{(k)}\ge0$, and $A^{(k)}\ne0$ because $R(q)n_0\ne0$ and $M_J$ is regular, so $\sum_jA^{(k)}_j>0$; hence $\lambda\ge0$, $\mu>0$ and weak duality ([Lemma W](reduction_symmetric.md#lemma-w-weights-and-paired-lifting) with one term per face) gives $\varphi\ge B_k$, i.e. $N(\varphi-\bar S)\sum_jA^{(k)}_j\ge\Phi_k$. Adding with weights $w_k\ge0$: $N(\varphi-\bar S)\sum_kw_k\sum_jA^{(k)}_j\ge\sum_kw_k\Phi_k>0$, and the factor $N\sum_kw_k\sum_jA^{(k)}_j$ is $>0$. ∎

The weights may be anything; they only decide whether a box closes. Unlike the local lemma of [§6](reduction_symmetric.md#6-the-local-lemma-d16d_), there is no zero-order identity: the constant term $e_k:=\Phi_k(0)=\big(\sum_jA^{(k)}_j(0)\big)\big(B_k(\hat R)-\bar S\big)$ is an inequality, not an equation. Since $\bar S$ lies about $10^{-10}$ below $\varphi(\hat R)$, a candidate that is dual-optimal at $\hat R$ has $e_k>0$, and this margin absorbs the rounding of $\hat R$ and of the weights; only the combined $\sum_kw_ke_k$ is used.

**Acceptance (ii)** (`d44_local.Ctx.check`, integers and rationals only). On each face, $\Phi_k=e_k+\rho\,g_k(\theta)+\rho^2H_k(\theta,\rho)$ as an identity (split by degree in $\rho$; `Ctx.__init__` checks that $e_k$ does not depend on the face and that the three parts reassemble to $\Phi_k$). The checker forms $e:=$ a rational lower bound of $\sum w_ke_k$ (`qd_lower`, $2^{-200}$ enclosure of the field number), $g:=\operatorname{lb}\sum w_kg_k$ and $h:=\operatorname{lb}\sum w_kH_k$ over the box (`comb_exact`, then `lb_true`, which divides the integer bound of `lower_bound_field` by $M\cdot\mathrm{DEN}^{\rm HDEG}\cdot2^{\rm SQ\_K}$). Since $\rho\ge0$, $\sum w_k\Phi_k\ge e+g\rho+h\rho^2$ on the box, and the box is accepted iff

$$\min_{\rho\in[\rho_a,\rho_b]}\big(e+g\rho+h\rho^2\big)>0,$$

computed by `quad_min` from the two ends and, if $h>0$ and $-g/2h\in(\rho_a,\rho_b)$, the vertex value $e-g^2/4h$. Before this, $A^{(k)}_j\ge0$ is checked on the box for every $k$ with $w_k>0$ (`L.lb_h`); negative weights and all-zero weights are rejected.

**Candidates** are built from faces with LP slack $<0.1$ at $\hat R$ and vertices within $0.1$ of the support value (`near_active`, floating point); the sign of $A^{(k)}(0)$ is not required. Weights are chosen per box by a floating-point LP (denominator $2^{40}$). Neither enters acceptance. Numbers of candidates: icoinico 12, dodindod 4, octinoct 12.

## 3. Far-form boxes (octinoct)

At $\hat R$ of octinoct one container face has dual multiplier $0$ (in the tool's numbering $\lambda_5=0$): the optimal dual basis changes across a surface through $\hat R$. A box that straddles this surface cannot satisfy "$A^{(k)}\ge0$ on the whole box" for any candidate, so Lemma Q fails there. For such a box with $\rho_a>0$ the local record stores instead a **far-form** leaf (`Ctx.try_far`, `check_far`): an axis-aligned box of chart 0 in $p$ (`pbox_of`, rounded outward, even integer widths in units of $1/\mathrm{DEN}$) together with constant far multipliers, and the leaf is accepted iff

1. `pbox_contains` shows in integers that the $p$-box contains the local box ($p_k=\pm\rho$ and $p_i=\rho a_i$ are bilinear in $(\rho,a)$, so the four corners suffice; $\rho_a\ge0$ is required), and
2. `d16e_far.check_box` accepts the $p$-box with the same $\bar S$ and the same $T$ as the far region (the multipliers have denominator `QLAM` $=2^{48}$; the replay requires `QLAM` and $T$ to equal the record).

This is the far acceptance itself ([verification.md §2](verification.md#2-box-lower-bounds-far-region)); no new argument. octinoct has 186 far-form leaves; icoinico and dodindod have none.

## 4. Far region outside $\rho_0$

$\rho_0=1/32$ for icoinico, dodindod, octinoct. The far records are made by `d44_far_par.py` with `D44_RHO0=1/32`: a box of chart 0 inside $\lVert p\rVert_\infty\le\rho_0$ is handed to the local stage ("L"); everything else is accepted by `d16e_far.check_box` at target $\bar S$ or discarded by symmetry. The six faces $\times[0,\rho_0]$ of the local chart cover exactly the same cube, so the seam is the definition of $L$; the replay checks `inside_L` leaf by leaf and `d44_s3_check.py` requires the same $\rho_0>0$, the same $\bar s$, the same pair and the same $\hat R$ in both records.

**cubindod** is first-order sharp at its optimum (the cost of the far tool grows only linearly in the number of digits), so it uses **only the far tool**: `d44_far.py` with $\rho_0=0$ (no local region; `inside_L` is never true and the replay requires no L boxes), $k=10$, minimum box width $2^{-38}$. Its multipliers were chosen with the tighter LP of `d44_lpfix.py`, which changes only the choice, not `check_box`.

| case | local: evaluated / leaves (single, weighted, far-form) | far: evaluated / accepted / discarded / to local | $T$ |
|---|---|---|---|
| cubindod | — | 94,353 / 46,658 / 524 / 0 | 65/64 |
| icoinico | 304 / 155 (86, 69, 0) | 67,919 / 33,221 / 740 / 8 | 41/32 |
| dodindod | 130 / 68 (31, 37, 0) | 110,651 / 52,461 / 2,866 / 8 | 135/64 |
| octinoct | 2,242 / 1,124 (512, 426, 186) | 33,443 / 16,050 / 673 / 8 | 11/16 |

Split limit 0 and LP failures 0 everywhere.

## 5. What is checked where

| what | where |
|---|---|
| upper bound $s_{\rm up}$ (exact substitution) | `verifier/d44_upper.py`, `certificates/d44_upper.json` |
| $\hat R$ | `certificates/d44_rhat.json` (the local record must carry the same $\hat q$, P7) |
| local record: covering (binary-tree leaves, no holes, volumes add to $\rho_0\cdot2\cdot2$ per face), Lemma Q leaves, far-form leaves | `d44_local.py verify`, `certificates/d44_<case>_local_k10.json` |
| far record outside $\rho_0$ | `d44_far_par.py replay`, `certificates/d44_<case>_s3far_k10.{json,boxes.jsonl.gz}` |
| one verdict for icoinico, dodindod, octinoct | `d44_s3_check.py <case> --k 10` (local replay, far replay, upper bound, same pair, $\hat R$, $\bar s$, $\rho_0$, $\bar s<s_{\rm up}$), output `certificates/d44_<case>_s3_check_k10.json` |
| cubindod | `d44_far.py replay cubindod --name d44_cubindod_k10`, `certificates/d44_cubindod_k10.{json,boxes.jsonl.gz}` |
| tests (not part of acceptance) | `d44_s3_tests.py`: u4 ($\bar s'=s_{\rm up}+10^{-9}$ rejects every local box containing $\rho=0$), u1 (shifted weights are rejected somewhere), u2 (reversed $\rho^2$ sign is rejected somewhere), u5 (local formulas against the far LP at random points); results in [verification.md §9](verification.md#9-additions-in-v100) |
| arithmetic re-check in Lean (`native_decide`) | `lean/PackLean/D44/` (far, local and constants of each case; 27 injected-error targets fail) |

**Not used in the proof.** The KKT polishing of $R^{\ast}$ and of the dual weights (`d44_problems.py`, 60 digits) only chooses $\hat R$; it enters neither acceptance nor the upper bound. The floating-point LPs that choose candidates, weights and far multipliers, the tolerances of `near_active`, and the field `s_up_minus_kkt_sstar` of `d44_upper.json` are not trusted. Nothing here claims that $s^{\ast}$ equals any closed form, nor that the optimal configuration is unique.
