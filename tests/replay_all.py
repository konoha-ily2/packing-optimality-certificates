"""Replay the stored certificates (no LP, no floating point in any decision).

Usage (from the repository root):
  python -X utf8 tests/replay_all.py                 # all cases, one after another
  python -X utf8 tests/replay_all.py icoinoct cubinoct plateau

Each replay reads only the records in certificates/ and stops with an error on any failure
(see docs/verification.md §2). For cubinoct the two τ-root records are replayed and then
d16_cover_check_roots.py checks that they join to [0, 1] together with the local record.
For cubinico, d30_claim.py re-checks the stored local certificate, the coverage of the far
record and the far replay together; for octintet, d31_far.py replay_all replays the far record
and the two stored local records (J, C) and checks that they share the same constants.
For octinico, d30_s3_claim.py re-checks the stored local certificate (tube coordinates, weights and
lifts), the coverage of the far record and the far replay together; for tetintet, d40_tests.py --only chain
replays the local leaves and the far record and re-checks the rational upper bound.
For dodincub and dodinoct, d30x_problems.py installs the two problems behind d30_problems and runs d30_claim.py
(local verify, far coverage check and far replay) through runpy, as for cubinico (about 2 min each).
For tetintet_n05, d37_tet_n05_replay_both.py --r0 1/16 replays the local and far records and checks the upper bound.
For dodintet, d45_dodintet_tests.py --only chain replays both tubes and the far record (main part and continuation)
and re-checks the upper bound.
For cubindod, d44_far.py replay re-checks the far record (the far region is all of it; enclosure, not equality);
for icoinico, dodindod and octinoct, d44_s3_check.py re-checks the local record and replays the far record of the enclosure.
octincub_n09 (d87_oct_replay_all.py), dodinico_n13 (d87_dod_replay_all.py) and tetintet_n03 (d86_replay_all.py) read their
records next to their own code: the verifier code and the records are copied into work/replay/<case>/run/ and the entry point
runs there (it also checks the SHA-256 of records and code against the stored manifest). dodinico_n13 also reads the configuration
and the closed form from ../records/dodinico/ and ../closed_forms/, and tetintet_n03 reads ../src/solids.json; these are copied
from certificates/ into the same places.
For the six equalities with algebraic values (n = 2), each one-command check re-derives the upper bound exactly in the field,
re-checks the local record, replays the far record and checks that the premises agree (same rho0, S-bar > C0*s0):
tetintet_eq (d40x_tests.py --only chain), dodintet_eq (d45x_dodintet_tests.py --only chain), cubindod_eq (f6_chain_cubindod.py),
icoinico_eq, dodindod_eq, octinoct_eq (f6_chain.py <case>). They use the same layout (verifier/f6/*.py and the records
f6_<case>_* go into run/f6/). The chains rewrite some records in run/ (upper bounds, field data, tests json); certificates/
is not touched. About 85 minutes in total (two processes).
"plateau" runs the exact substitutions for n = 2..5 and the n >= 5 lower-bound check.
Nothing is written to certificates/: tools that write files run in a copy under work/replay/.
"""
import shutil
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CERT = ROOT / "certificates"
V = ROOT / "verifier"
SCRATCH = ROOT / "work" / "replay"

