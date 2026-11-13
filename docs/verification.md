# Verification

This document describes how the lower bounds are certified, how the far and local regions fit together, what the tests do, and what the Lean re-check covers. The reductions themselves are in [reduction_symmetric.md](reduction_symmetric.md), [reduction_tetrahedron.md](reduction_tetrahedron.md) and [reduction_octintet.md](reduction_octintet.md); the cases with three to five pieces are in [plateau.md](plateau.md) (§8 below).

## 1. Structure of one proof

Each case is the combination of three Python checks and one Lean re-check:

| part | what it shows | artefact |
|---|---|---|
| stage 0 | exact substitution of the optimal configuration (upper bound); for `d16d_*` also $\varphi(I)=S^{\ast}$, primal and dual | re-run |
| far region | the reduced inequality on the whole rotation domain minus the local boxes | box record + **replay** |
| local region | the inequality on the local boxes, equality only at the minimiser(s) | **re-run** (no box record); for cubinico and octintet a stored leaf record, re-checked by `--verify` / `replay` |
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

**Stored local records.** For cubinico the local leaves are stored in `d30_cubinico_local_r16_nolp.json` (`cert`, per face); `d30_local.py --verify` re-decides each leaf and checks that the leaves tile face × $[0,\rho_0]$ as the leaves of a binary tree (volume sum; a branch that leads to no leaf is rejected at once), and `d30_claim.py` ties the local and far records together (same problem and constants, closed, the far “to local” boxes have total volume $(2\rho_0)^3$). For octintet the leaves are in `d31_local_{J,C}.leaves.jsonl.gz`; `d31_local.py replay J|C` re-decides every leaf and rebuilds the trees (a branch deeper than the deepest recorded leaf is rejected). Both kinds of record are also exported to Lean as they are (the search is not re-run).

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

All results were as expected. Exceptions recorded: for cubinoct, m2 with factor 0.999 was not run (the local checker has no scale parameter); for d28, m4 does not apply ($s_1$ is not used). For icoincub, the tests were run with `d16d_*` (the version used here), with $T=1/2$.

**Injected-error certificates in Lean.** Certificates with a deliberate error were exported and given to Lean; all were rejected by `native_decide` evaluating the statement to false (none failed for syntactic reasons). The errors were chosen so that Python's own check also rejects them, which distinguishes "Lean missed it" from "the error had no effect".

