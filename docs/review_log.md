# Review log

All arguments, code, tests and reviews in this repository were produced by Claude (Anthropic's AI model). "Reviewer" below means a separate session of a Claude model reading the material; it is **not** an independent human review and not a formal proof. Each review re-derived the arguments by hand and read the code; reviewers did not run anything.

Dates are 2026 (local time, Japan).

## Timeline

| date | what | by |
|---|---|---|
| 11-11 night – 11-12 00:05 | `cubinoct_n02`: design, checker (`d16_cover_*`), tests. A domain error in the first design ($\tau\le\sqrt2-1$ instead of $\tau\in[0,1]$) was found during development and fixed before the run that closed. | Claude |
| 11-12 midday | first review of `cubinoct_n02` (logic and code) | Claude, same model family (Opus) |
| 11-12 | `icoincub_n02` (`d16c_*`), then `dodinico_n02` and `icoinoct_n02` with the generalised tool `d16d_*`; icoincub re-run with `d16d_*` ($T=1/2$), identical counts | Claude |
| 11-12 night | `icointet_n02`, then `cubintet_n02` (`d28_*`, generalised to two square roots) | Claude |
| 11-12 night | **reviews by Fable**: cubinoct, the three `d16d_*` cases, the two `d28_*` cases (three separate reviews) | Claude Fable |
| 11-12 night | fixes to the code (below), all cases re-run: identical results | Claude (separate sessions) |
| 11-12 night – late night | Lean re-check of the arithmetic, all six cases | Claude |

## Review 1: `cubinoct_n02` (Fable, 11-12 night)

**Scope.** Reduction (Lemma R, fixing the face, the LP), the symmetry reduction with the corrected domain $D$, far-box acceptance, coverage, the local lemma, the connection of far and local. Files: `d16_cover_common.py`, `d16_cover_far.py`, `d16_cover_local.py` (in full); parameter fields of the three small result files. The earlier review (Opus, 11-12 midday) was not followed; its fix list F1–F4 was checked separately.

**Result.** No fatal gap. 12 findings; none required recomputation.

| # | finding | action |
|---|---|---|
| 1 | replay only printed failures / split-limit leaves instead of stopping | replay now raises; run fails on split limit or LP failure |
| 2 | replay read the $\tau$ roots, $\tau_{\max}$ and $L$ from the record; no mechanical check that the two roots join to $[0,1]$ and $\tau_{\max}=1$ | new script `d16_cover_check_roots.py` |
| 3 | the constant $L$ was in three places | defined once in `d16_cover_common.py`; replay checks the record against it |
| 4 | local `check_box` lacked the "box width is a positive even integer" check | added |
| 5 | `int(c * den)` not guarded (correct by construction) | guard added |
| 6 | the design text still had the wrong domain | public text uses only the corrected $D$ ([reduction_symmetric.md §8](reduction_symmetric.md#8-cubinoct_n02-dedicated-coordinates)) |
| 7 | a V-shape growth constant was stated but not proved | public text claims only an isolated minimum |
| 8 | the local lemma was stated in a form that was not the one proved | stated as $F_c\ge\rho G_c$, $G_c>0$ on four faces |
| 9 | the description of the box bound did not match the code | described as in the code (six polynomials, coefficient bounds, $S<\bar S$) |
| 10 | uniqueness of the optimal configuration is a hand argument | separated as a supplement, not part of the claim |
| 11 | local stage has no record; trusted base not stated | stated ([verification.md](verification.md)) |
| 12 | (2 ⇒ 1) of Lemma R needed the line $-K'=R(-K)-t=RK-t$ | added |

After fixes 1–5: far replay 327 + 296 = 623 accepted, 0 failed, split limit 0 (1,499 evaluated); root check OK; local closed with one box on each of the four faces. Same as before.

**Not examined by this review:** `d16_cover_tests.py`, `d16_cover_preview.py`, the contents of the box records, re-running the computations, the derivation of the directional-derivative formula (not used), the correctness of python-flint / sympy / `Fraction`, the arithmetic (left to Lean), the status of the problem elsewhere. Test m2 with factor 0.999 was not run.

## Review 2: `icoincub_n02`, `dodinico_n02`, `icoinoct_n02` (Fable, 11-12 night)

**Scope.** Reduction for general symmetric container and piece, the discard rule, the translation range, far acceptance and coverage, the local lemma, the connection. Files: `d16d_common.py`, `d16d_far.py`, `d16d_local.py` (in full), and `analyse` in `d16d_step0.py` (which builds the local candidates).

**Result.** No fatal gap. 8 findings; none required recomputation.

| # | finding | action |
|---|---|---|
| 1 | the code checked that images of $n_0$ are support faces, but not that the rotation images are *all* faces | added: number of images of $n_0$ under $\det=+1$ symmetries = number of faces of the convex hull (20, 12, 20 agree) |
| 2 | "closed" combines stage 0, far replay and the local re-run; this was not stated | stated ([verification.md §1](verification.md#1-structure-of-one-proof)) |
| 3 | the reason the discard rule is sound without a complete symmetry list was not written | written ([reduction_symmetric.md §4](reduction_symmetric.md#4-symmetry-reduction-and-the-discard-rule)) |
| 4 | icoincub numbers and tests came from the older `d16c_*` tool | icoincub reported with `d16d_*`, $T=1/2$; `d16d_*` tests run for icoincub |
| 5 | outdated counts in the design text | only corrected counts are used (contacts 6 / 10 / 12, candidates 8 / 40 / 54, active faces 3 / 5 / 4) |
| 6 | the inradius argument for the translation range relies on the face orbit | stated |
| 7 | wording of the claim (touching allowed, reflections, uniqueness) | stated in the README |
| 8 | an unused expression in `sstar_upper` | removed |

After fixes 1 and 8 all three cases were re-run (stage 0, far run and replay, local): counts and "closed" identical (icoincub $T=1/2$: 2,602 / 1,081 / 218 / 8, local 6 × 7; dodinico 13,356 / 5,558 / 1,118 / 8; icoinoct 1,128 / 426 / 136 / 8; split limit 0; replay passed).

**Not examined by this review:** `d16d_step0.py` other than `analyse`, `d16d_tests.py`, the older tools `d16c_*` and `d16b_*`, the correctness of python-flint / sympy / `Fraction`, the contents of the records, re-running, the arithmetic (left to Lean), the status elsewhere. That the icosahedron and dodecahedron have face-transitive rotation groups was taken as a known fact by the reviewer (the code check was added afterwards, finding 1).

## Review 3: `icointet_n02`, `cubintet_n02` (Fable, 11-12 night)

**Scope.** T1–T4, the domain $D_n$ and symmetries, far acceptance, the local lemma, the connection. Files: `d28_common.py`, `d28_far.py`, `d28_local.py` (acceptance parts), `exact_point` in `d28_step0.py` (upper bound).

**Result.** No fatal gap. 7 findings; none required recomputation.

| # | finding | action |
|---|---|---|
| 1 | `zranges` in `d28_local.py` would leak directions if a range end were not $-1$, $0$ or $+1$ (not the case for the two cases) | check strengthened; re-run: 2,111 and 2,878 accepted, identical |
| 2 | earlier text suggested the result also settles $n=3,4$ for icointet | stated as lower bound only; equality for $n=3,4$ not proved |
| 3 | two different-looking descriptions of $\kappa$ at box boundaries | one definition: maximum over covering boxes ([reduction_tetrahedron.md §6](reduction_tetrahedron.md#6-domain-of-n-and-the-definition-of-kappa)) |
| 4 | domain of $\kappa$ (cube surface, $T_d$ extension, unnormalised $n$) not written | written |
| 5 | the discard rule was justified only by reference | written out |
| 6 | a floating-point value $\max_R s_1\approx4.47$ appeared among the proof steps | removed from the proof; noted as unused |
| 7 | local stage has no record | stated |

**Not examined by this review:** `sym_group_exact` (exact enumeration of the piece symmetries), `d28_tests.py`, `d28_preview.py`, the contents of the records, re-running, the correctness of python-flint / sympy / `Fraction`, the arithmetic (left to Lean), the status elsewhere.

## Lean re-check (11-12 night – late night)

The arithmetic of all six certificates was re-checked in Lean 4 with `native_decide`: all theorems pass, `#print axioms` shows no `sorryAx`, and all injected-error certificates were rejected. Details and limits in [verification.md §6](verification.md#6-lean-re-check).

## What would strengthen this

- A review by a human, or by a different model family.
- Formalisation of the reductions and the meaning of the box checks.
- Running the Lean re-check entirely in the kernel (`decide +kernel`), estimated at many hours per case.

## Re-generation with the English code (2026-11-13)

Re-generation with the English code (2026-11-13): all six certificates reproduced. Each case was re-run from scratch with the translated `verifier/` (stage 0, far region, local region) in a scratch directory and compared with `certificates/` field by field. All counts and parameters in the `.json` summaries agree (only the run times and the translated prose inside `"info"` differ), and the decompressed `.boxes.jsonl.gz` records have the same SHA-256 as the stored ones, line order included (no sorting was needed, also for the parallel d28 runs). The replay of `tests/replay_all.py` passes on the re-generated records; re-exporting the Lean certificates gives files identical to `lean/PackLean/` apart from line endings; `lean/build.py all` passes (131/131) and `lean/build.py inject` rejects all 24 injected-error certificates; the Python tests of all six cases give the expected results. No file in `verifier/`, `certificates/` or `lean/PackLean/` was changed.
