# Tests

The tests and injected-error certificates described in [docs/verification.md §5](../docs/verification.md#5-tests). They were written by the same author as the checkers (Claude).

## 1. Replay of the stored certificates (minutes)

```bash
python -X utf8 tests/replay_all.py            # all six cases
python -X utf8 tests/replay_all.py icoinoct   # one case
```

## 2. Python tests U, S, V, C, P, W, X and injected errors m1–m6 (1–17 minutes per case)

The test scripts read the far records from the current directory and write `*_tests.json` (and, for some injected errors, temporary records) there. Run them in a scratch directory holding copies of the records, not in `certificates/`. `tests/run_python_tests.py` does this: it copies the needed records into `work/<case>/` and runs the script there.

```bash
python -X utf8 tests/run_python_tests.py icoinoct          # 300 random cases (default)
python -X utf8 tests/run_python_tests.py cubinoct 50       # fewer cases for a quick look
```

| case | script | injected errors |
|---|---|---|
| cubinoct | `verifier/d16_cover_tests.py [count]` | m1 (shift $S^{\ast}$), m2 (scale 1.001; 0.999 not run, the local checker has no scale parameter), m3 (negative λ, Σλ ≠ 1), m4 (too small $T_1$; and with the check line removed), m5 (halved domain) |
| icoincub, dodinico, icoinoct | `verifier/d16d_tests.py <case> [count]` | m1, m2 (1.001 and 0.999), m3 (negative λ, μ), m4, m5a (fewer symmetry pairs), m5b (a non-symmetry pair) |
| icointet, cubintet | `verifier/d28_tests.py --prob <case> [count]` | m1 (raise $c^{\ast}$), m2 (1.001 and 0.999), m3/m3b (corrupt $k$-sums in a copy of the record, then replay), m5a (halved $n$ domain), m5b (a reflection not in $T_d$), m6 (drop a vertex); m4 does not apply |

Test X for `d16d_*` uses `verifier/d16b_common.py` (an independent floating-point formulation); test X for cubinoct uses `verifier/d11_step1_cubinoct_n02.py` (only its LP definition is executed). The stage-0 scripts (`d16d_step0.py <case>`, `d28_step0.py --prob <case> --skip-map`) are the exact substitution of the optimal configuration (upper bound); test U repeats it.

## 3. Injected-error certificates in Lean (24 modules, must all fail)

```bash
cd lean
python build.py inject        # D16 group (17) and D28 group (7)
python build.py inject d16    # one group
```

Each target is a certificate exported with a deliberate error (`--inject` of `lean/tools/export_d16.py` / `export_d28.py`). The script counts a target as *rejected as expected* only if `lake build` fails because `native_decide` evaluated the statement to `false` (not because of any other error). The errors are listed in docs/verification.md §5.

To re-export one of them (writes to the given directory and module prefix):

```bash
python -X utf8 lean/tools/export_d16.py --prob icoinoct --part far --inject lam --out lean/PackLean/D16/Test/IcoOctLam --modprefix PackLean.D16.Test.IcoOctLam
python -X utf8 lean/tools/export_d28.py --prob icointet --part far --inject kval --out lean/PackLean/D28/Test/Kval --modprefix PackLean.D28.Test.Kval
```
