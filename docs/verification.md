# Verification

This document describes how the lower bounds are certified, how the far and local regions fit together, what the tests do, and what the Lean re-check covers. The reductions themselves are in [reduction_symmetric.md](reduction_symmetric.md), [reduction_tetrahedron.md](reduction_tetrahedron.md), [reduction_octintet.md](reduction_octintet.md), [reduction_tetintet.md](reduction_tetintet.md) and [reduction_dodintet.md](reduction_dodintet.md); the cases with three to five icosahedra or octahedra are in [plateau.md](plateau.md), and five tetrahedra in [reduction_tetintet_n05.md](reduction_tetintet_n05.md).

## 1. Structure of one proof

Each case is the combination of three Python checks and one Lean re-check:

| part | what it shows | artefact |
|---|---|---|
| stage 0 | exact substitution of the optimal configuration (upper bound); for `d16d_*` also $\varphi(I)=S^{\ast}$, primal and dual | re-run |
| far region | the reduced inequality on the whole rotation domain minus the local boxes | box record + **replay** |
| local region | the inequality on the local boxes, equality only at the minimiser(s) | **re-run** (no box record); for cubinico, octintet and the v0.3.0 cases a stored leaf record, re-checked by `--verify` / `replay` |
| Lean | the arithmetic of the far and local certificates, the tree structure and the counts | Lean project |

The three Python parts share the same problem definition, the same constants (e.g. $\rho_0=1/16$ and the local box $L$ for `cubinoct`, which is defined in one place in `d16_cover_common.py`), and the same coordinates.

## 2. Box lower bounds (far region)

### Acceptance uses integers only

Every acceptance decision is an integer computation:

- Box coordinates are dyadic rationals (for cubinoct, integer multiples of $2^{-44}$); polynomials are scaled to integer coefficients, homogenised, and shifted to the box centre and half-width (python-flint `fmpz_mpoly.compose`).
- On the unit box $[-1,1]^k$ the lower bound of a polynomial is: constant term as is; a monomial with only even exponents uses its range $[0,1]$; every other monomial contributes $-\lvert\text{coefficient}\rvert$. If a constant term were misidentified, the bound would only become weaker.
- Irrational constants ($\sqrt2$, $\sqrt3$, $\sqrt5$, and $\sqrt{10}$ for octindod) are enclosed between integers divided by $2^{120}$ (checked with `isqrt` and strict inequalities); for each irrational component the lower or upper end is chosen according to the sign of its coefficient. Signs of field elements are decided exactly (via $a^2-pb^2$, recursively for two square roots). For octintet all data are rational and no enclosure is needed.
- Multipliers are rationals; $\lambda\ge0$, $\sum\lambda=1$ (multipliers have denominator $2^{24}$), $\mu\ge0$, $\varepsilon=\pm1$, and the translation bound ($T_1$ or $T$) are checked by `need` on every call, including replay. `need` raises an exception when the condition is false (unlike `assert`, it is not removed by `python -O`).
- $\bar S$ and $T$ / $T_1$ are taken from the code's constants at replay time, not from the record.

**Floating point** is used only to propose LP multipliers, signs $\varepsilon$, vertex choices, $\kappa$ constants, discard pairs, and the split direction. It never enters an acceptance decision.

### Meaning of an accepted box

