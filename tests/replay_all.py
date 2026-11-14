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


def main(cases):
    ok_all = True
    for case in cases:
        cmds, copy = COMMANDS[case]
        cwd = CERT
        if copy is not None:
            cwd = SCRATCH / case
            cwd.mkdir(parents=True, exist_ok=True)
            for f in copy:
                shutil.copy2(CERT / f, cwd / f)
        for cmd in cmds:
            t0 = time.time()
            p = subprocess.run([sys.executable, "-X", "utf8", str(V / cmd[0])] + cmd[1:], cwd=cwd,
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
