# F6 stage 3: checks together the 3 parts of the n = 2 equality s* = s₀ (upper bound, local, far) and the consistency of the premises (dodindod, octinoct, icoinico).
# 2026-11-15, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
# cubindod is f6_chain_cubindod.py.
#   (1) Upper bound (redo f6_field2.py; for icoinico f6/f6_field3.py, and for the local part f6/f6_local3.py): the configuration that fits at s₀, exactly in L = K(y) → s* ≤ s₀.
#   (2) Local (f6_local.py verify): φ ≥ C0·s₀ on {‖p − p*‖∞ ≤ ρ₁} ⊇ L₀.
#   (3) Far (d44_far_par.py replay, D44_RHO0 = ρ₀): φ ≥ S̄ outside L₀, and S̄ > C0·s₀ with arb.
#   Consistency of the premises: RHO0 of the far record = ρ₀ of the local part; the far record has 0 boxes not accepted and 0 LP failures; the local part is all accepted.
# Usage: python -X utf8 f6_chain.py <pair> [--procs 4]
import os, sys, json, time, subprocess, argparse
from fractions import Fraction as Fr
import flint
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
EXT = {"dodindod": "quad", "octinoct": "sqrt2", "icoinico": "quad"}
FIELD3 = {"icoinico"}      # upper bound and local part with f6/f6_field3.py and f6/f6_local3.py (no inverses) (pp/global_opt/f6/NOTES_f6.md §9, §10, working notes, Japanese)


def need(c, m):
    if not c:
        raise SystemExit("FAIL: " + m)


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("pair"); ap.add_argument("--procs", type=int, default=4)
    a = ap.parse_args()
    pair = a.pair
    t0 = time.time()
    py = sys.executable
    LOCAL = os.path.join(HERE, "f6", f"f6_{pair}_local.json")
    FAR = f"f6/f6_{pair}_far"
    loc = json.load(open(LOCAL, encoding="utf-8"))
    far = json.load(open(os.path.join(HERE, FAR + ".json"), encoding="utf-8"))
    need(loc.get("all_accepted") is True, "the local record is all accepted")
    need(far["closed"] is True and far["X"] == 0 and far["lp_fail"] == 0, "far record (split limits 0, LP failures 0)")
    need(Fr(far["params"]["RHO0"]) == Fr(loc["rho0"]), "RHO0 of the far part = ρ₀ of the local part")
    import d44_problems as DP; DP.install()
    import d16e_common as C
    C.load("d44_" + pair)
    P = C.load("d44_" + pair)
    c0 = P.C0
    if pair in FIELD3:
        # ring Q[x, r, y]/(r² − 5, y² − D) (no inverses; f6/f6_field3.py, f6/f6_local3.py). S₀ = C0·x, the map x ↦ s₀
        sys.path.insert(0, os.path.join(HERE, "f6"))
        import f6_local3 as FL3
        need(loc.get("tool") == "f6/f6_local3.py" and loc.get("field_json") == f"f6/f6_{pair}_field3.json", "the local record is one of f6_local3")
        _, d3 = FL3.load_ring(pair)
        lohi = (d3["lo"], d3["hi"])
        S0b = FL3.Ev.ball(FL3.qk(c0) * FL3.LE(FL3.Q5(flint.fmpq_poly([0, 1]))))
    else:
        import f6_local as FL
        E, rad, d = FL.load_field(pair)
        from f6_tower import L2, kq
        from f6_field_cubindod import K
        S0 = L2(kq(c0.v[0])) + (rad * L2(kq(c0.v[1])) if len(c0.v) > 1 and c0.v[1] != 0 else L2(0))
        S0 = S0 * L2(K(flint.fmpq_poly([0, 1], d["_xc"])))
        S0b = S0.ball()
    Sb = Fr(far["params"]["Sbar"])
    need(flint.arb(flint.fmpq(Sb.numerator, Sb.denominator)) > S0b, "S̄ > C0·s₀")
    print("consistency of the premises: passed (RHO0 =", loc["rho0"], ", S̄ − C0·s₀ =", (flint.arb(flint.fmpq(Sb.numerator, Sb.denominator)) - S0b).mid().str(5), ")", flush=True)
    env = dict(os.environ, D44_RHO0=loc["rho0"], D44_LPFIX="1")
    if pair in FIELD3:
        up = [py, "-X", "utf8", "f6/f6_field3.py", pair]
        lv = [py, "-X", "utf8", "f6/f6_local3.py", "verify", LOCAL]
    else:
        up = [py, "-X", "utf8", "f6_field2.py", pair, "--ext", EXT[pair]] if EXT[pair] else [py, "-X", "utf8", "f6_field.py", pair]
        lv = [py, "-X", "utf8", "f6_local.py", "verify", LOCAL]
    for cmd in (up,
                lv,
                [py, "-X", "utf8", "d44_far_par.py", "replay", pair, "--name", FAR, "--procs", str(a.procs)]):
        t1 = time.time()
        r = subprocess.run(cmd, cwd=HERE, env=env, capture_output=True, text=True, encoding="utf-8",
                           creationflags=getattr(subprocess, "CREATE_NO_WINDOW", 0))
        tail = (r.stdout or "").strip().splitlines()[-1:] or [""]
        print(" ".join(cmd[2:]), "→ exit code", r.returncode, "|", tail[0], f"({time.time() - t1:.0f} s)", flush=True)
        need(r.returncode == 0, " ".join(cmd[2:]) + "\n" + (r.stderr or "")[-2000:])
    if pair in FIELD3:
        # after redoing the upper bound, check S̄ > C0·s₀ again with the field3 record (and that the interval has not changed)
        d0 = json.load(open(os.path.join(HERE, "f6", f"f6_{pair}_field3.json"), encoding="utf-8"))
        need((d0["lo"], d0["hi"]) == lohi, "the field3 interval is the same before and after the redo")
        FL3.load_ring(pair)
        need(flint.arb(flint.fmpq(Sb.numerator, Sb.denominator)) > FL3.Ev.ball(FL3.qk(c0) * FL3.LE(FL3.Q5(flint.fmpq_poly([0, 1])))), "S̄ > C0·s₀ (after the redo)")
        where = f"the root of f6_{pair}_poly.json that is the only one in the f6_{pair}_field3.json interval [lo, hi]"
    else:
        # after redoing the upper bound, check with field.json that the interval is the same and S̄ > C0·s₀ again (finding 2 of 10.5, finding 1 of 8.7)
        d0 = json.load(open(os.path.join(HERE, "f6", f"f6_{pair}_field.json"), encoding="utf-8"))
        need((d0["lo"], d0["hi"]) == (d["lo"], d["hi"]), "the field interval is the same before and after the redo")
        E2, rad2, d2 = FL.load_field(pair)
        S02 = L2(kq(c0.v[0])) + (rad2 * L2(kq(c0.v[1])) if len(c0.v) > 1 and c0.v[1] != 0 else L2(0))
        S02 = S02 * L2(K(flint.fmpq_poly([0, 1], d2["_xc"])))
        need(flint.arb(flint.fmpq(Sb.numerator, Sb.denominator)) > S02.ball(), "S̄ > C0·s₀ (after the redo)")
        where = f"the root of f6_{pair}_poly.json that is the only one in the f6_{pair}_field.json interval [{d0['lo']}, {d0['hi']}] (not the largest real root)"
    print(f"== chain passed: s* = s₀ ({pair} n=2, {where}), {time.time() - t0:.0f} s", flush=True)


if __name__ == "__main__":
    main()
