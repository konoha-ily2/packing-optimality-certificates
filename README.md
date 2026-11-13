# Optimality certificates for packing two unit Platonic solids (n = 2), v0.1.0

This repository contains **computer-assisted proofs (not formally verified)** that six values of the minimal container size for packing **two** congruent unit-edge Platonic solids into a Platonic container are optimal.

> **This is computer-assisted, not a formal proof.**
> The mathematical arguments (reductions, symmetry arguments, the meaning of a box acceptance) were written in prose and checked by reading only. The arithmetic of the certificates was re-checked independently in Lean 4, but only with `native_decide`, and the reasoning that connects the arithmetic to the packing statement has **not** been formalized.

## Claims

"Unit" means edge length 1. The container is a regular solid with edge $s$; the minimal edge is $s^{\ast}$. Placements are rotations and translations; the two pieces are closed and may touch (their interiors must be disjoint). Under these conventions the certificate shows that $s^{\ast}$ below is the **minimum**. If touching is forbidden, the same value is the **infimum** (not attained). Since every piece listed is mirror-symmetric, allowing reflections gives the same value.

| id | piece → container | $s^{\ast}$ (closed form) | $s^{\ast}$ (decimal) | toolchain | reduction |
|---|---|---|---|---|---|
| `cubinoct_n02` | cube → octahedron | $1+\sqrt2$ | 2.414213562… | `d16_cover_*` | [symmetric](docs/reduction_symmetric.md) |
| `icoincub_n02` | icosahedron → cube | $1+\tfrac{2\sqrt5}{3}$ | 2.490711985… | `d16d_*` ($T=1/2$) | [symmetric](docs/reduction_symmetric.md) |
| `dodinico_n02` | dodecahedron → icosahedron | $2+\tfrac{2\sqrt5}{5}$ | 2.894427191… | `d16d_*` | [symmetric](docs/reduction_symmetric.md) |
| `icoinoct_n02` | icosahedron → octahedron | $\sqrt{9/2+2\sqrt5}$ | 2.995352392… | `d16d_*` | [symmetric](docs/reduction_symmetric.md) |
| `icointet_n02` | icosahedron → tetrahedron | $2\sqrt2\,(1+2/\sqrt5)$ | 5.358249252… | `d28_*` | [tetrahedron](docs/reduction_tetrahedron.md) |
| `cubintet_n02` | cube → tetrahedron | $2+\tfrac{\sqrt6}{2}+\tfrac{2\sqrt3}{3}$ | 4.379445409… | `d28_*` | [tetrahedron](docs/reduction_tetrahedron.md) |

Equivalent forms used in the tools: icointet $s^{\ast 2}=72/5+32\sqrt5/5$; cubintet $s^{\ast 2}=41/6+2\sqrt2+8\sqrt3/3+2\sqrt6$.

