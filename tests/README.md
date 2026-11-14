# Tests

The tests and injected-error certificates described in [docs/verification.md §5](../docs/verification.md#5-tests). They were written by the same author as the checkers (Claude).

## 1. Replay of the stored certificates (minutes)

```bash
python -X utf8 tests/replay_all.py            # all cases (n = 2 and the plateau)
python -X utf8 tests/replay_all.py icoinoct   # one case; also cubinico, octintet, dodincub, dodintet, tetintet_n05, plateau, ...
```

## 2. Python tests U, S, V, C, P, W, X and injected errors m1–m6 (1–25 minutes per case)

The test scripts read the far records from the current directory and write `*_tests.json` (and, for some injected errors, temporary records) there. Run them in a scratch directory holding copies of the records, not in `certificates/`. `tests/run_python_tests.py` does this: it copies the needed records into `work/<case>/` and runs the script there.

```bash
python -X utf8 tests/run_python_tests.py icoinoct          # 300 random cases (default)
python -X utf8 tests/run_python_tests.py cubinoct 50       # fewer cases for a quick look
```

| case | script | injected errors |
|---|---|---|
| cubinoct | `verifier/d16_cover_tests.py [count]` | m1 (shift $S^{\ast}$), m2 (scale 1.001; 0.999 not run, the local checker has no scale parameter), m3 (negative λ, Σλ ≠ 1), m4 (too small $T_1$; and with the check line removed), m5 (halved domain) |
| icoincub, dodinico, icoinoct | `verifier/d16d_tests.py <case> [count]` | m1, m2 (1.001 and 0.999), m3 (negative λ, μ), m4, m5a (fewer symmetry pairs), m5b (a non-symmetry pair) |
| icoindod | `verifier/d16d_tests.py icoindod [count]` | as for the other `d16d_*` cases |
| octindod | `verifier/d16e_tests.py octindod [count]` | m1, m2, m3, m4, m5a, m5b as for `d16d_*` |
| cubinico | `verifier/d30_tests_full.py cubinico [count] d30_cubinico_local_r16_nolp.json` | as for `d16e_*`; W generalised to the stored local certificate. Further checks of corrupted records: `verifier/d30_tests.py corrupt` |
| octintet | `verifier/d31_tests.py [--n count]` | n1 (sign of $E_c$ flipped), n2a/n2b/n2c (region constants too small / too large: must not close), n3/m1 ($c^{\ast}$ shifted), m5 (corrupted records), m6′ (bad rotation table), m7 (constants differ from the record); n2 (narrower band) closes and is not an error test; K0, F0, L1, P2 as in docs/verification.md §5 |
| octinico | `verifier/d30_s3_tests.py [count] d30_s3_octinico_local.json` | U, FAM, TUBE, S, V, C, P, W (tube coordinates), X, m1 (shift $S^{\ast}$), m2, m3/m4, m5a, m5b; the injected local record with the lift cost removed is checked by `verifier/d30_s3_fault.py` |
| tetintet | `verifier/d40_tests.py --only W,t1,t2,t3,t4,t5,t6,L1,R3` (fixed sample sizes) | t1 (sign of $\mu$ reversed), t2 (the restriction $s_1\le\bar s$ removed or loosened), t3/t4 (a local centre removed), t5 ($s_0+10^{-6}$), t6 (negative $k_N$ next to the local region: replay must fail); W, L1 and R3 as in docs/verification.md §5 |
| dodincub | `verifier/d30x_problems.py verifier/d30_tests_full.py dodincub [count] d30x_dodincub_local_r16.json` | as for cubinico (the d30 test scripts run through `d30x_problems.py`, which installs the problem). Controls of the stored records (`d30x_testsX.py` installs the problem on import): `verifier/d30x_testsX.py dodincub d30x_dodincub_local_r16.json d30_dodincub_far <scratch> parent,corrupt` |
| dodinoct | not in `run_python_tests.py`: the full test set was run only on the record with $\rho_0=1/16$ and weights, not on the record of the claim | controls of the claim record: `verifier/d30x_testsX.py dodinoct d30x_dodinoct_local_r32_nolp.json d30_dodinoct_far_r32 <scratch> parent,corrupt` (about 3 minutes; copy the two records and the far box record into the scratch directory) |
| dodintet | `verifier/d45_dodintet_tests.py --only W,W2,t5,t6,t4,L1,R3` (fixed sample sizes) | t5 ($\bar c+10^{-6}$), t6 (negative pair sum; offset $+1/2$), t4 ($k_L=0$ in the type-III boxes); W, W2, L1 and R3 as in docs/verification.md §5 |
| tetintet_n05 | `D37_R0=1/16 verifier/d37_tet_n05_tests.py`; `D37_R0=1/16 verifier/d37_tet_n05_far_tests.py --name d37_tet_n05_far_r16 --loc d37_tet_n05_local_r16 --only W,Bd,L1,t6,X,Xb,P` (`run_python_tests.py` sets `D37_R0` and runs both) | tb ($\beta$ outside its window), ts ($s_0+1/1000$), t6 ($k_N$ shifted: replay must fail); W, R3, Bd, L1, X, Xb, P as in docs/verification.md §5 |
| icointet, cubintet | `verifier/d28_tests.py --prob <case> [count]` | m1 (raise $c^{\ast}$), m2 (1.001 and 0.999), m3/m3b (corrupt $k$-sums in a copy of the record, then replay), m5a (halved $n$ domain), m5b (a reflection not in $T_d$), m6 (drop a vertex); m4 does not apply |

Test X for `d16d_*` uses `verifier/d16b_common.py` (an independent floating-point formulation); test X for cubinoct uses `verifier/d11_step1_cubinoct_n02.py` (only its LP definition is executed). The stage-0 scripts (`d16d_step0.py <case>`, `d28_step0.py --prob <case> --skip-map`) are the exact substitution of the optimal configuration (upper bound); test U repeats it.

## 3. Injected-error certificates in Lean (must all fail, except the EXPECT_PASS variants)

```bash
cd lean
python build.py inject        # D16 (17 + 10 for icoindod/octindod), D28 (7), D30 (cubinico), D31 (octintet), D30S3 (octinico),
                              # D40 (tetintet), D30X (dodincub, dodinoct: 9 each), D37N05 (tetintet_n05: 16), D45DT (dodintet: 13)
python build.py inject d31    # one group: d16 | b2 | d28 | d30 | d31 | d30s3 | d40 | d30x | d37n05 | d45dt
python build.py inject plateau   # the 24 plateau variants (decide +kernel)
```

Each target is a certificate exported with a deliberate error (`--inject` of `lean/tools/export_d16.py` / `export_d28.py`). The script counts a target as *rejected as expected* only if `lake build` fails because `native_decide` evaluated the statement to `false` (not because of any other error). The errors are listed in docs/verification.md §5.

To re-export one of them (writes to the given directory and module prefix):

```bash
python -X utf8 lean/tools/export_d16.py --prob icoinoct --part far --inject lam --out lean/PackLean/D16/Test/IcoOctLam --modprefix PackLean.D16.Test.IcoOctLam
python -X utf8 lean/tools/export_d28.py --prob icointet --part far --inject kval --out lean/PackLean/D28/Test/Kval --modprefix PackLean.D28.Test.Kval
```

The n = 3..5 substitutions have their own injected errors on the Python side; `tests/replay_all.py plateau` runs them (each script stops with an error if any injected variant is accepted).

Some Lean variants are expected to build (`EXPECT_PASS` in `lean/build.py`): they move a region constant in the direction that makes that module easier, and the other module of the same case rejects them (see lean/README.md).
