# Lean: formal proofs of the n = 2 cases (v1.0) and the re-check of the arithmetic

A Lean 4 project (`leanprover/lean4:v4.36.0-rc2`, see `lean-toolchain`; Mathlib `9d581dfff2e41de989072ea63abf3daf69311520`, see `lake-manifest.json`). It holds two different things:

1. **Formal proofs of the 19 n = 2 cases (v1.0, `PackLean/Formal/`).** The claims are stated in `PackLean/Formal/Spec.lean` and proved by the last theorem of each case module (`<case>_n02_proof`); `PackLean/Formal/N2All.lean` proves their conjunction `n2_all`. These proofs are checked by the Lean kernel (`decide +kernel` and ordinary proofs): `#assert_std_axioms` (`PackLean/AxiomAudit.lean`, which stops the build otherwise) is applied to each of the 19 main theorems and to `n2_all`, and sixteen of them and `n2_all` are also printed by `#print axioms` (not `dodintet`, `octintet`, `tetintet`); only the three standard axioms `propext`, `Classical.choice`, `Quot.sound` appear (no `Lean.ofReduceBool`, so no `native_decide`). Some imported data modules of the re-check below (27 files) also contain `native_decide` theorems; the main theorems use their definitions only. See [Formal proofs (v1.0)](#formal-proofs-v10) below.
2. **The re-check of the arithmetic of the certificates (v0.1.0–v0.3.0, and the additions of v1.0.0).** It imports nothing outside Lean core: no Mathlib, Std or Batteries (only the formal proofs use Mathlib). **It checks arithmetic only**; what it does not check is listed in [docs/verification.md §6](../docs/verification.md#what-lean-does-not-check). The $n=2$ certificates are proved with `native_decide`, which trusts the Lean compiler; the $n=3$–$5$ substitutions (`PackLean/Plateau/`) and the v1.0.0 upper bounds of octincub_n09 and dodinico_n13 (`PackLean/D87Oct/`, `PackLean/D87Dod/`) use `decide +kernel` only.

## Layout

| path | content |
|---|---|
| `PackLean/D28/Core.lean` | hand-written checker shared by all cases: field elements of Q(√p₁, √p₂, …), lower bounds with 2^-120 enclosures, tree walking, the tetrahedral far/local checks |
| `PackLean/D16/Core.lean` | hand-written checker for `d16d_*` (icoincub, dodinico, icoinoct; constants checks of cubinoct) |
| `PackLean/D16/CoverCore.lean` | hand-written checker for `d16_cover_*` (cubinoct) |
| `PackLean/D16/{IcoOct,IcoCub,DodIco,CubOct}/` | exported data and theorems per case (`Data`, `Tok*`/`CoverTok*` tree chunks, `Far`/`CoverFar`, `Local`/`CoverLocal`, `Consts`) |
| `PackLean/D28/{Ico,Cub}/` | exported data and theorems (`Data`, `Far000…`, `Far`, `Local`, `Consts`) |
| `PackLean/D16/{IcoDod,OctDod}/`, `PackLean/D16/AxiomsB2.lean` | icoindod, octindod (v0.2.0), checked by the unchanged `D16/Core.lean`; Q(√2, √5) as four components with generators `ps := [5, 2]` |
| `PackLean/D30/` | cubinico (v0.2.0), also checked by `D16/Core.lean`; the stored local certificate is exported as it is |
| `PackLean/D31/` | octintet (v0.2.0): hand-written integer-only `Core.lean`, exported `Data`, `Consts`, `Far000…Far026`, `Far`, `LocJ*`, `LocC*`, `Local`, `Axioms`, `Kernel/` (trials), `Test/` |
| `PackLean/D30S3/` | octinico (v0.3.0, the tube): hand-written `Core.lean` on top of the unchanged `D16/Core.lean` (tube far test `insideTube`, tube local check `localOkT` with weighted + lifted leaves, stage-3 constants), exported `Data`, `Tok000`, `Far`, `Local`, `Consts`, `Axioms`, `Kernel/` (trials), `Test/` (16 injected errors) |
| `PackLean/D40/` | tetintet (v0.3.0): hand-written integer-only `Core.lean`, exported `Data`, `Consts`, `Far000…Far065`, `Far`, `Loc00…Loc06`, `Local`, `Axioms`, `Kernel/` (trials), `Test/` (14 injected errors) |
| `PackLean/D37N05/` | tetintet_n05 (v0.3.0): hand-written integer-only `Core.lean` (based on D40), exported `Data`, `Consts`, `Far000…Far097`, `Far`, `Loc00…Loc03`, `Local`, `Axioms`, `Test/` (16 injected errors) |
| `PackLean/D45DT/` | dodintet (v0.3.0): hand-written `Core.lean` (on top of `D28/Core.lean`), exported `Data`, `Far000…Far050`, `Far`, `Local`, `Consts`, `Axioms`, `Test/` (13 injected errors) |
| `PackLean/D30X/` | dodincub (`Cub/`) and dodinoct (`Oct/`) (v0.3.0), checked by the unchanged `D16/Core.lean`; the stored local certificates (single candidates only) are exported as they are; `Test/` (9 injected errors each) |
| `PackLean/Plateau/` | n = 2..5 in a tetrahedron (v0.2.0): `Core.lean` (Q(√d) as integer pairs), `Data`, `Ico`, `Oct`, `N5Data`, `N5` (upper bounds), `N5EndCore`, `N5End` (lower bound, hand-written), `Axioms`, `N5Axioms`, `Test/` |
| `PackLean/D16/Axioms.lean`, `PackLean/D28/{Ico,Cub}/Axioms.lean` | `#print axioms` of the top-level theorems |
| `PackLean/D16/Test/`, `PackLean/D28/Test/` | injected-error certificates (must fail to build) |
| `PackLean/D16/IcoOct/Kernel.lean`, `PackLean/D28/Ico/Kernel/` | optional trials with `decide +kernel` on parts of the data (see docs/verification.md §6) |
| `tools/export_d16.py`, `tools/export_d28.py`, `tools/export_d16e.py`, `tools/export_d30.py`, `tools/export_d31.py`, `tools/export_plateau.py`, `tools/export_d30s3.py`, `tools/export_d40.py`, `tools/export_d30x.py`, `tools/export_d37n05.py`, `tools/export_d45dt.py`, `tools/export_d44.py` (v1.0.0) | exporters: write the data files from the Python records (never edited by hand) |
| `build.py` | builds one case module by module |
| `PackLean/D44/{Cubindod,Icoinico,Dodindod,Octinoct}/` | the four enclosures added in v1.0.0 (cubindod, icoinico, dodindod, octinoct; 9 matching digits): exported `Data`, `Tok*`, `Far`, `Local`, `Consts`, `Axioms` (`native_decide`), `Test/` (23 injected errors, 27 targets that must fail); `PackLean/D44/Core.lean` hand-written. The kernel-only parts `K/`, `KL/`, `KR/`, `KLocal.lean`, `KSegQ.lean` belong to the formal proofs |
| `PackLean/D87Oct/Arith.lean`, `PackLean/D87Dod/Arith.lean` | v1.0.0: exact upper-bound placements of octincub_n09 and dodinico_n13 (`decide +kernel`, integers only) |
| `PackLean/Formal/` | v1.0: the formal proofs (131 modules in the import closure of `N2All`: hand-written semantics and bridges, `Spec.lean`, `Cases/` 32 modules; 113 of the 131 are hand-written, the other 18 are generated: the 13 `Cases/*Data`, `PolytopeData`, `TetData`, and the case modules `CubTet`, `IcoTet`, `TetTet`) |
| `PackLean/D16/Kernel*.lean`, `PackLean/*/K/`, `*/KL/`, `*/KR/`, `PackLean/D28/{FarSeg,LocalSeg,UpperCore}.lean`, `PackLean/D31/{FarSeg,LocalSeg,Upper,UpperCore}.lean`, `PackLean/D40/{FarSeg,LocalSeg}.lean`, `PackLean/D45DT/{CoreL,KSegL,LeafN}.lean`, `PackLean/E3f/`, `PackLean/E3h/`, `PackLean/E3i/`, `PackLean/Kernel/`, `PackLean/AxiomAudit.lean` | v1.0: kernel-only (`decide +kernel`) versions of the certificate trees and their segment checkers, imported by the formal proofs |
| `tools/export_d28_far_k.py`, `export_d28_kernel.py`, `export_d28_local_k.py`, `export_d28_upper.py`, `export_d31_upper.py`, `export_d40_k.py`, `export_kernel_far.py`, `export_formal_cases.py`, `export_formal_poly.py`, `export_tet_cases.py`, `e3g_gen_d44.py`, `e3g_gen_d30s3.lean`, `e3g3_gen_d45dt.lean`, `formal_src/export_d16.py`, `formal_src/export_d31.py` | v1.0: the generators of the kernel-only modules, as they were run (which tool wrote which modules is recorded in the authors' working notes, which are not part of this repository). `formal_src/` holds the working versions of two exporters whose v0.3.0 English versions keep their names in `tools/` |
| `tools/e3i/`, `tools/e3h/export_dt_seg.py`, `tools/check.py` | v1.0: rebuilding the 258 generated dodintet modules of `PackLean/E3i/{Gen,Bun,NT}/` (not in this bundle, 223 MB): `tools/e3i/README.md`, `rebuild.py`, the SHA-256 lists `export_meta_kernel.json` (Gen) and `sha256_bun_nt.txt` (Bun, NT) |
| `SHA256SUMS_sources.txt`, `sources_vs_worktree.tsv` | SHA-256 of every file here, and its relation to the authors' working tree (see [Source identity](#source-identity)) |

## Build

```bash
python build.py icoinoct     # about 40 s; cubinoct ~40 s, icoincub ~1 min, dodinico ~5 min, icointet ~4 min, cubintet ~12 min
python build.py all          # all n = 2 cases, then the #print axioms summaries
python build.py icoindod     # also octindod (~3 min), cubinico (~2 min), octintet (~5 min)
python build.py octinico     # ~3 min (mostly Data: the field Q(√2, √5)); tetintet ~16 min (the far sequence of 452,642 items)
python build.py tetintet_n05 # ~80 min (98 far modules, about 4,600 s; local about 75 s)
python build.py dodintet     # ~75 min one module at a time (the far R trees, 20 million characters)
python build.py dodincub     # ~2 min (far 62 s); dodinoct ~5 min (11 far chunks, far 129 s)
python build.py plateau      # n = 2..5 in a tetrahedron, decide +kernel (under 1 min)
python build.py inject       # injected-error certificates of D16, D28, D30, D31, D30S3, D40, D30X, D37N05, D45DT: each must fail with native_decide evaluating to false
python build.py inject d30s3 # only octinico (18 targets, about 2-3 min each); `inject d40` only tetintet (19 targets)
python build.py inject d30x  # dodincub and dodinoct (9 targets each that must fail, 2 each in EXPECT_PASS; ~16 min)
python build.py inject plateau   # the 24 plateau injected errors: each must fail ('decide' proved false, or a type mismatch)
python build.py kernel       # optional kernel trials (several minutes)
python build.py cubindod     # v1.0.0 enclosures; also icoinico, dodindod, octinoct (far 168-1,016 s each)
python build.py inject d44   # the injected errors of the four enclosures: 27 targets must fail, 1 in EXPECT_PASS builds
python build.py d87          # v1.0.0 upper bounds of octincub_n09 and dodinico_n13 (decide +kernel)
```

`build.py` calls `lake build <module>` for one module at a time, in dependency order. `lake build` alone builds only the shared checkers (`PackLean.lean`).

## Re-exporting the data

From the repository root (the exporters read `verifier/` and `certificates/` and change nothing there):

```bash
python -X utf8 lean/tools/export_d16.py --prob icoinoct     # also dodinico, icoincub, cubinoct
python -X utf8 lean/tools/export_d28.py --prob icointet     # also cubintet
python -X utf8 lean/tools/export_d16e.py --prob octindod    # also icoindod
python -X utf8 lean/tools/export_d30.py
python -X utf8 lean/tools/export_d31.py
python -X utf8 lean/tools/export_d30s3.py
python -X utf8 lean/tools/export_d40.py                    # --kernel for Kernel/, --inject <kind> for Test/<Kind>/
python -X utf8 lean/tools/export_d37n05.py                 # --inject <kind> for Test/<Kind>/
python -X utf8 lean/tools/export_d45dt.py                  # --inject <kind> for Test/<Kind>/ (13 kinds)
python -X utf8 lean/tools/export_d30x.py dodincub          # also dodinoct
python -X utf8 lean/tools/export_d44.py cubindod           # also icoinico, dodindod, octinoct (v1.0.0)
python -X utf8 lean/tools/export_plateau.py --inject && python -X utf8 lean/tools/export_plateau.py --inject --n5
```

For the local stages that store no box tree, the exporters re-run the same search as the Python local checker and record the tree; the stored local records of cubinico, octintet, octinico and tetintet are exported as they are.
The injected-error variants of octinico are written with `export_d30s3.py --inject <kind> --out lean/PackLean/D30S3/Test/<Kind> --modprefix PackLean.D30S3.Test.<Kind>`; the variant `nolift` also needs the faulty record `d30_s3_octinico_local_faultnolift.json` (made by the Python local checker with `--fault nolift`), which is not among the certificates.

- **dodintet** (`PackLean/D45DT/`). Field Q(√5), using the D28 field elements and polynomials. The far part rebuilds the n tree (root [0,1]², 5,477 pair boxes, 114 outside boxes) and, for each pair box, the U and L trees from strings; Lean builds κ of each tree from k̂, the pair type and the offset, checks the pair sum at the corners, accepted leaves by the D28-style integer bound (√5 bracketed at 2^-120), discarded leaves by tr(RK) − tr(R) > 0 with the 60 piece rotations, L leaves by the point box lying in the tube parallelogram, offset ≤ 0, and the 8 corners of the R box in the cone |w_i| ≤ r0·w0 (w = q̄_c ⊗ q, exact in Q(√5)). The local part builds |q|²(F_c − κ) for every candidate of the two tubes from the tube constants, splits it into e₀ and Λ_c itself, and checks e₀ ≥ 0 at both ends of u and the lower bound of Λ_c > 0 on every leaf. The constants checks cover the piece, the rotations, the tube weights, the upper-bound placement and the sandwich 0 < 2√2(u_up − c̄) < 4·10^-10.

The D30X exporter (`tools/export_d30x.py dodincub|dodinoct`) imports `verifier/d30x_problems.py` and cross-checks the constants
written to Lean against the records: the strings S* and R* of the local record equal the problem built by `load_x` and
the claim record, and the integers written to `Data.lean` decode back to S*, to R* applied to the standard dodecahedron
(20 vertices) and to R* applied to the face normal n0, parsed independently from the record strings (review FD_d30x H4 (3)).
Injected errors: `--inject <kind> --out lean/PackLean/D30X/<Cub|Oct>/Test/<Kind> --modprefix PackLean.D30X.<Cub|Oct>.Test.<Kind>`;
only the parts that carry the error are kept in `Test/<Kind>/`.


What Lean builds for octinico and tetintet:

- **octinico** (`PackLean/D30S3/`). The far part walks the 4 chart trees of the stored far record with the D16 acceptance and discarding checks; an L leaf passes only if the 8 corners of its box lie inside the tube (exact integer test on the tube coordinates). The local part builds, on each of the 4 tube edges, the substitution p = τ(a1)·n + ρ·θ(a2) itself, checks the degree-0 identities (F divisible by ρ for all 36 candidates on the 4 edges, F(t·n) ≡ 0), and checks each leaf: single candidates (G = F/ρ > 0, conditions on A_j), and weighted + lifted leaves with the same formula as `d30_local.check_mix`, where Lean builds the lifting loss 2(n_f·Rq v − S*N) from the normals, vertices and S* (no Python values are copied). The constants include the tube basis, R* = spin(−1/5) applied by Lean to the unrotated octahedron, S* = C0·s* = √2 and s* = 3√2 − √10. The theorems state the Python counts on their right-hand sides (far 676 / 206 / 44, local 4·4·4·4 with 10 single and 6 weighted).
- **tetintet** (`PackLean/D40/`). Integers only. The far part rebuilds the n tree (root [0,1]², 236 ok boxes and 18 out boxes) and, for each n box and each side A / B, the R tree; an accepted leaf is checked by building the candidate expression |q|²·(G̃_c,μ ∓ κ_N) from the definition of G̃ at the corners of the n box (types F, M(μ) and S), a discarded leaf by tr(Rk) − tr(R) > 0, an L leaf by the n box lying in N₁ and the 8 vertices of the R box lying in the cube of its centre. The local part builds P_c from each of the 7 centres, splits it into e₀ and Λ_c itself, and checks e₀ ≥ 0 and the lower bound of Λ_c > 0 on every leaf. The constants checks cover the piece rotations, the centres as images of R̂, the κ coefficients, the upper-bound placement and the bracketing s̄ < s_up < s̄ + 10⁻⁹.

Some injected-error variants are expected to **build**, because they move a constant in the easy direction for that module (`build.py` lists them as `EXPECT_PASS`): `D30.Test.RhoBig.Far` and `.Consts` (a larger local region only makes the far region easier; the local module rejects it) and `D31.Test.UJ.LocJ` (a narrower band $J$ only makes the local lemma easier; the far module rejects it). In v0.3.0: `D30S3.Test.RhoBig.Far` / `.Consts` and `D30S3.Test.TwBig.Far` / `.Consts` (a wider tube keeps the leaves of the original tube inside it, so the far check only gets easier, and the widened constants are consistent with each other; the local modules reject both), `D30S3.Test.TcShift.Consts` (the tube centre is not a checked constant; the local and far modules reject the shift), and `D40.Test.R0Big.Far000` (a larger r₀ keeps the 1/32 L leaves inside the larger region; the local modules LocS and LocC reject it).
Each `D30S3/Test/<Kind>/` directory holds every exported part, but only the parts that carry the injected error are targets (`INJECT_ONLY` in `build.py`); the untouched parts are not built.

Kernel trials (`build.py kernel`, not part of `all`): for octinico, the first 40 far items, 3 tube leaves, one candidate and one local leaf (about 50 s and 3.4 GB in the original run; one whole tube edge exceeded 10 GB and was stopped); for tetintet, all constants theorems, three small n boxes (about 400 s and 7.1 GB) and three local faces (the middle n box exceeded 8 GB and was stopped). Their `#print axioms` show only the three standard axioms. The full certificates use `native_decide`.


## Formal proofs (v1.0)

```bash
lake exe cache get           # Mathlib cache (once)
python build.py formal       # the 19 case modules one at a time, then PackLean.Formal.N2All; prints #print axioms
```

`build.py formal` needs the generated dodintet modules first: `PackLean/Formal/Cases/DodTet.lean` imports 258 modules of `PackLean/E3i/{Gen,Bun,NT}/` (223 MB) that are not stored here. They are written by `tools/e3i/rebuild.py` (about 9.5 hours on 8 cores in the authors' run, with up to about 30 GB of commit memory) and checked against the SHA-256 lists in `tools/e3i/`. Note: `tools/e3i/coarsen.py` reads the Python far checker from `../../../pp/global_opt/` (the authors' working tree); in this bundle the same checker is `verifier/d45_dodintet_far.py`, and `tools/e3i/README.md` gives the one-line copy that puts it where `coarsen.py` expects it.

| claim (Spec.lean) | main theorem | module |
|---|---|---|
| cubinoct_n02 | `PackLean.Formal.Up.cubinoct_n02_proof` | `Formal/CubinoctUpper.lean` |
| icoincub_n02, dodinico_n02, icoinoct_n02, icoindod_n02, octindod_n02, cubinico_n02, icointet_n02, cubintet_n02, octintet_n02, octinico_n02, dodincub_n02, dodinoct_n02, tetintet_n02, dodintet_n02, cubindod_n02, icoinico_n02, dodindod_n02, octinoct_n02 | `PackLean.Formal.Cases.<Case>.<claim>_proof` | `Formal/Cases/{IcoCub,DodIco,IcoOct,IcoDod,OctDod,CubIco,IcoTet,CubTet,OctTet,OctIco,DodCub,DodOct,TetTet,DodTet,CubDodR,IcoIco,DodDod,OctOct}.lean` |
| all 19 | `PackLean.Formal.N2All.n2_all` | `Formal/N2All.lean` |

## Source identity

The import closure of `PackLean.Formal.N2All` has 3,951 modules: 3,693 are stored here and 258 are the generated dodintet modules above. `sources_vs_worktree.tsv` lists every file with its SHA-256 and its relation to the authors' working tree (in its source column, `v040` is the authors' name of a staging directory; no v0.4.0 was released): 3,636 of the 3,693 closure files are byte-identical to the files that were built for the results; the other 57 are the English copies already published in v0.3.0 (53) or made for the four enclosures of v1.0.0 (4, `D44/*/Data.lean`, whose header comment cites the English verifier) and are identical to the working tree after removing comments. The byte-identical files keep the authors' comments, which are partly in Japanese (3,449 files); the Lean code itself contains no Japanese. `build_log.txt` records the build of 2026-11-25 in the authors' working tree, whose sources are those of this directory (byte-identical, or identical apart from comments for the 57 files above). That build was made after the last source edits (comments in `Spec.lean`, an axiom assertion in `CubDodR.lean`), with the Lake artifact cache disabled; Lake rebuilt every module that imports `Spec.lean` (the modules of `PackLean.Formal`, the hand-written `E3i.BunCore` and `E3i.BunCase`, `PackLean.Formal.N2All`, and the generated `E3i.Bun` and `E3i.NT` modules; the 154 `E3i.Bun` modules were built first, two at a time), one target at a time (`lake build` of `Spec`, each of the 19 case modules, then `N2All`); all 21 targets exited with 0 and every axiom report lists only `propext`, `Classical.choice`, `Quot.sound`. An earlier build of the same day, with the compiled files of the 113 hand-written modules deleted beforehand, also passed. The rest of the closure (the generated certificate modules, the checkers and Mathlib) was reused from earlier builds of the same sources; the 258 generated dodintet modules were rebuilt from scratch on 2026-11-24 (`tools/e3i/README.md`). A single `lake build PackLean.Formal.N2All` with everything to rebuild ran out of memory (91.6 GB); one target at a time the peak was 15.6–26.3 GB (in the final build, a single `lake build` of `Cases.DodTet` that had to rebuild the `E3i.Bun` modules in parallel was also stopped, at 114.7 GB, and those modules were then built two at a time). No build from this copy of the repository has been made.
