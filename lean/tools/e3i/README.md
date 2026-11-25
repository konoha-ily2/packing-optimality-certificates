# Rebuilding the generated dodintet modules (`PackLean/E3i/`)

The formal proof of `dodintet_n02` (two unit dodecahedra in a regular tetrahedron), `PackLean.Formal.Cases.DodTet.dodintet_n02_proof` in `PackLean/Formal/Cases/DodTet.lean`, imports **258 generated modules** that are not stored in this repository:

| directory | modules | written by |
|---|---|---|
| `PackLean/E3i/Gen/` | 101 (206 MB) | `export.py` |
| `PackLean/E3i/Bun/` | 154 in the import closure (156 written) | `bundle.py` |
| `PackLean/E3i/NT/` | 3 | `ntree_seg.py --whole` |

Of the 434 modules in the import closure of `DodTet`, these 258 are the only ones that are not stored here. After a fresh clone they must be regenerated before `DodTet` (and therefore `PackLean.Formal.N2All`) can be built. This directory contains the tools to do that and the SHA-256 lists to check that the regenerated files are the ones the authors built.

The proof is checked by the Lean kernel only: `#print axioms` of `dodintet_n02_proof`, `PackLean.E3i.NT.All.okAll` and `PackLean.E3i.NT.All.dodintet_n02_proofK` shows only the three standard axioms `propext`, `Classical.choice`, `Quot.sound` (no `native_decide`).

The scripts' comments and progress messages are in Japanese; the commands and the files they write are described below.

## One command: `rebuild.py`

Run from the repository root (the directory that contains `lean/`):

```bash
cd lean && lake exe cache get && cd ..             # Mathlib cache (once)
python -X utf8 lean/tools/e3i/rebuild.py --dry-run   # list every stage as "skip" or "run", with its commands
python -X utf8 lean/tools/e3i/rebuild.py             # the real run (about 9.5 hours, see below)
```

