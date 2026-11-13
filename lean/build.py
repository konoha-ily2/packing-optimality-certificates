"""Build the Lean re-check of one case (or the injected-error tests), one module at a time.

Usage (from this lean/ directory, with elan installed; lean-toolchain pins the version):
  python build.py icoinoct                 # one case: cubinoct | icoincub | dodinico | icoinoct | icointet | cubintet
  python build.py all                      # all six cases, then the #print axioms summaries
  python build.py inject [d16|d28]         # injected-error certificates: every target must FAIL
  python build.py kernel                   # optional kernel (decide +kernel) trials on parts of icoinoct / icointet

Modules are built in dependency order with `lake build <module>`, one at a time, so that at most one Lean
process runs (memory). For each case the script lists the modules and prints pass/fail and the wall time.
"""
import re
import subprocess
import sys
import time
from pathlib import Path

HERE = Path(__file__).resolve().parent
PL = HERE / "PackLean"

CASES = {
    # case: (directory under PackLean, module-name prefix)
    "icoinoct": ("D16/IcoOct", "PackLean.D16.IcoOct"),
    "icoincub": ("D16/IcoCub", "PackLean.D16.IcoCub"),
    "dodinico": ("D16/DodIco", "PackLean.D16.DodIco"),
    "cubinoct": ("D16/CubOct", "PackLean.D16.CubOct"),
    "icointet": ("D28/Ico", "PackLean.D28.Ico"),
    "cubintet": ("D28/Cub", "PackLean.D28.Cub"),
}
# order inside a case directory: data first, then the far chunks, the far theorem, the local theorem, the constants
ORDER = [r"Data", r"CoverData", r"Tok\d+", r"CoverTok\d+", r"Far\d+", r"Far", r"CoverFar", r"Local", r"CoverLocal", r"Consts"]


def rank(stem):
    for i, pat in enumerate(ORDER):
        if re.fullmatch(pat, stem):
            return (i, stem)
    return (len(ORDER), stem)


def case_modules(case):
    d, prefix = CASES[case]
    stems = [p.stem for p in (PL / d).glob("*.lean") if p.stem not in ("Axioms", "Kernel")]
    return [f"{prefix}.{s}" for s in sorted(stems, key=rank)]


def inject_targets(group):
    """Injected-error modules: in each Test/<name>/ directory, the modules that are not data or tree chunks."""
    out = []
    for g in (["D16", "D28"] if group is None else [group.upper()]):
        for d in sorted((PL / g / "Test").iterdir()):
            if d.is_dir():
                for p in sorted(d.glob("*.lean")):
                    if not re.fullmatch(r"Data|CoverData|Tok\d+|CoverTok\d+", p.stem):
                        out.append(f"PackLean.{g}.Test.{d.name}.{p.stem}")
    return out


def build(mod):
    t0 = time.time()
    p = subprocess.run(["lake", "build", mod], cwd=HERE, capture_output=True, text=True, encoding="utf-8", errors="replace")
    dt = time.time() - t0
    return p.returncode == 0, dt, p.stdout + p.stderr


def run(mods, expect_fail=False):
    t_all = time.time()
    bad = []
    for m in mods:
        ok, dt, log = build(m)
        if expect_fail:
            # an injected error must make `native_decide` evaluate the statement to false (not a syntax/other error)
            hit = "native_decide` evaluated that the proposition" in log
            good = (not ok) and hit
            print(f"{m}: {'rejected as expected' if good else 'UNEXPECTED: ' + ('built' if ok else 'failed for another reason')} ({dt:.0f} s)", flush=True)
        else:
            good = ok
            print(f"{m}: {'passed' if ok else 'FAILED'} ({dt:.0f} s)", flush=True)
            for line in log.splitlines():
                if "axioms" in line or "depends on" in line:
                    print("   " + line.strip())
        if not good:
            bad.append(m)
            print("\n".join(l for l in log.splitlines() if "error" in l.lower())[-2000:], flush=True)
    print(f"== {len(mods) - len(bad)}/{len(mods)} as expected, {time.time() - t_all:.0f} s total")
    return not bad


def main(argv):
    if not argv:
        print(__doc__); return 2
    what = argv[0]
    if what in CASES:
        return 0 if run(case_modules(what)) else 1
    if what == "all":
        mods = [m for c in CASES for m in case_modules(c)]
        mods += ["PackLean.D16.Axioms", "PackLean.D28.Ico.Axioms", "PackLean.D28.Cub.Axioms"]
        return 0 if run(mods) else 1
    if what == "inject":
        return 0 if run(inject_targets(argv[1] if len(argv) > 1 else None), expect_fail=True) else 1
    if what == "kernel":
        return 0 if run(["PackLean.D16.IcoOct.Kernel", "PackLean.D28.Ico.Kernel.Axioms"]) else 1
    print(__doc__); return 2


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
