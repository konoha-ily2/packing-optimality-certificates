# Review log

All arguments, code, tests and reviews in this repository were produced by Claude (Anthropic's AI model). "Reviewer" below means a separate session of a Claude model reading the material; it is **not** an independent human review and not a formal proof. Each review re-derived the arguments by hand and read the code. Reviewers did not run the verifiers, the replays or the tests, with the following exceptions, stated in each section: Review 10 re-ran two small scripts on the spot (without writing files); Reviews 13 and 15 re-ran some replays and tests (without writing files); Review 16 ran a floating-point check of its own that does not use the project's code; Reviews 4, 6, 7 and 9 also looked at record fields or file timestamps, and compared numbers in the records with the notes.

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
| 11-12 night – 11-13 | `icoindod_n02` (with `d16d_*`, field $\mathbb{Q}(\sqrt5)$) and `octindod_n02` (new tool `d16e_*`, field $\mathbb{Q}(\sqrt2,\sqrt5)$): design, checker, tests. Regression: with one generator `d16e_*` gives the same box counts as `d16d_*` on four earlier cases. | Claude |
| 11-13 | **Review 4 by Fable**: `icoindod_n02`, `octindod_n02` (9 findings) | Claude Fable |
| 11-13 | fixes to `d16e_common.py` (three self-checks added), both cases re-run (stage 0, far run, replay, local): identical counts; wording fixes written into the public notes | Claude (separate session) |
| 11-13 morning | Lean re-check of `icoindod_n02` and `octindod_n02` (arithmetic only) | Claude |
| 11-13 early morning – morning | `octintet_n02` (octahedron pair in a tetrahedron, $s^\ast=3$): design of the $g$-form, stage 0 (exact substitution, LP checks), then local lemmas J and C, far region, tests (about 25 minutes of computation) | Claude |
| 11-13 | **Review 7 by Fable**: `octintet_n02`, the $g\ge0$ argument (9 findings) | Claude Fable |
| 11-13 | fixes to the tests and wording of `octintet_n02`; main records unchanged; `replay_all` passes | Claude (separate session) |
| 11-13 | **Review 8 by Fable**: the bridge T1–T4 applied to `octintet_n02`, $\kappa=(\sqrt2/4)y$ (4 findings) | Claude Fable |
| 11-13 | fixes: test K0 added; wording of the bridge written into the notes | Claude (separate session) |
| 11-13 | `cubinico_n02` (cube pair in an icosahedron, $s^\ast=(49\sqrt5-53)/38$): new local tool `d30_*` built on `d16e_*` (stage 0 and 1 on `cubinoct`, then stage 2 on `cubinico`: stage 0 exact substitution, local, far, tests) | Claude |
| 11-13 | **Review 5 by Fable**: `d30` stages 0 and 1 (13 findings) | Claude Fable |
| 11-13 | fixes F1–F7 of Review 5 (checked on `cubinoct`), then `cubinico` run to the end | Claude (separate session) |
| 11-13 | **Review 6 by Fable**: `cubinico_n02` stage 2 and the fixes of Review 5 (12 findings) | Claude Fable |
| 11-13 | fixes G1–G7 of Review 6, including a check of the record without Lemma W (`--no-lp`) | Claude (separate session) |
| 11-13 midday | Lean re-check of `octintet_n02` (arithmetic only) | Claude |
| 11-13 midday | Lean re-check of `cubinico_n02` (record without Lemma W, arithmetic only) | Claude |
| 11-13 midday | plateau for $n=3,4$ (`icointet`, `octintet`): upper bounds by exact substitution; Lean re-check (`decide +kernel`) | Claude |
| 11-13 | **Review 9 by Fable**: the upper bounds for $n=3,4$ (10 findings) | Claude Fable |
| 11-13 | fixes of Review 9 (injected-error variants added, float guard, wording) | Claude (separate session) |
| 11-13 | $n=5$ (`icointet`, `octintet`): lower bound $L\ge 20r/\sqrt6$ by pigeonhole, upper bound by exact substitution; Lean re-check (`decide +kernel`) | Claude |
| 11-13 | **Review 10 by Fable**: $n=5$, lower and upper bound (8 findings) | Claude Fable |
| 11-13 | fixes of Review 10 (notes and script comments); `icointet` $n=5$ injected-error variants brought to the same set as `octintet` in the v0.2.0 bundle | Claude (separate sessions) |
| 11-13 night | `tetintet_n02` (tetrahedron pair in a tetrahedron): design (constraint $s_1\le\bar s$ per leaf, local lemma with a nonnegative zero-order part, seven centres), stage 0, local, far, upper bound, tests (about 45 minutes of computation) | Claude |
| 11-13 night | **Review 12 by Fable**: `tetintet_n02` (10 findings), then fixes R1–R4 (notes and tests; records unchanged) | Claude Fable; Claude (separate session) |
| 11-13 evening – night | `octinico_n02` (octahedron pair in an icosahedron): tube coordinates around the curve of minimisers, weighted local certificate with paired lifting (`d30_s3_*`), far region, tests | Claude |
| 11-13 night | **Review 11 by Fable**: `octinico_n02` (9 findings), then fixes H1–H5 (local stage re-run, `d30_s3_claim.py`) | Claude Fable; Claude (separate session) |
| 11-14 | Lean re-check of `octinico_n02` and `tetintet_n02` (arithmetic only); re-generation with the English code; v0.3.0 bundle | Claude |
| 11-13 | `tetintet_n05` (five tetrahedra in a tetrahedron, $s^\ast=2$): the cell and T2–T4 restricted to it, exact check of the optimal configurations (stage 0a) | Claude |
| 11-13 | **Review 14 by Fable**: `tetintet_n05`, the restricted reduction and stage 0a (10 findings) | Claude Fable |
| 11-13 – 11-14 early morning | `tetintet_n05`: the $n$ chart with $C_{3v}$, local region (five centres), far region ($R_0=1/16$), tests | Claude |
| 11-14 early morning | `dodintet_n02` (dodecahedron pair in a tetrahedron): stage 0 (exact configuration, octic for $s_0/(2\sqrt2)$), local (two tubes), far, upper bound, tests | Claude |
| 11-14 morning | **Review 13 by Fable**: `dodintet_n02` (14 findings: 0 fatal, 1 important, 7 fixable, 6 wording), then fixes (notes, one-line checks, tests t4 and W2; records unchanged) | Claude Fable; Claude |
| 11-14 morning | **Review 15 by Fable**: `tetintet_n05`, local and far regions (11 findings: 0 fatal, 2 important, 3 fixable, 6 wording), then fixes (`region_check`, tests X, Xb and P, `d37_tet_n05_replay_both.py`; records unchanged) | Claude Fable; Claude |
| 11-14 morning | `dodincub_n02` and `dodinoct_n02` (dodecahedron pairs in a cube and in an octahedron): the tools of cubinico with a new problem definition `d30x_problems.py`; stage 0, local, far, claim, tests | Claude |
| 11-14 morning | **Review 16 by Fable**: `dodincub_n02`, `dodinoct_n02` (9 findings: 0 fatal, 4 fixable, 5 wording), then fixes (dodinoct re-done with $\rho_0=1/32$ and single candidates only, controls, a run log of the wrapper) | Claude Fable; Claude |
| 11-14 evening – night | Lean re-check of `dodincub_n02`, `dodinoct_n02`, `dodintet_n02` and `tetintet_n05` (arithmetic only); re-generation with the English code; the four cases added to the v0.3.0 bundle | Claude |

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

## Review 4: `icoindod_n02`, `octindod_n02` (Fable, 11-13)

**Scope.** Section 15 of the design (sections 14 and 10 only where relevant), the notes, `d16e_common.py`, `d16e_far.py`, `d16e_local.py`, `d16e_step0.py` (all in full). The model for the review was the earlier review of the `d16d_*` tool. Points checked by hand: the generalisation of the number representation to $\mathbb{Q}(\sqrt2,\sqrt5)$ (multiplication, zero test, division by conjugates, sign by interval enclosure, integer lower bound, integer scaling of polynomials), the exact upper bound ($R^\ast$, $t^\ast$, $S^\ast$ checked by hand for both cases), the symmetry group (360 = 120 × 6 ÷ 2; the 6 elements fixing $R^\ast$ are excluded, which is the safe side), the connection of far and local region, the strength of the claim.

**Result.** No fatal gap. 9 findings: 0 fatal, 3 fixable, 6 wording. None required recomputation.

| # | finding | action |
|---|---|---|
| 1 | (fixable) the face-orbit check added after the `d16d_*` review (number of images of $n_0$ under $\det=+1$ symmetries = number of faces of the hull) was missing in `d16e_common.py`, which is a copy made before that fix. Both cases satisfy it (8 and 20) | check copied into `d16e_common.py` (`_hull_faces` and two `need` lines); both cases re-run, identical counts |
| 2 | (fixable) the notes said acceptance is decided by integer lower bounds and not by the sign of the field arithmetic. Too strong: the premises ($\bar S\ge S^\ast$, the $T$ check, vertices of $P$, symmetry matrices, $\varphi(I)=S^\ast$, the local inverse matrix) rely on exact sign, equality and division in the field. Division and inverse were correct as far as read, but not self-checked | `QD.__truediv__` now checks quotient × denominator = numerator; `inv3` checks $M M^{-1}=I$; wording: the acceptance inequality is on integers, the premises use exact field arithmetic with self-checks |
| 3 | (fixable) no output of the replay (passed in 14 s and 35 s) was stored | replay outputs stored (`*_replay.out`, UTF-8) when the cases were re-run after fixes 1–2 |
| 4 | (wording) the regression (four earlier cases give identical box counts) only shows that with one generator the new tool behaves like the old one. The parts specific to two generators ($\sqrt2\cdot\sqrt{10}$ products, two-step conjugate division, the $\sqrt{10}$ enclosure) are not covered by it | stated in the public notes: support for the two-generator part is an independent comparison with sympy (8 zero-order identities and 48 first-order terms) and the tests of `octindod` |
| 5 | (wording) the local stage keeps no box record; "closed" combines three parts (stage 0, far replay, local re-run) | public notes list the three commands and state that far and local regions share chart 0, $\rho_0=1/16$ and the problem definition |
| 6 | (wording) agreement of $s^\ast$ with the closed form of the record was stated as a 100-digit numerical agreement | replaced by the exact identity $\sqrt{3-\sqrt5}=(\sqrt{10}-\sqrt2)/2$ |
| 7 | (wording) the claim should say what "minimal" means: touching allowed, same value with reflections allowed, uniqueness neither claimed nor shown; the proof uses that the piece faces form one orbit and that the piece is point symmetric | written next to the claim in the public notes |
| 8 | (wording) which tool is the reference: `icoindod` with `d16d_*` ($\mathbb{Q}(\sqrt5)$), `octindod` with `d16e_*` ($\mathbb{Q}(\sqrt2,\sqrt5)$); the `d16e_*` run of `icoindod` is a regression. A comment "$k\le2$" had no check behind it | stated; comment changed to "tried $k\le 2$" |
| 9 | (wording) eight old regression `.out` files are garbled; the PSLQ script that found $R^\ast$ and the random cross-check of the field arithmetic were not kept | only the `.json`, `.boxes` and the new `*_chk.out`, `*_replay.out` (UTF-8) are included; how $R^\ast$ was found does not matter, because stage 0 checks orthogonality, $\det=1$ and $\varphi(I)=S^\ast$ exactly |

After fixes 1–3 both cases were re-run (stage 0, far run, replay, local). `octindod`: far 4,600 evaluated / 1,826 accepted / 472 discarded / 8 to local, split limit 0, LP failures 0, replay passed, local 40 boxes on six faces (7 + 7 + 5 + 7 + 7 + 7), split limit 0. `icoindod` (`d16d_*`): far 2,204 / 892 / 208 / 8, split limit 0, replay passed, local 14 boxes. Stage 0 `.json` files identical to before (apart from times).

**Not examined by this review:** `d16e_tests.py` (only the first 60 lines), the body of `d16d_*` (covered by the earlier review), the contents of the box records (only the numbers were compared with the notes), running anything (no verifier, replay or test was run by the reviewer), the correctness of python-flint (`compose`, `isqrt`), sympy and `Fraction`, details of the arithmetic (checked by hand only in a few places; left to Lean), the status of the problem elsewhere. That the octahedron and icosahedron have rotation groups acting transitively on the faces was used as a known fact (the code check was added afterwards, finding 1).

## Review 5: tool `d30_*` for the local region, stages 0 and 1 (Fable, 11-13)

**Scope.** The design of `d30` (sections 2, 3, 7), the notes, `d30_local.py` and `d30_tests.py` (in full), `d16e_local.py` up to `build`, `analyse` of `d16e_step0.py`, `lower_bound_field` and `lb_shift` of `d16e_common.py`. The new tool replaces the per-face single vertex choice of `d16e_*` by a weighted combination of candidates (Lemma W) and an optional pair-lifting; it was first run on `cubinoct`. The `d16e_*` interval tools (square-root enclosure, `phi_exact`, Lemma R) were taken from Review 4 and not re-read.

**Result.** No fatal gap. 13 findings: 0 fatal, 8 fixable, 5 wording. The reviewer read the paper statement of Lemma W against the code (direction of inequalities, per-(face, vertex) non-negative terms, quaternion coordinates, the pair lifting, the acceptance test, uniformity over a box, zero-order identity) and found them consistent; floating point enters only in the choice of candidates, not in acceptance. Consequence stated by the reviewer: the closing of the local region of `cubinoct` (6 boxes) holds provided the `d16e_*` interval tools are correct. The tests, however, only caught "one coarse fault", and more tests were requested before stage 2.

| # | finding | action |
|---|---|---|
| F1 | (fixable) the pair lifting uses that the container has a face $-f$ for every face $f$ and the piece a vertex $-v$ for every vertex $v$; this was not checked (true for the four solids used, false for a tetrahedron) | `need` that checks both; otherwise no lifting is used |
| F2 | (fixable) box centre and half-width use `//2`; if the sum of the ends were odd the box would not cover the original. Not the case for the constants used | `need` on parity of sum and width |
| F3 | (fixable) test W silently skipped points not found in any accepted box | for a closed record `not_found == 0` is a pass condition; `cubinico`: 0 |
| F4 | (fixable) test W samples uniformly inside boxes only; sign problems are expected at corners and for $\rho\to0$ | per box: 8 corners, 6 face centres, and $\rho\in\{2^{-30},2^{-20},\text{top}\}\times 9$ points |
| F5 | (fixable) only one injected-error variant (`--fault-nolift`), a coarse one | tests X1–X4 added (below) |
| F6 | (fixable) acceptance was in the same function that chooses certificates; no entry to re-check a record | exact check split into `check_single` and `check_mix`; `--verify record.json` re-checks every box and that the boxes form a binary-tree cover of $[0,\rho_0]\times[-1,1]^2$ with the right total volume |
| F7 | (fixable) the LP could use the lifting without need | objective gets $+10^{-3}\sum c$; option `--no-lift` |
| F8 | (fixable) for another pair (`octinico`) the growth just outside the ends of a family of minima was unmeasured | measured in floating point (see notes): growth is linear at both ends, $\sigma_1\ge 0.285$; not used in any acceptance and not part of the claims of this repository |
| W1 | (wording) the design said one vertex per face and non-negative $a^{(k)}$ per candidate; what is needed is one non-negative coefficient per (face, vertex) term | requested for the design text of Lemma W (W1–W5 concern Lemma W and the design notes; the claim of this repository does not use Lemma W, see Review 6). Whether each of W1–W5 was applied to the design text is not tracked here |
| W2 | (wording) "$\Sigma a>0$" is redundant (follows from $a\ge0$ and $\Phi>0$) | one line in the design |
| W3 | (wording) "$2(S^\ast-h_f)$ is a constant" holds at $R^\ast$ only | corrected to "value at $R^\ast$" |
| W4 | (wording) for the three pairs of type Q, "fewer than 7 active rows" and "$\sigma_1=0$" were listed side by side; the first implies the second by a counting argument | argument added to the notes; "isolated" kept as a guess |
| W5 | (wording) three "sharpness" numbers in the roadmap come from second-order differences | one-line note in the design |

Results of the fixes (stage 2-0, on `cubinoct`): closes with 6 boxes (one per face) and zero lifted boxes (21.5 s); also with `--no-lift`; `--verify` passes on both the new record and the old one; test W 396 points, 0 violations, `not_found` 0; X3 (a) rejected, (b) accepted, (c) rejected, (d) rejected, as expected; X1 and X2 (rho_pos) caught by test W on hand-made certificates in small boxes (41/41 and 23/23 points), X2 (rho_else) does not close; regression of five earlier pairs with `--no-lp`: identical to `d16e_*`.

**Not examined by this review:** running anything; the result `.json` and `.tsv` files (numbers were taken from the notes); the `d16e_*` interval tools (earlier review); the type classification of stage 0 beyond the counting argument of W4; python-flint, sympy, `Fraction`.

## Review 6: `cubinico_n02` (Fable, 11-13)

**Scope.** The claim $s^\ast=(49\sqrt5-53)/38$ for `cubinico_n02` (cube pair in an icosahedron, tool `d30_*` on top of `d16e_*`), and the fixes F1–F7 of Review 5. Read: notes of stage 2, the design, `d30_local.py`, `d30_problems.py`, `d30_far.py`, `d30_tests.py`, `d30_tests_full.py`, `d16e_common.py` (field arithmetic, bounds, `Problem`), `d16e_far.py`, `d16e_local.py`, `d16e_step0.py`, Lemma R. Records: the local record (with certificates), its `_verify`, the far record and the `.boxes` rows of $L$ and charts 1–3, the test records, and file timestamps.

**Result.** No fatal gap. 12 findings: 0 fatal, 7 fixable, 5 wording. The reviewer found that acceptance is decided by exact arithmetic only, that the boundary between local and far region has no gap, and that the exact substitution in $\mathbb{Q}(\sqrt5)$ is right. Two observations shaped the follow-up. (i) In the weighted local record all 14 weighted boxes use no lifting and no $a/\rho$ branch, so the weighted certificate relies on Lemma W (i) (weights) only. (ii) The controls specific to `cubinico` were thin (only zero-order identities). The most important fix requested was to verify the record made with `--no-lp` (single candidates only, as in `d16e_*`): if it passes, the `cubinico` claim stands on the checks already reviewed in Review 4, without Lemma W, `check_mix` or the LP.

**The claim for `cubinico_n02` rests on** the record without Lemma W (`d30_cubinico_local_r16_nolp.json`: 74 accepted local boxes, all of kind *single*, 142 boxes evaluated) **plus the far region** (`d30_cubinico_far`: 9,970 boxes evaluated, 4,194 accepted, 789 discarded by symmetry, 8 to the local region, split limit 0, LP failures 0). The weighted record (50 accepted boxes, 14 of them weighted) is another certificate of the same statement and is not relied upon.

| # | finding | action |
|---|---|---|
| G1 | (fixable) `verify` did not require the record's `scale` to be 1 (a shrunken piece could pass) | `need(scale == 1)` |
| G2 | (fixable) agreement of $\rho_0$, problem and denominator between local and far records was checked only in a test script | new script `d30_claim.py`: local `verify`, far cover check and replay, and `need` on problem, $\rho_0$, `DEN_exp`, scale 1, no fault flags, both closed, volume of the $L$ boxes $=(2\rho_0)^3$; result in one json |
| G3 | (fixable) some stage 2-0 records were made with a slightly earlier version of the code (timestamps); the `cubinico` records are all later, so the claim is not affected | `cubinoct` re-run with the final code (6 boxes, 0 lifted, `--verify` passes) and the regression of five earlier pairs re-run: identical to the numbers in the notes |
| G4 | (fixable) no control showing the first-order checks are effective on `cubinico` itself | X tests run on `cubinico`: X3 (a) rejected, (b) accepted, (c) rejected, (d) rejected; X2 has no site (no face with multiplier 0); X1 did not give a control (the chosen small box fails at the weights); tied-vertex swap: all 14 weighted boxes rejected, and in all 14 test W finds a point with $F\le0$ (so rejection was necessary); parent test: a box certificate applied to its parent is accepted for 2 of 50 boxes (both weighted) and for 0 single ones; for those 2 the single candidates and the LP weights of the parent fail, so no inconsistency |
| G5 | (fixable) no controls that damaged records are rejected | corrupted copies: (a) one box removed, (b) a box twice, (f) one far leaf removed: exception; (d) a single candidate index changed: rejected; (g) a far $\lambda$ taken from another box: replay fails. (c) two weighted certificates swapped and (e) one weight index changed: **still pass**, and test W (41 points) finds no violation in these boxes ("coincidentally valid"). **A defect was found**: with one leaf missing, `verify` (and the same code in `d16e_far.replay`) kept splitting the missing branch instead of failing, so it did not terminate (stopped after more than 10 minutes). This does not make a wrong record pass. Fixed by an ancestor check in `d30_local.py` and a separate `d30_far.cover_check` that runs before the replay; stage B was repeated after the fix |
| G6 | (fixable) the `--no-lp` record had not been through `verify` | **passes: 74 boxes, all single, all six faces covered** (33 s); `d30_claim.py` on this record passes (local 74 single; far 4,194 accepted / 789 discarded / 8 $L$ / 0 failures; $L$ volume right; 68 s); on the weighted record also passes (50 = 36 single + 14 weighted; 66 s) |
| G7 | (fixable, not relevant to `cubinico`) no example yet of the correct version accepting a certificate with lifting $c>0$ on the $a/\rho$ branch | hand-built certificate on `cubinoct` (face $y=+1$, one candidate, small box, $c=2253/2^{20}$): accepted by the correct version, rejected by the `rho_else` variant, test W 41 points 0 violations; first accepted example of that branch |
| V1 | (wording) what the claim depends on was not in one place | written as one list: Lemma R, far region (`d16e_*` tools), local region (single candidates; for the weighted record only weights), python-flint, sympy, `Fraction`; the single-candidate record first |
| V2 | (wording) "1 process" in the notes, but some runs overlapped | corrected |
| V3 | (wording) records did not keep which code and $S^\ast$, $R^\ast$ made them | params now hold $S^\ast$, $R^\ast$ strings and SHA-256 of `d30_local.py`, `d30_problems.py`, `d16e_common.py` (for records re-run after the fix; existing records not rebuilt) |
| V4 | (wording) acceptance function `check_mix` has an argument `skip_g` | annotated: not passed by `verify` or `run`; if passed, it is not an acceptance |
| V5 | (wording) "charts 1–3 are almost all discarded" | "all": 0 accepted, 3 + 2 + 2 discarded |

Test W on `cubinico`: 1,990 points (including corners and small $\rho$ of all 50 boxes of the weighted record), 0 violations, `not_found` 0. Full test set U, S, V, C, P, W, X, m1–m5 as expected (e.g. test C: 300 boxes, 0 accepted; test P: 0 violations).

**Not examined by this review:** running anything (`verify`, replay and tests were not re-run; records and timestamps were read), the `d16e_*` interval tools and the far-region logic beyond the boundary parts (`inside_L`, `check_box`, `check_discard`, `replay`), python-flint, sympy and `Fraction`, any check by a different model family, a human or Lean at that time.

## Review 7: `octintet_n02` (Fable, 11-13)

**Scope.** The global argument of `octintet_n02` (octahedron pair in a tetrahedron, $s^\ast=3$): the design (sections 8–10), the notes, and in full `d31_common.py`, `d31_local.py`, `d31_far.py`; `d31_tests.py` only the list of functions and the $n2$ test; of the records only `params` and `closed`. The argument is written in the $g$-form (a function $g\ge0$ on $D_n\times SO(3)$; called $\Gamma$ in [reduction_octintet.md](reduction_octintet.md)): lemma J (edge neighbourhood), lemma C (circle tube), far region, joint and replay.

**Result.** No fatal gap. 9 findings: 0 fatal, 5 fixable, 4 wording. The mechanical part (J, C, far, joint, replay) supports "$g\ge0$ on all of $D_n\times SO(3)$"; acceptance uses integers only and floating point only for choosing candidates. The weak points are outside the machinery: (a) the reduction from $g\ge0$ to $s^\ast\ge3$ (T1–T4 of the tetrahedron reduction; not read by this review; see Review 8), (b) the identity connecting $F$ and $g$, which had only 20 rational points and a hand calculation. The test $n2$ was not a real control.

| # | finding | action |
|---|---|---|
| 1 | (fixable) test $n2$ narrowed the domain, so it closed trivially and put no fault in; neither "J too wide" nor "local does not cover the equality set" was tested | tests added: $n2a$ ($U_J=1/16$, $U_1=1/8$): does not close (split limit 2; the box $[0,1/128]^2$ containing $(0,0)$ is open; witness $n=n_B$, $q=(1,3/32,3/32,3/32)$, $g=0$ exactly); $n2b$ ($K_J=1$): does not close (limit 128; witness $(h,k')=(0,3/2)$, $R=I$, $g=0$); $n2c$ ($U_J=3/8$): does not close (limit 5,084 on one face, time out; witness: all 9 candidates with the right sign of $E$ have $\Lambda_c<0$, largest $-25771/524288$, exact; no accepted leaf contains this point). The old $n2$ was renamed a robustness check |
| 2 | (fixable) the bridge from $g$ to the $F$ of the reduction was only a hand calculation plus 20 rational points | test F0: with $N_R(n)$, $N_R(b_f)$ as symbols, $F-(\sqrt2/4)y-(\sqrt2/2)g\equiv0$ as an identity of coefficients; $\tilde m=n\cdot b_2$ on $D_n$ from non-negative combinations of the inequalities of $D_n$ |
| 3 | (wording) "closed: $s^\ast=3$" assumes T1–T4 of the reduction; the sentence did not say so, and whether $\kappa=(\sqrt2/4)y$ was within the earlier review of the reduction was unclear | conclusion now reads "assuming T1–T4 of the tetrahedron reduction"; this application was reviewed afterwards (Review 8) |
| 4 | (fixable) the three records (J, C, far) are each checked against `d31_common` at replay; replaying all three in one environment was left to the procedure | `replay_all` added (compares the headers of the three records and runs the three replays); test m7: replaying the far record with `D31_U_J=5/32` fails with "premise of the record", as expected; `replay_all` passes on the main records |
| 5 | (fixable) no test of the joint between the far-region $L$ leaves and the local leaves (random points never hit an $L$ leaf) | test L1: the centres of all 824 $L$ leaves lie in local leaves (J 789, C 35); in the chosen candidate $G_c\ge0$ and $g\ge G_c$ exactly |
| 6 | (wording) "inside $L$ equality occurs only on $Z$" depends on the roots of $E_c$ in $u$ (1/3, 1/5, …) not meeting leaf ends; not checked by a record | stated as not checked by machine (roots lie outside $U_J=5/16$ or between dyadic ends, by hand); no stronger claim about equality sets |
| 7 | (wording) a line "stage 0 only; stages 1 onward not reached" remained | marked as describing stage 0 |
| 8 | (fixable) no counterpart of tests m2/m6; the local replay rebuilds polynomials with the same sympy code, so a fault in building them would not be found by replay | test m6′: (a) a $\det=-1$ matrix in the table of piece rotations is **not** found by the $g$ comparison (signed permutations preserve $\|\cdot\|_\infty$) but by the $\det$ check; (b) a rotation about $z$ with $\cos=3/5$ is rejected in 30 of 30 comparisons; test P2: for 300 + 300 points of J and C, $G_c$ computed directly from the rotation matrix agrees exactly with $P_c/|q|^2$ (600/600), no $G_c<0$, no $g<G_c$ |
| 9 | (wording) strength of the claim was not in one place | four-row table: lower bound ($g\ge0$, non-strict, global), upper bound (exact substitution), uniqueness (not claimed), status (one review by a model of the same family, no third party) |

Main records (unchanged by the fixes): J 10,716 boxes evaluated, 5,363 accepted, split limit 0; C 4,764 / 2,388, split limit 0; far: $n$-boxes 319 ok + 17 out, $R$-leaves 49,568 accepted / 10,325 discarded / 824 to local, 351,533 boxes evaluated, split limit 0; all three replays pass. Test $n1$ (sign of $E$ reversed) is caught (298 of 300 points with $G_c<0$); during the tests the replay cover check was also found to keep splitting a missing branch without end (as later in `cubinico`); fixed by failing beyond the deepest leaf.

**Not examined by this review:** T1–T4 and the reduction to $D_n$ (so $s^\ast\ge3$ rests on them), the body of `d31_step0.py` and the bodies of the tests in `d31_tests.py`, the contents of the leaf records, running the replays or anything else, the correctness of sympy and python-flint. The result that test $n2c$ must fail was, at the time of the review, an expectation from the floating-point LP of stage 0; the exact witness was produced afterwards.

## Review 8: the bridge T1–T4 for `octintet_n02` (Fable, 11-13)

**Scope.** The step from "$g\ge0$ on $D_n\times SO(3)$" to "$s^\ast\ge3$" (the tetrahedron reduction applied to the octahedron): the scale of the formula, $\tilde m=1+x-y$ and $w_f\ge0$ on $D_n$, invariance under the piece symmetries and $-I$, $\kappa=(\sqrt2/4)y$ with $k_N=0$ and $\kappa(n)+\kappa(\sigma n)=0$, and a cross-check through the optimal configuration. Read: the earlier review of the reduction, sections 1.3, 2, 3, 4.2 of the reduction design, the design of `octintet`, Review 7, the relevant notes, test S of `d31_tests.py`, constants and `F_sym` of `d28_oct_step0.py`. The part of the argument that depends on the piece uses only three properties of the piece (closed convex with interior, point symmetric, $k$ a rotation of the piece), all true for the octahedron.

**Result.** No fatal gap. 4 findings: 0 fatal, 1 fixable, 3 wording. All items asked for were re-derived by hand with the numbers of `octintet` and agreed. One cross-check that does not go through the reduction: for the upper-bound configuration the separating plane between the two pieces has height exactly $(\sqrt2/4)y$, which confirms coefficient and sign of $\kappa$. The upper bound (exact substitution) does not depend on the bridge.

| # | finding | action |
|---|---|---|
| 1 | (fixable, no effect on the results) no machine check of how $\kappa$ is extended to the whole cube surface by $T_d$ ("$D_n$ maps every direction to exactly one point", "$-n$ maps to $(x,-y,1)$") | test K0: 200 rational points of the cube surface, the images in $D_n$ under the 24 elements of $T_d$ have a single $y$, the image of $-n$ has $-y$, $\kappa(n)+\kappa(-n)=0$ exactly: **0 mismatches, 0.4 s**; the other tests were not re-run at that time (they are re-run for this release, see the last section) |
| 2 | (wording) text still said the application to `octintet` was unreviewed; also the remark that far only needs $k_{\sigma N}=-k_N\ne0$ is not used in the final argument ($\kappa$ is one linear form on the whole domain, no per-box constant) | corrected; one line added |
| 3 | (wording) the outline of the bridge is spread over three documents | five-line outline written in the notes: (i) form of (K) and scale, (ii) $\tilde m$ and $w_f\ge0$ on $D_n$, (iii) $\kappa$ extended by $T_d$, (iv) $g_0$ maps $-n$ to $\sigma n$, sum 0, (v) reflections combined with $-I$; transfer to the public text is left to this release |
| 4 | (wording) the symbol $g$ means different things in the reduction ($g(n,s)$, a minimum of upper ends) and in the design of `octintet` ($F-\kappa$ times $\sqrt2$) | noted; the public text gives the second one a different name |

**Not examined by this review:** $g\ge0$ itself (Review 7), the box records, running anything (all formulas were by hand), `d31_common.py` against the formula (left to F0 and test S), a fresh doubt of the general T1–T4 argument (only the parts depending on the piece were re-derived; the support of the reduction is the earlier review), any check by a different model family, a human or Lean.

## Review 9: upper bounds for $n=3,4$ of `icointet` and `octintet` (Fable, 11-13)

**Scope.** Exact substitution of configurations of 3 and 4 pieces into a container of edge $s^\ast$ (the value proved for $n=2$): notes of the two tools, `d28_plateau_n34.py`, `d31_plateau_n34.py`, their outputs, the Lean modules `Core`, `Ico`, `Oct`, `Axioms` and the start of `Data`, `export_plateau.py`, and the record `octintet_n03.json`. Three checks suffice for a configuration (congruence of the vertices with the standard solid, containment, a separating plane for every pair); the reviewer checked this, the field arithmetic ($\mathbb{Q}(\sqrt5)$ and $\mathbb{Q}(\sqrt2)$, sign rule) and where floating point enters, and re-derived by hand that the configurations are what they should be (for `octintet`, the four octahedra of the tetrahedron–octahedron tiling, side 3; for `icointet`, centres $a(\pm1,\pm1,\pm1)$ touching the inscribed sphere). The lower bound for $n=3,4$ is "removing pieces keeps feasibility", on top of the lower bound for $n=2$.

**Result.** No fatal gap. 10 findings: 0 fatal, 4 fixable, 6 wording. The statement for `octintet` $n=3,4$ was conditional at that time on the review of the bridge (Review 8, which was still open); that review found no fatal gap.

| # | finding | action |
|---|---|---|
| 1 | (fixable) the notes of `octintet` correctly said the conclusion depends on the $n=2$ result; until the review of the bridge ended, no list may say "closed" for `octintet` $n=3,4$ | after Review 8 (no fatal gap) the condition was removed from the notes, with the remark that the review is by one model of the same family; roadmap and public text are outside this fix; the public text of this repository states the dependence (docs/plateau.md §2) |
| 2 | (fixable) the injected-error variants for `d28` (container shrunk by $10^{-12}$, piece scaled by 1.0001) are not reproducible from `d28_plateau_n34.py` (only `d31` has `--inject`) | separate `verify_d28`, `inject_d28`, option `--inject` (acceptance unchanged): 7 variants, all rejected for $n=2,3,4$ |
| 3 | (fixable) the three kinds of injected errors (container, one vertex, plane height) hit each check once; more were suggested (move a piece to its neighbour, drop a pair of planes, zero normal) | added in `d28` (inside `inject_d28`) and `d31` (`inject`: 3 more kinds), all rejected |
| 4 | (fixable) the field classes accept `float` silently (`Fraction(float)`); no float enters now | `__init__` of `Q5`, `Q2` now rejects `float` |
| 5 | (wording) a line "Lean re-check not yet done" was outdated | corrected |
| 6 | (wording) why three checks suffice (convex hull, closed half-spaces, point symmetry for reflections, the four normals form a tetrahedron of edge $2\sqrt2c$) was scattered in script comments | written in the notes |
| 7 | (wording) the chain $s^\ast(2)\le s^\ast(3)\le s^\ast(4)\le s$ was not stated: $n=4$ alone gives the upper bounds for $n=2,3$; the substitutions for $n=2,3$ are cross-checks | stated |
| 8 | (wording) the hand cross-checks (tiling for `octintet`; inscribed sphere and three walls for `icointet`) would help readers | included, marked as hand consistency checks, not computation |
| 9 | (wording) origin of configurations: `found_by` of `octintet_n03.json` is a configuration of others (one piece removed from $n+1$) | the text says: configurations are taken from the record; reading them as exact numbers and the checks are our own. The other five records were not looked at |
| 10 | (wording) Lean rejects injected errors in two ways (type mismatch in the kernel, "proposition is false") | public text: "Lean did not accept it" |

Results after the fixes: `icointet` $n=2,3,4$: (containments, wall contacts, separating planes) = (96, 18, 1), (144, 27, 3), (192, 36, 6); `octintet`: (48, 18, 1), (72, 27, 3), (96, 36, 6). The `octintet` $n=2$ check uses the configuration of test U of `d31` (both pieces at $R=I$), because the record of $n=2$ has a free angle that does not read as an exact number. The floating point guard changed no output. Lean re-check: see the Lean section.

**Not examined by this review:** running the scripts or `lake build` (the reviewer looked only at the dates of the `.json` and `.olean` files, and the numbers came from records and notes), the lower bounds for $n=2$ themselves, `Data.lean` in full, the 12 tests in `Test/`, the output of `#print axioms`, the $n=5$ files, the other five records, the contents of `solids.py` (the upper bound does not depend on the orientation convention of the container), the correctness of `Fraction` and the Lean kernel.

## Review 10: $n=5$ of `icointet` and `octintet` (Fable, 11-13)

**Scope.** Lower bound: for $n\ge5$ the container edge satisfies $L\ge20r/\sqrt6$ ($r$ = inradius of the unit piece), by an inscribed-sphere argument and the pigeonhole principle on four closed Voronoi-type cells of the shrunk tetrahedron, with a cell diameter of $(\sqrt6/4)L'$ and $2r\le(\sqrt6/4)L'$. Upper bound: exact substitution of 5 pieces into the container of that edge (same three checks as in Review 9). Together: the minimal edge for $n=5$ is $5\sqrt{3\sqrt5+7}/3$ for `icointet` and $10/3$ for `octintet`; the plateau (the same value for $n=2,3,4$) ends at $n=4$. Read: the notes (with the Lean part), `plateau_end_check.py` and its log, `plateau_n05_upper.py` and its output, the two tools from Review 9, `N5End.lean`, `N5EndCore.lean`.

**Result.** No fatal gap; lower and upper bound accepted. 8 findings: 0 fatal, 4 fixable, 4 wording. The reviewer re-derived by hand the cell with 8 vertices and squared diameter ratio $3/8$ for the vertex $(1,1,1)$ of the tetrahedron with vertices $(\pm1,\pm1,\pm1)$, the coefficient $2\sqrt6r+8r/\sqrt6=20r/\sqrt6$, and the values $100/9>9$ and $227/45>0$; and observed that the exact configuration (four centres at the vertices of the shrunk tetrahedron plus its centre) is exactly the equality case of the lower bound, so lower and upper bound point at the same configuration. **Exception to the rule that reviewers do not run code:** this reviewer re-ran `run_ico` and `run_oct` of the upper-bound script (without writing files) and `plateau_end_check.py`; the results (240, 36, 10) for `icointet`, (120, 36, 10) for `octintet`, the rejection of the injected-error variants (1 for `icointet`, 3 for `octintet`) and the output of the check script agreed with the stored logs.

| # | finding | action |
|---|---|---|
| 1 | (fixable) steps 3 and 4 of the proof should say that the cells are closed and cover the shrunk tetrahedron (boundary points in both), that a convex bounded cell has diameter equal to the largest vertex distance, and that the inequality has equality | added to the notes |
| 2 | (fixable) "the inscribed sphere lies in the piece" needs one more sentence: the piece equals the intersection of the half-spaces of its faces (checked by the Euler relation); Lean's `inradOk` checks the planes of all faces | added |
| 3 | (fixable) for `icointet` there is only one injected-error variant on the Python side (container $10^{-12}$ smaller); vertex shift and plane raise exist only on the Lean side; and `d28_plateau_n34.py` has search and acceptance in one function (as opposed to `d31`, which separates `find` and `verify`) | not done in the first round: noted as open (the acceptance comparisons are exact, so results are unaffected); splitting `check` into `find`/`verify` postponed. **Fixed in the v0.2.0 bundle:** `plateau_n05_upper.py` also runs the 7 variants of `inject_d28` for `icointet` $n=5$ (all 8 variants rejected), and every script stops with an error if a variant is accepted. `check` was not split further (the acceptance part is already the separate `verify_d28`) |
| 4 | (fixable) $r^2$ in `plateau_end_check.py` (1/6; $(7+3\sqrt5)/24$) is a hand-written number; only Lean derives it from the piece | stated in the notes and in the script header: Python alone cannot detect an error in the input $r$; the reference is the Lean theorems `inrad_*_ok` |
| 5 | (wording) a bullet "upper bound not started" in the conclusion became outdated | now refers to the later section |
| 6 | (wording) "if $L'\le0$ the centres collapse to at most one point" | split: $L'<0$ no sphere fits, $L'=0$ one point only |
| 7 | (wording) "more pieces do not decrease $L$" | rewritten: choose 5 of the $n$ pieces and apply the same argument |
| 8 | (wording) public text should say: what is fixed is the **value** of the minimal edge, not the uniqueness of the optimal configuration; the floating-point configuration of the record was used only to propose candidates, acceptance is exact substitution | written in the notes |

What is **not** claimed (from the review): the minimal edge for $n\ge6$ (the lower bound stays $20r/\sqrt6$ there, and the records are expected to be above it); uniqueness of the optimal configuration; a formal proof (Lean checks the arithmetic only); a human or third-party review.

**Not examined by this review** (the review has no such list; the following is read off its reading list): `N5*` files beyond `N5End.lean` and `N5EndCore.lean` (the `N5Data`, `N5` modules and their tests were not read), the correctness of `Fraction` and the Lean kernel (used as trust base), the stored records outside those named above, whether the configurations in the records are the best known.

## Review 11: `octinico_n02` (Fable, 11-13 night)

**Scope.** The claim $s^\ast=3\sqrt2-\sqrt{10}$ for `octinico_n02` (octahedron pair in an icosahedron), the first case whose minimum is a curve and whose local stage is written in tube coordinates. Read in full: the notes of stage 3, the design (Lemma W, the tube), `d30_s3_common.py`, `d30_s3_local.py`, `d30_s3_far.py`, `d30_s3_tests.py`, `d30_local.py`, `d30_far.py`, `d16e_far.py`, `d16e_local.py`, the entry points of `d16e_common.py`. Records: the local record with its 16 certificates, its verify record, the far record and its replay record, the test records. Unlike earlier reviews, the reviewer ran two small checks of their own (without writing files): (1) a floating-point re-construction of the certificates at 2,832 points of the 16 boxes, independent of the acceptance code (residual of the equality $\le7\times10^{-16}$, all multipliers $\ge0$, minimum of $(B-S^\ast)/\rho=0.1094$, $B\le\varphi$); (2) the exact `check_mix` applied to the 6 weighted boxes with the lifts changed.

**Result.** No fatal gap. 9 findings: 0 fatal, 5 fixable, 4 wording. The replacement of the cube faces by the four sides of the tube, the zero-order identity as a polynomial in $\tau$, the seam with the far region (the corners of the 44 "to local" boxes are inside the tube; with split limit 0, every box containing a minimiser must have been handed to the tube, since no such box can be accepted), and the treatment of $\rho=0$ have no gap. **This claim really relies on the paired lifting (Lemma W (ii))**: removing the genuine lift from any of the 6 weighted boxes makes the exact check fail (at the multiplier of face 19 or 17), and without lifting the local stage does not close. There is no alternative record with single candidates only (unlike cubinico).

| # | finding | action |
|---|---|---|
| H1 | (fixable) no single check of everything the claim rests on (local verify, far replay, coverage, equal tube constants in both records) | new `d30_s3_claim.py`; passes (local 16 boxes; far 676 accepted / 206 discarded / 44 tube / 0 limit / 0 failures; 926 covering leaves; SHA-256 of the six code files match) |
| H2 | (fixable) the candidate numbering comes from a floating-point scan; a different environment could number candidates differently (would not cause a false acceptance) | the record stores the candidate table (number → $J$, $\alpha$); verify requires it to equal the current table |
| H3 | (fixable) verify did not require the record's $\rho_0$ to equal the tube's $\rho_0$ | `need` added |
| H4 | (fixable) the LP that proposes weights also put a lift on a face outside the weighted candidate's $J$ (harmless, but it reduced the margin and suggested "two lifted faces") | `try_mix` first retries without lifts on faces outside $J$; local stage re-run: still 16 boxes (10 single, 6 weighted), each with a lift on **one** face; regression on cubinoct: identical certificate |
| H5 | (fixable) test W printed a meaningless $(B-S^\ast)/\rho$ (divided by $\max\lvert p\rvert$ instead of the tube's $\rho$) | fixed; minimum now $0.150$ in units of $S$ (0.109 before H4) |
| W1 | (wording) the description of the local boxes and lifts in the notes was inaccurate | corrected (both $a_1$ and $a_2$ halved; one genuine lift per box, $c=0.85$–$2.09$) |
| W2 | (wording) "the minimisers form an arc of length 0.094 rad" is numerical | the claim states what the certificate gives (the 50 exact points; the minimisers lie on the segment $\tau\in[-1/64,5/256]$ up to symmetry) and calls the arc's ends numerical |
| W3 | (wording) the claim should say that it relies on Lemma W (ii) | written ([reduction_symmetric.md §6c](reduction_symmetric.md#6c-octinico_n02-a-curve-of-minimisers-weights-and-paired-lifting-new-in-v030)) |
| W4 | (wording) the records hold SHA-256 of the code that made them, but nothing compared them | `d30_s3_claim.py` reports match / mismatch |

Main records after the fixes: local 28 boxes evaluated, 16 accepted (10 single, 6 weighted with one lift each), verify passes; far 1,804 evaluated, 676 accepted, 206 discarded, 44 to the tube, split limit 0, replay passes; tests U, FAM (50/50 exact points with $\varphi=S^\ast$), TUBE, S, V (300/300), C (0 accepted), P (0 violations), W (956 points, 0 violations), X, m1–m5 as expected; the injected error "lift cost removed" claims to close but test W finds $F\le0$ at 197 points.

**Not examined by this review:** the interval tools of `d16e_common`, Lemma R and the far-region logic beyond `inside_tube` (relied on earlier reviews), the contents of the 926 far rows, the correctness of the 357 symmetry pairs beyond the construction and tests S and m5b; running verify, replay or the tests; any check by a different model family, a human, or Lean at that time.

## Review 12: `tetintet_n02` (Fable, 11-13 night)

**Scope.** The claim $\bar s=1953564244/10^9\le s^\ast\le s_{\rm up}$ for `tetintet_n02` (tetrahedron pair in a tetrahedron). Read in full: the design, the notes, `d40_common.py`, `d40_local.py`, `d40_far.py`, `d40_upper.py`, the parts of `d31_common.py` that are used (`RBox`, `quad_lb`, `vcomb`, `discard_lb`), and the statements of T1–T4. Not read: `d40_step0*.py`, `d40_tests.py`, the records. One line was run (substituting $s_0$ into the quintic).

**Result.** No fatal gap. 10 findings: 0 fatal, 4 fixable (notes and small tests; no count changes), 6 minor. The chain "T4 at $\bar s$ → symmetry reduction to $D_n$ → pairing of sides A and B → candidates are lower bounds → rational lower bounds → coverage" has no gap; acceptance is decided by integer/rational comparisons only. The reviewer confirmed in particular: the direction of the multiplier ($+\lambda(s_1-\bar s)$, $\lambda\ge0$); the validity of types M and S; the local lemma with a nonnegative zero-order part (it assumes nothing about the centre, so a rational approximation is allowed); T4 used at $\bar s<s_0$; the pairing on $y=0$ with $\lvert\kappa_N\rvert$; the "to local" test via $w=\bar q_c\otimes q$; the discard rule with the 12 rotations; the upper bound by direct substitution.

| # | finding | action |
|---|---|---|
| R1 | (fixable) $n$-boxes straddling $h+k'=1$ stick out of $T$, where one weight of side B can be negative; the notes did not explain why this does not matter | note added: the checker proves "candidate polynomial $\ge0$", true whatever the signs; it is read as a bound on $\tilde G$ only inside $T$, where all weights are $\ge0$ |
| R2 | (fixable) the application of T4 should state (a) that T4 is used at $\bar s$ (not $s_0$) with the restriction $s_1(R)\le\bar s$, and (b) why the extension of $\kappa$ from $D_n$ is well defined (a closed chamber of $T_d$ meets each orbit once) | written ([reduction_tetintet.md §2–3](reduction_tetintet.md#2-t4-with-the-restriction-s_1rlebar-s)) |
| R3 | (fixable) the local polynomials (built with sympy) and the far formulas (built by hand) were never compared | test R3: exact comparison at random rational points for all centres and candidates of types F, M, S; 6,304 comparisons, 0 mismatches |
| R4 | (fixable) the far replay checks that "to local" leaves lie in the local region, not that the local region closed | `d40_tests.py --only chain` runs local replay, far replay and the upper bound in order and prints one verdict; passes (185 s) |
| m1 | (minor) the local check of $e_c$ at the two ends assumes $e_c$ affine in $h$ | assert added |
| m2 | (minor) type S in the local stage gives only $\check S_c\ge0$ at $r=0$ | noted; type S is not used locally, and T4 needs only $s_1<\bar s$ |
| m3 | (minor) a depth bound in the far replay uses `math.log2` | left (a runaway guard; too small would only make replay fail) |
| m4 | (minor) the rational centre $\hat R$ is recomputed with mpmath; a different last digit elsewhere would make the header comparison fail (not pass wrongly) | left; the re-generation with the English code reproduced it |
| m5 | (minor) "$s_{\rm up}=s_0+3.3\times10^{-22}$" is a numerical statement | stated as numerical; the enclosure uses only the rationals |
| m6 | (minor) trust base, and no check by another model family or Lean yet | Lean re-check of the arithmetic done afterwards (below) |

Main records (unchanged by the fixes): local 7 centres, 28,946 accepted leaves, 57,839 evaluated, split limit 0, replay passes; far $n$-boxes 236 ok + 18 out, $R$-leaves 154,232 accepted, 72,810 discarded, 223 to local, 3,779,147 evaluated, split limit 0, replay passes; tests W, t1–t6, L1, R3 and chain as expected (t1: reversing the sign of $\mu$ breaks the bound at 3,318 of 3,318 points; t5: at $s_0+10^{-6}$ the zero-order sum is negative; t6: a negative $k_N$ near $N_1$ is rejected by replay).

**Not examined by this review:** T1–T4 themselves (only their statements and the application; the symmetry of $\tilde G$ under $T_d$ with the piece mirror rests on the tetrahedron reduction), stage 0 (Gröbner basis, LPs), the tests, the records, running anything; uniqueness and the exact value $s_0$ are not claimed.

## Review 13: `dodintet_n02` (Fable, 11-14 morning)

**Scope.** The claim $2\sqrt2\,\bar c\le s^\ast\le2\sqrt2\,u_{\rm up}$ for `dodintet_n02`. Read in full: the notes of stages 1–3, `d45_dodintet_far.py`, `d45_dodintet_local.py`, `d45_dodintet_common.py`, `d45_dodintet_upper.py`, `d45_dodintet_tests.py`, the lower-bound tools of `d28_common.py`, the reduction T1–T4 and route Y of tetintet. Re-run: local replay of both tubes, tests L1, R3, t6, a short independent reading of the whole far record (cover of the $n$-tree, pair sums at all corners, the L conditions of all 4,618 trees with L leaves), `check_box` on all 31 boxes of types II and III plus 40 random boxes of type I, the upper bound, the vertices of the piece, and an independently written $F$ in floating point. Not re-run: the full far replay, tests W, t5, chain.

**Result.** No fatal gap. 14 findings: 0 fatal, 1 important, 7 fixable, 6 wording.

| # | finding | action |
|---|---|---|
| A1 | (important) the argument for the seam $y=0$ was written only for types I and II; 7 of the 66 boxes touching $y=0$ are of type II or III | written for all types: the pair sum $\kappa_U+\kappa_L\ge0$ is checked at the corners for every type, so $\kappa:=\max(\kappa_U,\kappa_L)\ge0$; at other box boundaries one pair is chosen per point |
| B1 | (fixable) the far checker relies on an environment variable selecting $\mathbb Q(\sqrt5)$ in `d28_common` | assert added |
| B2 | (fixable) no check in the code that the vertices form a unit-edge dodecahedron | assert added |
| B3 | (fixable) the upper-bound script rewrote its json at every run | it now only compares (rewrite with `--write`) |
| B4 | (fixable) the far record was edited by hand (two regions removed and redone as a continuation) | history written; `.bak` kept out of the release; the final counts are those of the replay |
| B5 | (fixable) an outdated comment about L leaves | fixed |
| B6 | (fixable) no test that the offset rule of L leaves matters | test t4 ($k_L=0$ in the 26 type-III boxes: all fail) |
| B7 | (fixable) no comparison with an independently written $F$ | test W2 |
| C1–C6 | (wording) state the claim without $s_0$; review status; vocabulary; details of the record history; margins | done in the notes |

**Not examined by this review:** T1–T4 themselves, stage 0, the floating-point choice of $\hat k$ and of the offsets (not needed for soundness), the equality $s^\ast=s_0$ (not claimed).

## Review 14: `tetintet_n05`, the restricted reduction (Fable, 11-13)

**Scope.** The reduction of `tetintet_n05` to two pieces in one quarter cell of the container: the cell and the pigeonhole step, T2–T4 rewritten with the heights restricted to the cell ((K̃), T2̃–T4̃), and the exact check of the optimal two-piece configurations (stage 0a: the placements P1 and P2, the zero-order identities, the first-order lower bounds). Read: the notes of these steps, `d37_tet_n05_exact.py` and its log, the counts and minima of its json output, the statements of T1–T4 and their application in the tetrahedron reduction. Not read: the floating-point preview script. Nothing was run (hand calculations only).

**Result.** No fatal gap. 10 findings: 0 fatal, 5 fixable, 5 wording. The reviewer re-derived by hand: that the four cells cover the container (so two of five centroids share a cell); that the restricted T2̃, T3̃ and (K̃) are T2–T3 with the restricted heights; T4̃ by enlarging the configuration by $s_0/s$ and separating the pieces (it uses neither the dependence of the heights on $s$ nor monotonicity); the direction of the multiplier, $F+\lambda(\tilde s_1-s_0)\ge\kappa$; the placements P1 and P2, their zero-order identities along the arc, and the first-order bounds of stage 0a.

| # | finding | action |
|---|---|---|
| 1 | (fixable) near $n=(1,1,1)$, where several branches of the arc and P2 meet, $\kappa$ cannot be one linear form | the final $n$ chart is one chamber of $C_{3v}$, where one linear $\tilde\kappa$ suffices; the other sectors are its images ([reduction_tetintet_n05.md §3](reduction_tetintet_n05.md#3-the-n-chart-and-kappa)) |
| 2 | (fixable) with the cell fixed, only the stabiliser $C_{3v}$ of the cell remains as a symmetry; the domain $D_n$ of the two-piece tetrahedron cases cannot be used as it is | the $n$ chart was rebuilt with $C_{3v}$ (same section) |
| 3 | (fixable) the end $u=1$ of the arc was described as an edge–edge contact; in fact a face of the fixed piece lies on the plane | corrected |
| 4 | (fixable) the dual witnesses of the first-order check of stage 0a were not stored, so that check could not be replayed from rationals | not tracked here; stage 0a is not an input of the certificate, whose lower bound rests on the stored local and far records |
| 5 | (fixable) a constant multiplier $\lambda=2$ is irrational in the coordinates of the tools | the certificates use rational multipliers ($\mu$ an integer or a multiple of $1/64$) |
| 6 | (wording) T4̃ was not stated as a claim, the rotations were missing in one formula, and the heading said "shrink" for an argument that enlarges | stated as a corollary with its proof ("enlarge and separate", rotations included; [reduction_tetintet_n05.md §2](reduction_tetintet_n05.md#2-the-cell-and-t2t4-restricted-to-it)) |
| 7 | (wording) three conventions for the index of the cell | one convention (0-based, cell $j=3$) |
| 8 | (wording) for $n=5$ the restriction on $s_1$ matters only on the side $u<1/4$ of the arc, not on the whole arc | corrected |
| 9 | (wording) "one placement" holds among the 120 rotations with entries $0,\pm1/3,\pm2/3,\pm1$, and the values off the arc are at fixed rotations | conditions added |
| 10 | (wording) a development note states the multiplier in the reversed direction | concerns a note outside this repository |

**Not examined by this review:** running `d37_tet_n05_exact.py`, the rows of its json output one by one, the floating-point preview, whether (K̃) holds everywhere (that is the far region, Review 15), higher-order terms, T1 and the original T2 beyond reading them.

## Review 15: `tetintet_n05`, local and far regions (Fable, 11-14 morning)

**Scope.** The claim $s^\ast\ge2$ of `tetintet_n05` from the local record ($R_0=1/16$) and the far record. Read in full: the notes of the $n$ chart, the leaf types and the far and local stages, `d37_tet_n05_far.py`, `d37_tet_n05_common.py`, `d37_tet_n05_local.py`, `d37_tet_n05_far_tests.py`, the parts of `d31_common.py` that are used (`RBox`, `quad_lb`, `vcomb`, `discard_lb`), Review 14; the first lines and summaries of the records. Re-run (about a minute, no files written): the local replay with $R_0=1/16$ (6,734 leaves passed, 0 failed), three ways in which mismatched premises make the tools stop, and the consistency check `d37_tet_n05_far.py check`. Not re-run: the far replay.

**Result.** No fatal gap. 11 findings: 0 fatal, 2 important, 3 fixable, 6 wording. The reviewer confirmed that acceptance is decided by integer and rational comparisons only (floating point only chooses candidates and $k_N$), the identity behind the face/multiplier condition $D_j\le\mu$, the maps $n_A$, $n_B$ and the seam $a+b=1$, the type S rule, the L leaves after a piece rotation, the joint of the local and far regions, and that both records use $R_0=1/16$. The two important findings do not affect the present records (checked by hand), but the same kind of oversight occurs at $R_0=1/8$.

| # | finding | action |
|---|---|---|
| A1 | (important) the local replay did not check the condition that makes the candidates valid (weights $\ge0$): $2a_{\max}+3R_0\le2$ was checked only by the far tool, and that the tubes lie in $T$ nowhere | `region_check` in the local run and replay: the $n$-range of each centre lies in $T$ and the weights are $\ge0$ at its corners (rational); passes for $R_0=1/16$ and $1/32$, stops for $R_0=1/8$ |
| A2 | (important) the far candidate formulas were never compared exactly with the true value; replay re-uses the same code | test X (192,320 equalities, 384,640 inequalities, 7,200 of type S against an independently written exact $\tilde F$ and $\check S$; 0 violations; a deliberately wrong sign of $\kappa$ is caught at once) and test Xb (the integer scaling of the box bound, 3,159 comparisons, 0 violations) |
| B1 | (fixable) the claim needs the local and the far replay with the same $R_0$, but the far replay does not read the local record | `d37_tet_n05_replay_both.py`: the premises of both records agree with each other and with the code, the upper bound, the local replay and the far replay in one run; passes (434 s) |
| B2 | (fixable) the definition of $\kappa$ on the whole sphere was not in one place | written in four steps ($C_{3v}$, homogeneity, box boundaries, the line $a+b=1$; [reduction_tetintet_n05.md §3](reduction_tetintet_n05.md#3-the-n-chart-and-kappa)) |
| B3 | (fixable) the floating-point tests W and Bd do not hit the corners of $T$ or the fixed point of $\sigma$ | test P: 3,696 exact comparisons with the recorded $\kappa_N$ at the corners, the fixed point and points on $a+b=1$; 0 violations, minimum exactly 0 at the end of the arc |
| C1 | (wording) vocabulary | aligned |
| C2 | (wording) replay is a re-run of the same code, not an independent implementation | stated |
| C3 | (wording) the place of the upper bound was not given | the five-piece placement is written and checked with rationals in `d37_tet_n05_replay_both.py` |
| C4 | (wording) the wording findings of Review 14 were not yet in the notes | done |
| C5 | (wording) the description of $\sigma$ | rewritten as $n\mapsto-n$ followed by a reflection |
| C6 | (wording) the note on type S is needed only where S is accepted with $\ge0$ | corrected |

**Not examined by this review:** the far replay, the 777,383 far leaves one by one, an independent implementation, a line-by-line comparison with the tools of `tetintet_n02`, the local tests beyond their results, the sympy expansion of the local polynomials, the upper bound (followed by hand only; it is checked in code since C3), T1 and the restricted reduction (Review 14), the status of the problem elsewhere.

## Review 16: `dodincub_n02`, `dodinoct_n02` (Fable, 11-14 morning)

**Scope.** The claims $s^\ast=(16+334\sqrt2+46\sqrt5+137\sqrt{10})/267$ for `dodincub_n02` and $s^\ast=(411\sqrt2+157\sqrt{10})/228$ for `dodinoct_n02`, made with the tools of cubinico and a new problem definition `d30x_problems.py`, which installs the two problems behind `d30_problems` and runs the d30 scripts through runpy. Read in full: the notes, `d30x_problems.py`, Review 6, `d30_problems.py`, `d30_claim.py`, `d30_local.py`, `d30_far.py`, `d16e_far.py`, `d16e_step0.py`; `Problem` and `load` of `d16e_common.py`, the start of `d30_tests_full.py`, Lemma R. Records: stage 0, the local records with their certificates, verify and claim records, the far records (counts per kind and the rows of $L$), the test records, logs, timestamps and SHA-256 values. The reviewer did not re-run verify, replay or the tests, but ran a floating-point check of its own that does not import the project's code: $\varphi(R^\ast)$ from its own LP agrees with both closed forms to double precision, the two configurations fit in the containers and are separated by a plane, and 1,500 random rotations and 25 descents from them found no value more than $10^{-6}$ below $s^\ast$.

**Result.** No fatal gap. 9 findings: 0 fatal, 4 fixable, 5 wording. The problem definitions are right (piece, containers, $R^\ast$, $S^\ast$; the premises of Lemma R hold), and the wrapper acts on every entry point that was used (without it the tools stop with an error, never check a different problem). At the time of the review the local record of dodinoct ($\rho_0=1/16$) had 25 boxes accepted with weights (Lemma W (i), no lifts), so that claim would have been the first to rest on Lemma W; the reviewer suggested trying a smaller $\rho_0$ with single candidates only.

| # | finding | action |
|---|---|---|
| H1 | (fixable) the controls added for cubinico (Review 6, G4–G5) were not run on these cases | `d30x_testsX.py`. dodinoct, record with $\rho_0=1/16$ and weights: X3 as expected; X1 (lift cost reduced) is rejected by the correct version, accepted by the faulty one, and test W then finds $F\le0$ at 3 of 41 points; swapping tied vertices on faces 3 and 7: 3 boxes still pass, with no violation of test W ("coincidentally valid"), the others fail; parent test 2 of 47 (both weighted); corrupted records are rejected or raise an exception, except (e) (one weight index changed), which passes with no violation of test W in that box, as for cubinico. Record of the claim ($\rho_0=1/32$) and dodincub: parent test 0 of 126 and 0 of 23; a dropped or duplicated local leaf, a dropped far line and a far multiplier from another box raise an exception, a wrong candidate is rejected |
| H2 | (fixable) "single candidates do not close at $\rho_0=1/16$" had no record | re-run with a time limit of 600 s and recorded: one face did not close after 205,660 boxes; at the stuck boxes ($\rho\approx0.045$) the best single candidate has a negative multiplier |
| H3 | (fixable) the Lean exporter handles single candidates only, so dodinoct could not go to Lean as it was | with $\rho_0=1/32$ the local stage closes with single candidates only (246 boxes evaluated, 126 accepted), the far run gives 31,958 / 15,250 / 727 / 8, and `d30_claim.py` passes. This record is the claim; the record with $\rho_0=1/16$ and weights is another certificate of the same statement and is not relied upon |
| H4 | (fixable) the SHA-256 values in the records do not include `d30x_problems.py` | the wrapper now appends its own SHA-256, the script and the arguments to a run log; the SHA-256 before and after this change are in the notes; the Lean exporter cross-checks $S^\ast$ and $R^\ast$ with the records (see lean/README.md) |
| V1 | (wording) what each claim relies on was not in one place | written: Lemma R, the far tools of `d16e_*`, and single-candidate local checks (`check_single`), for dodinoct at $\rho_0=1/32$ |
| V2 | (wording) $R^\ast$ was said to be confirmed by the closing of the far and local stages | $R^\ast$ was found with PSLQ, only exact checks of it are used, and the lower bound does not depend on where $R^\ast$ came from |
| V3 | (wording) record names and the commands to re-create the claim records were not listed; that the tools stop without the wrapper was not stated | listed ([verification.md §7](verification.md#7-reproduction), certificates/README.md) |
| V4 | (wording) the field of dodinoct was given as $\mathbb Q(\sqrt5)$ in one place and $\mathbb Q(\sqrt2,\sqrt5)$ in another | the computation in units of $S$ is in $\mathbb Q(\sqrt5)$; $s^\ast=\sqrt2\,S^\ast$ is in $\mathbb Q(\sqrt2,\sqrt5)$ |
| V5 | (wording) the regression mode of `d30_tests.py` calls `d30_local.py` in a subprocess, where the wrapper does not act | noted; not used for these cases |

**Not examined by this review:** the `d16e_*` and `d30_*` tools beyond the branches these two cases use (Reviews 4–6), re-running verify, replay or the tests, python-flint, sympy and `Fraction`, any check by a different model family, a human or Lean at that time. The fixes themselves were not reviewed again.

## Lean re-check (11-12 night – 11-13)

The arithmetic of all six certificates was re-checked in Lean 4 with `native_decide`: all theorems pass, `#print axioms` shows no `sorryAx`, and all injected-error certificates were rejected. Details and limits in [verification.md §6](verification.md#6-lean-re-check).

For v0.2.0 (11-13):

- `icoindod_n02`, `octindod_n02` (design section 15): the D16 core was reused without changes, since it already handled the field as "generators + component list" (two generators work). `far_ok`, `local_ok`, `consts_ok` pass with the counts of the Python records on the right-hand side (`icoindod`: far sequence 2,212, accepted/discarded/L 892/208/8, local 8 candidates and 10 accepted on six faces; `octindod`: 4,608, 1,826/472/8, 8 candidates and 23 accepted). 10 injected-error certificates rejected. `native_decide`; 112 s and 162 s of Lean. `sorryAx` absent.
- `octintet_n02` (section 17): written with integers only (the data of the $g$-form are rational); far region, local J, local C, constants and zero-order identities pass with the Python counts in the statements; 11 injected-error certificates rejected. Whole thing with `native_decide`; with `decide +kernel` small parts pass (and `#print axioms` shows only the three standard axioms), a full kernel run is estimated at about 1.5 to 2 hours for the far region and about 4 hours for the local region (9.5 GB for one local part) and was not done. The upper bound is not in this module; it is covered by the plateau module below (configuration at $R=I$, counts (48, 18, 1)). Note: one injected error (U_J halved) is not caught on the local J side, because shrinking the domain only makes the check easier, as with test $n2$ of Review 7; a widening error (U_J = 3/8) is caught.
- `cubinico_n02` (section 18): only the record without Lemma W (74 single boxes) and the far region are re-checked; the weighted record is not. The far sequence has 9,978 entries (4,194 accepted, 789 discarded, 8 in $L$), the local part has 74 accepted boxes. `far_ok` 41 s, `local_ok` 5 s, `consts_ok` 5 s (data loading 58 s). 9 injected-error certificates rejected. Whole thing with `native_decide`; `decide +kernel` runs of parts pass, but the full local part and the full constants stopped at the memory limit, and the full far region is estimated at about 12 hours. One injected error (a larger $\rho_0$) is caught on the local side only, again because the widening direction on the far side is easier.
- Plateau $n=3,4$ (`icointet`, `octintet`; notes of `d28` and `d31`): with `decide +kernel`: `icointet` (96, 18, 1), (144, 27, 3), (192, 36, 6); `octintet` $n=2$ (the $R=I$ test configuration), $n=3,4$: (48, 18, 1), (72, 27, 3), (96, 36, 6). `#print axioms`: only the three standard axioms (or none). Injected errors: 6 for each, all rejected. Lean does not check the reasoning that three checks imply a valid packing, nor the bound "removing pieces preserves feasibility".
- Plateau $n=5$ (notes of the plateau end): upper-bound counts (240, 36, 10) and (120, 36, 10) and the arithmetic of the lower bound (the cell vertices from exact intersections, 8 per cell, ratio $\le3/8$ with equality, the inscribed spheres of the container, the icosahedron and the octahedron, the coefficient identity, the sign of $L_b^2$ minus the plateau value, the equality with the container of $n=5$) pass with `decide +kernel`; 12 injected errors (6 upper, 6 lower) rejected. What Lean does not check: the pigeonhole and sphere arguments, the fact that a bounded polytope's diameter is attained at vertices, and the fact that a polytope is the intersection of its face half-spaces.

For v0.3.0 (11-14):

- `octinico_n02`: a new core `PackLean/D30S3/Core.lean` on top of the D16 field arithmetic (tube test, the four sides of the tube, the weighted check with paired lifts built by Lean). `far_ok` (1,848 tokens; 676 / 206 / 44), `local_ok` (accepted per side [4,4,4,4], 10 single, 6 weighted) and `consts_ok` pass with the Python counts in the statements; 34 s, 23 s, 12 s plus about 3 minutes of data loading. 16 injected-error certificates rejected, including the record made with the lift cost removed, lifts set to 0 or halved, and weights halved; widening the tube is rejected by the local module only (the easy direction for the far module). `native_decide`; kernel trials of parts pass, a full side of the tube stopped at 10.7 GB.
- `tetintet_n02`: a new integer-only core `PackLean/D40/Core.lean` (candidate expressions of types F, M, S built from the definition, the split $e_c+r\Lambda_c$ done by Lean, $k_N=0$ near the local region, the seven centres, the $\kappa$ coefficients, the rational upper bound). Far (452,642 tokens; 236 ok / 18 out; 154,232 / 72,810 / 223) about 1,200 s in 66 modules, local (28,946 leaves) about 330 s, constants about 10 s. 14 injected-error certificates rejected (19 modules), including the reversed sign of $\mu$ and a negative $k_N$ next to the local region; widening $r_0$ is rejected by the local modules only. `native_decide`; kernel trials of parts pass, the full run is estimated at about 23 hours.
- `dodincub_n02`, `dodinoct_n02` (11-14 evening): `PackLean/D30X/`, checked by the unchanged `D16/Core.lean` as for cubinico, from the claim records (single candidates only; dodinoct with $\rho_0=1/32$). dodincub: far sequence 7,604 (3,347 / 449 / 8), local 8 candidates and 23 accepted; dodinoct: 31,966 (15,250 / 727 / 8), 4 candidates and 126 accepted. Far 62 s and 129 s. The exporter cross-checks the constants written to Lean with the records ($S^\ast$, $R^\ast$, the rotated piece and face normal). 18 injected-error certificates (9 kinds × 2) rejected; the larger $\rho_0$ is rejected by the local module only (the far and constants modules build, as for cubinico). `native_decide`; no kernel trial.
- **dodintet (11-14 night).** `PackLean/D45DT/`: far (5,477 pair boxes, 4,051,710 $R$-leaves), local (two tubes, 3,672 leaves), constants and upper bound all pass with `native_decide`; 13 injected errors are rejected (the widened $r_0$ only by the local module); `#print axioms` shows only the standard three and the `native_decide` axioms. Arithmetic only; no kernel trial.
- `tetintet_n05` (11-14 night): a new integer-only core `PackLean/D37N05/Core.lean` on the model of D40 (the condition $D_j\le\mu$ at the vertices of ($n$-box) $\cap\,T$, the constant 1, L leaves after a piece rotation, the local regions, the five centres, the $\kappa$ coefficients, the five-piece placement at $s=2$). Far ($n$-boxes 594 ok / 31 out; 777,383 / 286,744 / 987; 2,125,476 tokens) about 4,600 s in 98 modules, local (6,734 leaves) about 75 s, constants about 5 s. 16 injected-error certificates rejected (23 modules); widening $r_0$ is rejected by the local and constants modules only. `native_decide`; no kernel trial.
- `#print axioms` for all six v0.3.0 cases: only the three standard axioms and the `native_decide` auxiliary axioms; no `sorryAx`.

## What would strengthen this

- A review by a human, or by a different model family.
- Formalisation of the reductions and the meaning of the box checks.
- Running the Lean re-check entirely in the kernel (`decide +kernel`), estimated at many hours per case (for example about 12 hours for the far region of `cubinico_n02`, about 6 hours for `octintet_n02`).
- For `tetintet_n02`, the exact value: repeating the certificate in the quintic number field (zero-order identities instead of inequalities) would show $s^{\ast}=s_0$.
- For `octinico_n02`, a second reviewer for Lemma W (ii), on which this case relies.
- For the cases added later in v0.3.0 (`dodincub_n02`, `dodinoct_n02`, `dodintet_n02`, `tetintet_n05`), a second reviewer; each argument was read by one reviewer model (the fixes after Review 16 were not reviewed again).
- A review of the first-order checks of `cubinico_n02` independent of the checks that came with the tool (the local part of that proof is the single-candidate record; Lemma W is not used by the claim).

## Re-generation with the English code

**v0.1.0 (2026-11-13 morning).** All six certificates reproduced. Each case was re-run from scratch with the translated `verifier/` (stage 0, far region, local region) in a scratch directory and compared with `certificates/` field by field. All counts and parameters in the `.json` summaries agree (only the run times and the translated prose inside `"info"` differ), and the decompressed `.boxes.jsonl.gz` records have the same SHA-256 as the stored ones, line order included (no sorting was needed, also for the parallel d28 runs). The replay of `tests/replay_all.py` passes on the re-generated records; re-exporting the Lean certificates gives files identical to `lean/PackLean/` apart from line endings; `lean/build.py all` passes (131/131) and `lean/build.py inject` rejects all 24 injected-error certificates; the Python tests of all six cases give the expected results. No file in `verifier/`, `certificates/` or `lean/PackLean/` was changed.

**v0.2.0 (2026-11-13 evening).** The new $n=2$ certificates were re-created from scratch with the translated `verifier/` in a scratch directory and compared with `certificates/`: icoindod (stage 0, far run, replay, local), octindod (the same), cubinico (far run and replay, local run without weights, `--verify`, `d30_claim.py`) and octintet (far run, local runs $J$ and $C$, `replay_all`). All counts and parameters in the `.json` files agree; the only differences are run times, the translated prose inside `"info"` of the icoindod local summary (written by the v0.1.0 English `d16d_local.py`), and, in the re-created cubinico local record, three `params` fields that the code gained after the stored record was made (`SSTAR_str`, `RSTAR_str`, `sha256`). The decompressed box and leaf records have the same SHA-256 as the stored ones, line order included: `d16d_icoindod_far` (1,108 lines), `d16e_octindod_far` (2,306), `d30_cubinico_far` (4,991), `d31_far` (337), `d31_local_J` (5,364), `d31_local_C` (2,389). The $n=3$–$5$ scripts, reading the exact configurations from `certificates/plateau_*.json`, give the same counts as the original runs; those files were written by the original rounding path (`--from-records`) and agree with the values used in the original runs. Re-exporting the Lean data with the translated exporters gives files identical to `lean/PackLean/` apart from line endings and translated comments (the non-comment text of every exported file equals the original). `tests/replay_all.py` passes for all cases (the six of v0.1.0, the four new $n=2$ cases and the plateau scripts). `lean/build.py` passes for icoindod, octindod, cubinico, octintet and plateau; `build.py inject b2`, `inject d30`, `inject d31` and `inject plateau` reject every injected-error certificate (and build the `EXPECT_PASS` variants); `#print axioms` of the 38 new top-level theorems shows only `propext`, `Classical.choice`, `Quot.sound` and the `native_decide` auxiliary axioms (7 of them depend on no axiom), no `sorryAx`. The Python tests of the four new $n=2$ cases (300 random cases each) give the expected results: icoindod and octindod as for the other `d16d_*` cases, cubinico (`d30_tests_full.py` on the record without weights) likewise, octintet all 21 items of `d31_tests.py` passed (n2 closes, as it should). No file in `certificates/` or `lean/PackLean/` was changed by these runs.

**v0.3.0 (2026-11-14).** The two new $n=2$ certificates were re-created from scratch with the translated `verifier/` in a scratch directory and compared with `certificates/`. octinico: far run (676 accepted / 206 discarded / 44 to the tube / split limit 0), replay, local run (28 boxes evaluated, 16 accepted, 6 with lifts), `verify`, `d30_s3_claim.py`; the `.json` files agree apart from run times and the SHA-256 of the code files in the local record's `params`; the local certificates agree field by field; the far box record (926 rows) has the same SHA-256. tetintet: local run (28,946 leaves, 7 centres), far run on 2 processes (236 ok / 18 out; 154,232 / 72,810 / 223), upper bound; the `.json` files agree apart from run times, the leaf record (28,947 lines) and the box record (255 lines) have the same SHA-256 without sorting, and `d40_upper.json` differs only in line endings. Before the translation, `verifier/d30_local.py` was brought up to the version with fix H4 of Review 11 (the change only affects the weighted branch; the stored cubinico record has no weighted boxes, and the cubinico replay passes). `tests/replay_all.py octinico tetintet` passes (173 s and 160 s). The Python tests give the same results as the original runs: octinico `d30_s3_tests.py 300` all items identical (FAM 50/50, V 300/300, C 0 accepted, P 0 violations, W 956 points 0 violations), the lift-cost-removed record caught at 197 of 387 points; tetintet W, t1–t6, L1 identical, R3 6,304 comparisons with 0 mismatches, chain passes.

**v0.3.0, the four later cases (2026-11-14 night).** dodincub and dodinoct: local run and `--verify`, far run, `d30_claim.py` (through `d30x_problems.py`); the local records agree apart from `params.sha256` (the SHA-256 of the code, written only), the far and claim `.json` files apart from run times and SHA-256 values, the decompressed far box records (3,804 and 15,985 rows) have the same SHA-256; `tests/replay_all.py dodincub dodinoct` passes (127 s and 131 s); the controls `d30x_testsX.py` give the same values as the original runs. tetintet_n05: local run, far run on 3 processes; the `.json` files agree apart from run times, the leaf record (6,735 rows) and the box record (626 rows) have the same SHA-256 without sorting; `d37_tet_n05_replay_both.py --r0 1/16` passes; the local tests W and R3 and the far tests W, Bd, L1, t6, X, Xb, P give the same results as the original runs. dodintet: local runs of both tubes, the upper bound and the far continuation agree (json apart from run times; leaves, boxes and `d45_dodintet_upper.json` byte for byte); the main far part cannot be re-created by the current code (see verification.md §7) and was replayed instead with the translated code (5,477 boxes, 0 failures, 980 s on 4 processes); tests W, W2, t5, t6, t4, L1, R3 give the same numbers as the original runs. Re-exporting the Lean data of the three groups with the exporters of the bundle gives files whose text equals the working copies (D30X 134, D37N05 148, D45DT 84 files), and the bundle's `lake` builds them with the results stated above.
