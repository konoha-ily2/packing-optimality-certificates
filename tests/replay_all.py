"""Replay the stored far-region certificates of the six cases (no LP, no floating point in any decision).

Usage (from the repository root):
  python -X utf8 tests/replay_all.py                 # all six cases, one after another
  python -X utf8 tests/replay_all.py icoinoct cubinoct

Each replay reads only the records in certificates/ and stops with an error on any failure
(see docs/verification.md §2). For cubinoct the two τ-root records are replayed and then
d16_cover_check_roots.py checks that they join to [0, 1] together with the local record.
Nothing is written to certificates/.
"""
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CERT = ROOT / "certificates"
V = ROOT / "verifier"

COMMANDS = {
    "cubinoct": [["d16_cover_far.py", "replay", "d16_far_t0.boxes.jsonl.gz"],
                 ["d16_cover_far.py", "replay", "d16_far_t1.boxes.jsonl.gz"],
                 ["d16_cover_check_roots.py"]],
    "icoincub": [["d16d_far.py", "replay", "icoincub"]],
    "dodinico": [["d16d_far.py", "replay", "dodinico"]],
    "icoinoct": [["d16d_far.py", "replay", "icoinoct"]],
    "icointet": [["d28_far.py", "replay", "--prob", "icointet"]],
    "cubintet": [["d28_far.py", "replay", "--prob", "cubintet"]],
}


def main(cases):
    ok_all = True
    for case in cases:
        for cmd in COMMANDS[case]:
            t0 = time.time()
            p = subprocess.run([sys.executable, "-X", "utf8", str(V / cmd[0])] + cmd[1:], cwd=CERT,
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
