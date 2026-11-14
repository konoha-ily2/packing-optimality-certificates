"""Run the Python test script of one case in a scratch directory (work/<case>/), so that nothing is written to certificates/.

Usage (from the repository root):
  python -X utf8 tests/run_python_tests.py <case> [count=300]
  case: cubinoct | icoincub | dodinico | icoinoct | icoindod | octindod | cubinico | icointet | cubintet | octintet | octinico | tetintet
        | dodincub | dodintet | tetintet_n05
For dodinoct the full test set has not been run on the record of the claim (rho0 = 1/32); the controls of that record are run by
  verifier/d30x_testsX.py dodinoct d30x_dodinoct_local_r32_nolp.json d30_dodinoct_far_r32 tmp_testsX parent,corrupt
(see tests/README.md).
The tests of the n = 3..5 substitutions (injected errors) are part of tests/replay_all.py plateau.
"""
import os
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
    "octinico": ["d30_s3_octinico_far"],
    "tetintet": ["d40_far"],
    "dodincub": ["d30_dodincub_far"],
    "dodintet": ["d45_dodintet_far"],
    "tetintet_n05": ["d37_tet_n05_far_r16"],
}
# further files copied into the scratch directory
EXTRA = {
    "cubinoct": [V / "d11_step1_cubinoct_n02.py"],  # imported from the current directory (test X)
    "cubinico": [CERT / "d30_cubinico_local_r16_nolp.json"],
    # d31_tests.py passes d31_local.py / d31_far.py to child processes by relative path
    "octintet": [CERT / "d31_local_J.json", CERT / "d31_local_J.leaves.jsonl.gz", CERT / "d31_local_C.json",
                 CERT / "d31_local_C.leaves.jsonl.gz", V / "d31_common.py", V / "d31_local.py", V / "d31_far.py"],
    "octinico": [CERT / "d30_s3_octinico_local.json"],
    "tetintet": [CERT / "d40_local.json", CERT / "d40_local.leaves.jsonl.gz", CERT / "d40_upper.json"],
    "dodincub": [CERT / "d30x_dodincub_local_r16.json"],
    # d45_dodintet_common reads d45_dodintet_upper.json from the current directory at import
    "dodintet": [CERT / "d45_dodintet_far.part1.boxes.jsonl.gz", CERT / "d45_dodintet_local_TA.json",
                 CERT / "d45_dodintet_local_TA.leaves.jsonl.gz", CERT / "d45_dodintet_local_TB.json",
                 CERT / "d45_dodintet_local_TB.leaves.jsonl.gz", CERT / "d45_dodintet_upper.json"],
    "tetintet_n05": [CERT / "d37_tet_n05_local_r16.json", CERT / "d37_tet_n05_local_r16.leaves.jsonl.gz"],
}
# environment variables for the test scripts
ENV = {
    "tetintet_n05": {"D37_R0": "1/16"},         # the records were made with R0 = 1/16
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
    if case == "octinico":
        return [str(V / "d30_s3_tests.py"), count, "d30_s3_octinico_local.json"]
    if case == "tetintet":                      # fixed test set; count is not used
        return [str(V / "d40_tests.py"), "--only", "W,t1,t2,t3,t4,t5,t6,L1,R3"]
    if case == "dodincub":
        return [str(V / "d30x_problems.py"), str(V / "d30_tests_full.py"), case, count, "d30x_dodincub_local_r16.json"]
    if case == "dodintet":                      # fixed test set; count is not used
        return [str(V / "d45_dodintet_tests.py"), "--only", "W,W2,t5,t6,t4,L1,R3"]
    if case == "tetintet_n05":                  # two scripts, fixed test sets; count is not used
        return [[str(V / "d37_tet_n05_tests.py"), "--only", "W,R3,tb,ts"],
                [str(V / "d37_tet_n05_far_tests.py"), "--name", "d37_tet_n05_far_r16", "--loc", "d37_tet_n05_local_r16",
                 "--only", "W,Bd,L1,t6,X,Xb,P"]]
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
    cmds = command(case, count)
    if not isinstance(cmds[0], list):
        cmds = [cmds]
    env = dict(os.environ, **ENV.get(case, {}))
    rc = 0
    for cmd in cmds:
        p = subprocess.run([sys.executable, "-X", "utf8"] + cmd, cwd=work, env=env)
        rc = rc or p.returncode
    return rc


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    sys.exit(main(*sys.argv[1:3]))