- D16 group (17): lam (move 1/4 from the largest $\lambda$ to another face, sum unchanged; 4 cases), drop (remove one accepted leaf; 4), ident (shift $S^{\ast}$ in the local stage by 1/1000; 4), disc (replace a discard pair; 3 `d16d` cases), sum ($\sum\lambda=2^{24}+1$; icoinoct), tsmall ($T$ smaller by 1/4; icoinoct).
- D28 group (7): kpair ($k$-sum of a pair nonzero), kval ($k\pm1/8$ with the sum kept 0; both cases), drop (remove an accepted $R$-leaf), dropn (claim an $n$-pair is outside), ident ($c^{\ast}+1/1000$; both cases, both local boxes for cubintet).
- D16 group, v0.2.0 (10): lam, drop, disc, ident for icoindod and octindod; sum, tsmall ($T=13/16\to9/16$) for octindod.
- D30 group (9, cubinico): lam (move a multiplier, sum unchanged), sum ($2^{24}+1$), drop (far leaf), disc (pair replaced), ident ($S^{\ast}+1/1000$), tsmall ($T=71/64\to55/64$), locCand (a local leaf's candidate replaced by one Python also rejects), locDrop (a local leaf removed), rhoBig ($\rho_0=1/16\to1/8$). rhoBig is rejected by the local module; the far module still passes, because widening the local region only makes the far region easier — only the local side is an error test for that variant.
- D31 group (11, octintet): farA (accepted leaf with a candidate whose bound is negative), farD (discard with a rotation whose bound is $\le0$), farDrop, farOut (an ok $n$-box claimed out), farL (a $J$ leaf claimed $C$), uJbig ($U_J=3/8$: all 10 local $J$ face-sides fail), uJ ($U_J=5/32$: the far L check fails; the local $J$ module still passes, the easy direction as in n2), locCandJ, locCandC, locE (a candidate with positive bound but the wrong sign of $E_c$ — rejected by the sign check alone), locDrop.
- Plateau group (24, `decide +kernel`): see [plateau.md §6](plateau.md#6-injected-errors). These fail either with "`decide` proved that the proposition … is false" or, when the checker returns `none`, with a type mismatch of the `decide` term; `lean/build.py` accepts both for this group.

## 6. Lean re-check

**What it shows: the same arithmetic passes in Lean, independently of the Python code.** The data are written out by export scripts (`export_d16.py`, `export_d28.py`, `export_d16e.py`, `export_d30.py`, `export_d31.py`, `export_plateau.py`) directly from the Python values, never copied by hand. For the local stages that store no tree, the export script re-runs the same search and records the tree; the accepted counts were compared with the Python records and agree. The stored local records of cubinico and octintet are exported as they are.

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

`icoindod`, `octindod` use the unchanged `PackLean/D16/Core.lean` (its number type was already a list of components over a list of generators). `cubinico` also uses it unchanged. `octintet` has its own hand-written `PackLean/D31/Core.lean`, integer-only: it rebuilds $2\lvert q\rvert^2G_c$ **from the definition of $\Gamma$** (it does not copy the Python polynomials), extracts $e_0,e_1$ of $T_c$ itself, and reads the region constants from one place, used by both the far L check and the local root boxes. The $n=3$–$5$ checks (`PackLean/Plateau/`) use `decide +kernel` only; see [plateau.md §5](plateau.md#5-what-lean-checks-here).

**Kernel trials (`decide +kernel`) for v0.2.0.** octintet: far parts (158 and 115 leaves), local $J$ faces (4 and 23 leaves), a local $C$ face (215 leaves, 416 s, 9.5 GB) and the constants all passed with only the three standard axioms; the full run was estimated at 1.5–2 h (far) plus about 4 h (local) and was not done. cubinico: the first 40 and 100 far tokens, one local face and the constants without the symmetry pairs passed; the full local tree and the full constants exceeded 11–14 GB of memory and were stopped without a result. For all v0.2.0 $n=2$ cases the full certificates are therefore checked with `native_decide`.

`#print axioms` (D16: 13 top-level theorems; D28: per case; v0.2.0: `D16/AxiomsB2.lean`, `D30/Axioms.lean`, `D31/Axioms.lean`, `Plateau/Axioms.lean`, `Plateau/N5Axioms.lean`) lists only `propext`, `Classical.choice`, `Quot.sound` and the `…_native.native_decide.ax_1_1` axioms generated by `native_decide`. There is no `sorryAx`.

**`native_decide`.** All theorems are proved with `native_decide`, which trusts the Lean compiler and `Lean.ofReduceBool` (one level below the kernel). Kernel checking (`decide +kernel`) was tried on parts and succeeded there (icointet: first 5 pairs, 1,061 $R$-leaves, 399 s; icoinoct: first 100 tokens of the far tree, 72 s), with only the three standard axioms; the full run in the kernel was estimated at many hours per case and was not done.

Toolchain: `leanprover/lean4:v4.36.0-rc2`, no Mathlib.

### What Lean does not check

1. The reductions: Lemma R and the LP $\varphi(R)$ (symmetric cases), T1–T4 and the formula $F(n,R;c)$ (tetrahedral cases), and that these represent the packing problem correctly. That the faces of the piece form a single rotation orbit is not checked in Lean (the inradius distance is checked for all faces).
2. The meaning of a box check: weak duality, $t\in T\cdot P$ and $E\cdot t\ge T\min_w E\cdot w$, the $\lvert P\rvert\ge\varepsilon P$ and $\lVert t\rVert_1$ bounds for cubinoct, the vertex-choice lower bound and $w_f\ge0$ on $D_n$ for d28, the polynomial lower-bound rule, the discard rule, and the local implications ($F=\rho G$, $G>0\Rightarrow$ bound).
3. Coverage: that the four quaternion charts cover $SO(3)$; that the cubinoct domain $D$ represents $SO(3)$ under the symmetries; that $D_n$ is a fundamental domain for $T_d$; that the local faces cover the local box. Lean checks only that the sequences form closed trees and that every leaf passes.
4. That the constants are the right ones (e.g. that $S^{\ast}$ equals the closed form, the orientations $R^{\ast}$; for octindod and cubinico, that $R^{\ast}$ and $S^{\ast}$ read off with PSLQ are the optimum). Lean does arithmetic with the exported constants and checks the stated properties of pieces, containers, symmetry pairs and the upper bound (the upper bound of octintet $n=2$ is checked in Lean only through `PackLean/Plateau/`, the same configuration).
4a. For octintet: the bridge of reduction_octintet.md §1, that $\Gamma$ represents (K) (test F0 is Python/sympy), $G_c\le\Gamma$, the split $\lvert q\rvert^2G_c=r\Lambda_c+k'uE_c$ and its consequence, and that $J\cup C$ and the far region cover $D_n\times SO(3)$. For $n=3$–$5$: see plateau.md §5.
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

The re-created cubinico local record has three more fields in `params` (`SSTAR_str`, `RSTAR_str`, `sha256` of the code), which the code gained after the stored record was made; the rest is identical.

**Tests and injected errors**: see [tests/README.md](../tests/README.md).

**Lean** (elan installs the toolchain pinned in `lean/lean-toolchain`; no Mathlib, nothing to download besides the toolchain):

```bash
cd lean
python build.py icoinoct      # one case; also cubinoct, icoincub, dodinico, icointet, cubintet, icoindod, octindod, cubinico, octintet
python build.py all          # all ten n = 2 cases and the #print axioms summaries
python build.py plateau      # n = 2..5 in a tetrahedron (decide +kernel)
python build.py inject       # the injected-error certificates of D16, D28, D30, D31 must all be rejected (except EXPECT_PASS)
python build.py inject plateau
```

To re-export the Lean data from the Python records: `python -X utf8 lean/tools/export_d16.py --prob icoinoct` (likewise `dodinico`, `icoincub`, `cubinoct`) and `python -X utf8 lean/tools/export_d28.py --prob icointet` (or `cubintet`); the exporters do not rewrite files whose content is unchanged.

**Running times.** The development runs took, at low priority on one desktop CPU: cubinoct under 10 seconds (far 3.3 s, local 5.1 s); icoincub about half a minute (far + local); icoinoct about 2 minutes; dodinico about 4–5 minutes (far 107 s + replay 54 s + local 147 s); icointet about 5 minutes (far 178 s on 2 processes, replay 87 s, local 28 s); cubintet about 11 minutes (far 247 s on 3 processes, replay 327 s, local 71 s). The test scripts take 1–17 minutes per case. v0.2.0: icoindod about 1 minute (far 19 s, replay 10–14 s, local 29 s); octindod about 3 minutes (far 63 s, replay 27–44 s, local 30–44 s); cubinico about 2–3 minutes (far 60 s, local 26 s, `d30_claim.py` 68 s); octintet about 2 minutes on 4–8 processes (far 25–39 s, $J$ 11–18 s, $C$ 12–18 s, `replay_all` 25–31 s); the plateau scripts a few seconds. Tests: icoindod and octindod about 12–14 minutes, cubinico about 15 minutes, octintet about 22 minutes.