| option | meaning |
|---|---|
| `--jobs 4` | number of modules passed to one `lake build` call (default 4; see [Why four at a time](#why-four-modules-at-a-time)) |
| `--procs 8` | number of worker processes of `coarsen.py` |
| `--from STAGE` / `--only STAGE` | start at, or run only, one stage of the table below |
| `--no-skip` | ignore the skip conditions below (`lake` still returns quickly for modules it has already built) |

The stages run in the order of the table below. A stage is skipped when its output is already there: `coarse` when all 51 files of `Coarse/` exist, `export` when the SHA-256 of all 101 `Gen/` files match `export_meta_kernel.json`, a `lake build` batch when every `.olean` is newer than its `.lean`, and `bundle` when `Bun/All.lean` and `NT/All.lean` exist. `rebuild.py` stops at the first failing stage with exit code 1. It exits with 0 only after the last stage, when all three theorems above depend on the three standard axioms only.

The `lake` stages are skipped by modification time only. After `bundle` has rewritten its files, batches that were already built go through `lake build` again; `lake` recognises them by content hash and returns in about 8 seconds per batch.

### Prerequisite in this repository: the Python far checker

`coarsen.py` imports the far checker `d45_dodintet_far.py` (and the modules it imports) from `pp/global_opt/` next to `lean/`, which is where it lives in the authors' working tree. This repository has the English copy of the same checker in `verifier/`. Before the first run, make it available under that name, together with the three records that `d45_dodintet_common.py` reads from its working directory at import:

```bash
mkdir -p pp && cp -r verifier pp/global_opt
cp certificates/d45_dodintet_upper.json certificates/d45_dodintet_far.json certificates/dodintet_n02.json pp/global_opt/
```

Without them every worker of `coarsen.py` stops at import and the pool starts new ones without end, with no output (2026-11-25).

`coarsen.py` needs `numpy`; `rebuild.py` itself uses only the standard library (`memlog.py`, an optional memory logger, needs `psutil`).

Whatever the checker produces, the next stage compares the 101 written `Gen/` files with the SHA-256 list `export_meta_kernel.json` and stops if a single file differs, so a different result of `coarsen.py` cannot pass unnoticed. The authors' full rebuild (below) was run in their working tree, not from this copy of the repository.

## Stages, commands, time and memory

Times are wall-clock times on the authors' machine (8-core / 16-thread desktop CPU, 64 GB RAM, 16 GB page file, Windows). Two runs are reported:

- **2026-11-19**: the first build, stage by stage, partly alongside other jobs. The memory column comes from this run.
- **2026-11-24**: a full run of `rebuild.py --jobs 4 --procs 8` in a fresh clone, from nothing to the axiom check: **34,133 s (9 h 29 min)**. Memory was not logged in this run.

| stage | command | output | time | memory |
|---|---|---|---|---|
| coarse | `python -X utf8 lean/tools/e3i/coarsen.py --procs 8` (repository root) | `lean/PackLean/E3i/Coarse/F000.json.gz` … `F050.json.gz`: the far R trees with pairs of sibling leaves merged into their parent (4.05 million leaves → 3.06 million) | 1,829 s (11-19); 1,963 s (11-24) | small (not measured) |
| export | `python -X utf8 lean/tools/e3i/export.py --mode kernel --coarse` (repository root) | `lean/PackLean/E3i/Gen/F{f}_{k}.lean`, 101 files, 206 MB: 81,665 intervals of the segment checker `segN`, each checked by `decide +kernel` | 13 s (11-24) | small (not measured) |
| (check) | done inside `rebuild.py`: SHA-256 of the 101 `Gen/` files against `export_meta_kernel.json` | — | under 1 s; on 11-24 all 101 files matched | — |
| gen | `lake build PackLean.E3i.Gen.F000_000 …` (in `lean/`): the 101 modules of `kernel_items.txt`, 4 per call, 26 calls | `.olean` files of `Gen/` | one module 470–1,245 s (median 860 s), 23.9 CPU hours in total. On 11-24: 28,521 s (7 h 55 min) wall clock; one batch of 4 took 987–1,265 s (mean 1,119 s), the last batch (one module) 557 s | peak RSS of one module 2.9–3.75 GB. Commit charge not measured; if it is about twice the RSS, as for the `Bun` F modules, 4 modules need around 30 GB (estimate) |
| bundle | `python -X utf8 lean/tools/e3i/bundle.py`, then `python -X utf8 lean/tools/e3i/ntree_seg.py --whole` (repository root) | `Bun/`, 156 files (`Recs`, `F*`, `R*`, `Final`, `All`, `NTree`); `NT/`, 3 files (`NTree`, `Final`, `All`) | 1.4 s together (11-19); 1 s (11-24) | small |
| bunF | `lake build PackLean.E3i.Bun.F000_000 …` (in `lean/`): 101 modules, 4 per call, 26 calls | `TreeR` for each tree | 11-19: bunF and bunR together 1,512 s in 39 calls, 36–113 s per call. 11-24: 2,107 s in 26 calls; the first call 843 s (it also builds prerequisites, see below), the other 25 calls 45–56 s | peak RSS of one call at most 18 GB; **commit charge of one F module about 8 GB** |
| bunR | `lake build PackLean.E3i.Bun.R000 …` (in `lean/`): 51 modules, 4 per call, 13 calls | `headOk ∧ TreesR` for each group | 11-19: 34–38 s per call. 11-24: 534 s in 13 calls; the first call 86 s, the others 36–40 s | peak RSS of one call 13.6 GB |
| final | `lake build PackLean.E3i.NT.All PackLean.Formal.Cases.DodTet` (in `lean/`) | the n tree (`NT/NTree`), `okAll`, `dodintet_n02_proofK`, `DodTet` | 11-19: `NT/NTree` 57 s, `NT.All` 30 s, `DodTet` 26 s. 11-24: 963 s in one call (including the remaining prerequisites of `DodTet`) | `NT/NTree` 5.12 GB |
| axioms | `python -X utf8 lean/tools/check.py PackLean/Formal/Cases/DodTet.lean --axioms PackLean.Formal.Cases.DodTet.dodintet_n02_proof PackLean.E3i.NT.All.okAll PackLean.E3i.NT.All.dodintet_n02_proofK` (repository root; the path is relative to `lean/`) | — | 31 s (11-24) | — |

Notes:

- **`Bun/NTree.lean` and `Bun/All.lean` are not built.** They write the n tree as a `String`; unfolding `String.toList` in the kernel grew to 31 GB. The proof uses the `NT/` versions, which write the same tree as a `List Char` literal. `bundle.py` still writes the two files, and they are in the SHA-256 list.
- **Prerequisites stored in the repository** (the other 176 modules of the import closure of `DodTet`, such as `PackLean/D45DT/` and the kernel-only modules) are built by the first `lake build` that needs them. The log does not separate their time. In the 11-24 run the first bunF call took 843 s (the others about 50 s) and `final` took 963 s (the three modules took 113 s together on 11-19), so the prerequisites took roughly 1,600 s (27 min) in total; this is an estimate from these differences.
- **Result of the 11-24 run.** All 70 external commands exited with 0, the SHA-256 check of `Gen/` and the axiom check passed, and the run ended with exit code 0. All three theorems depend on `propext`, `Classical.choice` and `Quot.sound` only.
- **SHA-256 of `Bun/` and `NT/`.** The 159 files written by `bundle.py` and `ntree_seg.py --whole` (157 in the import closure, plus `Bun/All.lean` and `Bun/NTree.lean`) are listed in [`sha256_bun_nt.txt`](sha256_bun_nt.txt), in `sha256sum` format with paths relative to `lean/`. On 11-24 the files of the fresh clone matched the authors' working tree, 159 of 159. `rebuild.py` does not check this list itself; to check it, run in `lean/`:

  ```bash
  grep -v '^#' tools/e3i/sha256_bun_nt.txt | sha256sum -c --quiet
  ```

## Why four modules at a time

`lake` has no `-j` option: one `lake build` call runs as many waiting modules at the same time as there are cores (about 16 here). On 2026-11-19 the 101 F modules and 51 R modules of `Bun/` were left to a single `lake build PackLean.E3i.NT.All`. One F module has a peak RSS of 3–4 GB but a commit charge of about 8 GB, so the system commit limit (64 GB RAM + 16 GB page file) was exhausted and 94 modules failed to build (`failed to read file …olean`, Windows error 1455). The number of parallel modules must therefore be chosen by commit charge (about 8 GB per module), not by RSS. With 5 modules per call the free virtual memory went down to 11 GB, so the default is 4. **On a machine with less memory, lower `--jobs`.**

## Files in this directory

| file | role |
|---|---|
| `README.md` | the authors' notes in Japanese (the same content as this file) |
| `rebuild.py` | runs all stages in order (above) |
| `coarsen.py`, `export.py`, `bundle.py`, `ntree_seg.py` | the stages coarse, export, bundle |
| `export_meta_kernel.json` | the list of the 101 `Gen/` files with their size and SHA-256 |
| `sha256_bun_nt.txt` | SHA-256 of the 159 `Bun/` and `NT/` files |
| `kernel_items.txt` | the 101 `Gen/` modules built in the gen stage |
| `fallback.txt` | trees to be written in their original (unmerged) form; empty |
| `after_coarsen.py`, `run_eval.py`, `export_meta_eval.json` | optional pre-check with `#eval` (below) |
| `memlog.py` | optional memory logger used for the measurements above |

The hand-written Lean files of this part are `PackLean/E3i/Consts.lean`, `BunCore.lean` and `BunCase.lean`. The far records that the trees come from are stored in `PackLean/D45DT/Far000.lean` … `Far050.lean` and `PackLean/D45DT/Data.lean`. The generated directories `PackLean/E3i/{Coarse,Gen,Bun,NT}/` (and the authors' trial directories `Eval/`, `Err/`, `Demo/`, `TGen/`, `TBun/`) are not stored in the repository.

## Optional pre-check

`coarsen.py` decides merged leaves in Python but does not model the √ enclosures and the reduction of the boxes that Lean uses. When the merged trees were first made, `after_coarsen.py` checked all 81,665 intervals with `#eval` (28 minutes with 10 processes, on 2026-11-19 with no failure). For a rebuild this is not needed when the `Gen/` files match `export_meta_kernel.json`, since they are then the same files. In any case soundness rests on the kernel: a leaf that does not hold makes the gen stage fail to build.

## Authors' local tooling

In the authors' own run the gen stage was driven by a local job runner (one module per `lake build`, with a memory cap of 8 GB per job), followed by the bundle, bunF/bunR (4 at a time), `NT.All` and the axiom check. That runner is not part of this repository; `rebuild.py` runs the same sequence without it (with `Gen/` also built 4 at a time) and continues to `DodTet`.