What is claimed is **the value of the minimal edge**. Uniqueness of the optimal configuration is not claimed, except for one supplementary hand argument for `cubinoct_n02` that is kept separate (see [reduction_symmetric.md](docs/reduction_symmetric.md#supplement-the-optimal-configuration-of-cubinoct_n02-hand-argument)).

**Not claimed (icointet, $n=3,4$).** Removing pieces preserves feasibility, so the minimal edge for 3 or 4 icosahedra in a tetrahedron is at least $s^{\ast}$. This lower bound is all that is shown. The known numerical configurations (floating point) are about $1.1\times10^{-7}$ above $s^{\ast}$, and no configuration attaining $s^{\ast}$ for $n=3,4$ has been substituted exactly, so **the minimum for $n=3,4$ is not proved here.**

External records and closed forms from the literature/community databases were used **only for cross-checking**; none of them is an input to the proofs.

## How each proof is checked

Each case consists of four parts that share the same problem definition and constants.

1. **Stage 0 – exact substitution (upper bound).** The optimal configuration is substituted exactly in the number field ($\mathbb{Q}(\sqrt2)$, $\mathbb{Q}(\sqrt5)$, or $\mathbb{Q}(\sqrt2,\sqrt3)$): every vertex of both pieces lies in the container of edge $s^{\ast}$ and the two pieces are separated by a plane. This gives $s_2^{\ast}\le s^{\ast}$ directly, without using any reduction.
2. **Far region – box certificates + replay (lower bound away from the optimum).** After a reduction to a function of the rotation (see the two reduction documents), the reduced rotation domain is covered by a binary tree of boxes. Each leaf is either *accepted* (a rational certificate shows that no configuration in the box beats $s^{\ast}$), *discarded* by an exact symmetry rule, *outside* the domain, or *handed to the local lemma*. A separate **replay** re-checks every accepted leaf from the stored multipliers alone (no LP, no floating point) and rebuilds the tree to confirm that it covers the domain.
3. **Local region – local lemma (lower bound near the optimum).** A small neighbourhood of each optimal rotation is closed by an exact zero-order identity plus a positivity check on the faces of a cube in the rotation coordinates. **The local stage stores no box file: re-running the tool is the check.** Acceptance is decided by integers only.
4. **Lean re-check of the arithmetic.** The same certificates were exported (values copied by script, not by hand) and re-checked in Lean 4 (`native_decide`). This checks the arithmetic, the tree structure, and the box counts, independently of the Python code. It does **not** check the mathematical meaning of the checks.

Details: [docs/verification.md](docs/verification.md).

### Size of the certificates

| id | far region: boxes evaluated / accepted / discarded (symmetry) / to local | outside domain | split limit hit | local region |
|---|---|---|---|---|
| cubinoct | 1,499 / 623 (327 + 296, two $\tau$ roots) / – / 1 | 254 (120 + 134) | 0 | 4 faces, 1 box each |
| icoincub ($T=1/2$) | 2,602 / 1,081 / 218 / 8 | – | 0 | 6 faces × 7 boxes (24 accepted leaves), 8 candidates |
| dodinico | 13,356 / 5,558 / 1,118 / 8 | – | 0 | 14 boxes (10 accepted leaves), 40 candidates |
| icoinoct | 1,128 / 426 / 136 / 8 | – | 0 | 24 boxes (15 accepted leaves), 54 candidates |
| icointet | 150,737 evaluated; $R$-leaves: 36,574 accepted / 20,746 discarded / 32 to local; $n$-boxes 324 ok (4 local) + 44 out | – | 0 | 1 local box, 81 candidates, 10 faces, 2,111 accepted (4,212 evaluated) |
| cubintet | 298,739 evaluated; $R$-leaves: 85,522 accepted / 49,803 discarded / 33 to local; $n$-boxes 316 ok (2 local) + 44 out | – | 0 | 2 local boxes (at $I$ and $R_2$), 32 candidates each, 9 + 9 faces, 2,878 accepted |

All replays passed with 0 failures. The far-region counts above are the ones re-run after the review fixes (identical to the original runs). `icoincub` uses `d16d_*` with $T=1/2$; with the default $T$ the box counts differ (2,744 boxes).

### Lean re-check (arithmetic only)

| id | Lean modules (`native_decide`) | wall time | injected-error certificates |
|---|---|---|---|
| cubinoct | 4 | 38 s | lam, drop, ident: all rejected |
| icoincub | 4 | 56 s | lam, drop, ident, disc: all rejected |
| dodinico | 9 | 271 s | lam, drop, ident, disc: all rejected |
| icoinoct | 4 | 37 s | lam, drop, ident, disc, sum, tsmall: all rejected |
| icointet | 28 | 243 s | 7 injected certificates over the two cases (kpair, kval ×2, drop, dropn, ident ×2; kval and ident on both cases): all rejected |
| cubintet | 72 | 725 s | (see icointet row) |

`#print axioms` for every top-level theorem lists only `propext`, `Classical.choice`, `Quot.sound` and the auxiliary axioms `…_native.native_decide.ax_1_1` generated by `native_decide`. No `sorryAx`. Using `native_decide` means trusting the Lean compiler (and `Lean.ofReduceBool`), one level below the kernel. Lean toolchain: `leanprover/lean4:v4.36.0-rc2`, no Mathlib.

## What has not been checked

- **No human review and no formal proof.** The arguments, code, tests and reviews were all written by Claude (an AI model by Anthropic). Each case's arguments were re-derived once by hand by a different Claude model (Fable) acting as reviewer. No human has reviewed any of it.
- The reductions and the meaning of a box acceptance are prose arguments, not formalized. Lean checks arithmetic only (see the "not checked by Lean" list in [verification.md](docs/verification.md#what-lean-does-not-check)).
- Trusted base of the Python checkers: python-flint (`fmpz_mpoly.compose`, `isqrt`), sympy (expansion, simplification, `cancel`, `Poly`), Python `fractions.Fraction`.
- Items the reviewers explicitly did not look at are listed per case in [review_log.md](docs/review_log.md).
- The status of these cases elsewhere (whether others have proofs) was not examined.
- Test m2 with the piece scaled by 0.999 was not run for `cubinoct` (the local checker has no scale parameter).

## Repository layout

- `docs/reduction_symmetric.md` – reduction for centrally symmetric container and piece (cubinoct, icoincub, dodinico, icoinoct)
- `docs/reduction_tetrahedron.md` – reduction for the tetrahedral container (icointet, cubintet)
- `docs/verification.md` – how the box lower bounds, the local lemma and the Lean re-check work; tests; reproduction commands (§7)
- `docs/review_log.md` – summary of the reviews and the fixes made
- `certificates/` – the far-region box records (`*.boxes.jsonl.gz` with their `*.json` parameters), the summaries of the local runs, and `SHA256SUMS`; see [certificates/README.md](certificates/README.md)
- `verifier/` – the Python checkers (stage 0, far region with `replay`, local region, tests):
  - `d16_cover_common.py`, `d16_cover_far.py`, `d16_cover_local.py`, `d16_cover_check_roots.py`, `d16_cover_tests.py` – cubinoct
  - `d16d_common.py`, `d16d_step0.py`, `d16d_far.py`, `d16d_local.py`, `d16d_tests.py` – icoincub, dodinico, icoinoct (and stage 0 of cubinoct)
  - `d28_common.py`, `d28_step0.py`, `d28_far.py`, `d28_local.py`, `d28_tests.py`, `d28_cubintet_beta.json` – icointet, cubintet (`d28_common` imports `d16d_common`)
  - `d16b_common.py`, `d11_step1_cubinoct_n02.py` – independent floating-point formulations used only by test X
- `lean/` – the Lean 4 re-check of the arithmetic (no Mathlib): `PackLean/D16/`, `PackLean/D28/` (exported data and the hand-written checkers `Core.lean`, `CoverCore.lean`), `PackLean/*/Test/` (injected-error certificates), `tools/export_d16.py`, `tools/export_d28.py` (exporters), `build.py` (builds one case module by module); see [lean/README.md](lean/README.md)
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

Cite as: Hirotaka Nakano, *packing-optimality-certificates*, Zenodo, DOI [10.5281/zenodo.24191316](https://doi.org/10.5281/zenodo.24191316) (concept DOI, all versions); v0.1.0: [10.5281/zenodo.24191317](https://doi.org/10.5281/zenodo.24191317).

See [CITATION.cff](CITATION.cff). Please cite these as computer-assisted results, not as a formal proof.
