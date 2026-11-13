# Verification

This document describes how the lower bounds are certified, how the far and local regions fit together, what the tests do, and what the Lean re-check covers. The reductions themselves are in [reduction_symmetric.md](reduction_symmetric.md) and [reduction_tetrahedron.md](reduction_tetrahedron.md).

## 1. Structure of one proof

Each case is the combination of three Python checks and one Lean re-check:

| part | what it shows | artefact |
|---|---|---|
| stage 0 | exact substitution of the optimal configuration (upper bound); for `d16d_*` also $\varphi(I)=S^{\ast}$, primal and dual | re-run |
| far region | the reduced inequality on the whole rotation domain minus the local boxes | box record + **replay** |
| local region | the inequality on the local boxes, equality only at the minimiser(s) | **re-run** (no box record) |
| Lean | the arithmetic of the far and local certificates, the tree structure and the counts | Lean project |

The three Python parts share the same problem definition, the same constants (e.g. $\rho_0=1/16$ and the local box $L$ for `cubinoct`, which is defined in one place in `d16_cover_common.py`), and the same coordinates.

## 2. Box lower bounds (far region)

### Acceptance uses integers only

Every acceptance decision is an integer computation:

- Box coordinates are dyadic rationals (for cubinoct, integer multiples of $2^{-44}$); polynomials are scaled to integer coefficients, homogenised, and shifted to the box centre and half-width (python-flint `fmpz_mpoly.compose`).
- On the unit box $[-1,1]^k$ the lower bound of a polynomial is: constant term as is; a monomial with only even exponents uses its range $[0,1]$; every other monomial contributes $-\lvert\text{coefficient}\rvert$. If a constant term were misidentified, the bound would only become weaker.
- Irrational constants ($\sqrt2$, $\sqrt3$, $\sqrt5$) are enclosed between integers divided by $2^{120}$ (checked with `isqrt` and strict inequalities); for a coefficient $a+b\sqrt p$ the lower or upper end is chosen according to the sign of $b$. Signs of field elements $a+b\sqrt p$ are decided exactly via $a^2-pb^2$ (recursively for two square roots).
- Multipliers are rationals; $\lambda\ge0$, $\sum\lambda=1$ (multipliers have denominator $2^{24}$), $\mu\ge0$, $\varepsilon=\pm1$, and the translation bound ($T_1$ or $T$) are checked by `need` on every call, including replay. `need` raises an exception when the condition is false (unlike `assert`, it is not removed by `python -O`).
- $\bar S$ and $T$ / $T_1$ are taken from the code's constants at replay time, not from the record.

**Floating point** is used only to propose LP multipliers, signs $\varepsilon$, vertex choices, $\kappa$ constants, discard pairs, and the split direction. It never enters an acceptance decision.

### Meaning of an accepted box

- Symmetric cases: an accepted box contains no feasible solution with $S<\bar S$, so $\varphi\ge\bar S>S^{\ast}$ on the box (strict). If a box sticks out of the domain, the statement is only stronger.
- Tetrahedral cases: an accepted pair of boxes satisfies $F-\kappa\ge0$ on the whole box.

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

**How the far and local regions connect.** The far region's "to local" leaves are checked by replay to lie inside the local region; the local region is proved on a set that contains all of them, with the same constants and coordinates. Together: inequality everywhere on the reduced domain, equality only at the minimiser(s). With the symmetry reduction this covers all of $SO(3)$ (and all directions $n$ for the tetrahedral cases).

## 4. Trusted base

The Python checkers rely on:

- python-flint: `fmpz_mpoly.compose` (polynomial shift), `isqrt`;
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

All results were as expected. Exceptions recorded: for cubinoct, m2 with factor 0.999 was not run (the local checker has no scale parameter); for d28, m4 does not apply ($s_1$ is not used). For icoincub, the tests were run with `d16d_*` (the version used here), with $T=1/2$.

**Injected-error certificates in Lean.** Certificates with a deliberate error were exported and given to Lean; all were rejected by `native_decide` evaluating the statement to false (none failed for syntactic reasons). The errors were chosen so that Python's own check also rejects them, which distinguishes "Lean missed it" from "the error had no effect".