# case: (list of commands, files to copy into a scratch directory or None to run in certificates/)
COMMANDS = {
    "cubinoct": ([["d16_cover_far.py", "replay", "d16_far_t0.boxes.jsonl.gz"],
                  ["d16_cover_far.py", "replay", "d16_far_t1.boxes.jsonl.gz"],
                  ["d16_cover_check_roots.py"]], None),
    "icoincub": ([["d16d_far.py", "replay", "icoincub"]], None),
    "dodinico": ([["d16d_far.py", "replay", "dodinico"]], None),
    "icoinoct": ([["d16d_far.py", "replay", "icoinoct"]], None),
    "icoindod": ([["d16d_far.py", "replay", "icoindod"]], None),
    "octindod": ([["d16e_far.py", "replay", "octindod"]], None),
    "cubinico": ([["d30_claim.py", "cubinico", "d30_cubinico_local_r16_nolp.json", "d30_cubinico_far",
                   "--out", "d30_cubinico_claim_replay.json"]],
                 ["d30_cubinico_local_r16_nolp.json", "d30_cubinico_far.json", "d30_cubinico_far.boxes.jsonl.gz"]),
    "icointet": ([["d28_far.py", "replay", "--prob", "icointet"]], None),
    "cubintet": ([["d28_far.py", "replay", "--prob", "cubintet"]], None),
    "octintet": ([["d31_far.py", "replay_all"]],
                 ["d31_far.json", "d31_far.boxes.jsonl.gz", "d31_local_J.json", "d31_local_J.leaves.jsonl.gz",
                  "d31_local_C.json", "d31_local_C.leaves.jsonl.gz"]),
    "octinico": ([["d30_s3_claim.py", "d30_s3_octinico_local.json", "d30_s3_octinico_far"]],
                 ["d30_s3_octinico_local.json", "d30_s3_octinico_far.json", "d30_s3_octinico_far.boxes.jsonl.gz"]),
    "tetintet": ([["d40_tests.py", "--only", "chain"]],
                 ["d40_local.json", "d40_local.leaves.jsonl.gz", "d40_far.json", "d40_far.boxes.jsonl.gz",
                  "d40_upper.json"]),
    "dodincub": ([["d30x_problems.py", str(V / "d30_claim.py"), "dodincub", "d30x_dodincub_local_r16.json",
                   "d30_dodincub_far", "--out", "d30x_dodincub_claim_replay.json"]],
                 ["d30x_dodincub_local_r16.json", "d30_dodincub_far.json", "d30_dodincub_far.boxes.jsonl.gz"]),
    "dodinoct": ([["d30x_problems.py", str(V / "d30_claim.py"), "dodinoct", "d30x_dodinoct_local_r32_nolp.json",
                   "d30_dodinoct_far_r32", "--out", "d30x_dodinoct_claim_replay.json"]],
                 ["d30x_dodinoct_local_r32_nolp.json", "d30_dodinoct_far_r32.json", "d30_dodinoct_far_r32.boxes.jsonl.gz"]),
    "tetintet_n05": ([["d37_tet_n05_replay_both.py", "--r0", "1/16", "--out", "d37_tet_n05_replay_both.json"]],
                     ["d37_tet_n05_local_r16.json", "d37_tet_n05_local_r16.leaves.jsonl.gz",
                      "d37_tet_n05_far_r16.json", "d37_tet_n05_far_r16.boxes.jsonl.gz"]),
    "dodintet": ([["d45_dodintet_tests.py", "--only", "chain"]],
                 ["d45_dodintet_local_TA.json", "d45_dodintet_local_TA.leaves.jsonl.gz", "d45_dodintet_local_TB.json",
                  "d45_dodintet_local_TB.leaves.jsonl.gz", "d45_dodintet_far.json", "d45_dodintet_far.boxes.jsonl.gz",
                  "d45_dodintet_far.part1.boxes.jsonl.gz", "d45_dodintet_upper.json", "dodintet_n02.json"]),
    "plateau": ([["d28_plateau_n34.py", "--inject", "--out", "."],
                 ["d31_plateau_n34.py", "--inject", "--out", "."],
                 ["plateau_n05_upper.py", "--out", "."],
                 ["plateau_end_check.py"]], []),
}


D44_COMMON = ["d44_upper.json", "d44_rhat.json"]
for _p in ("icoinico", "dodindod", "octinoct"):
    COMMANDS[_p] = ([["d44_s3_check.py", _p, "--k", "10"]],
                    [f"d44_{_p}_local_k10.json", f"d44_{_p}_s3far_k10.json", f"d44_{_p}_s3far_k10.boxes.jsonl.gz"] + D44_COMMON)
COMMANDS["cubindod"] = ([["d44_far.py", "replay", "cubindod", "--name", "d44_cubindod_k10"]],
                        ["d44_cubindod_k10.json", "d44_cubindod_k10.boxes.jsonl.gz"] + D44_COMMON)

