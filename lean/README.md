# Lean re-check of the arithmetic (no Mathlib)

A Lean 4 project (`leanprover/lean4:v4.36.0-rc2`, see `lean-toolchain`) that re-checks the arithmetic of the certificates independently of the Python code. It imports nothing outside Lean core: no Mathlib, Std or Batteries. **It checks arithmetic only**; what it does not check is listed in [docs/verification.md §6](../docs/verification.md#what-lean-does-not-check). The $n=2$ certificates are proved with `native_decide`, which trusts the Lean compiler; the $n=3$–$5$ substitutions (`PackLean/Plateau/`) use `decide +kernel` only.

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
| `PackLean/Plateau/` | n = 2..5 in a tetrahedron (v0.2.0): `Core.lean` (Q(√d) as integer pairs), `Data`, `Ico`, `Oct`, `N5Data`, `N5` (upper bounds), `N5EndCore`, `N5End` (lower bound, hand-written), `Axioms`, `N5Axioms`, `Test/` |
| `PackLean/D16/Axioms.lean`, `PackLean/D28/{Ico,Cub}/Axioms.lean` | `#print axioms` of the top-level theorems |
| `PackLean/D16/Test/`, `PackLean/D28/Test/` | injected-error certificates (must fail to build) |
| `PackLean/D16/IcoOct/Kernel.lean`, `PackLean/D28/Ico/Kernel/` | optional trials with `decide +kernel` on parts of the data (see docs/verification.md §6) |
| `tools/export_d16.py`, `tools/export_d28.py`, `tools/export_d16e.py`, `tools/export_d30.py`, `tools/export_d31.py`, `tools/export_plateau.py` | exporters: write the data files from the Python records (never edited by hand) |
| `build.py` | builds one case module by module |

## Build

```bash
python build.py icoinoct     # about 40 s; cubinoct ~40 s, icoincub ~1 min, dodinico ~5 min, icointet ~4 min, cubintet ~12 min
python build.py all          # all ten n = 2 cases, then the #print axioms summaries
python build.py icoindod     # also octindod (~3 min), cubinico (~2 min), octintet (~5 min)
python build.py plateau      # n = 2..5 in a tetrahedron, decide +kernel (under 1 min)
python build.py inject       # injected-error certificates of D16, D28, D30, D31: each must fail with native_decide evaluating to false
python build.py inject plateau   # the 24 plateau injected errors: each must fail ('decide' proved false, or a type mismatch)
python build.py kernel       # optional kernel trials (several minutes)
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
python -X utf8 lean/tools/export_plateau.py --inject && python -X utf8 lean/tools/export_plateau.py --inject --n5
```

For the local stages that store no box tree, the exporters re-run the same search as the Python local checker and record the tree; the stored local records of cubinico and octintet are exported as they are.

Some injected-error variants are expected to **build**, because they move a constant in the easy direction for that module (`build.py` lists them as `EXPECT_PASS`): `D30.Test.RhoBig.Far` and `.Consts` (a larger local region only makes the far region easier; the local module rejects it) and `D31.Test.UJ.LocJ` (a narrower band $J$ only makes the local lemma easier; the far module rejects it).
