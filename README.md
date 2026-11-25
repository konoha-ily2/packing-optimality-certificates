# Optimality proofs for packing unit Platonic solids into a Platonic container, v1.0.1

This repository contains proofs of the minimal container size for packings of congruent unit-edge Platonic solids into a Platonic container. Version 1.0.0 has two parts of different strength:

1. **Two pieces ($n=2$), nineteen pairs: formally verified in Lean 4 (kernel-checked, standard axioms only).** For thirteen pairs the Lean theorem is the exact value of the minimal edge; for the other six it is an enclosure of width at most $6\cdot10^{-10}$. The claims are stated in [`lean/PackLean/Formal/Spec.lean`](lean/PackLean/Formal/Spec.lean) and proved together by `PackLean.Formal.N2All.n2_all`. What remains outside Lean is listed in [Formal proofs in Lean](#formal-proofs-in-lean-n2).
2. **Computer-assisted results (not formally verified).** Eight results for three or more pieces, and, for the six enclosures above, the exact value $s^{\ast}=s_0$ (an algebraic number of degree 5 to 48). These rest on Python certificates with exact arithmetic and on arguments written in prose, checked by reading only.

Compared with v0.3.0 (the last published version; no v0.4.0 was released), v1.0.0 adds: the Lean formal proofs of all nineteen $n=2$ pairs; four new $n=2$ pairs (`cubindod`, `icoinico`, `dodindod`, `octinoct`); the computer-assisted equalities $s^{\ast}=s_0$ for the six pairs with algebraic values (`tetintet` and `dodintet` were enclosures in v0.3.0); and three results for more pieces (`octincub_n09`, `dodinico_n13`, and `tetintet_n03` with $n=4$). The certificates, checkers and Lean re-check modules of v0.3.0 are unchanged, except for one added line (a guard in the coverage check; acceptance unchanged) in ten checkers (`verifier/d30_local.py` and nine others, listed in [verification.md §9](docs/verification.md#9-additions-in-v100); see also [review_log.md](docs/review_log.md#v100)); the Lean project files (`lakefile.toml`, which now requires Mathlib, `PackLean.lean` and `build.py`) were extended for v1.0.

Version 1.0.1 adds only the manuscript [`paper/p1.pdf`](paper/p1.pdf) (*Two Platonic solids in a Platonic container: nineteen minimal sizes, with the reduction checked in Lean*, 25 November 2026), which refers to v1.0.0 (commit `57aa64bd10`); the proofs, certificates, checkers and Lean files are those of v1.0.0.

> **What is formally verified, and what is not.**
> Only the Lean theorems for the nineteen $n=2$ pairs below are formal proofs. Everything else in this repository — the results for $n\ge3$, the equalities $s^{\ast}=s_0$ of the six algebraic values, the Python certificates themselves, and the Lean re-checks of their arithmetic with `native_decide` — is computer-assisted and **not** formally verified. There has been **no human review** of any part; the reviews were made by other sessions of Claude models.

## Claims

"Unit" means edge length 1. The container is a regular solid with edge $s$; the minimal edge is $s^{\ast}$. Placements are rotations and translations; the pieces are closed and may touch (their interiors must be disjoint). Under these conventions $s^{\ast}$ below is the **minimum**. The Lean statements use exactly these conventions (`Fits`, `IsMinEdge`, `EdgeBetween` in `Spec.lean`). Two further remarks are **not** part of the Lean statements (they are short arguments, checked by reading): if touching is forbidden, the same value is the infimum; and since every piece listed is mirror-symmetric, allowing reflections gives the same value.

### Two pieces ($n=2$): formally verified in Lean 4

**Thirteen exact values.** Lean theorem: `IsMinEdge K C 2 s` with the closed form $s$ below.

| id | piece → container | $s^{\ast}$ (closed form) | $s^{\ast}$ (decimal) | Lean module (`lean/PackLean/Formal/`) | certificate toolchain | reduction | since |
|---|---|---|---|---|---|---|---|
| `cubinoct_n02` | cube → octahedron | $1+\sqrt2$ | 2.414213562… | `CubinoctUpper` | `d16_cover_*` | [symmetric](docs/reduction_symmetric.md) | v0.1.0 |
| `icoincub_n02` | icosahedron → cube | $1+\tfrac{2\sqrt5}{3}$ | 2.490711985… | `Cases/IcoCub` | `d16d_*` ($T=1/2$) | [symmetric](docs/reduction_symmetric.md) | v0.1.0 |
| `dodinico_n02` | dodecahedron → icosahedron | $2+\tfrac{2\sqrt5}{5}$ | 2.894427191… | `Cases/DodIco` | `d16d_*` | [symmetric](docs/reduction_symmetric.md) | v0.1.0 |
| `icoinoct_n02` | icosahedron → octahedron | $\sqrt{9/2+2\sqrt5}$ | 2.995352392… | `Cases/IcoOct` | `d16d_*` | [symmetric](docs/reduction_symmetric.md) | v0.1.0 |
| `icoindod_n02` | icosahedron → dodecahedron | $\sqrt5-1$ | 1.236067977… | `Cases/IcoDod` | `d16d_*` | [symmetric](docs/reduction_symmetric.md) | v0.2.0 |
| `octindod_n02` | octahedron → dodecahedron | $\tfrac{2\sqrt5+\sqrt{10}-\sqrt2-4}{3}$ | 0.740066684… | `Cases/OctDod` | `d16e_*` | [symmetric](docs/reduction_symmetric.md) | v0.2.0 |
| `cubinico_n02` | cube → icosahedron | $\tfrac{49\sqrt5-53}{38}$ | 1.488613970… | `Cases/CubIco` | `d16e_*` via `d30_*` | [symmetric](docs/reduction_symmetric.md#6b-cubinico_n02-the-same-checks-with-a-stored-local-certificate) | v0.2.0 |
| `icointet_n02` | icosahedron → tetrahedron | $2\sqrt2\,(1+2/\sqrt5)$ | 5.358249252… | `Cases/IcoTet` | `d28_*` | [tetrahedron](docs/reduction_tetrahedron.md) | v0.1.0 |
| `cubintet_n02` | cube → tetrahedron | $2+\tfrac{\sqrt6}{2}+\tfrac{2\sqrt3}{3}$ | 4.379445409… | `Cases/CubTet` | `d28_*` | [tetrahedron](docs/reduction_tetrahedron.md) | v0.1.0 |
| `octintet_n02` | octahedron → tetrahedron | $3$ | 3 | `Cases/OctTet` | `d31_*` | [octintet](docs/reduction_octintet.md) | v0.2.0 |
| `octinico_n02` | octahedron → icosahedron | $3\sqrt2-\sqrt{10}$ | 1.080363026… | `Cases/OctIco` | `d16e_*` via `d30_s3_*` | [symmetric](docs/reduction_symmetric.md#6c-octinico_n02-a-curve-of-minimisers-weights-and-paired-lifting-new-in-v030) | v0.3.0 |
| `dodincub_n02` | dodecahedron → cube | $\tfrac{16+334\sqrt2+46\sqrt5+137\sqrt{10}}{267}$ | 3.836848300… | `Cases/DodCub` | `d16e_*` via `d30_*` (`d30x_problems.py`) | [symmetric](docs/reduction_symmetric.md#6d-dodincub_n02-dodecahedra-in-a-cube-new-in-v030) | v0.3.0 |
| `dodinoct_n02` | dodecahedron → octahedron | $\tfrac{411\sqrt2+157\sqrt{10}}{228}$ | 4.726839327… | `Cases/DodOct` | `d16e_*` via `d30_*` (`d30x_problems.py`) | [symmetric](docs/reduction_symmetric.md#6e-dodinoct_n02-dodecahedra-in-an-octahedron-new-in-v030) | v0.3.0 |

**Six enclosures (formally verified) with computer-assisted exact values.** Lean theorem: `EdgeBetween K C 2 a b`, that is, two copies fit at edge $b$ and at no edge $s\ge0$ below $a$. The numbers $a$, $b$ are exactly those of `Spec.lean` ($b$ is the certificate's upper bound rounded up to ten decimals; for `dodintet`, $2\sqrt2$ times a rational). The last two columns are **not** in Lean: the computer-assisted claim $s^{\ast}=s_0$, where $s_0$ is the only root of its minimal polynomial in the stated interval.

| id | piece → container | Lean: $a\le s^{\ast}$, fits at $b$ | $s_0$: degree, interval | $s_0$ (decimal) | minimal polynomial | since |
|---|---|---|---|---|---|---|
| `tetintet_n02` | tetrahedron → tetrahedron | $a=1953564244/10^9$, $b=19535642446/10^{10}$ | 5, $[1.9535,1.9536]$ | 1.953564244… | $576s^5-2112s^4+2528s^3-1296s^2+231s+19$ | enclosure v0.3.0, equality v1.0 |
| `dodintet_n02` | dodecahedron → tetrahedron | $a=2\sqrt2\cdot\frac{14986756529}{5\cdot10^9}$, $b=2\sqrt2\cdot\frac{14986756530}{5\cdot10^9}$ | 16, $[8.4777,8.4778]$ | 8.477789736… | `certificates/d45_dodintet_step0.json` (key `0a/s0_minpoly`) | enclosure v0.3.0, equality v1.0 |
| `cubindod_n02` | cube → dodecahedron | $a=915543853/10^9$, $b=9155438532/10^{10}$ | 32, $[0.9155,0.9156]$ | 0.915543853… | `certificates/f6_cubindod_minpoly.json` | v1.0 |
| `icoinico_n02` | icosahedron → icosahedron | $a=1963086047/10^9$, $b=19630860472/10^{10}$ | 48, $[1.9630,1.9631]$ | 1.963086047… | `certificates/f6_icoinico_poly.json` | v1.0 |
| `dodindod_n02` | dodecahedron → dodecahedron | $a=9937990427/(5\cdot10^9)$, $b=19875980856/10^{10}$ | 28, $[1.9875,1.9876]$ | 1.987598085… | `certificates/f6_dodindod_poly.json` | v1.0 |
| `octinoct_n02` | octahedron → octahedron | $a=1933119581/10^9$, $b=19331195812/10^{10}$ | 20, $[1.9331,1.9332]$ | 1.933119581… | `certificates/f6_octinoct_poly.json` | v1.0 |

Lean modules (`lean/PackLean/Formal/Cases/`): `TetTet`, `DodTet`, `CubDodR`, `IcoIco`, `DodDod`, `OctOct`. The certificates of the enclosures are `d40_*` (tetintet; reduction in [docs/reduction_tetintet.md](docs/reduction_tetintet.md)), `d45_dodintet_*` (dodintet, with `d28_common`; reduction in [docs/reduction_dodintet.md](docs/reduction_dodintet.md)) and `d44_*` (the other four; reduction and Lemma Q in [docs/reduction_sandwich_d44.md](docs/reduction_sandwich_d44.md)); the certificates of the equalities are `d40x_*`, `d45x_dodintet_*` and `f6_*` (see [docs/verification.md §9](docs/verification.md#9-additions-in-v100)). The equalities decide the signs of elements of the number field $\mathbb Q(s_0)$ (or a quadratic extension of it) by ball arithmetic with outward rounding (python-flint); this is not formalized. That $s_0$ is the only root of the polynomial in the interval, and that the polynomial is irreducible, are part of the computer-assisted claim. For `tetintet_n02` the Galois group of the quintic is $S_5$ (it is irreducible of prime degree 5 with exactly three real roots), so $s_0$ is not expressible by radicals; for the other five this was not determined. For `octinico_n02` the minimum is attained on an arc of rotations (the piece can spin about a face normal), not at an isolated configuration.

Equivalent forms used in the tools: icointet $s^{\ast 2}=72/5+32\sqrt5/5$; cubintet $s^{\ast 2}=41/6+2\sqrt2+8\sqrt3/3+2\sqrt6$; icoindod $s^{\ast2}=6-2\sqrt5$; octindod $s^{\ast}=-\tfrac43+\tfrac{2\sqrt{3-\sqrt5}+2\sqrt5}{3}$ (since $\sqrt{3-\sqrt5}=(\sqrt{10}-\sqrt2)/2$); octinico $s^{\ast2}=28-12\sqrt5$, $s^{\ast}=2\sqrt2/\varphi^2$ with $\varphi=(1+\sqrt5)/2$; the tools work with $S=s/2$ for dodincub and $S=s/\sqrt2$ for dodinoct, where $S^{\ast}=(411+157\sqrt5)/228$.

### Three or more pieces: computer-assisted (not formally verified)

| id | pieces → container | $s^{\ast}$ (closed form) | $s^{\ast}$ (decimal) | lower bound | upper bound | since |
|---|---|---|---|---|---|---|
| `icointet_n03`, `icointet_n04` | icosahedra → tetrahedron | $2\sqrt2\,(1+2/\sqrt5)$ | 5.358249252… | `icointet_n02` (fewer pieces still fit) | exact substitution | v0.2.0 |
| `octintet_n03`, `octintet_n04` | octahedra → tetrahedron | $3$ | 3 | `octintet_n02` | exact substitution | v0.2.0 |
| `icointet_n05` | 5 icosahedra → tetrahedron | $\tfrac53\sqrt{3\sqrt5+7}$ | 6.170765289… | inscribed balls + pigeonhole | exact substitution | v0.2.0 |
| `octintet_n05` | 5 octahedra → tetrahedron | $10/3$ | 3.333333333… | inscribed balls + pigeonhole | exact substitution | v0.2.0 |
| `tetintet_n05` | 5 tetrahedra → tetrahedron | $2$ | 2 | pigeonhole + **box certificate** (`d37_tet_n05_*`, far and local records; [tetintet_n05](docs/reduction_tetintet_n05.md)) | exact substitution (rational) | v0.3.0 |
| `tetintet_n03`, `tetintet_n04` | 3 or 4 tetrahedra → tetrahedron | $2$ | 2 | two-cell pigeonhole, one-piece inequalities (★A)/(★M) + **box certificate** (`d86_*`, local J/PM and far A/M records; [tetintet_n03](docs/reduction_tetintet_n03.md)) | exact substitution (rational, corners and the middle piece for $n=4,5$; `d86_step0.py`) | v1.0 |
| `octincub_n09` | 9 octahedra → cube | $4\sqrt2/3$ | 1.885618083… | pigeonhole over the 8 octants + table of points + **box certificate** (`d87_oct_*`, local P2/J3/J4 and far (II)–(IV) records; [octincub_n09](docs/reduction_octincub_n09.md)) | exact substitution (rational, 9 pieces, 36 separating planes; Lean `decide +kernel`) | v1.0 |
| `dodinico_n13` | 13 dodecahedra → icosahedron | $(25+7\sqrt5)/10$ | 4.065247584… | pigeonhole over the 12 vertex cones + table of points on 1,920 spherical triangles + **box certificate** (`d87_dod_*`, local L_P and far (II) / band T records; [dodinico_n13](docs/reduction_dodinico_n13.md)) | exact substitution ($\mathbb Q(\sqrt5)$, 13 pieces, 78 separating planes; Lean `decide +kernel`) | v1.0 |

The values for $n=3,4$ of icosahedra, octahedra and tetrahedra coincide with $n=2$ or $n=5$ and are counted once each, so this table has eight results. See [docs/plateau.md](docs/plateau.md) for icosahedra and octahedra. The lower bounds for $n=3,4$ of icosahedra and octahedra inherit everything the $n=2$ proofs rely on (as computer-assisted results: the $n\ge3$ statements are not in Lean). The $n=5$ lower bound $L\ge20r/\sqrt6$ ($r$ the inradius of the piece) holds for every $n\ge5$, but it is shown to be attained only for $n=5$; nothing is claimed for $n\ge6$ in a tetrahedron.

The lower bound of `tetintet_n05` is of a different kind: two of the five centroids lie in one quarter cell of the container (pigeonhole), and a two-piece box certificate (far and local regions with stored records, replay and Lean `native_decide` of the arithmetic, as for the $n=2$ certificates) shows $s\ge2$ for the problem restricted to that cell, using T2–T4 restricted to it ([reduction_tetintet_n05.md §2](docs/reduction_tetintet_n05.md#2-the-cell-and-t2t4-restricted-to-it)). Its upper bound places four pieces in the corners of the container of edge 2 and one inverted piece in the centre, checked with rationals. `tetintet_n03` gives the same value already for three pieces, with a pigeonhole over two cells and box certificates for one-piece inequalities; for $n=4$ the upper bound uses the corners and the middle piece, and the lower bound is that of $n=3$. `octincub_n09` and `dodinico_n13` use a pigeonhole over cells of the container (octants, vertex cones), a table of points and box certificates; their upper bounds are exact substitutions whose arithmetic is re-checked in Lean with `decide +kernel` (`lean/PackLean/D87Oct/Arith.lean`, `D87Dod/Arith.lean`; the upper bound only, not the lower bound). For `tetintet_n03` there is no Lean part.

What is claimed is **the value of the minimal edge**. Uniqueness of the optimal configuration is not claimed, except for one supplementary hand argument for `cubinoct_n02` that is kept separate (see [reduction_symmetric.md](docs/reduction_symmetric.md#supplement-the-optimal-configuration-of-cubinoct_n02-hand-argument)).

External records and closed forms from the literature/community databases were used **only for cross-checking and to propose candidate configurations**; none of them is an input to the proofs. The exact configurations substituted for $n\ge3$ are stored in `certificates/` (for `tetintet_n05` the placement is written in `d37_tet_n05_replay_both.py`).

## Formal proofs in Lean ($n=2$)

The nineteen $n=2$ results are formally verified in Lean 4 (kernel-checked, standard axioms only).

- **Statement.** [`lean/PackLean/Formal/Spec.lean`](lean/PackLean/Formal/Spec.lean) defines the five solids by their vertices (edge 1, centred at the origin), placements (isometries of $\mathbb R^3$; proper ones have determinant 1), `Fits` (each placed copy in the scaled container, interiors pairwise disjoint), `IsMinEdge` and `EdgeBetween`, and states the nineteen claims `<id>` as propositions: thirteen `IsMinEdge` and six `EdgeBetween`. It uses Mathlib.
- **Proof.** Each claim is proved by the last theorem of its module (`<id>_proof`, table above; `cubinoct_n02_proof` is in `Formal/CubinoctUpper.lean`, `cubindod_n02_proof` in `Formal/Cases/CubDodR.lean`). [`lean/PackLean/Formal/N2All.lean`](lean/PackLean/Formal/N2All.lean) proves their conjunction `PackLean.Formal.N2All.n2_all`. The formalization runs from the definitions to the conclusion: the reductions, the meaning of each certificate check, the coverage of the rotation domain and the upper-bound configurations are proved in Lean, and the certificate trees (kernel-only forms of the certificates, written by the generators in `lean/tools/`) are checked by the Lean kernel (`decide +kernel`).
- **Axioms.** The axioms of each of the nineteen main theorems and of `n2_all` are checked during the build (`#print axioms`, or `#assert_std_axioms` of `PackLean/AxiomAudit.lean`, which stops the build otherwise): only `propext`, `Classical.choice` and `Quot.sound`; no `sorryAx`, no `Lean.ofReduceBool` (so no `native_decide`), no axiom of the project. The import closure contains 27 modules of the arithmetic re-check that have `native_decide` theorems (the original far and local modules of `D16.*`, `D30*`, `D44.*`, `D45DT.Local` and `D16.CubOct.CoverLocal`; 39 further files of the closure mention `native_decide` only in comments), imported for the data they define; the main theorems do not use those `native_decide` theorems. `#assert_std_axioms` is applied to each of the nineteen main theorems and to `n2_all` (the build stops otherwise); sixteen of them and `n2_all` are also printed by `#print axioms` (not `dodintet`, `octintet`, `tetintet`, whose audit lines in the log do not name the theorem), and neither shows `Lean.ofReduceBool` or the auxiliary axioms of `native_decide`. There is no single shared covering theorem: each case proves the covering of its own box trees (`CoverTreeG`, `TetCover`, `TetintCover`, `OctCover`, `DTCover`, `KSeg`); the dodintet modules (`DTCover`, `DTLocalTree`, `PolySemN`, `E3iFar`) use the general lemmas of `Formal/BoxTree.lean`, the other cases do not.
- **Build.** The import closure of `N2All` has 3,951 modules. 3,693 of them are in `lean/` (3,636 byte-identical to the files that were built, 57 English copies from v0.3.0 and of the four enclosures that differ only in comments; `lean/SHA256SUMS_sources.txt`, `lean/sources_vs_worktree.tsv`). The other 258 are generated dodintet modules (223 MB) that are not stored here; `lean/tools/e3i/rebuild.py` writes them and checks them against SHA-256 lists. The build is recorded in [`lean/build_log.txt`](lean/build_log.txt) (2026-11-25, in the authors' working tree, whose sources are byte-identical to `lean/`): after the last source edits (comments in `Spec.lean`, an axiom assertion in `CubDodR.lean`), Lake rebuilt every module that imports `Spec.lean` (the modules of `PackLean.Formal`, the hand-written `E3i.BunCore` and `E3i.BunCase`, `N2All`, and the generated `E3i.Bun` and `E3i.NT` modules; the 154 `E3i.Bun` modules were built first, two at a time), one target at a time (`Spec`, the 19 case modules, then `N2All`); all 21 targets built with no error and no `sorry`, and every axiom report printed by the build lists only the three standard axioms. An earlier build of the same day, with the compiled files of the 113 hand-written modules of `PackLean.Formal` deleted beforehand, also passed (the other 18 of the 131 `Formal` modules in the closure are generated: the 13 `Cases/*Data`, `PolytopeData`, `TetData`, and the case modules `CubTet`, `IcoTet`, `TetTet`). The rest of the closure (generated certificate modules, checkers, Mathlib) was reused from earlier builds; the 258 generated dodintet modules were rebuilt from scratch on 2026-11-24 (34,133 s, see `lean/tools/e3i/README.md`). How to build: [lean/README.md](lean/README.md#formal-proofs-v10).

**What remains outside Lean** for the nineteen $n=2$ results:

- That `Spec.lean` states what is intended (the vertex sets of the solids, `Fits`, `IsMinEdge`, `EdgeBetween` and the nineteen values). This was checked by reading only, by Claude models (an Opus review of `Spec.lean` and a Fable review of all nineteen statements and their last theorems; see [review_log.md](docs/review_log.md#v100)), not by a human.
- The trusted base: the Lean kernel, the toolchain `leanprover/lean4:v4.36.0-rc2` (a release candidate) and Mathlib at commit `9d581dfff2e41de989072ea63abf3daf69311520`. No external checker that re-runs the kernel on the compiled files was used.
- No third party has rebuilt the proofs. No build from this copy of the repository has been made; the record above is of the authors' working tree, with everything except the modules that import `Spec.lean` reused from earlier builds of the same sources.
- The exact values $s^{\ast}=s_0$ of the six enclosures (computer-assisted, see above), the remarks on reflections and on forbidding contact (see Claims), and everything about $n\ge3$.
- The comments in the Lean files are partly in Japanese (3,449 files of the closure); the Lean code itself contains no Japanese. Some comments also cite the authors' internal notes (paths beginning with `plan/`), which are not part of this repository.

## The certificates (computer-assisted) and how they are checked

The Python certificates are the computer-assisted proofs of all results in this repository; for the nineteen $n=2$ results they stand beside the Lean formal proofs (whose kernel-only certificate trees were generated from the same records). Each $n=2$ certificate consists of four parts that share the same problem definition and constants (described here for the v0.3.0 cases; the v1.0 additions follow the same pattern, see [docs/verification.md §9](docs/verification.md#9-additions-in-v100)).

1. **Stage 0 – exact substitution (upper bound).** The optimal configuration is substituted exactly in the number field ($\mathbb{Q}(\sqrt2)$, $\mathbb{Q}(\sqrt5)$, $\mathbb{Q}(\sqrt2,\sqrt5)$ or $\mathbb{Q}(\sqrt2,\sqrt3)$): every vertex of both pieces lies in the container of edge $s^{\ast}$ and the two pieces are separated by a plane. This gives $s^{\ast}\le$ the stated value directly, without using any reduction. (For `tetintet_n02` the configuration is rational and the container edge is the rational $s_{\rm up}$; for `dodintet_n02` the container edge is $2\sqrt2\,u_{\rm up}$ with $u_{\rm up}\in\mathbb Q(\sqrt5)$.)
2. **Far region – box certificates + replay (lower bound away from the optimum).** After a reduction to a function of the rotation (see the reduction documents), the reduced rotation domain is covered by a binary tree of boxes. Each leaf is either *accepted* (a rational certificate shows that no configuration in the box beats $s^{\ast}$), *discarded* by an exact symmetry rule, *outside* the domain, or *handed to the local lemma*. A separate **replay** re-checks every accepted leaf from the stored multipliers alone (no LP, no floating point) and rebuilds the tree to confirm that it covers the domain.
3. **Local region – local lemma (lower bound near the optimum).** A neighbourhood of the optimal rotation(s) is closed by exact zero-order identities plus positivity checks on boxes in local coordinates (for `tetintet_n02` and `dodintet_n02` the zero-order part is checked to be $\ge0$ instead of $=0$, because the local centres are rational approximations of an irrational optimum; `tetintet_n05` uses the same form of the local lemma). For the v0.1.0 cases and for icoindod/octindod **the local stage stores no box file: re-running the tool is the check.** For `cubinico_n02`, `octintet_n02`, `octinico_n02`, `tetintet_n02`, `dodincub_n02`, `dodinoct_n02`, `dodintet_n02` and `tetintet_n05` the local leaves are stored and re-checked from the record (`--verify` / `replay`). Acceptance is decided by integers only.
4. **Lean re-check of the arithmetic.** The same certificates were exported (values copied by script, not by hand) and re-checked in Lean 4 (`native_decide`). This checks the arithmetic, the tree structure, and the box counts, independently of the Python code. It does **not** check the mathematical meaning of the checks.

The $n=3,4,5$ cases of icosahedra and octahedra are exact substitutions (upper bounds) plus short arguments (lower bounds), with their arithmetic re-checked in Lean by `decide +kernel` (kernel reduction, no `native_decide`). `tetintet_n05` is checked like an $n=2$ case (parts 1–4 above, Lean with `native_decide`), after the pigeonhole step.

Details: [docs/verification.md](docs/verification.md).

### Size of the certificates (the cases of v0.3.0)

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

### Lean re-check of the arithmetic (not a formal proof)

Independently of the formal proofs, the arithmetic of the Python certificates was re-checked in Lean, mostly with `native_decide`. This re-check does not formalize the meaning of the checks; for $n=2$ it is superseded in strength by the formal proofs, and for `tetintet_n05`, the plateau and the upper bounds of `octincub_n09` and `dodinico_n13` it is the only Lean part.

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
| cubindod, icoinico, dodindod, octinoct (enclosures, v1.0) | `PackLean/D44/` (per case Data, Tok*, Far, Local, Consts; 11 top-level theorems) | far 605 s, 394 s, 1,016 s, 168 s; local 5–23 s; constants 6–89 s | octinoct 10 kinds, icoinico and dodindod 5, cubindod 3 (far multipliers, dropped leaf, discard, local weight, candidate, dropped leaf, far-form leaf, $\bar s$ raised, upper-bound placement moved): the 27 targets that must fail all fail; the far module of the raised $\bar s$ of octinoct builds (its far boxes keep a margin above $\bar S$; listed in `EXPECT_PASS`) |

| $n=3$–$5$, icosahedra and octahedra (`decide +kernel`) | modules | wall time | injected-error certificates |
|---|---|---|---|
| upper bounds $n=2,3,4,5$, both solids | Core, Data, Ico, Oct, N5Data, N5 | under 1 min | 18: all rejected |
| lower bound $n\ge5$ | N5EndCore, N5End | under 1 min | 6: all rejected |
| upper bounds of `octincub_n09`, `dodinico_n13` (v1.0) | `D87Oct/Arith`, `D87Dod/Arith` (integers only), `decide +kernel` | not timed here | — |

`#print axioms` for every top-level theorem lists only `propext`, `Classical.choice`, `Quot.sound` and, for the `native_decide` theorems, the auxiliary axioms `…_native.native_decide.ax_1_1`. No `sorryAx`. Using `native_decide` means trusting the Lean compiler (and `Lean.ofReduceBool`), one level below the kernel; the $n=3$–$5$ checks of icosahedra and octahedra do not use it. Lean toolchain: `leanprover/lean4:v4.36.0-rc2`; the re-check modules import no Mathlib (only the formal proofs do). The re-check of the four enclosures was run in the authors' working tree (2026-11-15); the bundle's copies of `PackLean/D44/` have the same text apart from a comment line (`lean/sources_vs_worktree.tsv`).

## What has not been checked

- **No human review.** The arguments, code, Lean proofs, tests and reviews were all written by Claude (an AI model by Anthropic). Reviews were made by other sessions of Claude models (mostly Fable, some Opus); no human has reviewed any of it. The reviews are listed in [review_log.md](docs/review_log.md).
- **For the nineteen $n=2$ results**, see [What remains outside Lean](#formal-proofs-in-lean-n2) above.
- **Everything else is computer-assisted, not formally verified.** For the results with $n\ge3$ and the equalities $s^{\ast}=s_0$, the mathematical arguments (reductions, pigeonhole steps, the meaning of a box acceptance, coverage) were written in prose and checked by reading only. The arithmetic re-check in Lean (below) covers arithmetic only and uses `native_decide` for the box certificates; `tetintet_n03` and the equalities $s^{\ast}=s_0$ have no Lean part.
- How often each computer-assisted argument was read: `octincub_n09`, `dodinico_n13` and `tetintet_n03` twice each (Opus and Fable, 0 fatal findings each); the equalities of `tetintet_n02`/`dodintet_n02` once (Fable), of `cubindod_n02` once (Fable), of `dodindod_n02`/`octinoct_n02` once (Fable) plus a check of two points by Opus, of `icoinico_n02` once (Fable); the v0.3.0 cases as stated in v0.3.0 (one reviewer each, two for cubinico and for the reduction and the local/far parts of `tetintet_n05`).
- `octinico_n02` relies on Lemma W (ii), the paired lifting ([reduction_symmetric.md §6c](docs/reduction_symmetric.md#6c-octinico_n02-a-curve-of-minimisers-weights-and-paired-lifting-new-in-v030)), and `tetintet_n02` on the restriction $s_1(R)\le\bar s$ of T4 ([reduction_tetintet.md §2](docs/reduction_tetintet.md#2-t4-with-the-restriction-s_1rlebar-s)), in the Python certificates; both were read by one reviewer only. (This concerns the Python certificates; the $n=2$ claims themselves are proved in Lean.)
- The six equalities $s^{\ast}=s_0$ depend on ball arithmetic in python-flint for signs in fields of degree up to 48 (outward rounding), in addition to the trusted base below.
- Trusted base of the Python checkers: python-flint (`fmpz_mpoly.compose`, `isqrt`, ball arithmetic), sympy (expansion, simplification, `cancel`, `Poly`), Python `fractions.Fraction`.
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
- `docs/reduction_sandwich_d44.md` – the enclosures of cubindod, icoinico, dodindod, octinoct (reduction, Lemma Q for the weighted local certificates, far-form leaves; v1.0)
- `docs/reduction_octincub_n09.md` – nine octahedra in a cube (pigeonhole over the octants, table of points, box certificates; v1.0)
- `docs/reduction_dodinico_n13.md` – thirteen dodecahedra in an icosahedron (pigeonhole over the vertex cones, table of points, box certificates; v1.0)
- `docs/reduction_tetintet_n03.md` – three and four tetrahedra in a tetrahedron (two-cell pigeonhole, one-piece inequalities (★A)/(★M), box certificates; v1.0)
- `docs/plateau.md` – three to five pieces in a tetrahedron (icosahedra and octahedra)
- `docs/verification.md` – how the box lower bounds, the local lemmas and the Lean re-check work; tests; reproduction commands (§7); the formal proofs (§8); the additions of v1.0 (§9)
- `docs/review_log.md` – summary of the reviews and the fixes made
- `certificates/` – the box records, local records and summaries, the exact configurations for $n\ge3$, and `SHA256SUMS`; see [certificates/README.md](certificates/README.md)
- `verifier/` – the Python checkers:
  - `d16_cover_*` – cubinoct
  - `d16d_*` – icoincub, dodinico, icoinoct, icoindod (and stage 0 of cubinoct)
  - `d16e_*` – octindod (two square roots); `d30_problems.py`, `d30_far.py`, `d30_local.py`, `d30_claim.py`, `d30_tests*.py` – cubinico
  - `d28_*` – icointet, cubintet; `d31_*` (with `d28_oct_step0.py`) – octintet
  - `d30_s3_*` (with `d16e_*`, `d30_local.py`, `d30_far.py`) – octinico
  - `d40_*` – tetintet enclosure (`d40_psi.py` is a floating-point estimate of the slack used only to choose the per-box constants $k_N$; replay does not use it)
  - `d30x_problems.py`, `d30x_testsX.py` – dodincub, dodinoct (with `d16e_*`, `d30_*`)
  - `d45_dodintet_*` (with `d28_common.py`, `d16d_common.py`) – dodintet enclosure
  - `d37_tet_n05_*` – tetintet_n05 (records with $R_0=1/16$; run with `D37_R0=1/16`)
  - `d28_plateau_n34.py`, `d31_plateau_n34.py`, `plateau_n05_upper.py`, `plateau_end_check.py` – $n=3$–$5$ of icosahedra and octahedra
  - `d44_*` (with `d16e_*`, `d30_local.py`) – the enclosures of cubindod, icoinico, dodindod, octinoct (v1.0)
  - `kfield.py`, `d40x_*`, `d45x_dodintet_*` – the equalities of tetintet and dodintet; `f6_*.py`, `f6/` – the equalities of cubindod, icoinico, dodindod, octinoct; `d30_diag.py`, `d36_cellpair_preview.py`, `d37_tet_preview.py` – helpers imported by these chains (v1.0)
  - `d87_cub_common.py`, `d87_oct_*` – octincub_n09; `d87_common.py`, `d87_dod_*` – dodinico_n13; `d86_*` – tetintet_n03 (v1.0)
  - `d16b_common.py`, `d11_step1_cubinoct_n02.py` – independent floating-point formulations used only by test X
- `lean/` – the Lean 4 project: the formal proofs of the nineteen $n=2$ results (`PackLean/Formal/`, the kernel-only certificate modules they import, their generators in `tools/`), and the re-check of the arithmetic of the certificates (no Mathlib): `PackLean/D16/`, `PackLean/D28/`, `PackLean/D30/`, `PackLean/D31/`, `PackLean/D30S3/` (octinico), `PackLean/D40/` (tetintet), `PackLean/D30X/` (dodincub, dodinoct), `PackLean/D45DT/` (dodintet), `PackLean/D37N05/` (tetintet_n05), `PackLean/D44/` (the four enclosures), `PackLean/D87Oct/`, `PackLean/D87Dod/` (upper bounds of octincub_n09, dodinico_n13), `PackLean/Plateau/`; injected-error certificates in `*/Test/`, `build.py`, `build_log.txt`; see [lean/README.md](lean/README.md)
- `tests/` – `replay_all.py`, `run_python_tests.py` and how to run the injected-error tests; see [tests/README.md](tests/README.md)
- `requirements.txt` – Python packages with the versions used
- `paper/p1.pdf` – the manuscript on the nineteen $n=2$ results (v1.0.1; not listed in any SHA-256 table)
- `CITATION.cff` – citation metadata; `LICENSE` – MIT

Quick check (Python 3.10 or later):

```bash
pip install -r requirements.txt
python -X utf8 tests/replay_all.py
```

## Authorship and review

The mathematical arguments, the code, the Lean proofs, the tests, and the reviews were produced by Claude (Anthropic's AI model), in sessions directed by the repository owner. There has been **no human review**.

## License

MIT (see [LICENSE](LICENSE)).

## Citation

Cite as: Hirotaka Nakano, *packing-optimality-certificates*, Zenodo, DOI [10.5281/zenodo.24191316](https://doi.org/10.5281/zenodo.24191316) (concept DOI, all versions); v0.1.0: [10.5281/zenodo.24191317](https://doi.org/10.5281/zenodo.24191317); v0.2.0: [10.5281/zenodo.24195467](https://doi.org/10.5281/zenodo.24195467); v0.3.0: [10.5281/zenodo.24223156](https://doi.org/10.5281/zenodo.24223156); v1.0.0: [10.5281/zenodo.24529459](https://doi.org/10.5281/zenodo.24529459); v1.0.1: [10.5281/zenodo.24529695](https://doi.org/10.5281/zenodo.24529695).

See [CITATION.cff](CITATION.cff). Please cite the nineteen $n=2$ results as formally verified in Lean 4, and everything else as computer-assisted results, not as formal proofs.
