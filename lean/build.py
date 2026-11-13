"""Build the Lean re-check of one case (or the injected-error tests), one module at a time.

Usage (from this lean/ directory, with elan installed; lean-toolchain pins the version):
  python build.py icoinoct                 # one case: cubinoct | icoincub | dodinico | icoinoct | icointet | cubintet
                                           #           | icoindod | octindod | cubinico | octintet
  python build.py all                      # all ten cases, then the #print axioms summaries
  python build.py inject [d16|b2|d28|d30|d31]  # injected-error certificates: every target must FAIL
                                           # (b2 = only the D16 tests of icoindod / octindod; D30 and D31 also build
                                           #  the targets listed in EXPECT_PASS, which must build)
  python build.py plateau                  # plateau corollaries (icointet / octintet, n = 2..5), decide +kernel
  python build.py inject plateau           # injected errors of the plateau corollaries (24 files): every target must FAIL
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
    "icoindod": ("D16/IcoDod", "PackLean.D16.IcoDod"),
    "octindod": ("D16/OctDod", "PackLean.D16.OctDod"),
    "cubinico": ("D30", "PackLean.D30"),
    "octintet": ("D31", "PackLean.D31"),
}
# cases whose modules are built in their own order (other stems in the directory, e.g. D31/Core, are left to the imports)
CASE_ORDER = {
    "octintet": [r"Data", r"Consts", r"Far\d+", r"Far", r"LocJ\d+", r"LocC\d+", r"Local"],
}
# summaries with #print axioms, built after the cases by `all`
AXIOMS = ["PackLean.D16.Axioms", "PackLean.D16.AxiomsB2", "PackLean.D28.Ico.Axioms", "PackLean.D28.Cub.Axioms",
          "PackLean.D30.Axioms", "PackLean.D31.Axioms"]
# injected-error modules that are expected to BUILD. In D30/Test/RhoBig only the local theorem is the injected-error
# test: the far theorem passes, because widening the L region only makes the far check easier, and the constants
# theorem passes, because ρ₀ = 1/8 and r0 = ρ₀·rden are consistent with each other (Consts was not built in the
# original Q58 test run; it is listed here so that it is not counted as an injected-error target)
EXPECT_PASS = {"PackLean.D30.Test.RhoBig.Far", "PackLean.D30.Test.RhoBig.Consts"}
# D31/Test/UJ (U_J 5/16 -> 5/32): only the far module Far000 is the injected-error test (its L leaves of J leave the
# narrower J range). The local module LocJ passes: narrowing J only makes the local check easier (as in test n2 of D31)
EXPECT_PASS |= {"PackLean.D31.Test.UJ.LocJ"}
# kernel trials (not part of `all`); for cubinico only the trials that finished (ConstsAll and LocalAll were stopped)
KERNEL = ["PackLean.D16.IcoOct.Kernel", "PackLean.D28.Ico.Kernel.Axioms", "PackLean.D30.Kernel.Axioms"]
# octintet: constants and identities, then the far/local trials (D31/Kernel/Loc3, a C face with 215 leaves, took
# about 7 min and 9.5 GB in the original run)
KERNEL += ["PackLean.D31.Kernel.Consts", "PackLean.D31.Kernel.Axioms"]
# order inside a case directory: data first, then the far chunks, the far theorem, the local theorem, the constants
ORDER = [r"Data", r"CoverData", r"Tok\d+", r"CoverTok\d+", r"Far\d+", r"Far", r"CoverFar", r"Local", r"CoverLocal", r"Consts"]

# cases whose modules are listed explicitly, in dependency order (flat directory; the axioms files are included)
EXPLICIT = {
    "plateau": ["PackLean.Plateau." + s for s in
                ("Core", "Data", "Ico", "Oct", "N5Data", "N5", "N5EndCore", "N5End", "Axioms", "N5Axioms")],
}
# injected-error groups kept as flat files in <dir>/Test/, and the Lean messages that count as "rejected by the check".
# These use `decide +kernel`: a wrong certificate fails either with "application type mismatch" (the kernel does not
# accept the value as true) or with "`decide` proved that the proposition ... is false".
FLAT_INJECT = {"plateau": ("Plateau", ["application type mismatch", "proved that the proposition"])}


def rank(stem):
    for i, pat in enumerate(ORDER):
        if re.fullmatch(pat, stem):
            return (i, stem)
    return (len(ORDER), stem)


def case_modules(case):
    d, prefix = CASES[case]
    stems = [p.stem for p in (PL / d).glob("*.lean") if p.stem not in ("Axioms", "Kernel")]
    if case in CASE_ORDER:
        order = CASE_ORDER[case]
        key = lambda s: (next(i for i, pat in enumerate(order) if re.fullmatch(pat, s)), s)
        return [f"{prefix}.{s}" for s in sorted((s for s in stems if any(re.fullmatch(p, s) for p in order)), key=key)]
    return [f"{prefix}.{s}" for s in sorted(stems, key=rank)]


def inject_targets(group):
    """Injected-error modules: in each Test/<name>/ directory, the modules that are not data or tree chunks."""
    out = []
    b2 = group is not None and group.lower() == "b2"
    for g in (["D16", "D28", "D30", "D31"] if group is None else ["D16" if b2 else group.upper()]):
        for d in sorted((PL / g / "Test").iterdir()):
            if d.is_dir() and (not b2 or d.name.startswith(("IcoDod", "OctDod"))):
                for p in sorted(d.glob("*.lean")):
                    if not re.fullmatch(r"Data|CoverData|Tok\d+|CoverTok\d+", p.stem):
                        m = f"PackLean.{g}.Test.{d.name}.{p.stem}"
                        if m not in EXPECT_PASS:
                            out.append(m)
    return out


def build(mod):
    t0 = time.time()
    p = subprocess.run(["lake", "build", mod], cwd=HERE, capture_output=True, text=True, encoding="utf-8", errors="replace")
    dt = time.time() - t0
    return p.returncode == 0, dt, p.stdout + p.stderr


def run(mods, expect_fail=False, marks=None):
    t_all = time.time()
    bad = []
    for m in mods:
        ok, dt, log = build(m)
        if expect_fail:
            # an injected error must make `native_decide` evaluate the statement to false (not a syntax/other error)
            hit = any(s in log for s in (marks or ["native_decide` evaluated that the proposition"]))
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
    if what in EXPLICIT:
        return 0 if run(EXPLICIT[what]) else 1
    if what == "inject" and len(argv) > 1 and argv[1] in FLAT_INJECT:
        d, marks = FLAT_INJECT[argv[1]]
        mods = [f"PackLean.{d}.Test.{p.stem}" for p in sorted((PL / d / "Test").glob("*.lean"))]
        return 0 if run(mods, expect_fail=True, marks=marks) else 1
    if what == "all":
        mods = [m for c in CASES for m in case_modules(c)]
        mods += AXIOMS
        return 0 if run(mods) else 1
    if what == "inject":
        group = argv[1] if len(argv) > 1 else None
        ok = run(inject_targets(group), expect_fail=True)
        exp = sorted(m for m in EXPECT_PASS if group is None or m.startswith(f"PackLean.{group.upper()}."))
        if exp:
            print("expected to build (EXPECT_PASS):")
            ok = run(exp) and ok
        return 0 if ok else 1
    if what == "kernel":
        return 0 if run(KERNEL) else 1
    print(__doc__); return 2


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
