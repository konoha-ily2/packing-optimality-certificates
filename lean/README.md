# Lean re-check of the arithmetic (no Mathlib)

A Lean 4 project (`leanprover/lean4:v4.36.0-rc2`, see `lean-toolchain`) that re-checks the arithmetic of the certificates independently of the Python code. It imports nothing outside Lean core: no Mathlib, Std or Batteries. **It checks arithmetic only**; what it does not check is listed in [docs/verification.md §6](../docs/verification.md#what-lean-does-not-check). All theorems are proved with `native_decide`, which trusts the Lean compiler.

## Layout

| path | content |
|---|---|
| `PackLean/D28/Core.lean` | hand-written checker shared by all cases: field elements of Q(√p₁, √p₂, …), lower bounds with 2^-120 enclosures, tree walking, the tetrahedral far/local checks |
| `PackLean/D16/Core.lean` | hand-written checker for `d16d_*` (icoincub, dodinico, icoinoct; constants checks of cubinoct) |
| `PackLean/D16/CoverCore.lean` | hand-written checker for `d16_cover_*` (cubinoct) |
| `PackLean/D16/{IcoOct,IcoCub,DodIco,CubOct}/` | exported data and theorems per case (`Data`, `Tok*`/`CoverTok*` tree chunks, `Far`/`CoverFar`, `Local`/`CoverLocal`, `Consts`) |
| `PackLean/D28/{Ico,Cub}/` | exported data and theorems (`Data`, `Far000…`, `Far`, `Local`, `Consts`) |
| `PackLean/D16/Axioms.lean`, `PackLean/D28/{Ico,Cub}/Axioms.lean` | `#print axioms` of the top-level theorems |
| `PackLean/D16/Test/`, `PackLean/D28/Test/` | injected-error certificates (must fail to build) |
| `PackLean/D16/IcoOct/Kernel.lean`, `PackLean/D28/Ico/Kernel/` | optional trials with `decide +kernel` on parts of the data (see docs/verification.md §6) |
| `tools/export_d16.py`, `tools/export_d28.py` | exporters: write the data files from the Python records (never edited by hand) |
| `build.py` | builds one case module by module |

## Build

```bash
python build.py icoinoct     # about 40 s; cubinoct ~40 s, icoincub ~1 min, dodinico ~5 min, icointet ~4 min, cubintet ~12 min
python build.py all          # all six cases, then the #print axioms summaries
python build.py inject       # the 24 injected-error certificates: each must fail with native_decide evaluating to false
python build.py kernel       # optional kernel trials (several minutes)
```

`build.py` calls `lake build <module>` for one module at a time, in dependency order. `lake build` alone builds only the shared checkers (`PackLean.lean`).

## Re-exporting the data

From the repository root (the exporters read `verifier/` and `certificates/` and change nothing there):

```bash
python -X utf8 lean/tools/export_d16.py --prob icoinoct     # also dodinico, icoincub, cubinoct
python -X utf8 lean/tools/export_d28.py --prob icointet     # also cubintet
```

For the local stages, which store no box tree, the exporters re-run the same search as the Python local checker and record the tree.
