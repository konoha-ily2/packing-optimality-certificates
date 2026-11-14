# Optimality certificates for packing unit Platonic solids into a Platonic container, v0.3.0

This repository contains **computer-assisted proofs (not formally verified)** of the minimal container size for twenty packings of congruent unit-edge Platonic solids into a Platonic container: fifteen cases with two pieces (thirteen exact values and two enclosures), and five values for three to five pieces in a tetrahedron (for icosahedra and for octahedra, $n=3$ and $n=4$ share one value and are counted once; $n=5$ for icosahedra, octahedra and tetrahedra). v0.3.0 adds `octinico_n02`, `tetintet_n02`, `dodincub_n02`, `dodinoct_n02`, `dodintet_n02` and `tetintet_n05` to the fourteen results of v0.2.0, which are unchanged.

> **This is computer-assisted, not a formal proof.**
> The mathematical arguments (reductions, symmetry arguments, the meaning of a box acceptance) were written in prose and checked by reading only. The arithmetic of the certificates was re-checked independently in Lean 4 — with `native_decide` for the box certificates ($n=2$ and `tetintet_n05`) and `decide +kernel` for the $n=3$–$5$ substitutions — but the reasoning that connects the arithmetic to the packing statement has **not** been formalized. There has been **no human review**.

## Claims

"Unit" means edge length 1. The container is a regular solid with edge $s$; the minimal edge is $s^{\ast}$. Placements are rotations and translations; the pieces are closed and may touch (their interiors must be disjoint). Under these conventions the certificates show that $s^{\ast}$ below is the **minimum**: the certificates give lower bounds that match the values of the known configurations exactly (for the two enclosures, the lower and upper bounds differ by less than $10^{-9}$ instead; see below). If touching is forbidden, the same value is the **infimum** (not attained). Since every piece listed is mirror-symmetric, allowing reflections gives the same value.

### Two pieces ($n=2$)

