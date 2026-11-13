"""Run the Python test script of one case in a scratch directory (work/<case>/), so that nothing is written to certificates/.

Usage (from the repository root):
  python -X utf8 tests/run_python_tests.py <case> [count=300]
  case: cubinoct | icoincub | dodinico | icoinoct | icoindod | octindod | cubinico | icointet | cubintet | octintet
The tests of the n = 3..5 substitutions (injected errors) are part of tests/replay_all.py plateau.
"""
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CERT = ROOT / "certificates"
V = ROOT / "verifier"

RECORDS = {
    "cubinoct": ["d16_far_t0", "d16_far_t1"],
    "icoincub": ["d16d_icoincub_far"],
    "dodinico": ["d16d_dodinico_far"],
    "icoinoct": ["d16d_icoinoct_far"],
    "icoindod": ["d16d_icoindod_far"],
    "octindod": ["d16e_octindod_far"],
    "cubinico": ["d30_cubinico_far"],
    "icointet": ["d28_icointet_far"],
    "cubintet": ["d28_cubintet_far"],
    "octintet": ["d31_far"],
}
# further files copied into the scratch directory
EXTRA = {
    "cubinoct": [V / "d11_step1_cubinoct_n02.py"],  # imported from the current directory (test X)
    "cubinico": [CERT / "d30_cubinico_local_r16_nolp.json"],
    # d31_tests.py passes d31_local.py / d31_far.py to child processes by relative path
    "octintet": [CERT / "d31_local_J.json", CERT / "d31_local_J.leaves.jsonl.gz", CERT / "d31_local_C.json",
                 CERT / "d31_local_C.leaves.jsonl.gz", V / "d31_common.py", V / "d31_local.py", V / "d31_far.py"],
}


def command(case, count):
    if case == "cubinoct":
        return [str(V / "d16_cover_tests.py"), count]
    if case in ("icointet", "cubintet"):
        return [str(V / "d28_tests.py"), "--prob", case, count]
    if case == "octindod":
        return [str(V / "d16e_tests.py"), case, count]
    if case == "cubinico":
        return [str(V / "d30_tests_full.py"), case, count, "d30_cubinico_local_r16_nolp.json"]
    if case == "octintet":
        return [str(V / "d31_tests.py"), "--n", count]
    return [str(V / "d16d_tests.py"), case, count]


def main(case, count="300"):
    if case not in RECORDS:
        sys.exit(f"unknown case {case}; choose from {list(RECORDS)}")
    work = ROOT / "work" / case
    work.mkdir(parents=True, exist_ok=True)
    for name in RECORDS[case]:
        for ext in (".json", ".boxes.jsonl.gz"):
            shutil.copy2(CERT / (name + ext), work / (name + ext))
    for f in EXTRA.get(case, []):
        shutil.copy2(f, work / f.name)
    print(f"running in {work}", flush=True)
    p = subprocess.run([sys.executable, "-X", "utf8"] + command(case, count), cwd=work)
    return p.returncode


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    sys.exit(main(*sys.argv[1:3]))
