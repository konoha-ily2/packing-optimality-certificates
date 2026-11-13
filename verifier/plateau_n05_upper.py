# Upper bound for icointet and octintet with n=5: substitution of an exact configuration fitting the container whose edge equals the lower bound (2026-11-13).
# 2026-11-13, written by Claude. No third-party review; this is not a formal proof.
#
# The lower bound is Q49 (plateau_end_check.py): L ≥ 20r/√6 for n ≥ 5.
#   octintet: 10/3, icointet: 5√(3√5+7)/3 = 5(3+√5)/(3√2).
# Here the upper bound. The checks of d28_plateau_n34.py (Q(√5), icosahedron) and d31_plateau_n34.py (Q(√2), octahedron) are used as they are;
# only the container constant c = s/(2√2) is replaced by the value for n=5. Acceptance is the exact arithmetic of (1) congruence (2) containment (3) separating planes only.
#   icointet: c = 5(3+√5)/12 = 5/4 + (5/12)√5, octintet: c = (10/3)/(2√2) = (5/6)√2.
# The configurations are read from certificates/plateau_<case>_n5.json (originally the records rounded to exact numbers).
# Usage: python plateau_n05_upper.py [--out DIR] [--from-records DIR [--write-certs]]   → DIR/plateau_n05_upper.json (default DIR = work/)
import json, os, sys, itertools
from fractions import Fraction as Fr

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d28_plateau_n34 as I   # icointet (Q(√5))
import d31_plateau_n34 as O   # octintet (Q(√2))
import plateau_cert as PC

# the coordinates for n=5 may have denominators 3, 6, 12, 24, so the candidate denominators of the rounding are widened (only proposes candidates; no effect on acceptance)
I.DENS = (1, 2, 3, 4, 5, 6, 8, 10, 12, 15, 20, 24, 30, 40, 60)
O.DENS = (1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 48)

C_ICO = I.Q5(Fr(5, 4), Fr(5, 12))
C_OCT = O.Q2(0, Fr(5, 6))
# s² = 8c² equals the square of the lower bound
I.need(C_ICO * C_ICO * 8 == I.Q5(Fr(175, 9), Fr(25, 3)), "icointet: s² = 175/9 + (25/3)√5 (= (5√(3√5+7)/3)²)")
O.need(C_OCT * C_OCT * 8 == O.Q2(Fr(100, 9)), "octintet: s² = 100/9")


def run_ico():
    I.CSTAR = C_ICO
    r = I.check(5)
    # version with an injected error: container smaller by 10^-12
    I.CSTAR = C_ICO - Fr(1, 10 ** 12)
    try:
        I.check(5); inj = "PASSED (unexpected)"
    except SystemExit as e:
        inj = str(e)
    I.CSTAR = C_ICO
    r["error_container_smaller_by_1e-12"] = inj
    # the same 7 kinds of injected errors as d28_plateau_n34.py --inject (FD_plateau_end_review fixable 3)
    r["injected_errors"] = I.inject_d28(5)
    return r


def run_oct():
    O.CSTAR = C_OCT
    r = O.check(5)
    r["injected_errors"] = O.inject(5)
    return r


if __name__ == "__main__":
    I.RECORDS = O.RECORDS = I.arg_value("--from-records")
    OUT = I.arg_value("--out", os.path.join(os.path.dirname(HERE), "work"))
    out = dict(description="icointet and octintet for n=5: substitution of an exact configuration fitting the container whose edge equals the lower bound of Q49 (upper bound). "
                           "With the lower bound this fixes the minimum edge for n=5. No third-party review; this is not a formal proof.")
    ri = run_ico()
    print(f"icointet n=5 passed: {ri['containment_inequalities']} containment inequalities, {ri['wall_contacts']} contacts, {len(ri['separating_planes'])} separating planes; error version: {ri['error_container_smaller_by_1e-12'][:30]}", flush=True)
    for k, v in ri["injected_errors"].items():
        print(f"  error version {k}: {v[:40]}", flush=True)
    ro = run_oct()
    print(f"octintet n=5 passed: {ro['containment_inequalities']} containment inequalities, {ro['wall_contacts']} contacts, {len(ro['separating_planes'])} separating planes", flush=True)
    for k, v in ro["injected_errors"].items():
        print(f"  error version {k}: {v[:40]}", flush=True)
    bad = [v for v in [ri["error_container_smaller_by_1e-12"]] + list(ri["injected_errors"].values()) + list(ro["injected_errors"].values())
           if v == "PASSED (unexpected)"]
    I.need(not bad, "an injected error passed")
    if I.RECORDS is not None and "--write-certs" in sys.argv:
        PC.dump("icointet", 5, I.RAW[5]["pieces"], C_ICO, ri["record_s_full"],
                "plateau_n05_upper.py --from-records: the record rounded by recognize() (DENS = 1, 2, 3, 4, 5, 6, 8, 10, 12, 15, 20, 24, 30, 40, 60)")
        PC.dump("octintet", 5, O.RAW[5]["pieces"], C_OCT, ro["record_s_full"],
                "plateau_n05_upper.py --from-records: the record rounded by recognize() (DENS = 1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 48)")
    if I.RECORDS is None:
        I.need(PC.load("icointet", 5, I.Q5)["c"] == C_ICO and PC.load("octintet", 5, O.Q2)["c"] == C_OCT,
               "container constants of the certificate files")
    out["icointet_n5"] = dict(c="5/4 + (5/12)√5", s="5√(3√5+7)/3", **ri)
    out["octintet_n5"] = dict(c="(5/6)√2", s="10/3", **ro)
    os.makedirs(OUT, exist_ok=True)
    json.dump(out, open(os.path.join(OUT, "plateau_n05_upper.json"), "w", encoding="utf8"), ensure_ascii=False, indent=1)