- Symmetric cases: an accepted box contains no feasible solution with $S<\bar S$, so $\varphi\ge\bar S>S^{\ast}$ on the box (strict). If a box sticks out of the domain, the statement is only stronger.
- Tetrahedral cases: an accepted pair of boxes satisfies $F-\kappa\ge0$ on the whole box (octintet: $\Gamma\ge0$, see [reduction_octintet.md §5](reduction_octintet.md#5-far-region)).

### Discarded, outside, to-local

- *Discarded* (symmetry): the trace inequality of the discard rule holds strictly on the whole box (checked as a lower bound $>0$).
- *Outside the domain*: every point of the box violates the domain inequalities (cubinoct: lower $b$ > upper $\gamma$, or $b_{\rm lo}^2+(\gamma_{\rm lo}+1)^2>2$, or $\tau_{\rm lo}>1$; d28: $n$-box outside $D_n$, checked as $y>x$ etc.).
- *To local*: the box lies entirely in the local box (cubinoct: $L=[0,1/16]^2\times[3/8,7/16]$; `d16d_*`: chart 0 and $\lVert p\rVert_\infty\le\rho_0$; d28: the three conditions in [reduction_tetrahedron.md §9](reduction_tetrahedron.md#9-local-lemma)), compared exactly (in the field when the centre is irrational).

### Replay

Replay reads only the box record. It (i) re-decides every accepted, discarded and to-local leaf with the stored multipliers/pairs (no LP, no floating point), (ii) rebuilds the binary tree from the roots with the same split rule and checks that every branch ends in a recorded leaf and that there are no extra leaves, and (iii) checks that no leaf hit the split limit. Replay stops with an error on any failure (after the review fixes; before them, cubinoct's replay only printed the counts). For cubinoct, `d16_cover_check_roots.py` additionally checks that the two $\tau$-trees join to $[0,1]$, $\tau_{\max}=1$, the local box equals the code constant, the split-limit count and LP-failure count are 0, and the four local faces.

## 3. Local region: re-running is the check

The local stage stores no box record. Its result ("closed": every face closed, split limit 0) is produced by re-running the tool, which redoes the exact zero-order identities and the box bounds. Acceptance is integer-only; floating point is used only to order the candidates tried on each box.

The local polynomials are built with sympy (expansion, simplification, `cancel`, `Poly`); the far polynomials use python-flint integer polynomials.

| | zero-order identity | faces | boxes |
|---|---|---|---|
| cubinoct | $F_c(R^{\ast})=0+0\sqrt2$ for $c=\pm1$ | 4 | 1 per face |
| icoincub | 8 candidates, all $0+0\sqrt5$ | 6 | 7 per face (24 accepted leaves) |
| dodinico | 40 candidates, all $0+0\sqrt5$ | 6 | 14 in total (10 accepted leaves) |
| icoinoct | 54 candidates, all $0$ | 6 | 24 in total (15 accepted leaves) |
| icointet | 81 candidates, all $0+0\sqrt5$ | 10 | 4,212 evaluated, 2,111 accepted |
| cubintet | 32 candidates per local box, all $0$ | 9 + 9 | 2,878 accepted |
| icoindod | 8 candidates, all $0+0\sqrt5$ | 6 | 14 in total (10 accepted leaves) |
| octindod | 8 candidates, all components $0$ in $\mathbb{Q}(\sqrt2,\sqrt5)$ | 6 | 40 in total (23 accepted leaves) |
| cubinico (stored) | 8 candidates, all components $0$ | 6 | 142 evaluated, 74 accepted leaves, all single |
| octintet $J$ (stored) | 54 candidates: $T_c=k'u(e_0+e_1u)$ verified | 5 faces × 2 sides of $u=0$ | 10,716 evaluated, 5,363 accepted |
| octintet $C$ (stored) | 81 candidates: $T_c=0$ verified | 6 faces × 2 sides | 4,764 evaluated, 2,388 accepted |
| octinico (stored) | 36 candidates: $F(\tau n)\equiv0$ as a polynomial in $\tau$, all components | 4 sides of the tube | 28 evaluated, 16 accepted (10 single, 6 weighted with one paired lift) |
| tetintet (stored) | zero-order part $e_c\ge0$ (not $=0$), checked at both ends of each leaf's $h$-range | 7 per tube (3 tubes), 8 per point (4 points) | 57,839 evaluated, 28,946 accepted |
| dodincub (stored) | 8 candidates, all components $0$ | 6 | 40 evaluated, 23 accepted leaves, all single |
| dodinoct (stored, $\rho_0=1/32$) | 4 candidates, all $0+0\sqrt5$ | 6 | 246 evaluated, 126 accepted leaves, all single |
| dodintet (stored) | zero-order part $e_c\ge0$ (not $=0$), checked at both ends of each leaf's $u$-range, exact signs in $\mathbb Q(\sqrt5)$ | 8 per tube (2 tubes) | 7,328 evaluated, 3,672 accepted |
| tetintet_n05 (stored) | zero-order part $e_c\ge0$ (identically 0 on the arc), base range $a\in[0,7/8]$ for the tubes; the local faces $j=0$ (side A), $3$ (side B) are asserted by `region_check` | 7 per tube (2 tubes), 8 per point (3 points) | 13,430 evaluated, 6,734 accepted |

**Stored local records.** For cubinico the local leaves are stored in `d30_cubinico_local_r16_nolp.json` (`cert`, per face); `d30_local.py --verify` re-decides each leaf and checks that the leaves tile face × $[0,\rho_0]$ as the leaves of a binary tree (volume sum; a branch that leads to no leaf is rejected at once), and `d30_claim.py` ties the local and far records together (same problem and constants, closed, the far “to local” boxes have total volume $(2\rho_0)^3$). For octintet the leaves are in `d31_local_{J,C}.leaves.jsonl.gz`; `d31_local.py replay J|C` re-decides every leaf and rebuilds the trees (a branch deeper than the deepest recorded leaf is rejected). Both kinds of record are also exported to Lean as they are (the search is not re-run).

**v0.3.0.** For octinico the local record `d30_s3_octinico_local.json` stores, per side of the tube, the leaves with either a single candidate or a weighted combination (`alpha`, `w`, `c`: one vertex per active face, weights, lifts); `d30_s3_local.py verify` re-decides every leaf with `check_single` / `check_mix`, requires the stored candidate table and tube constants to equal the current ones, and checks that the leaves tile each side × $[0,\rho_0]$. `d30_s3_claim.py` combines local verify, far coverage check, far replay and the equality of premises in both records. For tetintet the leaves are in `d40_local.leaves.jsonl.gz` (centre, base interval, face, box, candidate, type, $\mu$); `d40_local.py replay` re-builds every candidate polynomial and re-decides every leaf, and rebuilds the trees from the roots. The claim of tetintet needs local replay, far replay and the upper-bound check together; `d40_tests.py --only chain` runs the three. For dodincub and dodinoct the records have the same form as for cubinico (leaves in `cert`, all single candidates) and are checked by `d30_local.py --verify` and `d30_claim.py`, run through `d30x_problems.py`, which installs the two problems behind `d30_problems` (without it, `d16e_common.load` stops with an error for these names). For dodintet the leaves are in `d45_dodintet_local_TA.leaves.jsonl.gz` and `d45_dodintet_local_TB.leaves.jsonl.gz` (tube, box in $(u,r,\hat\zeta)$, candidate); `d45_dodintet_local.py replay --name d45_dodintet_local_TA` (and `_TB`) rebuilds every candidate polynomial and re-decides every leaf, and rebuilds the trees from the 8 root faces. The far record is in two files, the main part and `d45_dodintet_far.part1.boxes.jsonl.gz` (two boxes redone after a fix of the pruning heuristic); `d45_dodintet_far.py replay` reads both. The claim needs local replay (both tubes), far replay and the upper-bound check together; `d45_dodintet_tests.py --only chain` runs the four. For tetintet_n05 the leaves are in `d37_tet_n05_local_r16.leaves.jsonl.gz`; `d37_tet_n05_replay_both.py --r0 1/16` checks that the premises of the local and far records agree with each other and with the code, checks the upper bound, and replays the local record (including `region_check`: the $n$-range of each centre lies in $T$ and the weights are $\ge0$ at its corners) and the far record in one run.

**How the far and local regions connect.** The far region's "to local" leaves are checked by replay to lie inside the local region; the local region is proved on a set that contains all of them, with the same constants and coordinates. Together: inequality everywhere on the reduced domain, equality only at the minimiser(s) (for octintet: inside $L$ only on the two curves $Z$; $L=J\cup C$ with the constants of `d31_common.py`, and test L1 checks that the centres of all 824 far "to local" leaves lie in accepted local leaves). With the symmetry reduction this covers all of $SO(3)$ (and all directions $n$ for the tetrahedral cases).

## 4. Trusted base

The Python checkers rely on:

- python-flint: `fmpz_mpoly.compose` (polynomial shift), `isqrt` (also the local stage of octintet);
- sympy: expansion, simplification, `cancel`, `Poly` (local stage);
- Python `fractions.Fraction`.

An error in these would invalidate the corresponding check. The tests P, C and X partially exercise them; the Lean re-check (§6) is independent of all three.

Versions used: Python 3.10.5, python-flint 0.9.0, sympy 1.14.0, numpy 2.2.6, scipy 1.15.3 (numpy and scipy only propose candidates); see `requirements.txt`.

## 5. Tests

Each toolchain has a test script (300 random cases each). The tests are written by the same author as the checkers.

| test | what it does |
|---|---|
| U | upper bound: the optimal configuration is substituted again (vertices in the container, separating plane) |
| S | symmetry reduction: random rational rotations (and directions) are mapped to the reduced domain; the objective agrees exactly |
| V | coverage: random points land in an accepted or local leaf (never in a discarded one) |
| C | counterexample search: tiny boxes are asked to certify a value $2^{-20}$ above the true value; none may be accepted |
| P | points inside accepted boxes: exact objective $\ge\bar S$ (or $F-\kappa\ge0$) |
| W | local: at points of the local box, the local lower bound is valid and positive away from the minimiser |
| X | an independent re-formulation of the LP agrees with the exact objective |
| m1 | shift $S^{\ast}$ (or $c^{\ast}$) by $10^{-3}$: the local zero-order identity fails |
| m2 | scale the piece by 1.001: the optimal configuration no longer fits; by 0.999: the local identity fails |
| m3 | corrupt multipliers ($\lambda<0$, $\sum\lambda\ne1$, $\mu<0$; d28: $k$-sums) : rejected by the precondition checks / replay |
| m4 | too small translation bound: rejected by the check line (and, with the check line removed, the box is falsely accepted — so the line is needed) |
| m5 | reduced domain or symmetry set: m5a halves the domain (cubinoct, d28: detected) or the pair set (d16d: only fails to close, never accepts falsely); m5b conjugates by a non-symmetry (detected 50/50) |
| m6 (d28) | drop one vertex from the piece table: rejected by the piece check |

**v0.2.0 cases.**

- icoindod (`d16d_tests.py icoindod`) and octindod (`d16e_tests.py octindod`): the same tests U, S, V, C, P, W, X and m1–m5 as the other `d16d_*` cases; all as expected.
- cubinico (`d30_tests_full.py cubinico 300`): U, S, V, C, P, X and m1–m5 as for `d16e_*`; W generalised to stored certificates (1,990 points, including all corners and face centres of the accepted boxes and small $\rho$): 0 violations; m5a: halving the pairs still closes (sound side); m5b detected 50/50. Corrupted records (`d30_tests.py corrupt`): a dropped or duplicated local leaf and a dropped far line raise an exception; a wrong candidate is rejected.
- octintet (`d31_tests.py`): U (48 inequalities, 18 contacts), S (300 piece-symmetry checks, 60 $T_d$ checks), V (300/300), P, C (0 of 300 accepted), W′ (600 local points), X (independent 8-variable LP), K0 (extension of $\kappa$, 200 points), F0 (symbolic identity $F-\tfrac{\sqrt2}4y\equiv\tfrac{\sqrt2}2\Gamma$), L1 (seam), P2 (600 local points against the matrix formula); injected: n1 (flip the sign of $E_c$: 298 of 300 points violate), n2a/n2b (shrink $U_J,U_1$ or $K_J$: do not close, with exact witnesses where $\Gamma=0$), n2c (widen $U_J$ to $3/8$: does not close, witness with all $\Lambda_c<0$), n3/m1 ($c^{\ast}\mp$): identities fail, m5 (corrupt records: detected), m6′ (a table rotation with $\det=-1$: caught by the determinant check, not by comparing $\Gamma$), m7 (constants differ from the record: rejected). Shrinking $U_J$ to $5/32$ (n2) still closes: narrowing a local region is the easy direction, so that variant is not an error test.
- $n=3$–$5$: see [plateau.md §6](plateau.md#6-injected-errors).

**v0.3.0 cases.**

- octinico (`d30_s3_tests.py 300`): U ($\varphi(R^{\ast})=S^{\ast}=\sqrt2$ exactly), FAM (50 rational points of the curve inside the arc: $\varphi=S^{\ast}$ exactly; 4 points outside: $\varphi>S^{\ast}$), TUBE (220 points in the 44 "to local" boxes all inside the tube; of 1,748 points outside the tube none lands in a "to local" box; replay with a different tube size fails on the record's tube constants), S and V (300/300), C (0 of 300 accepted), P (0 violations), W (956 points of the 16 boxes, including corners, face centres and small $\rho$, evaluated in tube coordinates with the lift multiplied by the tube's $\rho$: 0 violations, minimum $(B-S^{\ast})/\rho=0.150$), X, m1 (shifted $S^{\ast}$: the zero-order identity fails), m2, m3/m4, m5a (sound side), m5b (50/50). Without lifting (`--no-lift`) the local stage does not close; with the lift cost removed (`--fault nolift`) it claims to close, and test W finds $F\le0$ at 197 of 387 points (`d30_s3_fault.py`).
- tetintet (`d40_tests.py`): W (random points of the 7 local regions with $s_1\le\bar s$: no negative value), t1 (sign of $\mu$ reversed: the bound breaks at 3,318 of 3,318 points), t2 (the restriction $s_1\le\bar s$ is needed: 4,330 points with $\tilde G-\kappa<0$, all with $s_1>\bar s$; discarding at $\bar s-1/100$ instead would hide 48 violations), t3/t4 (removing the mirror tube or one point centre makes a far box fail to close), t5 ($s_0+10^{-6}$: the zero-order sum is negative), t6 ($k_N=-1/1024$ on a box meeting $N_1$: replay fails), L1 (all 223 far "to local" centres lie in local leaves), R3 (local polynomials = direct formula = far formula at 6,304 exact comparisons), chain (local replay, far replay and the upper bound: pass).
- dodincub and dodinoct (`d30_tests_full.py <case> 300 d30x_<case>_local_r16.json`, run through `d30x_problems.py`; for dodinoct on the record with $\rho_0=1/16$ and weights, which is another certificate of the same statement): U, S, V (300/300), C (0 of 300 accepted), P (0 violations), W (1,135 and 1,903 points, 0 violations), X, m1–m4, m5a (sound side), m5b (50/50), all as for cubinico. Controls of the cubinico type (`d30x_testsX.py`, which installs the problems on import): parent (a leaf's certificate applied to its parent box: accepted for 0 of 23 dodincub leaves and 0 of 126 leaves of the dodinoct claim record) and corrupted records (a dropped or duplicated local leaf and a dropped far line raise an exception, a wrong candidate is rejected, a far multiplier taken from another box makes replay fail). The full test set `d30_tests_full.py` was not run on the dodinoct claim record ($\rho_0=1/32$).
- dodintet (`d45_dodintet_tests.py`): W (random points: far minimum $+1.9\times10^{-6}$, tubes $+6.5\times10^{-3}$), W2 (an independently written $F$: difference $3.6\times10^{-15}$), t5 ($\bar c+10^{-6}$: the 6 leaves at the centre of each tube fail), t6 (negative pair sum, offset $+1/2$: replay fails), t4 ($k_L=0$ in the 26 type-III boxes: all 26 fail), L1 (400 sampled far "to local" leaves lie in the tubes), R3 (far formula = direct candidate formula, $1.8\times10^{-15}$), chain (local replay ×2, far replay, upper bound: pass). Not done: removing a tube from the far region (analogue of t3 of tetintet).
- tetintet_n05 (`d37_tet_n05_tests.py` for the local region and `d37_tet_n05_far_tests.py`, with `D37_R0=1/16`): local W (random points of the five local regions: no negative value), R3 (no mismatch), tb ($\beta$ outside its window) and ts ($s_0+1/1000$) do not close within the time limit, as they should; far W (3,000 points, no negative value) and Bd (400 points), L1 (all 987 far "to local" leaves lie in local leaves), t6 ($k_N$ shifted: replay fails), X (the far candidate formulas against an independently written exact $\tilde F$ and $\check S$ at rational points including the corners of $T$, the fixed point of $\sigma$ and the ends of the tubes: 192,320 equalities and 384,640 inequalities, 0 violations), Xb (the integer scaling of the box bound: 3,159 comparisons, 0 violations), P (the recorded $\kappa_N$ at the corners of $T$ and on $a+b=1$: 3,696 comparisons, 0 violations).

All results were as expected. Exceptions recorded: for cubinoct, m2 with factor 0.999 was not run (the local checker has no scale parameter); for d28, m4 does not apply ($s_1$ is not used). For icoincub, the tests were run with `d16d_*` (the version used here), with $T=1/2$.

**Injected-error certificates in Lean.** Certificates with a deliberate error were exported and given to Lean; all were rejected by `native_decide` evaluating the statement to false (none failed for syntactic reasons). The errors were chosen so that Python's own check also rejects them, which distinguishes "Lean missed it" from "the error had no effect".

- D16 group (17): lam (move 1/4 from the largest $\lambda$ to another face, sum unchanged; 4 cases), drop (remove one accepted leaf; 4), ident (shift $S^{\ast}$ in the local stage by 1/1000; 4), disc (replace a discard pair; 3 `d16d` cases), sum ($\sum\lambda=2^{24}+1$; icoinoct), tsmall ($T$ smaller by 1/4; icoinoct).
- D28 group (7): kpair ($k$-sum of a pair nonzero), kval ($k\pm1/8$ with the sum kept 0; both cases), drop (remove an accepted $R$-leaf), dropn (claim an $n$-pair is outside), ident ($c^{\ast}+1/1000$; both cases, both local boxes for cubintet).
- D16 group, v0.2.0 (10): lam, drop, disc, ident for icoindod and octindod; sum, tsmall ($T=13/16\to9/16$) for octindod.
- D30 group (9, cubinico): lam (move a multiplier, sum unchanged), sum ($2^{24}+1$), drop (far leaf), disc (pair replaced), ident ($S^{\ast}+1/1000$), tsmall ($T=71/64\to55/64$), locCand (a local leaf's candidate replaced by one Python also rejects), locDrop (a local leaf removed), rhoBig ($\rho_0=1/16\to1/8$). rhoBig is rejected by the local module; the far module still passes, because widening the local region only makes the far region easier — only the local side is an error test for that variant.
- D31 group (11, octintet): farA (accepted leaf with a candidate whose bound is negative), farD (discard with a rotation whose bound is $\le0$), farDrop, farOut (an ok $n$-box claimed out), farL (a $J$ leaf claimed $C$), uJbig ($U_J=3/8$: all 10 local $J$ face-sides fail), uJ ($U_J=5/32$: the far L check fails; the local $J$ module still passes, the easy direction as in n2), locCandJ, locCandC, locE (a candidate with positive bound but the wrong sign of $E_c$ — rejected by the sign check alone), locDrop.
- D30X group (9 each for dodincub and dodinoct): the same kinds as the D30 group (lam, sum, drop, disc, ident, tsmall, locCand, locDrop, rhoBig); rhoBig is rejected by the local module only, as for cubinico.
- D45DT group (13, dodintet): FarA (a top vertex replaced), FarD (a discard rotation replaced), FarDrop, FarOff (a positive offset in a tree with L leaves, pair sum kept 0), FarSum (a negative pair sum of type III), FarOut (a pair box claimed outside), LocCand, LocDrop, CBig ($\bar c+10^{-6}$), KapB ($\hat k_3+10^{-9}$, more than the zero-order margin $2.3\times10^{-10}$), R0Big ($r_0=1/32\to1/16$; rejected by the local module only), Upper (a translation of the upper-bound placement moved by $10^{-30}$), RotBad (a rotation replaced by a reflection).
- D37N05 group (16, tetintet_n05): farA, farD, farDrop, farOut, farL (an L leaf with another centre and piece rotation), farKN ($k_N=-1/1024$ next to $N_1$), farMu ($\mu$ below $D_j$), farConst (the constant 1 on a wrong face), muNeg (sign of $\mu$ reversed), locCand, locType, locDrop, sBig ($s_0=2001/1000$), r0Big ($r_0=1/16\to1/8$; rejected by the local and constants modules, the far module passes), aBig ($a_{\max}=7/8\to1$), upper (a translation of the central piece moved by $10^{-30}$).
- Plateau group (24, `decide +kernel`): see [plateau.md §6](plateau.md#6-injected-errors). These fail either with "`decide` proved that the proposition … is false" or, when the checker returns `none`, with a type mismatch of the `decide` term; `lean/build.py` accepts both for this group.

## 6. Lean re-check

**What it shows: the same arithmetic passes in Lean, independently of the Python code.** The data are written out by export scripts (`export_d16.py`, `export_d28.py`, `export_d16e.py`, `export_d30.py`, `export_d31.py`, `export_plateau.py`; for v0.3.0 `export_d30s3.py`, `export_d40.py`, `export_d30x.py`, `export_d45dt.py`, `export_d37n05.py`) directly from the Python values, never copied by hand. For the local stages that store no tree, the export script re-runs the same search and records the tree; the accepted counts were compared with the Python records and agree. The stored local records of cubinico, octintet and the v0.3.0 cases are exported as they are.

Lean re-builds, from the exported numbers: the far acceptance polynomials and their lower bounds (with the same $2^{-120}$ enclosures), the discard bounds, the to-local conditions, the trees (given as preorder "split/leaf" sequences, re-split by Lean with the same rule, so the tree closure is checked at the same time), the local zero-order identities and face bounds, and the constants: square-root enclosures, piece and container data (central symmetry, unit edges, support values, inradius of the piece, completeness of the vertex list of $P$), the symmetry pairs (orthogonal, preserving the point sets, determinant condition), $\bar S\ge S^{\ast}$, the $T$ condition, and the upper-bound configuration. The accepted counts appear on the right-hand side of the theorems, so Lean also checks that the numbers agree with the Python records.

For cubinoct, Lean follows both $\tau$-trees $[0,\tfrac12]$ and $[\tfrac12,1]$ and checks in the same theorem that they join to $[0,1]$; boxes outside the domain (not recorded by Python) are re-checked with the same integer conditions.

| | Lean modules | wall time | notes |
|---|---|---|---|
| cubinoct | 4 | 38 s | far 895 + 859 tokens; accepted 623, local 1, outside 120 + 134; local 4 faces, 4 accepted |
| icoincub | 4 | 56 s | 2,610 tokens; 1,081 / 218 / 8; local 24 accepted; 144 pairs, 8 vertices of $P$ |
| dodinico | 9 | 271 s | 13,364 tokens; 5,558 / 1,118 / 8; local 10 accepted; 600 pairs, 12 vertices of $P$ |
| icoinoct | 4 | 37 s | 1,136 tokens; 426 / 136 / 8; local 15 accepted; 144 pairs, 6 vertices of $P$ |
| icointet | 28 | 243 s | 162 $(N,\sigma N)$ pairs (324 ok, 44 out); 57,352 $R$-leaves; local 2,111 accepted |
| cubintet | 72 | 725 s | 158 pairs (316 ok, 44 out); 135,358 $R$-leaves; local 2,878 accepted |

| icoindod | Consts, Far, Local (+ data) | 112 s | 2,212 tokens; 892 / 208 / 8; local 10 accepted; 360 pairs, 20 vertices of $P$ |
| octindod | Consts, Far, Local (+ data) | 162 s | 4,608 tokens; 1,826 / 472 / 8; local 23 accepted; 360 pairs, 20 vertices of $P$; field with generators `ps := [5, 2]`, components $(1,\sqrt2,\sqrt5,\sqrt{10})$ |
| cubinico | Consts, Far, Local (+ data) | about 110 s | 9,978 tokens; 4,194 / 789 / 8; stored local tree, 74 accepted (all single); 480 pairs, 12 vertices of $P$, $T=71/64$ |
| octintet | 37 modules | about 270 s | $n$-boxes 319 ok / 17 out; 120,158 tokens; 49,568 / 10,325 / 824; local $J$ 5,363, $C$ 2,388 (per face and side); 23 piece rotations; the 54 + 81 zero-order identities |
| octinico | Data, Tok000, Far, Local, Consts | far 34 s, local 23 s, consts 12 s (+ data about 180 s) | far tokens 1,848; 676 / 206 / 44 in the tube; local 36 candidates, accepted per side [4,4,4,4], 10 single and 6 weighted with lifts; 360 pairs, $T=47/64$ |
| tetintet | 66 far modules, 7 local modules, Consts | far about 1,200 s, local about 330 s, consts about 10 s | $n$-boxes 236 ok / 18 out; 452,642 tokens; 154,232 accepted (incl. type S) / 72,810 / 223; local 28,946 leaves (per centre as in the record); 11 piece rotations, 7 centres, $\kappa$ coefficients, upper bound |
| dodincub | Data, Tok000–002, Far, Local, Consts | far 62 s, local 3 s, consts 4 s | far tokens 7,604; 3,347 / 449 / 8; stored local tree, 23 accepted (all single), 8 candidates; 240 pairs |
| dodinoct | Data, Tok000–010, Far, Local, Consts | far 129 s, local 3 s, consts 2 s | far tokens 31,966; 15,250 / 727 / 8 ($\rho_0=1/32$); stored local tree, 126 accepted (all single), 4 candidates; 240 pairs |
| dodintet | 51 far modules, Far, Local, Consts | far about 4,500 s (one at a time), local 22 s, consts 8 s | 5,477 pair boxes, 114 outside; R-tree strings 20.2 million characters; 2,717,927 / 1,314,967 / 18,816; local 2,670 + 1,002 leaves (per face as in the record); 60 piece rotations, the piece, tube weights, upper bound and sandwich |
| tetintet_n05 | 98 far modules, 4 local modules, Consts | far about 4,600 s, local about 75 s, consts about 5 s | $n$-boxes 594 ok / 31 out; 2,125,476 tokens; 777,383 accepted (incl. type S) / 286,744 / 987; local 6,734 leaves (per centre as in the record); 11 piece rotations and the 12 quaternions of the L check, 5 centres, local regions, $\kappa$ coefficients, upper bound |

`icoindod`, `octindod` use the unchanged `PackLean/D16/Core.lean` (its number type was already a list of components over a list of generators). `cubinico` also uses it unchanged. `octintet` has its own hand-written `PackLean/D31/Core.lean`, integer-only: it rebuilds $2\lvert q\rvert^2G_c$ **from the definition of $\Gamma$** (it does not copy the Python polynomials), extracts $e_0,e_1$ of $T_c$ itself, and reads the region constants from one place, used by both the far L check and the local root boxes. The $n=3$–$5$ checks (`PackLean/Plateau/`) use `decide +kernel` only; see [plateau.md §5](plateau.md#5-what-lean-checks-here).

**Kernel trials (`decide +kernel`) for v0.2.0.** octintet: far parts (158 and 115 leaves), local $J$ faces (4 and 23 leaves), a local $C$ face (215 leaves, 416 s, 9.5 GB) and the constants all passed with only the three standard axioms; the full run was estimated at 1.5–2 h (far) plus about 4 h (local) and was not done. cubinico: the first 40 and 100 far tokens, one local face and the constants without the symmetry pairs passed; the full local tree and the full constants exceeded 11–14 GB of memory and were stopped without a result. For all v0.2.0 $n=2$ cases the full certificates are therefore checked with `native_decide`.

**v0.3.0.** `octinico` has its own `PackLean/D30S3/Core.lean` on top of the D16 field arithmetic: the far run with the tube test (`insideTube`, exact tube coordinates at the 8 corners), the local check on the four sides of the tube (Lean substitutes $p=\tau(a_1)n+\rho\theta$ itself and divides by $\rho$), the weighted check with paired lifts (`mixOk`; the lift polynomials are built by Lean, not copied), and the constants ($R^{\ast}=\operatorname{spin}(-1/5)$, the octahedron, $S^{\ast}=C_0s^{\ast}=\sqrt2$, the tube basis); the zero-order identities are checked both as divisibility by $\rho$ on the four sides and as $F(\tau n)\equiv0$. `tetintet` has its own integer-only `PackLean/D40/Core.lean`: it builds the candidate expressions $\tilde G_{c,\mu}$ and $\check S_c$ from their definition (far and local), splits the local polynomial into $e_c$ and $\Lambda_c$ itself, checks $k_N=0$ on boxes meeting $N_1$, the seven centres (images of $\hat R$ under the stabiliser of $(1,1,1)$, $T_C=I$), the $\kappa$ coefficients and the rational upper bound (containment, separation, $\bar s<s_{\rm up}<\bar s+10^{-9}$, and a sign change of the quintic between $\bar s$ and $s_{\rm up}$). Kernel trials (`decide +kernel`): octinico — 40 far tokens (68 s), one local leaf (49 s, 3.4 GB), constants (13 s); one full side (4 leaves) reached 10.7 GB and was stopped without a result. tetintet — all constants (8 s), three small $n$-boxes (1,661 leaves, 398 s, 7.1 GB), local faces with 1 and 60 leaves; the central $n$-box reached 8 GB and was stopped; the full run is estimated at about 15 h (far) plus 8 h (local). All trials that finished show only the three standard axioms. The full certificates are checked with `native_decide`.

`dodincub` and `dodinoct` (`PackLean/D30X/`) are checked by the unchanged `PackLean/D16/Core.lean`, as for cubinico; the stored local certificates (single candidates only) are exported as they are. The exporter imports `verifier/d30x_problems.py` and cross-checks the constants written to Lean with the records: the strings $S^{\ast}$ and $R^{\ast}$ of the local record equal the problem and the claim record, and the integers written to `Data.lean` decode back to $S^{\ast}$, to $R^{\ast}$ applied to the dodecahedron and to $R^{\ast}n_0$. `dodintet` has its own `PackLean/D45DT/Core.lean` on top of the field elements, interval brackets, R-box quadratics and sparse polynomials of `PackLean/D28/Core.lean` (unchanged): far pairs of types I–III with offsets (Lean builds $\kappa_U,\kappa_L$ from $\hat k$, checks the pair sum at the corners, the parallelogram test and the cone test of L leaves exactly in $\mathbb Q(\sqrt5)$), the local check of the two tubes (Lean builds $\lvert q\rvert^2(F_c-\kappa)$ from the tube constants and the centre quaternion, splits it into $e_c$ and $\Lambda_c$ itself, $\sqrt5$ bracketed at $2^{-100}$), the constants (the piece, 60 rotations, tube weights) and the upper bound (both pieces rotations, containment, separation, $0<2\sqrt2(u_{\rm up}-\bar c)<4\times10^{-10}$). The R trees are stored as strings (one character per split, short codes for leaves) instead of Lean lists, because the far record has about 20 million tokens. `tetintet_n05` has its own integer-only `PackLean/D37N05/Core.lean` (based on D40): besides the D40 checks it verifies $D_j\le\mu$ at every vertex of ($n$-box) $\cap\,T$ for each F/M leaf (faces $j\in\{0\}$ on side A, $\{3,0\}$ on side B, $\mu$ a multiple of $1/64$), the constant 1 for $\tilde H'_3$ (only for $f=3$), the L leaves after a piece rotation $k$ ($w=\bar q_c\otimes q\otimes\bar q_k$), the local regions (`region_check` and $2a_{\max}+3r_0\le2$), the five centres as $C_{3v}$ images of $R_1^{\ast}$ and $R_{P2}$, the $\kappa$ coefficients from the exact $\tilde F$, and the five-piece placement at $s=2$. No kernel trials were made for dodincub, dodinoct, dodintet or tetintet_n05.

Injected errors that make a module easier and therefore build (EXPECT_PASS): octinico — a larger $\rho_0$ or a wider tube passes the far and constants modules (the far region only hands over less), a shifted tube centre passes the constants module (the centre is not a constant checked there); the local module rejects all three. tetintet — a larger $r_0$ passes the far module (Far000); the local modules reject it. dodincub and dodinoct — a larger $\rho_0$ passes the far and constants modules (the doubled $\rho_0$ and $r_0$ are consistent with each other), as for cubinico; the local module rejects it. dodintet — a larger $r_0$ passes the far module (Test/R0Big/Far000); the local module rejects it. tetintet_n05 — a larger $r_0$ passes the far module (Far000); the local and constants modules reject it.

`#print axioms` (D16: 13 top-level theorems; D28: per case; v0.2.0: `D16/AxiomsB2.lean`, `D30/Axioms.lean`, `D31/Axioms.lean`, `Plateau/Axioms.lean`, `Plateau/N5Axioms.lean`; v0.3.0: `D30S3/Axioms.lean`, `D40/Axioms.lean`, `D30X/Cub/Axioms.lean`, `D30X/Oct/Axioms.lean`, `D45DT/Axioms.lean`, `D37N05/Axioms.lean`) lists only `propext`, `Classical.choice`, `Quot.sound` and the `…_native.native_decide.ax_1_1` axioms generated by `native_decide`. There is no `sorryAx`.

**`native_decide`.** All theorems are proved with `native_decide`, which trusts the Lean compiler and `Lean.ofReduceBool` (one level below the kernel). Kernel checking (`decide +kernel`) was tried on parts and succeeded there (icointet: first 5 pairs, 1,061 $R$-leaves, 399 s; icoinoct: first 100 tokens of the far tree, 72 s), with only the three standard axioms; the full run in the kernel was estimated at many hours per case and was not done.

Toolchain: `leanprover/lean4:v4.36.0-rc2`, no Mathlib.

### What Lean does not check

1. The reductions: Lemma R and the LP $\varphi(R)$ (symmetric cases), T1–T4 and the formula $F(n,R;c)$ (tetrahedral cases), and that these represent the packing problem correctly. That the faces of the piece form a single rotation orbit is not checked in Lean (the inradius distance is checked for all faces).
2. The meaning of a box check: weak duality, $t\in T\cdot P$ and $E\cdot t\ge T\min_w E\cdot w$, the $\lvert P\rvert\ge\varepsilon P$ and $\lVert t\rVert_1$ bounds for cubinoct, the vertex-choice lower bound and $w_f\ge0$ on $D_n$ for d28, the polynomial lower-bound rule, the discard rule, and the local implications ($F=\rho G$, $G>0\Rightarrow$ bound).
3. Coverage: that the four quaternion charts cover $SO(3)$; that the cubinoct domain $D$ represents $SO(3)$ under the symmetries; that $D_n$ is a fundamental domain for $T_d$; that the local faces cover the local box. Lean checks only that the sequences form closed trees and that every leaf passes.
4. That the constants are the right ones (e.g. that $S^{\ast}$ equals the closed form, the orientations $R^{\ast}$; for octindod, cubinico, dodincub and dodinoct, that $R^{\ast}$ and $S^{\ast}$ read off with PSLQ are the optimum). Lean does arithmetic with the exported constants and checks the stated properties of pieces, containers, symmetry pairs and the upper bound (the upper bound of octintet $n=2$ is checked in Lean only through `PackLean/Plateau/`, the same configuration).
4a. For octintet: the bridge of reduction_octintet.md §1, that $\Gamma$ represents (K) (test F0 is Python/sympy), $G_c\le\Gamma$, the split $\lvert q\rvert^2G_c=r\Lambda_c+k'uE_c$ and its consequence, and that $J\cup C$ and the far region cover $D_n\times SO(3)$. For $n=3$–$5$: see plateau.md §5.
4b. For octinico: Lemma W (weights and paired lifting) and its use in `check_mix`, that the tube coordinates and the tube cover the region handed over by the far stage, and that $\rho=0$ gives $\varphi\ge S^{\ast}$. For tetintet: T4 with the restriction $s_1(R)\le\bar s$, the meaning of the leaf types F/M/S, the pairing of sides A and B and the extension of $\kappa$, the local lemma with a nonnegative zero-order part, that the seven centres' regions and the far region cover $D_n\times SO(3)$, and that $\hat R$ approximates the true optimum (not needed for the enclosure). For dodincub and dodinoct: that `d30x_problems.py` defines the intended problems (the container and the dodecahedron) and installs them in front of the d30 tools; the rest is as for cubinico. For dodintet: T4 in the strong form (all $R$) at the rational scale $\bar c$, the meaning of the candidate bound (nonnegative weights), the pairing of the two trees and the seam $y=0$ ($\kappa=\max(\kappa_U,\kappa_L)$), the local lemma with a nonnegative zero-order part on the tubes, that the tubes, the far cone test and the $n$-tree cover $D_n\times SO(3)$, and that the centres and $\hat k$ approximate the optimum (not needed for the enclosure). For tetintet_n05: the pigeonhole step and T2–T4 restricted to the cell $R_3$, the identity behind the face/multiplier condition $D_j\le\mu$, the extension of $\kappa$ ($C_{3v}$, homogeneity, box boundaries, the line $a+b=1$), the local lemma, and that the five centres' regions and the far region cover the chamber $\times\,SO(3)$.
5. `native_decide` trusts the compiler.

## 7. Reproduction

Python 3.10 or later with the packages in `requirements.txt`; all commands from the repository root unless stated. File names are listed in [certificates/README.md](../certificates/README.md).

**Replay the stored certificates** (reads `certificates/` only; includes `d16_cover_check_roots.py` for cubinoct):

```bash
python -X utf8 tests/replay_all.py
```

**Re-run the local lemma** (the local stage stores no box record; re-running it is the check). The verifier reads nothing from `certificates/` here, but writes a summary `<name>.json` into the current directory, so run it in a scratch directory:

```bash
mkdir -p work/run && cd work/run
python -X utf8 ../../verifier/d16_cover_local.py                       # cubinoct  -> d16_local.json
python -X utf8 ../../verifier/d16d_local.py icoincub                   # -> d16d_icoincub_local.json
python -X utf8 ../../verifier/d16d_local.py dodinico
python -X utf8 ../../verifier/d16d_local.py icoinoct
python -X utf8 ../../verifier/d28_local.py --prob icointet             # -> d28_icointet_local.json
python -X utf8 ../../verifier/d28_local.py --prob cubintet
```

**Stage 0** (exact substitution of the optimal configuration; upper bound):

```bash
python -X utf8 ../../verifier/d16d_step0.py cubinoct      # likewise icoincub, dodinico, icoinoct
python -X utf8 ../../verifier/d28_step0.py --prob icointet --skip-map
python -X utf8 ../../verifier/d28_step0.py --prob cubintet --skip-map
```

(`d28_step0.py` also compares the formula with five external numerical records when they are present under `../records`; that cross-check is skipped otherwise and is not part of the proof. For cubintet it rewrites `verifier/d28_cubintet_beta.json` with the same β = 11/49.)

**Re-create the far certificates from scratch** (writes `<name>.json` and `<name>.boxes.jsonl.gz` into the current directory; the parameters below are those of the recorded runs, and the result can be compared with `certificates/`):

```bash
python -X utf8 ../../verifier/d16_cover_far.py run d16_far_t0 --troot 0,1/2
python -X utf8 ../../verifier/d16_cover_far.py run d16_far_t1 --troot 1/2,1
python -X utf8 ../../verifier/d16d_far.py run icoincub --T 1/2
python -X utf8 ../../verifier/d16d_far.py run dodinico
python -X utf8 ../../verifier/d16d_far.py run icoinoct
python -X utf8 ../../verifier/d28_far.py run --prob icointet --procs 2
python -X utf8 ../../verifier/d28_far.py run --prob cubintet --procs 3
```

**v0.2.0 cases** (same scratch directory; the parameters are those of the recorded runs):

```bash
# icoindod (d16d_*, T = 77/64 by default) and octindod (d16e_*, T = 13/16 by default)
python -X utf8 ../../verifier/d16d_step0.py icoindod
python -X utf8 ../../verifier/d16d_far.py run icoindod && python -X utf8 ../../verifier/d16d_far.py replay icoindod
python -X utf8 ../../verifier/d16d_local.py icoindod
python -X utf8 ../../verifier/d16e_step0.py octindod
python -X utf8 ../../verifier/d16e_far.py run octindod && python -X utf8 ../../verifier/d16e_far.py replay octindod
python -X utf8 ../../verifier/d16e_local.py octindod
# cubinico (stage 0 is test U of d30_tests_full.py)
python -X utf8 ../../verifier/d30_far.py run cubinico --rho0 1/16
python -X utf8 ../../verifier/d30_local.py cubinico --no-lp --rho0 1/16 --name d30_cubinico_local_r16_nolp
python -X utf8 ../../verifier/d30_local.py --verify d30_cubinico_local_r16_nolp.json
python -X utf8 ../../verifier/d30_claim.py cubinico d30_cubinico_local_r16_nolp.json d30_cubinico_far --out d30_cubinico_claim_nolp.json
# octintet (stage 0: d31_step0.py --part abc; the upper bound is test U of d31_tests.py)
python -X utf8 ../../verifier/d31_far.py run --procs 4
python -X utf8 ../../verifier/d31_local.py run J --procs 4
python -X utf8 ../../verifier/d31_local.py run C --procs 4
python -X utf8 ../../verifier/d31_far.py replay_all
# n = 2..5 in a tetrahedron (from the repository root; reads certificates/plateau_*.json, writes to work/)
python -X utf8 verifier/d28_plateau_n34.py --inject
python -X utf8 verifier/d31_plateau_n34.py --inject
python -X utf8 verifier/plateau_n05_upper.py
python -X utf8 verifier/plateau_end_check.py
```

**v0.3.0 cases** (same scratch directory):

```bash
# octinico (stage 0 is test U of d30_s3_tests.py)
python -X utf8 ../../verifier/d30_s3_far.py run && python -X utf8 ../../verifier/d30_s3_far.py replay
python -X utf8 ../../verifier/d30_s3_local.py run
python -X utf8 ../../verifier/d30_s3_local.py verify d30_s3_octinico_local.json
python -X utf8 ../../verifier/d30_s3_claim.py d30_s3_octinico_local.json d30_s3_octinico_far
# tetintet
python -X utf8 ../../verifier/d40_local.py run
python -X utf8 ../../verifier/d40_far.py run --procs 2
python -X utf8 ../../verifier/d40_upper.py
python -X utf8 ../../verifier/d40_tests.py --only chain
# dodincub and dodinoct (every d30 script is run through d30x_problems.py)
python -X utf8 ../../verifier/d30x_problems.py ../../verifier/d30_local.py dodincub --name d30x_dodincub_local_r16
python -X utf8 ../../verifier/d30x_problems.py ../../verifier/d30_far.py run dodincub --rho0 1/16
python -X utf8 ../../verifier/d30x_problems.py ../../verifier/d30_claim.py dodincub d30x_dodincub_local_r16.json d30_dodincub_far --out d30x_dodincub_claim.json
python -X utf8 ../../verifier/d30x_problems.py ../../verifier/d30_local.py dodinoct --no-lp --rho0 1/32 --time-limit 600 --name d30x_dodinoct_local_r32_nolp
python -X utf8 ../../verifier/d30x_problems.py ../../verifier/d30_far.py run dodinoct --rho0 1/32 --name d30_dodinoct_far_r32 --time-limit 7200
python -X utf8 ../../verifier/d30x_problems.py ../../verifier/d30_claim.py dodinoct d30x_dodinoct_local_r32_nolp.json d30_dodinoct_far_r32 --out d30x_dodinoct_claim_nolp.json
# dodintet (the main far part cannot be re-created by the current code, see below; copy the two far box records,
# d45_dodintet_far.json, d45_dodintet_upper.json (read by d45_dodintet_common at import) and dodintet_n02.json
# from certificates/ into the scratch directory first)
python -X utf8 ../../verifier/d45_dodintet_local.py run --only T_A --name d45_dodintet_local_TA
python -X utf8 ../../verifier/d45_dodintet_local.py run --only T_B --name d45_dodintet_local_TB
python -X utf8 ../../verifier/d45_dodintet_upper.py          # compares q-hat and u_up with d45_dodintet_upper.json (--write rewrites it)
python -X utf8 ../../verifier/d45_dodintet_tests.py --only chain   # local replay x2, far replay (8 processes), upper bound
# tetintet_n05 (records with R0 = 1/16)
D37_R0=1/16 python -X utf8 ../../verifier/d37_tet_n05_local.py run --name d37_tet_n05_local_r16
D37_R0=1/16 python -X utf8 ../../verifier/d37_tet_n05_far.py run --name d37_tet_n05_far_r16 --procs 3 --budget 15000 --wmin-exp 18 --forced-exp 5 --nmin 12
python -X utf8 ../../verifier/d37_tet_n05_replay_both.py --r0 1/16
```

Re-created with the translated code (11-14), all four octinico records and all five tetintet records agree with `certificates/`: the far and local `.json` files apart from run times (and, for the octinico local record, the SHA-256 of the code files in `params`), the decompressed box and leaf records byte for byte (`d30_s3_octinico_far` 926 rows, `d40_far` 255 rows, `d40_local` 28,947 rows; no sorting), `d40_upper.json` apart from line endings. `d30_s3_claim.py` compares the SHA-256 of the code that made a record with the current files only for information (acceptance is re-decided); on the stored records it reports the translated files as different and passes. `d40_psi.py` is the floating-point slack estimate used by `d40_far.py run` to choose $k_N$ (extracted from the development code; same values bit for bit at the tested points); replay does not call it.

Re-created with the translated code (11-14), the dodincub and dodinoct records agree with `certificates/`: the local records apart from `params.sha256` (the SHA-256 of the code files, which is written only, not compared), the far `.json` files apart from run times, the claim records apart from run times and SHA-256 values, and the decompressed far box records byte for byte (`d30_dodincub_far` 3,804 rows, `d30_dodinoct_far_r32` 15,985 rows; no sorting).

Re-created with the translated code (11-14), both tetintet_n05 records agree with `certificates/`: the `.json` files apart from run times, the decompressed leaf and box records byte for byte (`d37_tet_n05_local_r16` 6,735 rows, `d37_tet_n05_far_r16` 626 rows; no sorting).

For dodintet, re-created with the translated code (11-14): `d45_dodintet_local_TA/TB` (json apart from run times, leaves byte for byte after decompression: 2,671 and 1,003 rows), `d45_dodintet_upper.json` (byte for byte), the continuation `d45_dodintet_far.part1.boxes.jsonl.gz` and its summary `d45_dodintet_far.json` (same parameters; byte for byte after decompression / apart from run times). The main far part (5,475 boxes) cannot be re-created by the current code: the pruning heuristic of `try_pair` was changed during the original run and two regions were removed by hand and redone as the continuation (only which boxes are tried changed, not any acceptance test). It was replayed with the translated code instead: 5,477 boxes, 2,717,927 / 1,314,967 / 18,816 leaves, 0 failures (980 s on 4 processes).

The re-created cubinico local record has three more fields in `params` (`SSTAR_str`, `RSTAR_str`, `sha256` of the code), which the code gained after the stored record was made; the rest is identical.

**Tests and injected errors**: see [tests/README.md](../tests/README.md).

**Lean** (elan installs the toolchain pinned in `lean/lean-toolchain`; no Mathlib, nothing to download besides the toolchain):

```bash
cd lean
python build.py icoinoct      # one case; also cubinoct, icoincub, dodinico, icointet, cubintet, icoindod, octindod, cubinico, octintet,
                              # octinico, tetintet, dodincub, dodinoct, dodintet, tetintet_n05
python build.py all          # all cases with box certificates and the #print axioms summaries
python build.py plateau      # n = 2..5 in a tetrahedron (decide +kernel)
python build.py inject       # the injected-error certificates of D16, D28, D30, D31, D30S3, D40, D30X, D37N05, D45DT must all be rejected (except EXPECT_PASS)
python build.py inject plateau
```

To re-export the Lean data from the Python records: `python -X utf8 lean/tools/export_d16.py --prob icoinoct` (likewise `dodinico`, `icoincub`, `cubinoct`) and `python -X utf8 lean/tools/export_d28.py --prob icointet` (or `cubintet`); the exporters do not rewrite files whose content is unchanged.

**Running times.** The development runs took, at low priority on one desktop CPU: cubinoct under 10 seconds (far 3.3 s, local 5.1 s); icoincub about half a minute (far + local); icoinoct about 2 minutes; dodinico about 4–5 minutes (far 107 s + replay 54 s + local 147 s); icointet about 5 minutes (far 178 s on 2 processes, replay 87 s, local 28 s); cubintet about 11 minutes (far 247 s on 3 processes, replay 327 s, local 71 s). The test scripts take 1–17 minutes per case. v0.2.0: icoindod about 1 minute (far 19 s, replay 10–14 s, local 29 s); octindod about 3 minutes (far 63 s, replay 27–44 s, local 30–44 s); cubinico about 2–3 minutes (far 60 s, local 26 s, `d30_claim.py` 68 s); octintet about 2 minutes on 4–8 processes (far 25–39 s, $J$ 11–18 s, $C$ 12–18 s, `replay_all` 25–31 s); the plateau scripts a few seconds. v0.3.0: octinico about 10 minutes (far 14–57 s, replay 7–35 s, local 2–4 min, verify 2.5–3.5 min, `d30_s3_claim.py` 5 min); tetintet about 35–40 minutes (local 451–466 s on one process, far 1,528–1,928 s on 2 processes, chain 2.5–3 min); dodincub about 5 minutes (local 68 s, far 71 s, `d30_claim.py` 112 s) and dodinoct about 5 minutes (local 22 s, far 153 s, `d30_claim.py` 102 s), with the translated code; dodintet about 2.3 hours on 8 processes for the far run (8,051 s; local 27 + 11 s), replay 358 s on 8 processes (980 s on 4); tetintet_n05 local 97–158 s, far 1,983–3,233 s on 3 processes, `replay_both` 434–449 s. Tests: icoindod and octindod about 12–14 minutes, cubinico about 15 minutes, octintet about 22 minutes, octinico about 6 minutes, tetintet about 2 minutes (W, t1–t6, L1: 85 s; R3: 25 s), dodincub about 18 minutes and dodinoct about 26 minutes (`d30_tests_full.py`; `d30x_testsX.py` 2–5 minutes), dodintet about 6 minutes plus chain 5–8 minutes, tetintet_n05 about 15 minutes for the local tests (905 s; tb and ts run until their time limit) and 671–795 s for test X of the far tests alone.