- D16 group (17): lam (move 1/4 from the largest $\lambda$ to another face, sum unchanged; 4 cases), drop (remove one accepted leaf; 4), ident (shift $S^{\ast}$ in the local stage by 1/1000; 4), disc (replace a discard pair; 3 `d16d` cases), sum ($\sum\lambda=2^{24}+1$; icoinoct), tsmall ($T$ smaller by 1/4; icoinoct).
- D28 group (7): kpair ($k$-sum of a pair nonzero), kval ($k\pm1/8$ with the sum kept 0; both cases), drop (remove an accepted $R$-leaf), dropn (claim an $n$-pair is outside), ident ($c^{\ast}+1/1000$; both cases, both local boxes for cubintet).

## 6. Lean re-check

**What it shows: the same arithmetic passes in Lean, independently of the Python code.** The data are written out by export scripts (`export_d16.py`, `export_d28.py`) directly from the Python values, never copied by hand. For the local stages, which store no tree, the export script re-runs the same search and records the tree; the accepted counts were compared with the Python records and agree.

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

`#print axioms` (D16: 13 top-level theorems; D28: per case) lists only `propext`, `Classical.choice`, `Quot.sound` and the `…_native.native_decide.ax_1_1` axioms generated by `native_decide`. There is no `sorryAx`.

**`native_decide`.** All theorems are proved with `native_decide`, which trusts the Lean compiler and `Lean.ofReduceBool` (one level below the kernel). Kernel checking (`decide +kernel`) was tried on parts and succeeded there (icointet: first 5 pairs, 1,061 $R$-leaves, 399 s; icoinoct: first 100 tokens of the far tree, 72 s), with only the three standard axioms; the full run in the kernel was estimated at many hours per case and was not done.

Toolchain: `leanprover/lean4:v4.36.0-rc2`, no Mathlib.

### What Lean does not check

1. The reductions: Lemma R and the LP $\varphi(R)$ (symmetric cases), T1–T4 and the formula $F(n,R;c)$ (tetrahedral cases), and that these represent the packing problem correctly. That the faces of the piece form a single rotation orbit is not checked in Lean (the inradius distance is checked for all faces).
2. The meaning of a box check: weak duality, $t\in T\cdot P$ and $E\cdot t\ge T\min_w E\cdot w$, the $\lvert P\rvert\ge\varepsilon P$ and $\lVert t\rVert_1$ bounds for cubinoct, the vertex-choice lower bound and $w_f\ge0$ on $D_n$ for d28, the polynomial lower-bound rule, the discard rule, and the local implications ($F=\rho G$, $G>0\Rightarrow$ bound).
3. Coverage: that the four quaternion charts cover $SO(3)$; that the cubinoct domain $D$ represents $SO(3)$ under the symmetries; that $D_n$ is a fundamental domain for $T_d$; that the local faces cover the local box. Lean checks only that the sequences form closed trees and that every leaf passes.
4. That the constants are the right ones (e.g. that $S^{\ast}$ equals the closed form, the orientations $R^{\ast}$). Lean does arithmetic with the exported constants and checks the stated properties of pieces, containers, symmetry pairs and the upper bound.
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

**Tests and injected errors**: see [tests/README.md](../tests/README.md).

**Lean** (elan installs the toolchain pinned in `lean/lean-toolchain`; no Mathlib, nothing to download besides the toolchain):

```bash
cd lean
python build.py icoinoct      # one case; also cubinoct, icoincub, dodinico, icointet, cubintet
python build.py all          # all six cases and the #print axioms summaries
python build.py inject       # the 24 injected-error certificates must all be rejected
```

To re-export the Lean data from the Python records: `python -X utf8 lean/tools/export_d16.py --prob icoinoct` (likewise `dodinico`, `icoincub`, `cubinoct`) and `python -X utf8 lean/tools/export_d28.py --prob icointet` (or `cubintet`); the exporters do not rewrite files whose content is unchanged.

**Running times.** The development runs took, at low priority on one desktop CPU: cubinoct under 10 seconds (far 3.3 s, local 5.1 s); icoincub about half a minute (far + local); icoinoct about 2 minutes; dodinico about 4–5 minutes (far 107 s + replay 54 s + local 147 s); icointet about 5 minutes (far 178 s on 2 processes, replay 87 s, local 28 s); cubintet about 11 minutes (far 247 s on 3 processes, replay 327 s, local 71 s). The test scripts take 1–17 minutes per case.
