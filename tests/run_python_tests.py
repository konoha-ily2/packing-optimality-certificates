"""Run the Python test script of one case in a scratch directory (work/<case>/), so that nothing is written to certificates/.

Usage (from the repository root):
  python -X utf8 tests/run_python_tests.py <case> [count=300]
  case: cubinoct | icoincub | dodinico | icoinoct | icointet | cubintet
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
    "icointet": ["d28_icointet_far"],
    "cubintet": ["d28_cubintet_far"],
}


def command(case, count):
    if case == "cubinoct":
        # the script imports d11_step1_cubinoct_n02.py from the current directory (test X)
        return [str(V / "d16_cover_tests.py"), count]
    if case in ("icointet", "cubintet"):
        return [str(V / "d28_tests.py"), "--prob", case, count]
    return [str(V / "d16d_tests.py"), case, count]


def main(case, count="300"):
    if case not in RECORDS:
        sys.exit(f"unknown case {case}; choose from {list(RECORDS)}")
    work = ROOT / "work" / case
    work.mkdir(parents=True, exist_ok=True)
    for name in RECORDS[case]:
        for ext in (".json", ".boxes.jsonl.gz"):
            shutil.copy2(CERT / (name + ext), work / (name + ext))
    if case == "cubinoct":
        shutil.copy2(V / "d11_step1_cubinoct_n02.py", work / "d11_step1_cubinoct_n02.py")
    print(f"running in {work}", flush=True)
    p = subprocess.run([sys.executable, "-X", "utf8"] + command(case, count), cwd=work)
    return p.returncode


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    sys.exit(main(*sys.argv[1:3]))