# cases whose tools read records next to their own code: (entry command, record prefixes, {path relative to run/: file in certificates/})
SELF_CONTAINED = {
    "octincub_n09": (["d87_oct_replay_all.py", "--procs", "2"], ["d87_oct_"], {}),
    "dodinico_n13": (["d87_dod_replay_all.py", "--procs", "3"], ["d87_dod_"],
                     {"../records/dodinico/dodinico_n13.json": "dodinico_n13.json",
                      "../closed_forms/dodinico_n13.json": "closed_form_dodinico_n13.json"}),
    "tetintet_n03": (["d86_replay_all.py"], ["d86_"], {"../src/solids.json": "solids.json"}),
}
# The six equalities with algebraic values (F6, n = 2): one-command chains. Same layout as above;
# records whose names start with the last list go into run/f6/ (next to verifier/f6/*.py).
F6_EQ = {
    "tetintet_eq": (["d40x_tests.py", "--only", "chain"], ["d40x_"], {}, []),
    "dodintet_eq": (["d45x_dodintet_tests.py", "--only", "chain"],
                    ["d45x_dodintet_", "d45_dodintet_far.boxes.jsonl.gz", "d45_dodintet_far.part1.boxes.jsonl.gz",
                     "d45_dodintet_upper.json"], {}, []),
    "cubindod_eq": (["f6_chain_cubindod.py", "--procs", "2"], ["d16b_n2_survey.json", "d44_rhat.json"], {}, ["f6_cubindod_"]),
    "icoinico_eq": (["f6_chain.py", "icoinico", "--procs", "2"], ["d44_rhat.json"], {}, ["f6_icoinico_"]),
    "dodindod_eq": (["f6_chain.py", "dodindod", "--procs", "2"], ["d44_rhat.json"], {}, ["f6_dodindod_"]),
    "octinoct_eq": (["f6_chain.py", "octinoct", "--procs", "2"], ["d44_rhat.json"], {}, ["f6_octinoct_"]),
}
SELF_CONTAINED.update(F6_EQ)
for _c, _spec in SELF_CONTAINED.items():
    COMMANDS[_c] = ([_spec[0]], "self")


def prepare_self(case):
    cmd, prefixes, extra = SELF_CONTAINED[case][:3]
    f6_prefixes = SELF_CONTAINED[case][3] if len(SELF_CONTAINED[case]) > 3 else []
    base = SCRATCH / case
    if base.exists():
        shutil.rmtree(base)
    run = base / "run"
    run.mkdir(parents=True)
    for f in V.glob("*.py"):
        shutil.copy2(f, run / f.name)
    for f in CERT.iterdir():
        if f.is_file() and any(f.name.startswith(x) for x in prefixes):
            shutil.copy2(f, run / f.name)
    if f6_prefixes:
        (run / "f6").mkdir()
        for f in (V / "f6").glob("*.py"):
            shutil.copy2(f, run / "f6" / f.name)
        for f in CERT.iterdir():
            if f.is_file() and any(f.name.startswith(x) for x in f6_prefixes):
                shutil.copy2(f, run / "f6" / f.name)
    for rel, src in extra.items():
        dst = (run / rel).resolve()
        dst.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(CERT / src, dst)
    return run


def main(cases):
    ok_all = True
    for case in cases:
        cmds, copy = COMMANDS[case]
        cwd = CERT
        script_dir = V
        if copy == "self":
            cwd = script_dir = prepare_self(case)
        elif copy is not None:
            cwd = SCRATCH / case
            cwd.mkdir(parents=True, exist_ok=True)
            for f in copy:
                shutil.copy2(CERT / f, cwd / f)
        for cmd in cmds:
            t0 = time.time()
            p = subprocess.run([sys.executable, "-X", "utf8", str(script_dir / cmd[0])] + cmd[1:], cwd=cwd,
                               capture_output=True, text=True, encoding="utf-8", errors="replace")
            ok = p.returncode == 0
            ok_all &= ok
            out = (p.stdout.strip().splitlines() or [""])[-1]
            print(f"[{case}] {' '.join(cmd)}: {'OK' if ok else 'FAILED'} ({time.time() - t0:.0f} s)\n    {out}", flush=True)
            if not ok:
                print(p.stdout[-2000:] + p.stderr[-3000:], flush=True)
    print("== all replays passed" if ok_all else "== SOME REPLAYS FAILED", flush=True)
    return 0 if ok_all else 1


if __name__ == "__main__":
    args = sys.argv[1:] or list(COMMANDS)
    bad = [a for a in args if a not in COMMANDS]
    if bad:
        sys.exit(f"unknown case(s): {bad}; choose from {list(COMMANDS)}")
    sys.exit(main(args))