| id | piece → container | $s^{\ast}$ (closed form) | $s^{\ast}$ (decimal) | toolchain | reduction | since |
|---|---|---|---|---|---|---|
| `cubinoct_n02` | cube → octahedron | $1+\sqrt2$ | 2.414213562… | `d16_cover_*` | [symmetric](docs/reduction_symmetric.md) | v0.1.0 |
| `icoincub_n02` | icosahedron → cube | $1+\tfrac{2\sqrt5}{3}$ | 2.490711985… | `d16d_*` ($T=1/2$) | [symmetric](docs/reduction_symmetric.md) | v0.1.0 |
| `dodinico_n02` | dodecahedron → icosahedron | $2+\tfrac{2\sqrt5}{5}$ | 2.894427191… | `d16d_*` | [symmetric](docs/reduction_symmetric.md) | v0.1.0 |
| `icoinoct_n02` | icosahedron → octahedron | $\sqrt{9/2+2\sqrt5}$ | 2.995352392… | `d16d_*` | [symmetric](docs/reduction_symmetric.md) | v0.1.0 |
| `icoindod_n02` | icosahedron → dodecahedron | $\sqrt5-1$ | 1.236067977… | `d16d_*` | [symmetric](docs/reduction_symmetric.md) | v0.2.0 |
| `octindod_n02` | octahedron → dodecahedron | $\tfrac{2\sqrt5+\sqrt{10}-\sqrt2-4}{3}$ | 0.740066684… | `d16e_*` | [symmetric](docs/reduction_symmetric.md) | v0.2.0 |
| `cubinico_n02` | cube → icosahedron | $\tfrac{49\sqrt5-53}{38}$ | 1.488613970… | `d16e_*` via `d30_*` | [symmetric](docs/reduction_symmetric.md#6b-cubinico_n02-the-same-checks-with-a-stored-local-certificate) | v0.2.0 |
| `icointet_n02` | icosahedron → tetrahedron | $2\sqrt2\,(1+2/\sqrt5)$ | 5.358249252… | `d28_*` | [tetrahedron](docs/reduction_tetrahedron.md) | v0.1.0 |
| `cubintet_n02` | cube → tetrahedron | $2+\tfrac{\sqrt6}{2}+\tfrac{2\sqrt3}{3}$ | 4.379445409… | `d28_*` | [tetrahedron](docs/reduction_tetrahedron.md) | v0.1.0 |
| `octintet_n02` | octahedron → tetrahedron | $3$ | 3 | `d31_*` | [octintet](docs/reduction_octintet.md) | v0.2.0 |
| `octinico_n02` | octahedron → icosahedron | $3\sqrt2-\sqrt{10}$ | 1.080363026… | `d16e_*` via `d30_s3_*` | [symmetric](docs/reduction_symmetric.md#6c-octinico_n02-a-curve-of-minimisers-weights-and-paired-lifting-new-in-v030) | v0.3.0 |
| `dodincub_n02` | dodecahedron → cube | $\tfrac{16+334\sqrt2+46\sqrt5+137\sqrt{10}}{267}$ | 3.836848300… | `d16e_*` via `d30_*` (`d30x_problems.py`) | [symmetric](docs/reduction_symmetric.md#6d-dodincub_n02-dodecahedra-in-a-cube-new-in-v030) | v0.3.0 |
| `dodinoct_n02` | dodecahedron → octahedron | $\tfrac{411\sqrt2+157\sqrt{10}}{228}$ | 4.726839327… | `d16e_*` via `d30_*` (`d30x_problems.py`) | [symmetric](docs/reduction_symmetric.md#6e-dodinoct_n02-dodecahedra-in-an-octahedron-new-in-v030) | v0.3.0 |

**Enclosures (not exact values).**

| id | piece → container | lower bound $\bar s$ | upper bound $s_{\rm up}$ | $s^{\ast}$ (decimal) | toolchain | reduction | since |
|---|---|---|---|---|---|---|---|
| `tetintet_n02` | tetrahedron → tetrahedron | $1953564244/10^9$ | a rational number, $\bar s+5.6\times10^{-10}$ | 1.953564244… | `d40_*` | [tetintet](docs/reduction_tetintet.md) | v0.3.0 |
| `dodintet_n02` | dodecahedron → tetrahedron | $2\sqrt2\cdot\frac{14986756529}{5\cdot10^9}$ | $2\sqrt2\,u_{\rm up}$, $u_{\rm up}\in\mathbb Q(\sqrt5)$; $\bar s+3.9\times10^{-10}$ | 8.477789736… | `d45_dodintet_*` (with `d28_common`) | [dodintet](docs/reduction_dodintet.md) | v0.3.0 |

For `tetintet_n02` the claim is $\bar s\le s^{\ast}\le s_{\rm up}$ with both ends rational ($s_{\rm up}$ is in `certificates/d40_upper.json`), which fixes $s^{\ast}$ to 9 decimal places. The recorded configuration has $s_0=1.9535642445615807\ldots$, a root of $576s^5-2112s^4+2528s^3-1296s^2+231s+19$, and numerically $s_{\rm up}-s_0\approx3.3\times10^{-22}$; that $s^{\ast}=s_0$ exactly is **not** claimed. For `dodintet_n02` the claim is $2\sqrt2\,\bar c\le s^{\ast}\le2\sqrt2\,u_{\rm up}$ with $\bar c=14986756529/(5\cdot10^9)$ and $u_{\rm up}\in\mathbb Q(\sqrt5)$ (in `certificates/d45_dodintet_upper.json`); the width is $3.86\times10^{-10}$, which fixes $s^{\ast}$ to 9 decimal places. The recorded value $s_0=8.47778973610387924805\ldots$ has degree 16 ($s_0/(2\sqrt2)$ is a root of an irreducible octic, see the reduction); that $s^{\ast}=s_0$ exactly is **not** claimed. For `octinico_n02` the minimum is attained on an arc of rotations (the piece can spin about a face normal), not at an isolated configuration.

Equivalent forms used in the tools: icointet $s^{\ast 2}=72/5+32\sqrt5/5$; cubintet $s^{\ast 2}=41/6+2\sqrt2+8\sqrt3/3+2\sqrt6$; icoindod $s^{\ast2}=6-2\sqrt5$; octindod $s^{\ast}=-\tfrac43+\tfrac{2\sqrt{3-\sqrt5}+2\sqrt5}{3}$ (since $\sqrt{3-\sqrt5}=(\sqrt{10}-\sqrt2)/2$); octinico $s^{\ast2}=28-12\sqrt5$, $s^{\ast}=2\sqrt2/\varphi^2$ with $\varphi=(1+\sqrt5)/2$; the tools work with $S=s/2$ for dodincub and $S=s/\sqrt2$ for dodinoct, where $S^{\ast}=(411+157\sqrt5)/228$.

### Three to five pieces in a tetrahedron (new in v0.2.0; `tetintet_n05` new in v0.3.0)

| id | piece → container | $s^{\ast}$ (closed form) | $s^{\ast}$ (decimal) | lower bound | upper bound |
|---|---|---|---|---|---|
| `icointet_n03`, `icointet_n04` | icosahedron → tetrahedron | $2\sqrt2\,(1+2/\sqrt5)$ | 5.358249252… | `icointet_n02` (fewer pieces still fit) | exact substitution |
| `octintet_n03`, `octintet_n04` | octahedron → tetrahedron | $3$ | 3 | `octintet_n02` | exact substitution |
| `icointet_n05` | icosahedron → tetrahedron | $\tfrac53\sqrt{3\sqrt5+7}$ | 6.170765289… | inscribed balls + pigeonhole | exact substitution |
| `octintet_n05` | octahedron → tetrahedron | $10/3$ | 3.333333333… | inscribed balls + pigeonhole | exact substitution |
| `tetintet_n05` | tetrahedron → tetrahedron | $2$ | 2 | pigeonhole + **box certificate** (`d37_tet_n05_*`, far and local records; [tetintet_n05](docs/reduction_tetintet_n05.md)) | exact substitution (rational) |

See [docs/plateau.md](docs/plateau.md). The lower bounds for $n=3,4$ inherit everything the $n=2$ proofs rely on. The $n=5$ lower bound $L\ge20r/\sqrt6$ ($r$ the inradius of the piece) holds for every $n\ge5$, but it is shown to be attained only for $n=5$; nothing is claimed for $n\ge6$.

The lower bound of `tetintet_n05` is of a different kind: two of the five centroids lie in one quarter cell of the container (pigeonhole), and a two-piece box certificate (far and local regions with stored records, replay and Lean `native_decide`, as for the $n=2$ cases) shows $s\ge2$ for the problem restricted to that cell, using T2–T4 restricted to it ([reduction_tetintet_n05.md §2](docs/reduction_tetintet_n05.md#2-the-cell-and-t2t4-restricted-to-it)). Its upper bound places four pieces in the corners of the container of edge 2 and one inverted piece in the centre, checked with rationals. Nothing is claimed for six or more tetrahedra.

What is claimed is **the value of the minimal edge**. Uniqueness of the optimal configuration is not claimed, except for one supplementary hand argument for `cubinoct_n02` that is kept separate (see [reduction_symmetric.md](docs/reduction_symmetric.md#supplement-the-optimal-configuration-of-cubinoct_n02-hand-argument)).

External records and closed forms from the literature/community databases were used **only for cross-checking and to propose candidate configurations**; none of them is an input to the proofs. The exact configurations substituted for $n=3,4,5$ are stored in `certificates/` (for `tetintet_n05` the placement is written in `d37_tet_n05_replay_both.py`).

## How each proof is checked

Each $n=2$ case consists of four parts that share the same problem definition and constants.

1. **Stage 0 – exact substitution (upper bound).** The optimal configuration is substituted exactly in the number field ($\mathbb{Q}(\sqrt2)$, $\mathbb{Q}(\sqrt5)$, $\mathbb{Q}(\sqrt2,\sqrt5)$ or $\mathbb{Q}(\sqrt2,\sqrt3)$): every vertex of both pieces lies in the container of edge $s^{\ast}$ and the two pieces are separated by a plane. This gives $s^{\ast}\le$ the stated value directly, without using any reduction. (For `tetintet_n02` the configuration is rational and the container edge is the rational $s_{\rm up}$; for `dodintet_n02` the container edge is $2\sqrt2\,u_{\rm up}$ with $u_{\rm up}\in\mathbb Q(\sqrt5)$.)
2. **Far region – box certificates + replay (lower bound away from the optimum).** After a reduction to a function of the rotation (see the reduction documents), the reduced rotation domain is covered by a binary tree of boxes. Each leaf is either *accepted* (a rational certificate shows that no configuration in the box beats $s^{\ast}$), *discarded* by an exact symmetry rule, *outside* the domain, or *handed to the local lemma*. A separate **replay** re-checks every accepted leaf from the stored multipliers alone (no LP, no floating point) and rebuilds the tree to confirm that it covers the domain.
3. **Local region – local lemma (lower bound near the optimum).** A neighbourhood of the optimal rotation(s) is closed by exact zero-order identities plus positivity checks on boxes in local coordinates (for `tetintet_n02` and `dodintet_n02` the zero-order part is checked to be $\ge0$ instead of $=0$, because the local centres are rational approximations of an irrational optimum; `tetintet_n05` uses the same form of the local lemma). For the v0.1.0 cases and for icoindod/octindod **the local stage stores no box file: re-running the tool is the check.** For `cubinico_n02`, `octintet_n02`, `octinico_n02`, `tetintet_n02`, `dodincub_n02`, `dodinoct_n02`, `dodintet_n02` and `tetintet_n05` the local leaves are stored and re-checked from the record (`--verify` / `replay`). Acceptance is decided by integers only.
4. **Lean re-check of the arithmetic.** The same certificates were exported (values copied by script, not by hand) and re-checked in Lean 4 (`native_decide`). This checks the arithmetic, the tree structure, and the box counts, independently of the Python code. It does **not** check the mathematical meaning of the checks.

The $n=3,4,5$ cases of icosahedra and octahedra are exact substitutions (upper bounds) plus short arguments (lower bounds), with their arithmetic re-checked in Lean by `decide +kernel` (kernel reduction, no `native_decide`). `tetintet_n05` is checked like an $n=2$ case (parts 1–4 above, Lean with `native_decide`), after the pigeonhole step.

Details: [docs/verification.md](docs/verification.md).

### Size of the certificates ($n=2$ and `tetintet_n05`)

| id | far region: boxes evaluated / accepted / discarded (symmetry) / to local | outside domain | split limit hit | local region |
|---|---|---|---|---|
| cubinoct | 1,499 / 623 (327 + 296, two $\tau$ roots) / – / 1 | 254 (120 + 134) | 0 | 4 faces, 1 box each |
| icoincub ($T=1/2$) | 2,602 / 1,081 / 218 / 8 | – | 0 | 6 faces × 7 boxes (24 accepted leaves), 8 candidates |
| dodinico | 13,356 / 5,558 / 1,118 / 8 | – | 0 | 14 boxes (10 accepted leaves), 40 candidates |
| icoinoct | 1,128 / 426 / 136 / 8 | – | 0 | 24 boxes (15 accepted leaves), 54 candidates |
| icoindod | 2,204 / 892 / 208 / 8 | – | 0 | 14 boxes (10 accepted leaves), 8 candidates |
| octindod | 4,600 / 1,826 / 472 / 8 | – | 0 | 40 boxes (23 accepted leaves), 8 candidates |
| cubinico | 9,970 / 4,194 / 789 / 8 | – | 0 | **stored**: 142 boxes evaluated, 74 accepted leaves (all single candidates), 8 candidates |
| icointet | 150,737 evaluated; $R$-leaves: 36,574 accepted / 20,746 discarded / 32 to local; $n$-boxes 324 ok (4 local) + 44 out | – | 0 | 1 local box, 81 candidates, 10 faces, 2,111 accepted (4,212 evaluated) |
| cubintet | 298,739 evaluated; $R$-leaves: 85,522 accepted / 49,803 discarded / 33 to local; $n$-boxes 316 ok (2 local) + 44 out | – | 0 | 2 local boxes (at $I$ and $R_2$), 32 candidates each, 9 + 9 faces, 2,878 accepted |
| octintet | 351,533 evaluated; $R$-leaves: 49,568 accepted / 10,325 discarded / 824 to local; $n$-boxes 319 ok + 17 out | – | 0 | **stored**: band $J$ 10,716 evaluated / 5,363 accepted (54 candidates); tube $C$ 4,764 / 2,388 (81 candidates) |
| octinico | 1,804 / 676 / 206 / 44 (to the tube) | – | 0 | **stored**: tube, 4 sides × 7 boxes evaluated, 16 accepted (10 single, 6 weighted with a paired lift), 36 candidates |
| tetintet | 3,779,147 evaluated; $R$-leaves: 154,232 accepted (of which 49,364 by the constraint $s_1>\bar s$) / 72,810 discarded / 223 to local; $n$-boxes 236 ok + 18 out | – | 0 | **stored**: 7 centres (3 tubes, 4 points), 57,839 evaluated / 28,946 accepted leaves |
| dodincub | 7,596 / 3,347 / 449 / 8 | – | 0 | **stored**: 40 boxes evaluated, 23 accepted leaves (all single candidates), 8 candidates |
| dodinoct | 31,958 / 15,250 / 727 / 8 ($\rho_0=1/32$) | – | 0 | **stored**: 246 boxes evaluated, 126 accepted leaves (all single candidates), 4 candidates |
| dodintet | 8,345,667 evaluated; $R$-leaves: 2,717,927 accepted / 1,314,967 discarded / 18,816 to local; $n$-boxes 5,477 pairs (types I 5,446, II 5, III 26) + 114 outside $D_n$ (not recorded) | – | 0 | **stored**: 2 tubes ($T_A$ 50 candidates, $T_B$ 20), 7,328 evaluated / 3,672 accepted leaves (2,670 + 1,002) |
| tetintet_n05 | 3,117,761 evaluated; $R$-leaves: 777,383 accepted (of which 216,775 by the constraint $\check S>0$) / 286,744 discarded / 987 to local; $n$-boxes 594 ok + 31 out | – | 0 | **stored**: 5 centres (2 tubes, 3 points), $r_0=1/16$, 13,430 evaluated / 6,734 accepted leaves |

All replays passed with 0 failures. `icoincub` uses `d16d_*` with $T=1/2$; with the default $T$ the box counts differ (2,744 boxes).

### Lean re-check (arithmetic only)

| id | Lean (`native_decide`) | wall time | injected-error certificates |
|---|---|---|---|
| cubinoct | 4 modules | 38 s | lam, drop, ident: all rejected |
| icoincub | 4 modules | 56 s | lam, drop, ident, disc: all rejected |
| dodinico | 9 modules | 271 s | lam, drop, ident, disc: all rejected |
| icoinoct | 4 modules | 37 s | lam, drop, ident, disc, sum, tsmall: all rejected |
| icoindod | 5 modules | 112 s | lam, drop, ident, disc: all rejected |
| octindod | 6 modules | 162 s | lam, drop, ident, disc, sum, tsmall: all rejected |
| cubinico | 8 modules | about 110 s | lam, sum, drop, disc, ident, tsmall, locCand, locDrop, rhoBig: all rejected (rhoBig only by the local module, see verification.md) |
| icointet | 28 modules | 243 s | 7 injected certificates over the two cases (kpair, kval ×2, drop, dropn, ident ×2): all rejected |
| cubintet | 72 modules | 725 s | (see icointet row) |
| octinico | `PackLean/D30S3/` (Data, Tok000, Far, Local, Consts) | far 34 s, local 23 s, constants 12 s (data loading about 3 min) | 16 kinds: far (lam, sum, drop, disc), ident, tsmall, local (candidate, dropped leaf), lifting and weights (record made with the lift cost removed, lifts set to 0, lifts halved, weights halved, weighted candidate replaced), tube constants (larger $\rho_0$, wider tube, shifted tube centre): all rejected (widening the tube only by the local module, see verification.md) |
| tetintet | `PackLean/D40/` (66 far modules, 7 local modules) | far about 1,200 s, local about 330 s, constants and upper bound about 10 s | 14 kinds: far (candidate, discard rotation, dropped leaf, out, L centre, negative $k_N$ next to $N_1$), sign of $\mu$ reversed, local (candidate, type, dropped leaf), $\bar s$ raised, $h$-range widened, upper-bound configuration moved, $r_0$ widened: all rejected (widening $r_0$ only by the local modules) |
| octintet | 37 modules | about 270 s | 11 kinds (far: accepted/discarded/dropped/out/to-local leaves; local: candidates, sign of $E_c$, dropped leaf; region constants): all rejected (the `uJ` variant only by the far module, see verification.md) |
| dodincub | `PackLean/D30X/Cub/` (Data, Tok000–002, Far, Local, Consts) | far 62 s, local 3 s, constants 4 s | lam, sum, drop, disc, ident, tsmall, locCand, locDrop, rhoBig: all rejected (rhoBig only by the local module) |
| dodinoct | `PackLean/D30X/Oct/` (Data, Tok000–010, Far, Local, Consts) | far 129 s, local 3 s, constants 2 s | the same 9 kinds: all rejected (rhoBig only by the local module) |
| dodintet | `PackLean/D45DT/` (51 far modules, Far, Local, Consts) | far about 4,500 s one module at a time (about 1,460 s with 3 in parallel), local 22 s, constants and upper bound 8 s | 13 kinds: far (top vertex, discard rotation, dropped leaf, positive offset with L leaves, negative pair sum of type III, pair box claimed outside), local (candidate, dropped leaf), $\bar c+10^{-6}$, $\hat k_3+10^{-9}$, $r_0$ widened, upper-bound translation moved, a rotation replaced by a reflection: all rejected (widening $r_0$ only by the local module) |
| tetintet_n05 | `PackLean/D37N05/` (98 far modules, 4 local modules) | far about 4,600 s, local about 75 s, constants and upper bound about 5 s | 16 kinds: far (candidate, discard rotation, dropped leaf, out, L centre/rotation, negative $k_N$ next to $N_1$, $\mu$ below $D_j$, constant 1 on a wrong face), sign of $\mu$ reversed, local (candidate, type, dropped leaf), $s_0$ raised, $r_0$ widened, $a_{\max}$ widened, upper-bound placement moved: all rejected (widening $r_0$ only by the local and constants modules) |

| $n=3$–$5$, icosahedra and octahedra (`decide +kernel`) | modules | wall time | injected-error certificates |
|---|---|---|---|
| upper bounds $n=2,3,4,5$, both solids | Core, Data, Ico, Oct, N5Data, N5 | under 1 min | 18: all rejected |
| lower bound $n\ge5$ | N5EndCore, N5End | under 1 min | 6: all rejected |

`#print axioms` for every top-level theorem lists only `propext`, `Classical.choice`, `Quot.sound` and, for the `native_decide` theorems, the auxiliary axioms `…_native.native_decide.ax_1_1`. No `sorryAx`. Using `native_decide` means trusting the Lean compiler (and `Lean.ofReduceBool`), one level below the kernel; the $n=3$–$5$ checks of icosahedra and octahedra do not use it. Lean toolchain: `leanprover/lean4:v4.36.0-rc2`, no Mathlib.

## What has not been checked

- **No human review and no formal proof.** The arguments, code, tests and reviews were all written by Claude (an AI model by Anthropic). Each case's arguments were re-derived once by hand by a different Claude model (Fable) acting as reviewer (twice for cubinico; for `tetintet_n05` the restricted reduction and the local and far argument were read in two separate reviews). No human has reviewed any of it.
- `octinico_n02` relies on Lemma W (ii), the paired lifting ([reduction_symmetric.md §6c](docs/reduction_symmetric.md#6c-octinico_n02-a-curve-of-minimisers-weights-and-paired-lifting-new-in-v030)); `tetintet_n02` is the first case that uses the restriction $s_1(R)\le\bar s$ of T4 ([reduction_tetintet.md §2](docs/reduction_tetintet.md#2-t4-with-the-restriction-s_1rlebar-s)). Both arguments were read by one reviewer only.
- `dodincub_n02` and `dodinoct_n02` use the tools of cubinico unchanged; only the problem definition (`d30x_problems.py`) is new. Their arguments were read by one reviewer (Fable, review FD_d30x); the points raised were addressed before the records were fixed (for `dodinoct_n02` the claim uses $\rho_0=1/32$, where single candidates suffice).
- `tetintet_n05` uses a pigeonhole step (two of the five centroids in one quarter cell of the container) and T2–T4 restricted to that cell ([reduction_tetintet_n05.md §2](docs/reduction_tetintet_n05.md#2-the-cell-and-t2t4-restricted-to-it)); the argument was read by one reviewer model only.
- For `tetintet_n02` only the rational enclosure is claimed; that $s^{\ast}$ equals the quintic root $s_0$ is not shown.
- For `dodintet_n02` only the enclosure is claimed; the equality $s^{\ast}=s_0$ (degree 16) is not shown. Its argument was read by one reviewer model only (no human review).
- The reductions and the meaning of a box acceptance are prose arguments, not formalized. Lean checks arithmetic only (see the "not checked by Lean" list in [verification.md](docs/verification.md#what-lean-does-not-check)).
- Trusted base of the Python checkers: python-flint (`fmpz_mpoly.compose`, `isqrt`), sympy (expansion, simplification, `cancel`, `Poly`), Python `fractions.Fraction`.
- Items the reviewers explicitly did not look at are listed per case in [review_log.md](docs/review_log.md).
- The status of these cases elsewhere (whether others have proofs) was not examined.
- Test m2 with the piece scaled by 0.999 was not run for `cubinoct` (the local checker has no scale parameter).

## Repository layout

- `docs/reduction_symmetric.md` – reduction for centrally symmetric container and piece (cubinoct, icoincub, dodinico, icoinoct, icoindod, octindod, cubinico, octinico, dodincub, dodinoct; Lemma W and the tube in §6c, dodincub and dodinoct in §6d–§6e)
- `docs/reduction_tetrahedron.md` – reduction for the tetrahedral container (icointet, cubintet; T1–T4 are also used by octintet, tetintet and dodintet, and in a restricted form by tetintet_n05)
- `docs/reduction_tetintet.md` – tetrahedra in a tetrahedron, $n=2$ (T4 with the constraint $s_1(R)\le\bar s$, leaf types F/M/S, local lemma with a nonnegative zero-order part, the rational enclosure)
- `docs/reduction_octintet.md` – octahedra in a tetrahedron, $n=2$ (the function $\Gamma$, the local region around two curves)
- `docs/reduction_dodintet.md` – dodintet (route Y of tetintet in $\mathbb Q(\sqrt5)$: two tubes, linear $\kappa$, pair types I–III)
- `docs/reduction_tetintet_n05.md` – five tetrahedra in a tetrahedron (the cell, T2–T4 restricted to it, faces and multipliers of the leaves, the exact value $s^{\ast}=2$)
- `docs/plateau.md` – three to five pieces in a tetrahedron (icosahedra and octahedra)
- `docs/verification.md` – how the box lower bounds, the local lemmas and the Lean re-check work; tests; reproduction commands (§7)
- `docs/review_log.md` – summary of the reviews and the fixes made
- `certificates/` – the box records, local records and summaries, the exact configurations for $n=3$–$5$, and `SHA256SUMS`; see [certificates/README.md](certificates/README.md)
- `verifier/` – the Python checkers:
  - `d16_cover_*` – cubinoct
  - `d16d_*` – icoincub, dodinico, icoinoct, icoindod (and stage 0 of cubinoct)
  - `d16e_*` – octindod (two square roots); `d30_problems.py`, `d30_far.py`, `d30_local.py`, `d30_claim.py`, `d30_tests*.py` – cubinico
  - `d28_*` – icointet, cubintet; `d31_*` (with `d28_oct_step0.py`) – octintet
  - `d30_s3_*` (with `d16e_*`, `d30_local.py`, `d30_far.py`) – octinico
  - `d40_*` – tetintet (`d40_psi.py` is a floating-point estimate of the slack used only to choose the per-box constants $k_N$; replay does not use it)
  - `d30x_problems.py`, `d30x_testsX.py` – dodincub, dodinoct (with `d16e_*`, `d30_*`)
  - `d45_dodintet_*` (with `d28_common.py`, `d16d_common.py`) – dodintet
  - `d37_tet_n05_*` – tetintet_n05 (records with $R_0=1/16$; run with `D37_R0=1/16`)
  - `d28_plateau_n34.py`, `d31_plateau_n34.py`, `plateau_n05_upper.py`, `plateau_end_check.py` – $n=3$–$5$
  - `d16b_common.py`, `d11_step1_cubinoct_n02.py` – independent floating-point formulations used only by test X
- `lean/` – the Lean 4 re-check of the arithmetic (no Mathlib): `PackLean/D16/`, `PackLean/D28/`, `PackLean/D30/`, `PackLean/D31/`, `PackLean/D30S3/` (octinico), `PackLean/D40/` (tetintet), `PackLean/D30X/` (dodincub, dodinoct), `PackLean/D45DT/` (dodintet), `PackLean/D37N05/` (tetintet_n05), `PackLean/Plateau/`, injected-error certificates in `*/Test/`, exporters in `tools/`, `build.py`; see [lean/README.md](lean/README.md)
- `tests/` – `replay_all.py`, `run_python_tests.py` and how to run the injected-error tests; see [tests/README.md](tests/README.md)
- `requirements.txt` – Python packages with the versions used

Quick check (Python 3.10 or later):

```bash
pip install -r requirements.txt
python -X utf8 tests/replay_all.py
```

## Authorship and review

The mathematical arguments, the code, the tests, and the reviews were produced by Claude (Anthropic's AI model), in sessions directed by the repository owner. There has been **no human review**.

## License

MIT (see [LICENSE](LICENSE)).

## Citation

Cite as: Hirotaka Nakano, *packing-optimality-certificates*, Zenodo, DOI [10.5281/zenodo.24191316](https://doi.org/10.5281/zenodo.24191316) (concept DOI, all versions); v0.1.0: [10.5281/zenodo.24191317](https://doi.org/10.5281/zenodo.24191317); v0.2.0: [10.5281/zenodo.24195467](https://doi.org/10.5281/zenodo.24195467); v0.3.0: [10.5281/zenodo.24223156](https://doi.org/10.5281/zenodo.24223156).

See [CITATION.cff](CITATION.cff). Please cite these as computer-assisted results, not as a formal proof.
